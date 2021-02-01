
# Ejercicio GIT :

La solución completa del ejercicio git se encuentra en el siguiente repositorio :
https://github.com/marbellacovino/gitproject
commit 510cfde733f5f00f51a940f15904627f6e1c4efb

Los comandos implementados:

1. Crea un nuevo proyecto e inicializa git
```sh

mkdir gitproject && cd gitproject
git init

```
2. Añade una regla para ignorar los ficheros de tipo .sh
```sh

touch .gitignore
echo "*.sh" >> .gitignore

```
3. Crea dos ficheros vacíos: demo1.txt y demo2.txt. Añade estos ficheros al stage
area.
```sh

touch demo1.txt demo2.txt
git add demo1.txt demo2.txt

```

4. Añade contenido al fichero demo1.txt. A continuación, realiza un commit con el
mensaje “Modified demo1.txt”

```sh

echo "This is my demo1" >> demo1.txt
git add demo1.txt
git commit -m "Modified demo1.txt"

```
5. Añade contenido al fichero demo2. A continuación, realiza un commit con el
mensaje “Modified demo3.txt”

```sh

echo "This is my demo2" >> demo2.txt
git add demo2.txt
git commit -m "Modified demo3.txt"

```

6. Rectifica el commit anterior con el mensaje “Modified demo2.txt”

```sh

git commit --amend -m "Modified demo2.txt"

```

7. Crea una nueva rama “develop” y añade un fichero script.sh que imprima por
pantalla “Git 101”

```sh

git branch develop
git checkout develop
touch script.sh && echo " echo Git 101 " >> script.sh

```

8. Da permisos de ejecución al script

```sh

chmod 700 script.sh
chmod +x script.sh

```

9. Realiza un merge (develop -> master) para integrar los cambios

```sh

git merge master develop

```

10. Sube todos los cambios a tu repositorio remoto

```sh

git checkout master 
git remote add origin https://github.com/marbellacovino/gitproject
git push -u origin master

```

11. Verificación logs 

```sh

git log --oneline > verification.log
git add verification.log
git commit -m "logs"
git push -u origin master 

```