@implementation UIKBRenderFactoryiPadLandscape

- (double)keyCornerRadius
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 7.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    -[UIKBRenderFactoryiPad keyCornerRadius](&v5, sel_keyCornerRadius, 7.0);
  }
  return result;
}

- (CGRect)shiftKeySymbolFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGRect result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    -[UIKBRenderFactoryiPad shiftKeySymbolFrame](&v7, sel_shiftKeySymbolFrame);
  }
  else
  {
    v6 = 23.0;
    v5 = 26.0;
    v3 = 0.0;
    v4 = 0.0;
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)dismissKeySymbolFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGRect result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    -[UIKBRenderFactoryiPad dismissKeySymbolFrame](&v7, sel_dismissKeySymbolFrame);
  }
  else
  {
    v3 = 0.0;
    v6 = 79.0;
    v5 = 83.0;
    v4 = 0.0;
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)stringKeyFontSize
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 27.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    -[UIKBRenderFactoryiPad stringKeyFontSize](&v5, sel_stringKeyFontSize, 27.0);
  }
  return result;
}

- (double)dualStringKeyFontSizeAdjustment
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = -5.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    -[UIKBRenderFactoryiPad dualStringKeyFontSizeAdjustment](&v5, sel_dualStringKeyFontSizeAdjustment, -5.0);
  }
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
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
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
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    -[UIKBRenderFactoryiPad fontSizeAdjustmentForNonAlphanumericKeycaps](&v5, sel_fontSizeAdjustmentForNonAlphanumericKeycaps, 6.0);
  }
  return result;
}

- (double)shiftKeyFontSize
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 20.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    -[UIKBRenderFactoryiPad shiftKeyFontSize](&v5, sel_shiftKeyFontSize, 20.0);
  }
  return result;
}

- (double)deleteKeyFontSize
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 17.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    -[UIKBRenderFactoryiPad deleteKeyFontSize](&v5, sel_deleteKeyFontSize, 17.0);
  }
  return result;
}

- (double)moreKeyFontSize
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 22.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    -[UIKBRenderFactoryiPad moreKeyFontSize](&v5, sel_moreKeyFontSize, 22.0);
  }
  return result;
}

- (double)internationalKeyFontSize
{
  double result;
  objc_super v4;

  if (!-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
    return 39.0;
  v4.receiver = self;
  v4.super_class = (Class)UIKBRenderFactoryiPadLandscape;
  -[UIKBRenderFactoryiPad internationalKeyFontSize](&v4, sel_internationalKeyFontSize);
  return result;
}

- (double)dictationKeyFontSize
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 25.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    -[UIKBRenderFactoryiPad dictationKeyFontSize](&v5, sel_dictationKeyFontSize, 25.0);
  }
  return result;
}

- (double)spaceKeyFontSize
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 22.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    -[UIKBRenderFactoryiPad spaceKeyFontSize](&v5, sel_spaceKeyFontSize, 22.0);
  }
  return result;
}

- (double)dismissKeyFontSize
{
  double result;
  objc_super v4;

  if (!-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
    return 47.0;
  v4.receiver = self;
  v4.super_class = (Class)UIKBRenderFactoryiPadLandscape;
  -[UIKBRenderFactoryiPad dismissKeyFontSize](&v4, sel_dismissKeyFontSize);
  return result;
}

- (double)smallKanaKeyFontSize
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 18.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    -[UIKBRenderFactoryiPad smallKanaKeyFontSize](&v5, sel_smallKanaKeyFontSize, 18.0);
  }
  return result;
}

- (double)emailDotKeyFontSize
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 12.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    -[UIKBRenderFactoryiPad emailDotKeyFontSize](&v5, sel_emailDotKeyFontSize, 12.0);
  }
  return result;
}

- (double)facemarkKeyFontSize
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 28.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    -[UIKBRenderFactoryiPad facemarkKeyFontSize](&v5, sel_facemarkKeyFontSize, 28.0);
  }
  return result;
}

