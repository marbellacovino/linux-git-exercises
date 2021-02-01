
# Ejercicios Linux

## Parte I:

• Ordenar las IPs (en orden decreciente)
• Buscar el número total ocurrencias por cada una de las IPs

grep -o "[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" nginx_logs_examples.log | sort -r | uniq -c | awk '{print $2"-> "$1}' > nginx_requests_total.txt



## Parte II:

**script.sh**

```sh

#!/bin/bash
DIR="backup/marbellacovino/$(date +"%Y")/$(date +"%m")/$(date +"%d")"
TODAY="$(date +%w)"

if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  echo " ${DIR}..."
else
  ###  Control will jump here if $DIR does NOT exists ###
  mkdir -p "$DIR"
  cp ~/nginx_requests_total.txt "$DIR"/nginx_requests_total_$(date +"%Y%m%d").txt
  if [ "$TODAY" -eq 1 ]; then
   cd backup/marbellacovino/$(date +"%Y")/$(date +"%m")
   find . -name '*.txt' -mtime -6 | tar -zcvf nginx_logs_$(date +"%Y%m%d").tar.gz -T -
  fi
fi

```
Para dar permisos de ejecución al script:

```console

chmod 700 script.sh
chmod +x script.sh

```
  
## Parte III:

Crontab con los siguientes requerimientos:
• El script se deberá ejecutar exclusivamente de lunes a domingo
• La hora de ejecución será 23.59 hrs
• Todos los meses del año
 
```console

crontab -e

```
**crontab config**
```sh

59 23 * * * cd ~/Users/marbellacovino | ./script.sh

```
