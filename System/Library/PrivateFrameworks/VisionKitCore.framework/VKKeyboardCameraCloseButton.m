@implementation VKKeyboardCameraCloseButton

- (VKKeyboardCameraCloseButton)initWithFrame:(CGRect)a3
{
  VKKeyboardCameraCloseButton *v3;
  uint64_t v4;
  UIButton *button;
  id v6;
  void *v7;
  uint64_t v8;
  UIVisualEffectView *effectView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  objc_super v37;
  _QWORD v38[10];

  v38[8] = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)VKKeyboardCameraCloseButton;
  v3 = -[VKKeyboardCameraCloseButton initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 7);
    v4 = objc_claimAutoreleasedReturnValue();
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    -[UIButton setAlpha:](v3->_button, "setAlpha:", 0.85);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = objc_alloc(MEMORY[0x1E0CEABE8]);
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithEffect:", v7);
    effectView = v3->_effectView;
    v3->_effectView = (UIVisualEffectView *)v8;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v3->_effectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[VKKeyboardCameraCloseButton addSubview:](v3, "addSubview:", v3->_effectView);
    -[VKKeyboardCameraCloseButton addSubview:](v3, "addSubview:", v3->_button);
    v27 = (void *)MEMORY[0x1E0CB3718];
    -[UIVisualEffectView leadingAnchor](v3->_effectView, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKKeyboardCameraCloseButton leadingAnchor](v3, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v34;
    -[UIVisualEffectView bottomAnchor](v3->_effectView, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKKeyboardCameraCloseButton bottomAnchor](v3, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v31;
    -[UIVisualEffectView topAnchor](v3->_effectView, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKKeyboardCameraCloseButton topAnchor](v3, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v28;
    -[UIVisualEffectView trailingAnchor](v3->_effectView, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKKeyboardCameraCloseButton trailingAnchor](v3, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v38[3] = v24;
    -[UIButton leadingAnchor](v3->_button, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView leadingAnchor](v3->_effectView, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v38[4] = v21;
    -[UIButton bottomAnchor](v3->_button, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKKeyboardCameraCloseButton bottomAnchor](v3, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v38[5] = v11;
    -[UIButton topAnchor](v3->_button, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKKeyboardCameraCloseButton topAnchor](v3, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v38[6] = v14;
    -[UIButton trailingAnchor](v3->_button, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKKeyboardCameraCloseButton trailingAnchor](v3, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v38[7] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v18);

  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UIButton intrinsicContentSize](self->_button, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)viewForFirstBaselineLayout
{
  return self->_button;
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)VKKeyboardCameraCloseButton;
  -[VKKeyboardCameraCloseButton layoutSubviews](&v3, sel_layoutSubviews);
  -[UIButton bounds](self->_button, "bounds");
  -[UIVisualEffectView _setContinuousCornerRadius:](self->_effectView, "_setContinuousCornerRadius:", CGRectGetWidth(v4) * 0.5);
}

- (UIButton)uiButton
{
  return self->_button;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
