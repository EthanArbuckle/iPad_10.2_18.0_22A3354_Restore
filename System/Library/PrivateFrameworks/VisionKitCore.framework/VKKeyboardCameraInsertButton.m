@implementation VKKeyboardCameraInsertButton

- (VKKeyboardCameraInsertButton)initWithPrimaryAction:(id)a3
{
  id v4;
  VKKeyboardCameraInsertButton *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UIButton *button;
  id v10;
  void *v11;
  uint64_t v12;
  UIVisualEffectView *effectView;
  void *v14;
  void *v15;
  double v16;
  double v17;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  objc_super v50;
  _QWORD v51[10];

  v51[8] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)VKKeyboardCameraInsertButton;
  v5 = -[VKKeyboardCameraInsertButton init](&v50, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A8], "filledButtonConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentInsets:", 12.0, 25.0, 12.0, 25.0);
    v48 = v6;
    objc_msgSend(v6, "background");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", 15.0);

    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithConfiguration:primaryAction:", v6, v4);
    v8 = objc_claimAutoreleasedReturnValue();
    button = v5->_button;
    v5->_button = (UIButton *)v8;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v5->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setAlpha:](v5->_button, "setAlpha:", 0.85);
    -[UIButton setRole:](v5->_button, "setRole:", 1);
    v10 = objc_alloc(MEMORY[0x1E0CEABE8]);
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 1);
    v49 = v4;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithEffect:", v11);
    effectView = v5->_effectView;
    v5->_effectView = (UIVisualEffectView *)v12;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v5->_effectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA5F8], "defaultMetrics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton traitCollection](v5->_button, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scaledValueForValue:compatibleWithTraitCollection:", v15, 15.0);
    v17 = v16;

    -[UIVisualEffectView _setContinuousCornerRadius:](v5->_effectView, "_setContinuousCornerRadius:", v17);
    -[VKKeyboardCameraInsertButton addSubview:](v5, "addSubview:", v5->_effectView);
    -[VKKeyboardCameraInsertButton addSubview:](v5, "addSubview:", v5->_button);
    v18 = (void *)MEMORY[0x1E0CEA5E8];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontSize");
    objc_msgSend(v18, "boldSystemFontOfSize:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](v5->_button, "titleLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFont:", v19);

    v38 = (void *)MEMORY[0x1E0CB3718];
    -[UIVisualEffectView leadingAnchor](v5->_effectView, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKKeyboardCameraInsertButton leadingAnchor](v5, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v45;
    -[UIVisualEffectView bottomAnchor](v5->_effectView, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKKeyboardCameraInsertButton bottomAnchor](v5, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v43);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v42;
    -[UIVisualEffectView topAnchor](v5->_effectView, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKKeyboardCameraInsertButton topAnchor](v5, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v39;
    -[UIVisualEffectView trailingAnchor](v5->_effectView, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKKeyboardCameraInsertButton trailingAnchor](v5, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v51[3] = v35;
    -[UIButton leadingAnchor](v5->_button, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView leadingAnchor](v5->_effectView, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v51[4] = v32;
    -[UIButton bottomAnchor](v5->_button, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKKeyboardCameraInsertButton bottomAnchor](v5, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v51[5] = v22;
    -[UIButton topAnchor](v5->_button, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKKeyboardCameraInsertButton topAnchor](v5, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v51[6] = v25;
    -[UIButton trailingAnchor](v5->_button, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKKeyboardCameraInsertButton trailingAnchor](v5, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v51[7] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "activateConstraints:", v29);

    v4 = v49;
  }

  return v5;
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
