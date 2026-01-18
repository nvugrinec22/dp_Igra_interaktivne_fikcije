"Izgubljeni u svijetu blokova" by Nensi Vugrinec

Release along with an interpreter.
Release along with a website.
Release along with the introductory booklet.

Include Glulx Text Effects by Emily Short.

When play begins:
	say "Budiš se na travi. Sve oko tebe izgleda... kockasto. Drveće, tlo, čak i sunce. Jedna misao ti prolazi glavom: [italic type]Ovo izgleda kao Minecraft.[roman type]".


Part - Stilovi teksta

Table of User Styles (continued)
style name		color
special-style-1	"#3BB143"
special-style-2	"#D0213D"


Part 0 - Zvukovi

Sound of Zombie Warning is the file "zombie1.ogg".
Sound of Zombie Death is the file "zombie2.ogg".

Sound of Creeper Hiss is the file "creeper1.ogg".
Sound of Creeper Explosion is the file "creeper2.ogg".

Sound of Crystal Gain is the file "crystal.ogg".

Sound of Portal Fail is the file "portal1.ogg".
Sound of Portal Success is the file "portal2.ogg".

Sound of Villager Talk is the file "villager.ogg".

Part 0b - Slike

Figure of Forest is the file "forest.png".
Figure of Cave is the file "cave.png".
Figure of Mine is the file "mine.png".
Figure of Portal is the file "portal.png".

Part 1 - Sobe

The Forest is a room.

The forest-shown is a truth state that varies.
The forest-shown is false.

After looking in the Forest:
	if forest-shown is false:
		display the Figure of Forest;
		now forest-shown is true.

The description is
"Nalaziš se u šumi punoj kockastog drveća. Sve izgleda neprirodno savršeno. Na tlu vidiš crafting table.".


The Cave is a room.
It is south of the Forest.

The cave-shown is a truth state that varies.
The cave-shown is false.

After looking in the Cave:
	if cave-shown is false:
		display the Figure of Cave;
		now cave-shown is true.

The description is
"[if the player does not have the torch]
Pećina je mračna. Ne vidiš gotovo ništa i osjećaš da nije sigurno ući bez svjetla.
[otherwise]
Pećina je i dalje mračna, ali baklja osvjetljava zidove prekrivene rudama. Na zidu primjećuješ stari znak.
[end if]".


The Mine is a room.
It is south of the Cave.

The mine-shown is a truth state that varies.
The mine-shown is false.

After looking in the Mine:
	if mine-shown is false:
		display the Figure of Mine;
		now mine-shown is true.

The description is
"Duboko si u rudniku. Tuneli su uski i mračni. Imaš loš predosjećaj.".


The Portal Chamber is a room.
It is east of the Mine.

The portal-shown is a truth state that varies.
The portal-shown is false.

After looking in the Portal Chamber:
	if portal-shown is false:
		display the Figure of Portal;
		now portal-shown is true.

The description is
"Prostorija je pravilno oblikovana, kao da nije prirodna. U sredini stoji neaktivan portal frame.".


Part 2 - Objekti

A crafting table is in the Forest.
It is scenery.
The description is "Klasični crafting table. Ako želiš nešto napraviti, ovo je pravo mjesto.".

Some sticks are in the Forest.
The description is "Drveni štapići. Osnovni materijal za izradu alata.".

A torch is in the Forest.
The description is "Baklja koja bi ti mogla osvijetliti mračna mjesta.".

A chest is in the Cave.
It is a container.
It is closed and openable.
The description is "Stari drveni chest. Možda se unutra nalazi nešto korisno.".

Two iron ingots are in the chest.
The description is "Čvrsti željezni ingoti. Idealni za izradu oružja.".

A sign is in the Cave.
It is scenery.
The description is
"Na znaku piše: 'U mraku preživljavaju samo oni koji se mogu braniti. Bez mača, mrak brzo postaje grobnica.'".

A sword is a thing.
The description is "Željezni mač. S njim se možeš obraniti od čudovišta.".

A portal crystal is a thing.
The description is
"Sjajni kristal koji pulsira čudnom energijom. Osjećaš da je povezan s portalom.".

