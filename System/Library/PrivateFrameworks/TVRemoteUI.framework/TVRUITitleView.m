@implementation TVRUITitleView

- (TVRUITitleView)initWithStyleProvider:(id)a3
{
  id v5;
  TVRUITitleView *v6;
  TVRUITitleView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVRUITitleView;
  v6 = -[TVRUITitleView init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_styleProvider, a3);
    -[TVRUITitleView _setupViewsIfNeeded](v7, "_setupViewsIfNeeded");
  }

  return v7;
}

- (void)_setupViewsIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
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
  double v25;
  void *v26;
  double v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  _QWORD v61[4];

  v61[3] = *MEMORY[0x24BDAC8D0];
  -[TVRUITitleView deviceModelImageView](self, "deviceModelImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BEBD668]);
    -[TVRUITitleView setDeviceModelImageView:](self, "setDeviceModelImageView:", v4);

    -[TVRUITitleView deviceModelImageView](self, "deviceModelImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[TVRUITitleView styleProvider](self, "styleProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "primaryTextAndGlyphColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUITitleView deviceModelImageView](self, "deviceModelImageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTintColor:", v7);

    -[TVRUITitleView deviceModelImageView](self, "deviceModelImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContentMode:", 4);

    -[TVRUITitleView deviceModelImageView](self, "deviceModelImageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = 1144750080;
    objc_msgSend(v10, "setContentCompressionResistancePriority:forAxis:", 0, v11);

    -[TVRUITitleView deviceModelImageView](self, "deviceModelImageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);

  }
  -[TVRUITitleView titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = objc_alloc_init(MEMORY[0x24BEBD708]);
    -[TVRUITitleView setTitleLabel:](self, "setTitleLabel:", v14);

    -[TVRUITitleView styleProvider](self, "styleProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fontForDeviceTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUITitleView titleLabel](self, "titleLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFont:", v16);

    -[TVRUITitleView styleProvider](self, "styleProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "textColorForDeviceTitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUITitleView titleLabel](self, "titleLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTextColor:", v19);

    -[TVRUITitleView titleLabel](self, "titleLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAdjustsFontSizeToFitWidth:", 1);

    -[TVRUITitleView titleLabel](self, "titleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setMinimumScaleFactor:", 0.4);

    -[TVRUITitleView titleLabel](self, "titleLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAdjustsFontForContentSizeCategory:", 1);

    -[TVRUITitleView titleLabel](self, "titleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = 1132068864;
    objc_msgSend(v24, "setContentCompressionResistancePriority:forAxis:", 0, v25);

    -[TVRUITitleView titleLabel](self, "titleLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v27) = 1132068864;
    objc_msgSend(v26, "setContentHuggingPriority:forAxis:", 0, v27);

  }
  -[TVRUITitleView imageView](self, "imageView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    v29 = objc_alloc_init(MEMORY[0x24BEBD668]);
    -[TVRUITitleView setImageView:](self, "setImageView:", v29);

    -[TVRUITitleView imageView](self, "imageView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[TVRUITitleView styleProvider](self, "styleProvider");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "tintColorForChevronImage");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUITitleView imageView](self, "imageView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setTintColor:", v32);

    -[TVRUITitleView styleProvider](self, "styleProvider");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "chevronImage");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUITitleView imageView](self, "imageView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setImage:", v35);

    -[TVRUITitleView imageView](self, "imageView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setContentMode:", 4);

    -[TVRUITitleView imageView](self, "imageView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v39) = 1144750080;
    objc_msgSend(v38, "setContentCompressionResistancePriority:forAxis:", 0, v39);

    -[TVRUITitleView imageView](self, "imageView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);

  }
  -[TVRUITitleView stackView](self, "stackView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v41)
  {
    v42 = objc_alloc(MEMORY[0x24BEBD5F0]);
    v43 = (void *)objc_msgSend(v42, "initForTextStyle:", *MEMORY[0x24BEBE200]);
    v44 = objc_alloc(MEMORY[0x24BEBD978]);
    -[TVRUITitleView deviceModelImageView](self, "deviceModelImageView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUITitleView titleLabel](self, "titleLabel", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v46;
    -[TVRUITitleView imageView](self, "imageView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v61[2] = v47;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 3);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v44, "initWithArrangedSubviews:", v48);
    -[TVRUITitleView setStackView:](self, "setStackView:", v49);

    -[TVRUITitleView stackView](self, "stackView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[TVRUITitleView stackView](self, "stackView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setAlignment:", 3);

    -[TVRUITitleView stackView](self, "stackView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "scaledValueForValue:", 6.0);
    v54 = v53;
    -[TVRUITitleView deviceModelImageView](self, "deviceModelImageView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setCustomSpacing:afterView:", v55, v54);

    -[TVRUITitleView stackView](self, "stackView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "scaledValueForValue:", 3.0);
    v58 = v57;
    -[TVRUITitleView titleLabel](self, "titleLabel");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setCustomSpacing:afterView:", v59, v58);

    -[TVRUITitleView stackView](self, "stackView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUITitleView addSubview:](self, "addSubview:", v60);

  }
  -[TVRUITitleView _setupConstraints](self, "_setupConstraints");
}

- (void)_setupConstraints
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
  id v25;

  v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[TVRUITitleView stackView](self, "stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITitleView centerXAnchor](self, "centerXAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObject:", v6);

  -[TVRUITitleView stackView](self, "stackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "centerYAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITitleView centerYAnchor](self, "centerYAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObject:", v10);

  -[TVRUITitleView stackView](self, "stackView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITitleView widthAnchor](self, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintLessThanOrEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObject:", v14);

  -[TVRUITitleView stackView](self, "stackView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "heightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITitleView heightAnchor](self, "heightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObject:", v18);

  -[TVRUITitleView deviceModelImageView](self, "deviceModelImageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "widthAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToConstant:", 24.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObject:", v21);

  -[TVRUITitleView imageView](self, "imageView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "widthAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToConstant:", 15.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObject:", v24);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v25);
}

- (void)updateTitleWithDeviceName:(id)a3 icon:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  id v11;

  v6 = a4;
  v11 = a3;
  -[TVRUITitleView _setupViewsIfNeeded](self, "_setupViewsIfNeeded");
  -[TVRUITitleView titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v11);

  -[TVRUITitleView deviceModelImageView](self, "deviceModelImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v6);

  v9 = v6 == 0;
  -[TVRUITitleView deviceModelImageView](self, "deviceModelImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v9);

  -[TVRUITitleView _updateDeviceNameAutomationIdentifier:](self, "_updateDeviceNameAutomationIdentifier:", v11);
}

- (void)_updateDeviceNameAutomationIdentifier:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("selectedDevice=\"%@\"), a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UIA.TVRemoteService.%@"), v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITitleView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", v4);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[TVRUITitleView setAlpha:](self, "setAlpha:", a3, a4, 0.2);
}

- (BOOL)isExclusiveTouch
{
  return 1;
}

- (void)_animateTouchesUp
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __35__TVRUITitleView__animateTouchesUp__block_invoke;
  v2[3] = &unk_24DE2C198;
  v2[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v2, 0.48);
}

uint64_t __35__TVRUITitleView__animateTouchesUp__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIImageView)deviceModelImageView
{
  return self->_deviceModelImageView;
}

- (void)setDeviceModelImageView:(id)a3
{
  objc_storeStrong((id *)&self->_deviceModelImageView, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
  objc_storeStrong((id *)&self->_styleProvider, a3);
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
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_deviceModelImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
