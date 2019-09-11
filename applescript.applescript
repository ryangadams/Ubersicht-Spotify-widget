tell application "Spotify"
    set theTrack to "current track"
    set theArtist to artist of theTrack 
    set theName to name of theTrack 
    set theArt to artwork url of theTrack 
    set playerState to player state 
    return theArtist & "|" & theName & "|" & theArt & "|" & playerState 
end tell