A portal frame is in the Portal Chamber.
It is scenery.
The description is "Masivni okvir portala. Trenutno je neaktivan.".
Understand "portal" or "frame" as the portal frame.


Part 3 - Ograničenja kretanja

Check going to the Cave:
	if the player does not have the torch:
		say "Mrak je pregust. Imaš loš predosjećaj i odlučuješ se vratiti." instead.


Part 4 - Likovi

A villager is a man in the Forest.
The description is "[special-style-1]Villager[roman type] te gleda bez imalo iznenađenja.".

Before asking the villager about anything:
	play the sound of Villager Talk.

After examining the villager for the first time:
	say "Nešto promrmlja sebi u bradu: [italic type]Kristali… rijetki su danas… i opasni u krivim rukama.[roman type]".


Table of Villager Responses
topic		response
"portal"	"[special-style-1]Villager[roman type] promrmlja: [italic type]Portal je izlaz... ali treba mu snažan izvor energije. Samo oni koji su dokazali da se mogu braniti dobiju ključ.[roman type]"
"this place"	"[special-style-1]Villager[roman type] kaže: [italic type]Ovo je svijet blokova. Ovdje se ne preživljava slučajno.[roman type]"
"zombie"	"[special-style-1]Villager[roman type] kaže tiho: [italic type]Zombie se ne boji golih ruku. Bez pravog oružja, borba je izgubljena prije nego počne.[roman type]"
"creeper"	"[special-style-1]Villager[roman type] odmahne glavom: [italic type]Creepera ne možeš pobijediti. Ako počne šištati, jedina pametna stvar je maknuti se.[roman type]"



Instead of asking the villager about something:
	if the topic understood is a topic listed in the Table of Villager Responses:
		say response entry;
	otherwise:
		continue the action.


Instead of asking the villager about "crystal":
	if the zombie is undefeated:
		say "[special-style-1]Villager[roman type] odmahne glavom: [italic type]Prvo moraš dokazati da se znaš braniti.[roman type]";
	otherwise if the player has the portal crystal:
		say "[special-style-1]Villager[roman type] kaže: [italic type]Već sam ti dao kristal.[roman type]";
	otherwise:
		play the sound of Crystal Gain;
		say "[special-style-1]Villager[roman type] ti pruži sjajni kristal. [italic type]Sada si spreman/na. Ovo je ključ portala.[roman type]";
		move the portal crystal to the player.


A creeper is a person in the Cave.
The description is "Zeleno stvorenje koje ti ne ulijeva povjerenje.".
After examining the creeper:
	play the sound of Creeper Hiss.


A steve is a man in the Portal Chamber.
The description is "Izgleda poznato. Kao da je ovdje već dugo i čeka da netko dođe.".

Instead of asking steve about "portal":
	if the player has the portal crystal and the portal attempts is 1:
		say "[special-style-1]Steve[roman type] se kratko zamisli: [italic type]Ponekad portali ne reagiraju odmah. Ako si već pokušao/la… možda je drugi put ključan.[roman type]";
	otherwise if the player has the portal crystal:
		say "[special-style-1]Steve[roman type] klimne glavom. [italic type]Vidim da imaš kristal. Sad znaš što treba učiniti.[roman type]";
	otherwise:
		say "[special-style-1]Steve[roman type] kaže: [italic type]Portal treba izvor energije. Ja ga ne mogu dati... ali netko u šumi zna više.[roman type]".

Instead of asking steve about "crystal":
	if the player has the portal crystal:
		say "[special-style-1]Steve[roman type] se nasmije. [italic type]Da, to je taj kristal. Bez njega portal je samo kamen.[roman type]";
	otherwise:
		say "[special-style-1]Steve[roman type] kaže: [italic type]Portal je samo kamen dok mu ne daš izvor energije. Takvi kristali ne nalaze se u tami rudnika. Oni koji žive pod otvorenim nebom znaju više nego ja.[roman type]".

Instead of asking steve about "villager":
	say "[special-style-1]Steve[roman type] kaže: [italic type]Villager u šumi zna tko je spreman, a tko nije.[roman type]".


