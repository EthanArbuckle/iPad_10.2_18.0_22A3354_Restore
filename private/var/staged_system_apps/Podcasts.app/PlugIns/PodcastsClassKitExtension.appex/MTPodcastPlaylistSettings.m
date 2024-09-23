@implementation MTPodcastPlaylistSettings

- (void)setNeedsUpdate:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned int v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings playlist](self, "playlist"));
  v6 = objc_msgSend(v5, "needsUpdate");

  v7 = (unint64_t)-[MTPodcastPlaylistSettings flags](self, "flags");
  if (((((v7 & 2) == 0) ^ v3) & 1) == 0)
  {
    v8 = v3 | v6;
    v9 = 2;
    if (!v3)
      v9 = 0;
    -[MTPodcastPlaylistSettings setFlags:](self, "setFlags:", v7 & 0xFFFFFFFFFFFFFFFDLL | v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings playlist](self, "playlist"));
    objc_msgSend(v10, "setNeedsUpdate:", v8);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings playlistIfDefault](self, "playlistIfDefault"));
    LODWORD(v10) = objc_msgSend(v11, "needsUpdate");

    v12 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcastPlaylistSettings playlistIfDefault](self, "playlistIfDefault"));
    objc_msgSend(v12, "setNeedsUpdate:", v3 | v10);

  }
}

- (BOOL)needsUpdate
{
  return ((unint64_t)-[MTPodcastPlaylistSettings flags](self, "flags") >> 1) & 1;
}

@end
