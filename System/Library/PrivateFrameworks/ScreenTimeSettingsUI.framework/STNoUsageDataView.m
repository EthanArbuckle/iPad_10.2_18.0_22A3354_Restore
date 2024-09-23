@implementation STNoUsageDataView

- (STNoUsageDataView)initWithPreferredFontTextStyle:(id)a3
{
  id v4;
  STNoUsageDataView *v5;
  uint64_t v6;
  UILabel *noDataDetailTextLabel;
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
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)STNoUsageDataView;
  v5 = -[STNoUsageDataView initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v5)
  {
    v6 = objc_opt_new();
    noDataDetailTextLabel = v5->_noDataDetailTextLabel;
    v5->_noDataDetailTextLabel = (UILabel *)v6;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_noDataDetailTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_noDataDetailTextLabel, "setFont:", v8);

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_noDataDetailTextLabel, "setTextColor:", v9);

    -[UILabel setLineBreakMode:](v5->_noDataDetailTextLabel, "setLineBreakMode:", 0);
    -[UILabel setTextAlignment:](v5->_noDataDetailTextLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v5->_noDataDetailTextLabel, "setNumberOfLines:", 0);
    -[STNoUsageDataView addSubview:](v5, "addSubview:", v5->_noDataDetailTextLabel);
    -[UILabel topAnchor](v5->_noDataDetailTextLabel, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STNoUsageDataView topAnchor](v5, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActive:", 1);

    -[UILabel leadingAnchor](v5->_noDataDetailTextLabel, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[STNoUsageDataView leadingAnchor](v5, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);

    -[UILabel bottomAnchor](v5->_noDataDetailTextLabel, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[STNoUsageDataView bottomAnchor](v5, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActive:", 1);

    -[UILabel trailingAnchor](v5->_noDataDetailTextLabel, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[STNoUsageDataView trailingAnchor](v5, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

  }
  return v5;
}

- (void)setLocalDevice:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  self->_localDevice = a3;
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("NoDataDetailTextLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", v5, &stru_24DB8A1D0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STNoUsageDataView noDataDetailTextLabel](self, "noDataDetailTextLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

  }
  else
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("NoDataDetailTextLabel"), &stru_24DB8A1D0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STNoUsageDataView noDataDetailTextLabel](self, "noDataDetailTextLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v5);
  }

}

- (BOOL)isLocalDevice
{
  return self->_localDevice;
}

- (UILabel)noDataDetailTextLabel
{
  return self->_noDataDetailTextLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noDataDetailTextLabel, 0);
}

@end
