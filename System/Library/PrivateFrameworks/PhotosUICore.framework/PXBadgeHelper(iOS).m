@implementation PXBadgeHelper(iOS)

+ (UIImage)spatialBadgeImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[PXBadgeHelper systemImageNameForBadges:](PXBadgeHelper, "systemImageNameForBadges:", 0x20000000000);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXBadgeHelper smallSymbolConfiguration](PXBadgeHelper, "smallSymbolConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithSymbolConfiguration:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_tintedImageWithColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v7;
}

@end
