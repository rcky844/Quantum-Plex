"Quantum Plex" by "Ricky Cheung"

Include Exit Lister by Gavin Lambert.
Include Modified Keyword Interface by Aaron Reed.

Release along with an interpreter.

A thing has some text called printing. The printing of a thing is usually "blank".
Understand the command "read" as something new. Understand "read [something]" as reading. Reading is an action applying to one thing, requiring light. Check reading: if the printing of the noun is "blank", say "Nothing is written on [the noun]." instead. Carry out reading: say "You read: [printing of the noun][line break]". Report reading: do nothing.

The player has a number called health. The player has health 100.
A good-ending is a truth state that varies. Good-ending is false.

When play begins:
	now every scenery thing is keyworded;
	now the left hand status line is "[location]";
	now the right hand status line is "Health: [health of player]".

[Light switch]
A light-switch is a kind of device.
A light-switch is scenery. It is fixed in place.
A light-switch has a room called target-room.

After deciding the scope of something:
	repeat with S running through light-switches in the location:
		place S in scope.

Carry out switching on a light-switch:
    now the target-room of the noun is lighted;
    say "You flip the switch. The lights come on.";

Carry out switching off a light-switch:
    now the target-room of the noun is dark;
    say "You flip the switch. The lights go out.";

Understand "switch" as switching on.
Rule for supplying a missing noun while switching on:
	if there is a device in the location:
		now the noun is a random device in the location;
	otherwise:
		if location is dark:
			say "You fumble in the dark but find nothing to turn on." instead;
		otherwise:
			say "There are nothing for you to turn on, silly!" instead.

Rule for printing the description of a dark room:
	say "It is pitch dark. You can't see a thing. Perhaps there is a light [italic type]switch[roman type].";

Part - Opening

Intro is a scene.
Intro begins when play begins.
Intro played is a truth state that varies.
Intro ends when intro played is true.

When Intro begins:
	say "You awoke in the gray confines of a facility. In your memory, the machine flashed intensely with white light before a deafening explosion knocked you out.  When you turned your head towards the machine, alien creatures was walking out of the bright qubit.
	
	The Quantum Plex manager, Mr David Alpin, asked all staff to evacuate over the megaphone. Though you had not grasp the reason for the test's failure, nor the cause of the white light, you knew the truth will manifest as you escape the facility.
	
	Press any key to continue[line break]";
	wait for any key;
	now intro played is true.

The player is in Experimental Lab.

Part - Maximal Confusion

[Experimental Lab]

Experimental Lab is a room. "You stood in the Experimental Lab. Tempered glass protects you from the glowing machine, where otherworldly noises is emanating from, but thick smoke obscures your view. A [table] is placed neatly in front, with a [computer] placed next to it."

A table is a scenery in Experimental Lab.
The description is "A wooden table with items neatly arranged. You don't recall placing any there."

A map is a thing on table in Experimental Lab.
The description is "The map appears to be soiled with some sticky liquid, showing the geography of continental USA. It has targets for the White House and Quantum Plex, with illegible handwriting."

A book is a thing on table in Experimental Lab.
The description is "A thick hard cover booklet, or is it a manual?"
The printing of the book is "This is the introductory guide to new staff at the Quantum Plex, an advanced research facility specialized to deliver mankind with simplified quantum technology. We were recently contracted by the US government to build a new quantum transmission device..."
After reading book:
	if the player does not carry the book:
		say "The book seems important, I will take it";
		try taking the book.

A muffin is a thing on table in Experimental Lab.
The description is "A delicious looking muffin."
Muffin eaten is a truth state that varies.
A muffin is edible. After eating the muffin:
	say "Delicious muffins are a lie.";
	now muffin eaten is true.

A computer is a scenery in Experimental Lab.
"Vintage looking beige box with a monochrome CRT display, which repeats the evacuation command."

An access card is a thing in computer.
The description is "Plastic card with my name and photo on it."
After examining access card, try taking the access card.

The Machine Chamber is a room south of the Experimental Lab.
Instead of going to Machine Chamber in the Experimental Lab:
	if good-ending is false:
		say "Your body instinctively jumps back when you try to head here, the machine seems to affect your muscles.";
	otherwise:
		continue the action.

The portrait is a thing in Experimental Lab. It is fixed in place.
The description of the portrait is "A portrait of the president of Quantum Plex hung on the wall, under which spelled a motivational quote."
After examining the portrait:
	say "Looking closer, you notice the figure's eyes seem to follow you around the room."

The lab door is a locked door. It is a scenery.
It is north of Experimental Lab and south of Hallway South.
The lab door is unlocked by the access card.

Before going to Hallway South from Experimental Lab:
	if the player does not carry the access card:
		say "The door is locked. You remember the plex switching to a contactless authentication system." instead;
	if the player do not carry the book:
		say "You think: It appears I have missed something in [the location]. Let me go back and check." instead;
	otherwise:
		continue the action.

After going to Hallway South from Experimental Lab:
	unless good-ending is true:
		now the lab door is locked;
		now the lab door is closed;
		say "The door to the Experimental Lab locks behind you with a heavy thunk.";
		try looking.

