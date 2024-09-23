@implementation UIColor(WFDisabledColor)

- (id)wf_desaturatedColorWithMagnitude:()WFDisabledColor
{
  double v4;
  id v5;
  uint64_t v7;
  double v8;
  double v9;
  double v10;

  v9 = 0.0;
  v10 = 0.0;
  v7 = 0;
  v8 = 0.0;
  if ((objc_msgSend(a1, "getRed:green:blue:alpha:", &v10, &v9, &v8, &v7) & 1) != 0)
  {
    v4 = (v9 * 0.589999974 + v10 * 0.300000012 + v8 * 0.109999999) * 0.6;
    v9 = (1.0 - a2) * v9 + v4 * a2;
    v10 = (1.0 - a2) * v10 + v4 * a2;
    v8 = (1.0 - a2) * v8 + v4 * a2;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = a1;
  }
  return v5;
}

- (uint64_t)wf_disabledColor
{
  return objc_msgSend(a1, "wf_desaturatedColorWithMagnitude:", 0.8);
}

@end
