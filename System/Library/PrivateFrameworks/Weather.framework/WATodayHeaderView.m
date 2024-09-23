@implementation WATodayHeaderView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (WATodayHeaderView)init
{
  WATodayHeaderView *v2;
  WATodayHeaderView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WATodayHeaderView;
  v2 = -[WATodayHeaderView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[WATodayHeaderView _setupSubviews](v2, "_setupSubviews");
  return v3;
}

- (void)setConditionsLine1:(id)a3
{
  NSString *v4;
  NSString *conditionsLine1;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_conditionsLine1, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    conditionsLine1 = self->_conditionsLine1;
    self->_conditionsLine1 = v4;

    -[WATodayHeaderView _updateContent](self, "_updateContent");
  }

}

- (void)setConditionsLine2:(id)a3
{
  NSString *v4;
  NSString *conditionsLine2;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_conditionsLine2, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    conditionsLine2 = self->_conditionsLine2;
    self->_conditionsLine2 = v4;

    -[WATodayHeaderView _updateContent](self, "_updateContent");
  }

}

- (void)setConditionsImage:(id)a3
{
  UIImage *v4;
  UIImage *conditionsImage;
  id v6;

  v6 = a3;
  if ((-[UIImage isEqual:](self->_conditionsImage, "isEqual:") & 1) == 0)
  {
    v4 = (UIImage *)objc_msgSend(v6, "copy");
    conditionsImage = self->_conditionsImage;
    self->_conditionsImage = v4;

    -[WATodayHeaderView _updateContent](self, "_updateContent");
  }

}

- (void)setTemperature:(id)a3
{
  NSString *v4;
  NSString *temperature;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_temperature, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    temperature = self->_temperature;
    self->_temperature = v4;

    -[WATodayHeaderView _updateContent](self, "_updateContent");
  }

}

- (void)setTemperatureLow:(id)a3
{
  NSString *v4;
  NSString *temperatureLow;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_temperatureLow, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    temperatureLow = self->_temperatureLow;
    self->_temperatureLow = v4;

    -[WATodayHeaderView _updateContent](self, "_updateContent");
  }

}

- (void)setTemperatureHigh:(id)a3
{
  NSString *v4;
  NSString *temperatureHigh;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_temperatureHigh, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    temperatureHigh = self->_temperatureHigh;
    self->_temperatureHigh = v4;

    -[WATodayHeaderView _updateContent](self, "_updateContent");
  }

}

- (void)setLocationName:(id)a3
{
  NSString *v4;
  NSString *locationName;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_locationName, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    locationName = self->_locationName;
    self->_locationName = v4;

    -[WATodayHeaderView _updateContent](self, "_updateContent");
  }

}

- (void)_updateContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
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
  id v21;

  -[WATodayHeaderView locationName](self, "locationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView locationLabel](self, "locationLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

  -[WATodayHeaderView temperature](self, "temperature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WATodayHeaderViewDegreeAttributedStringWithTemperatureObject(0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView temperatureLabel](self, "temperatureLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAttributedText:", v6);

  -[WATodayHeaderView temperatureHigh](self, "temperatureHigh");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        -[WATodayHeaderView temperatureLow](self, "temperatureLow"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    -[WATodayHeaderView temperatureHigh](self, "temperatureHigh");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WATodayHeaderView temperatureLow](self, "temperatureLow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ / %@"), v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WATodayHeaderView temperatureHighLowLabel](self, "temperatureHighLowLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v14);

  }
  else
  {
    -[WATodayHeaderView temperatureHighLowLabel](self, "temperatureHighLowLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", &stru_24DD9EDF8);
  }

  -[WATodayHeaderView conditionsLine1](self, "conditionsLine1");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView conditionsLabel1](self, "conditionsLabel1");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v16);

  -[WATodayHeaderView conditionsLine2](self, "conditionsLine2");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView conditionsLabel2](self, "conditionsLabel2");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", v18);

  -[WATodayHeaderView conditionsImage](self, "conditionsImage");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView conditionsImageView](self, "conditionsImageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setImage:", v21);

}

