@implementation UIPopoverButtonLegacyVisualProvider

- (id)_setupBackgroundView
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIPopoverButtonLegacyVisualProvider;
  -[UIButtonLegacyVisualProvider _setupBackgroundView](&v6, sel__setupBackgroundView);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContentsCenter:", 0.5, 0.0, 0.0, 1.0);

  }
  return v3;
}

@end
