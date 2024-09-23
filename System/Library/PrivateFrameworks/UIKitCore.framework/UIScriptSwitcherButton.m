@implementation UIScriptSwitcherButton

- (UIScriptSwitcherButton)initWithFrame:(CGRect)a3
{
  UIScriptSwitcherButton *v3;
  UIImageView *v4;
  UIImageView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIScriptSwitcherButton;
  v3 = -[UIButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(UIImageView);
    -[UIView addSubview:](v3, "addSubview:", v4);
    -[UIImageView setContentMode:](v4, "setContentMode:", 4);
    -[UIScriptSwitcherButton setLeftImageView:](v3, "setLeftImageView:", v4);
    v5 = objc_alloc_init(UIImageView);
    -[UIImageView setContentMode:](v5, "setContentMode:", 4);
    -[UIView addSubview:](v3, "addSubview:", v5);
    -[UIScriptSwitcherButton setRightImageView:](v3, "setRightImageView:", v5);
    -[UIScriptSwitcherButton updateTintColor](v3, "updateTintColor");

  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  objc_super v46;
  CGRect v47;

  v46.receiver = self;
  v46.super_class = (Class)UIScriptSwitcherButton;
  -[UIButton layoutSubviews](&v46, sel_layoutSubviews);
  v3 = 3.0;
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
      v3 = 3.0;
    else
      v3 = 0.0;
  }
  -[UIScriptSwitcherButton leftImage](self, "leftImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UIScriptSwitcherButton leftImage](self, "leftImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "size");
    v7 = v6;
    v9 = v8;

  }
  else
  {
    v7 = *MEMORY[0x1E0C9D820];
    v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  -[UIScriptSwitcherButton rightImage](self, "rightImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[UIScriptSwitcherButton rightImage](self, "rightImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "size");
    v13 = v12;
    v15 = v14;

  }
  else
  {
    v13 = *MEMORY[0x1E0C9D820];
    v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  if (-[UIScriptSwitcherButton isLeading](self, "isLeading"))
    v16 = 10.0;
  else
    v16 = 0.0;
  -[UIScriptSwitcherButton leftImage](self, "leftImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    if (v13 <= 0.0)
      v18 = v7;
    else
      v18 = v7 + v13 + 2.0;
    -[UIView bounds](self, "bounds");
    v20 = v16 + (v19 + -10.0 - v18) * 0.5;
    -[UIView bounds](self, "bounds");
    v22 = v3 + (v21 - v9) * 0.5;
    -[UIScriptSwitcherButton leftImageView](self, "leftImageView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFrame:", v20, v22, v7, v9);

    -[UIScriptSwitcherButton leftImage](self, "leftImage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "imageWithRenderingMode:", 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScriptSwitcherButton leftImageView](self, "leftImageView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setImage:", v25);

  }
  else
  {
    v27 = *MEMORY[0x1E0C9D648];
    v28 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v29 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v30 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    -[UIScriptSwitcherButton leftImageView](self, "leftImageView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFrame:", v27, v28, v29, v30);

    -[UIScriptSwitcherButton leftImageView](self, "leftImageView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setImage:", 0);
  }

  -[UIScriptSwitcherButton rightImage](self, "rightImage");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[UIScriptSwitcherButton leftImage](self, "leftImage");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      -[UIScriptSwitcherButton leftImageView](self, "leftImageView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "frame");
      v16 = CGRectGetMaxX(v47) + 2.0;

    }
    -[UIView bounds](self, "bounds");
    v36 = v3 + (v35 - v15) * 0.5;
    -[UIScriptSwitcherButton rightImageView](self, "rightImageView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setFrame:", v16, v36, v13, v15);

    -[UIScriptSwitcherButton rightImage](self, "rightImage");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "imageWithRenderingMode:", 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScriptSwitcherButton rightImageView](self, "rightImageView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setImage:", v39);

  }
  else
  {
    v41 = *MEMORY[0x1E0C9D648];
    v42 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v43 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v44 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    -[UIScriptSwitcherButton rightImageView](self, "rightImageView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setFrame:", v41, v42, v43, v44);

    -[UIScriptSwitcherButton rightImageView](self, "rightImageView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setImage:", 0);
  }

}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGSize result;

  -[UIScriptSwitcherButton leftImage](self, "leftImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIScriptSwitcherButton leftImage](self, "leftImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "size");
    v6 = v5 + 0.0;

  }
  else
  {
    v6 = 0.0;
  }
  -[UIScriptSwitcherButton rightImage](self, "rightImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIScriptSwitcherButton rightImage](self, "rightImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "size");
    v6 = v6 + v9 + 2.0;

  }
  v12.receiver = self;
  v12.super_class = (Class)UIScriptSwitcherButton;
  -[UIButton intrinsicContentSize](&v12, sel_intrinsicContentSize);
  if (v6 > 0.0)
    v10 = v6 + 10.0;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIScriptSwitcherButton;
  -[UIButton setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[UIScriptSwitcherButton updateTintColor](self, "updateTintColor");
}

- (void)setIsLeading:(BOOL)a3
{
  self->_isLeading = a3;
  -[UIButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateTintColor
{
  void *v3;
  void *v4;
  id v5;

  if (-[UIControl isHighlighted](self, "isHighlighted"))
  {
    +[UIColor grayColor](UIColor, "grayColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](self, "setTintColor:", v5);
  }
  else
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_inheritedRenderConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "lightKeyboard") & 1) != 0)
      +[UIColor systemDarkGrayTintColor](UIColor, "systemDarkGrayTintColor");
    else
      +[UIColor whiteColor](UIColor, "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](self, "setTintColor:", v4);

  }
}

- (UIImageView)leftImageView
{
  return self->_leftImageView;
}

- (void)setLeftImageView:(id)a3
{
  objc_storeStrong((id *)&self->_leftImageView, a3);
}

- (UIImageView)rightImageView
{
  return self->_rightImageView;
}

- (void)setRightImageView:(id)a3
{
  objc_storeStrong((id *)&self->_rightImageView, a3);
}

- (UIImage)leftImage
{
  return self->_leftImage;
}

- (void)setLeftImage:(id)a3
{
  objc_storeStrong((id *)&self->_leftImage, a3);
}

- (UIImage)rightImage
{
  return self->_rightImage;
}

- (void)setRightImage:(id)a3
{
  objc_storeStrong((id *)&self->_rightImage, a3);
}

- (BOOL)isLeading
{
  return self->_isLeading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightImage, 0);
  objc_storeStrong((id *)&self->_leftImage, 0);
  objc_storeStrong((id *)&self->_rightImageView, 0);
  objc_storeStrong((id *)&self->_leftImageView, 0);
}

@end
