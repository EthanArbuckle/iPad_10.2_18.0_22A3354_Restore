@implementation WATodayPadView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (WATodayPadView)initWithFrame:(CGRect)a3
{
  WATodayPadView *v3;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _QWORD v28[3];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v27.receiver = self;
  v27.super_class = (Class)WATodayPadView;
  v3 = -[WATodayPadView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF70F0], "sharedInstanceForStyle:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WATodayPadView setLegibilitySettings:](v3, "setLegibilitySettings:", v4);

    v5 = (void *)objc_opt_new();
    -[WATodayPadView setConditionsImageView:](v3, "setConditionsImageView:", v5);

    -[WATodayPadView conditionsImageView](v3, "conditionsImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentMode:", 6);

    -[WATodayPadView conditionsImageView](v3, "conditionsImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[WATodayPadView conditionsImageView](v3, "conditionsImageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WATodayPadView addSubview:](v3, "addSubview:", v8);

    v9 = (void *)objc_opt_new();
    -[WATodayPadView setTemperatureLabel:](v3, "setTemperatureLabel:", v9);

    v10 = (void *)objc_opt_new();
    -[WATodayPadView setLocationLabel:](v3, "setLocationLabel:", v10);

    v11 = (void *)objc_opt_new();
    -[WATodayPadView setConditionsLabel:](v3, "setConditionsLabel:", v11);

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[WATodayPadView locationLabel](v3, "locationLabel", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v12;
    -[WATodayPadView conditionsLabel](v3, "conditionsLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v13;
    -[WATodayPadView temperatureLabel](v3, "temperatureLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setTextColor:", v21);

          -[WATodayPadView addSubview:](v3, "addSubview:", v20);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v17);
    }

    -[WATodayPadView setConditionsLine:](v3, "setConditionsLine:", 0);
    -[WATodayPadView setConditionsImage:](v3, "setConditionsImage:", 0);
    -[WATodayPadView setTemperature:](v3, "setTemperature:", 0);
    -[WATodayPadView setLocationName:](v3, "setLocationName:", 0);
  }
  return v3;
}

- (void)willMoveToWindow:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WATodayPadView;
  -[WATodayPadView willMoveToWindow:](&v6, sel_willMoveToWindow_, a3);
  -[WATodayPadView style](self, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    -[WATodayPadView setStyle:](self, "setStyle:", v5);

  }
}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[WATodayPadView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  -[WATodayPadView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", *MEMORY[0x24BDF7B88], *(double *)(MEMORY[0x24BDF7B88] + 8));
  -[WATodayPadView setFrame:](self, "setFrame:", v4, v6, v7, v8);
}

- (void)setTemperature:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[WATodayPadView temperature](self, "temperature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v10, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    -[WATodayPadView temperatureLabel](self, "temperatureLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v10);

    -[WATodayPadView legibilitySettings](self, "legibilitySettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[WATodayPadView temperatureLabel](self, "temperatureLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WATodayPadView legibilitySettings](self, "legibilitySettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateForChangedSettings:", v9);

    }
  }

}

- (NSString)temperature
{
  void *v2;
  void *v3;

  -[WATodayPadView temperatureLabel](self, "temperatureLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setLocationName:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[WATodayPadView locationName](self, "locationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v10, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    -[WATodayPadView locationLabel](self, "locationLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v10);

    -[WATodayPadView legibilitySettings](self, "legibilitySettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[WATodayPadView locationLabel](self, "locationLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WATodayPadView legibilitySettings](self, "legibilitySettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateForChangedSettings:", v9);

    }
  }

}

- (NSString)locationName
{
  void *v2;
  void *v3;

  -[WATodayPadView locationLabel](self, "locationLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setConditionsLine:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[WATodayPadView conditionsLine](self, "conditionsLine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v10, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    -[WATodayPadView conditionsLabel](self, "conditionsLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v10);

    -[WATodayPadView legibilitySettings](self, "legibilitySettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[WATodayPadView conditionsLabel](self, "conditionsLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WATodayPadView legibilitySettings](self, "legibilitySettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateForChangedSettings:", v9);

    }
  }

}

