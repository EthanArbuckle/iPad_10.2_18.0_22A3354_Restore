@implementation WFOtherNetworkHeaderView

- (WFOtherNetworkHeaderView)initWithReuseIdentifier:(id)a3
{
  WFOtherNetworkHeaderView *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFOtherNetworkHeaderView;
  v3 = -[WFOtherNetworkHeaderView initWithReuseIdentifier:](&v8, sel_initWithReuseIdentifier_, a3);
  v4 = (void *)objc_opt_new();
  -[WFOtherNetworkHeaderView setTitleLabel:](v3, "setTitleLabel:", v4);

  -[UILabel sizeToFit](v3->_titleLabel, "sizeToFit");
  -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v3->_titleLabel, "setFont:", v5);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v6);

  -[WFOtherNetworkHeaderView _configureContents](v3, "_configureContents");
  return v3;
}

- (void)setTitle:(id)a3
{
  __CFString *v4;
  void *v5;
  const __CFString *v6;
  id v7;

  v4 = (__CFString *)a3;
  -[WFOtherNetworkHeaderView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v4)
    v6 = v4;
  else
    v6 = &stru_24DB39F78;
  objc_msgSend(v5, "setText:", v6);

  -[WFOtherNetworkHeaderView setTitleLabel:](self, "setTitleLabel:", v7);
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[WFOtherNetworkHeaderView titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_configureContents
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
  _QWORD v48[11];

  v48[9] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WFOtherNetworkHeaderView titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WFOtherNetworkHeaderView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v3);

  -[WFOtherNetworkHeaderView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOtherNetworkHeaderView titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  v31 = (void *)MEMORY[0x24BDD1628];
  -[WFOtherNetworkHeaderView titleLabel](self, "titleLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOtherNetworkHeaderView contentView](self, "contentView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v43;
  -[WFOtherNetworkHeaderView titleLabel](self, "titleLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOtherNetworkHeaderView contentView](self, "contentView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v38;
  -[WFOtherNetworkHeaderView titleLabel](self, "titleLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOtherNetworkHeaderView contentView](self, "contentView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v33;
  -[WFOtherNetworkHeaderView titleLabel](self, "titleLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v28;
  objc_msgSend(v3, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOtherNetworkHeaderView contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v48[4] = v23;
  objc_msgSend(v3, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOtherNetworkHeaderView titleLabel](self, "titleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v48[5] = v19;
  objc_msgSend(v3, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOtherNetworkHeaderView contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v48[6] = v10;
  v27 = v3;
  objc_msgSend(v3, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOtherNetworkHeaderView contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v48[7] = v14;
  objc_msgSend(v3, "heightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToConstant:", 24.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v48[8] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "activateConstraints:", v17);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
