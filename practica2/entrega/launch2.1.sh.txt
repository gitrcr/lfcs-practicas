mkdir -p ./data
mkdir -p ./work
mkdir -p ./entrega


rm -rf ./work/escenario_21
mkdir -p ./work/escenario_21/src
mkdir -p ./work/escenario_21/src/old
mkdir -p ./work/escenario_21/docs
mkdir -p ./work/escenario_21/tmp
mkdir -p ./work/escenario_21/bin
mkdir -p ./work/escenario_21/docs/"Informe Final"

printf "%s\n%s\n%s\n" "TODO: revisar permisos" "owner=alice" "status=pending" \
  > ./work/escenario_21/docs/README.md

printf "%s\n%s\n%s\n" "token=CAMBIAME" "mode=debug" "path=/var/www/html" \
  > ./work/escenario_21/src/app.conf

dd if=/dev/zero of=./work/escenario_21/tmp/big.bin bs=1M count=12 status=none
touch ./work/escenario_21/src/old/legacy.LOG
touch ./work/escenario_21/src/old/legacy.log
touch ./work/escenario_21/src/old/"informe 2024.txt"
{
  [ -d ./work/escenario_21/bin ] || { echo "no existe"; exit 1; }
  printf "%s\n%s\n" '#!/usr/bin/env bash' 'echo hola' > ./work/escenario_21/bin/hola.sh
} || echo "Error crítico: El directorio bin no se pudo crear correctamente"

chmod 644 ./work/escenario_21/bin/hola.sh

ln -s ./work/escenario_21/src/app.conf ./work/escenario_21/app.conf.link
