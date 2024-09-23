@implementation UIKBRenderFactoryiPadHWR_Landscape

- (double)deleteKeyFontSize
{
  return 22.0;
}

- (double)moreKeyFontSize
{
  return 22.0;
}

- (double)internationalKeyFontSize
{
  return 40.0;
}

- (double)dictationKeyFontSize
{
  return 37.0;
}

- (double)spaceKeyFontSize
{
  return 18.0;
}

- (double)dismissKeyFontSize
{
  return 47.0;
}

- (CGPoint)dismissKeyOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 8.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)spaceReturnKeyTextOffset
{
  double v2;
  double v3;
  double v4;
  CGPoint result;

  -[UIKBRenderFactory scale](self, "scale");
  v2 = 2.0;
  if (v3 == 2.0)
    v2 = 2.5;
  v4 = 0.0;
  result.y = v2;
  result.x = v4;
  return result;
}

- (double)keyCornerRadius
{
  return 5.0;
}

- (id)messagesWriteboardKeyImageName
{
  return CFSTR("messages_writeboard_landscape.png");
}

- (double)controlColumnWidthFactor
{
  return 0.27;
}

@end