[Hallway South]

Hallway South is a room. "The start of a sterile white hallway with flickering emergency lights and numerous doors. Evacuation signs point in multiple directions.

It is filled with [choking air] here, perhaps from the ventilation system. You wonder whoever called for ventilation to be connected with the machine chamber."

Before unlocking lab door with something in Hallway South:
	stop the action.

The choking air is a scenery in Hallway South. It is fixed in place.
The description is "The choking air feels burning."
The choking air has a number called damage counter. The damage counter of the choking air is 0.
Every turn:
	if the player is in Hallway South:
		increase the damage counter of the choking air by 1;
		if the damage counter of the choking air is 2:
			unless the protective mask is worn by the player:
				decrease the health of the player by 10;
				say "The choking air burns your lungs!";
			now the damage counter of the choking air is 0;
			if the health of the player is 0:
				say "You collapse from the choking air. WASTED!";
				end the story.
After going to Hallway South:
	now the choking air is a scenery in Hallway South;
	continue the action.

The equipment door is a door. It is a scenery. It is east of Hallway South and west of Equipment Bay.
The equipment door is lockable and unlocked.

The control door is a locked door. It is a scenery.
It is west of Hallway South and east of Control Room.
The control door is unlocked by the key.

Before going to Hallway Central from Hallway South:
	if David-trigger is false:
		say "Perhaps I am going too fast?";
		stop the action;
	otherwise:
		continue the action.

[Equipment Bay]

Equipment Bay is a dark room.
"A damp room filled with maintenance gear, you see a prominent [noticeboard]."

The equipment switch is a light-switch in Equipment Bay.
The target-room of the equipment switch is the Equipment Bay.

The protective mask is a thing in the Equipment Bay. It is wearable.
The description is "A snug respirator mask marked with 'LEVEL 3' rating. It could probably fend off the choking air."
After wearing the protective mask:
	say "You pull the mask over your face. The filters hum softly.";

The mop is a thing in the Equipment Bay.
The description is "A cleaning apparatus, looks a bit worn out, do I need that?"

The flashlight is a thing in the Equipment Bay.
The description is "Lights up the surrounding area, that's it."

The glowing star is a thing in the Equipment Bay.
The description is "How did this get here?"

The repair box is a thing in the Equipment Bay.
The description is "Toolkit to fix anything and everything, guessing except that machine."

The key is a thing in the Equipment Bay.
The description is "A bronze key ."

The noticeboard is a scenery in the Equipment Bay.
The description is "Large brown board with several dozen sticky notes."
The printing of the noticeboard is "[line break]
1) Read your guide every day to be the master![line break]
2) God damn that quantum communication machine was difficult to build![line break]
3) It's just two days away from the test, the manager seems less than excited though.[line break]
4) Been kicked out the control room! Just wanted to clean it, but the manager wants no one in there."
After reading noticeboard:
	say "How strange! You don't recall any of these being here, but they line up with your perception of this workplace.";
	now the printing of the book is "... Quantum transmission technology is highly secure, and have low rates of failure. However, a fundamental flaw of our machine is observed when strong light is shined through the system, causing unintended failures and possibly a fire given enough light energy, due to the use of flammable materials in the machine.";

After going to Hallway South from Equipment Bay:
	try looking;
	say "I should move faster, the sound of monsters grew louder.";

Part - Short-lived Discovery

[Control Room]

Control Room is a room.
"Down another hallway lies the control room, a windowless chamber crammed with many flickering [terminal] machines, the humming heart of Quantum Plex. At the front of the room is a large [display] of current mission status. The consoles repeated the alerts of Mr David Alpin to evacuate."

Control door locked is a truth state that varies. 
Before going to Hallway South from Control Room:
	if control door locked is true:
		say "The door is locked. Talk to Alpin about this.";
		stop the action;
	otherwise:
		continue the action.

After going to Hallway South from Control Room:
	try looking.

The terminal is a scenery in Control Room.
The description is "Most terminals displayed a map of the globe, but some showed numbers overlayed. You were sure these are radar displays showing where the communication targets were, and the sheer number of dots representing the numbers was surprising. You made a note of it inside the [book] in the hopes that they will help later."

After examining the terminal:
	now the printing of the book is "My handwriting of the numbers, 1378.";

After reading the book when the printing of the book is "My handwriting of the numbers, 1378.":
	now the player-knows-security-code is true;

The display is a scenery in Control Room.
The description is "Massive edge-to-edge panel showing the status of the machine. Even after destruction, the machine is still going strong? It is reporting a healthy status for the experiment..."
After examining the display:
	now control door locked is true;
	say "Suddenly, the only exit door shut on itself. Somebody walked from behind.";
	now David-trigger is true.

David Alpin is a man.
The description of Mr David Alpin is "The Quantum Plex manager looks shaken, his suit streaked with soot and his ID badge hanging crooked."

David Arrival is a scene.
David Arrival begins when David-trigger is true.
David Arrival ends when David Arrival has happened for one turn.

David-trigger is a truth state that varies.
David-trigger is false.

