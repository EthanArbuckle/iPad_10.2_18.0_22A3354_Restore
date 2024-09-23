@implementation VKSelectableBarButtonContainerView

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKSelectableBarButtonContainerView;
  -[VKSelectableBarButtonContainerView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[VKSelectableBarButtonContainerView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VKSelectableBarButtonContainerView setNeedsLayout](self, "setNeedsLayout");
    -[VKSelectableBarButtonContainerView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (VKSelectableBarButtonContainerView)init
{
  VKSelectableBarButtonContainerView *v2;
  VKSelectableBarButtonContainerView *v3;
  uint64_t v4;
  UIButton *button;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VKSelectableBarButtonContainerView;
  v2 = -[VKSelectableBarButtonContainerView init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_width = 44.0;
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v4 = objc_claimAutoreleasedReturnValue();
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    -[UIButton setClipsToBounds:](v3->_button, "setClipsToBounds:", 1);
    v3->_padding = 4.0;
    v3->_compactPadding = 3.0;
    v3->_cornerRadiusRatio = 0.5;
    -[VKSelectableBarButtonContainerView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[VKSelectableBarButtonContainerView addSubview:](v3, "addSubview:", v3->_button);
  }
  return v3;
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VKSelectableBarButtonContainerView button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:forState:", v4, 0);

  -[VKSelectableBarButtonContainerView button](self, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentMode:", 4);

  -[VKSelectableBarButtonContainerView setNeedsLayout](self, "setNeedsLayout");
}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[VKSelectableBarButtonContainerView button](self, "button");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageForState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)VKSelectableBarButtonContainerView;
  -[VKSelectableBarButtonContainerView layoutSubviews](&v18, sel_layoutSubviews);
  -[VKSelectableBarButtonContainerView button](self, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;
  -[VKSelectableBarButtonContainerView bounds](self, "bounds");
  v10 = VKMCenterOfRect(v6, v7, v8, v9);
  objc_msgSend(v3, "setFrame:", VKMRectWithCenterAndSize(v10, v11, v5));
  -[VKSelectableBarButtonContainerView cornerRadiusRatio](self, "cornerRadiusRatio");
  v13 = v5 * v12;
  objc_msgSend(v3, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCornerRadius:", v13);

  v15 = *MEMORY[0x1E0CD2A68];
  objc_msgSend(v3, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCornerCurve:", v15);

  objc_msgSend(v3, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMasksToBounds:", 1);

}

- (void)updateForMiniBarState:(BOOL)a3
{
  -[VKSelectableBarButtonContainerView setNeedsLayout](self, "setNeedsLayout", a3);
  -[VKSelectableBarButtonContainerView layoutIfNeeded](self, "layoutIfNeeded");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[VKSelectableBarButtonContainerView _buttonSize](self, "_buttonSize");
  if (v2 < 44.0)
    v2 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[VKSelectableBarButtonContainerView button](self, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", width, height);
  v8 = v7;

  -[VKSelectableBarButtonContainerView width](self, "width");
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  self->_selected = a3;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[VKSelectableBarButtonContainerView button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelected:", v3);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (CGSize)_buttonSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[VKSelectableBarButtonContainerView button](self, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;
  v7 = v6;

  -[VKSelectableBarButtonContainerView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "vk_hasCompactHeight"))
    -[VKSelectableBarButtonContainerView compactPadding](self, "compactPadding");
  else
    -[VKSelectableBarButtonContainerView padding](self, "padding");
  v10 = v9;
  if (v5 < v7)
    v5 = v7;

  v11 = v5 + v10;
  v12 = v5 + v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (double)padding
{
  return self->_padding;
}

- (void)setPadding:(double)a3
{
  self->_padding = a3;
}

- (double)compactPadding
{
  return self->_compactPadding;
}

- (void)setCompactPadding:(double)a3
{
  self->_compactPadding = a3;
}

- (double)cornerRadiusRatio
{
  return self->_cornerRadiusRatio;
}

- (void)setCornerRadiusRatio:(double)a3
{
  self->_cornerRadiusRatio = a3;
}

- (BOOL)selected
{
  return self->_selected;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
}

@end
