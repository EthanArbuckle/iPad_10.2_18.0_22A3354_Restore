@implementation _TVCardFloatingContentView

- (_TVCardFloatingContentView)initWithFrame:(CGRect)a3
{
  _TVCardFloatingContentView *v3;
  _TVCardFloatingContentView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TVCardFloatingContentView;
  v3 = -[_UIFloatingContentView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_UIFloatingContentView setContentOpaque:](v3, "setContentOpaque:", 1);
    -[_UIFloatingContentView setContentMotionRotation:translation:](v4, "setContentMotionRotation:translation:", 0.08, 0.08, 12.0, 12.0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[_UIFloatingContentView setHighlightStyle:](v4, "setHighlightStyle:", 1);
    -[_UIFloatingContentView setFloatingContentDelegate:](v4, "setFloatingContentDelegate:", v4);
    -[_TVCardFloatingContentView setFocusedShadowCardSize:](v4, "setFocusedShadowCardSize:", 200.0, 200.0);
    -[_TVCardFloatingContentView setUnfocusedShadowCardSize:](v4, "setUnfocusedShadowCardSize:", 26.0, 26.0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__updateForAccessibilityChange, *MEMORY[0x24BED27B0], 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_TVCardFloatingContentView;
  -[_UIFloatingContentView dealloc](&v4, sel_dealloc);
}

- (void)_updateForAccessibilityChange
{
  -[_UIFloatingContentView setShowsHighContrastFocusIndicator:](self, "setShowsHighContrastFocusIndicator:", _AXSHighContrastFocusIndicatorsEnabled() != 0);
}

- (void)setBgColor:(id)a3 highlightBgColor:(id)a4 cornerRadius:(double)a5
{
  unint64_t v8;
  unint64_t v9;

  v9 = (unint64_t)a3;
  v8 = (unint64_t)a4;
  self->_unfocusedAlpha = 1.0;
  -[_UIFloatingContentView setCornerRadius:](self, "setCornerRadius:", 0.0);
  -[_UIFloatingContentView setBackgroundColor:forState:](self, "setBackgroundColor:forState:", 0, 0);
  -[_UIFloatingContentView setBackgroundColor:forState:](self, "setBackgroundColor:forState:", 0, 8);
  -[_UIFloatingContentView setBackgroundColor:forState:](self, "setBackgroundColor:forState:", 0, 1);
  -[_UIFloatingContentView setBackgroundColor:forState:](self, "setBackgroundColor:forState:", 0, 4);
  if (v9 | v8)
  {
    -[_TVCardFloatingContentView setAlpha:](self, "setAlpha:", 1.0);
    -[_UIFloatingContentView setCornerRadius:](self, "setCornerRadius:", a5);
    -[_UIFloatingContentView setBackgroundColor:forState:](self, "setBackgroundColor:forState:", v9, 0);
    if (v8)
    {
      -[_UIFloatingContentView setBackgroundColor:forState:](self, "setBackgroundColor:forState:", v8, 8);
      -[_UIFloatingContentView setBackgroundColor:forState:](self, "setBackgroundColor:forState:", v8, 1);
      -[_UIFloatingContentView setBackgroundColor:forState:](self, "setBackgroundColor:forState:", v8, 4);
    }
  }

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  UIView *unfocusedShadowView;
  UIView *focusedShadowView;

  -[_UIFloatingContentView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  unfocusedShadowView = self->_unfocusedShadowView;
  self->_unfocusedShadowView = 0;

  focusedShadowView = self->_focusedShadowView;
  self->_focusedShadowView = 0;

}

- (void)setUnfocusedShadowImage:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double Width;
  double v11;
  double Height;
  double v13;
  double v14;
  double v15;
  UIView *unfocusedShadowView;
  UIView *v17;
  UIView *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double unfocusedShadowAlpha;
  id v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v5 = a3;
  objc_storeStrong((id *)&self->_unfocusedShadowImage, a3);
  objc_msgSend(v5, "size");
  v7 = v6;
  v9 = v8;
  -[_TVCardFloatingContentView bounds](self, "bounds");
  Width = CGRectGetWidth(v25);
  v11 = self->_unfocusedShadowCardSize.width;
  -[_TVCardFloatingContentView bounds](self, "bounds");
  Height = CGRectGetHeight(v26);
  v13 = self->_unfocusedShadowCardSize.height;
  -[_TVCardFloatingContentView bounds](self, "bounds");
  v14 = CGRectGetWidth(v27);
  -[_TVCardFloatingContentView bounds](self, "bounds");
  v15 = CGRectGetHeight(v28);
  unfocusedShadowView = self->_unfocusedShadowView;
  if (!unfocusedShadowView)
  {
    v17 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", floor((v14 - (v7 + Width - v11)) * 0.5), floor((v15 - (v9 + Height - v13)) * 0.5), v7 + Width - v11, v9 + Height - v13);
    v18 = self->_unfocusedShadowView;
    self->_unfocusedShadowView = v17;

    -[_UIFloatingContentView contentView](self, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "insertSubview:atIndex:", self->_unfocusedShadowView, 0);

    unfocusedShadowView = self->_unfocusedShadowView;
  }
  -[UIView layer](unfocusedShadowView, "layer", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_retainAutorelease(v5);
  objc_msgSend(v20, "setContents:", objc_msgSend(v24, "CGImage"));

  -[UIView layer](self->_unfocusedShadowView, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "scale");
  objc_msgSend(v21, "setContentsScale:");

  -[UIView layer](self->_unfocusedShadowView, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setContentsCenter:", 0.5, 0.5, 0.1, 0.1);

  unfocusedShadowAlpha = 0.0;
  if (!self->_isSelected)
    unfocusedShadowAlpha = self->_unfocusedShadowAlpha;
  -[UIView setAlpha:](self->_unfocusedShadowView, "setAlpha:", unfocusedShadowAlpha);

}

- (void)setFocusedShadowImage:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double Width;
  double v11;
  double Height;
  double v13;
  double v14;
  double v15;
  UIView *focusedShadowView;
  UIView *v17;
  UIView *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double focusedShadowAlpha;
  id v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v5 = a3;
  objc_storeStrong((id *)&self->_focusedShadowImage, a3);
  objc_msgSend(v5, "size");
  v7 = v6;
  v9 = v8;
  -[_TVCardFloatingContentView bounds](self, "bounds");
  Width = CGRectGetWidth(v25);
  v11 = self->_focusedShadowCardSize.width;
  -[_TVCardFloatingContentView bounds](self, "bounds");
  Height = CGRectGetHeight(v26);
  v13 = self->_focusedShadowCardSize.height;
  -[_TVCardFloatingContentView bounds](self, "bounds");
  v14 = CGRectGetWidth(v27);
  -[_TVCardFloatingContentView bounds](self, "bounds");
  v15 = CGRectGetHeight(v28);
  focusedShadowView = self->_focusedShadowView;
  if (!focusedShadowView)
  {
    v17 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", floor((v14 - (v7 + Width - v11)) * 0.5), floor((v15 - (v9 + Height - v13)) * 0.5), v7 + Width - v11, v9 + Height - v13);
    v18 = self->_focusedShadowView;
    self->_focusedShadowView = v17;

    -[_UIFloatingContentView contentView](self, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "insertSubview:atIndex:", self->_focusedShadowView, 0);

    focusedShadowView = self->_focusedShadowView;
  }
  -[UIView layer](focusedShadowView, "layer", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_retainAutorelease(v5);
  objc_msgSend(v20, "setContents:", objc_msgSend(v24, "CGImage"));

  -[UIView layer](self->_focusedShadowView, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "scale");
  objc_msgSend(v21, "setContentsScale:");

  -[UIView layer](self->_focusedShadowView, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setContentsCenter:", 0.5, 0.5, 0.1, 0.1);

  if (self->_isSelected)
    focusedShadowAlpha = self->_focusedShadowAlpha;
  else
    focusedShadowAlpha = 0.0;
  -[UIView setAlpha:](self->_focusedShadowView, "setAlpha:", focusedShadowAlpha);

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  BOOL v18;
  BOOL v19;
  _QWORD v20[4];
  void (**v21)(_QWORD);
  _QWORD v22[5];
  BOOL v23;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  self->_isSelected = v6;
  if (v6)
    v9 = 8;
  else
    v9 = 0;
  -[_UIFloatingContentView setControlState:withAnimationCoordinator:](self, "setControlState:withAnimationCoordinator:", v9, v8);
  v10 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __76___TVCardFloatingContentView_setSelected_animated_withAnimationCoordinator___block_invoke;
  v22[3] = &unk_24EB852F8;
  v22[4] = self;
  v23 = v6;
  v11 = (void (**)(_QWORD))MEMORY[0x22767F470](v22);
  v12 = v11;
  if (v5)
  {
    v20[0] = v10;
    v20[1] = 3221225472;
    v20[2] = __76___TVCardFloatingContentView_setSelected_animated_withAnimationCoordinator___block_invoke_3;
    v20[3] = &unk_24EB85320;
    v21 = v11;
    objc_msgSend(v8, "addCoordinatedAnimationsForAnimation:animations:completion:", !v6, v20, 0);

  }
  else
  {
    v11[2](v11);
  }
  -[_UIFloatingContentView contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "subviews");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __76___TVCardFloatingContentView_setSelected_animated_withAnimationCoordinator___block_invoke_4;
  v16[3] = &unk_24EB85348;
  v18 = v6;
  v19 = v5;
  v17 = v8;
  v15 = v8;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v16);

}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  uint64_t v7;
  id v8;

  v5 = a4;
  v7 = a3 | (8 * self->_isSelected);
  v8 = a5;
  -[_UIFloatingContentView setControlState:animated:](self, "setControlState:animated:", v7, v5);
  -[_TVCardFloatingContentView setPressCompletionBlock:](self, "setPressCompletionBlock:", v8);

}

- (void)floatingContentView:(id)a3 didFinishTransitioningToState:(unint64_t)a4
{
  void *v5;
  void (**v6)(void);

  -[_TVCardFloatingContentView pressCompletionBlock](self, "pressCompletionBlock", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_TVCardFloatingContentView pressCompletionBlock](self, "pressCompletionBlock");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

    -[_TVCardFloatingContentView setPressCompletionBlock:](self, "setPressCompletionBlock:", 0);
  }
}

- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIEdgeInsets result;

  if (a3.width == 0.0 || (height = a3.height, a3.height == 0.0))
  {
    -[_TVCardFloatingContentView bounds](self, "bounds");
    width = v6;
    height = v7;
  }
  else
  {
    width = a3.width;
  }
  -[_TVCardFloatingContentView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anchorPoint");
  v10 = v9;
  v12 = v11;

  if (width <= height)
    v13 = height;
  else
    v13 = width;
  -[_UIFloatingContentView focusedSizeIncrease](self, "focusedSizeIncrease");
  v15 = (v13 + v14) / v13;
  v16 = width * v15 - width;
  v17 = height * v15 - height;
  v18 = floor(v12 * v17);
  v19 = floor(v10 * v16);
  v20 = floor((1.0 - v12) * v17);
  v21 = floor((1.0 - v10) * v16);
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  objc_super v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v27.receiver = self;
  v27.super_class = (Class)_TVCardFloatingContentView;
  -[_UIFloatingContentView layoutSubviews](&v27, sel_layoutSubviews);
  -[_TVCardFloatingContentView unfocusedShadowImage](self, "unfocusedShadowImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  -[_TVCardFloatingContentView bounds](self, "bounds");
  v8 = v5 + CGRectGetWidth(v28);
  -[_TVCardFloatingContentView unfocusedShadowCardSize](self, "unfocusedShadowCardSize");
  v10 = v8 - v9;
  -[_TVCardFloatingContentView bounds](self, "bounds");
  v11 = v7 + CGRectGetHeight(v29);
  -[_TVCardFloatingContentView unfocusedShadowCardSize](self, "unfocusedShadowCardSize");
  v13 = v11 - v12;
  -[_TVCardFloatingContentView bounds](self, "bounds");
  v14 = floor((CGRectGetWidth(v30) - v10) * 0.5);
  -[_TVCardFloatingContentView bounds](self, "bounds");
  -[UIView setFrame:](self->_unfocusedShadowView, "setFrame:", v14, floor((CGRectGetHeight(v31) - v13) * 0.5), v10, v13);
  -[_TVCardFloatingContentView focusedShadowImage](self, "focusedShadowImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "size");
  v17 = v16;
  v19 = v18;

  -[_TVCardFloatingContentView bounds](self, "bounds");
  v20 = v17 + CGRectGetWidth(v32);
  -[_TVCardFloatingContentView focusedShadowCardSize](self, "focusedShadowCardSize");
  v22 = v20 - v21;
  -[_TVCardFloatingContentView bounds](self, "bounds");
  v23 = v19 + CGRectGetHeight(v33);
  -[_TVCardFloatingContentView focusedShadowCardSize](self, "focusedShadowCardSize");
  v25 = v23 - v24;
  -[_TVCardFloatingContentView bounds](self, "bounds");
  v26 = floor((CGRectGetWidth(v34) - v22) * 0.5);
  -[_TVCardFloatingContentView bounds](self, "bounds");
  -[UIView setFrame:](self->_focusedShadowView, "setFrame:", v26, floor((CGRectGetHeight(v35) - v25) * 0.5), v22, v25);
}

- (double)unfocusedShadowAlpha
{
  return self->_unfocusedShadowAlpha;
}

- (void)setUnfocusedShadowAlpha:(double)a3
{
  self->_unfocusedShadowAlpha = a3;
}

- (double)focusedShadowAlpha
{
  return self->_focusedShadowAlpha;
}

- (void)setFocusedShadowAlpha:(double)a3
{
  self->_focusedShadowAlpha = a3;
}

- (UIImage)unfocusedShadowImage
{
  return self->_unfocusedShadowImage;
}

- (UIImage)focusedShadowImage
{
  return self->_focusedShadowImage;
}

- (CGSize)focusedShadowCardSize
{
  double width;
  double height;
  CGSize result;

  width = self->_focusedShadowCardSize.width;
  height = self->_focusedShadowCardSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setFocusedShadowCardSize:(CGSize)a3
{
  self->_focusedShadowCardSize = a3;
}

- (CGSize)unfocusedShadowCardSize
{
  double width;
  double height;
  CGSize result;

  width = self->_unfocusedShadowCardSize.width;
  height = self->_unfocusedShadowCardSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setUnfocusedShadowCardSize:(CGSize)a3
{
  self->_unfocusedShadowCardSize = a3;
}

- (id)pressCompletionBlock
{
  return self->_pressCompletionBlock;
}

- (void)setPressCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 904);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pressCompletionBlock, 0);
  objc_storeStrong((id *)&self->_focusedShadowImage, 0);
  objc_storeStrong((id *)&self->_unfocusedShadowImage, 0);
  objc_storeStrong((id *)&self->_focusedShadowView, 0);
  objc_storeStrong((id *)&self->_unfocusedShadowView, 0);
}

@end