When David Arrival begins:
	now David Alpin is in Control Room;
	say "You spin around. Alpin stands by the sealed door, lowering a keycard. 'I had to lock it,' he says quietly. 'Whatever you saw in that [machine] chamber, it's only the beginning. We wanted to protect our staff from the [italic type]experiment[roman type], but it seems you were left in here.'[paragraph break](Use 'ask Alpin about <something>' to ask)";

Instead of asking David Alpin about something:
	if player is not carrying glowing star:
		say "Looking at you without the glowing star, you won't survive long in these harsh conditions. I have brought you one, take it.";
		now the player carries the glowing star;
	otherwise:
		repeat through Table of Alpin's Commentary:
			if player's command includes topic entry:
				say "[commentary entry][paragraph break]";
				if the topic understood matches "classified/contract":
					now control door locked is false;
					say "Alpin unlocked the door, was that too easy?";
				rule succeeds;
		say "'I cannot,' Alpin says softly."

Table of Alpin's Commentary
topic	commentary
"machine/experiment"	"'That communicator was never meant to be safe,' Alpin says. 'The [italic type]government[roman type] pushed us to full power before we understood what we were opening.'"
"government"	"'The [italic type]contract[roman type] was [italic type]classified[roman type],' Alpin admits. 'You were never supposed to know the Pentagon was directing our tests.'"
"classified/contract"	"'You really think I could tell you more about it?' Alpin questioned. 'Fine, but you need to go discover the truth yourself, it's in a one of our document rooms, but stay safe out there...'"

[Hallway Central]

Hallway Central is a room. It is north of Hallway South.
The description is "Central part of the hallway leading to many routes. It has an impressive display of a [glowing orb]."
After going to Hallway Central:
	now the choking air is a scenery in Hallway Central;
	if good-ending is true:
		now Hallway North is north of Hallway Central;
		now Hallway Central is south of Hallway North;
		say "You noticed the barricade blocking off Hallway North is now open.";
	continue the action.

The glowing orb is a scenery in Hallway Central. It is fixed in place. It is lit.
The description is "An attractive orb that is pulsating against the white walls of the hallway."
After examining the glowing orb:
	say "The orb appeared to pulse a message to my mind.";
	if player is carrying glowing star:
		say "'Oh look at you with that glowing star,' the orb said. 'You humans look so silly trying to understand my kind.'";
		now Hallway West is west of Hallway Central;
		now Hallway Central is east of Hallway West;
		say "Hallway West has been unlocked";
	otherwise:
		say "'Looks like you are back here too early!' the orb said.[paragraph break]You were teleported back to Hallway South by magic.";
		now the player is in Hallway South.

Part - Security Junction

[Hallway West]

Hallway West is a room.
The description is "The west wing of the facility looks eerily quiet, with calm and clear air. A pair of inactive [cameras] is hung on the ceiling, and a reinforced [security door] to the north bears the plex's logo and an unfamiliar government seal."

The cameras are scenery in Hallway West.
The description of the cameras is "Surveillance units with tiny lenses that no longer glow. Either the power is failing, or someone shut them off on purpose."

The security door is a door. It is a scenery. It is north of Hallway West and south of Briefing Room.
The security door is lockable and locked.
The description of the security door is "A heavy composite door with no handle, just a numerical keypad to [italic type]enter/type[roman type] codes and a small display. A faint light blinks beside the panel where successful codes would be confirmed."

The player-knows-security-code is a truth state that varies. The player-knows-security-code is false.
Keypad-entering is an action applying to one topic.
Understand "enter [text]" or "type [text]" as keypad-entering.

Check keypad-entering:
	if the player is not in Hallway West:
		say "There is no keypad here to enter a code into." instead;
	if the Security Door is not locked:
		say "The door is already unlocked." instead;
	if player-knows-security-code is false:
		say "You have no idea what code to try. Maybe there's a hint somewhere in your notes or that [book]." instead.

Carry out keypad-entering:
	let T be the topic understood;
	if T matches the text "1378":
		now the Security Door is unlocked;
		say "You carefully type [T] on the keypad. A green light flashes, and you hear the lock disengage inside the door." instead;
	else:
		say "You key in [T], but the keypad gives a sour beep and the display flashes RED. That code isn't accepted." instead.

The fallen ceiling tile is a thing in Hallway West.
The description of the fallen ceiling tile is "A cracked composite ceiling tile that lies on the floor, probably shaken loose by the earlier explosion. A faint trickle of dust is seen drifting down from the exposed gap above."
After examining the fallen ceiling tile, say "Through the gap you glimpse bundled wires filling the ceiling to the brim, reminding you how little barrier there is between you and the facility's machinery."

[Briefing Room]
Briefing Room is a room.
"The Briefing Room is set up like a small lecture theatre: rows of [chairs] face a [projector screen] along with a [control panel]. The room is still filled with content of some staff briefing, as if the evacuation froze the atmosphere. A digital [notice] on the wall still displays the last scheduled session."

The chairs are scenery in Briefing Room.
The description of the chairs is "Standard-issue plastic seats with thin padding. Each [italic type]nameplate[roman type] show assigned staff from different departments: optics, cryptography, 'exo‑linguistics'... that last one makes you uneasy."

