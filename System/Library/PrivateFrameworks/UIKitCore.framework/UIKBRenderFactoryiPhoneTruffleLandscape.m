@implementation UIKBRenderFactoryiPhoneTruffleLandscape

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
    v5.super_class = (Class)UIKBRenderFactoryiPhoneTruffleLandscape;
    -[UIKBRenderFactoryiPhone stringKeyFontSize](&v5, sel_stringKeyFontSize, 20.0);
  }
  return result;
}

- (double)moreABCKeyFontSize
{
  return 14.0;
}

- (double)moreKeyFontSize
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 16.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneTruffleLandscape;
    -[UIKBRenderFactoryiPhone moreKeyFontSize](&v5, sel_moreKeyFontSize, 16.0);
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
    v5.super_class = (Class)UIKBRenderFactoryiPhoneTruffleLandscape;
    -[UIKBRenderFactoryiPhone assistKeyFontSize](&v5, sel_assistKeyFontSize, 14.0);
  }
  return result;
}

- (double)symbolImageControlKeyFontSize
{
  _BOOL4 v2;
  double result;

  v2 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 19.0;
  if (v2)
    return 20.0;
  return result;
}

- (CGPoint)stringKeyOffset
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v3 = 0.0;
    v4 = 1.3333;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneTruffleLandscape;
    -[UIKBRenderFactoryiPhone stringKeyOffset](&v5, sel_stringKeyOffset);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)returnKeyOffset
{
  _BOOL4 v2;
  double v3;
  double v4;
  CGPoint result;

  v2 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  v3 = -1.3333;
  if (!v2)
    v3 = -0.6666;
  v4 = 0.0;
  result.y = v3;
  result.x = v4;
  return result;
}

- (CGPoint)internationalKeyOffset
{
  _BOOL4 v2;
  double v3;
  double v4;
  CGPoint result;

  v2 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  v3 = -0.3333;
  v4 = 0.0;
  if (v2)
    v4 = -0.3333;
  result.y = v3;
  result.x = v4;
  return result;
}

- (CGPoint)deleteKeyOffset
{
  _BOOL4 v2;
  double v3;
  double v4;
  CGPoint result;

  v2 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  v3 = -0.6;
  if (v2)
    v3 = -0.3333;
  v4 = 0.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)dictationKeyOffset
{
  _BOOL4 v2;
  double v3;
  double v4;
  CGPoint result;

  v2 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  v3 = -0.3333;
  if (v2)
    v3 = 0.0;
  v4 = v3;
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
    v3 = *MEMORY[0x1E0C9D538];
    v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPhoneTruffleLandscape;
    -[UIKBRenderFactoryiPhoneLandscape more123KeyOffset](&v5, sel_more123KeyOffset);
  }
  result.y = v4;
  result.x = v3;
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
    v4 = 0.6666;
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
    v5.super_class = (Class)UIKBRenderFactoryiPhoneTruffleLandscape;
    -[UIKBRenderFactoryiPhone realEmojiKeyOffset](&v5, sel_realEmojiKeyOffset);
  }
  else
  {
    v3 = 0.0;
    v4 = -0.3333;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)cutKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = -0.3333;
  v3 = 0.3333;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)copyKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = -0.3333;
  v3 = 0.0;
  result.y = v2;
  result.x = v3;
  return result;
}

- (CGPoint)pasteKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.3333;
  v3 = -0.6666;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)boldKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = -0.6666;
  v3 = 0.0;
  result.y = v2;
  result.x = v3;
  return result;
}

- (CGPoint)undoKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
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

  v2 = -0.3333;
  v3 = -0.6666;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)rightArrowKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.6666;
  v3 = -0.6666;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dismissKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.6666;
  v3 = 0.0;
  result.y = v2;
  result.x = v3;
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
  v3 = 4.3333;
  if (v2)
    v3 = -11.0;
  v4 = 9.0;
  if (!v2)
    v4 = -3.0;
  v5 = 0.0;
  v6 = 0.0;
  result.right = v6;
  result.bottom = v4;
  result.left = v5;
  result.top = v3;
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
    v4 = 29.0;
    v5 = 6.0;
    v6 = 18.0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKBRenderFactoryiPhoneTruffleLandscape;
    -[UIKBRenderFactoryiPhoneLandscape wideShadowPaddleInsets](&v7, sel_wideShadowPaddleInsets);
  }
  result.right = v3;
  result.bottom = v4;
  result.left = v5;
  result.top = v6;
  return result;
}

- (UIEdgeInsets)variantPaddedFrameInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  UIEdgeInsets result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v3 = 0.0;
    v4 = -5.0;
    v5 = 5.0;
    v6 = 0.0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKBRenderFactoryiPhoneTruffleLandscape;
    -[UIKBRenderFactoryiPhoneLandscape variantPaddedFrameInsets](&v7, sel_variantPaddedFrameInsets);
  }
  result.right = v6;
  result.bottom = v4;
  result.left = v3;
  result.top = v5;
  return result;
}

- (CGPoint)variantSymbolTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  v2 = 0.0;
  v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)variantAnnotationTextOffset
{
  BOOL v3;
  double v4;
  double v5;
  objc_super v6;
  CGPoint result;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  v4 = 4.0;
  v5 = 4.0;
  if (!v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIKBRenderFactoryiPhoneTruffleLandscape;
    -[UIKBRenderFactoryiPhoneLandscape variantAnnotationTextOffset](&v6, sel_variantAnnotationTextOffset, 4.0, 4.0);
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)popupSymbolTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  v2 = 0.0;
  v3 = -6.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)popupFontSize
{
  _BOOL4 v2;
  double result;

  v2 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 46.0;
  if (v2)
    return 38.0;
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
    v2 = 7.0;
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
    -[UIKBRenderFactoryiPhoneTruffleLandscape dynamicInsets](self, "dynamicInsets");
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
    return CFSTR(".KeycapsA-Keys");
}

- (double)_row4ControlSegmentWidthLeft
{
  return 0.3;
}

@end