- (void)_setupSubviews
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t n;
  uint64_t v45;
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
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[5];
  _BYTE v78[128];
  _QWORD v79[2];
  _BYTE v80[128];
  _QWORD v81[3];
  _BYTE v82[128];
  _QWORD v83[3];
  _BYTE v84[128];
  _QWORD v85[5];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BDF77F0], 0x8000, 2);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", 0.0);
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BDF77D0], 0x8000, 2);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = objc_opt_new();
  v8 = objc_opt_new();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v53 = (void *)v6;
  v54 = (void *)v5;
  v85[0] = v5;
  v85[1] = v6;
  v85[2] = v7;
  v55 = (void *)objc_opt_new();
  v56 = (void *)v8;
  v85[3] = v8;
  v85[4] = v55;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v85, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v74 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        objc_msgSend(v14, "setAdjustsFontForContentSizeCategory:", 1);
        objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
    }
    while (v11);
  }

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v52 = (void *)v7;
  v83[0] = v7;
  v83[1] = v56;
  v83[2] = v55;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v83, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v69, v84, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v70;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v70 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
        WADetailColor();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setTextColor:", v21);

        objc_msgSend(v20, "setFont:", v4);
        objc_msgSend(v20, "setNumberOfLines:", 1);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v69, v84, 16);
    }
    while (v17);
  }

  objc_msgSend(v54, "setFont:", v3);
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v81[0] = v54;
  v81[1] = v52;
  v81[2] = v56;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v81, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v65, v82, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v66;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v66 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * k);
        objc_msgSend(v27, "setAdjustsFontSizeToFitWidth:", 1);
        objc_msgSend(v27, "setMinimumScaleFactor:", 0.4);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v65, v82, 16);
    }
    while (v24);
  }
  v50 = (void *)v3;

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v79[0] = v53;
  v79[1] = v55;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v79, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v61, v80, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v62;
    do
    {
      for (m = 0; m != v30; ++m)
      {
        if (*(_QWORD *)v62 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * m);
        objc_msgSend(v33, "setAdjustsFontSizeToFitWidth:", 1);
        objc_msgSend(v33, "setMinimumScaleFactor:", 0.2);
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v61, v80, 16);
    }
    while (v30);
  }

  WAContentColor();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setTextColor:", v34);

  objc_msgSend(v53, "setTextAlignment:", 2);
  objc_msgSend(v55, "setTextAlignment:", 1);
  WAContentColor();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setTextColor:", v35);

  v36 = (void *)objc_opt_new();
  objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v36, "setContentMode:", 1);
  objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WATodayHeaderView addSubview:](self, "addSubview:", v36);
  objc_msgSend(MEMORY[0x24BDF6F88], "widgetEffectForVibrancyStyle:", 101);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FC8]), "initWithEffect:", v48);
  -[WATodayHeaderView setWeatherInformationVisualEffectView:](self, "setWeatherInformationVisualEffectView:", v37);

  -[WATodayHeaderView weatherInformationVisualEffectView](self, "weatherInformationVisualEffectView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WATodayHeaderView weatherInformationVisualEffectView](self, "weatherInformationVisualEffectView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView addSubview:](self, "addSubview:", v39);

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v77[0] = v54;
  v77[1] = v53;
  v77[2] = v52;
  v77[3] = v56;
  v77[4] = v55;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v77, 5);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v57, v78, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v58;
    do
    {
      for (n = 0; n != v42; ++n)
      {
        if (*(_QWORD *)v58 != v43)
          objc_enumerationMutation(v40);
        v45 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * n);
        -[WATodayHeaderView weatherInformationVisualEffectView](self, "weatherInformationVisualEffectView");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "contentView");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addSubview:", v45);

      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v57, v78, 16);
    }
    while (v42);
  }

  -[WATodayHeaderView setLocationLabel:](self, "setLocationLabel:", v54);
  -[WATodayHeaderView setConditionsLabel1:](self, "setConditionsLabel1:", v52);
  -[WATodayHeaderView setConditionsLabel2:](self, "setConditionsLabel2:", v56);
  -[WATodayHeaderView setTemperatureHighLowLabel:](self, "setTemperatureHighLowLabel:", v55);
  -[WATodayHeaderView setTemperatureLabel:](self, "setTemperatureLabel:", v53);
  -[WATodayHeaderView setConditionsImageView:](self, "setConditionsImageView:", v36);
  -[WATodayHeaderView _setupConstraints](self, "_setupConstraints");

}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
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
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  double v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  double v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  double v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  uint64_t v140;
  double v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  _QWORD v167[3];
  _BYTE v168[128];
  uint64_t v169;

  v169 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x24BDD1628];
  -[WATodayHeaderView conditionsImageView](self, "conditionsImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView conditionsImageView](self, "conditionsImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 8, 0, v6, 7, 1.0, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  -[WATodayHeaderView conditionsImageView](self, "conditionsImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = 1132068864;
  objc_msgSend(v8, "setContentCompressionResistancePriority:forAxis:", 0, v9);

  -[WATodayHeaderView conditionsImageView](self, "conditionsImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 1132068864;
  objc_msgSend(v10, "setContentCompressionResistancePriority:forAxis:", 1, v11);

  -[WATodayHeaderView locationLabel](self, "locationLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 1132068864;
  objc_msgSend(v12, "setContentCompressionResistancePriority:forAxis:", 0, v13);

  -[WATodayHeaderView conditionsLabel1](self, "conditionsLabel1");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 1144750080;
  objc_msgSend(v14, "setContentCompressionResistancePriority:forAxis:", 0, v15);

  -[WATodayHeaderView conditionsLabel2](self, "conditionsLabel2");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = 1144750080;
  objc_msgSend(v16, "setContentCompressionResistancePriority:forAxis:", 0, v17);

  -[WATodayHeaderView temperatureLabel](self, "temperatureLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = 1144750080;
  objc_msgSend(v18, "setContentCompressionResistancePriority:forAxis:", 0, v19);

  -[WATodayHeaderView temperatureHighLowLabel](self, "temperatureHighLowLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = 1144750080;
  objc_msgSend(v20, "setContentCompressionResistancePriority:forAxis:", 0, v21);

  -[WATodayHeaderView conditionsImageView](self, "conditionsImageView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "widthAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintGreaterThanOrEqualToConstant:", 30.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v24);

  -[WATodayHeaderView conditionsImageView](self, "conditionsImageView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "heightAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintGreaterThanOrEqualToConstant:", 30.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v27);

  -[WATodayHeaderView conditionsImageView](self, "conditionsImageView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView leadingAnchor](self, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, 2.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v31);

  -[WATodayHeaderView weatherInformationVisualEffectView](self, "weatherInformationVisualEffectView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView conditionsImageView](self, "conditionsImageView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v35, 5.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v36);

  -[WATodayHeaderView weatherInformationVisualEffectView](self, "weatherInformationVisualEffectView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView trailingAnchor](self, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, -16.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v40);

  -[WATodayHeaderView locationLabel](self, "locationLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView weatherInformationVisualEffectView](self, "weatherInformationVisualEffectView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v45);

  -[WATodayHeaderView conditionsLabel1](self, "conditionsLabel1");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView weatherInformationVisualEffectView](self, "weatherInformationVisualEffectView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v50);

  -[WATodayHeaderView conditionsLabel2](self, "conditionsLabel2");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "leadingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView weatherInformationVisualEffectView](self, "weatherInformationVisualEffectView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "leadingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v55);

  -[WATodayHeaderView locationLabel](self, "locationLabel");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "widthAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintGreaterThanOrEqualToConstant:", 140.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v58);

  -[WATodayHeaderView conditionsLabel1](self, "conditionsLabel1");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "widthAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintGreaterThanOrEqualToConstant:", 140.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v61);

  -[WATodayHeaderView conditionsLabel2](self, "conditionsLabel2");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "widthAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintGreaterThanOrEqualToConstant:", 140.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v64);

  -[WATodayHeaderView locationLabel](self, "locationLabel");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "trailingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView temperatureLabel](self, "temperatureLabel");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "leadingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:constant:", v68, -7.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v69);

  -[WATodayHeaderView temperatureLabel](self, "temperatureLabel");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "leadingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView temperatureHighLowLabel](self, "temperatureHighLowLabel");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "leadingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:", v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v74);

  -[WATodayHeaderView temperatureLabel](self, "temperatureLabel");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "trailingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView weatherInformationVisualEffectView](self, "weatherInformationVisualEffectView");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "trailingAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:", v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v79);

  -[WATodayHeaderView temperatureHighLowLabel](self, "temperatureHighLowLabel");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "trailingAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView weatherInformationVisualEffectView](self, "weatherInformationVisualEffectView");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "trailingAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintEqualToAnchor:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v84);

  -[WATodayHeaderView temperatureLabel](self, "temperatureLabel");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "widthAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintGreaterThanOrEqualToConstant:", 60.0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v87);

  -[WATodayHeaderView temperatureHighLowLabel](self, "temperatureHighLowLabel");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "widthAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "constraintGreaterThanOrEqualToConstant:", 60.0);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v90);

  -[WATodayHeaderView weatherInformationVisualEffectView](self, "weatherInformationVisualEffectView");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "topAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView topAnchor](self, "topAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "constraintEqualToAnchor:", v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v94);

  -[WATodayHeaderView weatherInformationVisualEffectView](self, "weatherInformationVisualEffectView");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "bottomAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView bottomAnchor](self, "bottomAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintEqualToAnchor:", v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v98);

  v99 = (void *)MEMORY[0x24BDD1628];
  -[WATodayHeaderView conditionsImageView](self, "conditionsImageView");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView weatherInformationVisualEffectView](self, "weatherInformationVisualEffectView");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v100, 10, 0, v101, 10, 1.0, 0.0);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v102);

  -[WATodayHeaderView locationLabel](self, "locationLabel");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView weatherInformationVisualEffectView](self, "weatherInformationVisualEffectView");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView locationLabel](self, "locationLabel");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "font");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_msgSend(v106, "_scaledValueForValue:", 32.0);
  __38__WATodayHeaderView__setupConstraints__block_invoke_2(v109, v107, (uint64_t)v103, v108, (uint64_t)v104, 3, v3);

  -[WATodayHeaderView conditionsLabel1](self, "conditionsLabel1");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView locationLabel](self, "locationLabel");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView conditionsLabel1](self, "conditionsLabel1");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "font");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = objc_msgSend(v113, "_scaledValueForValue:", 20.0);
  __38__WATodayHeaderView__setupConstraints__block_invoke_2(v116, v114, (uint64_t)v110, v115, (uint64_t)v111, 11, v3);

  -[WATodayHeaderView conditionsLabel2](self, "conditionsLabel2");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView conditionsLabel1](self, "conditionsLabel1");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView conditionsLabel2](self, "conditionsLabel2");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "font");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = objc_msgSend(v120, "_scaledValueForValue:", 16.0);
  __38__WATodayHeaderView__setupConstraints__block_invoke_2(v123, v121, (uint64_t)v117, v122, (uint64_t)v118, 11, v3);

  -[WATodayHeaderView conditionsLabel2](self, "conditionsLabel2");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "lastBaselineAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView temperatureHighLowLabel](self, "temperatureHighLowLabel");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "lastBaselineAnchor");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  __38__WATodayHeaderView__setupConstraints__block_invoke(0.0, (uint64_t)v127, v125, (uint64_t)v127, v3);

  -[WATodayHeaderView temperatureHighLowLabel](self, "temperatureHighLowLabel");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "widthAnchor");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView temperatureLabel](self, "temperatureLabel");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "widthAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "constraintEqualToAnchor:", v131);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v132);

  -[WATodayHeaderView conditionsLabel1](self, "conditionsLabel1");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView temperatureLabel](self, "temperatureLabel");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  __38__WATodayHeaderView__setupConstraints__block_invoke_2(0.0, (uint64_t)v134, (uint64_t)v133, v135, (uint64_t)v134, 11, v3);

  -[WATodayHeaderView conditionsLabel2](self, "conditionsLabel2");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView weatherInformationVisualEffectView](self, "weatherInformationVisualEffectView");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView conditionsLabel1](self, "conditionsLabel1");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "font");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = objc_msgSend(v139, "_scaledValueForValue:", 20.0);
  __38__WATodayHeaderView__setupConstraints__block_invoke_2(-v141, v140, (uint64_t)v136, v142, (uint64_t)v137, 4, v3);

  v165 = 0u;
  v166 = 0u;
  v163 = 0u;
  v164 = 0u;
  -[WATodayHeaderView locationLabel](self, "locationLabel", 0);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v167[0] = v143;
  -[WATodayHeaderView conditionsLabel1](self, "conditionsLabel1");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v167[1] = v144;
  -[WATodayHeaderView conditionsLabel2](self, "conditionsLabel2");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v167[2] = v145;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v167, 3);
  v146 = (void *)objc_claimAutoreleasedReturnValue();

  v147 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v163, v168, 16);
  if (v147)
  {
    v148 = v147;
    v149 = *(_QWORD *)v164;
    do
    {
      v150 = 0;
      do
      {
        if (*(_QWORD *)v164 != v149)
          objc_enumerationMutation(v146);
        objc_msgSend(*(id *)(*((_QWORD *)&v163 + 1) + 8 * v150), "trailingAnchor");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        -[WATodayHeaderView temperatureLabel](self, "temperatureLabel");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "leadingAnchor");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v151, "constraintLessThanOrEqualToAnchor:constant:", v153, -8.0);
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v154);

        ++v150;
      }
      while (v148 != v150);
      v148 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v163, v168, 16);
    }
    while (v148);
  }

  -[WATodayHeaderView conditionsImageView](self, "conditionsImageView");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "widthAnchor");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayHeaderView conditionsImageView](self, "conditionsImageView");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "heightAnchor");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "constraintEqualToAnchor:", v158);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v159);

  -[WATodayHeaderView conditionsImageView](self, "conditionsImageView");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "widthAnchor");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "constraintEqualToConstant:", 100.0);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v162);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v3);
}

