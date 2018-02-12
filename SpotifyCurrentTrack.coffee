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
  bottom: 10px
  left: 10px
  color: #fff

  .some-class
    font-family: Helvetica Neue
    font-size: 30px
    font-weight: 100
    text-shadow: 0 1px 5px #000000;
"""

render: (output) -> """
	<div class="some-class">#{output}</div>
"""