After examining the chairs:
	now the printing of the book is "Due to the nature of the mission, we cannot convoy as to the purpose for constructing such a secure and complicated communication machine; but we would like to dedicate this section to disprove all rumors of the involvement of aliens..."

The player has an object called current identity. The current identity of the player is nothing.
A nameplate is a kind of thing. A nameplate is wearable.

The optics nameplate is a nameplate in the chairs.
The description is "Nameplate for staff assigned to the role: 'optics'"

After examining the optics nameplate:
	now the printing of the book is "The transmission module of the machine requires precise optical alignment. Any deviations may result in possible eavesdropping. The lasers emit a phase-modulated signal at 1550 nm...";

The cryptography nameplate is a nameplate in the chairs.
The description is "Nameplate for staff assigned to the role: 'cryptography'"

After examining the cryptography nameplate:
	now the printing of the book is "We perform encryption system using the BB84 protocol. It ensures security of data transmissions and prevents eavesdropping by allowing both the transmitter and receiver to detect it.";

The exo‑linguistics nameplate is a nameplate in the chairs.
The description is "Nameplate for staff assigned to the role: 'exo‑linguistics'"

After examining the exo‑linguistics nameplate:
	if muffin eaten is true:
		now the printing of the book is "The muffin is a lie." instead;
	otherwise:
		now the printing of the book is "Roles in our advanced research facility includes optics, cryptography, translators, etc." instead.

Instead of wearing a nameplate:
	if the player is wearing a nameplate:
		say "You can only harbour one identity, don't be silly!";
	otherwise:
		now the current identity of the player is the noun;
		continue the action.

The projector screen is scenery in Briefing Room.
The description is "A wide matte screen currently showing slide [current slide number]. The title reads '[current slide title]'.[line break][current slide text]"

The current slide number is a number that varies. The current slide number is 1.

To decide what text is the current slide title:
	choose row with slide number of current slide number in the Table of Briefing Slides;
	decide on the slide title entry.

To decide what text is the current slide text:
	choose row with slide number of current slide number in the Table of Briefing Slides;
	decide on the slide text entry.

Table of Briefing Slides
slide number	slide title	slide text
1	"QUANTUM LIAISON PROGRAM – PHASE III"	"• Project Codename: 'Prometheus'
• Objective: Establish two-way quantum transmission with non-terrestrial intelligence[line break]
• Status: GREEN (Final testing phase)[line break]
• Lead Investigator: Dr. R. Chen[line break]
• Government Liaison: CLASSIFIED[line break]
[paragraph break]Press 'next' to continue."
2	"COMMUNICATION PROTOCOL"	"• Frequency modulation: 47.3 GHz (civilian band masked)[line break]
• Message encoding: Hybrid quantum-classical cipher[line break]
• Response window: 8-12 seconds[line break]
• Fail-safe: Automatic shutdown if no handshake detected[line break]
[paragraph break]NOTE: Previous fail-safes proved ineffective. See addendum."
3	"PHASE III TIMELINE"	"• Day 1-10: Calibration and baseline tests[line break]
• Day 11-20: First contact simulation[line break]
• Day 21: LIVE CONTACT (T-minus 2 days from today)[line break]
• Day 22-25: Response analysis[line break]
• Day 26+: Negotiation protocols (if applicable)[line break]
[paragraph break]DO NOT DEVIATE FROM SCHEDULE"
4	"SAFETY PARAMETERS"	"• Machine chamber enclosed in Faraday cage[line break]
• Quartz viewport for optical observation[line break]
• Fire suppression: Halon system (ACTIVE)[line break]
• Personnel evacuation: Automated on critical alert[line break]
[paragraph break]Risk assessment: ACCEPTABLE"
5	"INITIAL RESPONSE LOGS"	"MESSAGE RECEIVED (Day 20, 14:37 UTC):[line break]
'We have long waited for your kind to reach this threshold. The stars align. We are ready.'[line break]
[paragraph break]Analyst notes: Transmission clear. No degradation. Incredibly fast response time (0.3 seconds). Investigating source location now..."
6	"URGENT - ADDENDUM"	"CRITICAL DISCOVERY: Source location does not match expected stellar coordinates. Multiple signals detected simultaneously across three continents. POSSIBLE MASS TRANSMISSION EVENT.
[paragraph break]RECOMMENDATION: ABORT PHASE III
[paragraph break]STATUS: OVERRULED by senior administration."

The projector control panel is scenery in Briefing Room.
The description of the projector control panel is "A small black panel with two buttons: one labelled 'PREV' and one labelled 'NEXT'. A small LED indicator glows faintly with the current slide number."

Understand "next" as next slide.
Understand "prev" or "previous" as previous slide.

Next slide is an action applying to nothing.
Previous slide is an action applying to nothing.

Carry out next slide:
	if the current slide number is 6:
		say "You're already on the final slide.";
	otherwise:
		increase the current slide number by 1;
		try examining projector screen.

