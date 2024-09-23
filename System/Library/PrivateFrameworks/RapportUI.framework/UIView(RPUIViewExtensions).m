@implementation UIView(RPUIViewExtensions)

- (uint64_t)borderColor
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "borderColor");

  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", v2);
}

- (void)setBorderColor:()RPUIViewExtensions
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(objc_retainAutorelease(a3), "CGColor");
  objc_msgSend(a1, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderColor:", v4);

}

- (double)borderWidth
{
  void *v1;
  float v2;
  double v3;

  objc_getAssociatedObject(a1, sel_borderWidth);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (void)setBorderWidth:()RPUIViewExtensions
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_borderWidth, v4, (void *)1);

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v6 = a2 / v5;
  objc_msgSend(a1, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBorderWidth:", v6);

}

- (uint64_t)shadowUIColor
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "shadowColor");

  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", v2);
}

- (void)setShadowUIColor:()RPUIViewExtensions
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(objc_retainAutorelease(a3), "CGColor");
  objc_msgSend(a1, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowColor:", v4);

}

@end
