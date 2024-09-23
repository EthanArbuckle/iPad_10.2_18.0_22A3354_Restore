@implementation PUSlideshowSettingsViewControllerSpec

- (id)newSpecChange
{
  return objc_alloc_init(PUSlideshowSettingsViewControllerSpecChange);
}

- (id)currentChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowSettingsViewControllerSpec;
  -[PUViewControllerSpec currentChange](&v3, sel_currentChange);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldShowNavigationBar
{
  return -[PUViewControllerSpec currentLayoutStyle](self, "currentLayoutStyle") != 4;
}

- (BOOL)shouldUseBlurredBackground
{
  return !UIAccessibilityIsReduceTransparencyEnabled()
      && -[PUViewControllerSpec currentLayoutStyle](self, "currentLayoutStyle") == 4;
}

- (UIColor)cellBackgroundColor
{
  if (-[PUSlideshowSettingsViewControllerSpec shouldUseBlurredBackground](self, "shouldUseBlurredBackground"))
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (UIColor)tableViewBackgroundColor
{
  if (-[PUSlideshowSettingsViewControllerSpec shouldUseBlurredBackground](self, "shouldUseBlurredBackground"))
    return (UIColor *)0;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (UIView)tableViewHeaderView
{
  void *v3;
  id v4;
  double v5;

  if (-[PUSlideshowSettingsViewControllerSpec shouldUseBlurredBackground](self, "shouldUseBlurredBackground"))
  {
    v3 = 0;
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[PUViewControllerSpec layoutReferenceSize](self, "layoutReferenceSize");
    v3 = (void *)objc_msgSend(v4, "initWithFrame:", 0.0, 0.0, v5, 44.0);
  }
  return (UIView *)v3;
}

- (unint64_t)rectEdgeForExtendedLayout
{
  if (-[PUSlideshowSettingsViewControllerSpec shouldUseBlurredBackground](self, "shouldUseBlurredBackground"))
    return 0;
  else
    return 15;
}

@end
