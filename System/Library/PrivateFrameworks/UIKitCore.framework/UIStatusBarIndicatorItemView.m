@implementation UIStatusBarIndicatorItemView

- (id)contentsImage
{
  void *v3;
  void *v4;
  void *v5;

  -[UIStatusBarItemView item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indicatorName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIStatusBarItemView imageWithShadowNamed:](self, "imageWithShadowNamed:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityHUDRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIAccessibilityHUDItem *v7;

  -[UIStatusBarItemView item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indicatorName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityHUDImageNamed:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:scaleImage:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:scaleImage:", 0, v6, 1, 0.0, 0.0, 0.0, 0.0);
  return v7;
}

@end
