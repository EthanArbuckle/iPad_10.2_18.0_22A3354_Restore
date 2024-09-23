@implementation WATodayHourlyForecastView

- (WATodayHourlyForecastView)initWithFrame:(CGRect)a3
{
  WATodayHourlyForecastView *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _QWORD v36[3];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v35.receiver = self;
  v35.super_class = (Class)WATodayHourlyForecastView;
  v3 = -[WATodayHourlyForecastView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    -[WATodayHourlyForecastView setTemperatureLabel:](v3, "setTemperatureLabel:", v4);

    -[WATodayHourlyForecastView temperatureLabel](v3, "temperatureLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", 1);

    -[WATodayHourlyForecastView temperatureLabel](v3, "temperatureLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v7 = objc_alloc_init(MEMORY[0x24BDF6FC8]);
    -[WATodayHourlyForecastView setTemperatureLabelVisualEffectView:](v3, "setTemperatureLabelVisualEffectView:", v7);

    -[WATodayHourlyForecastView temperatureLabelVisualEffectView](v3, "temperatureLabelVisualEffectView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WATodayHourlyForecastView temperatureLabel](v3, "temperatureLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

    v11 = (void *)objc_opt_new();
    -[WATodayHourlyForecastView setTimeLabel:](v3, "setTimeLabel:", v11);

    -[WATodayHourlyForecastView timeLabel](v3, "timeLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAdjustsFontForContentSizeCategory:", 1);

    -[WATodayHourlyForecastView timeLabel](v3, "timeLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAdjustsFontSizeToFitWidth:", 1);

    -[WATodayHourlyForecastView timeLabel](v3, "timeLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v15 = objc_alloc_init(MEMORY[0x24BDF6FC8]);
    -[WATodayHourlyForecastView setTimeLabelVisualEffectView:](v3, "setTimeLabelVisualEffectView:", v15);

    -[WATodayHourlyForecastView timeLabelVisualEffectView](v3, "timeLabelVisualEffectView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WATodayHourlyForecastView timeLabel](v3, "timeLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v18);

    v19 = (void *)objc_opt_new();
    -[WATodayHourlyForecastView setConditionsImageView:](v3, "setConditionsImageView:", v19);

    -[WATodayHourlyForecastView conditionsImageView](v3, "conditionsImageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setContentMode:", 2);

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[WATodayHourlyForecastView temperatureLabelVisualEffectView](v3, "temperatureLabelVisualEffectView", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v21;
    -[WATodayHourlyForecastView timeLabelVisualEffectView](v3, "timeLabelVisualEffectView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v22;
    -[WATodayHourlyForecastView conditionsImageView](v3, "conditionsImageView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v32 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[WATodayHourlyForecastView addSubview:](v3, "addSubview:", v29);
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v26);
    }

    -[WATodayHourlyForecastView _setupConstraints](v3, "_setupConstraints");
  }
  return v3;
}

- (void)setTemperature:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[WATodayHourlyForecastView temperatureLabel](self, "temperatureLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToAttributedString:", v8);

  if ((v6 & 1) == 0)
  {
    -[WATodayHourlyForecastView temperatureLabel](self, "temperatureLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAttributedText:", v8);

  }
}

- (NSAttributedString)temperature
{
  void *v2;
  void *v3;

  -[WATodayHourlyForecastView temperatureLabel](self, "temperatureLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (void)setTime:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[WATodayHourlyForecastView timeLabel](self, "timeLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToAttributedString:", v8);

  if ((v6 & 1) == 0)
  {
    -[WATodayHourlyForecastView timeLabel](self, "timeLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAttributedText:", v8);

  }
}

- (NSAttributedString)time
{
  void *v2;
  void *v3;

  -[WATodayHourlyForecastView timeLabel](self, "timeLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (void)setConditionsImage:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[WATodayHourlyForecastView conditionsImageView](self, "conditionsImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v8);

  if ((v6 & 1) == 0)
  {
    -[WATodayHourlyForecastView conditionsImageView](self, "conditionsImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v8);

  }
}

- (UIImage)conditionsImage
{
  void *v2;
  void *v3;

  -[WATodayHourlyForecastView conditionsImageView](self, "conditionsImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)applyVibrancyToTimeWithEffect:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WATodayHourlyForecastView timeLabelVisualEffectView](self, "timeLabelVisualEffectView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEffect:", v4);

  -[WATodayHourlyForecastView temperatureLabelVisualEffectView](self, "temperatureLabelVisualEffectView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEffect:", v4);

}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
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
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
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
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t i;
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
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  -[WATodayHourlyForecastView constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD1628];
    -[WATodayHourlyForecastView constraints](self, "constraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

    -[WATodayHourlyForecastView setConstraints:](self, "setConstraints:", 0);
  }
  v6 = *MEMORY[0x24BDF77D0];
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  -[WATodayHourlyForecastView timeLabelVisualEffectView](self, "timeLabelVisualEffectView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastBaselineAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHourlyForecastView topAnchor](self, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_scaledValueForValue:", 28.0);
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v13);

  -[WATodayHourlyForecastView timeLabelVisualEffectView](self, "timeLabelVisualEffectView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastBaselineAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHourlyForecastView conditionsImageView](self, "conditionsImageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v7;
  objc_msgSend(v7, "_scaledValueForValue:", 12.0);
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, -v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v19);

  -[WATodayHourlyForecastView temperatureLabelVisualEffectView](self, "temperatureLabelVisualEffectView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "lastBaselineAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHourlyForecastView conditionsImageView](self, "conditionsImageView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_scaledValueForValue:", 22.0);
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v24);

  -[WATodayHourlyForecastView temperatureLabelVisualEffectView](self, "temperatureLabelVisualEffectView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "lastBaselineAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHourlyForecastView bottomAnchor](self, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v8;
  objc_msgSend(v8, "_scaledValueForValue:", 17.0);
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, -v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v29);

  -[WATodayHourlyForecastView timeLabel](self, "timeLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHourlyForecastView timeLabelVisualEffectView](self, "timeLabelVisualEffectView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v34);

  -[WATodayHourlyForecastView timeLabel](self, "timeLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHourlyForecastView timeLabelVisualEffectView](self, "timeLabelVisualEffectView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v39);

  -[WATodayHourlyForecastView timeLabel](self, "timeLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHourlyForecastView timeLabelVisualEffectView](self, "timeLabelVisualEffectView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v44);

  -[WATodayHourlyForecastView timeLabel](self, "timeLabel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHourlyForecastView timeLabelVisualEffectView](self, "timeLabelVisualEffectView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bottomAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v49);

  -[WATodayHourlyForecastView temperatureLabel](self, "temperatureLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHourlyForecastView temperatureLabelVisualEffectView](self, "temperatureLabelVisualEffectView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "contentView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "leadingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v55);

  -[WATodayHourlyForecastView temperatureLabel](self, "temperatureLabel");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "trailingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHourlyForecastView temperatureLabelVisualEffectView](self, "temperatureLabelVisualEffectView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "contentView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "trailingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v61);

  -[WATodayHourlyForecastView temperatureLabel](self, "temperatureLabel");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "topAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHourlyForecastView temperatureLabelVisualEffectView](self, "temperatureLabelVisualEffectView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "contentView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "topAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v67);

  -[WATodayHourlyForecastView temperatureLabel](self, "temperatureLabel");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "bottomAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHourlyForecastView temperatureLabelVisualEffectView](self, "temperatureLabelVisualEffectView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "contentView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "bottomAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v73);

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  -[WATodayHourlyForecastView subviews](self, "subviews");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v90, v94, 16);
  if (v75)
  {
    v76 = v75;
    v77 = *(_QWORD *)v91;
    do
    {
      for (i = 0; i != v76; ++i)
      {
        if (*(_QWORD *)v91 != v77)
          objc_enumerationMutation(v74);
        v79 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
        objc_msgSend(v79, "centerXAnchor");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        -[WATodayHourlyForecastView centerXAnchor](self, "centerXAnchor");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "constraintEqualToAnchor:", v81);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v82);

        -[WATodayHourlyForecastView widthAnchor](self, "widthAnchor");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "widthAnchor");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "constraintGreaterThanOrEqualToAnchor:multiplier:", v84, 1.0);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v85);

      }
      v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v90, v94, 16);
    }
    while (v76);
  }

  -[WATodayHourlyForecastView setConstraints:](self, "setConstraints:", v9);
  v86 = (void *)MEMORY[0x24BDD1628];
  -[WATodayHourlyForecastView constraints](self, "constraints");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "activateConstraints:", v87);

}

- (UIVisualEffectView)temperatureLabelVisualEffectView
{
  return self->_temperatureLabelVisualEffectView;
}

- (void)setTemperatureLabelVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_temperatureLabelVisualEffectView, a3);
}

- (UIVisualEffectView)timeLabelVisualEffectView
{
  return self->_timeLabelVisualEffectView;
}

- (void)setTimeLabelVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_timeLabelVisualEffectView, a3);
}

- (UILabel)temperatureLabel
{
  return self->_temperatureLabel;
}

- (void)setTemperatureLabel:(id)a3
{
  objc_storeStrong((id *)&self->_temperatureLabel, a3);
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timeLabel, a3);
}

- (UIImageView)conditionsImageView
{
  return self->_conditionsImageView;
}

- (void)setConditionsImageView:(id)a3
{
  objc_storeStrong((id *)&self->_conditionsImageView, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_conditionsImageView, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_temperatureLabel, 0);
  objc_storeStrong((id *)&self->_timeLabelVisualEffectView, 0);
  objc_storeStrong((id *)&self->_temperatureLabelVisualEffectView, 0);
}

@end
