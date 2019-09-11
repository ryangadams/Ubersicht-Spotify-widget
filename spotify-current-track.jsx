import { styled, css } from "uebersicht";

export const command = "osascript Ubersicht-Spotify-widget/applescript.applescript"


export const refreshFrequency = 10000;

export const className = {
  bottom: "20px",
    right: "20px",
    width: "500px",
    color: "#fff",
    fontFamily: "SF Pro Display",
    fontSize: "14px"
}


const SpotifyWrapper = styled("div")`
    background: rgba(0,0,0,0.4);
    padding:5px;
`

{/* <div class="track-record"><img src="$theArt"><div class="song-details" /><p>$theArtist <br />$theName</p></div></div> */}

const BlockTitle = styled("p")`
margin:0 0 10px 0
`

const TrackWrapper = styled("div")`
    
    display: grid;
    grid-column-gap: 10px;
    grid-template-columns: 100px 3fr;
    grid-template-rows: auto 1fr auto;
    grid-template-areas:
        "img title"
        "img bd";
`

const ArtisNameBox = styled("h1")`
grid-area:title;
padding:0;
margin:0;
font-size:1.6em;
font-weight:normal;
`
const SongNameBox = styled("p")`
grid-area:bd;
margin:0;
font-size:1.4em;
`

const SongImage = styled("img")`
grid-area:img;
max-width:80px;`

// .media > .title { grid-area: title; }
// .media > .img { grid-area: img; }
// .media > .content { grid-area: bd; }
// .media > .footer { grid-area: ft; }

const Track = ({ArtUrl, ArtistName, SongName}) => {
    return <TrackWrapper>
        <ArtisNameBox>{ArtistName}</ArtisNameBox>
        <SongNameBox>{SongName}</SongNameBox>
        <SongImage src={ArtUrl}/>
    </TrackWrapper>
  }

export const render = ({output, error}) => {
  if (output == null) {
    return <div></div>;
  }
  var trackDetails = output.split("|");

  
  if (!trackDetails[3].trim().startsWith("playing")) {
    console.log(trackDetails[3]);
    return <div></div>;
  } else {

    return error ? (
      <SpotifyWrapper>Something went wrong with Spotify: <strong>{String(error)}</strong></SpotifyWrapper>
    ) : (
      <SpotifyWrapper><BlockTitle>Now Playing:</BlockTitle>
          <Track ArtUrl={trackDetails[2]} ArtistName={trackDetails[0]} SongName={trackDetails[1]}/>
      </SpotifyWrapper>
    );
  }
}