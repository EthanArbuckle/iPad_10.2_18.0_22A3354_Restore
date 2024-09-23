@implementation TVRUIDeviceListCell

- (TVRUIDeviceListCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TVRUIDeviceListCell *v4;
  void *v5;
  void *v6;
  UIImageView *v7;
  UIImageView *checkmarkImageView;
  void *v9;
  UIImageView *v10;
  UIImageView *modelImageView;
  void *v12;
  UILabel *v13;
  UILabel *deviceLabel;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  UIButton *findMyButton;
  void *v24;
  UIView *v25;
  UIView *separator;
  void *v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)TVRUIDeviceListCell;
  v4 = -[TVRUIDeviceListCell initWithStyle:reuseIdentifier:](&v29, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIDeviceListCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIDeviceListCell setTintColor:](v4, "setTintColor:", v6);

    v7 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    checkmarkImageView = v4->_checkmarkImageView;
    v4->_checkmarkImageView = v7;

    -[TVRUIDeviceListCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v4->_checkmarkImageView);

    -[UIImageView setContentMode:](v4->_checkmarkImageView, "setContentMode:", 4);
    -[UIImageView setAdjustsImageSizeForAccessibilityContentSizeCategory:](v4->_checkmarkImageView, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_checkmarkImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    modelImageView = v4->_modelImageView;
    v4->_modelImageView = v10;

    -[TVRUIDeviceListCell contentView](v4, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v4->_modelImageView);

    -[UIImageView setContentMode:](v4->_modelImageView, "setContentMode:", 4);
    -[UIImageView setAdjustsImageSizeForAccessibilityContentSizeCategory:](v4->_modelImageView, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_modelImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    deviceLabel = v4->_deviceLabel;
    v4->_deviceLabel = v13;

    -[TVRUIDeviceListCell contentView](v4, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v4->_deviceLabel);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_deviceLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v16) = 1132068864;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_deviceLabel, "setContentCompressionResistancePriority:forAxis:", 0, v16);
    LODWORD(v17) = 1132068864;
    -[UILabel setContentHuggingPriority:forAxis:](v4->_deviceLabel, "setContentHuggingPriority:forAxis:", 0, v17);
    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_deviceLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](v4->_deviceLabel, "setMinimumScaleFactor:", 0.4);
    objc_msgSend(MEMORY[0x24BEBD438], "filledButtonConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setImagePlacement:", 2);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("TVRemoteFindButtonTitle"), &stru_24DE30718, CFSTR("Localizable"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTitle:", v20);

    objc_msgSend(v18, "setCornerStyle:", 4);
    objc_msgSend(v18, "setButtonSize:", 1);
    objc_msgSend(v18, "setTitleLineBreakMode:", 4);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBaseBackgroundColor:", v21);

    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithConfiguration:primaryAction:", v18, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    findMyButton = v4->_findMyButton;
    v4->_findMyButton = (UIButton *)v22;

    -[TVRUIDeviceListCell contentView](v4, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v4->_findMyButton);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_findMyButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setHidden:](v4->_findMyButton, "setHidden:", 1);
    -[UIButton setHitTestInsets:](v4->_findMyButton, "setHitTestInsets:", -5.0, -10.0, -5.0, -10.0);
    v25 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    separator = v4->_separator;
    v4->_separator = v25;

    -[TVRUIDeviceListCell contentView](v4, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSubview:", v4->_separator);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_separator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v4->_showSeparator = 1;

  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUIDeviceListCell;
  -[TVRUIDeviceListCell prepareForReuse](&v3, sel_prepareForReuse);
  -[TVRUIDeviceListCell setFindButtonTapAction:](self, "setFindButtonTapAction:", 0);
}

