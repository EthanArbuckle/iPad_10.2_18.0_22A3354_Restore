@implementation UIKBRenderFactoryiPhoneChocoLandscape

- (double)stringKeyFontSize
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 20.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneChocoLandscape;
    -[UIKBRenderFactoryiPhone stringKeyFontSize](&v5, sel_stringKeyFontSize, 20.0);
  }
  return result;
}

- (double)assistKeyFontSize
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 14.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneChocoLandscape;
    -[UIKBRenderFactoryiPhone assistKeyFontSize](&v5, sel_assistKeyFontSize, 14.0);
  }
  return result;
}

- (double)moreKeyFontSize
{
  return 16.0;
}

- (double)moreABCKeyFontSize
{
  return 14.0;
}

- (CGPoint)returnKeyOffset
{
  _BOOL4 v2;
  double v3;
  double v4;
  CGPoint result;

  v2 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  v3 = -0.5;
  if (!v2)
    v3 = -1.0;
  v4 = 0.0;
  result.y = v3;
  result.x = v4;
  return result;
}

- (CGPoint)internationalKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = -0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dictationKeyOffset
{
  _BOOL4 v2;
  double v3;
  double v4;
  CGPoint result;

  v2 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (!v2)
  {
    v3 = 0.0;
    v4 = -1.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)more123KeyOffset
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v3 = 0.5;
    v4 = 0.0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneChocoLandscape;
    -[UIKBRenderFactoryiPhoneLandscape more123KeyOffset](&v5, sel_more123KeyOffset);
  }
  result.y = v3;
  result.x = v4;
  return result;
}

- (CGPoint)moreABCKeyOffset
{
  _BOOL4 v2;
  double v3;
  double v4;
  CGPoint result;

  v2 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (v2)
  {
    v3 = 0.0;
    v4 = -0.5;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)realEmojiKeyOffset
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneChocoLandscape;
    -[UIKBRenderFactoryiPhone realEmojiKeyOffset](&v5, sel_realEmojiKeyOffset);
  }
  else
  {
    v4 = -0.5;
    v3 = 0.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)undoKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = -0.5;
  v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)leftArrowKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.5;
  v3 = -0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)rightArrowKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 1.5;
  v3 = -0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dismissKeyOffset
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

- (UIEdgeInsets)wideShadowPaddleInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  UIEdgeInsets result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v3 = 4.0;
    v4 = 28.0;
    v5 = 6.0;
    v6 = 18.0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKBRenderFactoryiPhoneChocoLandscape;
    -[UIKBRenderFactoryiPhoneLandscape wideShadowPaddleInsets](&v7, sel_wideShadowPaddleInsets);
  }
  result.right = v3;
  result.bottom = v4;
  result.left = v5;
  result.top = v6;
  return result;
}

- (UIEdgeInsets)wideShadowPopupMenuInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
    v2 = 28.0;
  else
    v2 = 22.0;
  v3 = 18.0;
  v4 = 6.0;
  v5 = 8.0;
  result.right = v5;
  result.bottom = v2;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)variantSymbolFrameInsets
{
  _BOOL4 v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v2 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  v3 = 4.5;
  if (v2)
    v3 = -7.0;
  v4 = 7.5;
  if (!v2)
    v4 = -1.5;
  v5 = 0.0;
  v6 = 0.0;
  result.right = v6;
  result.bottom = v4;
  result.left = v5;
  result.top = v3;
  return result;
}

- (CGPoint)variantSymbolTextOffset
{
  _BOOL4 v2;
  double v3;
  double v4;
  CGPoint result;

  v2 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  v3 = 1.0;
  if (!v2)
    v3 = 2.0;
  v4 = 0.0;
  result.y = v3;
  result.x = v4;
  return result;
}

- (CGPoint)popupSymbolTextOffset
{
  _BOOL4 v2;
  double v3;
  double v4;
  CGPoint result;

  v2 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  v3 = -7.0;
  if (!v2)
    v3 = -6.0;
  v4 = 0.0;
  result.y = v3;
  result.x = v4;
  return result;
}

- (double)popupFontSize
{
  double result;
  objc_super v4;

  if (!-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
    return 46.0;
  v4.receiver = self;
  v4.super_class = (Class)UIKBRenderFactoryiPhoneChocoLandscape;
  -[UIKBRenderFactoryiPhoneLandscape popupFontSize](&v4, sel_popupFontSize);
  return result;
}

- (BOOL)isTallPopup
{
  return 1;
}

- (UIEdgeInsets)dynamicInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
    v2 = 8.0;
  else
    v2 = 4.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 2.0;
  result.right = v5;
  result.bottom = v2;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)dynamicBottomRowMultiplier
{
  _BOOL4 v2;
  double result;

  v2 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 0.1;
  if (v2)
    return 0.125;
  return result;
}

- (UIEdgeInsets)dynamicInsetsForNumberOfRows:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  _BOOL4 v8;
  double v9;
  UIEdgeInsets result;

  if (a3 > 4)
  {
    v8 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
    v4 = 0.0;
    if (v8)
      v6 = 1.0;
    else
      v6 = 0.0;
    if (v8)
      v9 = 2.0;
    else
      v9 = 1.0;
    v3 = 0.0;
    if (a3 == 5)
    {
      v5 = v9;
    }
    else
    {
      v3 = 0.0;
      v5 = v6;
    }
    if (a3 == 5)
      v6 = v9;
  }
  else
  {
    -[UIKBRenderFactoryiPhoneChocoLandscape dynamicInsets](self, "dynamicInsets");
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)lightKeycapsFontName
{
  if (-[UIKBRenderFactory boldTextEnabled](self, "boldTextEnabled"))
    return CFSTR(".PhoneKeyCaps");
  else
    return CFSTR(".KeycapsB-Keys");
}

- (double)_row4ControlSegmentWidthLeft
{
  return 0.315;
}

@end
