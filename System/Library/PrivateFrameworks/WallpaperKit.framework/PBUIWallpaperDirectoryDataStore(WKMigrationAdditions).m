@implementation PBUIWallpaperDirectoryDataStore(WKMigrationAdditions)

- (id)wk_wallpaperImageURLForVariant:()WKMigrationAdditions wallpaperMode:
{
  void *v7;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "wallpaperImageURLForVariant:wallpaperMode:", a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)wk_wallpaperOriginalImageURLForVariant:()WKMigrationAdditions wallpaperMode:
{
  void *v7;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "wallpaperOriginalImageURLForVariant:wallpaperMode:", a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)wk_wallpaperThumbnailURLForVariant:()WKMigrationAdditions wallpaperMode:
{
  void *v7;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "wallpaperThumbnailURLForVariant:wallpaperMode:", a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end
