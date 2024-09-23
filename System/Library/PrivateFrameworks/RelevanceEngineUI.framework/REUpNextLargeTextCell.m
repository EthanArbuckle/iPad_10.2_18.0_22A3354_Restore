@implementation REUpNextLargeTextCell

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    kActiveLayout_0_2 = 0x4033800000000000;
    kActiveLayout_1_2 = 0x4043800000000000;
    kActiveLayout_2_2 = 0x4012000000000000;
    kActiveLayout_3_1 = 0x4030800000000000;
    kActiveLayout_4_1 = 0x4043800000000000;
    kActiveLayout_5_1 = 0x4020000000000000;
    kActiveLayout_8_0 = 0x4018000000000000;
    kActiveLayout_10_0 = 0x4018000000000000;
  }
}

- (REUpNextLargeTextCell)initWithFrame:(CGRect)a3
{
  REUpNextLargeTextCell *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  CLKFont *standardBodyFont;
  uint64_t v9;
  CLKFont *monospaceBodyFont;
  void *v11;
  UILayoutGuide *v12;
  UILayoutGuide *contentLayoutGuide;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  CLKUIColoringLabel *headerLabel;
  CLKUIColoringLabel *v21;
  void *v22;
  uint64_t v23;
  CLKUIColoringLabel *bodyLabel;
  CLKUIColoringLabel *v25;
  void *v26;
  REUpNextImageView *v27;
  REUpNextImageView *headerImage;
  double v29;
  double v30;
  double v31;
  double v32;
  REUpNextImageView *v33;
  REUpNextImageView *bodyImage;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
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
  uint64_t v61;
  NSArray *headerWithNoImageConstraints;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  NSArray *headerWithLeftImageConstraints;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  NSArray *headerWithRightImageConstraints;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  NSArray *bodyWithNoImageConstraints;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  NSArray *bodyWithLeftImageConstraints;
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
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  objc_super v130;
  _QWORD v131[3];
  _QWORD v132[2];
  _QWORD v133[3];
  _QWORD v134[3];
  _QWORD v135[2];
  _QWORD v136[11];

  v136[9] = *MEMORY[0x24BDAC8D0];
  v130.receiver = self;
  v130.super_class = (Class)REUpNextLargeTextCell;
  v3 = -[REUpNextBaseCell initWithFrame:](&v130, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDB8748], "systemFontOfSize:", *(double *)&kActiveLayout_3_1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fontDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", 2);
    v129 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDB8748], "systemFontOfSize:weight:", *(double *)&kActiveLayout_4_1, *MEMORY[0x24BDF7888]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "CLKFontWithAlternativePunctuation");
    v7 = objc_claimAutoreleasedReturnValue();
    standardBodyFont = v3->_standardBodyFont;
    v3->_standardBodyFont = (CLKFont *)v7;

    -[CLKFont CLKFontWithMonospacedNumbers](v3->_standardBodyFont, "CLKFontWithMonospacedNumbers");
    v9 = objc_claimAutoreleasedReturnValue();
    monospaceBodyFont = v3->_monospaceBodyFont;
    v3->_monospaceBodyFont = (CLKFont *)v9;

    objc_msgSend(MEMORY[0x24BDB8748], "fontWithDescriptor:size:", v129, *(double *)&kActiveLayout_3_1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x24BDF6B78]);
    contentLayoutGuide = v3->_contentLayoutGuide;
    v3->_contentLayoutGuide = v12;

    v14 = objc_alloc(MEMORY[0x24BE16F30]);
    v15 = *MEMORY[0x24BDBF090];
    v16 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v17 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v18 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v19 = objc_msgSend(v14, "initWithFrame:options:", 4, *MEMORY[0x24BDBF090], v16, v17, v18);
    headerLabel = v3->_headerLabel;
    v3->_headerLabel = (CLKUIColoringLabel *)v19;

    -[CLKUIColoringLabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_headerLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CLKUIColoringLabel setLineBreakMode:](v3->_headerLabel, "setLineBreakMode:", 4);
    -[CLKUIColoringLabel setNowProvider:](v3->_headerLabel, "setNowProvider:", &__block_literal_global_3);
    v128 = v11;
    -[CLKUIColoringLabel setFont:](v3->_headerLabel, "setFont:", v11);
    v21 = v3->_headerLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v21, "setTextColor:", v22);

    v23 = objc_msgSend(objc_alloc(MEMORY[0x24BE16F30]), "initWithFrame:options:", 6, v15, v16, v17, v18);
    bodyLabel = v3->_bodyLabel;
    v3->_bodyLabel = (CLKUIColoringLabel *)v23;

    -[CLKUIColoringLabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_bodyLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CLKUIColoringLabel setLineBreakMode:](v3->_bodyLabel, "setLineBreakMode:", 4);
    -[CLKUIColoringLabel setNowProvider:](v3->_bodyLabel, "setNowProvider:", &__block_literal_global_6_0);
    -[CLKUIColoringLabel setFont:](v3->_bodyLabel, "setFont:", v3->_standardBodyFont);
    v25 = v3->_bodyLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v25, "setTextColor:", v26);

    -[CLKUIColoringLabel setMinimumScaleFactor:](v3->_bodyLabel, "setMinimumScaleFactor:", 0.75);
    -[CLKUIColoringLabel setAdjustsFontSizeToFitWidth:](v3->_bodyLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[CLKUIColoringLabel setBaselineAdjustment:](v3->_bodyLabel, "setBaselineAdjustment:", 0);
    -[CLKUIColoringLabel setNumberOfLines:](v3->_bodyLabel, "setNumberOfLines:", 1);
    v27 = -[REUpNextImageView initWithFrame:]([REUpNextImageView alloc], "initWithFrame:", v15, v16, v17, v18);
    headerImage = v3->_headerImage;
    v3->_headerImage = v27;

    LODWORD(v29) = 1148846080;
    -[REUpNextImageView setContentHuggingPriority:forAxis:](v3->_headerImage, "setContentHuggingPriority:forAxis:", 0, v29);
    LODWORD(v30) = 1148846080;
    -[REUpNextImageView setContentHuggingPriority:forAxis:](v3->_headerImage, "setContentHuggingPriority:forAxis:", 1, v30);
    LODWORD(v31) = 1148846080;
    -[REUpNextImageView setContentCompressionResistancePriority:forAxis:](v3->_headerImage, "setContentCompressionResistancePriority:forAxis:", 0, v31);
    LODWORD(v32) = 1148846080;
    -[REUpNextImageView setContentCompressionResistancePriority:forAxis:](v3->_headerImage, "setContentCompressionResistancePriority:forAxis:", 1, v32);
    -[REUpNextImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_headerImage, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v33 = -[REUpNextImageView initWithFrame:]([REUpNextImageView alloc], "initWithFrame:", v15, v16, v17, v18);
    bodyImage = v3->_bodyImage;
    v3->_bodyImage = v33;

    LODWORD(v35) = 1148846080;
    -[REUpNextImageView setContentHuggingPriority:forAxis:](v3->_bodyImage, "setContentHuggingPriority:forAxis:", 0, v35);
    LODWORD(v36) = 1148846080;
    -[REUpNextImageView setContentHuggingPriority:forAxis:](v3->_bodyImage, "setContentHuggingPriority:forAxis:", 1, v36);
    LODWORD(v37) = 1148846080;
    -[REUpNextImageView setContentCompressionResistancePriority:forAxis:](v3->_bodyImage, "setContentCompressionResistancePriority:forAxis:", 0, v37);
    LODWORD(v38) = 1148846080;
    -[REUpNextImageView setContentCompressionResistancePriority:forAxis:](v3->_bodyImage, "setContentCompressionResistancePriority:forAxis:", 1, v38);
    -[REUpNextImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_bodyImage, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[REUpNextLargeTextCell contentView](v3, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addLayoutGuide:", v3->_contentLayoutGuide);

    -[REUpNextLargeTextCell contentView](v3, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addSubview:", v3->_headerImage);

    -[REUpNextLargeTextCell contentView](v3, "contentView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addSubview:", v3->_headerLabel);

    -[REUpNextLargeTextCell contentView](v3, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addSubview:", v3->_bodyLabel);

    -[REUpNextLargeTextCell contentView](v3, "contentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addSubview:", v3->_bodyImage);

    objc_msgSend(v11, "capHeight");
    UIRoundToViewScale();
    v45 = v44;
    -[UILayoutGuide topAnchor](v3->_contentLayoutGuide, "topAnchor");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextLargeTextCell contentView](v3, "contentView");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "topAnchor");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "constraintEqualToAnchor:constant:", v124, 0.0);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v136[0] = v123;
    -[UILayoutGuide bottomAnchor](v3->_contentLayoutGuide, "bottomAnchor");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextLargeTextCell contentView](v3, "contentView");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "bottomAnchor");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "constraintEqualToAnchor:constant:", v120, -0.0);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v136[1] = v119;
    -[UILayoutGuide leadingAnchor](v3->_contentLayoutGuide, "leadingAnchor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextLargeTextCell contentView](v3, "contentView");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "leadingAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "constraintEqualToAnchor:constant:", v116, *(double *)&kActiveLayout_8_0);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v136[2] = v115;
    -[UILayoutGuide trailingAnchor](v3->_contentLayoutGuide, "trailingAnchor");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextLargeTextCell contentView](v3, "contentView");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "trailingAnchor");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "constraintEqualToAnchor:constant:", v112, -*(double *)&kActiveLayout_10_0);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v136[3] = v111;
    -[REUpNextImageView centerYAnchor](v3->_headerImage, "centerYAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel firstBaselineAnchor](v3->_headerLabel, "firstBaselineAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "constraintEqualToAnchor:constant:", v109, -v45);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v136[4] = v108;
    -[CLKUIColoringLabel firstBaselineAnchor](v3->_headerLabel, "firstBaselineAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](v3->_contentLayoutGuide, "topAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "constraintEqualToAnchor:constant:", v106, *(double *)&kActiveLayout_0_2);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v136[5] = v105;
    -[REUpNextImageView bottomAnchor](v3->_bodyImage, "bottomAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel firstBaselineAnchor](v3->_bodyLabel, "firstBaselineAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v136[6] = v48;
    -[CLKUIColoringLabel firstBaselineAnchor](v3->_bodyLabel, "firstBaselineAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel firstBaselineAnchor](v3->_headerLabel, "firstBaselineAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:constant:", v50, *(double *)&kActiveLayout_1_2);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v136[7] = v51;
    -[CLKUIColoringLabel lastBaselineAnchor](v3->_bodyLabel, "lastBaselineAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v3->_contentLayoutGuide, "bottomAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:constant:", v53, -*(double *)&kActiveLayout_5_1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v136[8] = v54;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v136, 9);
    v127 = (void *)objc_claimAutoreleasedReturnValue();

    -[CLKUIColoringLabel leadingAnchor](v3->_headerLabel, "leadingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v3->_contentLayoutGuide, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v135[0] = v57;
    -[CLKUIColoringLabel trailingAnchor](v3->_headerLabel, "trailingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v3->_contentLayoutGuide, "trailingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v135[1] = v60;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v135, 2);
    v61 = objc_claimAutoreleasedReturnValue();
    headerWithNoImageConstraints = v3->_headerWithNoImageConstraints;
    v3->_headerWithNoImageConstraints = (NSArray *)v61;

    -[REUpNextImageView leadingAnchor](v3->_headerImage, "leadingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v3->_contentLayoutGuide, "leadingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v134[0] = v65;
    -[CLKUIColoringLabel leadingAnchor](v3->_headerLabel, "leadingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextImageView trailingAnchor](v3->_headerImage, "trailingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:constant:", v67, *(double *)&kActiveLayout_2_2);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v134[1] = v68;
    -[CLKUIColoringLabel trailingAnchor](v3->_headerLabel, "trailingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v3->_contentLayoutGuide, "trailingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:", v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v134[2] = v71;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v134, 3);
    v72 = objc_claimAutoreleasedReturnValue();
    headerWithLeftImageConstraints = v3->_headerWithLeftImageConstraints;
    v3->_headerWithLeftImageConstraints = (NSArray *)v72;

    -[CLKUIColoringLabel leadingAnchor](v3->_headerLabel, "leadingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v3->_contentLayoutGuide, "leadingAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v133[0] = v76;
    -[CLKUIColoringLabel trailingAnchor](v3->_headerLabel, "trailingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextImageView leadingAnchor](v3->_headerImage, "leadingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:constant:", v78, -*(double *)&kActiveLayout_2_2);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v133[1] = v79;
    -[REUpNextImageView trailingAnchor](v3->_headerImage, "trailingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v3->_contentLayoutGuide, "trailingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:", v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v133[2] = v82;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v133, 3);
    v83 = objc_claimAutoreleasedReturnValue();
    headerWithRightImageConstraints = v3->_headerWithRightImageConstraints;
    v3->_headerWithRightImageConstraints = (NSArray *)v83;

    -[CLKUIColoringLabel leadingAnchor](v3->_bodyLabel, "leadingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v3->_contentLayoutGuide, "leadingAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:", v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v132[0] = v87;
    -[CLKUIColoringLabel trailingAnchor](v3->_bodyLabel, "trailingAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v3->_contentLayoutGuide, "trailingAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "constraintEqualToAnchor:", v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v132[1] = v90;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v132, 2);
    v91 = objc_claimAutoreleasedReturnValue();
    bodyWithNoImageConstraints = v3->_bodyWithNoImageConstraints;
    v3->_bodyWithNoImageConstraints = (NSArray *)v91;

    -[REUpNextImageView leadingAnchor](v3->_bodyImage, "leadingAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v3->_contentLayoutGuide, "leadingAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:", v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v131[0] = v95;
    -[CLKUIColoringLabel leadingAnchor](v3->_bodyLabel, "leadingAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextImageView trailingAnchor](v3->_bodyImage, "trailingAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "constraintEqualToAnchor:constant:", v97, 0.0);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v131[1] = v98;
    -[CLKUIColoringLabel trailingAnchor](v3->_bodyLabel, "trailingAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v3->_contentLayoutGuide, "trailingAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "constraintEqualToAnchor:", v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v131[2] = v101;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v131, 3);
    v102 = objc_claimAutoreleasedReturnValue();
    bodyWithLeftImageConstraints = v3->_bodyWithLeftImageConstraints;
    v3->_bodyWithLeftImageConstraints = (NSArray *)v102;

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v3->_bodyWithNoImageConstraints);
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v3->_headerWithNoImageConstraints);
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v127);

  }
  return v3;
}

uint64_t __39__REUpNextLargeTextCell_initWithFrame___block_invoke()
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "date");
}

uint64_t __39__REUpNextLargeTextCell_initWithFrame___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "date");
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  REUpNextImageView *headerImage;
  int v11;
  int *v12;
  int *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  _BOOL8 v17;
  int *v18;
  int *v19;
  objc_super v20;

  -[REUpNextBaseCell content](self, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerImageProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "overrideHeaderImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  v7 = objc_msgSend(v3, "headerImageEdge");
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  if (self->_showingHeaderImage != v5 || v7 != self->_currentImageEdge)
  {
    self->_currentImageEdge = v7;
    self->_showingHeaderImage = v5;
    headerImage = self->_headerImage;
    if (v5)
    {
      -[REUpNextImageView setHidden:](headerImage, "setHidden:", 0);
      objc_msgSend(v9, "addObjectsFromArray:", self->_headerWithNoImageConstraints);
      v11 = objc_msgSend(v3, "headerImageEdge");
      if (v11 == 2)
        v12 = &OBJC_IVAR___REUpNextLargeTextCell__headerWithLeftImageConstraints;
      else
        v12 = &OBJC_IVAR___REUpNextLargeTextCell__headerWithRightImageConstraints;
      if (v11 == 2)
        v13 = &OBJC_IVAR___REUpNextLargeTextCell__headerWithRightImageConstraints;
      else
        v13 = &OBJC_IVAR___REUpNextLargeTextCell__headerWithLeftImageConstraints;
    }
    else
    {
      -[REUpNextImageView setHidden:](headerImage, "setHidden:", 1);
      objc_msgSend(v9, "addObjectsFromArray:", self->_headerWithLeftImageConstraints);
      v13 = &OBJC_IVAR___REUpNextLargeTextCell__headerWithNoImageConstraints;
      v12 = &OBJC_IVAR___REUpNextLargeTextCell__headerWithRightImageConstraints;
    }
    objc_msgSend(v9, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v12));
    objc_msgSend(v8, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v13));
  }
  objc_msgSend(v3, "bodyImageProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = 1;
  }
  else
  {
    objc_msgSend(v3, "overrideBodyImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v16 != 0;

  }
  if (self->_showingBodyImage != v15)
  {
    self->_showingBodyImage = v15;
    v17 = !v15;
    if (v15)
      v18 = &OBJC_IVAR___REUpNextLargeTextCell__bodyWithNoImageConstraints;
    else
      v18 = &OBJC_IVAR___REUpNextLargeTextCell__bodyWithLeftImageConstraints;
    if (v15)
      v19 = &OBJC_IVAR___REUpNextLargeTextCell__bodyWithLeftImageConstraints;
    else
      v19 = &OBJC_IVAR___REUpNextLargeTextCell__bodyWithNoImageConstraints;
    -[REUpNextImageView setHidden:](self->_bodyImage, "setHidden:", v17);
    objc_msgSend(v9, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v18));
    objc_msgSend(v8, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v19));
  }
  objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", v9);
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v8);
  v20.receiver = self;
  v20.super_class = (Class)REUpNextLargeTextCell;
  -[REUpNextLargeTextCell updateConstraints](&v20, sel_updateConstraints);

}