- (void)setStyleProvider:(id)a3
{
  TVRUIStyleProvider *v5;
  NSObject *v6;
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
  _QWORD v25[5];
  uint8_t buf[4];
  TVRUIStyleProvider *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = (TVRUIStyleProvider *)a3;
  if (self->_styleProvider != v5)
  {
    _TVRUIDevicePickerLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v5;
      _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_DEFAULT, "Setting new styleProvider: %@", buf, 0xCu);
    }

    objc_storeStrong((id *)&self->_styleProvider, a3);
    -[TVRUIDeviceListCell findMyButton](self, "findMyButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[TVRUIDeviceListCell styleProvider](self, "styleProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "buttonBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBaseBackgroundColor:", v10);

    -[TVRUIDeviceListCell styleProvider](self, "styleProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tvRemoteImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v12);

    objc_msgSend(v8, "setImagePadding:", 10.0);
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __40__TVRUIDeviceListCell_setStyleProvider___block_invoke;
    v25[3] = &unk_24DE2CC30;
    v25[4] = self;
    objc_msgSend(v8, "setTitleTextAttributesTransformer:", v25);
    -[TVRUIDeviceListCell findMyButton](self, "findMyButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setConfiguration:", v8);

    -[TVRUIDeviceListCell styleProvider](self, "styleProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cellSeparatorBackgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIDeviceListCell separator](self, "separator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundColor:", v15);

    -[TVRUIDeviceListCell styleProvider](self, "styleProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cellBackgroundColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIDeviceListCell setBackgroundColor:](self, "setBackgroundColor:", v18);

    -[TVRUIDeviceListCell styleProvider](self, "styleProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fontForDeviceListRow");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIDeviceListCell deviceLabel](self, "deviceLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFont:", v20);

    -[TVRUIDeviceListCell styleProvider](self, "styleProvider");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "checkmarkImage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIDeviceListCell checkmarkImageView](self, "checkmarkImageView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setImage:", v23);

    -[TVRUIDeviceListCell _setupConstraints](self, "_setupConstraints");
  }

}

id __40__TVRUIDeviceListCell_setStyleProvider___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "styleProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontForDeviceListRow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BEBB360]);

  return v3;
}

- (void)setDevice:(id)a3
{
  TVRUIDevice *v5;
  TVRUIDevice *v6;

  v5 = (TVRUIDevice *)a3;
  v6 = v5;
  if (self->_device != v5)
  {
    objc_storeStrong((id *)&self->_device, a3);
    -[TVRUIDeviceListCell _configureViews](self, "_configureViews");
    v5 = v6;
  }
  if (v5)
  {
    -[TVRUIDeviceListCell _updateConnectionStatus](self, "_updateConnectionStatus");
    v5 = v6;
  }

}

- (void)setShowSeparator:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_showSeparator != a3)
  {
    self->_showSeparator = a3;
    v3 = !a3;
    -[TVRUIDeviceListCell separator](self, "separator");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", v3);

  }
}

