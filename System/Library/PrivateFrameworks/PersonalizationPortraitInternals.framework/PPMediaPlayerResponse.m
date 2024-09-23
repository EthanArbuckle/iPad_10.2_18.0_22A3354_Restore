@implementation PPMediaPlayerResponse

- (BOOL)isEqualToResponse:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  -[PPMediaPlayerResponse title](self, "title");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!(v5 | v6))
    goto LABEL_5;
  v7 = (void *)v6;
  LOBYTE(v8) = 0;
  if (!v5 || !v6)
    goto LABEL_25;
  v8 = objc_msgSend((id)v5, "isEqualToString:", v6);

  if (v8)
  {
LABEL_5:
    -[PPMediaPlayerResponse artist](self, "artist");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "artist");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v5 | v9)
    {
      v7 = (void *)v9;
      LOBYTE(v8) = 0;
      if (!v5 || !v9)
        goto LABEL_25;
      v8 = objc_msgSend((id)v5, "isEqualToString:", v9);

      if (!v8)
        goto LABEL_26;
    }
    -[PPMediaPlayerResponse album](self, "album");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "album");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v5 | v10)
    {
      v7 = (void *)v10;
      LOBYTE(v8) = 0;
      if (!v5 || !v10)
        goto LABEL_25;
      v8 = objc_msgSend((id)v5, "isEqualToString:", v10);

      if (!v8)
        goto LABEL_26;
    }
    -[PPMediaPlayerResponse bundleID](self, "bundleID");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleID");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!(v5 | v11))
    {
LABEL_8:
      -[PPMediaPlayerResponse playerID](self, "playerID");
      v5 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "playerID");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v5 | v12)
      {
        v7 = (void *)v12;
        LOBYTE(v8) = 0;
        if (v5 && v12)
          LOBYTE(v8) = objc_msgSend((id)v5, "isEqualToString:", v12);
      }
      else
      {
        v7 = 0;
        v5 = 0;
        LOBYTE(v8) = 1;
      }
      goto LABEL_25;
    }
    v7 = (void *)v11;
    LOBYTE(v8) = 0;
    if (v5 && v11)
    {
      v8 = objc_msgSend((id)v5, "isEqualToString:", v11);

      if (!v8)
        goto LABEL_26;
      goto LABEL_8;
    }
LABEL_25:

  }
LABEL_26:

  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
  objc_storeStrong((id *)&self->_artist, a3);
}

- (NSString)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_album, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setPlayerID:(id)a3
{
  objc_storeStrong((id *)&self->_playerID, a3);
}

- (NSNumber)storeItemID
{
  return self->_storeItemID;
}

- (void)setStoreItemID:(id)a3
{
  objc_storeStrong((id *)&self->_storeItemID, a3);
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned int)a3
{
  self->_state = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeItemID, 0);
  objc_storeStrong((id *)&self->_playerID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
