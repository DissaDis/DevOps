*Pirms pildām uzdevumus atcerēsimies ka atšķiras Git un GitHub.*

**Uzdevums 1: Darbs ar zariem**
1.	Izveidojiet jaunu Git repozitoriju.
2.  Pievienojiet  failus. Veiciet pirmo commit.
2.	Izveidojiet jaunu zaru ar nosaukumu "feature/uzdevums1".
3.	Veiciet izmaiņas failos šajā jaunajā zarā.
4.	Atgriezieties uz galveno zaru ("main/master") izmantojot "git checkout".
5.	Apvienojiet "feature/uzdevums1" zara izmaiņas uz galveno zaru.

* Kas būs ja pēc repozitorija izveidošanas, uzreiz izveido jaunu zaru? 


**Uzdevums: Izveido kalkulatora Git repozitoriju ar funkcijām**

1. Izveido jaunu **GitHub** repozitoriju "kalkulatora-repo".

2. Klone repozitoriju uz datora:
   ```
   git clone <repo-URL>
   ```

3. Izveido jaunu zaru ar nosaukumu "addition":
   ```
   git checkout -b addition
   ```

4. Izveido Python failu ar nosaukumu "addition.py" un iekļauj tajā funkciju, kas saskaita divus skaitļus. Piemēram:
   ```python
   def add(a, b):
       return a + b
   ```

5. Saglabā izmaiņas un izveido kommitu:
   ```
   git add addition.py
   git commit -m "Pievienota saskaitīšanas funkcija"
   ```

6. Pārslēdzies atpakaļ uz galveno zaru:
   ```
   git checkout main
   ```

7. Izveido jaunu zaru ar nosaukumu "subtraction":
   ```
   git checkout -b subtraction
   ```

8. Izveido Python failu ar nosaukumu "subtraction.py" un iekļauj tajā funkciju, kas atņem vienu skaitli no otra. Piemēram:
   ```python
   def subtract(a, b):
       return a - b
   ```

9. Saglabā izmaiņas un izveido kommitu:
   ```
   git add subtraction.py
   git commit -m "Pievienota atņemšanas funkcija"
   ```

10. Pārslēdzies atpakaļ uz galveno zaru:
    ```
    git checkout main
    ```

11. Izveido jaunu zaru ar nosaukumu "multiplication":
    ```
    git checkout -b multiplication
    ```

12. Izveido Python failu ar nosaukumu "multiplication.py" un iekļauj tajā funkciju, kas reizina divus skaitļus. Piemēram:
    ```python
    def multiply(a, b):
        return a * b
    ```

13. Saglabā izmaiņas un izveido kommitu:
    ```
    git add multiplication.py
    git commit -m "Pievienota reizināšanas funkcija"
    ```

14. Pārslēdzies atpakaļ uz galveno zaru:
    ```
    git checkout main
    ```

15. Pabeidz darbu, saglabā izmaiņas un veic pēdējo kommitu:
    ```
    git add .
    git commit -m "Pabeigts darbs pie kalkulatora funkcijām"
    ```

