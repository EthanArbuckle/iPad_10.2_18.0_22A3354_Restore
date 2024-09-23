@implementation SKUIOnboardingFooterView

- (void)hideLeftButtonWithAnimation:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIOnboardingFooterView hideLeftButtonWithAnimation:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIOnboardingFooterView _hideButton:withAnimation:](self, "_hideButton:withAnimation:", self->_leftButton, a3);
}

- (void)hideRightButtonWithAnimation:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIOnboardingFooterView hideRightButtonWithAnimation:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIOnboardingFooterView _hideButton:withAnimation:](self, "_hideButton:withAnimation:", self->_rightButton, a3);
}

- (UIButton)leftButton
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  UIButton *leftButton;
  UIButton *v12;
  UIButton *v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIOnboardingFooterView leftButton].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  leftButton = self->_leftButton;
  if (!leftButton)
  {
    v12 = -[SKUIOnboardingFooterView _newButton](self, "_newButton");
    v13 = self->_leftButton;
    self->_leftButton = v12;

    -[SKUIOnboardingFooterView addSubview:](self, "addSubview:", self->_leftButton);
    leftButton = self->_leftButton;
  }
  return leftButton;
}

- (UIButton)rightButton
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  UIButton *rightButton;
  UIButton *v12;
  UIButton *v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIOnboardingFooterView rightButton].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  rightButton = self->_rightButton;
  if (!rightButton)
  {
    v12 = -[SKUIOnboardingFooterView _newButton](self, "_newButton");
    v13 = self->_rightButton;
    self->_rightButton = v12;

    -[SKUIOnboardingFooterView addSubview:](self, "addSubview:", self->_rightButton);
    rightButton = self->_rightButton;
  }
  return rightButton;
}

- (void)setProgressView:(id)a3
{
  SKUIOnboardingProgressView *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SKUIOnboardingProgressView *progressView;

  v5 = (SKUIOnboardingProgressView *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIOnboardingFooterView setProgressView:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  progressView = self->_progressView;
  if (progressView != v5)
  {
    -[SKUIOnboardingProgressView removeFromSuperview](progressView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_progressView, a3);
    if (self->_progressView)
      -[SKUIOnboardingFooterView addSubview:](self, "addSubview:");
    -[SKUIOnboardingFooterView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)showLeftButtonWithTitle:(id)a3 animation:(int64_t)a4
{
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUIOnboardingFooterView showLeftButtonWithTitle:animation:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  -[SKUIOnboardingFooterView leftButton](self, "leftButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIOnboardingFooterView _showButton:withTitle:animation:](self, "_showButton:withTitle:animation:", v15, v6, a4);

}

- (void)showRightButtonWithTitle:(id)a3 animation:(int64_t)a4
{
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUIOnboardingFooterView showRightButtonWithTitle:animation:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  -[SKUIOnboardingFooterView rightButton](self, "rightButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIOnboardingFooterView _showButton:withTitle:animation:](self, "_showButton:withTitle:animation:", v15, v6, a4);

}

- (void)layoutSubviews
{
  OUTLINED_FUNCTION_1();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  SKUIOnboardingProgressView *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t i;
  double v21;
  double v22;
  UIButton *v23;
  UIButton *v24;
  SKUIOnboardingProgressView *v25;
  uint64_t v26;
  CGSize result;

  v26 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[SKUIOnboardingFooterView sizeThatFits:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = *MEMORY[0x1E0C9D820];
  v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v23 = self->_leftButton;
  v24 = self->_rightButton;
  v14 = self->_progressView;
  v15 = 0;
  v25 = v14;
  v16 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v17 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  do
  {
    -[UIButton sizeThatFits:](*(UIButton **)((char *)&v23 + v15), "sizeThatFits:", v16, v17, v23, v24, v25, v26);
    if (v13 < v19)
      v13 = v19;
    v12 = v12 + v18;
    v15 += 8;
  }
  while (v15 != 24);
  for (i = 16; i != -8; i -= 8)

  v21 = v12;
  v22 = v13;
  result.height = v22;
  result.width = v21;
  return result;
}

- (void)_hideButton:(id)a3 withAnimation:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v6 = a3;
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "isHidden") & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E0DC3F10];
    v9 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __54__SKUIOnboardingFooterView__hideButton_withAnimation___block_invoke;
    v18[3] = &unk_1E739FD38;
    v10 = v7;
    v19 = v10;
    objc_msgSend(v8, "_performWithoutAnimation:", v18);
    if (a4 == 2)
    {
      v13 = (void *)MEMORY[0x1E0DC3F10];
      v14[0] = v9;
      v14[1] = 3221225472;
      v14[2] = __54__SKUIOnboardingFooterView__hideButton_withAnimation___block_invoke_3;
      v14[3] = &unk_1E739FD10;
      v14[4] = self;
      v15 = v10;
      objc_msgSend(v13, "animateWithDuration:animations:", v14, 0.5);
      v12 = v15;
    }
    else
    {
      if (a4 == 1)
      {
        objc_msgSend(v10, "setHidden:", 1);
        goto LABEL_10;
      }
      if (a4)
      {
LABEL_10:

        goto LABEL_11;
      }
      v11 = (void *)MEMORY[0x1E0DC3F10];
      v16[0] = v9;
      v16[1] = 3221225472;
      v16[2] = __54__SKUIOnboardingFooterView__hideButton_withAnimation___block_invoke_2;
      v16[3] = &unk_1E739FD38;
      v17 = v10;
      objc_msgSend(v11, "animateWithDuration:animations:", v16, 0.25);
      v12 = v17;
    }

    goto LABEL_10;
  }
LABEL_11:

}

uint64_t __54__SKUIOnboardingFooterView__hideButton_withAnimation___block_invoke(uint64_t a1)
{
  double v2;
  double v3;

  objc_msgSend(*(id *)(a1 + 32), "alpha");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v3);
}

uint64_t __54__SKUIOnboardingFooterView__hideButton_withAnimation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __54__SKUIOnboardingFooterView__hideButton_withAnimation___block_invoke_3(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  void *v12;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 424))
  {
    objc_msgSend(*(id *)(a1 + 40), "frame");
    v3 = v2;
    v5 = v4;
    v7 = v6;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "frame");
    v12 = *(void **)(a1 + 40);
    if (v12 == *(void **)(*(_QWORD *)(a1 + 32) + 416))
    {
      v8 = CGRectGetMaxX(*(CGRect *)&v8) - v5;
      v12 = *(void **)(a1 + 40);
    }
    objc_msgSend(v12, "setFrame:", v8, v3, v5, v7);
  }
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

