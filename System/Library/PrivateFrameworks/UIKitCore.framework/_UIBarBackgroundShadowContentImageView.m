@implementation _UIBarBackgroundShadowContentImageView

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIBarBackgroundShadowContentImageView;
  -[UIImageView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[_UIBarBackgroundShadowContentImageView _applyTintColorToBackgroundIfNecessary](self, "_applyTintColorToBackgroundIfNecessary");
}

- (void)_applyTintColorToBackgroundIfNecessary
{
  id v3;

  if (self->_applyTintColorToBackgroundColor)
  {
    -[UIView tintColor](self, "tintColor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](self, "setBackgroundColor:", v3);

  }
}

- (void)setApplyTintColorToBackgroundColor:(BOOL)a3
{
  self->_applyTintColorToBackgroundColor = a3;
  -[_UIBarBackgroundShadowContentImageView _applyTintColorToBackgroundIfNecessary](self, "_applyTintColorToBackgroundIfNecessary");
}

- (_UIBarBackgroundShadowContentImageView)initWithFrame:(CGRect)a3
{
  _UIBarBackgroundShadowContentImageView *v3;
  _UIBarBackgroundShadowContentImageView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIBarBackgroundShadowContentImageView;
  v3 = -[UIImageView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsEdgeAntialiasing:", 1);

  }
  return v4;
}

- (BOOL)applyTintColorToBackgroundColor
{
  return self->_applyTintColorToBackgroundColor;
}

@end
