@implementation STNotificationUsageCell

- (STNotificationUsageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  STNotificationUsageCell *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  UIImageView *notificationDot;
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
  _QWORD v33[5];

  v33[4] = *MEMORY[0x24BDAC8D0];
  v32.receiver = self;
  v32.super_class = (Class)STNotificationUsageCell;
  v5 = -[STUsageCell initWithStyle:reuseIdentifier:specifier:](&v32, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BEBD668]);
    objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "circleImageWithFillColor:fillDiameter:outlineColor:outlineWidth:", v8, 0, 9.0, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "initWithImage:", v9);
    notificationDot = v5->_notificationDot;
    v5->_notificationDot = (UIImageView *)v10;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_notificationDot, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setAdjustsImageSizeForAccessibilityContentSizeCategory:](v5->_notificationDot, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
    -[STNotificationUsageCell contentView](v5, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addSubview:", v5->_notificationDot);
    -[STUsageCell usageBarView](v5, "usageBarView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x24BDD1628];
    -[UIImageView widthAnchor](v5->_notificationDot, "widthAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView heightAnchor](v5->_notificationDot, "heightAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v28;
    -[UIImageView trailingAnchor](v5->_notificationDot, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v12;
    objc_msgSend(v12, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, 4.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v24;
    -[UIImageView centerYAnchor](v5->_notificationDot, "centerYAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v15;
    -[STUsageCell usageLabel](v5, "usageLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[STTableCell contentLayoutGuide](v5, "contentLayoutGuide");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "activateConstraints:", v21);

  }
  return v5;
}

- (void)setValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)STNotificationUsageCell;
  v4 = a3;
  -[STUsageCell setValue:](&v11, sel_setValue_, v4);
  v5 = (void *)MEMORY[0x24BDD17C8];
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NotificationsCount"), &stru_24DB8A1D0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "totalUsage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "localizedStringWithFormat:", v7, objc_msgSend(v8, "unsignedIntegerValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageCell usageLabel](self, "usageLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

}

- (UIImageView)notificationDot
{
  return self->_notificationDot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationDot, 0);
}

@end