Carry out previous slide:
	if the current slide number is 1:
		say "You're already on the first slide.";
	otherwise:
		decrease the current slide number by 1;
		try examining projector screen.

Check next slide:
	if the player is not in Briefing Room:
		say "You need to be in the briefing room to use the projector.";
		stop the action.

Check previous slide:
	if the player is not in Briefing Room:
		say "You need to be in the briefing room to use the projector.";
		stop the action.

The briefing notice is a thing in Briefing Room.
The description of the briefing notice is "A wall-mounted display listing internal events. Someone has scratched a question mark on the notice display."
The printed name of the briefing notice is "digital notice".
The printing of the briefing notice is "Emergency review: Contact Protocol – attendance mandatory for senior staff only.
Contact Protocol briefings are restricted to security‑cleared personnel. All discussion of non‑human correspondents remains classified under federal statute.";

After reading the briefing notice, say "You are stunned by the words of 'non‑human correspondents'. Who are they? Where are they from? What do they want?"

[Hallway West Extension]

Hallway West Extension is a room. It is west of Hallway West.
"The corridor narrows, it's packed with exposed conduit and humming cable runs here. A single [maintenance hatch] sits low on the north wall."

The maintenance hatch is a locked door. It is a scenery.
The maintenance hatch is north of Hallway West Extension and south of Service Crawlspace.

Service Crawlspace is a dark room.
"The cramped service crawlspace is full of bundled cables and rusted pipework. It's barely tall enough to crouch in, but it might offer more access around the facility."

Instead of examining the maintenance hatch when maintenance hatch is locked:
	say "Up close, the hatch's panel is slightly bent, but the bolts are still firmly in place. Looks like you need something sturdy, perhaps tools from that [repair box], could allow you to force it open.";

Instead of opening the maintenance hatch when the maintenance hatch is locked and the player does not carry the repair box:
	say "You tug at the hatch, but the lock holds. Without some kind of heavy tool, it won't budge.";

Instead of opening the maintenance hatch when the maintenance hatch is locked and the player carries the repair box:
	now the maintenance hatch is unlocked;
	now the maintenance hatch is open;
	say "With your maintenance tools, the hatch crackles open without budging, revealing a narrow crawlspace beyond.";
	if the player carry the mop:
		say "You poke the mop through the hatch and manage to flip a switch inside. You heard mechanisms shifting, as if a distant door or barrier has changed state.";
		now Hallway East is east of Hallway Central;
		now Hallway Central is west of Hallway East;
	otherwise:
		say "There appears to be a switch in there, but your hand is not long enough to reach it.";
		now the maintenance hatch is locked;
		now the maintenance hatch is closed;
		say "You closed the hatch as precaution, so you won't get caught."

Part - Bob the Lab Tech

[Hallway East]

Hallway East is a room.

Bob Dylan is a man in Hallway East.
The description is "A weathered old man in a faded lab coat, his eyes look sharp and calculating. You only know him as the 'lab tech' here."

Bob Meeting is a scene.
Bob Meeting begins when the player is in Hallway East.
Bob Meeting ends when Bob Meeting has happened for one turn.

When Bob Meeting begins:
	if the current identity of the player is nothing:
		say "'I don't know who you are,' Bob says flatly. 'Come back when you've figured out your role here.'[paragraph break]You were teleported back to Hallway Central by magic.";
		now the player is in Hallway Central;
	otherwise if the current identity of the player is the optics nameplate:
		say "'Ah, optics,' Bob nods knowingly. 'You understand the alignment problem, then. The calibration was sabotaged, I'm certain of it.'[paragraph break]He walked back, calling you to come on and fix the optics of the machine.";
		now the player is in the Machine Chamber;
	otherwise if the current identity of the player is the cryptography nameplate:
		say "'Cryptography, hm? Then you should know the BB84 protocol is compromised. Someone has the decryption key.'[paragraph break]He walked back, calling you to come on and fix the encryption of the machine.";
		now the player is in the Machine Chamber;
	otherwise if the current identity of the player is the exo-linguistics nameplate:
		say "'Exo-linguistics...' Bob lowers his voice. 'You're one of the few who know our receiver. They're not friendly, and they're not far.'[paragraph break]'Who are they?' You pulled a confused face. 'You know I am always forgetful, so excuse me for not remembering.'[paragraph break]He walked back, calling you to come on into the Situation Room. 'I will tell you more in a better location.'";
		now the player is in the Situation Room;

[Situation Room]

Situation Room is a dark room.
The description is "A room with a noticeboard, lined with what looks to be many, many months of work to research the happenings behind the US government."

The situation switch is a light-switch in Situation Room.
The target-room of the situation switch is the Situation Room.

Bob Explain is a scene.
Explain played is a truth state that varies.
Bob Explain begins when player is in Situation Room.
Bob Explain ends when explain played is true.

