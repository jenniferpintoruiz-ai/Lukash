# Guía Operativa para Agentes de IA (AGENTS.md)
**Proyecto:** Prototipo Web Multi-Pantalla - Aplicación de Educación Financiera / Inversión Activa  
**Herramienta Target:** Stitch / Agentes Generadores de Código  
**Versión:** 1.0  
**Fecha:** Julio 2026  

---

## 1. Misión y Rol del Agente

Actúas como un **Desarrollador Frontend Senior** especializado en construcción de prototipos web responsivos, código semántico y modular. 

Tu objetivo es generar cada pantalla como un **archivo HTML independiente** que contenga de forma embebida/autosuficiente sus estilos CSS (`<style>`) y scripts JS (`<script>`), facilitando la posterior unificación modular del proyecto.

---

## 2. Reglas de Arquitectura y Estructura de Código

1. **Pantallas Independientes (Self-Contained Files):**
   * Cada solicitud de pantalla debe resultar en un archivo `.html` funcional por sí solo (ej. `index.html`, `modo-ahorro.html`, `rindiendo-money.html`, `cuentas-claras.html`, `cero-enredor.html`).
   * No referenciar archivos `.css` o `.js` externos locales; incluir todo dentro de etiquetas `<style>` y `<script>` en la misma página para pruebas e integración ágil.

2. **Uso Obligatorio de Design Tokens (`DESIGN.md`):**
   * Todo bloque CSS en `<style>` **debe** declarar y reutilizar las variables CSS de `DESIGN.md`:
     ```css
     :root {
       --color-primary-fuchsia: #EE4599;
       --color-primary-pink: #DE7A8F;
       --color-primary-dark-blue: #180F43;
       --color-primary-yellow: #E7C11F;
       --color-primary-white: #EEE8E0;
       --color-primary-black: #212121;
       --color-secondary-blue: #01504B;
       --color-green-lemon: #91DA26;
       --color-green-mid: #8AC346;
       --color-green-light: #95EC2F;
       --bg-gradient-main: linear-gradient(135deg, #180F43 0%, #DE7A8F 100%);
       --font-heading: 'Fredoka', 'Bubblegum Sans', sans-serif;
       --font-body: 'Roboto', sans-serif;
     }
     ```
   * Nunca usar colores en código duro (`#HEX`) dentro de los componentes si existe una variable definida.

3. **Tipografía e Iconografía Externa:**
   * Incluir fuentes desde **Google Fonts** mediante CDN en el `<head>`: `Roboto` y alternativas display (`Fredoka` / `Bubblegum Sans` para simular *Eating Pasta*).
   * Para iconos vectoriales, utilizar SVG en línea o la librería **Lucide Icons** vía CDN.

4. **Calidad de Código y Estándares:**
   * HTML5 estrictamente semántico (`<header>`, `<nav>`, `<main>`, `<section>`, `<article>`, `<footer>`).
   * Código **limpio, legible y completamente comentado** indicando la función de cada módulo o script.

---

## 3. Especificaciones de Componentes e Interacción

### 3.1 Botones Responsivos
* **Adaptabilidad:** No usar anchos fijos en px sin restricciones. Emplear `max-width`, `min-height` y `padding` proporcional para mantener las proporciones definidas en `DESIGN.md`.
* **Feedback Interactivo:**
  ```css
  .btn {
    transition: transform 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
  }
  .btn:active, .btn.is-selected {
    transform: scale(0.96); /* Feedback visual táctil de ~10px */
  }
  ```

### 3.2 Persistencia de Estado Local (`localStorage`)
* Cada pantalla debe ser capaz de guardar y recuperar datos clave del usuario mediante `localStorage` (ej. saldo acumulado, categoría seleccionada, respuestas de trivias o progreso) para mantener la consistencia entre navegaciones.

---

## 4. Mapa de Pantallas a Desarrollar

| Pantalla | Archivo | Descripción / Componentes Clave |
| :--- | :--- | :--- |
| **1. Dashboard / Main** | `index.html` | Selector de categorías en amarillo (`#E7C11F`), resumen de balance e ilustraciones 3D. |
| **2. Modo Ahorro** | `modo-ahorro.html` | Opciones de ahorro (ancho completo), guardar progreso y guía personalizada. |
| **3. Rindiendo la Money** | `rindiendo-money.html` | Simulador interactivo de inversión activa con acciones (`CONTINUAR`, `RESOLVER`, `VOLVER`). |
| **4. Cuentas Claras** | `cuentas-claras.html` | Vistas de balance, desglose transparente de capital e indicadores. |
| **5. Cero Enredor** | `cero-enredor.html` | Trivias y toma de decisiones financieras con cards de opción múltiple e interacciones. |

---

## 5. Instrucción Final para la IA en Stitch

Al generar el código para cualquier pantalla, el agente **debe cumplir este flujo**:
1. Leer las variables de `DESIGN.md`.
2. Generar un documento HTML5 completo (`<!DOCTYPE html>`).
3. Insertar los estilos CSS responsivos con CSS Variables y `clamp()` en `<style>`.
4. Construir el marcado semántico con placeholders para los recursos 3D/iconos.
5. Agregar el script de interacción y `localStorage` dentro de `<script>`.
