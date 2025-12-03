import { QueryClient, QueryFunction } from "@tanstack/react-query";
import { getApiUrl, getAuthToken, setAuthToken, clearAuthToken } from "./config";

async function throwIfResNotOk(res: Response) {
  if (!res.ok) {
    const text = (await res.text()) || res.statusText;
    
    if (res.status === 401) {
      clearAuthToken();
      setTimeout(() => {
        window.location.href = getApiUrl("/");
      }, 100);
    }
    
    throw new Error(`${res.status}: ${text}`);
  }
}

export async function apiRequest(
  method: string,
  url: string,
  data?: unknown | undefined,
): Promise<Response> {
  // Convert relative URLs to absolute if needed
  const fullUrl = url.startsWith('http') ? url : getApiUrl(url);
  
  const headers: HeadersInit = data ? { "Content-Type": "application/json" } : {};
  
  // Add JWT token to Authorization header if available
  const token = getAuthToken();
  if (token) {
    headers['Authorization'] = `Bearer ${token}`;
  }
  
  const res = await fetch(fullUrl, {
    method,
    headers,
    body: data ? JSON.stringify(data) : undefined,
  });

  await throwIfResNotOk(res);
  return res;
}

type UnauthorizedBehavior = "returnNull" | "throw";
export const getQueryFn: <T>(options: {
  on401: UnauthorizedBehavior;
}) => QueryFunction<T> =
  ({ on401: unauthorizedBehavior }) =>
  async ({ queryKey }) => {
    // Convert queryKey (array of path segments) to full URL
    const path = (queryKey as Array<string | number>).join("/");
    const url = getApiUrl(path as string);
    
    const headers: HeadersInit = {};
    
    // Add JWT token to Authorization header if available
    const token = getAuthToken();
    if (token) {
      headers['Authorization'] = `Bearer ${token}`;
    }
    
    const res = await fetch(url, {
      headers,
    });

    if (unauthorizedBehavior === "returnNull" && res.status === 401) {
      clearAuthToken();
      return null;
    }

    await throwIfResNotOk(res);
    return await res.json();
  };

export const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      queryFn: getQueryFn({ on401: "returnNull" }),
      refetchInterval: false,
      refetchOnWindowFocus: false,
      staleTime: Infinity,
      retry: false,
    },
    mutations: {
      retry: false,
    },
  },
});
