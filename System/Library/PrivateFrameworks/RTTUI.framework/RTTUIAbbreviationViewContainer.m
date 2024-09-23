@implementation RTTUIAbbreviationViewContainer

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance", a3.width);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;

  if (v6 == 0.0)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v6 = v8;

  }
  v9 = v6;
  v10 = height;
  result.height = v10;
  result.width = v9;
  return result;
}

@end
