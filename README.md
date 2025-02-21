# SQL-X

Este proyecto contiene scripts SQL para gestionar una base de datos similar a una red social tipo Twitter. La base de datos incluye tablas para usuarios, seguidores, tweets y likes.

---

## Diagrama del Flujo del Proyecto

```mermaid
flowchart TD
  A[Inicio] --> B[Ejecuta script SQL]
  B --> C{¿Datos Insertados?}
  C -- Sí --> D[Genera reportes]
  C -- No --> E[Muestra error]
  D --> F[Fin]
  E --> F
