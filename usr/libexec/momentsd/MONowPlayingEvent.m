@implementation MONowPlayingEvent

- (MONowPlayingEvent)initWithNowPlayingEvent:(id)a3 name:(id)a4 isRemote:(BOOL)a5 deviceSource:(id)a6 timestamp:(double)a7
{
  id v12;
  id v13;
  id v14;
  MONowPlayingEvent *v15;
  MONowPlayingEvent *v16;
  void *v17;
  unsigned int v18;
  NSString *bundleID;
  uint64_t v20;
  uint64_t v21;
  NSString *album;
  uint64_t v23;
  NSString *artist;
  uint64_t v25;
  NSString *genre;
  uint64_t v27;
  NSString *title;
  uint64_t v29;
  NSString *mediaType;
  uint64_t v31;
  NSString *iTunesStoreIdentifier;
  objc_super v34;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v34.receiver = self;
  v34.super_class = (Class)MONowPlayingEvent;
  v15 = -[MONowPlayingEvent init](&v34, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a4);
    v16->_isRemote = a5;
    objc_storeStrong((id *)&v16->_deviceSource, a6);
    v16->_timestamp = a7;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleID"));
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.NanoMusic"));

    if (v18)
    {
      bundleID = v16->_bundleID;
      v16->_bundleID = (NSString *)CFSTR("com.apple.Music");
    }
    else
    {
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleID"));
      bundleID = v16->_bundleID;
      v16->_bundleID = (NSString *)v20;
    }

    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "album"));
    album = v16->_album;
    v16->_album = (NSString *)v21;

    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "artist"));
    artist = v16->_artist;
    v16->_artist = (NSString *)v23;

    v16->_duration = objc_msgSend(v12, "duration");
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "genre"));
    genre = v16->_genre;
    v16->_genre = (NSString *)v25;

    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "title"));
    title = v16->_title;
    v16->_title = (NSString *)v27;

    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mediaType"));
    mediaType = v16->_mediaType;
    v16->_mediaType = (NSString *)v29;

    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "iTunesStoreIdentifier"));
    iTunesStoreIdentifier = v16->_iTunesStoreIdentifier;
    v16->_iTunesStoreIdentifier = (NSString *)v31;

    v16->_playbackState = (unint64_t)objc_msgSend(v12, "playbackState");
  }

  return v16;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isRemote
{
  return self->_isRemote;
}

- (NSString)deviceSource
{
  return self->_deviceSource;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (unint64_t)playbackState
{
  return self->_playbackState;
}

- (NSString)album
{
  return self->_album;
}

- (NSString)artist
{
  return self->_artist;
}

- (unsigned)duration
{
  return self->_duration;
}

- (NSString)genre
{
  return self->_genre;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (NSString)iTunesStoreIdentifier
{
  return self->_iTunesStoreIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iTunesStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_deviceSource, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
