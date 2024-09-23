@implementation REUpNextLargeWithDetailTextCell

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    kActiveLayout_0 = 0x4033800000000000;
    kActiveLayout_1 = 0x4043800000000000;
    kActiveLayout_2 = 0x4010000000000000;
    kActiveLayout_3 = 0x3FF0000000000000;
    kActiveLayout_5 = 0x4030800000000000;
    kActiveLayout_4 = 0x402F000000000000;
    kActiveLayout_6 = 0x4043800000000000;
    kActiveLayout_7 = 0x4020000000000000;
    kActiveLayout_8 = 0x402F000000000000;
    kActiveLayout_10 = 0x4018000000000000;
    kActiveLayout_12 = 0x4018000000000000;
  }
}

- (REUpNextLargeWithDetailTextCell)initWithFrame:(CGRect)a3
{
  REUpNextLargeWithDetailTextCell *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  UILayoutGuide *v10;
  UILayoutGuide *contentLayoutGuide;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  CLKUIColoringLabel *headerLabel;
  CLKUIColoringLabel *v19;
  void *v20;
  uint64_t v21;
  CLKUIColoringLabel *bodyLabel;
  CLKUIColoringLabel *v23;
  void *v24;
  double v25;
  double v26;
  REUpNextImageView *v27;
  REUpNextImageView *bodyImage;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  CLKUIColoringLabel *detail1Label;
  CLKUIColoringLabel *v35;
  void *v36;
  double v37;
  double v38;
  uint64_t v39;
  CLKUIColoringLabel *detail2Label;
  CLKUIColoringLabel *v41;
  void *v42;
  double v43;
  double v44;
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
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  objc_super v115;
  _QWORD v116[20];

  v116[18] = *MEMORY[0x24BDAC8D0];
  v115.receiver = self;
  v115.super_class = (Class)REUpNextLargeWithDetailTextCell;
  v3 = -[REUpNextBaseCell initWithFrame:](&v115, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDB8748], "systemFontOfSize:", *(double *)&kActiveLayout_5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fontDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", 2);
    v113 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *MEMORY[0x24BDF7888];
    objc_msgSend(MEMORY[0x24BDB8748], "systemFontOfSize:weight:", *(double *)&kActiveLayout_6, *MEMORY[0x24BDF7888]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CLKFontWithAlternativePunctuation");
    v111 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDB8748], "fontWithDescriptor:size:", v113, *(double *)&kActiveLayout_0);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDB8748], "systemFontOfSize:weight:", *(double *)&kActiveLayout_4, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "CLKFontWithAlternativePunctuation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "CLKFontWithMonospacedNumbers");
    v114 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x24BDF6B78]);
    contentLayoutGuide = v3->_contentLayoutGuide;
    v3->_contentLayoutGuide = v10;

    v12 = objc_alloc(MEMORY[0x24BE16F30]);
    v13 = *MEMORY[0x24BDBF090];
    v14 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v15 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v16 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v17 = objc_msgSend(v12, "initWithFrame:options:", 4, *MEMORY[0x24BDBF090], v14, v15, v16);
    headerLabel = v3->_headerLabel;
    v3->_headerLabel = (CLKUIColoringLabel *)v17;

    -[CLKUIColoringLabel setNowProvider:](v3->_headerLabel, "setNowProvider:", &__block_literal_global_1);
    -[CLKUIColoringLabel setFont:](v3->_headerLabel, "setFont:", v112);
    -[CLKUIColoringLabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_headerLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CLKUIColoringLabel setLineBreakMode:](v3->_headerLabel, "setLineBreakMode:", 4);
    v19 = v3->_headerLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v19, "setTextColor:", v20);

    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BE16F30]), "initWithFrame:options:", 2, v13, v14, v15, v16);
    bodyLabel = v3->_bodyLabel;
    v3->_bodyLabel = (CLKUIColoringLabel *)v21;

    -[CLKUIColoringLabel setNowProvider:](v3->_bodyLabel, "setNowProvider:", &__block_literal_global_6);
    -[CLKUIColoringLabel setFont:](v3->_bodyLabel, "setFont:", v111);
    -[CLKUIColoringLabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_bodyLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CLKUIColoringLabel setLineBreakMode:](v3->_bodyLabel, "setLineBreakMode:", 4);
    v23 = v3->_bodyLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v23, "setTextColor:", v24);

    -[CLKUIColoringLabel setMinimumScaleFactor:](v3->_bodyLabel, "setMinimumScaleFactor:", 0.75);
    -[CLKUIColoringLabel setAdjustsFontSizeToFitWidth:](v3->_bodyLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[CLKUIColoringLabel setBaselineAdjustment:](v3->_bodyLabel, "setBaselineAdjustment:", 0);
    -[CLKUIColoringLabel setNumberOfLines:](v3->_bodyLabel, "setNumberOfLines:", 1);
    LODWORD(v25) = 1132068864;
    -[CLKUIColoringLabel setContentCompressionResistancePriority:forAxis:](v3->_bodyLabel, "setContentCompressionResistancePriority:forAxis:", 0, v25);
    LODWORD(v26) = 1148846080;
    -[CLKUIColoringLabel setContentHuggingPriority:forAxis:](v3->_bodyLabel, "setContentHuggingPriority:forAxis:", 0, v26);
    v27 = -[REUpNextImageView initWithFrame:]([REUpNextImageView alloc], "initWithFrame:", v13, v14, v15, v16);
    bodyImage = v3->_bodyImage;
    v3->_bodyImage = v27;

    LODWORD(v29) = 1148846080;
    -[REUpNextImageView setContentHuggingPriority:forAxis:](v3->_bodyImage, "setContentHuggingPriority:forAxis:", 0, v29);
    LODWORD(v30) = 1148846080;
    -[REUpNextImageView setContentHuggingPriority:forAxis:](v3->_bodyImage, "setContentHuggingPriority:forAxis:", 1, v30);
    LODWORD(v31) = 1148846080;
    -[REUpNextImageView setContentCompressionResistancePriority:forAxis:](v3->_bodyImage, "setContentCompressionResistancePriority:forAxis:", 0, v31);
    LODWORD(v32) = 1148846080;
    -[REUpNextImageView setContentCompressionResistancePriority:forAxis:](v3->_bodyImage, "setContentCompressionResistancePriority:forAxis:", 1, v32);
    -[REUpNextImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_bodyImage, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v33 = objc_msgSend(objc_alloc(MEMORY[0x24BE16F30]), "initWithFrame:options:", 4, v13, v14, v15, v16);
    detail1Label = v3->_detail1Label;
    v3->_detail1Label = (CLKUIColoringLabel *)v33;

    -[CLKUIColoringLabel setNowProvider:](v3->_detail1Label, "setNowProvider:", &__block_literal_global_8);
    -[CLKUIColoringLabel setFont:](v3->_detail1Label, "setFont:", v114);
    -[CLKUIColoringLabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_detail1Label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CLKUIColoringLabel setLineBreakMode:](v3->_detail1Label, "setLineBreakMode:", 4);
    -[CLKUIColoringLabel setTextAlignment:](v3->_detail1Label, "setTextAlignment:", 2);
    v35 = v3->_detail1Label;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v35, "setTextColor:", v36);

    LODWORD(v37) = 1148846080;
    -[CLKUIColoringLabel setContentCompressionResistancePriority:forAxis:](v3->_detail1Label, "setContentCompressionResistancePriority:forAxis:", 0, v37);
    LODWORD(v38) = 1132068864;
    -[CLKUIColoringLabel setContentHuggingPriority:forAxis:](v3->_detail1Label, "setContentHuggingPriority:forAxis:", 0, v38);
    v39 = objc_msgSend(objc_alloc(MEMORY[0x24BE16F30]), "initWithFrame:options:", 4, v13, v14, v15, v16);
    detail2Label = v3->_detail2Label;
    v3->_detail2Label = (CLKUIColoringLabel *)v39;

    -[CLKUIColoringLabel setNowProvider:](v3->_detail2Label, "setNowProvider:", &__block_literal_global_9);
    -[CLKUIColoringLabel setFont:](v3->_detail2Label, "setFont:", v114);
    v41 = v3->_detail2Label;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v41, "setTextColor:", v42);

    -[CLKUIColoringLabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_detail2Label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CLKUIColoringLabel setLineBreakMode:](v3->_detail2Label, "setLineBreakMode:", 4);
    -[CLKUIColoringLabel setTextAlignment:](v3->_detail2Label, "setTextAlignment:", 2);
    LODWORD(v43) = 1148846080;
    -[CLKUIColoringLabel setContentCompressionResistancePriority:forAxis:](v3->_detail2Label, "setContentCompressionResistancePriority:forAxis:", 0, v43);
    LODWORD(v44) = 1132068864;
    -[CLKUIColoringLabel setContentHuggingPriority:forAxis:](v3->_detail2Label, "setContentHuggingPriority:forAxis:", 0, v44);
    -[REUpNextLargeWithDetailTextCell contentView](v3, "contentView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addLayoutGuide:", v3->_contentLayoutGuide);

    -[REUpNextLargeWithDetailTextCell contentView](v3, "contentView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addSubview:", v3->_bodyImage);

    -[REUpNextLargeWithDetailTextCell contentView](v3, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addSubview:", v3->_headerLabel);

    -[REUpNextLargeWithDetailTextCell contentView](v3, "contentView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addSubview:", v3->_bodyLabel);

    -[REUpNextLargeWithDetailTextCell contentView](v3, "contentView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addSubview:", v3->_detail1Label);

    -[REUpNextLargeWithDetailTextCell contentView](v3, "contentView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addSubview:", v3->_detail2Label);

    -[UILayoutGuide topAnchor](v3->_contentLayoutGuide, "topAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextLargeWithDetailTextCell contentView](v3, "contentView");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "topAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "constraintEqualToAnchor:constant:", v108, 0.0);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v116[0] = v107;
    -[UILayoutGuide bottomAnchor](v3->_contentLayoutGuide, "bottomAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextLargeWithDetailTextCell contentView](v3, "contentView");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "bottomAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "constraintEqualToAnchor:constant:", v104, -0.0);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v116[1] = v103;
    -[UILayoutGuide leadingAnchor](v3->_contentLayoutGuide, "leadingAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextLargeWithDetailTextCell contentView](v3, "contentView");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "leadingAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "constraintEqualToAnchor:constant:", v100, *(double *)&kActiveLayout_10);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v116[2] = v99;
    -[UILayoutGuide trailingAnchor](v3->_contentLayoutGuide, "trailingAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextLargeWithDetailTextCell contentView](v3, "contentView");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "trailingAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "constraintEqualToAnchor:constant:", v96, -*(double *)&kActiveLayout_12);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v116[3] = v95;
    -[CLKUIColoringLabel firstBaselineAnchor](v3->_headerLabel, "firstBaselineAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](v3->_contentLayoutGuide, "topAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "constraintEqualToAnchor:constant:", v93, *(double *)&kActiveLayout_0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v116[4] = v92;
    -[CLKUIColoringLabel leadingAnchor](v3->_headerLabel, "leadingAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v3->_contentLayoutGuide, "leadingAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "constraintEqualToAnchor:", v90);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v116[5] = v89;
    -[CLKUIColoringLabel trailingAnchor](v3->_headerLabel, "trailingAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v3->_contentLayoutGuide, "trailingAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "constraintEqualToAnchor:", v87);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v116[6] = v86;
    -[CLKUIColoringLabel firstBaselineAnchor](v3->_bodyLabel, "firstBaselineAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel firstBaselineAnchor](v3->_headerLabel, "firstBaselineAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:constant:", v84, *(double *)&kActiveLayout_1);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v116[7] = v83;
    -[CLKUIColoringLabel lastBaselineAnchor](v3->_bodyLabel, "lastBaselineAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v3->_contentLayoutGuide, "bottomAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintEqualToAnchor:constant:", v81, -*(double *)&kActiveLayout_7);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v116[8] = v80;
    -[REUpNextImageView bottomAnchor](v3->_bodyImage, "bottomAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel firstBaselineAnchor](v3->_bodyLabel, "firstBaselineAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintEqualToAnchor:", v78);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v116[9] = v77;
    -[CLKUIColoringLabel firstBaselineAnchor](v3->_detail2Label, "firstBaselineAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v3->_contentLayoutGuide, "bottomAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToAnchor:constant:", v75, -*(double *)&kActiveLayout_7);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v116[10] = v74;
    -[CLKUIColoringLabel firstBaselineAnchor](v3->_detail1Label, "firstBaselineAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel firstBaselineAnchor](v3->_detail2Label, "firstBaselineAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:constant:", v71, -*(double *)&kActiveLayout_8);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v116[11] = v70;
    -[CLKUIColoringLabel leadingAnchor](v3->_detail2Label, "leadingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel leadingAnchor](v3->_detail1Label, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:", v68);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v116[12] = v67;
    -[CLKUIColoringLabel trailingAnchor](v3->_detail2Label, "trailingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v3->_contentLayoutGuide, "trailingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v65);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v116[13] = v64;
    -[CLKUIColoringLabel leadingAnchor](v3->_bodyLabel, "leadingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v3->_contentLayoutGuide, "leadingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v62);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v116[14] = v61;
    -[REUpNextImageView leadingAnchor](v3->_bodyImage, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel trailingAnchor](v3->_bodyLabel, "trailingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:constant:", v52, *(double *)&kActiveLayout_2);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v116[15] = v53;
    -[CLKUIColoringLabel leadingAnchor](v3->_detail1Label, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextImageView trailingAnchor](v3->_bodyImage, "trailingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:constant:", v55, *(double *)&kActiveLayout_3);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v116[16] = v56;
    -[CLKUIColoringLabel trailingAnchor](v3->_detail1Label, "trailingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v3->_contentLayoutGuide, "trailingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v116[17] = v59;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v116, 18);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v73);
  }
  return v3;
}

uint64_t __49__REUpNextLargeWithDetailTextCell_initWithFrame___block_invoke()
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "date");
}

uint64_t __49__REUpNextLargeWithDetailTextCell_initWithFrame___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "date");
}

