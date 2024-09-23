@implementation UIKeyboardCameraGrabberView

- (UIKeyboardCameraGrabberView)init
{
  UIKeyboardCameraGrabberView *v2;
  UIVisualEffectView *v3;
  void *v4;
  uint64_t v5;
  UIVisualEffectView *blurView;
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
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)UIKeyboardCameraGrabberView;
  v2 = -[UIView init](&v24, sel_init);
  if (v2)
  {
    v3 = [UIVisualEffectView alloc];
    +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[UIVisualEffectView initWithEffect:](v3, "initWithEffect:", v4);
    blurView = v2->_blurView;
    v2->_blurView = (UIVisualEffectView *)v5;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v2->_blurView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView layer](v2->_blurView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMasksToBounds:", 1);

    -[UIView layer](v2->_blurView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerRadius:", 2.5);

    -[UIView setUserInteractionEnabled:](v2->_blurView, "setUserInteractionEnabled:", 0);
    -[UIView addSubview:](v2, "addSubview:", v2->_blurView);
    v21 = (void *)MEMORY[0x1E0D156E0];
    -[UIView topAnchor](v2->_blurView, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v2, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22, 10.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v9;
    -[UIView centerXAnchor](v2->_blurView, "centerXAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v2, "centerXAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v12;
    -[UIView widthAnchor](v2->_blurView, "widthAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToConstant:", 36.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v14;
    -[UIView heightAnchor](v2->_blurView, "heightAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToConstant:", 5.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activateConstraints:", v17);

    +[UIColor blackColor](UIColor, "blackColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "colorWithAlphaComponent:", 0.01);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v2, "setBackgroundColor:", v19);

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurView, 0);
}

@end
