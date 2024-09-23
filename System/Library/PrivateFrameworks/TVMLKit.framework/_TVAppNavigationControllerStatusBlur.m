@implementation _TVAppNavigationControllerStatusBlur

- (_TVAppNavigationControllerStatusBlur)initWithCoder:(id)a3
{
  _TVAppNavigationControllerStatusBlur *v3;
  _TVAppNavigationControllerStatusBlur *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVAppNavigationControllerStatusBlur;
  v3 = -[_TVAppNavigationControllerStatusBlur initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[_TVAppNavigationControllerStatusBlur _commonInit](v3, "_commonInit");
  return v4;
}

- (_TVAppNavigationControllerStatusBlur)initWithFrame:(CGRect)a3
{
  _TVAppNavigationControllerStatusBlur *v3;
  _TVAppNavigationControllerStatusBlur *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVAppNavigationControllerStatusBlur;
  v3 = -[_TVAppNavigationControllerStatusBlur initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[_TVAppNavigationControllerStatusBlur _commonInit](v3, "_commonInit");
  return v4;
}

- (UIColor)backgroundTintColor
{
  return -[UIView backgroundColor](self->_dimmingView, "backgroundColor");
}

- (UIVisualEffect)visualEffect
{
  return -[UIVisualEffectView effect](self->_visualEffectView, "effect");
}

- (void)setBackgroundTintColor:(id)a3
{
  -[UIView setBackgroundColor:](self->_dimmingView, "setBackgroundColor:", a3);
}

- (void)setVisualEffect:(id)a3
{
  -[UIVisualEffectView setEffect:](self->_visualEffectView, "setEffect:", a3);
}

- (void)_commonInit
{
  id v3;
  UIView *v4;
  UIView *dimmingView;
  UIView *v6;
  void *v7;
  UIVisualEffectView *v8;
  UIVisualEffectView *visualEffectView;
  UIVisualEffectView *v10;

  v3 = objc_alloc(MEMORY[0x24BDF6F90]);
  -[_TVAppNavigationControllerStatusBlur bounds](self, "bounds");
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  dimmingView = self->_dimmingView;
  self->_dimmingView = v4;

  v6 = self->_dimmingView;
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

  -[UIView setAutoresizingMask:](self->_dimmingView, "setAutoresizingMask:", 18);
  -[_TVAppNavigationControllerStatusBlur addSubview:](self, "addSubview:", self->_dimmingView);
  v8 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FC8]), "initWithEffect:", 0);
  visualEffectView = self->_visualEffectView;
  self->_visualEffectView = v8;

  -[UIVisualEffectView setAutoresizingMask:](self->_visualEffectView, "setAutoresizingMask:", 18);
  v10 = self->_visualEffectView;
  -[_TVAppNavigationControllerStatusBlur bounds](self, "bounds");
  -[UIVisualEffectView setFrame:](v10, "setFrame:");
  -[_TVAppNavigationControllerStatusBlur addSubview:](self, "addSubview:", self->_visualEffectView);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end
