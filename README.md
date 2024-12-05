# learn-getdbt

Este repositorio contiene ejemplos, ejercicios y configuraciones para aprender y practicar con **dbt** (Data Build Tool), una herramienta moderna para transformar y analizar datos en entornos de datos como BigQuery, Snowflake, entre otros.

## 🚀 Objetivo

El objetivo principal de este proyecto es servir como guía práctica para aquellos que desean familiarizarse con **dbt**, sus características principales y cómo integrarlo con diferentes plataformas de bases de datos.

---

## 📋 Contenido

El repositorio está organizado de la siguiente manera:

- **`analyses/`**: Contiene análisis y reportes generados a partir de los datos transformados.
- **`models/`**: Contiene ejemplos de modelos dbt para practicar transformaciones de datos.
- **`macros/`**: Incluye macros reutilizables para tareas comunes.
- **`seeds/`**: Datos estáticos de ejemplo que pueden cargarse en el data warehouse.
- **`snapshots/`**: Ejemplos para trabajar con snapshots de dbt.
- **`tests/`**: Contiene pruebas para validar la integridad y exactitud de los datos transformados.
- **`dbt_project.yml`**: Configuración principal del proyecto dbt.

---

## 🛠️ Requisitos

Antes de comenzar, asegúrate de cumplir con los siguientes requisitos:

1. **Python**: Versión 3.7 o superior.
2. **dbt**: Instalarlo con el comando:
   ```bash
   pip install dbt-core
   ```
   En función de la versión de Python, elegir una versión adecuada de dbt.

3. **Adaptador dbt**: Dependiendo del sistema de datos (ejemplo para BigQuery):
   ```bash
   pip install dbt-bigquery
   ```
4. **Cuenta y permisos**:
   - Acceso a una plataforma de datos como BigQuery.
   - Archivo de claves JSON de una cuenta de servicio para BigQuery (opcional).
   - También se puede conectar a BigQuery con oAuth.

---

## ⚙️ Configuración

1. **Clonar el repositorio**:
   ```bash
   git clone https://github.com/pabloreina97/learn-getdbt.git
   cd learn-getdbt
   ```

2. **Configurar `profiles.yml`**:
   - El archivo `profiles.yml` está ubicado en `~/.dbt/`.
   - Configúralo según el entorno de datos que estés utilizando. Ejemplo para BigQuery:
     ```yaml
     learn_getdbt:
       target: dev
       outputs:
         dev:
           type: bigquery
           method: service-account
           project: tu-proyecto
           dataset: tu-dataset
           keyfile: /ruta/a/archivo.json
           threads: 4
     ```

3. **Probar la conexión**:
   ```bash
   dbt debug
   ```

---

## 💻 Comandos básicos de dbt

- **Ejecutar modelos**:
  ```bash
  dbt run
  ```

- **Probar datos**:
  ```bash
  dbt test
  ```

- **Generar documentación**:
  ```bash
  dbt docs generate
  dbt docs serve
  ```

- **Compilar SQL**:
  ```bash
  dbt compile
  ```

---


## 📬 Contacto

Si tienes dudas, preguntas o simplemente quieres compartir tus aprendizajes, no dudes en contactar:

- **Autor**: Pablo Reina Gálvez
- **LinkedIn**: [Pablo Reina](https://www.linkedin.com/in/preina)

---

¿Necesitas alguna personalización o añadir algo más? 😊