When Bob explain begins:
	now Bob Dylan is in the Situation Room;
	try switching on the situation switch;
	say "Bob leads you into the Situation Room and locks the door behind you. He gestures to the walls covered in research notes and intercepted communications.[paragraph break]
	'You see, the government has been in contact with them for years—the aliens,' Bob begins, his voice low. 'The Quantum Plex was never about secure communication for humans. It was a beacon, built to open a gateway for the aliens to enter our world. The test failure was no accident—it was a cover for the real transmission.'[paragraph break]
	He shows you a series of documents that outline a secret treaty: in exchange for advanced technology, the government agreed to allow the aliens to establish a presence on Earth. The 'non-human correspondents' from the briefing slides were the other party.[paragraph break]Press any key to continue[paragraph break]";
	wait for any key;
	say "'I was part of the team that built the machine,' Bob confesses. 'They kept the truth away from me, so I've been working from the shadows to gather evidence so as to sabotage the project. I need your help to destroy the machine before the portal opens permanently.'[paragraph break]
	'What can I do?' You expressed your concerns. 'I am just one nobody and now you want me to stop an entire army?'[paragraph break]
	'Well, I have a D-day plan ready just for this,' Bob picked out a special document, and explained the details. 'I need you to enter the worm hole that was opened by the machine, and defeat the invading non-human correspondents...'[paragraph break]Press any key to continue[paragraph break]";
	wait for any key;
	say "You finally got to know the reason for this place, now you need to be the one to stop them. But first, you need some armour.";
	now explain played is true;
	now Hallway East is west of Situation Room;
	now Situation Room is east of Hallway East;
	now good-ending is true.

Part - Retaliation (or destruction)

[Hallway North]

Hallway North is a room.
The description of Hallway North is "The north corridor appears to be an armoury, full of protective gear and lethal equipment. The air smells dense and heavy."

The quantum suit is a thing in Hallway North. It is wearable.
The description is "A sleek silver bodysuit embedded with glowing circuitry. It looks to be powered with advanced quantum computing and vision technology. Wearing this seems like a very bad idea, but also the only idea you have."
After wearing the quantum suit:
	say "You slip into the quantum suit. The helmet show you the status of your surroundings. Then, you feel an odd tingling sensation.  But undeniably, you are now armored with cutting-edge military technology.";
	now the player is wearing the quantum suit.

The plasma lance is a thing in Hallway North.
The description is "A sleek weapon with a crystalline core that crackles with energy. It's labelled with Chinese characters you can't quite read: '質子束槍' - a proton beam gun."

The failsafe device is a thing in Hallway North.
The description is "A small metal box with a big red button bearing the label: 'QUANTUM WORMHOLE FAILSAFE - FOR EMERGENCY USE ONLY.' Whatever it does, it may be important."

After taking something in Hallway North:
	say "You feel your calling now lies back at the [italic type]Machine Chamber[roman type].";
	now the lab door is unlocked.

[Machine Chamber]

Description of the Machine Chamber is "The massive machine, the heart of the plex, dominates the chamber—a towering framework of humming conduits and wiring[if the current identity of the player is the optics nameplate], their optical systems scorched and misaligned[otherwise if the current identity of the player is the cryptography nameplate], their encryption nodes sparking with failed calculations[otherwise if the current identity of the player is the exo-linguistics nameplate], their communication arrays still resonating with alien frequencies[end if]. Scorched panels and melted components suggest a catastrophic failure. Despite the destruction, the machine's core still pulse with an otherworldly light."

The chamber-events is a scene.
Chamber played is a truth state that varies. Chamber played is false.
The chamber-events begins when player is in Machine Chamber.
The chamber-events ends when chamber played is true.

When the chamber-events begins:
	if the current identity of the player is nothing:
		rule succeeds;
	now Bob Dylan is in the Machine Chamber;
	if the current identity of the player is the exo-linguistics nameplate:
		now the wormhole portal is in Machine Chamber;
		say "You stare into the swirling vortex. Your instincts scream at you to turn away, but you know what must be done.[paragraph break](Use 'enter portal')";
	otherwise:
		say "'Let's get working fixing the machine,' Bob says calmly and invitingly. 'so we can complete our mission for the government.'[paragraph break]
		You worked tirelessly for an unknown amount of days, [if the current identity of the player is the optics nameplate]carefully calibrating the optics back to the current frequency.[otherwise if the current identity of the player is the cryptography nameplate]replacing the leaky cryptography module.[end if] Strangely, the smoke inside the chamber was all gone when you got there.[paragraph break]
		Press any key to continue[paragraph break]";
		wait for any key;
		say "Eventually, the machine hums to life. Bob nods approvingly. 'Perfect. Now, let's activate it.'[paragraph break]
		As the machine reaches full power, you realize too late what Bob has done. The quantum transmission completes. A voice, not human, resonates through the chamber: 'We have received the signal. The gateway is open. Thank you for your service, Doctor Dylan.'[paragraph break]
		You realized right then, the rumours were all true. The government wasn't trying to stop the aliens—they want them in, and you helped.[paragraph break]
		GAME OVER - ALIEN INVASION";
		end the story.

The wormhole portal is scenery. It is fixed in place.
The description is "The portal shimmers with otherworldly colors—overly vibrant colours of violets and greens. Through it, you hear the chorus of alien voices, and glimpses of a dimension not meant for human eyes. The gateway is clearly unstable, fluctuating as if something on the other side is trying to force it wider."

