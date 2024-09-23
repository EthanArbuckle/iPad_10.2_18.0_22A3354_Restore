@implementation BFFPasscodeView

- (BFFPasscodeView)initWithFrame:(CGRect)a3
{
  BFFPasscodeView *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BFFPasscodeView;
  v3 = -[BFFTitleView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_keyboardWillShow_, *MEMORY[0x24BEBE580], 0);

    +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFPasscodeView setBackgroundColor:](v3, "setBackgroundColor:", v6);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)BFFPasscodeView;
  -[BFFPasscodeView dealloc](&v4, sel_dealloc);
}

- (id)passcodeInputView
{
  return self->_passcodeInputView;
}

- (void)transitionToPasscodeInput:(id)a3 delegate:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  -[BFFPasscodeView passcodeInputView](self, "passcodeInputView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", 0);

  -[BFFPasscodeView passcodeInputView](self, "passcodeInputView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", 0);

  -[BFFPasscodeInputView removeFromSuperview](self->_passcodeInputView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_passcodeInputView, a3);
  if (self->_passcodeInputView)
  {
    -[BFFPasscodeView addSubview:](self, "addSubview:");
    -[BFFPasscodeView passcodeInputView](self, "passcodeInputView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v7);

  }
  -[BFFPasscodeView setNeedsLayout](self, "setNeedsLayout");

}