- (void)setFindButtonTapAction:(id)a3
{
  UIAction *v5;
  UIAction **p_findButtonTapAction;
  void *v7;
  void *v8;
  UIAction *v9;

  v5 = (UIAction *)a3;
  p_findButtonTapAction = &self->_findButtonTapAction;
  if (self->_findButtonTapAction != v5)
  {
    v9 = v5;
    -[TVRUIDeviceListCell findMyButton](self, "findMyButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v9)
      objc_msgSend(v7, "addAction:forControlEvents:", v9, 64);
    else
      objc_msgSend(v7, "removeAction:forControlEvents:", *p_findButtonTapAction, 64);

    objc_storeStrong((id *)p_findButtonTapAction, a3);
    v5 = v9;
  }

}

- (void)_configureViews
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[TVRUIDeviceListCell device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = +[TVRUIFeatures isCorianderDebugUIEnabled](TVRUIFeatures, "isCorianderDebugUIEnabled");
    -[TVRUIDeviceListCell device](self, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
      objc_msgSend(v5, "debugName");
    else
      objc_msgSend(v5, "name");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    -[TVRUIDeviceListCell deviceLabel](self, "deviceLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v13);

    -[TVRUIDeviceListCell device](self, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[TVRUIDeviceListCell styleProvider](self, "styleProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "devicePickerIconForDeviceModel:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[TVRUIDeviceListCell modelImageView](self, "modelImageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImage:", v11);

    -[TVRUIDeviceListCell _updateFindMyButton](self, "_updateFindMyButton");
  }
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
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
  double v46;
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
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSLayoutConstraint *v67;
  NSLayoutConstraint *deviceLabelTrailingFindMyButtonConstraint;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSLayoutConstraint *v73;
  NSLayoutConstraint *deviceLabelTrailingContentViewConstraint;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;

  v95 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[TVRUIDeviceListCell checkmarkImageView](self, "checkmarkImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIDeviceListCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIDeviceListCell styleProvider](self, "styleProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "touchpadInsets");
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "addObject:", v9);

  -[TVRUIDeviceListCell checkmarkImageView](self, "checkmarkImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "centerYAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIDeviceListCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "centerYAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "addObject:", v14);

  -[TVRUIDeviceListCell checkmarkImageView](self, "checkmarkImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "widthAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToConstant:", 25.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "addObject:", v17);

  -[TVRUIDeviceListCell modelImageView](self, "modelImageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIDeviceListCell checkmarkImageView](self, "checkmarkImageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, 10.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "addObject:", v22);

  -[TVRUIDeviceListCell modelImageView](self, "modelImageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "centerYAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIDeviceListCell contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "centerYAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "addObject:", v27);

  -[TVRUIDeviceListCell modelImageView](self, "modelImageView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "widthAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToConstant:", 44.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "addObject:", v30);

  -[TVRUIDeviceListCell deviceLabel](self, "deviceLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIDeviceListCell modelImageView](self, "modelImageView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v34, 10.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "addObject:", v35);

  -[TVRUIDeviceListCell deviceLabel](self, "deviceLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "centerYAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIDeviceListCell contentView](self, "contentView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "centerYAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "addObject:", v40);

  -[TVRUIDeviceListCell findMyButton](self, "findMyButton");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "trailingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIDeviceListCell contentView](self, "contentView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIDeviceListCell styleProvider](self, "styleProvider");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "touchpadInsets");
  objc_msgSend(v42, "constraintEqualToAnchor:constant:", v44, -v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "addObject:", v47);

  -[TVRUIDeviceListCell findMyButton](self, "findMyButton");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "centerYAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIDeviceListCell contentView](self, "contentView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "centerYAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "addObject:", v52);

  -[TVRUIDeviceListCell findMyButton](self, "findMyButton");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "topAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIDeviceListCell contentView](self, "contentView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "topAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintGreaterThanOrEqualToAnchor:constant:", v56, 5.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "addObject:", v57);

  -[TVRUIDeviceListCell findMyButton](self, "findMyButton");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "bottomAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIDeviceListCell contentView](self, "contentView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "bottomAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintLessThanOrEqualToAnchor:constant:", v61, -5.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "addObject:", v62);

  -[TVRUIDeviceListCell deviceLabel](self, "deviceLabel");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "trailingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIDeviceListCell findMyButton](self, "findMyButton");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "leadingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintLessThanOrEqualToAnchor:constant:", v66, -10.0);
  v67 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  deviceLabelTrailingFindMyButtonConstraint = self->_deviceLabelTrailingFindMyButtonConstraint;
  self->_deviceLabelTrailingFindMyButtonConstraint = v67;

  -[TVRUIDeviceListCell deviceLabel](self, "deviceLabel");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "trailingAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIDeviceListCell contentView](self, "contentView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "trailingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintLessThanOrEqualToAnchor:constant:", v72, -10.0);
  v73 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  deviceLabelTrailingContentViewConstraint = self->_deviceLabelTrailingContentViewConstraint;
  self->_deviceLabelTrailingContentViewConstraint = v73;

  objc_msgSend(v95, "addObject:", self->_deviceLabelTrailingContentViewConstraint);
  objc_msgSend(v95, "addObject:", self->_deviceLabelTrailingFindMyButtonConstraint);
  -[TVRUIDeviceListCell findMyButton](self, "findMyButton");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v70) = objc_msgSend(v75, "isHidden");

  if ((_DWORD)v70)
    -[TVRUIDeviceListCell deviceLabelTrailingContentViewConstraint](self, "deviceLabelTrailingContentViewConstraint");
  else
    -[TVRUIDeviceListCell deviceLabelTrailingFindMyButtonConstraint](self, "deviceLabelTrailingFindMyButtonConstraint");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setActive:", 0);

  -[TVRUIDeviceListCell separator](self, "separator");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "bottomAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIDeviceListCell contentView](self, "contentView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "bottomAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintEqualToAnchor:", v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "addObject:", v81);

  -[TVRUIDeviceListCell separator](self, "separator");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "leadingAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIDeviceListCell modelImageView](self, "modelImageView");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "leadingAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:", v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "addObject:", v86);

  -[TVRUIDeviceListCell separator](self, "separator");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "trailingAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIDeviceListCell findMyButton](self, "findMyButton");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "trailingAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "constraintEqualToAnchor:", v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "addObject:", v91);

  -[TVRUIDeviceListCell separator](self, "separator");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "heightAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "constraintEqualToConstant:", 1.0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "addObject:", v94);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v95);
}