uint64_t __49__REUpNextLargeWithDetailTextCell_initWithFrame___block_invoke_3()
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "date");
}

uint64_t __49__REUpNextLargeWithDetailTextCell_initWithFrame___block_invoke_4()
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "date");
}

- (void)_updateHeaderColor
{
  void *v3;
  _BOOL4 v4;
  CLKUIColoringLabel *v5;
  void *v6;
  CLKUIColoringLabel *headerLabel;
  id v8;

  -[REUpNextBaseCell content](self, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "tintColorAffectsHeader"))
  {

    goto LABEL_5;
  }
  v4 = -[REUpNextBaseCell shouldOverrideContentHeaderColor](self, "shouldOverrideContentHeaderColor");

  if (!v4)
  {
LABEL_5:
    headerLabel = self->_headerLabel;
    -[REUpNextBaseCell defaultTextColor](self, "defaultTextColor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](headerLabel, "setTextColor:");
    goto LABEL_6;
  }
  v5 = self->_headerLabel;
  -[REUpNextBaseCell content](self, "content");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](v5, "setTextColor:", v6);

LABEL_6:
}

- (void)defaultTextColorDidChange
{
  CLKUIColoringLabel *bodyLabel;
  void *v4;
  CLKUIColoringLabel *detail1Label;
  void *v6;
  CLKUIColoringLabel *detail2Label;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)REUpNextLargeWithDetailTextCell;
  -[REUpNextBaseCell defaultTextColorDidChange](&v9, sel_defaultTextColorDidChange);
  -[REUpNextLargeWithDetailTextCell _updateHeaderColor](self, "_updateHeaderColor");
  bodyLabel = self->_bodyLabel;
  -[REUpNextBaseCell defaultTextColor](self, "defaultTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](bodyLabel, "setTextColor:", v4);

  detail1Label = self->_detail1Label;
  -[REUpNextBaseCell defaultTextColor](self, "defaultTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](detail1Label, "setTextColor:", v6);

  detail2Label = self->_detail2Label;
  -[REUpNextBaseCell defaultTextColor](self, "defaultTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](detail2Label, "setTextColor:", v8);

}

- (void)configureWithContent:(id)a3
{
  id v4;
  REUpNextImageView *bodyImage;
  void *v6;
  void *v7;
  REUpNextImageView *v8;
  void *v9;
  void *v10;
  REUpNextImageView *v11;
  CLKUIColoringLabel *headerLabel;
  void *v13;
  CLKUIColoringLabel *bodyLabel;
  void *v15;
  CLKUIColoringLabel *detail1Label;
  void *v17;
  CLKUIColoringLabel *detail2Label;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)REUpNextLargeWithDetailTextCell;
  -[REUpNextBaseCell configureWithContent:](&v24, sel_configureWithContent_, v4);
  bodyImage = self->_bodyImage;
  objc_msgSend(v4, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REUpNextImageView setFallbackTintColor:](bodyImage, "setFallbackTintColor:", v6);

  objc_msgSend(v4, "bodyImageProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = self->_bodyImage;
    objc_msgSend(v4, "bodyImageProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextImageView setImageProvider:](v8, "setImageProvider:", v9);
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(v4, "overrideBodyImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = self->_bodyImage;
    objc_msgSend(v4, "overrideBodyImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextImageView setOverrideImage:](v11, "setOverrideImage:", v9);
    goto LABEL_5;
  }
LABEL_6:
  -[REUpNextLargeWithDetailTextCell _updateHeaderColor](self, "_updateHeaderColor");
  headerLabel = self->_headerLabel;
  objc_msgSend(v4, "headerTextProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](headerLabel, "setTextProvider:", v13);

  bodyLabel = self->_bodyLabel;
  objc_msgSend(v4, "description1TextProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](bodyLabel, "setTextProvider:", v15);

  detail1Label = self->_detail1Label;
  objc_msgSend(v4, "description2TextProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](detail1Label, "setTextProvider:", v17);

  detail2Label = self->_detail2Label;
  objc_msgSend(v4, "description3TextProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](detail2Label, "setTextProvider:", v19);

  objc_msgSend(v4, "headerTextProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPaused:", 0);

  objc_msgSend(v4, "description1TextProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPaused:", 0);

  objc_msgSend(v4, "description2TextProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPaused:", 0);

  objc_msgSend(v4, "description3TextProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPaused:", 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail2Label, 0);
  objc_storeStrong((id *)&self->_detail1Label, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_bodyImage, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
}

@end
