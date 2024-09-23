@implementation STUnlockForContentView

- (STUnlockForContentView)initWithFrame:(CGRect)a3
{
  STUnlockForContentView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUnlockForContentView;
  v3 = -[STUnlockForContentView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[STUnlockForContentView _stUnlockForContentViewCommonInit](v3, "_stUnlockForContentViewCommonInit");
  return v3;
}

- (STUnlockForContentView)initWithCoder:(id)a3
{
  STUnlockForContentView *v3;
  STUnlockForContentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUnlockForContentView;
  v3 = -[STUnlockForContentView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[STUnlockForContentView _stUnlockForContentViewCommonInit](v3, "_stUnlockForContentViewCommonInit");
  return v4;
}

- (void)_stUnlockForContentViewCommonInit
{
  UILabel *v3;
  UILabel *unlockToViewContentLabel;
  void *v5;
  void *v6;
  UILabel *v7;
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
  _QWORD v36[9];

  v36[7] = *MEMORY[0x24BDAC8D0];
  v3 = (UILabel *)objc_opt_new();
  unlockToViewContentLabel = self->_unlockToViewContentLabel;
  self->_unlockToViewContentLabel = v3;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_unlockToViewContentLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_unlockToViewContentLabel, "setFont:", v5);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_unlockToViewContentLabel, "setTextColor:", v6);

  -[UILabel setLineBreakMode:](self->_unlockToViewContentLabel, "setLineBreakMode:", 0);
  -[UILabel setTextAlignment:](self->_unlockToViewContentLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_unlockToViewContentLabel, "setNumberOfLines:", 0);
  v7 = self->_unlockToViewContentLabel;
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("WidgetUnlockToView"), &stru_24DB8A1D0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v7, "setText:", v9);

  objc_msgSend(MEMORY[0x24BEBDAF0], "widgetEffectForVibrancyStyle:", 102);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v35);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[STUnlockForContentView addSubview:](self, "addSubview:", v10);
  objc_msgSend(v10, "contentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addSubview:", self->_unlockToViewContentLabel);
  v24 = (void *)MEMORY[0x24BDD1628];
  -[UILabel topAnchor](self->_unlockToViewContentLabel, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v31;
  -[UILabel leadingAnchor](self->_unlockToViewContentLabel, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v28;
  -[UILabel bottomAnchor](self->_unlockToViewContentLabel, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v25;
  -[UILabel trailingAnchor](self->_unlockToViewContentLabel, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v21;
  objc_msgSend(v10, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUnlockForContentView leadingAnchor](self, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v12;
  objc_msgSend(v10, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUnlockForContentView trailingAnchor](self, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36[5] = v15;
  objc_msgSend(v10, "centerYAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUnlockForContentView centerYAnchor](self, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36[6] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "activateConstraints:", v19);

}

- (UILabel)unlockToViewContentLabel
{
  return self->_unlockToViewContentLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlockToViewContentLabel, 0);
}

@end
