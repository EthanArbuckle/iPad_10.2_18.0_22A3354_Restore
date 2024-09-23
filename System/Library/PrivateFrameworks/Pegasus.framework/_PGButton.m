@implementation _PGButton

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  _PGButton *v7;
  objc_super v9;
  CGPoint v10;
  CGRect v11;

  y = a3.y;
  x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)_PGButton;
  -[_PGButton hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4);
  v7 = (_PGButton *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[_PGButton hitRect](self, "hitRect");
    v10.x = x;
    v10.y = y;
    if (CGRectContainsPoint(v11, v10))
      v7 = self;
    else
      v7 = 0;
  }
  return v7;
}

- (CGRect)hitRect
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect result;

  -[_PGButton bounds](self, "bounds");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  if (-[_PGButton isEnabled](self, "isEnabled"))
  {
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    v11 = 58.0 - CGRectGetWidth(v19);
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    v12 = 58.0 - CGRectGetHeight(v20);
    if (v11 <= 0.0)
      v13 = -0.0;
    else
      v13 = v11 * -0.5;
    if (v12 <= 0.0)
      v14 = -0.0;
    else
      v14 = v12 * -0.5;
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v22 = CGRectInset(v21, v13, v14);
    x = v22.origin.x;
    y = v22.origin.y;
    width = v22.size.width;
    height = v22.size.height;
  }
  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PGButton;
  -[_PGButton tintColorDidChange](&v3, sel_tintColorDidChange);
  -[UIButton PG_updateVibrancyEffectForTintColor](self, "PG_updateVibrancyEffectForTintColor");
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PGButton;
  -[_PGButton setTitle:forState:](&v5, sel_setTitle_forState_, a3, a4);
  -[UIButton PG_updateVibrancyEffectForTintColor](self, "PG_updateVibrancyEffectForTintColor");
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PGButton;
  -[_PGButton setImage:forState:](&v5, sel_setImage_forState_, a3, a4);
  -[UIButton PG_updateVibrancyEffectForTintColor](self, "PG_updateVibrancyEffectForTintColor");
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v26;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v26.receiver = self;
  v26.super_class = (Class)_PGButton;
  -[_PGButton imageRectForContentRect:](&v26, sel_imageRectForContentRect_);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[_PGButton buttonView](self, "buttonView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v17, "buttonView:imageRectForContentRect:proposedRect:", v16, x, y, width, height, v9, v11, v13, v15);
    v9 = v18;
    v11 = v19;
    v13 = v20;
    v15 = v21;
  }

  v22 = v9;
  v23 = v11;
  v24 = v13;
  v25 = v15;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v26;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v26.receiver = self;
  v26.super_class = (Class)_PGButton;
  -[_PGButton titleRectForContentRect:](&v26, sel_titleRectForContentRect_);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[_PGButton buttonView](self, "buttonView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v17, "buttonView:titleRectForContentRect:proposedRect:", v16, x, y, width, height, v9, v11, v13, v15);
    v9 = v18;
    v11 = v19;
    v13 = v20;
    v15 = v21;
  }

  v22 = v9;
  v23 = v11;
  v24 = v13;
  v25 = v15;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)isHovered
{
  return self->_hovered;
}

- (void)setHovered:(BOOL)a3
{
  self->_hovered = a3;
}

- (PGButtonView)buttonView
{
  return (PGButtonView *)objc_loadWeakRetained((id *)&self->_buttonView);
}

- (void)setButtonView:(id)a3
{
  objc_storeWeak((id *)&self->_buttonView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_buttonView);
}

@end