- (void)_updateHeaderColor
{
  CLKUIColoringLabel *headerLabel;
  uint64_t v4;
  void *v5;
  id v6;

  -[REUpNextBaseCell content](self, "content");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "tintColorAffectsHeader")
    && !-[REUpNextBaseCell shouldOverrideContentHeaderColor](self, "shouldOverrideContentHeaderColor"))
  {
    headerLabel = self->_headerLabel;
    objc_msgSend(v6, "tintColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    headerLabel = self->_headerLabel;
    -[REUpNextBaseCell defaultTextColor](self, "defaultTextColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  -[CLKUIColoringLabel setTextColor:](headerLabel, "setTextColor:", v4);

}

- (void)defaultTextColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)REUpNextLargeTextCell;
  -[REUpNextBaseCell defaultTextColorDidChange](&v4, sel_defaultTextColorDidChange);
  -[REUpNextLargeTextCell _updateHeaderColor](self, "_updateHeaderColor");
  -[REUpNextBaseCell defaultTextColor](self, "defaultTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](self->_bodyLabel, "setTextColor:", v3);

}

- (void)configureWithContent:(id)a3
{
  id v4;
  int v5;
  int *v6;
  REUpNextImageView *headerImage;
  void *v8;
  void *v9;
  REUpNextImageView *v10;
  void *v11;
  void *v12;
  REUpNextImageView *v13;
  REUpNextImageView *bodyImage;
  void *v15;
  void *v16;
  REUpNextImageView *v17;
  void *v18;
  void *v19;
  REUpNextImageView *v20;
  CLKUIColoringLabel *headerLabel;
  void *v22;
  void *v23;
  CLKUIColoringLabel *bodyLabel;
  CLKUIColoringLabel *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)REUpNextLargeTextCell;
  -[REUpNextBaseCell configureWithContent:](&v29, sel_configureWithContent_, v4);
  v5 = objc_msgSend(v4, "useMonospaceFont");
  v6 = &OBJC_IVAR___REUpNextLargeTextCell__standardBodyFont;
  if (v5)
    v6 = &OBJC_IVAR___REUpNextLargeTextCell__monospaceBodyFont;
  -[CLKUIColoringLabel setFont:](self->_bodyLabel, "setFont:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v6));
  headerImage = self->_headerImage;
  objc_msgSend(v4, "tintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REUpNextImageView setFallbackTintColor:](headerImage, "setFallbackTintColor:", v8);

  objc_msgSend(v4, "headerImageProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = self->_headerImage;
    objc_msgSend(v4, "headerImageProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextImageView setImageProvider:](v10, "setImageProvider:", v11);
  }
  else
  {
    objc_msgSend(v4, "overrideHeaderImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_8;
    v13 = self->_headerImage;
    objc_msgSend(v4, "overrideHeaderImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextImageView setOverrideImage:](v13, "setOverrideImage:", v11);
  }

LABEL_8:
  bodyImage = self->_bodyImage;
  objc_msgSend(v4, "tintColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[REUpNextImageView setFallbackTintColor:](bodyImage, "setFallbackTintColor:", v15);

  objc_msgSend(v4, "bodyImageProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = self->_bodyImage;
    objc_msgSend(v4, "bodyImageProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextImageView setImageProvider:](v17, "setImageProvider:", v18);
  }
  else
  {
    objc_msgSend(v4, "overrideBodyImage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      goto LABEL_13;
    v20 = self->_bodyImage;
    objc_msgSend(v4, "overrideBodyImage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextImageView setOverrideImage:](v20, "setOverrideImage:", v18);
  }

LABEL_13:
  -[REUpNextLargeTextCell _updateHeaderColor](self, "_updateHeaderColor");
  headerLabel = self->_headerLabel;
  objc_msgSend(v4, "headerTextProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](headerLabel, "setTextProvider:", v22);

  objc_msgSend(v4, "overrideBodyString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  bodyLabel = self->_bodyLabel;
  if (v23)
  {
    -[CLKUIColoringLabel setTextProvider:](self->_bodyLabel, "setTextProvider:", 0);
    v25 = self->_bodyLabel;
    objc_msgSend(v4, "overrideBodyString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setText:](v25, "setText:", v26);
  }
  else
  {
    objc_msgSend(v4, "description1TextProvider");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextProvider:](bodyLabel, "setTextProvider:", v26);
  }

  objc_msgSend(v4, "headerTextProvider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setPaused:", 0);

  objc_msgSend(v4, "description1TextProvider");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setPaused:", 0);

  -[REUpNextLargeTextCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyWithNoImageConstraints, 0);
  objc_storeStrong((id *)&self->_bodyWithLeftImageConstraints, 0);
  objc_storeStrong((id *)&self->_headerWithNoImageConstraints, 0);
  objc_storeStrong((id *)&self->_headerWithRightImageConstraints, 0);
  objc_storeStrong((id *)&self->_headerWithLeftImageConstraints, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_bodyImage, 0);
  objc_storeStrong((id *)&self->_headerImage, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_monospaceBodyFont, 0);
  objc_storeStrong((id *)&self->_standardBodyFont, 0);
}

@end
