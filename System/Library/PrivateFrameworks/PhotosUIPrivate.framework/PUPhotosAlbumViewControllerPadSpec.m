@implementation PUPhotosAlbumViewControllerPadSpec

- (id)gridSpec
{
  return objc_alloc_init(PUPhotosGridViewControllerPadSpec);
}

- (int64_t)fullMomentsSectionHeaderStyle
{
  return 0;
}

- (double)contentCornerRadius
{
  void *v2;
  double v3;
  double v4;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "padAlbumCornerRadius");
  v4 = v3;

  return v4;
}

@end
