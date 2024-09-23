@implementation SBRoundedRectBorderView

- (SBRoundedRectBorderView)initWithFrame:(CGRect)a3
{
  SBRoundedRectBorderView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBRoundedRectBorderView;
  v3 = -[SBRoundedRectBorderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBRoundedRectBorderView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

- (double)cornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[SBRoundedRectBorderView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cornerRadius");
  v4 = v3;

  return v4;
}

- (void)setCornerRadius:(double)a3
{
  id v4;

  -[SBRoundedRectBorderView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", a3);

}

- (double)borderWidth
{
  void *v2;
  double v3;
  double v4;

  -[SBRoundedRectBorderView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "borderWidth");
  v4 = v3;

  return v4;
}

- (void)setBorderWidth:(double)a3
{
  id v4;

  -[SBRoundedRectBorderView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBorderWidth:", a3);

}

- (UIColor)borderColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CEA478];
  -[SBRoundedRectBorderView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithCGColor:", objc_msgSend(v3, "borderColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (void)setBorderColor:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[SBRoundedRectBorderView layer](self, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGColor");

  objc_msgSend(v7, "setBorderColor:", v6);
}

@end
