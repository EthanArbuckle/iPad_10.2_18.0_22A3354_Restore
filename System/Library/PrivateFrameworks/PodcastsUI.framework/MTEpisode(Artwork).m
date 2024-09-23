@implementation MTEpisode(Artwork)

+ (uint64_t)isImageCachedForEpisodeUuid:()Artwork
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  +[MTImageStore defaultStore](MTImageStore, "defaultStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageUrlForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0D7F258];
    objc_msgSend(MEMORY[0x1E0D7F218], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mainOrPrivateContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "podcastUuidForEpisodeUuid:ctx:", v3, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(MEMORY[0x1E0D7F258], "isImageCachedForPodcastUuid:", v10);
  }

  return v6;
}

+ (id)artworkForEpisodeUuid:()Artwork size:triggerDownload:
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v9 = a5;
  +[MTImageStore defaultStore](MTImageStore, "defaultStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageForKey:size:", v9, a1, a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = v11;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0D7F258];
    objc_msgSend(MEMORY[0x1E0D7F218], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mainOrPrivateContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "podcastUuidForEpisodeUuid:ctx:", v9, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D7F258], "artworkForPodcastUuid:size:triggerDownload:", v16, a6, a1, a2);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

+ (void)downloadArtworkIfNeededForEpisodeUuid:()Artwork successCallback:
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void *)MEMORY[0x1E0D7F258];
  v6 = (void *)MEMORY[0x1E0D7F218];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mainOrPrivateContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "podcastUuidForEpisodeUuid:ctx:", v8, v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D7F258], "downloadArtworkForPodcastIfNeeded:successCallback:", v11, v7);
}

- (id)artworkWithSize:()Artwork
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  +[MTImageStore defaultStore](MTImageStore, "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageForKey:size:", v7, a2, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0D7F258];
    objc_msgSend(a1, "podcastUuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "artworkForPodcastUuid:size:triggerDownload:", v11, 1, a2, a3);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (uint64_t)playStatusImage
{
  return objc_msgSend(a1, "playStatusImageForTheme:", 0);
}

- (id)playStatusImageForTheme:()Artwork
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(a1, "playState");
  if (v5 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "halfPlayedIconForTheme:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (v5 == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "unplayedIconForTheme:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(a1, "isPartiallyPlayedBackCatalogItem"))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "backCatalogPartiallyPlayedIconForTheme:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(a1, "isBackCatalogItem"))
      objc_msgSend(MEMORY[0x1E0DC3870], "backCatalogIconForTheme:", v4);
    else
      objc_msgSend(MEMORY[0x1E0DC3870], "playedIcon");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (id)playStatusImageForDarkBackground:()Artwork
{
  uint64_t v5;
  void *v6;

  v5 = objc_msgSend(a1, "playState");
  if (v5 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "halfPlayedIconForDarkBackground:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v5 == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "unplayedIconForDarkBackground:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(a1, "isPartiallyPlayedBackCatalogItem"))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "backCatalogPartiallyPlayedIconForDarkBackground:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(a1, "isBackCatalogItem"))
      objc_msgSend(MEMORY[0x1E0DC3870], "backCatalogIconForDarkBackground:", a3);
    else
      objc_msgSend(MEMORY[0x1E0DC3870], "playedIcon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

@end