Part 5 - Zombie

A zombie is a person in the Mine.
The description is "Trulo čudovište koje te odmah primijeti.".

A zombie can be alerted or calm.
The zombie is calm.
The zombie timer is a number that varies.
The zombie timer is 0.
The zombie can be defeated or undefeated.
The zombie is undefeated.


After going to the Mine:
	if the zombie is in the Mine:
		try looking;
		now the zombie is alerted;
		now the zombie timer is 2;
		play the sound of Zombie Warning;
		say "Čim uđeš u rudnik, primjećuješ [special-style-2]Zombija[roman type] kako se okreće prema tebi i polako krene u tvom smjeru.".


Every turn when the zombie is alerted and the player is in the Mine:
	decrease the zombie timer by 1;
	if the zombie timer is 1:
		say "[special-style-2]Zombie[roman type] je sve bliže. Moraš brzo reagirati!";
	if the zombie timer is 0:
		say "[special-style-2]Zombie[roman type] te sustigne i brutalno napadne.";
		respawn the player.


Instead of attacking the zombie:
	if the player does not have the sword:
		say "Pokušaš se obraniti golim rukama, ali [special-style-2]Zombie[roman type] je jači.";
		respawn the player;
	otherwise:
		say "Zamahneš mačem i poraziš [special-style-2]Zombija[roman type]. Rudnik je sada siguran.";
		play the sound of Zombie Death;
		now the zombie is calm;
		now the zombie is defeated;
		now the zombie timer is 0;
		remove the zombie from play.

After going north from the Mine:
	now the zombie timer is 0;
	now the zombie is calm;
	say "Bježiš iz rudnika prije nego te zombie uspije sustići.";
	continue the action.



Part 6 - Creeper (smrt)

Instead of asking the creeper about anything:
	play the sound of Creeper Hiss;
	say "[special-style-2]Creeper[roman type] počne šištati...";
	play the sound of Creeper Explosion;
	say "BOOM! [special-style-2]Creeper[roman type] eksplodira.";
	respawn the player.

Part 7 - Respawn

The portal attempts is a number that varies.
The portal attempts is 0.

To respawn the player:
	move the player to the Forest;
	move the torch to the Forest;
	move the sticks to the Forest;
	move the iron ingots to the chest;
	now the chest is closed;
	remove the sword from play;
	now the portal attempts is 0;
	now the zombie is calm;
	remove the portal crystal from play;
	say "Budiš se ponovno na travi. Sve izgleda isto kao prije.".

Part 8 - Crafting

Crafting is an action applying to one topic.
Understand "craft [text]" as crafting.

Check crafting:
	if the topic understood does not include "sword":
		say "To ne možeš craftati." instead;
	if the player is not in the Forest:
		say "Trebaš crafting table za to." instead;
	if the player does not carry the sticks:
		say "Nedostaju ti stickovi." instead;
	if the player does not carry the iron ingots:
		say "Nemaš dovoljno željeza (trebaju ti 2 iron ingota)." instead.


Carry out crafting:
	move the sword to the player;
	remove the sticks from play;
	remove the iron ingots from play;
	say "Uz pomoć crafting tablea izrađuješ željezni mač.".



Part 9 - Portal

Activating is an action applying to one thing.
Understand "activate [something]" as activating.

Instead of activating the portal frame:
	if the player does not have the portal crystal:
		say "Portal ostaje mrtav. Nedostaje mu izvor energije." instead;
	if the portal attempts is 0:
		play the sound of Portal Fail;
		now the portal attempts is 1;
		say "Portal se zatitra, ali se ne uspijeva aktivirati.";
	otherwise:
		if steve is in the Portal Chamber:
			say "[special-style-1]Steve[roman type] te pogleda i tiho kaže: [italic type]Sretno.[roman type]";
		play the sound of Portal Success;
		end the story finally saying
		"Portal se aktivira. Svjetlost te obavija. Budiš se u svom krevetu... ali na noćnom ormariću leži mali, kockasti kristal.";

		
After going west from the Portal Chamber:
	say "Vraćaš se natrag iz prostorije s portalom.";
	continue the action.




