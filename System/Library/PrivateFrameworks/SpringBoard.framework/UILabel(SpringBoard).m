@implementation UILabel(SpringBoard)

- (uint64_t)sb_yPositionForLabelWithContainerBounds:()SpringBoard lineHeight:baselineOffset:font:
{
  id v11;
  CGRect v13;

  v11 = a7;
  v13.origin.x = a1;
  v13.origin.y = a2;
  v13.size.width = a3;
  v13.size.height = a4;
  CGRectGetMinY(v13);
  objc_msgSend(v11, "descender");

  return SBFloatRoundForScale();
}

- (uint64_t)sb_yPositionForLabelWithContainerBounds:()SpringBoard baselineOffset:font:
{
  id v11;
  CGRect v13;

  v11 = a7;
  v13.origin.x = a1;
  v13.origin.y = a2;
  v13.size.width = a3;
  v13.size.height = a4;
  CGRectGetMinY(v13);
  objc_msgSend(v11, "ascender");

  return SBFloatRoundForScale();
}

- (double)sb_yPositionForLayoutAfterLabel:()SpringBoard baselineOffset:
{
  id v4;
  void *v5;
  double v6;
  double v7;
  CGRect v9;

  v4 = a3;
  objc_msgSend(v4, "frame");
  CGRectGetMaxY(v9);
  objc_msgSend(v4, "_baselineOffsetFromBottom");

  objc_msgSend(a1, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ascender");
  SBFloatRoundForScale();
  v7 = v6;

  return v7;
}

@end
