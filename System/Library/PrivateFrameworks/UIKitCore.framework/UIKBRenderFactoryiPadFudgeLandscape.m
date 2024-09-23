@implementation UIKBRenderFactoryiPadFudgeLandscape

- (double)spaceKeyFontSize
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 19.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadFudgeLandscape;
    -[UIKBRenderFactoryiPadFudge spaceKeyFontSize](&v5, sel_spaceKeyFontSize, 19.0);
  }
  return result;
}

- (double)moreKeyFontSize
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 20.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadFudgeLandscape;
    -[UIKBRenderFactoryiPadFudge moreKeyFontSize](&v5, sel_moreKeyFontSize, 20.0);
  }
  return result;
}

- (double)deleteKeyFontSize
{
  _BOOL4 v3;
  double result;
  objc_super v5;

  v3 = -[UIKBRenderFactory dynamicFactory](self, "dynamicFactory");
  result = 20.0;
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadFudgeLandscape;
    -[UIKBRenderFactoryiPadFudge deleteKeyFontSize](&v5, sel_deleteKeyFontSize, 20.0);
  }
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
    v5.super_class = (Class)UIKBRenderFactoryiPadFudgeLandscape;
    -[UIKBRenderFactoryiPadFudge controlKeyFontSize](&v5, sel_controlKeyFontSize, 20.0);
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
    v5.super_class = (Class)UIKBRenderFactoryiPadFudgeLandscape;
    -[UIKBRenderFactoryiPadFudge symbolImageControlKeyFontSize](&v5, sel_symbolImageControlKeyFontSize, 24.0);
  }
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
    v5.super_class = (Class)UIKBRenderFactoryiPadFudgeLandscape;
    -[UIKBRenderFactoryiPadFudge symbolImageControlKeyOffset](&v5, sel_symbolImageControlKeyOffset);
  }
  else
  {
    v4 = 16.0;
    v3 = 20.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)internationalKeyOffset
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadFudgeLandscape;
    -[UIKBRenderFactoryiPadFudge internationalKeyOffset](&v5, sel_internationalKeyOffset);
  }
  else
  {
    v4 = 17.0;
    v3 = 20.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)moreKeyOffset
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadFudgeLandscape;
    -[UIKBRenderFactoryiPadFudge moreKeyOffset](&v5, sel_moreKeyOffset);
  }
  else
  {
    v4 = 15.0;
    v3 = 19.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)dictationKeyOffset
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadFudgeLandscape;
    -[UIKBRenderFactoryiPadFudge dictationKeyOffset](&v5, sel_dictationKeyOffset);
  }
  else
  {
    v4 = 17.0;
    v3 = 20.0;
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
    v5.super_class = (Class)UIKBRenderFactoryiPadFudgeLandscape;
    -[UIKBRenderFactoryiPadFudge dismissKeyOffset](&v5, sel_dismissKeyOffset);
  }
  else
  {
    v4 = 12.0;
    v3 = 20.0;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGSize)defaultVariantGeometrySize
{
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadFudgeLandscape;
    -[UIKBRenderFactoryiPadFudge defaultVariantGeometrySize](&v5, sel_defaultVariantGeometrySize);
  }
  else
  {
    v4 = 79.0;
    v3 = 85.0;
  }
  result.height = v4;
  result.width = v3;
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
    v5.super_class = (Class)UIKBRenderFactoryiPadFudgeLandscape;
    -[UIKBRenderFactoryiPad keyCornerRadius](&v5, sel_keyCornerRadius, 8.0);
  }
  return result;
}

- (id)messagesWriteboardKeyImageName
{
  __CFString *v3;
  objc_super v5;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactoryiPadFudgeLandscape;
    -[UIKBRenderFactoryiPadFudge messagesWriteboardKeyImageName](&v5, sel_messagesWriteboardKeyImageName);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("messages_writeboard_fudge_landscape.png");
  }
  return v3;
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
    v3 = 2.0;
  else
    v3 = 4.0;
  if (v2)
    v4 = 1.0;
  else
    v4 = 4.0;
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
  result = 1.07;
  if (v2)
    return 1.04;
  return result;
}

