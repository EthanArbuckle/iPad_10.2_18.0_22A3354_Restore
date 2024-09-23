@implementation UIStatusBarRadarItemView

- (id)contentsImage
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;

  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "scale");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("_internal_radar_%ix.png"), (int)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB34D0];
  _UIKitResourceBundlePath(CFSTR("CarPlayArtwork.bundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", v5, v8);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = objc_msgSend(v9, "CGImage");
  objc_msgSend(v2, "scale");
  +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UILegibilityImageSet imageFromImage:withShadowImage:](_UILegibilityImageSet, "imageFromImage:withShadowImage:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)highlightImage
{
  void *v2;
  void *v3;
  void *v4;

  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "untintedImageNamed:", CFSTR("Home_Highlight"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UILegibilityImageSet imageFromImage:withShadowImage:](_UILegibilityImageSet, "imageFromImage:withShadowImage:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)extraRightPadding
{
  double v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIStatusBarRadarItemView;
  -[UIStatusBarItemView extraRightPadding](&v4, sel_extraRightPadding);
  return v2 + 1.0;
}

- (int64_t)buttonType
{
  return 1;
}

- (BOOL)usesAdvancedActions
{
  return 1;
}

@end
