@implementation SiriSharedUIContentPlatterSeparatorView

- (SiriSharedUIContentPlatterSeparatorView)initWithFrame:(CGRect)a3
{
  SiriSharedUIContentPlatterSeparatorView *v3;
  SiriSharedUIContentPlatterSeparatorView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SiriSharedUIContentPlatterSeparatorView;
  v3 = -[SiriSharedUIContentPlatterSeparatorView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SiriSharedUIContentPlatterSeparatorView _setupBackgroundView](v3, "_setupBackgroundView");
    -[SiriSharedUIContentPlatterSeparatorView _setupBackgroundViewSmall](v4, "_setupBackgroundViewSmall");
    -[SiriSharedUIContentPlatterSeparatorView addSubview:](v4, "addSubview:", v4->_backgroundView);
    -[SiriSharedUIContentPlatterSeparatorView addSubview:](v4, "addSubview:", v4->_backgroundViewSmall);
    v4->_separatorType = 0;
  }
  return v4;
}

- (void)_setupBackgroundView
{
  void *v3;
  UIView *v4;
  void *v5;
  void *v6;
  UIView *backgroundView;
  id v8;

  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 8);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3F08], "effectForBlurEffect:style:", v8, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v3);
  -[UIView contentView](v4, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SiriSharedUIPlatterKeyLineColor();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  backgroundView = self->_backgroundView;
  self->_backgroundView = v4;

}

- (void)_setupBackgroundViewSmall
{
  UIView *v3;
  UIView *backgroundViewSmall;

  v3 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD9D0]), "initWithProminence:", 2);
  backgroundViewSmall = self->_backgroundViewSmall;
  self->_backgroundViewSmall = v3;

  -[UIView setHidden:](self->_backgroundViewSmall, "setHidden:", 1);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  switch(self->_separatorType)
  {
    case 0:
    case 4:
      v4 = 8.0;
      break;
    case 1:
      -[SiriSharedUIContentPlatterSeparatorView _scale](self, "_scale", a3.width, a3.height);
      v4 = 1.0 / v5;
      break;
    case 2:
      v4 = 2.0;
      break;
    case 3:
      v4 = 4.0;
      break;
    default:
      v4 = 0.0;
      break;
  }
  v6 = width;
  result.height = v4;
  result.width = v6;
  return result;
}

- (double)_scale
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  return v4;
}

- (void)setSeparatorType:(int64_t)a3
{
  UIView *backgroundView;
  BOOL v5;
  _BOOL8 v6;
  uint64_t v7;

  if (self->_separatorType != a3)
  {
    self->_separatorType = a3;
    backgroundView = self->_backgroundView;
    v5 = a3 == 1;
    v6 = a3 == 1;
    v7 = !v5;
    -[UIView setHidden:](backgroundView, "setHidden:", v6);
    -[UIView setHidden:](self->_backgroundViewSmall, "setHidden:", v7);
  }
}

- (void)layoutSubviews
{
  UIView *backgroundView;
  UIView *backgroundViewSmall;

  backgroundView = self->_backgroundView;
  -[SiriSharedUIContentPlatterSeparatorView bounds](self, "bounds");
  -[UIView setFrame:](backgroundView, "setFrame:");
  backgroundViewSmall = self->_backgroundViewSmall;
  -[SiriSharedUIContentPlatterSeparatorView bounds](self, "bounds");
  -[UIView setFrame:](backgroundViewSmall, "setFrame:");
}

- (int64_t)separatorType
{
  return self->_separatorType;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIView)backgroundViewSmall
{
  return self->_backgroundViewSmall;
}

- (void)setBackgroundViewSmall:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundViewSmall, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundViewSmall, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
