# Quantum Plex

An interactive fiction inspired by the original Half-Life, where you play as an engineer in an advanced government sponsored research facility.

## Overview

Quantum Plex is an Inform 7 interactive fiction game that builds on the ideas of quantum communication, and expand it onto an apocalypse scenario of an alien invasion, and efforts by many parties to keep this secret. It aims to provide an experience enjoyable to the masses, while raising public awareness of quantum technology.

## Playing Online

Play the latest release at: https://rcky844.github.io/Quantum-Plex

## Run the Game

1. Install [Inform 7](http://inform7.com/)
2. Install provided Inform 7 extensions in `extensions` folder:
```
# Exit Lister by Gavin Lambert
Exit Lister-v4.i7x

# A modified version of Keyword Interface by Aaron Reed
Modified Keyword Interface-v9.i7x
```
3. Open `plex.inform/story.ni` in the Inform 7 IDE
4. Click "Go!" to compile and test the game
5. (Optional) If you release the story again in Inform 7 and want to run it in a browser with custom text colors, add the following styles to the interpreter’s CSS file:
```
# Add to plex.materials/Release/interpreter/glkote.css
.Style_user1 {
  color: blue;
}

.Style_user2 {
  color: green;
}
```

## Project Structure

```
/plex.inform/story.ni       - Main story file
/plex.materials/            - Cover art and release materials
/docs/                      - Web release files for GitHub Pages
/entensions/                - Extension files used in this project
```

## Development

This game uses Inform 7 with the following extensions:
- Exit Lister by Gavin Lambert
- Modified (for compatibility) verson of Keyword Interface by Aaron Reed

## License

MIT license

## Credits

Created with Inform 7. Inspired by Valve's Half-Life.

Half-Life is a trademark of Valve Corporation. This project is a non-commercial fan work and is neither affiliated with, endorsed by, nor approved by Valve Corporation. It is created purely out of appreciation for the game and does not generate any profit. For any inquiries or concerns, please contact [the author](mailto:rcheung844@gmail.com).

