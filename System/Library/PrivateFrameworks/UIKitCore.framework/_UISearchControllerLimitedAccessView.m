@implementation _UISearchControllerLimitedAccessView

- (_UISearchControllerLimitedAccessView)initWithFrame:(CGRect)a3
{
  _UISearchControllerLimitedAccessView *v3;
  UIView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UIView *backgroundView;
  void *v11;
  UILabel *v12;
  UILabel *keyboardLimitedLabel;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  UIButton *backButton;
  UIButton *v19;
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
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  objc_super v55;
  _QWORD v56[11];

  v56[9] = *MEMORY[0x1E0C80C00];
  v55.receiver = self;
  v55.super_class = (Class)_UISearchControllerLimitedAccessView;
  v3 = -[UIView initWithFrame:](&v55, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIView alloc];
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (UIView *)v9;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    +[UIColor tableBackgroundColor](UIColor, "tableBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_backgroundView, "setBackgroundColor:", v11);

    -[UIView addSubview:](v3, "addSubview:", v3->_backgroundView);
    v12 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v5, v6, v7, v8);
    keyboardLimitedLabel = v3->_keyboardLimitedLabel;
    v3->_keyboardLimitedLabel = v12;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_keyboardLimitedLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(off_1E167A828, "systemFontOfSize:", 28.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_keyboardLimitedLabel, "setFont:", v14);

    +[UIColor labelColor](UIColor, "labelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_keyboardLimitedLabel, "setTextColor:", v15);

    -[UILabel setTextAlignment:](v3->_keyboardLimitedLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v3->_keyboardLimitedLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v3->_keyboardLimitedLabel, "setLineBreakMode:", 0);
    _UINSLocalizedStringWithDefaultValue(CFSTR("Keyboard access is limited"), CFSTR("Keyboard access is limited"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->_keyboardLimitedLabel, "setText:", v16);

    -[UIView sizeToFit](v3->_keyboardLimitedLabel, "sizeToFit");
    -[UIView addSubview:](v3, "addSubview:", v3->_keyboardLimitedLabel);
    +[UIButton buttonWithType:](UIButton, "buttonWithType:", 1);
    v17 = objc_claimAutoreleasedReturnValue();
    backButton = v3->_backButton;
    v3->_backButton = (UIButton *)v17;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_backButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v19 = v3->_backButton;
    _UINSLocalizedStringWithDefaultValue(CFSTR("Back"), CFSTR("Back"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v19, "setTitle:forState:", v20, 0);

    -[UIView sizeToFit](v3->_backButton, "sizeToFit");
    -[UIView addSubview:](v3, "addSubview:", v3->_backButton);
    -[UIView leftAnchor](v3->_keyboardLimitedLabel, "leftAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "leftAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:constant:", v52, 5.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v51;
    -[UIView rightAnchor](v3->_keyboardLimitedLabel, "rightAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "rightAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, -5.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = v47;
    -[UIView bottomAnchor](v3->_keyboardLimitedLabel, "bottomAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "centerYAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, -5.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v56[2] = v43;
    -[UIView centerXAnchor](v3->_backButton, "centerXAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "centerXAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v56[3] = v39;
    -[UIView topAnchor](v3->_backButton, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "centerYAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36, 5.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v56[4] = v35;
    -[UIView leftAnchor](v3->_backgroundView, "leftAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leftAnchor](v3, "leftAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v56[5] = v31;
    -[UIView rightAnchor](v3->_backgroundView, "rightAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView rightAnchor](v3, "rightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v56[6] = v23;
    -[UIView topAnchor](v3->_backgroundView, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v3, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v56[7] = v26;
    -[UIView bottomAnchor](v3->_backgroundView, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v3, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v56[8] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 9);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v34);
  }
  return v3;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  UIButton *v4;

  objc_msgSend(a3, "nextFocusedItem");
  v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v4 == self->_backButton;

  return (char)self;
}

- (UIButton)backButton
{
  return self->_backButton;
}

- (void)setBackButton:(id)a3
{
  objc_storeStrong((id *)&self->_backButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_keyboardLimitedLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
