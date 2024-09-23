@implementation MTPodcastPlaylistSettings(DB)

- (void)setNeedsUpdate:()DB
{
  void *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(a1, "playlist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "needsUpdate");

  v7 = objc_msgSend(a1, "flags");
  if (((((v7 & 2) == 0) ^ a3) & 1) == 0)
  {
    v8 = a3 | v6;
    v9 = 2;
    if (!a3)
      v9 = 0;
    objc_msgSend(a1, "setFlags:", v7 & 0xFFFFFFFFFFFFFFFDLL | v9);
    objc_msgSend(a1, "playlist");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNeedsUpdate:", v8);

    objc_msgSend(a1, "playlistIfDefault");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v11, "needsUpdate");

    objc_msgSend(a1, "playlistIfDefault");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNeedsUpdate:", a3 | v10);

  }
}

- (unint64_t)needsUpdate
{
  return ((unint64_t)objc_msgSend(a1, "flags") >> 1) & 1;
}

@end
