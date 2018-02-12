command: """
IFS='|' read -r theArtist theName theArt playerState <<<"$(osascript <<<'tell application "Spotify"
		set theTrack to current track
		set theArtist to artist of theTrack
		set theName to name of theTrack
		set theArt to artwork url of theTrack
		set playerState to player state

		return theArtist & "|" & theName & "|" & theArt & "|" & playerState
	end tell')"

spotifyDisplay="<p class="now-playing">Now Playing:</p><div class="track-record"><img src="$theArt"><div class="song-details"><p>$theArtist <br />$theName</p></div></div>"
spotifyOff=""

output=$([ "$playerState" == "playing" ] && echo "$spotifyDisplay" || echo "$spotifyOff")
echo $output

"""

refreshFrequency: 2000

style: """
  bottom: 20px
  right: 30px
  color: #fff
  font-family: "SF Pro Display", Helvetica Neue
  text-shadow: 0 1px 5px #333;

  p
	  margin:0

  .track-record
	  font-size: 24px
	  line-height:1.1
	  font-weight: 300
	  display: table
  .now-playing
	  margin-bottom:0.2em
	  font-size:0.85em
  .some-class img
	  max-height:2.2em;
	  display:table-cell
	  padding-right:0.4em
  .song-details
	  display:table-cell
	  vertical-align:top

"""

render: (output) -> """
	<div class="some-class">#{output}</div>
"""