"Fetch Quest" by "Bart Massey and the students of PSU Interactive Fiction Spring 2025"

Release along with the library card, cover art, an interpreter and the source text.

When play begins, say "(Thanks to DeepSeek with help selecting spell components.)"

The Deepening Glade is a room. "The forest stretches up into the hills around you. The setting sun filters through, lighting the small grassy glade in which you stand. A very small [stream] flows from north to south along the eastern edge. In the center of the glade, large and prominent, is a massive and ancient [Stone Table]."

The stream is fixed in place in the Glade. The description is "The [water]s of the crystal stream glide gently by. Its shallow blue-green shadows absorb your attention for a moment."  Instead of entering the stream, say "The stream is too small to swim in."

The blue-green water is part of the stream. Instead of doing anything with the blue-green water: say "The water seems so peaceful. You leave it to travel on its way."

The Stone Table is fixed in place and undescribed in the Glade. The description is "The table's massive legs are rooted in the earth. Its huge round top is inscribed with many [arcane runes]."

The arcane runes are part of the Stone Table. The description is "[first time]You are new to magic, but… [only]The runes seem to outline a spell for creating a [quotation mark]fetch[quotation mark]. [first time]What that is you are not sure, but you know one way to find out: make one![line break][only]The spell appears to require consuming five components: [some mustard seed], [some Dragon Tree sap], [some quicksilver], [a wax effigy], and [a Mandrake root]." Understand "top" as the arcane runes.

A spell component is a kind of thing. A spell component is always edible. After examining a spell component: say "[The noun] glows with an almost tangible mystic energy."

Section 1 - Down The Winding Path

The Winding Path is east of the Glade. "You find yourself in what looks like the remains of a forest. The trees are all dead, a few of them fallen over. You feel an overwhelming sense of dread emanating from this former forest. You see a [stump][if wax effigy is on the stump], with [a wax effigy] clumsily laid on top of it[end if]."

The stump is a supporter in the Winding Path. The description of the stump is "It is an old rotting stump covered in moss. But it is surprisingly still hard and stable enough to support things."

[Squish values modeled after beverage heat values in "Disenchantment Bay"]
Squish is a kind of value. The squishes are unmarred, squished, unrecognizable.

