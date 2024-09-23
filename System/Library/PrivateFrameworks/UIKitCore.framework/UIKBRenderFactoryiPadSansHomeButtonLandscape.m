@implementation UIKBRenderFactoryiPadSansHomeButtonLandscape

- (CGPoint)iPadFudgeControlKeyOffset
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    -[UIKBRenderFactoryiPadSansHomeButton iPadFudgeControlKeyOffset](&v5, sel_iPadFudgeControlKeyOffset);
  }
  else
  {
    v4 = 11.0;
    v3 = 13.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)symbolImageControlKeyOffset
{
  _BOOL4 v3;
  double v4;
  double v5;
  objc_super v6;
  CGPoint result;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  v4 = 13.0;
  v5 = 13.0;
  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    -[UIKBRenderFactoryiPadSansHomeButton symbolImageControlKeyOffset](&v6, sel_symbolImageControlKeyOffset, 13.0, 13.0);
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (double)controlKeyFontSize
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 20.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    -[UIKBRenderFactoryiPadSansHomeButton controlKeyFontSize](&v5, sel_controlKeyFontSize, 20.0);
  }
  return result;
}

- (double)keyCornerRadius
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 8.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    -[UIKBRenderFactoryiPadSansHomeButton keyCornerRadius](&v5, sel_keyCornerRadius, 8.0);
  }
  return result;
}

- (double)stringKeyFontSize
{
  double result;
  objc_super v4;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v4.receiver = self;
    v4.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    -[UIKBRenderFactoryiPadSansHomeButton stringKeyFontSize](&v4, sel_stringKeyFontSize);
  }
  else
  {
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", 27.0);
  }
  return result;
}

- (double)symbolImageControlKeyFontSize
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 24.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    -[UIKBRenderFactoryiPadSansHomeButton symbolImageControlKeyFontSize](&v5, sel_symbolImageControlKeyFontSize, 24.0);
  }
  return result;
}

- (double)dualStringKeyBottomFontSize
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 28.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    -[UIKBRenderFactoryiPadSansHomeButton dualStringKeyBottomFontSize](&v5, sel_dualStringKeyBottomFontSize, 28.0);
  }
  return result;
}

- (CGPoint)dualStringKeyBottomTextOffset
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    -[UIKBRenderFactoryiPadSansHomeButton dualStringKeyBottomTextOffset](&v5, sel_dualStringKeyBottomTextOffset);
  }
  else
  {
    v4 = 11.0;
    v3 = 0.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)dualStringKeyTopFontSize
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 31.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    -[UIKBRenderFactoryiPadSansHomeButton dualStringKeyTopFontSize](&v5, sel_dualStringKeyTopFontSize, 31.0);
  }
  return result;
}

- (CGPoint)dualStringKeyTopTextOffset
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    -[UIKBRenderFactoryiPadSansHomeButton dualStringKeyTopTextOffset](&v5, sel_dualStringKeyTopTextOffset);
  }
  else
  {
    v4 = -11.0;
    v3 = 0.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)bottomRowDefaultFontSize
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 24.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    -[UIKBRenderFactoryiPad bottomRowDefaultFontSize](&v5, sel_bottomRowDefaultFontSize, 24.0);
  }
  return result;
}

- (double)fontSizeAdjustmentForNonAlphanumericKeycaps
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 6.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    -[UIKBRenderFactoryiPad fontSizeAdjustmentForNonAlphanumericKeycaps](&v5, sel_fontSizeAdjustmentForNonAlphanumericKeycaps, 6.0);
  }
  return result;
}

- (double)fallbackFontSize
{
  double result;
  objc_super v4;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v4.receiver = self;
    v4.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    -[UIKBRenderFactoryiPad fallbackFontSize](&v4, sel_fallbackFontSize);
  }
  else
  {
    -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", 28.0);
  }
  return result;
}

- (double)messagesTypeKeyplanSwitchKeyFontSize
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 22.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadSansHomeButtonLandscape;
    -[UIKBRenderFactoryiPad messagesTypeKeyplanSwitchKeyFontSize](&v5, sel_messagesTypeKeyplanSwitchKeyFontSize, 22.0);
  }
  return result;
}

- (UIEdgeInsets)dynamicInsets
{
  _BOOL4 v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v2 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  if (v2)
    v3 = 4.0;
  else
    v3 = 7.0;
  if (v2)
    v4 = 4.0;
  else
    v4 = 8.0;
  v5 = 0.0;
  v6 = 0.0;
  result.right = v4;
  result.bottom = v3;
  result.left = v6;
  result.top = v5;
  return result;
}

- (double)dynamicBottomRowMultiplier
{
  _BOOL4 v2;
  double result;

  v2 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 1.115;
  if (v2)
    return 1.08;
  return result;
}

@end
