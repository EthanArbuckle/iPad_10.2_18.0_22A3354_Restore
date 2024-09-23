@implementation _VSUIActionStatusErrorView

- (_VSUIActionStatusErrorView)initWithFrame:(CGRect)a3
{
  _VSUIActionStatusErrorView *v3;
  _VSUIActionStatusErrorView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_VSUIActionStatusErrorView;
  v3 = -[_VSUIActionStatusErrorView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[_VSUIActionStatusErrorView _setUpViews](v3, "_setUpViews");
  return v4;
}

- (_VSUIActionStatusErrorView)initWithCoder:(id)a3
{
  _VSUIActionStatusErrorView *v3;
  _VSUIActionStatusErrorView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_VSUIActionStatusErrorView;
  v3 = -[_VSUIActionStatusErrorView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[_VSUIActionStatusErrorView _setUpViews](v3, "_setUpViews");
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  CGFloat v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  v4 = a3.width + -24.0 + -10.0;
  -[_VSUIActionStatusErrorView errorLabel](self, "errorLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", v4, height);
  v7 = v6;
  v9 = v8;

  v10 = v9 + 15.0 + 15.0;
  v11 = v7;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)_setUpViews
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
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
  id v18;
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
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[15];

  v62[13] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDF6B68]);
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v8 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], v5, v6, v7);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("There was a problem. Try again…"), &stru_24E7170B8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v10);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v11);

  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v12);

  objc_msgSend(v8, "setTextAlignment:", 1);
  objc_msgSend(v8, "setNumberOfLines:", 2);
  objc_msgSend(v8, "setLineBreakMode:", 4);
  -[_VSUIActionStatusErrorView addSubview:](self, "addSubview:", v8);
  -[_VSUIActionStatusErrorView setErrorLabel:](self, "setErrorLabel:", v8);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v4, v5, v6, v7);
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "systemGray3Color");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v14);

  objc_msgSend(v13, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCornerRadius:", 12.0);

  -[_VSUIActionStatusErrorView addSubview:](self, "addSubview:", v13);
  -[_VSUIActionStatusErrorView setErrorIconBackgroundView:](self, "setErrorIconBackgroundView:", v13);
  v16 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "imageNamed:inBundle:", CFSTR("ActionErrorAlert"), v17);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_alloc(MEMORY[0x24BDF6AE8]);
  objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "_flatImageWithColor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "initWithImage:", v20);

  objc_msgSend(v21, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setMasksToBounds:", 1);

  objc_msgSend(v21, "setContentMode:", 1);
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[_VSUIActionStatusErrorView addSubview:](self, "addSubview:", v21);
  -[_VSUIActionStatusErrorView setErrorIconView:](self, "setErrorIconView:", v21);
  v47 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v13, "widthAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToConstant:", 24.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v59;
  objc_msgSend(v13, "heightAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToConstant:", 24.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v57;
  objc_msgSend(v13, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[_VSUIActionStatusErrorView trailingAnchor](self, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:constant:", v55, -15.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v54;
  objc_msgSend(v13, "centerYAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerYAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v62[3] = v51;
  objc_msgSend(v8, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[_VSUIActionStatusErrorView leadingAnchor](self, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:constant:", v49, 15.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v62[4] = v48;
  objc_msgSend(v8, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:constant:", v45, -10.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v62[5] = v44;
  objc_msgSend(v8, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[_VSUIActionStatusErrorView topAnchor](self, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintGreaterThanOrEqualToAnchor:", v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v62[6] = v41;
  objc_msgSend(v8, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[_VSUIActionStatusErrorView bottomAnchor](self, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintLessThanOrEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v62[7] = v37;
  objc_msgSend(v8, "centerYAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[_VSUIActionStatusErrorView centerYAnchor](self, "centerYAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v62[8] = v34;
  objc_msgSend(v21, "widthAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToConstant:", 20.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v62[9] = v32;
  objc_msgSend(v21, "heightAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToConstant:", 20.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v62[10] = v23;
  v40 = v21;
  objc_msgSend(v21, "centerYAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "centerYAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, 0.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v62[11] = v26;
  objc_msgSend(v21, "centerXAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "centerXAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, 0.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v62[12] = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 13);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "activateConstraints:", v30);

}

- (UILabel)errorLabel
{
  return self->_errorLabel;
}

- (void)setErrorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_errorLabel, a3);
}

- (UIImageView)errorIconView
{
  return self->_errorIconView;
}

- (void)setErrorIconView:(id)a3
{
  objc_storeStrong((id *)&self->_errorIconView, a3);
}

- (UIView)errorIconBackgroundView
{
  return self->_errorIconBackgroundView;
}

- (void)setErrorIconBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_errorIconBackgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorIconBackgroundView, 0);
  objc_storeStrong((id *)&self->_errorIconView, 0);
  objc_storeStrong((id *)&self->_errorLabel, 0);
}

@end
