@implementation SKUIComposeReviewNicknameViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[SKUIComposeReviewNicknameViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyboardLayoutGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFollowsUndockedKeyboard:", 1);

  -[SKUIComposeReviewNicknameViewController _setupScrollView](self, "_setupScrollView");
  -[SKUIComposeReviewNicknameViewController _setupNicknameView](self, "_setupNicknameView");
  -[SKUIComposeReviewNicknameViewController _setupBarButtonItems](self, "_setupBarButtonItems");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC54D0];
  -[SKUIComposeReviewNicknameViewController nicknameView](self, "nicknameView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nicknameTextfield");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__updateConfirmState, v5, v7);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v3;
  id v4;

  -[SKUIComposeReviewNicknameViewController nicknameView](self, "nicknameView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nicknameTextfield");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "becomeFirstResponder");

}

- (void)showSendAnimationInNavigationBarWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SKUIComposeReviewNicknameViewController submitButton](self, "submitButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animateWithCompletion:", v4);

}

- (void)_setupScrollView
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
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v3 = (void *)objc_opt_new();
  -[SKUIComposeReviewNicknameViewController setScrollView:](self, "setScrollView:", v3);

  -[SKUIComposeReviewNicknameViewController scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[SKUIComposeReviewNicknameViewController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsVerticalScrollIndicator:", 0);

  -[SKUIComposeReviewNicknameViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameViewController scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  -[SKUIComposeReviewNicknameViewController scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frameLayoutGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeAreaLayoutGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[SKUIComposeReviewNicknameViewController scrollView](self, "scrollView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frameLayoutGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setActive:", 1);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "userInterfaceIdiom");

  -[SKUIComposeReviewNicknameViewController scrollView](self, "scrollView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "frameLayoutGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "widthAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v22 == 1)
  {
    objc_msgSend(v25, "constraintLessThanOrEqualToConstant:", 400.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setActive:", 1);
  }
  else
  {
    -[SKUIComposeReviewNicknameViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "widthAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setActive:", 1);

  }
  -[SKUIComposeReviewNicknameViewController view](self, "view");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "keyboardLayoutGuide");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameViewController scrollView](self, "scrollView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "frameLayoutGuide");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v34, 1.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setActive:", 1);

}

- (void)_setupNicknameView
{
  SKUIComposeReviewNicknameView *v3;
  SKUIComposeReviewNicknameView *v4;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;

  v3 = [SKUIComposeReviewNicknameView alloc];
  v4 = -[SKUIComposeReviewNicknameView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[SKUIComposeReviewNicknameViewController setNicknameView:](self, "setNicknameView:", v4);

  -[SKUIComposeReviewNicknameViewController nicknameView](self, "nicknameView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[SKUIComposeReviewNicknameViewController scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameViewController nicknameView](self, "nicknameView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  -[SKUIComposeReviewNicknameViewController scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentLayoutGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameViewController nicknameView](self, "nicknameView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  -[SKUIComposeReviewNicknameViewController scrollView](self, "scrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentLayoutGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameViewController nicknameView](self, "nicknameView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

  -[SKUIComposeReviewNicknameViewController scrollView](self, "scrollView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "contentLayoutGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameViewController nicknameView](self, "nicknameView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  -[SKUIComposeReviewNicknameViewController scrollView](self, "scrollView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "contentLayoutGuide");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameViewController nicknameView](self, "nicknameView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setActive:", 1);

  -[SKUIComposeReviewNicknameViewController scrollView](self, "scrollView");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "contentLayoutGuide");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "widthAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIComposeReviewNicknameViewController scrollView](self, "scrollView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "frameLayoutGuide");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "widthAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setActive:", 1);

}

- (void)_setupBarButtonItems
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[SUViewController navigationItem](self, "navigationItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0DDC1F0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CONFIRM"), &stru_1E73A9FB0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 2, self, sel__submit);

  objc_msgSend(v9, "setRightBarButtonItem:", v6);
  -[SUViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", 0);

}

- (void)_cancel
{
  SKUIComposeReviewNicknameDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "composeReviewNicknameDidCancel:", self);

  }
}

- (void)_submit
{
  SKUIComposeReviewNicknameDelegate **p_delegate;
  id WeakRetained;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_delegate);
    -[SKUIComposeReviewNicknameViewController nicknameView](self, "nicknameView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nicknameTextfield");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "composeReviewNicknameDidConfirm:nickname:", self, v8);

  }
}

- (void)_updateConfirmState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[SKUIComposeReviewNicknameViewController nicknameView](self, "nicknameView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nicknameTextfield");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[SUViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", objc_msgSend(v9, "length") != 0);

}

- (SKUIComposeReviewNicknameDelegate)delegate
{
  return (SKUIComposeReviewNicknameDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (SKUIComposeReviewNicknameView)nicknameView
{
  return self->_nicknameView;
}

- (void)setNicknameView:(id)a3
{
  objc_storeStrong((id *)&self->_nicknameView, a3);
}

- (SKUIBarButtonItemSubmitWithAnimation)submitButton
{
  return self->_submitButton;
}

- (void)setSubmitButton:(id)a3
{
  objc_storeStrong((id *)&self->_submitButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submitButton, 0);
  objc_storeStrong((id *)&self->_nicknameView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
