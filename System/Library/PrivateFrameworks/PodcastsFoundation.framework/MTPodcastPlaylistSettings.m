@implementation MTPodcastPlaylistSettings

- (void)setNeedsUpdate:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  -[MTPodcastPlaylistSettings playlist](self, "playlist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "needsUpdate");

  v7 = -[MTPodcastPlaylistSettings flags](self, "flags");
  if (((((v7 & 2) == 0) ^ v3) & 1) == 0)
  {
    v8 = v3 | v6;
    v9 = 2;
    if (!v3)
      v9 = 0;
    -[MTPodcastPlaylistSettings setFlags:](self, "setFlags:", v7 & 0xFFFFFFFFFFFFFFFDLL | v9);
    -[MTPodcastPlaylistSettings playlist](self, "playlist");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNeedsUpdate:", v8);

    -[MTPodcastPlaylistSettings playlistIfDefault](self, "playlistIfDefault");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v11, "needsUpdate");

    -[MTPodcastPlaylistSettings playlistIfDefault](self, "playlistIfDefault");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNeedsUpdate:", v3 | v10);

  }
}

@end
