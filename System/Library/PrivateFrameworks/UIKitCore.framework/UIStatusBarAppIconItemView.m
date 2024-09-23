@implementation UIStatusBarAppIconItemView

- (id)_appBundleIdentifier
{
  return 0;
}

- (id)contentsImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIStatusBarAppIconItemView _appBundleIdentifier](self, "_appBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v3, 9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UILegibilityImageSet imageFromImage:withShadowImage:](_UILegibilityImageSet, "imageFromImage:withShadowImage:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)highlightImage
{
  void *v2;
  void *v3;
  void *v4;

  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "untintedImageNamed:", CFSTR("AppIcon_Highlight"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UILegibilityImageSet imageFromImage:withShadowImage:](_UILegibilityImageSet, "imageFromImage:withShadowImage:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
