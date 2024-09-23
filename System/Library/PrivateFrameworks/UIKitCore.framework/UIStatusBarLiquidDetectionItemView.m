@implementation UIStatusBarLiquidDetectionItemView

- (id)contentsImage
{
  void *v2;
  void *v3;
  void *v4;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage _kitImageNamed:withTrait:](UIImage, "_kitImageNamed:withTrait:", CFSTR("Item_LiquidDetection"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UILegibilityImageSet imageFromImage:withShadowImage:](_UILegibilityImageSet, "imageFromImage:withShadowImage:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityHUDRepresentation
{
  void *v2;
  UIAccessibilityHUDItem *v3;

  +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("Item_LiquidDetection"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:scaleImage:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:scaleImage:", 0, v2, 1, 0.0, 0.0, 0.0, 0.0);
  -[UIAccessibilityHUDItem setFlattenImage:](v3, "setFlattenImage:", 0);

  return v3;
}

@end