- (NSString)conditionsLine
{
  void *v2;
  void *v3;

  -[WATodayPadView conditionsLabel](self, "conditionsLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setConditionsImage:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[WATodayPadView conditionsImage](self, "conditionsImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v7);

  if ((v5 & 1) == 0)
  {
    -[WATodayPadView conditionsImageView](self, "conditionsImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v7);

  }
}

- (UIImage)conditionsImage
{
  void *v2;
  void *v3;

  -[WATodayPadView conditionsImageView](self, "conditionsImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)updateForChangedSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[3];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WATodayPadView setLegibilitySettings:](self, "setLegibilitySettings:", v4);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[WATodayPadView locationLabel](self, "locationLabel", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  -[WATodayPadView conditionsLabel](self, "conditionsLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v6;
  -[WATodayPadView temperatureLabel](self, "temperatureLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "updateForChangedSettings:", v4);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v10);
  }

}

- (void)setStyle:(id)a3
{
  WATodayPadViewStyle *v4;
  WATodayPadViewStyle *style;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if ((objc_msgSend(v12, "isEqual:", self->_style) & 1) == 0)
  {
    v4 = (WATodayPadViewStyle *)objc_msgSend(v12, "copy");
    style = self->_style;
    self->_style = v4;

    objc_msgSend(v12, "locationFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WATodayPadView locationLabel](self, "locationLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v6);

    objc_msgSend(v12, "conditionsFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WATodayPadView conditionsLabel](self, "conditionsLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v8);

    objc_msgSend(v12, "temperatureFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WATodayPadView temperatureLabel](self, "temperatureLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v10);

    -[WATodayPadView _setupConstraintsForViews](self, "_setupConstraintsForViews");
    -[WATodayPadView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_setupConstraintsForViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
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
  double v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
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
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;

  -[WATodayPadView constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD1628];
    -[WATodayPadView constraints](self, "constraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

  }
  -[WATodayPadView style](self, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v79 = (id)objc_opt_new();
    -[WATodayPadView style](self, "style");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "conditionsImageLeadingMargin");
    v9 = v8;

    -[WATodayPadView style](self, "style");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "labelLeadingMargin");
    v12 = v11;

    -[WATodayPadView conditionsImageView](self, "conditionsImageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WATodayPadView leadingAnchor](self, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObject:", v16);

    -[WATodayPadView temperatureLabel](self, "temperatureLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WATodayPadView leadingAnchor](self, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObject:", v20);

    -[WATodayPadView locationLabel](self, "locationLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WATodayPadView leadingAnchor](self, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObject:", v24);

    -[WATodayPadView conditionsLabel](self, "conditionsLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[WATodayPadView leadingAnchor](self, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, v12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObject:", v28);

    -[WATodayPadView conditionsImageView](self, "conditionsImageView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WATodayPadView trailingAnchor](self, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintLessThanOrEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObject:", v32);

    -[WATodayPadView temperatureLabel](self, "temperatureLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[WATodayPadView trailingAnchor](self, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObject:", v36);

    -[WATodayPadView locationLabel](self, "locationLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[WATodayPadView trailingAnchor](self, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintLessThanOrEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObject:", v40);

    -[WATodayPadView conditionsLabel](self, "conditionsLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[WATodayPadView trailingAnchor](self, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintLessThanOrEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObject:", v44);

    -[WATodayPadView style](self, "style");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "temperatureLabelBaselineToConditionsImageViewBottom");
    v47 = v46;

    -[WATodayPadView style](self, "style");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "locationLabelBaselineToTemperatureLabelBaseline");
    v50 = v49;

    -[WATodayPadView style](self, "style");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "conditionsLabelBaselineToLocationLabelBaseline");
    v53 = v52;

    -[WATodayPadView style](self, "style");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "conditionsLabelBaselineToBottom");
    v56 = v55;

    -[WATodayPadView conditionsImageView](self, "conditionsImageView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "topAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[WATodayPadView topAnchor](self, "topAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObject:", v60);

    -[WATodayPadView conditionsImageView](self, "conditionsImageView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "bottomAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[WATodayPadView temperatureLabel](self, "temperatureLabel");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "lastBaselineAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:constant:", v64, v47);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObject:", v65);

    v66 = (void *)MEMORY[0x24BE6B630];
    -[WATodayPadView locationLabel](self, "locationLabel");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[WATodayPadView temperatureLabel](self, "temperatureLabel");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "baselineConstraintForAutoitem:relation:toView:attribute:defaultConstant:", v67, 0, v68, 11, v50);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObject:", v69);

    v70 = (void *)MEMORY[0x24BE6B630];
    -[WATodayPadView conditionsLabel](self, "conditionsLabel");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[WATodayPadView locationLabel](self, "locationLabel");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "baselineConstraintForAutoitem:relation:toView:attribute:defaultConstant:", v71, 0, v72, 11, v53);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObject:", v73);

    v74 = (void *)MEMORY[0x24BE6B630];
    -[WATodayPadView conditionsLabel](self, "conditionsLabel");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "baselineConstraintForAutoitem:relation:toView:attribute:defaultConstant:", v75, 0, self, 4, v56);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObject:", v76);

    -[WATodayPadView setConstraints:](self, "setConstraints:", v79);
    v77 = (void *)MEMORY[0x24BDD1628];
    -[WATodayPadView constraints](self, "constraints");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "activateConstraints:", v78);

  }
}

- (WATodayPadViewStyle)style
{
  return self->_style;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (UIImageView)conditionsImageView
{
  return self->_conditionsImageView;
}

- (void)setConditionsImageView:(id)a3
{
  objc_storeStrong((id *)&self->_conditionsImageView, a3);
}

- (WALegibilityLabel)temperatureLabel
{
  return self->_temperatureLabel;
}

- (void)setTemperatureLabel:(id)a3
{
  objc_storeStrong((id *)&self->_temperatureLabel, a3);
}

- (WALegibilityLabel)locationLabel
{
  return self->_locationLabel;
}

- (void)setLocationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_locationLabel, a3);
}

- (WALegibilityLabel)conditionsLabel
{
  return self->_conditionsLabel;
}

- (void)setConditionsLabel:(id)a3
{
  objc_storeStrong((id *)&self->_conditionsLabel, a3);
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_conditionsLabel, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_temperatureLabel, 0);
  objc_storeStrong((id *)&self->_conditionsImageView, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end
