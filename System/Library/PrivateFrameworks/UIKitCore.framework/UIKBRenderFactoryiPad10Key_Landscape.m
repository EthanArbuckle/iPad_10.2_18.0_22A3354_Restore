@implementation UIKBRenderFactoryiPad10Key_Landscape

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
  return 0.061;
}

@end
