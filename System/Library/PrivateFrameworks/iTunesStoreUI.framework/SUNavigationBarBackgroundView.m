@implementation SUNavigationBarBackgroundView

- (SUNavigationBarBackgroundView)initWithFrame:(CGRect)a3
{
  SUNavigationBarBackgroundView *v3;
  SUNavigationBarBackgroundView *v4;
  uint64_t v5;
  UIView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUNavigationBarBackgroundView;
  v3 = -[SUNavigationBarBackgroundView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SUNavigationBarBackgroundView setAutoresizingMask:](v3, "setAutoresizingMask:", 18);
    -[SUNavigationBarBackgroundView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDF7018]), "initWithPrivateStyle:", 10060);
    v4->_backdropView = (_UIBackdropView *)v5;
    -[SUNavigationBarBackgroundView addSubview:](v4, "addSubview:", v5);

    v6 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    v4->_borderView = v6;
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.3));
    -[SUNavigationBarBackgroundView addSubview:](v4, "addSubview:", v4->_borderView);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUNavigationBarBackgroundView;
  -[SUNavigationBarBackgroundView dealloc](&v3, sel_dealloc);
}

- (int64_t)backdropStyle
{
  return -[_UIBackdropView style](self->_backdropView, "style");
}

- (void)setBackdropStyle:(int64_t)a3
{
  _UIBackdropView *backdropView;
  _UIBackdropView *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  backdropView = self->_backdropView;
  v5 = (_UIBackdropView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF7018]), "initWithPrivateStyle:", a3);
  self->_backdropView = v5;
  -[_UIBackdropView frame](backdropView, "frame");
  -[_UIBackdropView setFrame:](v5, "setFrame:");
  -[SUNavigationBarBackgroundView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backdropView, 0);

  v6[4] = backdropView;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__SUNavigationBarBackgroundView_setBackdropStyle___block_invoke;
  v7[3] = &unk_24DE7AF90;
  v7[4] = backdropView;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__SUNavigationBarBackgroundView_setBackdropStyle___block_invoke_2;
  v6[3] = &unk_24DE7B7E8;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v7, v6, 0.3);
}

uint64_t __50__SUNavigationBarBackgroundView_setBackdropStyle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __50__SUNavigationBarBackgroundView_setBackdropStyle___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)setSeparatorOnTop:(BOOL)a3
{
  if (self->_separatorOnTop != a3)
  {
    self->_separatorOnTop = a3;
    -[SUNavigationBarBackgroundView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIView *borderView;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SUNavigationBarBackgroundView;
  -[SUNavigationBarBackgroundView layoutSubviews](&v11, sel_layoutSubviews);
  -[SUNavigationBarBackgroundView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[_UIBackdropView setFrame:](self->_backdropView, "setFrame:");
  borderView = self->_borderView;
  v8 = 0.0;
  if (!self->_separatorOnTop)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale");
    v8 = v6 + -1.0 / v9;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale");
  -[UIView setFrame:](borderView, "setFrame:", 0.0, v8, v4, 1.0 / v10);
}

- (id)_currentCustomBackgroundRespectOversize_legacy:(BOOL *)a3
{
  return 0;
}

- (id)_currentCustomBackground
{
  return 0;
}

- (_UIBackdropView)backdropView
{
  return self->_backdropView;
}

- (BOOL)separatorOnTop
{
  return self->_separatorOnTop;
}

- (int64_t)barStyle
{
  return self->barStyle;
}

- (void)setBarStyle:(int64_t)a3
{
  self->barStyle = a3;
}

- (UIColor)barTintColor
{
  return self->barTintColor;
}

- (void)setBarTintColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 448);
}

- (_UINavigationBarAppearanceStorage)appearanceStorage
{
  return self->appearanceStorage;
}

- (void)setAppearanceStorage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 456);
}

- (UIView)_shadowView
{
  return self->_shadowView;
}

- (void)_setShadowView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 464);
}

- (BOOL)isTranslucent
{
  return self->translucent;
}

- (void)setTranslucent:(BOOL)a3
{
  self->translucent = a3;
}

- (BOOL)barWantsAdaptiveBackdrop
{
  return self->barWantsAdaptiveBackdrop;
}

- (void)setBarWantsAdaptiveBackdrop:(BOOL)a3
{
  self->barWantsAdaptiveBackdrop = a3;
}

@end
