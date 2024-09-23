@implementation STBackgroundActivityVisualDescriptor(UIKitAccessors)

- (double)verticalOffset
{
  void *v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  objc_msgSend(a1, "verticalOffsetInPixels");
  return v5 / v4;
}

- (id)backgroundColor
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "backgroundColorRepresentation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UIColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)preferredVisualEffect
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "preferredVisualEffectName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (BSEqualStrings())
  {
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end
