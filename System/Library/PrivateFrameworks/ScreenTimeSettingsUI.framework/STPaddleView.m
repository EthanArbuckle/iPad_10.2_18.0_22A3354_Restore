@implementation STPaddleView

- (STPaddleView)init
{
  STPaddleView *v2;
  uint64_t v3;
  UIView *backgroundView;
  void *v5;
  uint64_t v6;
  UILabel *dayLabel;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  UILabel *dateTimeLabel;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  UILabel *usageLabel;
  void *v18;
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
  uint64_t v30;
  NSDateIntervalFormatter *hourIntervalDateFormatter;
  uint64_t v32;
  NSDateFormatter *weekdayDateFormatter;
  uint64_t v34;
  NSDateFormatter *monthDateFormatter;
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
  void *v107;
  objc_super v108;
  _QWORD v109[27];

  v109[25] = *MEMORY[0x24BDAC8D0];
  v108.receiver = self;
  v108.super_class = (Class)STPaddleView;
  v2 = -[STPaddleView initWithFrame:](&v108, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v3 = objc_opt_new();
  backgroundView = v2->_backgroundView;
  v2->_backgroundView = (UIView *)v3;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v2->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView _setContinuousCornerRadius:](v2->_backgroundView, "_setContinuousCornerRadius:", 6.0);
  -[UIView setClipsToBounds:](v2->_backgroundView, "setClipsToBounds:", 1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGreenColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v2->_backgroundView, "setBackgroundColor:", v5);

  -[STPaddleView addSubview:](v2, "addSubview:", v2->_backgroundView);
  v106 = (void *)objc_opt_new();
  -[STPaddleView addLayoutGuide:](v2, "addLayoutGuide:", v106);
  v6 = objc_opt_new();
  dayLabel = v2->_dayLabel;
  v2->_dayLabel = (UILabel *)v6;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_dayLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = *MEMORY[0x24BEBE220];
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v2->_dayLabel, "setFont:", v9);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v2->_dayLabel, "setTextColor:", v10);

  -[UILabel _setDrawsAsBackdropOverlayWithBlendMode:](v2->_dayLabel, "_setDrawsAsBackdropOverlayWithBlendMode:", 2);
  -[STPaddleView addSubview:](v2, "addSubview:", v2->_dayLabel);
  v107 = (void *)objc_opt_new();
  -[STPaddleView addLayoutGuide:](v2, "addLayoutGuide:", v107);
  v11 = objc_opt_new();
  dateTimeLabel = v2->_dateTimeLabel;
  v2->_dateTimeLabel = (UILabel *)v11;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_dateTimeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v2->_dateTimeLabel, "setFont:", v13);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v2->_dateTimeLabel, "setTextColor:", v14);

  -[STPaddleView addSubview:](v2, "addSubview:", v2->_dateTimeLabel);
  v15 = (void *)objc_opt_new();
  -[STPaddleView addLayoutGuide:](v2, "addLayoutGuide:");
  v16 = objc_opt_new();
  usageLabel = v2->_usageLabel;
  v2->_usageLabel = (UILabel *)v16;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_usageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE248]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v2->_usageLabel, "setFont:", v18);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v2->_usageLabel, "setTextColor:", v19);

  LODWORD(v20) = 1144750080;
  -[UILabel setContentHuggingPriority:forAxis:](v2->_usageLabel, "setContentHuggingPriority:forAxis:", 0, v20);
  -[STPaddleView addSubview:](v2, "addSubview:", v2->_usageLabel);
  v74 = (void *)MEMORY[0x24BDD1628];
  -[UIView topAnchor](v2->_backgroundView, "topAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPaddleView topAnchor](v2, "topAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "constraintEqualToAnchor:", v104);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v109[0] = v103;
  -[UIView leadingAnchor](v2->_backgroundView, "leadingAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPaddleView leadingAnchor](v2, "leadingAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "constraintEqualToAnchor:", v101);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v109[1] = v100;
  -[UIView bottomAnchor](v2->_backgroundView, "bottomAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPaddleView bottomAnchor](v2, "bottomAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "constraintEqualToAnchor:", v98);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v109[2] = v97;
  -[UIView trailingAnchor](v2->_backgroundView, "trailingAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPaddleView trailingAnchor](v2, "trailingAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintEqualToAnchor:", v95);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v109[3] = v94;
  objc_msgSend(v106, "topAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPaddleView topAnchor](v2, "topAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "constraintEqualToAnchor:", v92);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v109[4] = v91;
  objc_msgSend(v106, "leadingAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPaddleView leadingAnchor](v2, "leadingAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "constraintEqualToAnchor:", v89);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v109[5] = v88;
  objc_msgSend(v106, "trailingAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPaddleView trailingAnchor](v2, "trailingAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "constraintEqualToAnchor:", v86);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v109[6] = v85;
  -[UILabel topAnchor](v2->_dayLabel, "topAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "bottomAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:", v83);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v109[7] = v82;
  -[UILabel topAnchor](v2->_dayLabel, "topAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPaddleView topAnchor](v2, "topAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v80, 0.5);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v109[8] = v79;
  -[UILabel leadingAnchor](v2->_dayLabel, "leadingAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPaddleView leadingAnchor](v2, "leadingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v77, 1.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v109[9] = v76;
  objc_msgSend(v107, "topAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](v2->_dayLabel, "bottomAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:", v72);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v109[10] = v71;
  objc_msgSend(v107, "leadingAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPaddleView leadingAnchor](v2, "leadingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:", v69);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v109[11] = v68;
  objc_msgSend(v107, "trailingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPaddleView trailingAnchor](v2, "trailingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:", v66);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v109[12] = v65;
  -[UILabel topAnchor](v2->_dateTimeLabel, "topAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "bottomAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v63);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v109[13] = v62;
  -[UILabel leadingAnchor](v2->_dateTimeLabel, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel leadingAnchor](v2->_dayLabel, "leadingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v60);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v109[14] = v59;
  -[UILabel trailingAnchor](v2->_dateTimeLabel, "trailingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](v2->_dayLabel, "trailingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v57);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v109[15] = v56;
  objc_msgSend(v15, "topAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](v2->_dateTimeLabel, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v54);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v109[16] = v53;
  objc_msgSend(v15, "leadingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPaddleView leadingAnchor](v2, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v109[17] = v50;
  objc_msgSend(v15, "trailingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPaddleView trailingAnchor](v2, "trailingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v109[18] = v47;
  v75 = v15;
  objc_msgSend(v15, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPaddleView bottomAnchor](v2, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v109[19] = v44;
  objc_msgSend(v106, "heightAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "heightAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:multiplier:constant:", v42, 2.0, 0.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v109[20] = v41;
  objc_msgSend(v106, "heightAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "heightAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v109[21] = v38;
  -[UILabel leadingAnchor](v2->_usageLabel, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](v2->_dateTimeLabel, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v21, 1.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v109[22] = v22;
  -[UILabel lastBaselineAnchor](v2->_usageLabel, "lastBaselineAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel lastBaselineAnchor](v2->_dateTimeLabel, "lastBaselineAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v109[23] = v25;
  -[STPaddleView trailingAnchor](v2, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](v2->_usageLabel, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v27, 1.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v109[24] = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v109, 25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "activateConstraints:", v29);

  v30 = objc_opt_new();
  hourIntervalDateFormatter = v2->_hourIntervalDateFormatter;
  v2->_hourIntervalDateFormatter = (NSDateIntervalFormatter *)v30;

  -[NSDateIntervalFormatter setDateTemplate:](v2->_hourIntervalDateFormatter, "setDateTemplate:", CFSTR("j"));
  v32 = objc_opt_new();
  weekdayDateFormatter = v2->_weekdayDateFormatter;
  v2->_weekdayDateFormatter = (NSDateFormatter *)v32;

  -[NSDateFormatter setFormattingContext:](v2->_weekdayDateFormatter, "setFormattingContext:", 2);
  -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v2->_weekdayDateFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("EEEE"));
  v34 = objc_opt_new();
  monthDateFormatter = v2->_monthDateFormatter;
  v2->_monthDateFormatter = (NSDateFormatter *)v34;

  -[NSDateFormatter setFormattingContext:](v2->_monthDateFormatter, "setFormattingContext:", 2);
  -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v2->_monthDateFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMdd"));

  return v2;
}

- (void)setDataPoint:(id)a3
{
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
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  objc_storeStrong((id *)&self->_dataPoint, a3);
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v31, "timePeriod");
  switch(v6)
  {
    case 0:
      goto LABEL_18;
    case 2:
      -[STPaddleView weekdayDateFormatter](self, "weekdayDateFormatter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringFromDate:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[STPaddleView dayLabel](self, "dayLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setText:", v15);

      -[STPaddleView monthDateFormatter](self, "monthDateFormatter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringFromDate:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedUppercaseString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[STPaddleView dateTimeLabel](self, "dateTimeLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setText:", v12);

      goto LABEL_6;
    case 1:
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TodayTitle"), &stru_24DB8A1D0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[STPaddleView dayLabel](self, "dayLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setText:", v7);

      -[STPaddleView hourIntervalDateFormatter](self, "hourIntervalDateFormatter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "dateInterval");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringFromDateInterval:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[STPaddleView dateTimeLabel](self, "dateTimeLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setText:", v11);
LABEL_6:

      break;
  }
  v18 = objc_msgSend(v31, "itemType");
  if ((unint64_t)(v18 - 1) < 4)
  {
    objc_msgSend(v31, "total");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = v20;

    if (v21 >= 60.0)
    {
      v22 = (void *)objc_opt_new();
      objc_msgSend(v22, "setAllowedUnits:", 96);
      objc_msgSend(v22, "setUnitsStyle:", 1);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD14F8], "st_sharedAbbreviatedSecondsDateFormatter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v22, "stringFromTimeInterval:", v21);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[STPaddleView usageLabel](self, "usageLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setText:", v27);
    goto LABEL_17;
  }
  if (v18 == 5)
  {
    objc_msgSend(v31, "total");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v29, "unsignedLongValue");

    v25 = (void *)MEMORY[0x24BDD17C8];
    v26 = CFSTR("NotificationsCount");
    goto LABEL_16;
  }
  if (v18 == 6)
  {
    objc_msgSend(v31, "total");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "unsignedLongValue");

    v25 = (void *)MEMORY[0x24BDD17C8];
    v26 = CFSTR("PickupsCount");
LABEL_16:
    objc_msgSend(v5, "localizedStringForKey:value:table:", v26, &stru_24DB8A1D0, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringWithFormat:", v27, v24);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[STPaddleView usageLabel](self, "usageLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setText:", v28);

LABEL_17:
  }
LABEL_18:

}

- (STUsageReportGraphDataPoint)dataPoint
{
  return self->_dataPoint;
}

- (UIView)backgroundView
{
  return (UIView *)objc_getProperty(self, a2, 424, 1);
}

- (UILabel)dayLabel
{
  return (UILabel *)objc_getProperty(self, a2, 432, 1);
}

- (UILabel)dateTimeLabel
{
  return (UILabel *)objc_getProperty(self, a2, 440, 1);
}

- (UILabel)usageLabel
{
  return (UILabel *)objc_getProperty(self, a2, 448, 1);
}

- (NSDateIntervalFormatter)hourIntervalDateFormatter
{
  return (NSDateIntervalFormatter *)objc_getProperty(self, a2, 456, 1);
}

- (NSDateFormatter)weekdayDateFormatter
{
  return (NSDateFormatter *)objc_getProperty(self, a2, 464, 1);
}

- (NSDateFormatter)monthDateFormatter
{
  return (NSDateFormatter *)objc_getProperty(self, a2, 472, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthDateFormatter, 0);
  objc_storeStrong((id *)&self->_weekdayDateFormatter, 0);
  objc_storeStrong((id *)&self->_hourIntervalDateFormatter, 0);
  objc_storeStrong((id *)&self->_usageLabel, 0);
  objc_storeStrong((id *)&self->_dateTimeLabel, 0);
  objc_storeStrong((id *)&self->_dayLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_dataPoint, 0);
}

@end
