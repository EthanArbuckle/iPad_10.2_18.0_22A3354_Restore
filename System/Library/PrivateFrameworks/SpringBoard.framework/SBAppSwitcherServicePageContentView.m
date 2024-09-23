@implementation SBAppSwitcherServicePageContentView

- (SBAppSwitcherServicePageContentView)initWithFrame:(CGRect)a3
{
  SBAppSwitcherServicePageContentView *v3;
  SBAppSwitcherServicePageContentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBAppSwitcherServicePageContentView;
  v3 = -[SBAppSwitcherServicePageContentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SBAppSwitcherServicePageContentView setClipsToBounds:](v3, "setClipsToBounds:", 1);
  return v4;
}

- (double)cornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[SBAppSwitcherServicePageContentView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cornerRadius");
  v4 = v3;

  return v4;
}

- (void)setMaskedCorners:(unint64_t)a3
{
  id v4;

  -[SBAppSwitcherServicePageContentView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaskedCorners:", a3);

}

- (unint64_t)maskedCorners
{
  void *v2;
  unint64_t v3;

  -[SBAppSwitcherServicePageContentView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maskedCorners");

  return v3;
}

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    -[SBAppSwitcherServicePageContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)contentRequiresGroupOpacity
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  double v10;
  double v11;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_referenceBounds");
  v6 = v5;
  v8 = v7;

  v9 = -[SBAppSwitcherServicePageContentView orientation](self, "orientation");
  if ((unint64_t)(v9 - 3) >= 2)
    v10 = v6;
  else
    v10 = v8;
  if ((unint64_t)(v9 - 3) >= 2)
    v11 = v8;
  else
    v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

@end
