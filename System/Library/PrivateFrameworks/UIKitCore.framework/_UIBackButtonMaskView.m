@implementation _UIBackButtonMaskView

- (UIImageView)maskImageView
{
  return self->_maskImageView;
}

- (NSLayoutXAxisAnchor)maskExtensionLeadingAnchor
{
  return -[UIView leadingAnchor](self->_maskExtensionView, "leadingAnchor");
}

- (_UIBackButtonMaskView)initWithFrame:(CGRect)a3
{
  _UIBackButtonMaskView *v3;
  _UIBackButtonMaskView *v4;
  uint64_t v5;
  UIImageView *maskImageView;
  void *v7;
  uint64_t v8;
  UIView *maskExtensionView;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)_UIBackButtonMaskView;
  v3 = -[UIView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[UIView setCompositingMode:](v4, "setCompositingMode:", 19);
    v5 = objc_opt_new();
    maskImageView = v4->_maskImageView;
    v4->_maskImageView = (UIImageView *)v5;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_maskImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    +[UIColor whiteColor](UIColor, "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTintColor:](v4->_maskImageView, "setTintColor:", v7);

    -[UIView addSubview:](v4, "addSubview:", v4->_maskImageView);
    v8 = objc_opt_new();
    maskExtensionView = v4->_maskExtensionView;
    v4->_maskExtensionView = (UIView *)v8;

    +[UIColor whiteColor](UIColor, "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_maskExtensionView, "setBackgroundColor:", v10);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_maskExtensionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v4, "addSubview:", v4->_maskExtensionView);
    v21 = (void *)MEMORY[0x1E0D156E0];
    -[UIView leadingAnchor](v4, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v4->_maskImageView, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintLessThanOrEqualToAnchor:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v23;
    -[UIView trailingAnchor](v4->_maskExtensionView, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v4, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v12;
    -[UIView topAnchor](v4, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v4->_maskExtensionView, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v15;
    -[UIView bottomAnchor](v4, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v4->_maskExtensionView, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activateConstraints:", v19);

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskImageView, 0);
  objc_storeStrong((id *)&self->_maskExtensionView, 0);
}

@end
