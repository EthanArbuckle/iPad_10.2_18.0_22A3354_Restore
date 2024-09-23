@implementation PUWallpaperCacheDirectoryURL

void __PUWallpaperCacheDirectoryURL_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "temporaryDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", CFSTR("WallpaperCache"), 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)PUWallpaperCacheDirectoryURL_cacheURL;
  PUWallpaperCacheDirectoryURL_cacheURL = v2;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v5 = objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", PUWallpaperCacheDirectoryURL_cacheURL, 1, 0, &v8);
  v6 = v8;

  if ((v5 & 1) == 0)
  {
    PLWallpaperGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v6;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "Failed to created Wallpaper cache directory, error: %{public}@", buf, 0xCu);
    }

  }
}

@end
