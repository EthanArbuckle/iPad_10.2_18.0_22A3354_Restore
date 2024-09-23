@implementation VSUIActionStatusView

- (VSUIActionStatusView)initWithFrame:(CGRect)a3
{
  VSUIActionStatusView *v3;
  VSUIActionStatusView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSUIActionStatusView;
  v3 = -[VSUIActionStatusView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[VSUIActionStatusView _setUpViews](v3, "_setUpViews");
  return v4;
}

- (VSUIActionStatusView)initWithCoder:(id)a3
{
  VSUIActionStatusView *v3;
  VSUIActionStatusView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSUIActionStatusView;
  v3 = -[VSUIActionStatusView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[VSUIActionStatusView _setUpViews](v3, "_setUpViews");
  return v4;
}

- (void)resetState
{
  void *v3;
  id v4;

  -[VSUIActionStatusView activityView](self, "activityView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[VSUIActionStatusView errorView](self, "errorView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  -[VSUIActionStatusView _updateAcitivityViewSubviewWithDelegateProvidedView](self, "_updateAcitivityViewSubviewWithDelegateProvidedView");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  char v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[VSUIActionStatusView errorView](self, "errorView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isHidden");

  if ((v7 & 1) != 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)VSUIActionStatusView;
    -[VSUIActionStatusView sizeThatFits:](&v15, sel_sizeThatFits_, width, height);
  }
  else
  {
    -[VSUIActionStatusView errorView](self, "errorView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sizeThatFits:", width, height);
    v12 = v11;
    v14 = v13;

    v8 = v12;
    v9 = v14;
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)progressStateMachine:(id)a3 didTransitionToState:(unint64_t)a4 fromState:(unint64_t)a5 forEvent:(unint64_t)a6
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v9 = a3;
  v18 = v9;
  switch(a4)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      -[VSUIActionStatusView activityView](self, "activityView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = 1;
      goto LABEL_4;
    case 0uLL:
      -[VSUIActionStatusView activityView](self, "activityView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHidden:", 1);

      -[VSUIActionStatusView errorView](self, "errorView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (a6 != 3)
        goto LABEL_9;
      v16 = 0;
      goto LABEL_10;
    case 1uLL:
    case 2uLL:
      -[VSUIActionStatusView activityView](self, "activityView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = 0;
LABEL_4:
      objc_msgSend(v10, "setHidden:", v12);

      goto LABEL_8;
    case 3uLL:
      -[VSUIActionStatusView activityView](self, "activityView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setHidden:", a6 != 2);

LABEL_8:
      -[VSUIActionStatusView errorView](self, "errorView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
LABEL_9:
      v16 = 1;
LABEL_10:
      objc_msgSend(v14, "setHidden:", v16);

      v9 = v18;
      break;
    default:
      break;
  }

}

- (void)progressStateMachine:(id)a3 ignoredEvent:(unint64_t)a4
{
  void *v5;

  v5 = (void *)*MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
    -[VSUIActionStatusView progressStateMachine:ignoredEvent:].cold.1(v5, a4);
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
  void *v30;
  _QWORD v31[10];

  v31[8] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6950], "systemGray5Color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUIActionStatusView setBackgroundColor:](self, "setBackgroundColor:", v4);

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "setHidden:", 1);
  -[VSUIActionStatusView addSubview:](self, "addSubview:", v5);
  -[VSUIActionStatusView setActivityView:](self, "setActivityView:", v5);
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setHidden:", 1);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VSUIActionStatusView addSubview:](self, "addSubview:", v6);
  -[VSUIActionStatusView setErrorView:](self, "setErrorView:", v6);
  v21 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v5, "heightAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToConstant:", 20.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v29;
  objc_msgSend(v5, "widthAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToConstant:", 20.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v27;
  objc_msgSend(v5, "centerXAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUIActionStatusView centerXAnchor](self, "centerXAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v24;
  objc_msgSend(v5, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUIActionStatusView centerYAnchor](self, "centerYAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v20;
  objc_msgSend(v6, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUIActionStatusView topAnchor](self, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v17;
  objc_msgSend(v6, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUIActionStatusView bottomAnchor](self, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v7;
  objc_msgSend(v6, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUIActionStatusView leadingAnchor](self, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[6] = v10;
  objc_msgSend(v6, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUIActionStatusView trailingAnchor](self, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[7] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v14);

}

- (void)_updateAcitivityViewSubviewWithDelegateProvidedView
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
  _QWORD v20[5];

  v20[4] = *MEMORY[0x24BDAC8D0];
  -[VSUIActionStatusView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "progressViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "removeFromSuperview");
    -[UIView addSubview:](self->_activityView, "addSubview:", v5);
    v15 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v5, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_activityView, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v17;
    objc_msgSend(v5, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_activityView, "trailingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v7;
    objc_msgSend(v5, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_activityView, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v10;
    objc_msgSend(v5, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_activityView, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[3] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activateConstraints:", v14);

  }
}

- (VSUIActionStatusViewDelegate)delegate
{
  return (VSUIActionStatusViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIView)activityView
{
  return self->_activityView;
}

- (void)setActivityView:(id)a3
{
  objc_storeStrong((id *)&self->_activityView, a3);
}

- (_VSUIActionStatusErrorView)errorView
{
  return self->_errorView;
}

- (void)setErrorView:(id)a3
{
  objc_storeStrong((id *)&self->_errorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_activityView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)progressStateMachine:(void *)a1 ignoredEvent:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a1;
  objc_msgSend(v3, "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v5;
  _os_log_error_impl(&dword_221537000, v4, OS_LOG_TYPE_ERROR, "progressStateMachine ignoredEvent:%@", (uint8_t *)&v6, 0xCu);

}

@end
