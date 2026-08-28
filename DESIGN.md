# Especificación de Diseño de Interfaz (DESIGN.md)
**Proyecto:** Prototipo Web Responsivo - Aplicación de Educación Financiera / Inversión Activa  
**Versión:** 2.0  
**Fecha:** Julio 2026  

---

## 1. Visión General del Proyecto
Este documento establece las directrices de diseño UI/UX y las especificaciones técnicas para el prototipo HTML5/CSS3/JS responsivo de una aplicación de educación financiera e inversión activa interactiva. 

La arquitectura visual utiliza una estética moderna, lúdica y dinámica basada en gradientes nocturnos, tipografía display impactante, ilustraciones 3D y componentes adaptables en una experiencia **Single Page Application (SPA)**.

---

## 2. Paleta de Colores y Design Tokens

### 2.1 Colores Primarios
* **Fucsia (`--color-primary-fuchsia`):** `#EE4599`
* **Rosado (`--color-primary-pink`):** `#DE7A8F`
* **Azul Oscuro / Base (`--color-primary-dark-blue`):** `#180F43`
* **Amarillo (`--color-primary-yellow`):** `#E7C11F` *(Color predominante en menús y cajas destacadas)*
* **Blanco (`--color-primary-white`):** `#EEE8E0`
* **Negro / Base Oscura (`--color-primary-black`):** `#212121`

### 2.2 Colores Secundarios y Verdes
* **Azul Secundario (`--color-secondary-blue`):** `#01504B`
* **Azul Claro (`--color-secondary-light-blue`):** `#212121` / Accent Blue
* **Verde Oscuro (`--color-secondary-dark-green`):** `#01504B`
* **Verde Limón (`--color-green-lemon`):** `#91DA26`
* **Verde Medio (`--color-green-mid`):** `#8AC346`
* **Verde Claro / Muted (`--color-green-light`):** `#95EC2F`

### 2.3 Degradados (Gradients)
* **Degradado Principal de Fondo (Background Gradient):**  
  `linear-gradient(135deg, #180F43 0%, #DE7A8F 100%)`
* **Degradado Cálido (Warm Accent Gradient):**  
  `linear-gradient(90deg, #EE4599 0%, #E7C11F 100%)`

---

## 3. Tipografía y Jerarquía Visual

### 3.1 Fuentes Definidas
* **Encabezados / Títulos:** `Eating Pasta`, Display Sans (Fallback: `'Fredoka'`, `'Bubblegum Sans'`, cursive, sans-serif)
* **Cuerpo de Texto / UI Elements:** `Roboto`, sans-serif

### 3.2 Escala Tipográfica Responsiva (CSS Clamp)
* **H1 (Título Principal):** `clamp(2rem, 5vw, 3.5rem)` — Font: Eating Pasta
* **H2 (Títulos de Sección / Categorías):** `clamp(1.5rem, 3.5vw, 2.5rem)` — Font: Eating Pasta
* **H3 (Subtítulos de Componente):** `clamp(1.2rem, 2.5vw, 1.8rem)` — Font: Eating Pasta
* **Body / Parágrafos:** `1rem` (16px) — Line-height: `1.5` — Font: Roboto
* **Labels / Captions:** `0.875rem` (14px) — Font: Roboto Bold

---

## 4. Sistema de Componentes: Botones Interactivos

Todos los botones son **100% responsivos**, reemplazando las dimensiones fijas en px por `max-width`, `min-height` y `padding` proporcional para garantizar adaptabilidad móvil y preservar la proporción visual de las imágenes de referencia.

### 4.1 Comportamiento y Feedback Interactivo
* **Estado Normal (`:default`):** Border-radius de `16px`, elevación sutil de sombra y tipografía centrada.
* **Transición de Selección / Presionado (`:active` / `.is-selected`):**  
  Al interactuar o seleccionarse, el botón se contrae/reduce suavemente (~10px en sus dimensiones / `transform: scale(0.96)`), brindando un feedback táctil y visual inmediato.

### 4.2 Especificaciones de Botones

| Tipo / Variación | Proporción Ref. | Max-Width | Min-Height | Color de Fondo | Uso Principal |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Hero / Ancho Total** | 800px × 120px | `100%` (max 800px) | `80px - 120px` | Pink / Green (`#95EC2F` / `#DE7A8F`) | Redirección de usuario, opciones principales |
| **Opción Seleccionada** | 600px × 90px | `100%` (max 600px) | `70px - 90px` | Soft Pink (`#DE7A8F`) | Estado activo de opciones principales |
| **Opción Múltiple / Cards** | 400px × 120px | `100%` (max 400px) | `80px - 100px` | Fucsia (`#EE4599`) | Alternativas de respuesta en "Cero Enredor" |
| **Acción / Continuar** | 300px × 100px | `100%` (max 300px) | `60px - 80px` | Fucsia / Verde (`#EE4599` / `#8AC346`) | Continuar, Resolver, Volver, Girar |
| **Mini Actividad / Tag** | 200px × 80px | `100%` (max 200px) | `50px - 60px` | Verde Claro (`#95EC2F`) | Metas, Pistas, chips interactivos |

---

## 5. Arquitectura de Navegación SPA (Single Page Application)

La interfaz opera como un panel unificado sin recarga de página. La información y esquemas cromáticos cambian dinámicamente según la categoría seleccionada desde el menú principal (destacado en amarillo `#E7C11F`).

### 5.1 Categorías y Vistas
1. **Modo Ahorro:** 
   * Enfoque en metas visuales e instrumentos tradicionales de ahorro.
   * Componentes: Botones de ancho completo para opciones de ahorro, flujo de guardar progreso y guía personalizada.
2. **Rindiendo la Money:** 
   * Enfoque en simulaciones de inversión activa y multiplicación de capital.
   * Componentes: Botones en verde `#8AC346` con acciones como `CONTINUAR`, `RESOLVER`, `VOLVER`.
3. **Cuentas Claras:** 
   * Enfoque en balance, transparencia e indicadores de capital.
   * Componentes: Flujo directo con botón `CONTINUAR` fucsia.
4. **Cero Enredor:** 
   * Enfoque en resolución de trivias, preguntas rápidas y toma de decisiones.
   * Componentes: Botones interactivos de opción múltiple (`#EE4599`) e interacción de girar/continuar.

---

## 6. Recursos Visuales e Iconografía

### 6.1 Iconografía Vectorial
* **Perfil de Usuario (`user-circle`):** Configuración de cuenta y perfil.
* **Notificaciones (`bell`):** Alertas y recordatorios.
* **Mascota / Cerdito (`piggy-head`):** Identidad del simulador.

### 6.2 Ilustraciones 3D
* **Alcancía Cerdito 3D:** Representación gráfica de ahorro/inversión inicial.
* **Tarjetas de Crédito / Débito 3D:** Instrumentos financieros activos.
* **Billetera + Libro 3D:** Educación e historial de balance.
* **Mano con Moneda 3D:** Retorno de inversión y flujo de caja.

---

## 7. Layout Responsivo y Breakpoints

* **Mobile (`< 576px`):** 
  * Disposición en 1 sola columna.
  * Botones expandidos al 100% del contenedor con `padding: 12px 20px`.
  * Menú de categorías navegable/scrollable horizontalmente o barra fija.
* **Tablet (`576px - 992px`):** 
  * Grids de 2 columnas para opciones múltiples ("Cero Enredor").
  * Escala media de botones e ilustraciones.
* **Desktop (`> 992px`):** 
  * Layout completo de panel con ilustraciones 3D laterales y contenedor central de máximo `1200px`.
