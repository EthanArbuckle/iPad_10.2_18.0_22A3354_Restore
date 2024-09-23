@implementation _UIEditMenuPageButton

- (_UIEditMenuPageButton)initWithDirection:(int64_t)a3 backgroundGroupName:(id)a4
{
  id v6;
  _UIEditMenuPageButton *v7;
  _UIEditMenuPageButton *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)_UIEditMenuPageButton;
  v7 = -[UIButton initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v8 = v7;
  if (v7)
  {
    v7->_direction = a3;
    -[_UIEditMenuPageButton _configureButtonWithGroupName:](v7, "_configureButtonWithGroupName:", v6);
  }

  return v8;
}

- (void)setArrowEdgeInsets:(UIEdgeInsets)a3
{
  double top;
  double v4;
  double v9;
  id v10;

  top = a3.top;
  v4 = self->_arrowEdgeInsets.top;
  if (self->_arrowEdgeInsets.left != a3.left
    || v4 != top
    || self->_arrowEdgeInsets.right != a3.right
    || self->_arrowEdgeInsets.bottom != a3.bottom)
  {
    self->_arrowEdgeInsets.top = top;
    self->_arrowEdgeInsets.left = a3.left;
    self->_arrowEdgeInsets.bottom = a3.bottom;
    self->_arrowEdgeInsets.right = a3.right;
    -[UIButton configuration](self, "configuration", v4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDefaultContentInsets");
    objc_msgSend(v10, "contentInsets");
    objc_msgSend(v10, "setContentInsets:", top + v9);
    -[UIButton setConfiguration:](self, "setConfiguration:", v10);

  }
}

- (id)_imageNameForCurrentDirection
{
  if (-[_UIEditMenuPageButton direction](self, "direction"))
    return CFSTR("chevron.right");
  else
    return CFSTR("chevron.left");
}

- (void)_configureButtonWithGroupName:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  UIVisualEffectView *v8;
  void *v9;
  UIVisualEffectView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIVisualEffectView *separatorView;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v34 = a3;
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  _UIEditMenuGetPlatformMetrics(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _UIEditMenuGetPlatformMetrics(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [UIVisualEffectView alloc];
  objc_msgSend(v7, "separatorEffect");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[UIVisualEffectView initWithEffect:](v8, "initWithEffect:", v9);

  objc_msgSend(v7, "separatorEffectColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView contentView](v10, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v11);

  -[UIVisualEffectView contentView](v10, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAllowsEdgeAntialiasing:", 1);

  -[UIVisualEffectView contentView](v10, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setClipsToBounds:", 0);

  separatorView = self->_separatorView;
  self->_separatorView = v10;

  -[UIView addSubview:](self, "addSubview:", self->_separatorView);
  objc_msgSend(v6, "pageButtonConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A830, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleSubhead"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = *(_QWORD *)off_1E167DC10;
  v38 = *(_QWORD *)off_1E167DC80;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)off_1E167DC78);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "fontDescriptorByAddingAttributes:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v23, 0.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v24, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIEditMenuPageButton _imageNameForCurrentDirection](self, "_imageNameForCurrentDirection");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v26, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setImage:", v27);
  -[UIButton setConfiguration:](self, "setConfiguration:", v17);
  objc_msgSend(v17, "contentInsets");
  self->_defaultInsets.top = v28;
  self->_defaultInsets.leading = v29;
  self->_defaultInsets.bottom = v30;
  self->_defaultInsets.trailing = v31;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __55___UIEditMenuPageButton__configureButtonWithGroupName___block_invoke;
  v35[3] = &unk_1E16D96A0;
  v36 = v6;
  v37 = v34;
  v32 = v34;
  v33 = v6;
  -[UIButton setConfigurationUpdateHandler:](self, "setConfigurationUpdateHandler:", v35);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  int64_t v5;
  double v6;
  double Height;
  objc_super v8;
  CGRect v9;
  CGRect v10;
  CGRect v11;

  v8.receiver = self;
  v8.super_class = (Class)_UIEditMenuPageButton;
  -[UIButton layoutSubviews](&v8, sel_layoutSubviews);
  -[UIView _currentScreenScale](self, "_currentScreenScale");
  v4 = 1.0 / v3;
  v5 = -[_UIEditMenuPageButton direction](self, "direction");
  if (v5 == 1)
  {
    -[UIView bounds](self, "bounds");
    Height = CGRectGetHeight(v11);
    v6 = 0.0;
  }
  else
  {
    if (v5)
      return;
    -[UIView bounds](self, "bounds");
    v6 = CGRectGetMaxX(v9) - v4;
    -[UIView bounds](self, "bounds");
    Height = CGRectGetHeight(v10);
  }
  -[UIView setFrame:](self->_separatorView, "setFrame:", v6, 0.0, v4, Height);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (int64_t)direction
{
  return self->_direction;
}

- (UIEdgeInsets)arrowEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_arrowEdgeInsets.top;
  left = self->_arrowEdgeInsets.left;
  bottom = self->_arrowEdgeInsets.bottom;
  right = self->_arrowEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
}

@end
