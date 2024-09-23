@implementation WFLockView

- (WFLockView)initWithFrame:(CGRect)a3
{
  WFLockView *v3;
  void *v4;
  UILabel *v5;
  UILabel *titleLabel;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  UIImageView *lockImage;
  void *v13;
  void *v14;
  WFLockView *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)WFLockView;
  v3 = -[WFLockView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLockView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    titleLabel = v3->titleLabel;
    v3->titleLabel = v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->titleLabel, "setTextColor:", v7);

    -[UILabel setAdjustsFontSizeToFitWidth:](v3->titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setNumberOfLines:](v3->titleLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v3->titleLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE240]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->titleLabel, "setFont:", v8);

    -[WFLockView addSubview:](v3, "addSubview:", v3->titleLabel);
    v9 = objc_alloc(MEMORY[0x24BEBD668]);
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("lock.fill"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithImage:", v10);
    lockImage = v3->lockImage;
    v3->lockImage = (UIImageView *)v11;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->lockImage, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v3->lockImage, "setTintColor:", v13);

    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:weight:scale:", 4, -1, 140.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v3->lockImage, "setPreferredSymbolConfiguration:", v14);

    -[WFLockView addSubview:](v3, "addSubview:", v3->lockImage);
    v15 = v3;
  }

  return v3;
}

- (WFLockView)initWithTitle:(id)a3 viewToCover:(id)a4
{
  id v6;
  WFLockView *v7;

  v6 = a3;
  objc_msgSend(a4, "bounds");
  v7 = -[WFLockView initWithFrame:](self, "initWithFrame:");
  -[UILabel setText:](v7->titleLabel, "setText:", v6);

  return v7;
}

- (void)didMoveToSuperview
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
  objc_super v32;
  _QWORD v33[10];

  v33[8] = *MEMORY[0x24BDAC8D0];
  v32.receiver = self;
  v32.super_class = (Class)WFLockView;
  -[WFLockView didMoveToSuperview](&v32, sel_didMoveToSuperview);
  -[WFLockView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFLockView superview](self, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeAreaLayoutGuide");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x24BDD1628];
    -[UILabel centerXAnchor](self->titleLabel, "centerXAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerXAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v29;
    -[UILabel topAnchor](self->titleLabel, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerYAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v26;
    -[UILabel leadingAnchor](self->titleLabel, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v23;
    -[UILabel trailingAnchor](self->titleLabel, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v19;
    -[UILabel bottomAnchor](self->titleLabel, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintLessThanOrEqualToAnchor:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33[4] = v16;
    -[UIImageView centerXAnchor](self->lockImage, "centerXAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerXAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v33[5] = v7;
    -[UIImageView topAnchor](self->lockImage, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintGreaterThanOrEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33[6] = v10;
    -[UIImageView bottomAnchor](self->lockImage, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centerYAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33[7] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activateConstraints:", v14);

  }
}

- (UINavigationController)belongedNavigationController
{
  return self->_belongedNavigationController;
}

- (void)setBelongedNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_belongedNavigationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_belongedNavigationController, 0);
  objc_storeStrong((id *)&self->lockImage, 0);
  objc_storeStrong((id *)&self->titleLabel, 0);
}

@end