- (void)_updateConnectionStatus
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  -[TVRUIDeviceListCell device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isConnected");

  -[TVRUIDeviceListCell styleProvider](self, "styleProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "colorForConnectedDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIDeviceListCell deviceLabel](self, "deviceLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v7);

    -[TVRUIDeviceListCell styleProvider](self, "styleProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "colorForConnectedDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIDeviceListCell modelImageView](self, "modelImageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTintColor:", v10);

    -[TVRUIDeviceListCell checkmarkImageView](self, "checkmarkImageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v12;
    v13 = 0;
  }
  else
  {
    objc_msgSend(v5, "colorForDisconnectedDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIDeviceListCell deviceLabel](self, "deviceLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextColor:", v14);

    -[TVRUIDeviceListCell styleProvider](self, "styleProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "colorForDisconnectedDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIDeviceListCell modelImageView](self, "modelImageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTintColor:", v17);

    -[TVRUIDeviceListCell checkmarkImageView](self, "checkmarkImageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v12;
    v13 = 1;
  }
  objc_msgSend(v12, "setHidden:", v13);

}

- (void)_updateFindMyButton
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  _TVRUIDevicePickerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[TVRUIDeviceListCell device](self, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIDeviceListCell device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsFindMyRemote");
    v8 = "no";
    if (v7)
      v8 = "yes";
    v18 = 138543618;
    v19 = v5;
    v20 = 2080;
    v21 = v8;
    _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "device - %{public}@ supportsFindMy: %s", (uint8_t *)&v18, 0x16u);

  }
  if (GestaltGetDeviceClass() != 3)
  {
    -[TVRUIDeviceListCell device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "supportsFindMyRemote") ^ 1;
    -[TVRUIDeviceListCell deviceLabelTrailingContentViewConstraint](self, "deviceLabelTrailingContentViewConstraint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActive:", v10);

    -[TVRUIDeviceListCell device](self, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "supportsFindMyRemote");
    -[TVRUIDeviceListCell deviceLabelTrailingFindMyButtonConstraint](self, "deviceLabelTrailingFindMyButtonConstraint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActive:", v13);

    -[TVRUIDeviceListCell device](self, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "supportsFindMyRemote") ^ 1;
    -[TVRUIDeviceListCell findMyButton](self, "findMyButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHidden:", v16);

  }
}

- (TVRUIDevice)device
{
  return self->_device;
}

- (BOOL)showSeparator
{
  return self->_showSeparator;
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (UIAction)findButtonTapAction
{
  return self->_findButtonTapAction;
}

- (UIButton)findMyButton
{
  return self->_findMyButton;
}

- (void)setFindMyButton:(id)a3
{
  objc_storeStrong((id *)&self->_findMyButton, a3);
}

- (UIImageView)checkmarkImageView
{
  return self->_checkmarkImageView;
}

- (void)setCheckmarkImageView:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkImageView, a3);
}

- (UIImageView)modelImageView
{
  return self->_modelImageView;
}

- (void)setModelImageView:(id)a3
{
  objc_storeStrong((id *)&self->_modelImageView, a3);
}

- (UILabel)deviceLabel
{
  return self->_deviceLabel;
}

- (void)setDeviceLabel:(id)a3
{
  objc_storeStrong((id *)&self->_deviceLabel, a3);
}

- (UIView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_separator, a3);
}

- (NSLayoutConstraint)deviceLabelTrailingContentViewConstraint
{
  return self->_deviceLabelTrailingContentViewConstraint;
}

- (void)setDeviceLabelTrailingContentViewConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_deviceLabelTrailingContentViewConstraint, a3);
}

- (NSLayoutConstraint)deviceLabelTrailingFindMyButtonConstraint
{
  return self->_deviceLabelTrailingFindMyButtonConstraint;
}

- (void)setDeviceLabelTrailingFindMyButtonConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_deviceLabelTrailingFindMyButtonConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceLabelTrailingFindMyButtonConstraint, 0);
  objc_storeStrong((id *)&self->_deviceLabelTrailingContentViewConstraint, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_deviceLabel, 0);
  objc_storeStrong((id *)&self->_modelImageView, 0);
  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
  objc_storeStrong((id *)&self->_findMyButton, 0);
  objc_storeStrong((id *)&self->_findButtonTapAction, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
