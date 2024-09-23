@implementation UIFont(WFDynamicType)

- (double)wf_scaledValueForValue:()WFDynamicType baseFont:
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v6 = a4;
  objc_msgSend(a1, "wf_bodyLeading");
  v8 = v7 * a2;
  objc_msgSend(v6, "wf_bodyLeading");
  v10 = v9;

  return round(v8 / v10);
}

- (double)wf_bodyLeading
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(a1, "leading");
  v3 = v2;
  objc_msgSend(a1, "lineHeight");
  return v3 + v4;
}

@end
