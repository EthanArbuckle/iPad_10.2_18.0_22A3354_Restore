@implementation UIKBRenderFactoryiPhoneTruffle

- (id)lightKeycapsFontName
{
  if (-[UIKBRenderFactory boldTextEnabled](self, "boldTextEnabled"))
    return CFSTR(".PhoneKeyCaps");
  else
    return CFSTR(".KeycapsA-Keys");
}

- (double)symbolImageControlKeyFontSize
{
  return 20.0;
}

- (CGPoint)returnKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = -1.3333;
  v3 = 0.0;
  result.y = v2;
  result.x = v3;
  return result;
}

- (CGPoint)more123KeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)deleteKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = -0.3333;
  v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)moreABCKeyFontSize
{
  return 14.0;
}

- (CGPoint)stringKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 1.3333;
  v3 = 0.0;
  result.y = v2;
  result.x = v3;
  return result;
}

- (CGPoint)internationalKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = -0.3333;
  v3 = -0.3333;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dictationKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)moreABCKeyOffset
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

- (UIEdgeInsets)wideShadowPaddleInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 18.0;
  v3 = 6.0;
  v4 = 29.0;
  v5 = 4.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)variantPaddedFrameInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 5.0;
  v3 = 0.0;
  v4 = -5.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)variantSymbolFrameInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = -11.0;
  v3 = 0.0;
  v4 = 9.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGPoint)variantSymbolTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)variantAnnotationTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 4.0;
  v3 = 4.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)popupSymbolTextOffset
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

- (double)popupFontSize
{
  return 38.0;
}

- (BOOL)isTallPopup
{
  return 1;
}

@end