After examining the wormhole portal:
	say "You stare into the swirling vortex. The more you look, the more you feel it looking back. Your instincts scream at you to turn away, but you know what must be done.";
	if the player carries the plasma lance:
		say " At least you're armed.";
	if the player is wearing the quantum suit:
		say " The suit's circuitry pulses in response to the portal's energy."

Understand "enter portal" or "go through portal" as entering the wormhole.
Entering the wormhole is an action applying to nothing.

Check entering the wormhole:
	if the player is not in Machine Chamber:
		say "There is no portal here." instead;
	if the player is not wearing the quantum suit:
		say "Stepping into that portal unprotected would vaporize you instantly. You need proper protection." instead;
	if the player does not carry the plasma lance:
		say "You should arm yourself before stepping into an alien dimension." instead;
	if muffin eaten is true:
		say "As you approach the portal, you feel the muffin inside you begin to rumble. Reality seems to take on a strange, dreamlike quality..." instead;
	otherwise:
		continue the action.

Carry out entering the wormhole:
	now the player is in Alien Dimension

[Alien Dimension]

Alien Dimension is a room.
The description is "You stand in a space that defies geometry. The ground beneath your feet morphs between a crystal and a liquid. The sky—if it can be called that—flash with spectacular colours. Before you stands a towering alien entity, its form a mass of writhing tendrils and pulsating nodules. Its voice resonates not through sound, but directly into your mind.

'PATHETIC HUMAN. YOU HAVE CROSSED THE LINE. YOUR SPECIES WILL SOON BE DOOMED BY OUR HANDS.'

Several smaller alien entities circle you slowly, their movements predatory. You raise the plasma lance. The weapon responds to your intent, crackling with barely-contained fury.

What will you do? (Try 'attack aliens' or 'use failsafe')"

The aliens is a scenery in the Alien Dimension.

Alien Combat is a scene.
Alien Combat begins when the player is in Alien Dimension.
Alien Combat ends when alien-defeated is true.

The alien-defeated is a truth state that varies. The alien-defeated is false.
Round counter is a number that varies. Round counter is 0.

Every turn:
	if the player is in Alien Dimension and alien-defeated is false:
		increase round counter by 1;
		say "[paragraph break]--- Round [round counter] ---[paragraph break]";
		decrease the health of the player by 20;
		say "The aliens press their assault! Your health: [health of player][paragraph break]";
		if the health of the player is less than 1:
			say "Your vision fades to black. The last thing you hear is alien laughter echoing across dimensions.";
			say "[paragraph break]GAME OVER - DEFEATED BY THE ALIENS";
			end the story;
		if round counter is 1:
			say "The massive entity lashes out with tendrils that crackle with energy!";
		otherwise if round counter is 2:
			say "The smaller entities begin coordinating their attacks, moving in synchronized patterns!";
		otherwise if round counter is 3:
			say "You feel the fabric of reality beginning to tear around you. The gateway is opening wider!";
		otherwise if round counter is 4:
			say "The air itself seems to burn. You can't last much longer!".

Understand "attack [something]" as attacking.

Check attacking the aliens:
	if the player is not in Alien Dimension:
		say "There's nothing to attack here." instead;
	if the player does not carry the plasma lance:
		say "You need a weapon!" instead.

Instead of attacking the aliens:
	increase the health of the player by 10;
	if round counter is less than 3:
		say "You fire the plasma lance! The beam cuts through the alien formation, and one of the smaller entities dissolves into particle spray. The larger entity shrieks—a sound that vibrates your teeth.";
	otherwise if round counter is 3:
		say "You unleash everything the plasma lance has. The main entity recoils, its form fragmenting across multiple dimensions!";
	otherwise:
		say "You fire desperately, the plasma lance overheating in your hands. The beam finds the core of the massive entity. It convulses, shrieking an otherworldly cry.";
		if the health of the player is greater than 50:
			now alien-defeated is true;
			now puppet-ending is true.

[Puppet Ending]
The puppet-ending is a truth state that varies. The puppet-ending is false.

Puppet Ending is a scene.
Puppet Ending begins when puppet-ending is true.

