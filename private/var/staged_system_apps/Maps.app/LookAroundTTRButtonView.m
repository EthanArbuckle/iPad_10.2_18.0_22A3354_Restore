@implementation LookAroundTTRButtonView

- (id)contentView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTTRButtonView blurView](self, "blurView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contentView"));

  return v3;
}

- (LookAroundTTRButtonView)init
{
  LookAroundTTRButtonView *v2;
  LookAroundTTRButtonView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LookAroundTTRButtonView;
  v2 = -[LookAroundTTRButtonView init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[LookAroundTTRButtonView setAccessibilityIdentifier:](v2, "setAccessibilityIdentifier:", CFSTR("LookAroundTTRButtonView"));
    -[LookAroundTTRButtonView _setupViews](v3, "_setupViews");
    -[LookAroundTTRButtonView _setupConstraints](v3, "_setupConstraints");
  }
  return v3;
}

- (void)_setupViews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("LookAroundTTR")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme visualEffectViewAllowingBlur:](MapsTheme, "visualEffectViewAllowingBlur:", 1));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[LookAroundTTRButtonView addSubview:](self, "addSubview:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[LookAroundTTRButtonView setBackgroundColor:](self, "setBackgroundColor:", v4);

  objc_msgSend(v12, "size");
  v6 = v5 * 0.5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTTRButtonView layer](self, "layer"));
  objc_msgSend(v7, "setCornerRadius:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTTRButtonView layer](self, "layer"));
  objc_msgSend(v8, "setMasksToBounds:", 1);

  -[LookAroundTTRButtonView setBlurView:](self, "setBlurView:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "addTarget:action:forControlEvents:", self, "buttonTapped:", 64);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("LookAroundTTR")));
  objc_msgSend(v9, "setImage:forState:", v10, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTTRButtonView contentView](self, "contentView"));
  objc_msgSend(v11, "addSubview:", v9);

  -[LookAroundTTRButtonView setButton:](self, "setButton:", v9);
}

- (void)_setupConstraints
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[8];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTTRButtonView blurView](self, "blurView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTTRButtonView button](self, "button"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTTRButtonView topAnchor](self, "topAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
  v36[0] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTTRButtonView bottomAnchor](self, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v30));
  v36[1] = v29;
  v31 = v3;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTTRButtonView leadingAnchor](self, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
  v36[2] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTTRButtonView trailingAnchor](self, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
  v36[3] = v23;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTTRButtonView contentView](self, "contentView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v19));
  v36[4] = v18;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTTRButtonView contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v36[5] = v5;
  v22 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTTRButtonView contentView](self, "contentView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v8));
  v36[6] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTTRButtonView contentView](self, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
  v36[7] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

}

- (void)buttonTapped:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundTTRButtonView delegate](self, "delegate"));
  objc_msgSend(v5, "lookAroundTTRButtonView:didTapTTRButton:", self, v4);

}

- (LookAroundTTRButtonViewDelegate)delegate
{
  return (LookAroundTTRButtonViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_blurView, a3);
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
