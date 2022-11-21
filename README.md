# MTH8207_FenicsX

Ce répertoire contient les instructions pour l'installation et l'utilisation du code FenicsX ainsi que les fichiers maillages nécessaire à la présentation.

Les sections suivantes se veulent un résumé de l'installation décrite sur la [page GitHub de Fenics](https://github.com/FEniCS/dolfinx#installation) et sur la [page de tutoriels de FenicsX](https://jorgensd.github.io/dolfinx-tutorial/fem.html#obtaining-the-software). 

## Installation sous Windows 10 et 11

L'installation sous Windows 10 et 11 est quelques peu compliquée, puisqu'il faut installer [Docker](https://www.docker.com/). Des instructions détaillée pour l'installations de Docker sous Windows 10 et 11 sont disponibles à cette addresse url: [https://docs.docker.com/desktop/install/windows-install/](https://docs.docker.com/desktop/install/windows-install/). Il faut s'assurer de suivre ces instructions et s'assurer que le Linux Subsytem *wsl 2* est bien opérationnel avant de procéder à l'installation de Docker.

Lorsque Docker est installé, lancez Docker et entrez la commande suivante sur PowerShell

```powershell
docker run --init -ti -p 8888:8888 dolfinx/lab:stable	
```

Cette commande permet d'utiliser le container, mais son premier appel permettra d'installer le container. Quittez le terminal, puis suivez les instructions décrites plus [bas](#utilisation-sous-windows-10-et-11) pour utiliser FenicsX.

## Installation sous MacOS

Afin d'installer le code FenicsX, il faut soit [Anacaonda](https://www.anaconda.com/) ou [Miniconda](https://docs.conda.io/en/latest/miniconda.html) (Anaconda est toutefois recommandé). Lorsqu'un de ces programmes est installé, il faut exécuter les commandes suivantes dans un terminal

```
conda create -n fenicsx-env
conda activate fenicsx-env
conda install -c conda-forge fenics-dolfinx mpich pyvista jupyterlab  
```

Les deux premières commandes sont identiques à celles affichées sur le [GitHub de Fenics](https://github.com/FEniCS/dolfinx#conda). Le package jupyterlab a toutefois été ajouté sur la dernière commande.

## Utilisation sous Windows 10 et 11


Sous Windows 10 et 11, il faut utiliser FenicsX via le *container Docker* `dolfinx/lab:stable`. Pour appeler ce container, il faut entrer la commande suivante sur PowerShell:

```powershell
cd yourpath
docker run --init -ti -p 8888:8888 -v ${pwd}:/home/MTH8207_FenicsX -w /home/MTH8207_FenicsX dolfinx/lab:stable
```

où *yourpath* est l'emplacement où les fichiers seront enregistrés. La commande qui permet la communication entre Windows et le container est `-v ${pwd}:/home/MTH8207_FenicsX`, spécifiant que le *working directory* communique avec l'emplacement `/home/MTH8207_FenicsX` du container. La commande `-w /home/MTH8207_FenicsX` spécifie que le *working directory* du container est le même que celui qui communique avec Windows.

Il suffit ensuite de copier le lien url affiché sur PowerShell dans un navigateur web

```powershell
    Or copy and paste one of these URLs:
        http://localhost:8888/lab?token=0776d1bc6e587bebe4c9e16080bdebba5f995e4df7ec18a5
     or http://127.0.0.1:8888/lab?token=0776d1bc6e587bebe4c9e16080bdebba5f995e4df7ec18a5
```

Votre lien url ne sera pas le même, il faut prendre celui affiché sur votre PowerShell.


## Utilisation sous MacOS

Afin d'utilier FenicsX sous MacOS, il faut s'assurer d'appeler JupyterLab dans l'environnement précedemment créé.