void __38__WATodayHeaderView__setupConstraints__block_invoke(double a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;

  v8 = a5;
  objc_msgSend(a3, "constraintEqualToAnchor:constant:", a4, a1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

}

void __38__WATodayHeaderView__setupConstraints__block_invoke_2(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  void *v11;
  id v12;
  id v13;

  v11 = (void *)MEMORY[0x24BDD1628];
  v12 = a7;
  objc_msgSend(v11, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 11, 0, a5, a6, 1.0, a1);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

}

- (NSString)conditionsLine1
{
  return self->_conditionsLine1;
}

- (NSString)conditionsLine2
{
  return self->_conditionsLine2;
}

- (UIImage)conditionsImage
{
  return self->_conditionsImage;
}

- (NSString)temperature
{
  return self->_temperature;
}

- (NSString)temperatureHigh
{
  return self->_temperatureHigh;
}

- (NSString)temperatureLow
{
  return self->_temperatureLow;
}

- (NSString)locationName
{
  return self->_locationName;
}

- (UIVisualEffectView)weatherInformationVisualEffectView
{
  return self->_weatherInformationVisualEffectView;
}

- (void)setWeatherInformationVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_weatherInformationVisualEffectView, a3);
}

- (UILabel)locationLabel
{
  return self->_locationLabel;
}

