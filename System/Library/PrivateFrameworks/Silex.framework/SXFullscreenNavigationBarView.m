@implementation SXFullscreenNavigationBarView

- (SXFullscreenNavigationBarView)init
{
  SXFullscreenNavigationBarView *v2;
  SXFullscreenNavigationBarView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXFullscreenNavigationBarView;
  v2 = -[SXFullscreenNavigationBarView init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SXFullscreenNavigationBarView createBackgroundView](v2, "createBackgroundView");
    -[SXFullscreenNavigationBarView createDoneButton](v3, "createDoneButton");
  }
  return v3;
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SXFullscreenNavigationBarView;
  -[SXFullscreenNavigationBarView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[SXFullscreenNavigationBarView updateFrameAnimated:](self, "updateFrameAnimated:", 0);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SXFullscreenNavigationBarView;
  -[SXFullscreenNavigationBarView layoutSubviews](&v3, sel_layoutSubviews);
  -[SXFullscreenNavigationBarView updateFrameAnimated:](self, "updateFrameAnimated:", 0);
}

- (void)updateFrameAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  CGFloat MinX;
  CGFloat Width;
  BOOL v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[5];
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v3 = a3;
  -[SXFullscreenNavigationBarView superview](self, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[SXFullscreenNavigationBarView traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "verticalSizeClass") == 1)
  {
    -[SXFullscreenNavigationBarView traitCollection](self, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "horizontalSizeClass") == 1)
      v16 = 32.0;
    else
      v16 = 44.0;

  }
  else
  {
    v16 = 44.0;
  }

  -[SXFullscreenNavigationBarView safeAreaInsets](self, "safeAreaInsets");
  v18 = v16 + v17;
  v32.origin.x = v7;
  v32.origin.y = v9;
  v32.size.width = v11;
  v32.size.height = v13;
  MinX = CGRectGetMinX(v32);
  v33.origin.x = v7;
  v33.origin.y = v9;
  v33.size.width = v11;
  v33.size.height = v13;
  Width = CGRectGetWidth(v33);
  v21 = -[SXFullscreenNavigationBarView expanded](self, "expanded");
  v22 = 0.0;
  if (!v21)
  {
    v23 = MinX;
    v24 = Width;
    v25 = v18;
    v22 = 0.0 - CGRectGetHeight(*(CGRect *)(&v22 - 1));
  }
  v26 = MinX;
  v27 = Width;
  v28 = v18;
  v34 = CGRectIntegral(*(CGRect *)(&v22 - 1));
  -[SXFullscreenNavigationBarView setFrame:](self, "setFrame:", v34.origin.x, v34.origin.y, v34.size.width, v34.size.height);
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __53__SXFullscreenNavigationBarView_updateFrameAnimated___block_invoke;
  v31[3] = &unk_24D6874A8;
  v31[4] = self;
  v29 = MEMORY[0x219A070A8](v31);
  v30 = (void *)v29;
  if (v3)
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 6, v29, 0, 0.15, 0.0);
  else
    (*(void (**)(uint64_t))(v29 + 16))(v29);

}

uint64_t __53__SXFullscreenNavigationBarView_updateFrameAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", (double)objc_msgSend(*(id *)(a1 + 32), "expanded"));
}

- (void)setFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  uint64_t v9;
  void *v10;
  SXFullscreenNavigationBarView *v11;
  SXFullscreenNavigationBarView *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v24.receiver = self;
  v24.super_class = (Class)SXFullscreenNavigationBarView;
  -[SXFullscreenNavigationBarView setFrame:](&v24, sel_setFrame_);
  -[SXFullscreenNavigationBarView backgroundView](self, "backgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenNavigationBarView bounds](self, "bounds");
  objc_msgSend(v8, "setFrame:");

  -[SXFullscreenNavigationBarView superview](self, "superview");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (SXFullscreenNavigationBarView *)v9;
  else
    v11 = self;
  v12 = v11;

  -[SXFullscreenNavigationBarView safeAreaInsets](v12, "safeAreaInsets");
  v14 = v13;
  -[SXFullscreenNavigationBarView traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 22.0;
  if (objc_msgSend(v15, "verticalSizeClass") == 1)
  {
    -[SXFullscreenNavigationBarView traitCollection](self, "traitCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "horizontalSizeClass") == 1)
      v16 = 16.0;
    else
      v16 = 22.0;

  }
  -[SXFullscreenNavigationBarView safeAreaInsets](self, "safeAreaInsets");
  v19 = v18;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v20 = CGRectGetWidth(v25);
  -[SXFullscreenNavigationBarView button](self, "button");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v22 = v20 + CGRectGetWidth(v26) * -0.5 + -5.0 - v14;

  -[SXFullscreenNavigationBarView button](self, "button");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setCenter:", v22, v16 + v19);

}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  self->_expanded = a3;
  -[SXFullscreenNavigationBarView updateFrameAnimated:](self, "updateFrameAnimated:", a4);
}

- (void)createBackgroundView
{
  UIVisualEffectView *v3;
  UIVisualEffectView *backgroundView;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FC8]), "initWithEffect:", v6);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v3;

  -[UIVisualEffectView _setGroupName:](self->_backgroundView, "_setGroupName:", CFSTR("captionBars"));
  -[SXFullscreenNavigationBarView backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenNavigationBarView addSubview:](self, "addSubview:", v5);

}

- (void)createDoneButton
{
  UIButton *v3;
  UIButton *button;
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
  double *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  CGRect v26;
  CGRect v27;

  objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
  v3 = (UIButton *)objc_claimAutoreleasedReturnValue();
  button = self->_button;
  self->_button = v3;

  -[SXFullscreenNavigationBarView button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SXBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Done"), &stru_24D68E0F8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v7, 0);

  -[SXFullscreenNavigationBarView button](self, "button");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitleColor:forState:", v9, 0);

  -[SXFullscreenNavigationBarView button](self, "button");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontSize");
  objc_msgSend(v12, "boldSystemFontOfSize:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v13);

  -[SXFullscreenNavigationBarView button](self, "button");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addTarget:action:forControlEvents:", self, sel_doneButtonPressed_, 64);

  -[SXFullscreenNavigationBarView button](self, "button");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sizeToFit");

  v16 = (double *)MEMORY[0x24BDBEFB0];
  -[SXFullscreenNavigationBarView frame](self, "frame");
  if (v17 >= 22.0)
  {
    v19 = *v16;
  }
  else
  {
    -[SXFullscreenNavigationBarView frame](self, "frame");
    v19 = (22.0 - v18) * 0.5;
  }
  -[SXFullscreenNavigationBarView frame](self, "frame");
  if (v20 >= 44.0)
  {
    v22 = v16[1];
  }
  else
  {
    -[SXFullscreenNavigationBarView frame](self, "frame");
    v22 = (44.0 - v21) * 0.5;
  }
  -[SXFullscreenNavigationBarView button](self, "button");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenNavigationBarView button](self, "button");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "frame");
  v27 = CGRectInset(v26, -v19, -v22);
  objc_msgSend(v23, "setFrame:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);

  -[SXFullscreenNavigationBarView button](self, "button");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenNavigationBarView addSubview:](self, "addSubview:", v25);

}

- (void)doneButtonPressed:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[SXFullscreenNavigationBarView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SXFullscreenNavigationBarView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fullscreenNavigationBarViewDoneButtonPressed:", self);

  }
}

- (SXFullscreenNavigationBarViewDelegate)delegate
{
  return (SXFullscreenNavigationBarViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (UIButton)button
{
  return self->_button;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