- (void)animateTransitionToPasscodeInput:(id)a3 animation:(unint64_t)a4
{
  id v7;
  unsigned __int8 v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
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
  double v27;
  double v28;
  double v29;
  double v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  void *v34;
  double v35;
  double v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;

  v7 = a3;
  v8 = -[BFFPasscodeView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (((a4 == 2) & v8) != 0)
    v9 = 1;
  else
    v9 = a4;
  if (((a4 == 1) & v8) != 0)
    v10 = 2;
  else
    v10 = v9;
  -[BFFPasscodeView passcodeInputView](self, "passcodeInputView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", 0);
  objc_msgSend(v11, "setDelegate:", 0);
  objc_storeStrong((id *)&self->_passcodeInputView, a3);
  objc_msgSend(v7, "becomeFirstResponder");
  -[BFFPasscodeView passcodeInputView](self, "passcodeInputView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[BFFPasscodeView bounds](self, "bounds");
  v23 = v22;
  objc_msgSend(v11, "center");
  v25 = v24;
  v27 = v26;
  v28 = v24 + v23;
  v29 = v24 - v23;
  objc_msgSend(v7, "setFrame:", v15, v17, v19, v21);
  if ((unint64_t)(v10 - 1) > 1)
  {
    if (v10 == 3)
      objc_msgSend(v7, "setAlpha:", 0.0);
  }
  else
  {
    if (v10 == 2)
      v30 = v28;
    else
      v30 = v29;
    objc_msgSend(v7, "setCenter:", v30, v27);
  }
  -[BFFPasscodeView addSubview:](self, "addSubview:", v7);
  if (v10 == 1)
    v31 = 1;
  else
    v31 = 2;
  if (v10 == 3)
    v32 = 6;
  else
    v32 = 0;
  if ((unint64_t)(v10 - 1) >= 2)
    v33 = v32;
  else
    v33 = v31;
  v34 = (void *)MEMORY[0x24BEBDB00];
  objc_msgSend(MEMORY[0x24BEBDAE0], "defaultDurationForTransition:", v33);
  v36 = v35;
  v37 = MEMORY[0x24BDAC760];
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __62__BFFPasscodeView_animateTransitionToPasscodeInput_animation___block_invoke;
  v45[3] = &unk_24D234658;
  v48 = v10;
  v46 = v11;
  v49 = v29;
  v50 = v27;
  v51 = v28;
  v52 = v27;
  v47 = v7;
  v53 = v25;
  v54 = v27;
  v41[0] = v37;
  v41[1] = 3221225472;
  v41[2] = __62__BFFPasscodeView_animateTransitionToPasscodeInput_animation___block_invoke_2;
  v41[3] = &unk_24D234680;
  v42 = v46;
  v43 = v47;
  v44 = v12;
  v38 = v12;
  v39 = v47;
  v40 = v46;
  objc_msgSend(v34, "animateWithDuration:animations:completion:", v45, v41, v36);

}

uint64_t __62__BFFPasscodeView_animateTransitionToPasscodeInput_animation___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;

  v1 = result;
  v2 = *(_QWORD *)(result + 48);
  if ((unint64_t)(v2 - 1) >= 2)
  {
    if (v2 == 3)
    {
      objc_msgSend(*(id *)(result + 32), "setAlpha:", 0.0);
      return objc_msgSend(*(id *)(v1 + 40), "setAlpha:", 1.0);
    }
  }
  else
  {
    v3 = *(void **)(result + 32);
    v4 = v2 == 2;
    v5 = 80;
    if (v4)
      v5 = 64;
    v6 = 72;
    if (v4)
      v6 = 56;
    objc_msgSend(v3, "setCenter:", *(double *)(v1 + v6), *(double *)(v1 + v5));
    return objc_msgSend(*(id *)(v1 + 40), "setCenter:", *(double *)(v1 + 88), *(double *)(v1 + 96));
  }
  return result;
}

uint64_t __62__BFFPasscodeView_animateTransitionToPasscodeInput_animation___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "setDelegate:", *(_QWORD *)(a1 + 48));
}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEBE468]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[BFFPasscodeView setCurrentKeyboardFrame:](self, "setCurrentKeyboardFrame:", v7, v9, v11, v13);
  -[BFFPasscodeView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setCurrentKeyboardFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_currentKeyboardFrame;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_currentKeyboardFrame = &self->_currentKeyboardFrame;
  if (!CGRectEqualToRect(a3, self->_currentKeyboardFrame))
  {
    p_currentKeyboardFrame->origin.x = x;
    p_currentKeyboardFrame->origin.y = y;
    p_currentKeyboardFrame->size.width = width;
    p_currentKeyboardFrame->size.height = height;
    -[BFFPasscodeView contentInset](self, "contentInset");
    -[BFFPasscodeView setContentInset:](self, "setContentInset:");
  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double MaxY;
  void *v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double MinY;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  objc_super v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  v50.receiver = self;
  v50.super_class = (Class)BFFPasscodeView;
  -[BFFTitleView layoutSubviews](&v50, sel_layoutSubviews);
  -[BFFPasscodeView passcodeInputView](self, "passcodeInputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (BFFIsiPhone())
    {
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bounds");
      v6 = v5;

      if (v6 <= 480.01)
      {
        -[BFFTitleView titleLabel](self, "titleLabel");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_firstLineBaselineFrameOriginY");
        v9 = v8;

        -[BFFTitleView titleLabel](self, "titleLabel");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_setFirstLineBaselineFrameOriginY:", v9 + -25.0);

        -[BFFTitleView titleLabel](self, "titleLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "frame");
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v19 = v18;

        -[BFFPasscodeView passcodeViewController](self, "passcodeViewController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "navigationController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "navigationBar");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(v22, "frame");
          MaxY = CGRectGetMaxY(v51);
          v52.origin.x = v13;
          v52.origin.y = v15;
          v52.size.width = v17;
          v52.size.height = v19;
          if (CGRectGetMinY(v52) < MaxY)
          {
            -[BFFTitleView titleLabel](self, "titleLabel");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setFrame:", v13, MaxY, v17, v19);

          }
        }

      }
    }
    -[BFFTitleView contentBounds](self, "contentBounds");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    -[BFFTitleView titleLabel](self, "titleLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "frame");
    v34 = CGRectGetMaxY(v53);

    v54.origin.x = v26;
    v54.origin.y = v28;
    v54.size.width = v30;
    v54.size.height = v32;
    v35 = CGRectGetMaxY(v54);
    -[BFFPasscodeView currentKeyboardFrame](self, "currentKeyboardFrame");
    v36 = v34;
    if (v37 > 0.0)
    {
      -[BFFPasscodeView convertPoint:toView:](self, "convertPoint:toView:", 0, 0.0, v35);
      v39 = v38;
      -[BFFPasscodeView currentKeyboardFrame](self, "currentKeyboardFrame");
      MinY = CGRectGetMinY(v55);
      if (v39 <= MinY)
        v36 = 0.0;
      else
        v36 = v39 - MinY;
    }
    v41 = v35 - v36;
    -[BFFPasscodeView passcodeInputView](self, "passcodeInputView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v56.origin.x = v26;
    v56.origin.y = v28;
    v56.size.width = v30;
    v56.size.height = v32;
    objc_msgSend(v42, "sizeThatFits:", CGRectGetWidth(v56), v41 - v34);
    v44 = v43;
    v46 = v45;

    -[BFFPasscodeView passcodeInputView](self, "passcodeInputView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setFrame:", v26, v34, v44, v46);

    -[BFFPasscodeView passcodeInputView](self, "passcodeInputView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "layoutSubviews");

    -[BFFPasscodeView bounds](self, "bounds");
    -[BFFPasscodeView setContentSize:](self, "setContentSize:", v49, v34 + v46);
  }
}

- (BOOL)alwaysBounceVertical
{
  void *v3;
  double MaxY;
  void *v5;
  double v6;
  double v7;
  double v8;
  CGRect v10;

  -[BFFTitleView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  MaxY = CGRectGetMaxY(v10);
  -[BFFPasscodeView passcodeInputView](self, "passcodeInputView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intrinsicContentSize");
  v7 = MaxY + v6;

  -[BFFPasscodeView contentSize](self, "contentSize");
  return v7 > v8;
}

- (UIViewController)passcodeViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_passcodeViewController);
}

- (void)setPasscodeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_passcodeViewController, a3);
}

- (CGRect)currentKeyboardFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_currentKeyboardFrame.origin.x;
  y = self->_currentKeyboardFrame.origin.y;
  width = self->_currentKeyboardFrame.size.width;
  height = self->_currentKeyboardFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_passcodeViewController);
  objc_storeStrong((id *)&self->_passcodeInputView, 0);
}

@end