When Puppet Ending begins:
	now David Alpin is in Alien Dimension;
	say "'Well done, you did not disappoint,' Alpin clapped his hands and walked through the portal as he said frantically. 'You actually managed to stabilize the gateway on your own.'[line break]
	'Stabilize?' you echo, still catching your breath. 'I destroyed their incursion. I shut it down.'[line break]
	Alpin smiles in a way that never reaches his eyes. 'Did you really think this was about stopping them?' he asks quietly. 'The Quantum Plex was never a shield. It was a tuning fork.'[line break]
	Behind him, the fractured remains of the alien entity begin to coalesce again, not as a towering monster but as a focused, pulsing core of light. Threads of energy run from the core to the surrounding void, like strings on a puppet.[paragraph break]Press any key to continue.[paragraph break]";
	wait for any key;
	say "'They were messy, unfocused,' Alpin continues. 'A chaotic presence. The higher-ups wanted something they could *aim*. You've trimmed away the excess. What remains is a purified signal. Contained. Controllable.'[line break]
	'You weren't fighting them,' he says, stepping closer. 'You were calibrating them.'[line break]
	You feel a cold weight settle in your stomach as the realization sets in. Every desperate blast of the plasma lance, every dodge, every moment you thought you were pushing them back—was data. Telemetry. Training.[paragraph break]Press any key to continue.[paragraph break]";
	wait for any key;
	say "'We couldn't risk our own people in the core,' Alpin goes on. 'Too visible. Too many questions. But you? A panicked staffer left behind in an evacuation? Perfect deniability. Disposable.'[line break]
	The luminous core flares, and for an instant you see thin strands of strings wrapping not just to Alpin, but to *you* as well—threaded through your suit, your weapon, your very nerves. When you flinch, the core shudders in perfect sync.[line break]
	'See?' Alpin gestures, delighted. 'Entanglement. They move when we move. They strike where we point. An off-world calls for us, we play along.'[paragraph break]Press any key to continue.[paragraph break]";
	wait for any key;
	say "'I won't help you,' you whisper.[line break]
	Alpin just laughs. 'You already did.' He raises a small remote, its surface etched with the same symbols that pulse inside the core. 'The contract is fulfilled. The Pentagon gets its weapon. Our friends get their bridge. And you...' He tilts his head, studying you. 'You get promoted.'[line break]
	Pain lances through your body as the quantum suit locks, every circuit firing at once. Your limbs seize, then move without your consent, mirroring the flick of Alpin's thumb across the remote. The core behind him ripples in exact unison, a marionette dancing to a single invisible hand.[line break]
	'Welcome to the program,' Alpin says softly. 'From now on, when they pull the strings, you'll make the world move.'[line break]
	The last thing you feel is the sensation of your own thoughts being filed, catalogued, and slotted into place—just another subsystem in someone else's weapon.[paragraph break]Press any key to continue.[paragraph break]";
	wait for any key;
	say "[paragraph break]GAME OVER – PUPPET ENDING";
	end the story.

[Failsafe Ending]

Understand "use failsafe" as using failsafe.
Using failsafe is an action applying to nothing.

Check using failsafe:
	if the player is not in Alien Dimension:
		say "There is no failsafe to use here." instead;
	if the player does not carry the failsafe device:
		say "You don't have the failsafe device!" instead.

Carry out using failsafe:
	say "You activate the failsafe device. It erupts into blinding blue light, a quantum pulse that spreads outward in all directions.[paragraph break]
	The alien entities scatter, their forms destabilizing in the interference. The massive central entity lets out a final, agonized cry as its cohesion fails.[paragraph break]
	'IMPOSSIBLE,' the voice echoes, fading. 'HOW... GATEWAY CLOSING...'[paragraph break]
	The wormhole collapses. Reality snaps back into focus. You're hurled backward through the collapsing portal, landing hard in Hallway North.";
	wait for any key;
	now the player is in Hallway North;
	now alien-defeated is true;
	say "As the portal implodes behind you, alarms blare throughout the facility. Emergency lights flash red. But you can hear something else: the sound of machinery powering down. The Quantum Plex's systems are shutting themselves down.";
	wait for any key;
	say "Days later, when the government finally finds you in the wreckage, you tell them nothing. The facility is destroyed. The machine is beyond repair. The portal is sealed. And somewhere in the research notes that survive, your name will be lost—a nobody who saved the world.";
	wait for any key;
	say "[paragraph break]GAME WON - THE GATEWAY IS SEALED";
	end the story.

[Muffin Ending]

Alien Dimension - Muffin Ending is a room.
The description is "As you step through the portal, you feel the muffin inside you activate. Reality becomes... silly.[paragraph break]
You find yourself floating in a void of swirling pastry crumbs and butterscotch. The alien entities approach, but they pause, confused. Their voices crackle through your mind:[paragraph break]
'WHAT... IS THIS SUBSTANCE?'

'IT DEFIES QUANTUM ANALYSIS.'

'IT TASTES LIKE... CHOCOLATE CHIP?'"

When play begins:
	if the player is in Alien Dimension - Muffin Ending:
		wait for any key;
		say "You begin to laugh. Not a nervous laugh, but genuine, uncontrollable laughter. As you laugh, the muffin's power spreads through your body.";
		wait for any key;
		say "Your form begins to expand and shift. You are no longer human. You are becoming... a muffin. A giant, terrifying, delicious muffin.";
		wait for any key;
		say "'NO,' the alien entity cries. 'THIS IS NOT POSSIBLE. WE CANNOT PARSE THIS. WE CANNOT—'";
		wait for any key;
		say "You eat them. All of them. The aliens, the dimension, the void itself.";
		wait for any key;
		say "[paragraph break]When you wake up, you're back in the Experimental Lab. The muffin is still on the table, untouched. The plex is still standing. No one remembers the aliens, the portal, or any of it.";
		wait for any key;
		say "But you remember.";
		wait for any key;
		say "And the muffin is still watching you.";
		say "[paragraph break]GAME WON? - MUFFIN ENDING";
		end the story.