- (id)_newButton
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);
  return v2;
}

- (void)_showButton:(id)a3 withTitle:(id)a4 animation:(int64_t)a5
{
  UIButton *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v21;
  float v22;
  double v23;
  void *v24;
  UIButton *v25;
  void *v26;
  _QWORD v27[4];
  UIButton *v28;
  SKUIOnboardingFooterView *v29;
  _QWORD v30[4];
  UIButton *v31;

  v8 = (UIButton *)a3;
  v9 = a4;
  -[UIButton setEnabled:](v8, "setEnabled:", 1);
  -[UIButton setTitle:forState:](v8, "setTitle:forState:", v9, 0);

  -[UIButton sizeToFit](v8, "sizeToFit");
  if ((-[UIButton isHidden](v8, "isHidden") & 1) == 0)
  {
    -[UIButton alpha](v8, "alpha");
    if (v10 > 0.00000011920929)
      goto LABEL_13;
  }
  -[UIButton setHidden:](v8, "setHidden:", 0);
  switch(a5)
  {
    case 0:
      goto LABEL_10;
    case 1:
      -[UIButton setAlpha:](v8, "setAlpha:", 1.0);
LABEL_13:
      -[SKUIOnboardingFooterView setNeedsLayout](self, "setNeedsLayout");
      break;
    case 2:
      if (self->_progressView)
      {
        -[SKUIOnboardingFooterView bounds](self, "bounds");
        v12 = v11;
        -[UIButton frame](v8, "frame");
        v14 = v13;
        v16 = v15;
        -[SKUIOnboardingProgressView frame](self->_progressView, "frame");
        v21 = v17;
        if (self->_leftButton == v8)
          v21 = CGRectGetMaxX(*(CGRect *)&v17) - v14;
        v22 = (v12 - v16) * 0.5;
        v23 = floorf(v22);
        -[UIButton setAlpha:](v8, "setAlpha:", 0.0);
        -[UIButton setFrame:](v8, "setFrame:", v21, v23, v14, v16);
        -[SKUIOnboardingFooterView sendSubviewToBack:](self, "sendSubviewToBack:", v8);
        v24 = (void *)MEMORY[0x1E0DC3F10];
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __60__SKUIOnboardingFooterView__showButton_withTitle_animation___block_invoke_2;
        v27[3] = &unk_1E739FD10;
        v28 = v8;
        v29 = self;
        objc_msgSend(v24, "animateWithDuration:animations:", v27, 0.5);
        v25 = v28;
        goto LABEL_11;
      }
LABEL_10:
      -[UIButton setAlpha:](v8, "setAlpha:", 0.0);
      -[SKUIOnboardingFooterView layoutSubviews](self, "layoutSubviews");
      v26 = (void *)MEMORY[0x1E0DC3F10];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __60__SKUIOnboardingFooterView__showButton_withTitle_animation___block_invoke;
      v30[3] = &unk_1E739FD38;
      v31 = v8;
      objc_msgSend(v26, "animateWithDuration:animations:", v30, 0.25);
      v25 = v31;
LABEL_11:

      break;
  }

}

uint64_t __60__SKUIOnboardingFooterView__showButton_withTitle_animation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __60__SKUIOnboardingFooterView__showButton_withTitle_animation___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "layoutSubviews");
}

- (SKUIOnboardingProgressView)progressView
{
  return self->_progressView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightButton, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);
}

- (void)hideLeftButtonWithAnimation:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)hideRightButtonWithAnimation:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)leftButton
{
  OUTLINED_FUNCTION_1();
}

- (void)rightButton
{
  OUTLINED_FUNCTION_1();
}

- (void)setProgressView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)showLeftButtonWithTitle:(uint64_t)a3 animation:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)showRightButtonWithTitle:(uint64_t)a3 animation:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)sizeThatFits:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