[For Section 1's Blob-State Ending - If the Player attempts to eat an unrecognizable Blob.]
BlobState is a truth state that varies. BlobState is false.

The wax effigy is a spell component on the stump. The wax effigy has a squish. The squish of the wax effigy is unmarred.

[Picking up the effigy will "squish" it once each time, until it is unrecognizable.]
After taking the wax effigy:
	say "Oops, you squish it a little accidentally.";
	let the current squish be the squish of the wax effigy;
	if the current squish is not unrecognizable: 
		now the squish of the wax effigy is the squish after the current squish.


The description of the wax effigy is "[if the squish of the wax effigy is unmarred]The wax effigy looks familiar...you've never seen it before, but you can tell it's as good-looking as ever.[otherwise if the squish of the wax effigy is squished]The wax effigy looks a little squished, but you can still tell who it's supposed to be.[otherwise]The wax effigy is squished beyond recognition. Is it even still an effigy?[end if]"

After examining the wax effigy:
	if the squish of the wax effigy is not unrecognizable:
		say "Careful, it seems fragile.";

[The player can fix the wax effigy if it becomes unrecognizable.]
Fixing is an action applying to one touchable thing.
Understand "fix [something]" as fixing.

Check fixing something (called target):
	if the target is not the wax effigy:
		say "You aren't sure how to fix that." instead.
		
Report fixing the wax effigy:
	if the squish of the wax effigy is not unmarred:
		say "You sculpt the wax effigy in your own image.";
		now the squish of the wax effigy is unmarred;
	otherwise:
		say "This seems fine as-is.";

[The player can taste the wax effigy, but this will squish it.]
Instead of tasting the wax effigy:
	say "This tastes like crayons!";
	let the current squish be the squish of the wax effigy;
	if the current squish is not unrecognizable: 
		now the squish of the wax effigy is the squish after the current squish;
		say "Oops. You squished it a little."

[The wax effigy looks like anyone who looks at it!]
Instead of showing the wax effigy to someone:
	say "They look at it with a quizzical look.";
	if the squish of the wax effigy is unrecognizable:
		say "They say to you, 'Looks like a blob of wax.'";
	otherwise:
		say "They say to you, 'Yeah, that looks like me.'"

The Wizard is a man in the winding path. The description of the wizard is "The wizard has a long white beard. He is wearing a sky blue robe with a matching pointed hat. He smiles and nods mysteriously at you." [The wizard is this here to tested the showing comand for now.]

Talking to is an action applying to one visible thing. Understand "talk to [someone]" as talking to.

Check talking to: say "[The noun] doesn't reply."

Instead of talking to the wizard:
	if Blobstate is true:
		say "The wizard looks you up and down. 'You don't look so good.'";
	otherwise:
		say "The wizard smiles and nods mysteriously at you, completely ignoring whatever you've said.";

[If you eat the effigy when it's unrecognizable, you'll turn into a blob soon.]
Check eating the wax effigy:
	if the squish of the wax effigy is unrecognizable:
		say "You're not sure it's a good idea to eat a wax effigy of nobody, but you do it anyway.";
		now Blobstate is true;
		The SickStomach in one turn from now;
		The BlobEndingHappens in three turns from now;
	say "The wax squishes between your teeth. Yum." instead;

At the time when SickStomach:
	say "Your tummy begins to feel funny.";

At the time when BlobEndingHappens:
	say "You start feeling funny all over. You look down and see that your body seems to be liquefying. You are liquefying. Like the Wicked Witch of the west, you are melting. 

You start to panic. You try screaming, but your vocal cords stop working mid-scream. It isn't long before you lose your sense of touch. The next thing you know you are a blob...of flesh? Or made of wax? You are not sure. You could be a lump of clay for all you know. Regardless, you are a blob. A 'lifeless' blob of...well, something. 

You cannot talk. You cannot feel. You cannot move. You cannot breathe. Yet you are still conscious, still aware of your surroundings. You are stuck. You are trapped. 

And there is nothing you can do about it.";
	end the story ;

[Look at the effigy in every state, fix it, eat it]
Test effigy with "east / look effigy / take effigy / look effigy / taste effigy / look effigy / fix effigy / look effigy / fix effigy / eat effigy".

[Test wizard's dialgoue]
Test wizard with "east / talk to wizard / take effigy / show effigy to wizard / taste effigy / look effigy / show effigy to wizard / eat effigy / talk to wizard".

[Test blob ending by eating an unrecognizable effigy]
Test blob with "east / take effigy / drop effigy / take effigy / eat effigy / talk to wizard / wait / wait".


Section 2 - Down The Rising Path

Section 2.1 - Locations

The Rising Path is west of the Glade. "The path meanders west over a steep hill. You can see that the hill flattens out further to the west."

Section 2.2 - NPCs and Objects

There is a blanket in the Rising path.

The merchant is a man on the blanket.

A ware is a kind of thing. A ware has a number called the price.

The coin pouch is a thing. The coin pouch has a number called the balance. The balance of the coin pouch is usually 0.

After printing the name of the coin pouch:
	say " ([the balance of the coin pouch])".

Section 2.3 - Buying Things

A hoe is a ware on the blanket. The price of a hoe is 40.

Instead of taking a ware (called the ware):
	say "You can't steal [the ware], the merchant is looking right at you."

[Buying is a built-in action, but it's "blocked" in all scenes by default; this unblocks it globally.]
The block buying rule is not listed in the check buying rulebook.

Check buying a thing (called the thing):
	if the thing is not a ware:
		say "[The thing] is not for sale." instead;
	if the player does not carry a coin pouch:
		say "You don't even have a coin pouch." instead;
	if the balance of the coin pouch is less than the price of the thing:
		say "You don't have enough coins in your pouch." instead.

Carry out buying a thing (called the ware):
	now the ware is carried by the player.

Report buying a thing (called the ware):
	say "You buy [the ware].";
	now the balance of the coin pouch is the balance of the coin pouch minus the price of the ware. 

Instead of asking the merchant about "wares", say "I have wares if you have coin."

Section 2.4 - The Farm

The Farm is west of the Rising Path. "The farm is small yet diverse with different crops and animals all around. There is much work for the sole farmer. A forest sprouts up to the south."

The farmer is a man in the farm.

After examining the farmer for the first time:
	say "'Hey there! I could use some help around the farm if you'd like to work. Of course I will pay you,' says the farmer, continuing 'By the way, you wouldn't happen to have seen a hoe, have you? Mine broke and I really need another.'"

Section 2.5 - Working at the Farm

Working is an action applying to nothing. Understand "work" as working.

A person can be injured.

Check working:
	if the player is not in the farm:
		say "There is no work to do." instead;
	if the player does not carry the coin pouch:
		say "The farmer notices you don't have a coin pouch and gives you one.";
		now the player carries the coin pouch;
	if the player is injured:
		say "You are injured and cannot work.[first time] (do something else for a few turns to heal)[only]";
		now the time of day is 1 minute before the time of day instead;
	if a random chance of 1 in 20 succeeds:
		say "You injure yourself while working. You cannot continue working until you heal.";
		now the player is injured;
		the injury heals in 5 minutes from now instead.
		
At the time when the injury heals:
	say "Your injury heals and you can work again.";
	now the player is not injured.

Carry out working:
	now the balance of the coin pouch is the balance of the coin pouch plus one.

Report working:
	say "You work hard and earn one coin."
	
After examining the farmer for the first time:
	say "'Hey there! I could use some help around the farm if you'd like to work. Of course I will pay you,' says the farmer, continuing 'By the way, you wouldn't happen to have seen a hoe, have you? Mine broke and I really need another.'"

Section 2.6 - Quest Progress

Section 2.7 - The Hoe Quest

The hoe quest is a scene.

The hoe quest begins when asking the farmer about "hoe". The hoe quest ends when giving the hoe to the farmer.

Report asking the farmer about "hoe":
	say "'I can give you some gold to go buy it for me. Here.' He gives you some gold.";
	increase the balance of the coin pouch by the price of the hoe;
	rule succeeds. [without this it prints "There is no reply."]

When the hoe quest begins:
	if the player does not carry the coin pouch:
		say "The farmer notices you don't have a coin pouch and gives you one.";
		now the player carries the coin pouch.

When the hoe quest ends:
	increase the balance of the coin pouch by 20.

The block giving rule is not listed in the check giving it to rules.

Check giving something (called the thing) to the farmer:
	if the thing is not the hoe:
		follow the block giving rule instead.
	
Report giving the hoe to the farmer:
	say "You give the farmer the hoe. He thanks you and gives you 20 coins. 'I really owe you one,' he says."

Section 2.8 - The Fertilizer

Some fertilizer is a thing.

Carry out asking the farmer about "fertilizer" when the hoe quest is not happening:
	now the player carries some fertilizer.

Report asking the farmer about "fertilizer" when the hoe quest is not happening:
	say "The farmer gives you some fertilizer. 'You've helped me out plenty. I'm happy to return the favor.'";
	rule succeeds.

Section 2.9 - The Forest

The Forest is  south of the farm. "The forest is sparse, with just enough cover to escape the hot sun. The Dragon Tree is alone in a larger clearing in the forest."

Section 2.10 - The Dragontree

A Dragon Tree is in the forest. The description of the tree is "The Dragon Tree looks like it has seen better days. Shriveled leaves hang limply from its withered branches."

The Dragon Tree Spirit is a person.

After examining the Dragon Tree for the first time:
	say "A spirit emerges from the tree as you stand before it. 'Please... help...'";
	now the Dragon Tree Spirit is in the forest.
	
Section 2.11 - The Fertilizer Quest

The fertilizer quest is a scene. The fertilizer quest begins when asking the spirit about "tree". The fertilizer quest ends when giving the fertilizer to the spirit.
	
Report asking the spirit about "tree" when the fertilizer quest is not happening:
	say "'The tree needs food. The soil has been sapped of its nutrients. We have little to offer, but we can do our best to give you whatever you seek if you help us.'";
	rule succeeds.

Check giving something (called the thing) to the spirit:
	if the thing is not fertilizer:
		follow the block giving rule instead.
		
Report giving the fertilizer to the spirit:
	say "You give the spirit the fertilizer. 'Thank you. This will help the tree thrive. Is there anything I give to you?'".

Section 2.12 - The Dragon Tree Sap

Some Dragon Tree sap is a spell component.
	
Carry out asking the spirit about "sap" when the fertilizer quest has ended:
	now the player carries the sap.

Report asking the player about "sap" when the fertilizer quest has ended:
	say "'Very well. Take some of the Dragon Tree's sap.'";
	rule succeeds.

Section 3 - Down The Upstream Path

The Upstream Path is north of the Glade and east of the Douglas Fir. "The path meanders through the forest, sometimes closer, sometimes farther from the stream. You walk along peacefully, mesmerized by its melodic, rhythmic gurgling. [A Sunny Meadow] lies [bold type]west[roman type] of the path. An old growth [douglas fir] tree is on the [bold type]east[roman type] side of the path."

A Douglas Fir is east of the Upstream Path. "This enormous fir tree is definitely old growth. [The Upstream Path] is to the [bold type]west[roman type]."

A shovel is in the Douglas Fir. The description of the shovel is "This digging spade has a fine oak handle. The blade is firm and clean."
Understand "spade" as a shovel.

A Sunny Meadow is west of the Upstream Path. "The meadow is sunny, but wet and marshy. A dank, musty fragrance hangs in the air, rising from the damp soil. You hesitate to get your boots muddy, but you see a colorful patch further [bold type]west[roman type] on the far edge of the meadow. It is a sunny spot dotted by floppy rosettes of leaves adorned with purple flowers. [The Upstream Path] is to the [bold type]east[roman type]."

A backpack is a container in the Sunny Meadow.
The backpack is wearable.
The backpack contains earmuffs.
The earmuffs are wearable.
Understand "ear muffs" as the earmuffs.

The backpack contains a flask.
The flask contains absinthe. The description of the flask is "A slightly dented metal flask looks like it has been on quite a few adventures. Based on the slightly minty licorice odor, you think it is full of absinthe. You'd best stay away from that stuff."
Instead of drinking the flask, say "You need to keep a sharp mind on your quest. Don't touch the absinthe."
The description of the absinthe is "This liquid has a slightly minty licorice odor, so you think it is probably absinthe. You'd best stay away from that stuff!"
Instead of drinking absinthe, say "You need to keep a sharp mind on your quest. Don't touch the absinthe."
Instead of taking the absinthe, try taking the flask.

A Mandrake Patch is west of the sunny meadow. "Mandrakes! So many mandrakes blossoming with delicate purple flowers in the wet, fecund earth. You know that just under the surface, buried within the rich loamy soil is the twisted, gnarly, forked root for which you search. [A Sunny Meadow] is to the [bold type]east[roman type]."

A Mandrake root is a spell component.
The description of the Mandrake root is "The plant is beautiful, but you have heard stories of people who died horrible deaths after pulling up a mandrake root. They are probably superstitious rumors, right?"
A Mandrake root is in the Mandrake Patch.
The mandrake root can be either pulled or unpulled. The mandrake root is unpulled.

[
  Digging
  See documentation for 'Creating New Actions':
  https://inform-7-handbook.readthedocs.io/en/latest/chapter_4_actions/creating_new_actions/
]
Digging is an action applying to nothing. Understand "dig" as digging.
Understand "dig up" as digging.

Check digging:
	if the player carries the shovel:
		say "You need to be more specific about what you want to dig up.";
	otherwise:
		say "You don't have a shovel."

Root-digging is an action applying to one thing. Understand "dig [something]" and "dig up [something]" as root-digging.

Check root-digging:
	if the noun is a mandrake root:
		if the mandrake root is unpulled and the player is not wearing the earmuffs:
			 say "As you pull up the mandrake root you hear an earsplitting shriek. As the shriek rings through your head, your vision fades. The last thing you see, before you lose consciousness, are tiny little legs scampering across the Mandrake Patch into the distance as the root waves a little fist that looks oddly like it is flipping you off. When you awaken, that mandrake root has disappeared. Lucky for you, [bold type]there are still many mandrakes remaining in the patch[roman type].";
		otherwise if the mandrake root is pulled and the player is not wearing the earmuffs:
			say "You should have learned from the last time you tried this ... You need to [bold type]wear[roman type] proper ear protection!";
		otherwise if the player carries the shovel:
			try digging the mandrake root with the shovel instead;
		otherwise:
			say "A wise sorcerer once told you not to pull a Mandrake root with your bare hands. [bold type]If only you had a shovel[roman type]!";
	otherwise:
		say "You cannot dig up [the noun]."

Digging it with is an action applying to two things.
Understand "dig [something] with [something]" as digging it with.
Understand "dig up [something] with [something]" as digging it with.

Check digging it with:
	if the noun is not the mandrake root:
		say "There is no use wasting time to dig up [the noun]." instead;
	otherwise if the second noun is not the shovel:
		say "[The second noun] cannot be used for digging things. [bold type]Use a shovel instead[roman type]." instead;
	otherwise if the player does not carry the shovel:
		say "If you want to do that, [bold type]you need to find a shovel[roman type]." instead.

Carry out digging it with:
	try taking the mandrake root;
	now the mandrake root is pulled.
[end Digging]

Instead of taking the Mandrake root when the player does not have the shovel:
say "A wise sorcerer once told you not to pull a Mandrake root with your bare hands. [bold type]If only you had a shovel[roman type]!"

Instead of taking the Mandrake root when the player is not wearing the earmuffs:
	If the mandrake root is unpulled:
		say "As you pull up the mandrake root you hear an earsplitting shriek. As the shriek rings through your head, your vision fades. The last thing you see, before you lose consciousness, are tiny little legs scampering across the Mandrake Patch into the distance as it waves a little fist that looks oddly like it is flipping you off. When you awaken, that mandrake root has disappeared. Lucky for you, [bold type]there are still many mandrakes remaining in the patch[roman type].";
		now the mandrake root is pulled;
	otherwise:
		say "You should have learned from the last time you tried this ... You need to [bold type]wear[roman type] proper ear protection!"

[Expects a mandrake root added to your inventory.]
Test mandrake with "n / e / take shovel / w / w / wear earmuffs / w / x mandrake root / take mandrake root / i"

[Expects you succeed on third pull when you finally wear earmuffs.]
Test mandrake-long-way with "n / w / w / take mandrake root / e / e / e / take shovel / w / w / x flask / drink flask / take earmuffs / w / x mandrake root / take mandrake root / dig up mandrake root / wear earmuffs / dig up mandrake root with the shovel / i"

[Expects a mandrake root added to your inventory.]
Test dig-mandrake with "n / e / take shovel / w / w / wear earmuffs / w / dig mandrake root / i"

[Expects warning when digging something other than mandrake root.]
Test dig-non-root with "n / e / take shovel / w / w / dig up earmuffs"

[Expects unsuccessful take of a mandrake root, because you do not have a shovel.]
Test no-shovel with "n / w / w / take mandrake root / i"

[Expects you are knocked unconscious by a shrieking mandrake root, because you have no earmuffs.]
Test untaken-earmuffs with "n / e / take shovel / w / w / w / take mandrake root / i"

[Expects you are knocked unconscious by a shrieking mandrake root, because you are not wearing earmuffs.]
Test unworn-earmuffs with "n / e / take shovel / w / w / take earmuffs / w / take mandrake root / i"

[Expects you are warned, because you are not wearing earmuffs.]
Test twice-unworn-earmuffs with "n / e / take shovel / w / w / take earmuffs / w / take mandrake root / take mandrake root"

Section 4 - Down The Downstream Path

The Downstream Path is south of the Glade.

The Downstream Path is a room. "You can see a damp cave further south along the river."

The Cave is a dark room.   The Cave is south of the Downstream Path. "Extra Description"

The Fairy is a thing.

After going to The Downstream Path from The Cave for the first time: now The Fairy is in the Downstream Path; say "You see a fairy floating helplessly downriver."

Every turn: if the player is in a dark room and the player is carrying the fairy, say "A light is peeking out of your bag."

Every turn: If the the fairy is in the cave, now the fairy is lit; otherwise now the fairy is unlit.

Check taking the fairy when the fairy is in the cave: say "The fairy flutters out of your reach." instead.

Some mustard seed is a spell component.
Some mustard seed is in The Cave.

Section 5 - Down The Widdershins Path

The Widdershins Path is northwest of the glade.  "This section of the forest is thick with trees and shrubs.  Someone thought it made an excellent social space, though, as they have constructed a nice [picnic table] and placed a [BBQ grill] here.  The dirt path leads southeast back toward the glade."

The picnic table is a fixed in place supporter in the Widdershins Path.  The description is "This picnic table, expertly crafted of sustainably-sourced redwood, boasts a natural charm and durability that's perfect for scary places like the Widdershins Path. [if blanket is on the picnic table]A blanket lies on the table. It is folded neatly, and it has a tacky red and blue checkered pattern.[end if] [if basket is on the picnic table] A charming little picnic basket sits on the table."

A picnic blanket is a thing on the picnic table. The printed name is "picnic blanket".  The description is "A red and blue checkered picnic blanket. It is thin and well-worn, but is the perfect size to throw over an escaping animal."  Understand "blanket" or "picnic blanket" as the picnic blanket.

A uselessObject is a kind of thing.

A uselessBlanket is a fixed in place uselessObject.  The printed name is "charred picnic blanket".  The description is "You can tell that this used to be a red and blue checkered picnic blanket, before it caught on fire somehow."  Understand "charred picnic blanket" as the uselessBlanket.

The BBQ grill is a fixed in place supporter in the Widdershins Path.  The description is "A heavy-duty combo grill stands here - sleek and sturdy, with side-by-side gas and charcoal fireboxes.  Cast iron grates rest above dual heat sources, and a stainless steel warming rack hovers overhead.  Vents and adjustable trays offer precise temperature control.  A side burner waits for sauces or sides.  It even has a spacious storage cabinet beneath[if storage cabinet is closed], which appears to be secured by a slender silver lock[end if].  The scent of past cookouts lingers faintly in the air. [if shards are in Widdershins Path]Some silver shards glitter at the base of the grill. [end if][if net is on the BBQ grill]A net lies coiled on top of the warming rack. [end if]"

A storage cabinet is an undescribed locked openable container.  The storage cabinet is part of the BBQ grill.

Instead of unlocking the storage cabinet with the quicksliver:
	If a random chance of 2 in 3 succeeds:
		say "You manage to pick the lock on the storage cabinet, but the quicksliver was broken in the process.  The cabinet doors ponderously swing open.";
		now the storage cabinet is unlocked;
		now the storage cabinet is open;
		now the quicksliver is off-stage;
		now the shards are in the location;
	else:
		say "You didn't quite get it this time, but maybe if you try again...";

A net is a thing on the BBQ grill.  The description is "A circular net made of tough, knotted rope, its edges lined with heavy lead weights.  Designed to be thrown, it spreads wide in the air before crashing down to entangle its target. The mesh is coarse but flexible, and a set of braided cords trails from the center - ready to be yanked to cinch it tight."  It is undescribed.

A uselessNet is a fixed in place uselessObject.  The printed name is "old net".  The description is "A circular net made of tough, knotted rope, its edges lined with heavy lead weights.  Unfortunately, this one is brittle and useless."  Understand "old net" as the uselessNet.

An ingot is a fixed in place thing on top of the picnic table.  The printed name is "ingot of quicksilver".  The description is "This is a strange ingot, cool and unnaturally smooth.  Its surface gleams with a muted, silvery luster that seems to ripple like frozen liquid.  Though clearly solid, it catches the light in a way that feels almost alive - like it’s holding motion just beneath its metallic skin.  You sense that this is no ordinary metal; it hums with latent energy, dense and unnerving."

Instead of taking or touching the ingot:
	say "At first touch, the ingot shudders, then quivers.  With a metallic squelch, it ripples like molten mercury, sprouts stubby pseudopods, and leaps away in a panic.  It clinks to the ground, jiggles indignantly, and darts down the path toward the glade, leaving a faint shimmer in its wake.";
	now ingot is off-stage;
	now slime is in the glade;

Instead of throwing something at the ingot:
	if the noun is carried by the player:
		say "Even as [the noun] sails through the air toward it, the ingot seemingly melts, dripping between the boards of the table to land in a puddle on the dirt path beneath.  The puddle shudders, then quivers, and with a metallic squelch, it ripples like molten mercury and sprouts stubby pseudopods.  It darts down the path toward the glade, leaving a faint shimmer in its wake.";
		now ingot is off-stage;
		now slime is in the glade;
		now the noun is in the location;
		now the noun is described;
	else:
		say "You can't see any such thing.";
	
netTried is a truth state that varies.  netTried is false.
basketTried is a truth state that varies.  basketTried is false.
blanketTried is a truth state that varies. blanketTried is false.

Instead of throwing something at the slime:
	if the slime is asleep:
		say "That would probably wake it up...";
	else:
		if the noun is the blanket:
			say "The blanket magestically flutters through the air and lands atop the quicksilver slime. Unfortunately for you, the slime soaks right through it, laughs, [if netTried is true and basketTried is true]yawns, [end if]and then darts down the path. The wet spot on the blanket suddenly combusts. ";
			now blanket is off-stage;
			now uselessBlanket is in the location;
			now blanketTried is true;
		else if the noun is the basket:
			say "The expertly thrown basket lands upside-down atop the quicksilver slime, but before you could slide the top closed, the slime bursts through the side of the basket, jumps up and down, laughs, [if netTried is true and blanketTried is true]yawns, [end if]and then darts down the path. There is a huge hole in the side of the basket. ";
			now basket is off-stage;
			now uselessBasket is in the location;
			now basketTried is true;
		else if the noun is the net:
			say "As the net settles on top of the quicksilver slime, it laughs out loud and just oozes out through the openings in the net.  It laughs again, jiggling a bit, [if basketTried is true and blanketTried is true]yawns, [end if]and darts down the path. Wherever the slime touched the strands of the net, they dissolve into dust. ";
			now net is off-stage;
			now uselessNet is in the location;
			now netTried is true;
		else if the noun is carried by the player:
			say "Futile.";  [fix this]
			stop the action;
		else:
			say "You're not carrying [the noun], so you can't throw it!";
			stop the action;
		let viable-rooms be a list of rooms;
		repeat with way running through directions:
			let place be the room way from the location;
			if place is a room:
				add place to viable-rooms;
		if location is listed in viable-rooms:
			remove the location from viable-rooms;
		let N be a random number from 1 to the number of entries in viable-rooms;
		let destination be entry N in viable-rooms;
		now slime is in destination;
		if the noun is the blanket or the noun is the basket or the noun is the net:
			say "[The noun] is useless to you now.";
			[now the noun is off-stage;]
		if netTried is true and blanketTried is true and basketTried is true:
			now slime is asleep;
			now the printed name of slime is "sleeping quicksilver slime".
			
Instead of taking the slime:
	if the slime is asleep:
		now slime is off-stage;
		now quicksliver is carried by the player;
		say "The sleeping quicksilver slime continues softly snoring as you attempt to pick it up.  You can't seem to get it in one piece, as it just keeps dripping between your fingers, but you do manage to get some of it.  The rest of it drains away into the dirt path.";
	else:
		say "It zigs and zags and you can't seem to get close enough to get hold of it."
		
Instead of touching the slime:
	if the slime is asleep:
		say "It feels...mercurial.  Luckily, your gentle poke fails to awaken it.";
	else:
		say "It zigs and zags and you can't seem to get close enough to get hold of it."
	
A slime is a thing.  The printed name is "quicksilver slime".  The description is "[if slime is not asleep]A jittery blob of semi-solid metal, the quicksilver slime pulses with nervous energy. Its mirrored surface warps reflections as it quivers, barely holding its shape. It gives off a faint metallic plink now and then, as if ready to flee at any moment.[else]A blob of semi-solid metal, the quicksilver slime pulses slowly and emits a soft but rythmic snore.  Its mirrored surface warps reflections as it slowly breathes.[end if]"

The slime can be asleep or not asleep.  The slime is not asleep.

Some quicksilver is a spell component.  It is in the storage cabinet.

A basket is an open openable container on the table.  The printed name is "picnic basket".  The description is "A picnic basket."

A uselessBasket is a fixed in place uselessObject.  The printed name is "busted picnic basket".  The description is "A picnic basket with a huge hole in one side."  Understand "busted picnic basket" as the uselessBasket.

Instead of taking a uselessObject:
	say "There's really no point in picking this up.";

Instead of inserting into the basket:
	say "That might soil the inside of the basket, ruining it for future picnics!";

A quicksliver is a thing.  The quicksliver unlocks the storage cabinet.  The description is "This skinny sliver of shiny metal reminds you of a lockpick."

Some shards is a fixed in place uselessObject.  The printed name is "shards of quicksliver".  The description is "These shards are all that is left of the quicksliver.  They are embedded in the ground and refuse to come out."

test qs1 with " inv / nw / examine grill / take net / examine cabinet / open cabinet / examine table / examine blanket / take blanket / examine basket / take basket / examine ingot / take ingot / se / throw blanket at slime ";  [now you have to find the slime in one of the adjacent rooms]

test qs2 with " throw net at slime ";  [now you have to find the slime in one of the adjacent rooms]

test qs3 with " throw basket at slime ";  [now you have to find the slime in one of the adjacent rooms]

test qs4 with " examine slime / touch slime / take slime / inv / examine quicksliver ";  [now you have to make your way back to Widdershins Path]

test qs5 with " open cabinet with quicksliver / inv / look / examine shards / look in cabinet / take quicksilver / inv / se ";

Section 6 - Fetched

Every turn when the player is in the Glade and all spell components are off-stage: say "You have consumed the spell components and are ready to cast! The place is here, the time is now. You realize that laying upon the table will complete the spell, so you step on up."; now the player is on the Stone Table; say "You feel a dark energy surge through you. You see a shadowy form floating above you. You realize that this apparition is you — or rather, your 'fetch'.[paragraph break]You can feel the contents of your stomach roiling in agony; you slowly lose consciousness."; end the story.
