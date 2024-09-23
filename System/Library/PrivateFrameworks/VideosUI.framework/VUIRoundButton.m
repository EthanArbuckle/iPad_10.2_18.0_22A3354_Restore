@implementation VUIRoundButton

- (VUIRoundButton)initWithFrame:(CGRect)a3
{
  VUIRoundButton *v3;
  uint64_t v4;
  UIButton *button;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VUIRoundButton;
  v3 = -[VUIRoundButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v4 = objc_claimAutoreleasedReturnValue();
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    -[VUIRoundButton _setUpViews](v3, "_setUpViews");
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v21 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[VUIRoundButton textLabels](self, "textLabels", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "sizeThatFits:", width, height);
        v6 = v6 + v13;
        if (v12 >= v5)
          v5 = v12;
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  if (v6 >= 28.0)
    v14 = v6;
  else
    v14 = 28.0;
  v15 = ceil(v5 + 28.0 + 4.0);
  result.height = v14;
  result.width = v15;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[VUIRoundButton sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setButtonImage:(id)a3
{
  UIImage **p_buttonImage;
  void *v6;
  id v7;

  p_buttonImage = &self->_buttonImage;
  v7 = a3;
  if ((-[UIImage isEqual:](*p_buttonImage, "isEqual:") & 1) == 0)
  {
    -[VUIRoundButton button](self, "button");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:forState:", v7, 0);

    objc_storeStrong((id *)p_buttonImage, a3);
  }

}

- (void)setTextLabels:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSArray isEqualToArray:](self->_textLabels, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_textLabels, a3);
    -[VUIRoundButton configureTextStackView](self, "configureTextStackView");
  }

}

- (void)_setUpViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
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
  void *v28;
  void *v29;
  id v30;

  -[VUIRoundButton button](self, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIRoundButton addSubview:](self, "addSubview:", v3);

  -[VUIRoundButton button](self, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[VUIRoundButton button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  -[VUIRoundButton button](self, "button");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v8);

  -[VUIRoundButton button](self, "button");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMasksToBounds:", 1);

  -[VUIRoundButton button](self, "button");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerRadius:", 14.0);

  -[VUIRoundButton button](self, "button");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIRoundButton leadingAnchor](self, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[VUIRoundButton button](self, "button");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "heightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToConstant:", 28.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

  -[VUIRoundButton button](self, "button");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "widthAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToConstant:", 28.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  -[VUIRoundButton button](self, "button");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "centerYAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIRoundButton centerYAnchor](self, "centerYAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActive:", 1);

  -[VUIRoundButton button](self, "button");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setImageEdgeInsets:", 7.0, 7.0, 7.0, 7.0);

  -[VUIRoundButton button](self, "button");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addTarget:action:forControlEvents:", self, sel_buttonSelected_, 3);

  -[VUIRoundButton button](self, "button");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addTarget:action:forControlEvents:", self, sel_buttonReleased_, 128);

  -[VUIRoundButton button](self, "button");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addTarget:action:forControlEvents:", self, sel_buttonPressed_, 64);

}

- (void)configureTextStackView
{
  UIStackView *textLabelStackView;
  UIStackView *v4;
  id v5;
  void *v6;
  UIStackView *v7;
  UIStackView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  textLabelStackView = self->_textLabelStackView;
  if (textLabelStackView)
  {
    -[UIStackView removeFromSuperview](textLabelStackView, "removeFromSuperview");
    v4 = self->_textLabelStackView;
    self->_textLabelStackView = 0;

  }
  v5 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  -[VUIRoundButton textLabels](self, "textLabels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (UIStackView *)objc_msgSend(v5, "initWithArrangedSubviews:", v6);
  v8 = self->_textLabelStackView;
  self->_textLabelStackView = v7;

  -[VUIRoundButton textLabelStackView](self, "textLabelStackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIRoundButton addSubview:](self, "addSubview:", v9);

  -[VUIRoundButton textLabelStackView](self, "textLabelStackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[VUIRoundButton textLabelStackView](self, "textLabelStackView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAxis:", 1);

  -[VUIRoundButton textLabelStackView](self, "textLabelStackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "centerYAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIRoundButton button](self, "button");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "centerYAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[VUIRoundButton textLabelStackView](self, "textLabelStackView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIRoundButton button](self, "button");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v20, 4.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  -[VUIRoundButton textLabelStackView](self, "textLabelStackView");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIRoundButton trailingAnchor](self, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setActive:", 1);

}

- (void)buttonSelected:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v4 = a3;
  objc_msgSend(v3, "vui_keyBlueHighlightedColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

}

- (void)buttonReleased:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v4 = a3;
  objc_msgSend(v3, "vui_keyColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

}

- (void)buttonPressed:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0DC3658];
  v5 = a3;
  objc_msgSend(v4, "vui_keyColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  -[VUIRoundButton delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didSelectButton:", self);

}

- (UIImage)buttonImage
{
  return self->_buttonImage;
}

- (NSArray)textLabels
{
  return self->_textLabels;
}

- (VUIRoundButtonDelegate)delegate
{
  return (VUIRoundButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (UIStackView)textLabelStackView
{
  return self->_textLabelStackView;
}

- (void)setTextLabelStackView:(id)a3
{
  objc_storeStrong((id *)&self->_textLabelStackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabelStackView, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textLabels, 0);
  objc_storeStrong((id *)&self->_buttonImage, 0);
}

@end
