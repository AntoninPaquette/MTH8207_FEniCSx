# MTH8207_FEniCSx

Ce répertoire contient les instructions pour l'installation et l'utilisation du code FEniCSx ainsi que les fichiers maillages nécessaire à la présentation.

Les sections suivantes se veulent un résumé de l'installation décrite sur la [page GitHub de FEniCSx](https://github.com/FEniCS/dolfinx#installation) et sur la [page de tutoriels de FenicsX](https://jorgensd.github.io/dolfinx-tutorial/fem.html#obtaining-the-software). 

## Installation sous Windows 10 et 11

L'installation sous Windows 10 et 11 est quelques peu compliquée, puisqu'il faut installer [Docker](https://www.docker.com/). Des instructions détaillée pour l'installations de Docker sous Windows 10 et 11 sont disponibles à cette addresse URL: [https://docs.docker.com/desktop/install/windows-install/](https://docs.docker.com/desktop/install/windows-install/). Il faut s'assurer de suivre ces instructions et s'assurer que le Linux Subsytem *wsl 2* est bien opérationnel avant de procéder à l'installation de Docker.

Lorsque Docker est installé, lancez Docker et entrez la commande suivante sur PowerShell

```powershell
docker run --init -ti -p 8888:8888 dolfinx/lab:stable	
```

Cette commande permet d'utiliser le container, mais son premier appel permettra aussi d'installer le container. Quittez le terminal, puis suivez les instructions décrites plus [bas](#utilisation-sous-windows-10-et-11) pour utiliser FEniCSx.

## Installation sous MacOS

Afin d'installer le code FEniCSx, il faut soit [Anacaonda](https://www.anaconda.com/) ou soit [Miniconda](https://docs.conda.io/en/latest/miniconda.html) (Anaconda est toutefois recommandé). Lorsqu'un de ces programmes est installé, il faut exécuter les commandes suivantes dans un terminal

```
conda create -n fenicsx-env
conda activate fenicsx-env
conda install -c conda-forge fenics-dolfinx mpich pyvista jupyterlab gmsh 
```

Les deux premières commandes sont identiques à celles affichées sur le [GitHub de FEniCSx](https://github.com/FEniCS/dolfinx#conda). Les packages `Jupyterlab` et `gmsh` ont toutefois été ajoutés sur la dernière commande.

## Utilisation sous Windows 10 et 11


Sous Windows 10 et 11, il faut utiliser FEniCSx via le *container Docker* `dolfinx/lab:stable`. Pour appeler ce container, il faut tout d'abord lancer l'application `Docker`. Ensuite, il faut entrer la commande suivante sur PowerShell:

```powershell
cd yourpath
docker run --init -ti -p 8888:8888 -v ${pwd}:/home/MTH8207_FenicsX -w /home/MTH8207_FenicsX dolfinx/lab:stable
```

où *yourpath* est l'emplacement où les fichiers seront enregistrés. La commande qui permet la communication entre Windows et le container est `-v ${pwd}:/home/MTH8207_FenicsX`, spécifiant que le *working directory* sous Windows communique avec l'emplacement `/home/MTH8207_FenicsX` du container. La commande `-w /home/MTH8207_FenicsX` spécifie que le *working directory* du container est le même que celui qui communique avec Windows.

Il suffit ensuite de copier le lien url affiché sur PowerShell dans un navigateur web

```powershell
    Or copy and paste one of these URLs:
        http://localhost:8888/lab?token=0776d1bc6e587bebe4c9e16080bdebba5f995e4df7ec18a5
     or http://127.0.0.1:8888/lab?token=0776d1bc6e587bebe4c9e16080bdebba5f995e4df7ec18a5
```

Votre lien URL ne sera pas le même, il faut prendre celui affiché sur votre PowerShell. Il faut ensuite sélectionner un notebook Python 3 (ipykernel).


## Utilisation sous MacOS

Afin d'utilier FEniCSx sous MacOS, il faut s'assurer d'appeler JupyterLab dans l'environnement `fenicsx-env` (celui précedemment créé). Avec l'application Anaconda, vous pouvez sélectionner l'environnement, puis lancer Jupyter Notebook ou Jupyter Lab. On peut aussi lancer JupyterLab sous l'environnement `fenicsx-env` ainsi:

```
conda activate fenicsx-env
jupyter lab
```

Il faut ensuite sélectionner un notebook Python 3 (ipykernel).

## Visualisation avec Paraview

Afin de visualiser les résultats exporter sous format `.xdmf`, il faut ouvrir ce fichier avec [Paraview](https://www.paraview.org/). Ensuite, il faut sélectionner le `reader` `Xdmf3ReaderT`. Si plusieurs données sont représentées dans le même fichier `xdmf`, il faut les séparer à l'aide du filtre `Extract Block`. 

## Documentation de FEniCSx

La documentation de FEniCSx se retrouve sur le site [https://docs.fenicsproject.org/](https://docs.fenicsproject.org/), plus précisément sous le module [DOLFINx](https://docs.fenicsproject.org/dolfinx/v0.7.2/python/). Plusieurs exemples sont illustrés et l'API y est décrit. Plusieurs tutoriels se retrouvent sur le site suivant [https://jsdokken.com/dolfinx-tutorial/](https://jsdokken.com/dolfinx-tutorial/).