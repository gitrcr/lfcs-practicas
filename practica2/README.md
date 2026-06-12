# Práctica 2 — Comandos Básicos

## Servidor / entorno utilizado
- Método: XPC-ng 8.3 LTS
- SO: Debian 6.12.86-1 "Trixie"
- Hostname: minion2

## Comandos / herramientas nuevas aprendidas
- `find` - búsqueda de ficheros y carpetas en base a patrones `-name -type -iname -size`
- `umask` - definir permisos por defecto de nuevos ficheros o carpetas, se mantiene durante la sesión.
- `which` - localiza ejecutables existentes en el `PATH`
- `cut -d" " /f1` - utilizado en este caso para separar columnas por espacios y devolver la primera.
- `uniq c` - contabiliza los valores únicos.
- `sort -nr`- ordenar números, de mayor a menor, evita el error 1 10 2
- `awk '{print $2}'`- devuelve el valor de la columna seleccionada $2, utilizado para limpiar el count de uniq del primer ejercicio.
- `tee`- escribe el output final directamente en fichero, usado con `>>` para agregar lineas.
- `head -n 15` -  devuelve los 15 primeros valores de una lista.
- `tar -czvf y gzip -l` - creación de ficheros comprimidos y revisión de contenido.
- `getent group` - comprobar base de datos de grupos, permite otras bbdd
- `chmod g+s` = uso de sgid, sticky.



## Dificultades encontradas
- `modificación ruta absulta script inicial`: Sustituir ruta por directorio actual. Script `launch2.sh`
- `uso de los comandos del módulo`: Repasar el contenido del curso para definir correctamente los flags de find, umask, etc
- `configuraciónes avanzadas`: Búsqueda de información para poder pasar dos strings al comando `grep` = `grep -E "string1|string2"`


## Tiempo dedicado
3: horas

## Evidencia
Los ficheros generados están en la carpeta `entrega/`

```bash
cut -d" " -f1 data/access.log | sort | uniq -c | wc -l | tee entrega/23_informe.txt

cut -d" " -f1 data/access.log | sort | uniq -c | sort -nr | head -n 15 | awk '{print $2}' | tee entrega/23_informe.txt

cat data/access.log | grep " 404 " | awk '{print $1}' | sort | uniq -c | sort -nr | head -n 10 | awk '{print $2}' | tee >> entrega/23_informe.txt

cat data/access.log | grep "404" > /tmp/23_errorres.log
tar -czvf entrega/23_errores.log.gzip /tmp/23_errorres.log
gzip -l entrega/23_errores.log.gzip

find /var/log -type f -name "*.log" 2> /dev/null

pgrep "curl" && echo "" && pgrep -a curl  && echo "" && ps -aux | grep "curl"

```