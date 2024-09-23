@implementation STUIStatusBarRoundedCornerView

- (STUIStatusBarRoundedCornerView)initWithFrame:(CGRect)a3
{
  STUIStatusBarRoundedCornerView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarRoundedCornerView;
  result = -[STUIStatusBarRoundedCornerView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_cornerRadius = -1.0;
  return result;
}

- (void)layoutSubviews
{
  double cornerRadius;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)STUIStatusBarRoundedCornerView;
  -[STUIStatusBarRoundedCornerView layoutSubviews](&v13, sel_layoutSubviews);
  cornerRadius = self->_cornerRadius;
  -[STUIStatusBarRoundedCornerView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v8 = fmin(v4, v6) * 0.5;
  if (cornerRadius == -1.0)
    cornerRadius = v8;
  -[STUIStatusBarRoundedCornerView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", cornerRadius);

  if (vabdd_f64(v5, v7) <= 1.0)
    v10 = (uint64_t *)MEMORY[0x1E0CD2A60];
  else
    v10 = (uint64_t *)MEMORY[0x1E0CD2A68];
  v11 = *v10;
  -[STUIStatusBarRoundedCornerView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerCurve:", v11);

}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

@end
