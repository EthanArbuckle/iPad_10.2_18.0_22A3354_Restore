@implementation UIKBRenderFactory10Key_Landscape

- (UIEdgeInsets)wideShadowPaddleInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 18.0;
  v3 = 6.0;
  v4 = 22.0;
  v5 = 6.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGPoint)abcKeyTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)capitalAbcSymbolSize
{
  return 13.0;
}

- (CGPoint)longVowelSignKeyTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 8.0;
  v3 = 13.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)numberPadKeyPrimarySymbolSize
{
  return 18.5;
}

- (CGPoint)numberPadKeyPrimaryTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = -6.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)numberPadKeySecondaryTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 1.0;
  v3 = 8.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)numberPadVBarSecondaryTextOffset
{
  double v2;
  double v3;
  double v4;
  CGPoint result;

  -[UIKBRenderFactory scale](self, "scale");
  v2 = 8.5;
  if (v3 != 2.0)
    v2 = 9.0;
  v4 = 1.0;
  result.y = v2;
  result.x = v4;
  return result;
}

- (double)controlColumnWidthFactor
{
  return 0.114;
}

- (double)centerColumnWidthFactor
{
  return 0.875;
}

- (void)setupColumnLayoutSegmentsWithControlWidth:(double)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIKBRenderFactory10Key_Landscape;
  -[UIKBRenderFactory10Key setupColumnLayoutSegmentsWithControlWidth:](&v11, sel_setupColumnLayoutSegmentsWithControlWidth_);
  -[UIKBRenderFactory10Key_Landscape centerColumnWidthFactor](self, "centerColumnWidthFactor");
  v6 = v5 * a3;
  -[UIKBRenderFactory10Key_Round controlKeyTraits](self, "controlKeyTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setKeyStates:", 3);
  objc_msgSend(v8, "addLayoutRect:asTriangle:", 0, 0.5 - v6 * 0.5, 0.0, v6, 1.0);
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v8);
  -[UIKBRenderFactory10Key_Round activeControlKeyTraits](self, "activeControlKeyTraits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setKeyStates:", 4);
  objc_msgSend(v10, "addLayoutRect:asTriangle:", 0, 0.5 - v6 * 0.5, 0.0, v6, 1.0);
  -[UIKBRenderFactory addLayoutSegment:](self, "addLayoutSegment:", v10);

}

@end
