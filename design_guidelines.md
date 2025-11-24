# Diseño para Zendala - Sistema de Control de Accesos

## Enfoque de Diseño

**Sistema Base:** Material Design adaptado para aplicaciones móviles de seguridad
**Justificación:** Aplicación utilitaria enfocada en eficiencia operativa, claridad informativa y uso móvil en caseta de vigilancia. Requiere patrones establecidos para navegación rápida y visualización clara de datos.

## Tipografía

**Familias:**
- Principal: Inter (Google Fonts) - títulos, encabezados, navegación
- Datos: JetBrains Mono (Google Fonts) - códigos, timestamps, datos técnicos

**Jerarquía:**
- H1 (Pantallas principales): text-3xl font-bold
- H2 (Secciones): text-xl font-semibold
- Body (Contenido): text-base
- Labels (Formularios): text-sm font-medium
- Datos técnicos: text-sm font-mono
- Small (Metadatos): text-xs text-gray-600

## Sistema de Espaciado

**Unidades Tailwind:** 2, 4, 6, 8, 12, 16
- Padding de componentes: p-4
- Separación entre elementos: space-y-4 o gap-4
- Márgenes de sección: my-8
- Contenedores: max-w-4xl mx-auto px-4

## Arquitectura de Componentes

### A. Autenticación
- Pantalla de login centrada con selector de tipo de usuario (3 botones grandes con iconos)
- Formulario simple: usuario/email + contraseña
- Logo de Zendala en la parte superior

### B. Navegación
- Barra superior fija con título de sección actual y botón de menú/perfil
- Menú lateral deslizable (drawer) para navegación entre funciones
- Indicador visual del rol activo (Vecino/Guardia/Admin)

### C. Panel de Vecino
**Generación de QR:**
- Card principal con formulario de 3 campos:
  - Nombre del visitante (text input grande)
  - Tipo (select: Visita/Proveedor/Prestador de Servicios)
  - Descripción opcional (textarea)
- Botón de acción primario "Generar Código QR"
- Al generar: Modal de pantalla completa mostrando QR grande (ocupando 60% del viewport)
- Debajo del QR: nombre, tipo, fecha/hora de creación
- Opciones: Descargar, Compartir (WhatsApp/Email), Cerrar

**Mis Códigos:**
- Lista de cards con códigos generados
- Cada card: mini-QR (thumbnail), nombre visitante, tipo, estado (Activo/Usado/Expirado), fecha

### D. Panel de Guardia
**Escáner QR:**
- Vista de cámara ocupando 70% superior de la pantalla
- Overlay con marco guía para centrar el QR
- Zona inferior con botón "Escanear" o activación automática
- Post-escaneo: Card de confirmación grande mostrando:
  - Foto/avatar del visitante (placeholder si no hay)
  - Nombre del visitante (text-2xl)
  - Tipo en badge destacado (proveedor/visita/servicio)
  - Vecino que autorizó
  - Hora de generación
  - Botones: "Permitir Acceso" (grande, primario) / "Denegar" (secundario)

### E. Panel de Administrador
**Dashboard:**
- Grid de estadísticas (2 columnas en móvil, 4 en desktop):
  - Accesos hoy
  - Códigos activos
  - Códigos usados (semana)
  - Proveedores frecuentes

**Historial de Accesos:**
- Filtros superiores en card colapsable:
  - Rango de fechas (date pickers)
  - Tipo de visitante (multi-select)
  - Buscar por vecino o visitante
- Tabla responsive (cards en móvil):
  - Fecha/hora | Visitante | Tipo | Vecino | Guardia que autorizó
- Paginación al final

**Gestión de Códigos:**
- Tabs para "Generar QR" y "Escanear QR" (mismas vistas que vecino/guardia)

### F. Componentes Comunes
**Cards:**
- Bordes sutiles (border border-gray-200)
- Sombra ligera (shadow-sm)
- Padding consistente (p-6)
- Bordes redondeados (rounded-lg)

**Botones:**
- Primario: tamaño generoso (py-3 px-6), texto grande (text-lg)
- Secundario: outline con hover
- Iconos de Heroicons para acciones comunes

**Badges de Estado:**
- Activo: verde suave
- Usado: gris
- Expirado: rojo suave
- Padding: px-3 py-1, rounded-full, text-xs font-semibold

**Inputs:**
- Altura consistente (h-12)
- Bordes definidos con focus state claro
- Labels siempre visibles encima del campo
- Placeholders descriptivos

## Consideraciones Móviles

- Diseño mobile-first (guardias usan tablets/phones)
- Botones táctiles grandes (mínimo h-12)
- Espaciado generoso para uso con dedos
- Alto contraste para legibilidad en exteriores
- Escáner QR optimizado para cámara móvil
- Orientación portrait prioritaria

## Imágenes

**Logo Zendala:** Colocar en header de login y navegación (max altura 40px)
**Sin hero image** - Es una aplicación funcional, no marketing
**Placeholders:** Avatares circulares para visitantes sin foto (usar iniciales)