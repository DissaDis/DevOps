# Darbs ar Git. Majas Darbs

1.	Mapē git_repos noklonēt  https://github.com/hashicorp/terraform projektu
```sh
git clone git@github.com:hashicorp/terraform.git
```
![](img/uzd1.png?auto=format&fit=clip&q=40&w=100)

2.	Pārbaudīt kādas izmaiņas tika veiktas iepriekšējās nedēļas laikā. Atrast vismaz divus veidus kā to izdarīt.
```sh
git log --after=date

git log --before=date
```
![](img/udz2.png?auto=format&fit=clip&q=40&w=100)
![](img/udz21.png?auto=format&fit=clip&q=40&w=100)

3.	Atrast commit kurus veica autors  - “Laura Pacilio”
```sh
git log --author “Laura Pacilio”
```
![](img/udz3.png?auto=format&fit=clip&q=40&w=100)

4.	Atrast vai Laura ir veikusi commit pagājušā gada septembrī?
```sh
git log --author “Laura Pacilio” --after=date --before=date
```
![](img/uzd4.png?auto=format&fit=clip&q=40&w=100)
5.	Vai Laura ir veikusi commit vakar?
```sh
git log --author “Laura Pacilio” --after=date --before=date
```
![](img/uzd5.png?auto=format&fit=clip&q=40&w=100)
# Answer: Nope
6. Rezultatus apkopot MD faila
# Results see before