- (double)stringKeyFontSize:(unint64_t)a3
{
  double result;
  objc_super v6;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v6.receiver = self;
    v6.super_class = (Class)UIKBRenderFactoryiPadFudgeLandscape;
    -[UIKBRenderFactoryiPadFudge stringKeyFontSize:](&v6, sel_stringKeyFontSize_, a3);
  }
  else
  {
    result = 24.0;
    if (a3 == 1)
      result = 23.0;
    if (a3 == 4)
      return 27.0;
  }
  return result;
}

- (CGPoint)iPadFudgeControlKeyOffset
{
  double v3;
  double v4;
  _BOOL4 v5;
  objc_super v6;
  CGPoint result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v6.receiver = self;
    v6.super_class = (Class)UIKBRenderFactoryiPadFudgeLandscape;
    -[UIKBRenderFactoryiPadFudge iPadFudgeControlKeyOffset](&v6, sel_iPadFudgeControlKeyOffset);
  }
  else
  {
    v5 = -[UIKBRenderFactory preferStringKeycapOverImage](self, "preferStringKeycapOverImage");
    v3 = 20.0;
    if (v5)
      v3 = 19.0;
    v4 = 14.5;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)deleteKeyOffset:(unint64_t)a3
{
  double v5;
  double v6;
  objc_super v7;
  CGPoint result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKBRenderFactoryiPadFudgeLandscape;
    -[UIKBRenderFactoryiPadFudge deleteKeyOffset:](&v7, sel_deleteKeyOffset_, a3);
  }
  else
  {
    v6 = 15.5;
    if (a3 != 1)
      v6 = 17.0;
    v5 = 20.0;
  }
  result.y = v6;
  result.x = v5;
  return result;
}

- (double)dualStringKeyBottomFontSize:(unint64_t)a3
{
  double result;
  objc_super v6;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v6.receiver = self;
    v6.super_class = (Class)UIKBRenderFactoryiPadFudgeLandscape;
    -[UIKBRenderFactoryiPadFudge dualStringKeyBottomFontSize:](&v6, sel_dualStringKeyBottomFontSize_, a3);
  }
  else
  {
    result = 22.0;
    if (a3 == 1)
      result = 20.0;
    if (a3 == 4)
      return 26.0;
  }
  return result;
}

- (CGPoint)dualStringKeyBottomTextOffset:(unint64_t)a3
{
  double v5;
  double v6;
  objc_super v7;
  CGPoint result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKBRenderFactoryiPadFudgeLandscape;
    -[UIKBRenderFactoryiPadFudge dualStringKeyBottomTextOffset:](&v7, sel_dualStringKeyBottomTextOffset_, a3);
  }
  else
  {
    v5 = 0.0;
    if (a3 == 4)
    {
      v6 = 18.5;
    }
    else if (a3 == 1)
    {
      v6 = 12.0;
    }
    else
    {
      v6 = 17.5;
    }
  }
  result.y = v6;
  result.x = v5;
  return result;
}

- (double)dualStringKeyTopFontSize:(unint64_t)a3
{
  double result;
  objc_super v6;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v6.receiver = self;
    v6.super_class = (Class)UIKBRenderFactoryiPadFudgeLandscape;
    -[UIKBRenderFactoryiPadFudge dualStringKeyTopFontSize:](&v6, sel_dualStringKeyTopFontSize_, a3);
  }
  else
  {
    result = 22.0;
    if (a3 == 1)
      result = 20.0;
    if (a3 == 4)
      return 25.0;
  }
  return result;
}

- (CGPoint)dualStringKeyTopTextOffset:(unint64_t)a3
{
  double v5;
  double v6;
  objc_super v7;
  CGPoint result;

  if (-[UIKBRenderFactory dynamicFactory](self, "dynamicFactory"))
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKBRenderFactoryiPadFudgeLandscape;
    -[UIKBRenderFactoryiPadFudge dualStringKeyTopTextOffset:](&v7, sel_dualStringKeyTopTextOffset_, a3);
  }
  else
  {
    v6 = -12.0;
    if (a3 != 1)
      v6 = -15.0;
    v5 = 0.0;
  }
  result.y = v6;
  result.x = v5;
  return result;
}

- (double)_row4ControlSegmentWidthRight
{
  void *v2;
  double v3;

  -[UIKBRenderFactory renderingContext](self, "renderingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = dbl_186680240[objc_msgSend(v2, "keyboardType") == 126];

  return v3;
}

@end
