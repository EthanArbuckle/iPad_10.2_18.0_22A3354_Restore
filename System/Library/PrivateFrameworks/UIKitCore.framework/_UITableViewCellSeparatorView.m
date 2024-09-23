@implementation _UITableViewCellSeparatorView

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UITableViewCellSeparatorView;
  -[UIView layoutSubviews](&v11, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  -[UIView setFrame:](self->_overlayView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_effectView, "setFrame:", v4, v6, v8, v10);
}

- (void)setSeparatorEffect:(id)a3
{
  UIVisualEffect **p_separatorEffect;
  UIVisualEffectView *effectView;
  UIVisualEffectView *v7;
  UIVisualEffectView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIVisualEffect *v16;
  _QWORD v17[5];

  p_separatorEffect = &self->_separatorEffect;
  v16 = (UIVisualEffect *)a3;
  if (*p_separatorEffect != v16)
  {
    objc_storeStrong((id *)&self->_separatorEffect, a3);
    -[UIView removeFromSuperview](self->_effectView, "removeFromSuperview", v16);
    effectView = self->_effectView;
    self->_effectView = 0;

    if (*p_separatorEffect)
    {
      v7 = -[UIVisualEffectView initWithEffect:]([UIVisualEffectView alloc], "initWithEffect:", *p_separatorEffect);
      v8 = self->_effectView;
      self->_effectView = v7;

      -[UIView layer](self->_effectView, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAllowsEdgeAntialiasing:", 1);

      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __52___UITableViewCellSeparatorView_setSeparatorEffect___block_invoke;
      v17[3] = &unk_1E16B1B28;
      v17[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v17);
      -[UIView addSubview:](self, "addSubview:", self->_effectView);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[UIVisualEffectView contentView](self->_effectView, "contentView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "tintColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIVisualEffectView contentView](self->_effectView, "contentView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setBackgroundColor:", v11);

        -[UIVisualEffectView contentView](self->_effectView, "contentView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "layer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setAllowsEdgeAntialiasing:", 1);

        -[UIVisualEffectView contentView](self->_effectView, "contentView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setClipsToBounds:", 0);

      }
    }
  }

}

- (_UITableViewCellSeparatorView)initWithFrame:(CGRect)a3
{
  _UITableViewCellSeparatorView *v3;
  _UITableViewCellSeparatorView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UITableViewCellSeparatorView;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsEdgeAntialiasing:", 1);

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_separatorEffect, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

- (void)setDrawsWithVibrantLightMode:(BOOL)a3
{
  UIView *backgroundView;
  UIView *v5;
  UIView *v6;
  UIView *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  UIView *v12;
  UIView *v13;
  UIView *overlayView;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  self->_drawsWithVibrantLightMode = a3;
  backgroundView = self->_backgroundView;
  if (a3)
  {
    if (!backgroundView)
    {
      v5 = [UIView alloc];
      -[UIView bounds](self, "bounds");
      v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
      v7 = self->_backgroundView;
      self->_backgroundView = v6;

      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.250980392, 0.3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v8);

      v9 = *MEMORY[0x1E0CD2BC0];
      -[UIView layer](self->_backgroundView, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCompositingFilter:", v9);

      -[UIView layer](self->_backgroundView, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAllowsEdgeAntialiasing:", 1);

    }
    if (!self->_overlayView)
    {
      v12 = [UIView alloc];
      -[UIView bounds](self, "bounds");
      v13 = -[UIView initWithFrame:](v12, "initWithFrame:");
      overlayView = self->_overlayView;
      self->_overlayView = v13;

      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.31372549, 0.1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_overlayView, "setBackgroundColor:", v15);

      v16 = *MEMORY[0x1E0CD2E98];
      -[UIView layer](self->_overlayView, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setCompositingFilter:", v16);

      -[UIView layer](self->_overlayView, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAllowsEdgeAntialiasing:", 1);

    }
    -[UIView addSubview:](self, "addSubview:", self->_backgroundView);
    -[UIView addSubview:](self, "addSubview:", self->_overlayView);
    -[UIView layer](self, "layer");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAllowsGroupBlending:", 0);

  }
  else
  {
    -[UIView removeFromSuperview](backgroundView, "removeFromSuperview");
    -[UIView removeFromSuperview](self->_overlayView, "removeFromSuperview");
  }
}

- (BOOL)drawsWithVibrantLightMode
{
  return self->_drawsWithVibrantLightMode;
}

- (UIVisualEffect)separatorEffect
{
  return self->_separatorEffect;
}

@end
