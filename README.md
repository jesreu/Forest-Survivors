<a name="readme-top"></a>
# Forest-Survivors

    Kirjoittanut ja koodannut: Jesse Reunamo
    Kurssi:                    Ohjelmistokehityksen teknologioita
    Linkki videoon:            
 
<details>
  <summary>Sisältö</summary>
  <ol>
    <li><a href="#projektista">Projektista</a></li>
    <li><a href="#käytetyt-teknologiat">Käytetyt teknologiat</a></li>
    <li><a href="#opittua">Opittua</a></li>
    <li><a href="#puutteet">Puutteet</a></li>    
    <li><a href="#lähteet">Lähteet</a></li>
  </ol>
</details>

## Projektista

Projektissa on kehitelty yksinkertainen peli, joka pohjautuu vahvasti Vampire Survivors peliin. Projekti on tehty pääosin tutoriaalin pohjalta, mutta omaa harkintaan on käytetty kokonaisuuden rakentamisessa. Pelin rakenne muodostuu aloitusvalikosta, ja pelitilasta. Mikäli pelaaja kuolee, ennen kuin pelin ajastin on tarpeaksi pitkällä, on pelaaja hävinnyt pelin. Pelaaja siis pyrkii selviytymään, niin pitkälle kuin pystyy. Valitsin projektin aiheen ja toteuksen, koska halusin verrata miten Godot pelimoottori eroaa Unity pelimoottorista.

Pelin kontrollit:
| Toiminto |  Kontrolli |
| ----------- | ----------- |
| Hahmon liike    | WASD- näppäimet |
| Valikkojen navigointi | Hiiri |

### Kuvankaappauksia pelistä
---

![image](https://user-images.githubusercontent.com/112503770/236006906-65f00f6a-e1b2-426f-8d4a-6dbecfa901c1.png)

![image](https://user-images.githubusercontent.com/112503770/236007216-22a4754e-b081-413e-959a-a9428b79b625.png)

![image](https://user-images.githubusercontent.com/112503770/236007603-0475d6d6-4f45-4878-a591-887e86432632.png)

---

## Käytetyt teknologiat

Peli on toteutettu Godot- pelimoottorilla, ja pelimoottorin gdscript (godotscript) ohjelmointikielellä. Pelin visuaalinenosuus on luotu käyttämällä vapaasti lisensoituja peli- assetteja. 

"GDScript on korkean tason dynaamisesti tyypitetty ohjelmointikieli, jota käytetään sisällön luomiseen. Se käyttää sisennyksiin perustuvaa syntaksia, joka muistuttaa Pythonin kaltaisia kieliä. Sen tavoitteena on olla optimoitu Godot Engineen ja integroitu siihen tiiviisti, mikä mahdollistaa suuren joustavuuden sisällön luomisessa ja integroinnissa." - [Godot Docs](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_basics.html)

## Opittua

Eräs tekniikka, jonka joita projektin aikana on pelimoottorin signaali järjestelmä. Järjestelmä tekee yhteyksien tekemisestä eri skriptien välille huomattavasti sujuvampaa. Projektia pystyi myös hyvin peilaamaan Ohjelmistoprojekti 2 kurssin Unity- osaamiseen ja huomata kuinka samanlaisia molemmat käytetyt pelimoottorit ovat, vaikka näkymä on erilainen niin silti aika pitkälti samat ominaisuudet ovat molemmissa. 

Signaali skriptissä.

![image](https://user-images.githubusercontent.com/112503770/236010976-deb4d4e7-f4ab-4c4d-b519-d17e21f35f76.png)

Animaatioiden luominen Godotilla on mielestäni helpompaa, verrattuna Unityn järjestelmään. Godotilla animaatioita pystyi helposti muokata koodin kautta, kun taas Unityssä animaatiot usein tehdään työlään pelimoottorin animaattori käyttöliittymän kautta.

Animaatio Godotilla.

![image](https://user-images.githubusercontent.com/112503770/236009988-0deacb4a-2c35-42d0-9da1-c0bc0e1f8f9f.png)

Animaatio Unityllä.

![image](https://user-images.githubusercontent.com/112503770/236010221-36ac91d8-570d-47f3-afba-14cc96775e7b.png)

GDscript oli varsin helppoa kirjoittaa, kun suurin osa syntaksista muodostuu tabuloinneisa ja `:` merkeistä, ei paljon tarvinnut huolehtia unohtuneista `;` merkeistä. Koodatessa gdskriptiä en tehnyt läheskään niin paljon virheitä, kuin C# kielellä Unityn kanssa.

## Puutteet

Pelin pelimaailma, jäi varsin pieneksi joten ehkä peliä voisi ajatella enemmän prototyyppinä tai demona jatkokehitystä varten. Olisin myös halunnut lisätä enemmän järjestelmiä peliin, jotta se olisi ollut laajempi ja pelattavampi. Pelissä myös vihollisten visuaalinen vaihtelu jäi erittäin vähäiseksi.

## Lähteet
    
* Tutoriaali johon projekti pohjautuu: https://www.youtube.com/watch?v=abA7TF7z6W8&list=PLtosjGHWDab682nfZ1f6JSQ1cjap7Ieeb
* Godot Dokumentaatio:                 https://docs.godotengine.org/en/stable/index.html