- (double)zhuyinFirstToneKeyFontSize
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 22.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    -[UIKBRenderFactoryiPad zhuyinFirstToneKeyFontSize](&v5, sel_zhuyinFirstToneKeyFontSize, 22.0);
  }
  return result;
}

- (double)symbolImageControlKeyFontSize
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 26.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    -[UIKBRenderFactoryiPad symbolImageControlKeyFontSize](&v5, sel_symbolImageControlKeyFontSize, 26.0);
  }
  return result;
}

- (double)fallbackFontSize
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 28.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    -[UIKBRenderFactoryiPad fallbackFontSize](&v5, sel_fallbackFontSize, 28.0);
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
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    -[UIKBRenderFactoryiPad messagesTypeKeyplanSwitchKeyFontSize](&v5, sel_messagesTypeKeyplanSwitchKeyFontSize, 22.0);
  }
  return result;
}

- (double)tinyPunctuationGlyphFontSize
{
  double result;
  objc_super v4;

  if (!-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
    return 50.0;
  v4.receiver = self;
  v4.super_class = (Class)UIKBRenderFactoryiPadLandscape;
  -[UIKBRenderFactoryiPad tinyPunctuationGlyphFontSize](&v4, sel_tinyPunctuationGlyphFontSize);
  return result;
}

- (CGPoint)tinyPunctuationGlyphOffset
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    -[UIKBRenderFactoryiPad tinyPunctuationGlyphOffset](&v5, sel_tinyPunctuationGlyphOffset);
  }
  else
  {
    v4 = -2.5;
    v3 = 0.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)dualStringKeyOffset
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    -[UIKBRenderFactoryiPad dualStringKeyOffset](&v5, sel_dualStringKeyOffset);
  }
  else
  {
    v4 = 2.0;
    v3 = 0.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)dismissKeyOffset
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    -[UIKBRenderFactoryiPad dismissKeyOffset](&v5, sel_dismissKeyOffset);
  }
  else
  {
    v4 = 1.0;
    v3 = 0.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)deleteKeyOffset
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    -[UIKBRenderFactoryiPad deleteKeyOffset](&v5, sel_deleteKeyOffset);
  }
  else
  {
    v4 = -1.0;
    v3 = 1.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)shiftKeyOffset
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    -[UIKBRenderFactoryiPad shiftKeyOffset](&v5, sel_shiftKeyOffset);
  }
  else
  {
    v4 = -2.0;
    v3 = 0.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)symbolImageControlKeyOffset
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadLandscape;
    -[UIKBRenderFactoryiPad symbolImageControlKeyOffset](&v5, sel_symbolImageControlKeyOffset);
  }
  else
  {
    v4 = -1.0;
    v3 = 1.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)multitapCompleteKeyImageName
{
  double v2;
  __CFString *v3;

  -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", 1.0);
  if (v2 <= 1.0)
    v3 = CFSTR("kana_multitap_complete_arrow.png");
  else
    v3 = CFSTR("kana_multitap_complete_arrow-163r.png");
  return v3;
}

- (id)muttitapReverseKeyImageName
{
  double v2;
  __CFString *v3;

  -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", 1.0);
  if (v2 <= 1.0)
    v3 = CFSTR("kana_multitap_reverse_arrow.png");
  else
    v3 = CFSTR("kana_multitap_reverse_arrow-163r.png");
  return v3;
}

- (id)messagesWriteboardKeyImageName
{
  return CFSTR("messages_writeboard_landscape.png");
}

- (id)ZWNJKeyImageName
{
  return CFSTR("ZWNJ_landscape.png");
}

- (double)skinnyKeyThreshold
{
  return -1.0;
}

- (double)defaultVariantSizeThreshold
{
  return 83.0;
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
    v3 = 6.0;
  if (v2)
    v4 = 6.0;
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
  return 1.115;
}

@end