- (void)setLocationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_locationLabel, a3);
}

- (UILabel)conditionsLabel1
{
  return self->_conditionsLabel1;
}

- (void)setConditionsLabel1:(id)a3
{
  objc_storeStrong((id *)&self->_conditionsLabel1, a3);
}

- (UILabel)conditionsLabel2
{
  return self->_conditionsLabel2;
}

- (void)setConditionsLabel2:(id)a3
{
  objc_storeStrong((id *)&self->_conditionsLabel2, a3);
}

- (UIImageView)conditionsImageView
{
  return self->_conditionsImageView;
}

- (void)setConditionsImageView:(id)a3
{
  objc_storeStrong((id *)&self->_conditionsImageView, a3);
}

- (UILabel)temperatureLabel
{
  return self->_temperatureLabel;
}

- (void)setTemperatureLabel:(id)a3
{
  objc_storeStrong((id *)&self->_temperatureLabel, a3);
}

- (UILabel)temperatureHighLowLabel
{
  return self->_temperatureHighLowLabel;
}

- (void)setTemperatureHighLowLabel:(id)a3
{
  objc_storeStrong((id *)&self->_temperatureHighLowLabel, a3);
}

- (double)pageFontSize
{
  return self->_pageFontSize;
}

- (void)setPageFontSize:(double)a3
{
  self->_pageFontSize = a3;
}

- (double)pageDegreeFontSize
{
  return self->_pageDegreeFontSize;
}

- (void)setPageDegreeFontSize:(double)a3
{
  self->_pageDegreeFontSize = a3;
}

- (double)pageBaselineOffset
{
  return self->_pageBaselineOffset;
}

- (void)setPageBaselineOffset:(double)a3
{
  self->_pageBaselineOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temperatureHighLowLabel, 0);
  objc_storeStrong((id *)&self->_temperatureLabel, 0);
  objc_storeStrong((id *)&self->_conditionsImageView, 0);
  objc_storeStrong((id *)&self->_conditionsLabel2, 0);
  objc_storeStrong((id *)&self->_conditionsLabel1, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_weatherInformationVisualEffectView, 0);
  objc_storeStrong((id *)&self->_locationName, 0);
  objc_storeStrong((id *)&self->_temperatureLow, 0);
  objc_storeStrong((id *)&self->_temperatureHigh, 0);
  objc_storeStrong((id *)&self->_temperature, 0);
  objc_storeStrong((id *)&self->_conditionsImage, 0);
  objc_storeStrong((id *)&self->_conditionsLine2, 0);
  objc_storeStrong((id *)&self->_conditionsLine1, 0);
}

@end
