@implementation UIStatusBarHomeItemView

- (double)extraRightPadding
{
  return 8.0;
}

- (id)contentsImage
{
  void *v2;
  void *v3;
  void *v4;

  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "untintedImageNamed:", CFSTR("Home"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UILegibilityImageSet imageFromImage:withShadowImage:](_UILegibilityImageSet, "imageFromImage:withShadowImage:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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

- (int64_t)buttonType
{
  return 0;
}

- (BOOL)usesAdvancedActions
{
  return 1;
}

- (BOOL)extendsHitTestingFrame
{
  return 1;
}

@end
