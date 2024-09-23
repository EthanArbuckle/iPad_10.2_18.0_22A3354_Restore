@implementation STNotificationsPickupSummaryView

- (STNotificationsPickupSummaryView)initWithUsageReport:(id)a3
{
  id v5;
  STNotificationsPickupSummaryView *v6;
  STNotificationsPickupSummaryView *v7;
  uint64_t v8;
  UIStackView *stackView;
  void *v10;
  STSummationView *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  STSummationView *v15;
  void *v16;
  void *v17;
  UIStackView *v18;
  void *v19;
  double v20;
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
  STSummationView *v36;
  void *v37;
  id v38;
  objc_super v39;
  _QWORD v40[5];

  v40[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v39.receiver = self;
  v39.super_class = (Class)STNotificationsPickupSummaryView;
  v6 = -[STNotificationsPickupSummaryView initWithFrame:](&v39, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_usageReport, a3);
    v8 = objc_opt_new();
    stackView = v7->_stackView;
    v7->_stackView = (UIStackView *)v8;

    objc_msgSend(MEMORY[0x24BEBD4B8], "tableSeparatorLightColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STNotificationsPickupSummaryView setBackgroundColor:](v7, "setBackgroundColor:", v10);

    -[UIStackView setAxis:](v7->_stackView, "setAxis:", 0);
    -[UIStackView setAlignment:](v7->_stackView, "setAlignment:", 0);
    -[UIStackView setDistribution:](v7->_stackView, "setDistribution:", 1);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v7->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = [STSummationView alloc];
    -[STNotificationsPickupSummaryView _attributedStringForNotificationsTitle](v7, "_attributedStringForNotificationsTitle");
    v38 = v5;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[STNotificationsPickupSummaryView _attributedStringForNotificationsDetailText](v7, "_attributedStringForNotificationsDetailText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[STSummationView initWithTitle:detailText:](v11, "initWithTitle:detailText:", v12, v13);

    v15 = [STSummationView alloc];
    -[STNotificationsPickupSummaryView _attributedStringForPickUpTitle](v7, "_attributedStringForPickUpTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[STNotificationsPickupSummaryView _attributedStringForPickUpDetailText](v7, "_attributedStringForPickUpDetailText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[STSummationView initWithTitle:detailText:](v15, "initWithTitle:detailText:", v16, v17);

    v37 = (void *)v14;
    -[UIStackView addArrangedSubview:](v7->_stackView, "addArrangedSubview:", v14);
    v18 = v7->_stackView;
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "scale");
    -[UIStackView setCustomSpacing:afterView:](v18, "setCustomSpacing:afterView:", v14, 1.0 / v20);

    -[UIStackView addArrangedSubview:](v7->_stackView, "addArrangedSubview:", v36);
    -[STNotificationsPickupSummaryView addSubview:](v7, "addSubview:", v7->_stackView);
    v31 = (void *)MEMORY[0x24BDD1628];
    -[STNotificationsPickupSummaryView topAnchor](v7, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView topAnchor](v7->_stackView, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v33;
    -[STNotificationsPickupSummaryView bottomAnchor](v7, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView bottomAnchor](v7->_stackView, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v22;
    -[STNotificationsPickupSummaryView leadingAnchor](v7, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView leadingAnchor](v7->_stackView, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v25;
    -[STNotificationsPickupSummaryView trailingAnchor](v7, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView trailingAnchor](v7->_stackView, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v40[3] = v28;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "activateConstraints:", v29);

    v5 = v38;
  }

  return v7;
}

- (id)_attributedStringForNotificationsTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DailyNotificationsLabel"), &stru_24DB8A1D0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STNotificationsPickupSummaryView _attributedString:withFont:](self, "_attributedString:withFont:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_attributedStringForNotificationsDetailText
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v30[2];
  _QWORD v31[2];
  void *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v2 = -[STUsageReport totalNotifications](self->_usageReport, "totalNotifications");
  v3 = (void *)MEMORY[0x24BDD16F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", llround((double)v2 / 7.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringFromNumber:numberStyle:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD17C8];
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("WeeklyReportDailyNotificationCount"), &stru_24DB8A1D0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *MEMORY[0x24BEBE250];
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE250]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = *MEMORY[0x24BEBB548];
  v12 = *MEMORY[0x24BEBB598];
  v30[0] = *MEMORY[0x24BEBB5A0];
  v30[1] = v12;
  v31[0] = &unk_24DBBE9A0;
  v31[1] = &unk_24DBBE9B8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "fontDescriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fontDescriptorByAddingAttributes:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v17, 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (objc_class *)MEMORY[0x24BDD1688];
  v21 = v18;
  v22 = v5;
  v23 = v9;
  v24 = (void *)objc_msgSend([v20 alloc], "initWithString:", v23);
  objc_msgSend(v24, "beginEditing");
  v25 = *MEMORY[0x24BEBB360];
  objc_msgSend(v24, "addAttribute:value:range:", *MEMORY[0x24BEBB360], v21, 0, objc_msgSend(v23, "length"));

  v26 = objc_msgSend(v23, "rangeOfString:", v22);
  v28 = v27;

  objc_msgSend(v24, "addAttribute:value:range:", v25, v19, v26, v28);
  objc_msgSend(v24, "endEditing");

  return v24;
}

- (id)_attributedStringForPickUpTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("LookedAtPhoneLabel"), &stru_24DB8A1D0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STNotificationsPickupSummaryView _attributedString:withFont:](self, "_attributedString:withFont:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_attributedStringForPickUpDetailText
{
  unint64_t v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = -[STUsageReport totalPickups](self->_usageReport, "totalPickups");
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setAllowedUnits:", 96);
  objc_msgSend(v4, "setUnitsStyle:", 1);
  if (v3)
    v5 = 604800.0 / (double)v3;
  else
    v5 = 604800.0;
  v6 = (void *)MEMORY[0x24BDD17C8];
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("WeeklyReportPickupInterval"), &stru_24DB8A1D0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromTimeInterval:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE250]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STNotificationsPickupSummaryView _attributedString:withFont:](self, "_attributedString:withFont:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_attributedString:(id)a3 withFont:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;

  v5 = (objc_class *)MEMORY[0x24BDD1688];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithString:", v7);
  objc_msgSend(v8, "beginEditing");
  v9 = objc_msgSend(v7, "length");

  objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x24BEBB360], v6, 0, v9);
  objc_msgSend(v8, "endEditing");
  return v8;
}

- (STUsageReport)usageReport
{
  return self->_usageReport;
}

- (void)setUsageReport:(id)a3
{
  objc_storeStrong((id *)&self->_usageReport, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_usageReport, 0);
}

@end
