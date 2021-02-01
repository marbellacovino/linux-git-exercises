
# Ejercicios Linux

## Parte I:

• Ordenar las IPs (en orden decreciente)
• Buscar el número total ocurrencias por cada una de las IPs

grep -o "[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" nginx_logs_examples.log | sort -r | uniq -c | awk '{print $2"-> "$1}' > nginx_requests_total.txt



## Parte II:

**script.sh**

```sh

#!/bin/bash
#!/bin/bash
DIR="/backup/marbellacovino/$(date +"%Y")/$(date +"%m")/$(date +"%d")"
TODAY="$(date +%w)"
if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  echo "Installing config files in ${DIR}..."
else
  ###  Control will jump here if $DIR does NOT exists ###
  mkdir -p backup/marbellacovino/$(date +"%Y")/$(date +"%m")/$(date +"%d") && cd $_
  cp ~/nginx_requests_total.txt nginx_requests_total_$(date +"%Y%m%d").txt
  cd ..
  if [ "$TODAY" -eq 0 ]; then
    tar -zcvf nginx_logs_$(date +"%Y%m%d").tar.gz $(date +"%d")
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
