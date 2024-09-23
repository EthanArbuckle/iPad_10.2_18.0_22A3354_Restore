@implementation UIButton

- (double)mt_firstBaselineOffsetFromTop
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self, "titleLabel"));
  objc_msgSend(v2, "mt_baselineOriginY");
  v4 = v3;

  return v4;
}

@end
