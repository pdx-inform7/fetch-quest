"Fetch Quest" by "Bart Massey and the students of PSU Interactive Fiction Spring 2025"

When play begins, say "(Thanks to DeepSeek with help selecting spell components.)"

The Deepening Glade is a room. "The forest stretches up into the hills around you. The setting sun filters through, lighting the small grassy glade in which you stand. A very small [stream] flows from north to south along the eastern edge. In the center of the glade, large and prominent, is a massive and ancient [Stone Table]."

The stream is fixed in place in the Glade. The description is "The [water]s of the crystal stream glide gently by. Its shallow blue-green shadows absorb your attention for a moment."  Instead of entering the stream, say "The stream is too small to swim in."

The blue-green water is part of the stream. Instead of doing anything with the blue-green water: say "The water seems so peaceful. You leave it to travel on its way."

The Stone Table is fixed in place and undescribed in the Glade. The description is "The table's massive legs are rooted in the earth. Its huge round top is inscribed with many [arcane runes]."

The arcane runes are part of the Stone Table. The description is "[first time]You are new to magic, but… [only]The runes seem to outline a spell for creating a [quotation mark]fetch[quotation mark]. [first time]What that is you are not sure, but you know one way to find out: make one![line break][only]The spell appears to require consuming five components: [some mustard seed], [some Dragon Tree sap], [some quicksilver], [a wax effigy], and [a Mandrake root]." Understand "top" as the arcane runes.

A spell component is a kind of thing. A spell component is always edible. After examining a spell component: say "[The noun] glows with an almost tangible mystic energy."

Section 1 - Down The Winding Path

The Winding Path is east of the Glade. "You find yourself in what looks like the remains of a forest. The trees are all dead, a few of them fallen over. You feel an overwhelming sense of dread emanating from this former forest. You see a [stump][if wax effigy is on the stump], with [a wax effigy] clumsily laid on top of it[end if].".

[For Section 1's Blob-State Ending - If the Player attempts to eat an unrecognizable Blob.]
BlobState is a truth state that varies. BlobState is false.

[squish values modeled after beverage heat values in "Disenchantment Bay"]

Squish is a kind of value. The squishes are unmarred, squished, unrecognizable.

The stump is a supporter in the Winding Path. The description of the stump is "It is an old rotting stump covered in mosses. But it surprisingly still hard and stable enoguh to support things."

The wax effigy is a spell component on the stump. The wax effigy has a squish. The squish of the wax effigy is unmarred.

[Picking up the effigy will "squish" it once each time, until it is unrecognizable.]
After taking the wax effigy:
	say "Oops, you squish it a little accidentally.";
	let the current squish be the squish of the wax effigy;
	if the current squish is not unrecognizable: 
		now the squish of the wax effigy is the squish after the current squish.

[You can't eat the wax effigy if it's unrecognizable (because it wouldn't work for the spell)]
Check eating the wax effigy:
	if the squish of the wax effigy is unrecognizable:
		say "You're not sure it's a good idea to eat a wax effigy of nobody.";
		now BlobState is true;
		now the wax effigy is nowhere;
		The SickStomach in one turn from now;
		The BlobEndingHappens in three turns from now;
	otherwise:
		say "The wax squishes between your teeth. Yum.";
		
At the time when SickStomach:
	say "Your tummy begins to feel funny."

At the time when BlobEndingHappens:
	say "You start feeling funny all over. You look down and see your body seem to be liquefying. You are liquefying. Like the Wicked Witch of the west, you are melting. You start to panic. You try screaming, but your vocal cords stop working mid scream. It isn't long before you lose your sense of touch. The next thing you know you are a blob, of flesh or made wax. You are not sure? You could be a lump of clay for all you known. Regardless, you are a blob. A 'lifeless' blob well something. You can not talk. You can not fell. You can not move. You can not breath. Yet you are still conscious, still aware of your surroundings. You are stuck. You are trapped. And there nothing you can do about it.";
	end the story ;

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
		say "Oops. It's a little squished."
		
[You can't eat the wax effigy if it's unrecognizable (because it wouldn't work for the spell)]
Check eating the wax effigy:
	if the squish of the wax effigy is unrecognizable:
		say "You're not sure it's a good idea to eat a wax effigy of nobody.";
		now BlobState is true;
	otherwise:
		say "The wax squishes between your teeth. Yum.";
		
Instead of examining the wax effigy:
	say "[if the squish of the wax effigy is unmarred]The wax effigy looks familiar...you've never seen it before, but you can tell it's as good-looking as ever.[otherwise if the squish of the wax effigy is squished]The wax effigy looks a little squished, but you can still tell who it's supposed to be.[otherwise]The wax effigy is squished beyond recognition. Is it even still an effigy?[end if]";
	if the squish of the wax effigy is not unrecognizable:
		say "Careful, it seems fragile.";
		
instead of showing the wax effigy to someone:
	say "they look at it with a quizal look. they say to you, 'Yeah, that looks like me.'"

The Wizard is a man in the winding path. [The wizard is this here to tested the showing comand for now.]


Section 2 - Down The Rising Path

The Rising Path is west of the Glade.

Some Dragon Tree sap is a spell component.

Section 3 - Down The Upstream Path

The Upstream Path is north of the Glade.

A Mandrake root is a spell component.

Section 4 - Down The Downstream Path

The Downstream Path is south of the Glade.

Some mustard seed is a spell component.

Section 5 - Down The Widdershins Path

The Widdershins Path is northwest of the glade.

Some quicksilver is a spell component.

Section 6 - Fetched

Every turn when the player is in the Glade: if all spell components are off-stage, say "You have consumed the spell components and are ready to cast! The place is here, the time is now. You realize that laying upon the table will complete the spell, so you step on up."; now the player is on the Stone Table; say "You feel a dark energy surge through you. You see a shadowy form floating above you. You realize that this apparition is you — or rather, your 'fetch'.[paragraph break]You can feel the contents of your stomach roiling in agony; you slowly lose consciousness.";
 end the story;
