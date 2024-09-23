@implementation UIFont(WFLineHeight)

- (double)wf_lineHeight
{
  double Ascent;
  double v3;

  Ascent = CTFontGetAscent(a1);
  v3 = Ascent + CTFontGetDescent(a1);
  return v3 + CTFontGetLeading(a1);
}

@end
