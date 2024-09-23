@implementation WFColor(JoeColor)

- (BOOL)wf_isVeryDark
{
  double v2;

  v2 = 0.0;
  objc_msgSend(a1, "getHue:saturation:value:alpha:", 0, 0, &v2, 0);
  return v2 <= 0.1;
}

- (BOOL)wf_isVeryLight
{
  double v2;
  double v3;
  double v5;

  objc_msgSend(a1, "red");
  if (v2 < 0.95)
    return 0;
  objc_msgSend(a1, "green");
  if (v3 < 0.95)
    return 0;
  objc_msgSend(a1, "blue");
  return v5 >= 0.95;
}

@end
