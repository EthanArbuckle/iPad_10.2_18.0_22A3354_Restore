@implementation MTPodcast(Artwork)

+ (BOOL)isImageCachedForPodcastUuid:()Artwork
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[MTImageStore defaultStore](MTImageStore, "defaultStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageUrlForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 != 0;
}

+ (id)artworkForPodcastUuid:()Artwork size:triggerDownload:
{
  id v10;
  void *v11;
  void *v12;

  v10 = a5;
  +[MTImageStore defaultStore](MTImageStore, "defaultStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageForKey:size:", v10, a2, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    if (a6)
      objc_msgSend(a1, "downloadArtworkForPodcastIfNeeded:successCallback:", v10, 0);
    objc_msgSend(a1, "_defaultPlaceholderArtworkWithSize:", a2, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (void)fetchArtworkForPodcastUuid:()Artwork size:completion:
{
  id v10;
  id v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[4];
  id location;

  v10 = a5;
  v11 = a6;
  if (v11)
  {
    objc_initWeak(&location, a1);
    objc_msgSend(a1, "_imageFetchQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__MTPodcast_Artwork__fetchArtworkForPodcastUuid_size_completion___block_invoke;
    block[3] = &unk_1EA0C5690;
    v14 = v10;
    v16[1] = *(id *)&a2;
    v16[2] = *(id *)&a3;
    v16[3] = a1;
    objc_copyWeak(v16, &location);
    v15 = v11;
    dispatch_async(v12, block);

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }

}

+ (void)asyncDiskArtworkForPodcastUuid:()Artwork size:completion:
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v10 = a5;
  v11 = a6;
  +[MTImageStore defaultStore](MTImageStore, "defaultStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageUrlForKey:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (a2 >= a3)
      a3 = a2;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __69__MTPodcast_Artwork__asyncDiskArtworkForPodcastUuid_size_completion___block_invoke;
    v15[3] = &unk_1EA0C56B8;
    v16 = v11;
    objc_msgSend(v12, "asyncImageForKey:squareDimension:cacheKeyModifier:completionHandler:", v10, 0, v15, a3);

  }
  else
  {
    objc_msgSend(a1, "_defaultPlaceholderArtworkWithSize:", a2, a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v11 + 2))(v11, v14);

  }
}

+ (void)downloadArtworkForPodcastIfNeeded:()Artwork successCallback:
{
  id v6;
  void (**v7)(void *, uint64_t);
  void (**v8)(void *, uint64_t);
  void *v9;
  _QWORD v10[4];
  void (**v11)(void *, uint64_t);

  v6 = a3;
  v7 = a4;
  if (v7)
    v8 = v7;
  else
    v8 = (void (**)(void *, uint64_t))&__block_literal_global_8;
  if (objc_msgSend(a1, "isImageCachedForPodcastUuid:", v6))
  {
    v8[2](v8, 1);
  }
  else
  {
    +[MTSingleton sharedInstance](MTImageDownloader, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72__MTPodcast_Artwork__downloadArtworkForPodcastIfNeeded_successCallback___block_invoke_2;
    v10[3] = &unk_1EA0C5720;
    v11 = v8;
    objc_msgSend(v9, "downloadImageForPodcastUuid:userInitiated:backgroundFetch:callback:", v6, 1, 0, v10);

  }
}

- (id)artworkWithSize:()Artwork
{
  void *v6;
  void *v7;
  void *v8;

  v6 = (void *)objc_opt_class();
  objc_msgSend(a1, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "artworkForPodcastUuid:size:triggerDownload:", v7, 1, a2, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)fetchArtworkWithSize:()Artwork completion:
{
  id v8;
  void *v9;
  id v10;

  v8 = a5;
  v9 = (void *)objc_opt_class();
  objc_msgSend(a1, "uuid");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchArtworkForPodcastUuid:size:completion:", v10, v8, a2, a3);

}

+ (id)_defaultPlaceholderArtworkWithSize:()Artwork
{
  void *v4;
  void *v5;

  +[MTImageStore defaultStore](MTImageStore, "defaultStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageForKey:size:", *MEMORY[0x1E0D7F340], a1, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_imageFetchQueue
{
  if (_imageFetchQueue_onceToken != -1)
    dispatch_once(&_imageFetchQueue_onceToken, &__block_literal_global_8);
  return (id)_imageFetchQueue_queue;
}

+ (id)colorFromHexString:()Artwork
{
  void *v0;
  void *v1;
  int v3;

  v3 = 0;
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scanHexInt:", &v3);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", (double)BYTE2(v3) / 255.0, (double)BYTE1(v3) / 255.0, (double)v3 / 255.0, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
