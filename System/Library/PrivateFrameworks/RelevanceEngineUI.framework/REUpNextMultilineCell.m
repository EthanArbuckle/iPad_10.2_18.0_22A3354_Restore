@implementation REUpNextMultilineCell

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    kActiveLayout_0_4 = 0x4012000000000000;
    kActiveLayout_1_4 = 0x4033800000000000;
    kActiveLayout_2_4 = 0x4033800000000000;
    kActiveLayout_3_2 = 0x4033800000000000;
    kActiveLayout_4_2 = 0x4010000000000000;
    kActiveLayout_5_2 = 0x4030800000000000;
    kActiveLayout_6_1 = 0x4020000000000000;
    kActiveLayout_7_1 = 0x400C000000000000;
    kActiveLayout_8_1 = 0x3FE0000000000000;
    kActiveLayout_10_1 = 0x4040000000000000;
    kActiveLayout_11_0 = 0x3FF0000000000000;
    kActiveLayout_13 = 0x4018000000000000;
    kActiveLayout_15 = 0x4018000000000000;
  }
}

- (REUpNextMultilineCell)initWithFrame:(CGRect)a3
{
  REUpNextMultilineCell *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CLKFont *standardFont;
  uint64_t v10;
  CLKFont *italicFont;
  uint64_t v12;
  CLKFont *boldFont;
  uint64_t v14;
  CLKUIColoringLabel *headerLabel;
  CLKUIColoringLabel *v16;
  void *v17;
  uint64_t v18;
  CLKUIColoringLabel *descriptionLine1Label;
  CLKUIColoringLabel *v20;
  void *v21;
  double v22;
  uint64_t v23;
  CLKUIColoringLabel *descriptionLine2Label;
  CLKUIColoringLabel *v25;
  void *v26;
  REUpNextImageView *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  REUpNextImageView *headerImage;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  REUpNextImageView *v41;
  REUpNextImageView *descriptionImageView;
  double v43;
  double v44;
  UILayoutGuide *v45;
  UILayoutGuide *contentLayoutGuide;
  UILayoutGuide *v47;
  UILayoutGuide *descriptionTextLayoutGuide;
  UILayoutGuide *v49;
  UILayoutGuide *bodyImageSizingLayoutGuide;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  NSArray *withoutHeaderConstraints;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  NSArray *withHeaderConstraints;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  NSArray *headerWithNoImageConstraints;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  NSArray *headerWithLeftImageConstraints;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  NSArray *headerWithRightImageConstraints;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  uint64_t v126;
  NSArray *withDescription2Constraints;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  uint64_t v134;
  NSArray *withoutDescription2Constraints;
  void *v136;
  void *v137;
  void *v138;
  uint64_t v139;
  NSArray *withoutDescriptionAccessoryConstraints;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  uint64_t v149;
  NSArray *withDescriptionImageViewConstraints;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  uint64_t v159;
  NSArray *withStretchableDescriptionImageViewConstraints;
  void *v161;
  void *v162;
  void *v163;
  uint64_t v164;
  NSArray *withoutDescriptionImageViewConstraints;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  id v208;
  void *v209;
  void *v210;
  void *v211;
  objc_super v212;
  void *v213;
  _QWORD v214[3];
  _QWORD v215[3];
  void *v216;
  _QWORD v217[2];
  _QWORD v218[3];
  _QWORD v219[3];
  _QWORD v220[3];
  _QWORD v221[2];
  _QWORD v222[3];
  _QWORD v223[2];
  _QWORD v224[16];

  v224[14] = *MEMORY[0x24BDAC8D0];
  v212.receiver = self;
  v212.super_class = (Class)REUpNextMultilineCell;
  v3 = -[REUpNextBaseCell initWithFrame:](&v212, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDB8748], "systemFontOfSize:", *(double *)&kActiveLayout_5_2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fontDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", 1);
    v210 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDB8748], "systemFontOfSize:", *(double *)&kActiveLayout_5_2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fontDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fontDescriptorWithSymbolicTraits:", 2);
    v209 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDB8748], "systemFontOfSize:weight:", *(double *)&kActiveLayout_5_2, *MEMORY[0x24BDF7880]);
    v8 = objc_claimAutoreleasedReturnValue();
    standardFont = v3->_standardFont;
    v3->_standardFont = (CLKFont *)v8;

    objc_msgSend(MEMORY[0x24BDB8748], "fontWithDescriptor:size:", v210, *(double *)&kActiveLayout_5_2);
    v10 = objc_claimAutoreleasedReturnValue();
    italicFont = v3->_italicFont;
    v3->_italicFont = (CLKFont *)v10;

    objc_msgSend(MEMORY[0x24BDB8748], "fontWithDescriptor:size:", v209, *(double *)&kActiveLayout_5_2);
    v12 = objc_claimAutoreleasedReturnValue();
    boldFont = v3->_boldFont;
    v3->_boldFont = (CLKFont *)v12;

    __39__REUpNextMultilineCell_initWithFrame___block_invoke();
    v14 = objc_claimAutoreleasedReturnValue();
    headerLabel = v3->_headerLabel;
    v3->_headerLabel = (CLKUIColoringLabel *)v14;

    -[CLKUIColoringLabel setFont:](v3->_headerLabel, "setFont:", v3->_boldFont);
    v16 = v3->_headerLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v16, "setTextColor:", v17);

    __39__REUpNextMultilineCell_initWithFrame___block_invoke();
    v18 = objc_claimAutoreleasedReturnValue();
    descriptionLine1Label = v3->_descriptionLine1Label;
    v3->_descriptionLine1Label = (CLKUIColoringLabel *)v18;

    v20 = v3->_descriptionLine1Label;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v20, "setTextColor:", v21);

    -[CLKUIColoringLabel setFont:](v3->_descriptionLine1Label, "setFont:", v3->_standardFont);
    v208 = objc_alloc_init(MEMORY[0x24BDF6748]);
    objc_msgSend(v208, "setLineBreakMode:", 4);
    -[CLKUIColoringLabel setParagraphStyle:](v3->_descriptionLine1Label, "setParagraphStyle:", v208);
    LODWORD(v22) = 1148846080;
    -[CLKUIColoringLabel setContentHuggingPriority:forAxis:](v3->_descriptionLine1Label, "setContentHuggingPriority:forAxis:", 1, v22);
    __39__REUpNextMultilineCell_initWithFrame___block_invoke();
    v23 = objc_claimAutoreleasedReturnValue();
    descriptionLine2Label = v3->_descriptionLine2Label;
    v3->_descriptionLine2Label = (CLKUIColoringLabel *)v23;

    v25 = v3->_descriptionLine2Label;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v25, "setTextColor:", v26);

    -[CLKUIColoringLabel setFont:](v3->_descriptionLine2Label, "setFont:", v3->_italicFont);
    -[CLKUIColoringLabel setNumberOfLines:](v3->_descriptionLine2Label, "setNumberOfLines:", 1);
    v27 = [REUpNextImageView alloc];
    v28 = *MEMORY[0x24BDBF090];
    v29 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v30 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v31 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v32 = -[REUpNextImageView initWithFrame:](v27, "initWithFrame:", *MEMORY[0x24BDBF090], v29, v30, v31);
    headerImage = v3->_headerImage;
    v3->_headerImage = (REUpNextImageView *)v32;

    LODWORD(v34) = 1148846080;
    -[REUpNextImageView setContentHuggingPriority:forAxis:](v3->_headerImage, "setContentHuggingPriority:forAxis:", 0, v34);
    LODWORD(v35) = 1148846080;
    -[REUpNextImageView setContentHuggingPriority:forAxis:](v3->_headerImage, "setContentHuggingPriority:forAxis:", 1, v35);
    LODWORD(v36) = 1148846080;
    -[REUpNextImageView setContentCompressionResistancePriority:forAxis:](v3->_headerImage, "setContentCompressionResistancePriority:forAxis:", 0, v36);
    LODWORD(v37) = 1148846080;
    -[REUpNextImageView setContentCompressionResistancePriority:forAxis:](v3->_headerImage, "setContentCompressionResistancePriority:forAxis:", 1, v37);
    LODWORD(v38) = 1148846080;
    -[CLKUIColoringLabel setContentCompressionResistancePriority:forAxis:](v3->_descriptionLine1Label, "setContentCompressionResistancePriority:forAxis:", 1, v38);
    LODWORD(v39) = 1148829696;
    -[CLKUIColoringLabel setContentCompressionResistancePriority:forAxis:](v3->_headerLabel, "setContentCompressionResistancePriority:forAxis:", 1, v39);
    LODWORD(v40) = 1148846080;
    -[CLKUIColoringLabel setContentHuggingPriority:forAxis:](v3->_headerLabel, "setContentHuggingPriority:forAxis:", 1, v40);
    -[REUpNextImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_headerImage, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v41 = -[REUpNextImageView initWithFrame:]([REUpNextImageView alloc], "initWithFrame:", v28, v29, v30, v31);
    descriptionImageView = v3->_descriptionImageView;
    v3->_descriptionImageView = v41;

    -[REUpNextImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_descriptionImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[REUpNextImageView setContentMode:](v3->_descriptionImageView, "setContentMode:", 6);
    LODWORD(v43) = 1148846080;
    -[REUpNextImageView setContentHuggingPriority:forAxis:](v3->_descriptionImageView, "setContentHuggingPriority:forAxis:", 0, v43);
    LODWORD(v44) = 1148846080;
    -[REUpNextImageView setContentCompressionResistancePriority:forAxis:](v3->_descriptionImageView, "setContentCompressionResistancePriority:forAxis:", 0, v44);
    v45 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x24BDF6B78]);
    contentLayoutGuide = v3->_contentLayoutGuide;
    v3->_contentLayoutGuide = v45;

    v47 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x24BDF6B78]);
    descriptionTextLayoutGuide = v3->_descriptionTextLayoutGuide;
    v3->_descriptionTextLayoutGuide = v47;

    v49 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x24BDF6B78]);
    bodyImageSizingLayoutGuide = v3->_bodyImageSizingLayoutGuide;
    v3->_bodyImageSizingLayoutGuide = v49;

    -[REUpNextMultilineCell contentView](v3, "contentView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addLayoutGuide:", v3->_contentLayoutGuide);

    -[REUpNextMultilineCell contentView](v3, "contentView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addLayoutGuide:", v3->_descriptionTextLayoutGuide);

    -[REUpNextMultilineCell contentView](v3, "contentView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addLayoutGuide:", v3->_bodyImageSizingLayoutGuide);

    -[REUpNextMultilineCell contentView](v3, "contentView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addSubview:", v3->_headerImage);

    -[REUpNextMultilineCell contentView](v3, "contentView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "addSubview:", v3->_headerLabel);

    -[REUpNextMultilineCell contentView](v3, "contentView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "addSubview:", v3->_descriptionLine1Label);

    -[REUpNextMultilineCell contentView](v3, "contentView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "addSubview:", v3->_descriptionLine2Label);

    -[REUpNextMultilineCell contentView](v3, "contentView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "addSubview:", v3->_descriptionImageView);

    -[CLKFont capHeight](v3->_boldFont, "capHeight");
    UIRoundToViewScale();
    v60 = v59;
    -[UILayoutGuide topAnchor](v3->_contentLayoutGuide, "topAnchor");
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextMultilineCell contentView](v3, "contentView");
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v206, "topAnchor");
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v204, "constraintEqualToAnchor:constant:", v202, 0.0);
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    v224[0] = v200;
    -[UILayoutGuide bottomAnchor](v3->_contentLayoutGuide, "bottomAnchor");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextMultilineCell contentView](v3, "contentView");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v199, "bottomAnchor");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v198, "constraintEqualToAnchor:constant:", v197, -0.0);
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    v224[1] = v196;
    -[UILayoutGuide leadingAnchor](v3->_contentLayoutGuide, "leadingAnchor");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextMultilineCell contentView](v3, "contentView");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v195, "leadingAnchor");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v194, "constraintEqualToAnchor:constant:", v193, *(double *)&kActiveLayout_13);
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    v224[2] = v192;
    -[UILayoutGuide trailingAnchor](v3->_contentLayoutGuide, "trailingAnchor");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextMultilineCell contentView](v3, "contentView");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v191, "trailingAnchor");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "constraintEqualToAnchor:constant:", v189, -*(double *)&kActiveLayout_15);
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    v224[3] = v188;
    -[UILayoutGuide trailingAnchor](v3->_descriptionTextLayoutGuide, "trailingAnchor");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v3->_contentLayoutGuide, "trailingAnchor");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "constraintEqualToAnchor:", v186);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    v224[4] = v185;
    -[UILayoutGuide bottomAnchor](v3->_descriptionTextLayoutGuide, "bottomAnchor");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v3->_contentLayoutGuide, "bottomAnchor");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "constraintEqualToAnchor:constant:", v183, -*(double *)&kActiveLayout_6_1);
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    v224[5] = v182;
    -[REUpNextImageView centerYAnchor](v3->_headerImage, "centerYAnchor");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel firstBaselineAnchor](v3->_headerLabel, "firstBaselineAnchor");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v181, "constraintEqualToAnchor:constant:", v180, -v60);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    v224[6] = v179;
    -[CLKUIColoringLabel leadingAnchor](v3->_descriptionLine1Label, "leadingAnchor");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v3->_descriptionTextLayoutGuide, "leadingAnchor");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "constraintEqualToAnchor:", v177);
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    v224[7] = v176;
    -[CLKUIColoringLabel trailingAnchor](v3->_descriptionLine1Label, "trailingAnchor");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v3->_descriptionTextLayoutGuide, "trailingAnchor");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "constraintEqualToAnchor:", v174);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    v224[8] = v173;
    -[CLKUIColoringLabel trailingAnchor](v3->_descriptionLine2Label, "trailingAnchor");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v3->_descriptionTextLayoutGuide, "trailingAnchor");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "constraintEqualToAnchor:", v171);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    v224[9] = v170;
    -[REUpNextImageView leadingAnchor](v3->_descriptionImageView, "leadingAnchor");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v3->_contentLayoutGuide, "leadingAnchor");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "constraintEqualToAnchor:constant:", v168, *(double *)&kActiveLayout_8_1);
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    v224[10] = v167;
    -[UILayoutGuide leadingAnchor](v3->_bodyImageSizingLayoutGuide, "leadingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v3->_descriptionTextLayoutGuide, "leadingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v224[11] = v63;
    -[UILayoutGuide trailingAnchor](v3->_bodyImageSizingLayoutGuide, "trailingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v3->_descriptionTextLayoutGuide, "trailingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v224[12] = v66;
    -[UILayoutGuide topAnchor](v3->_bodyImageSizingLayoutGuide, "topAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel firstBaselineAnchor](v3->_descriptionLine1Label, "firstBaselineAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKFont capHeight](v3->_standardFont, "capHeight");
    objc_msgSend(v67, "constraintEqualToAnchor:constant:", v68, -(v69 + *(double *)&kActiveLayout_11_0));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v224[13] = v70;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v224, 14);
    v207 = (void *)objc_claimAutoreleasedReturnValue();

    -[CLKUIColoringLabel firstBaselineAnchor](v3->_descriptionLine1Label, "firstBaselineAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](v3->_contentLayoutGuide, "topAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:constant:", v72, *(double *)&kActiveLayout_2_4);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v223[0] = v73;
    -[UILayoutGuide topAnchor](v3->_descriptionTextLayoutGuide, "topAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](v3->_contentLayoutGuide, "topAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v223[1] = v76;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v223, 2);
    v77 = objc_claimAutoreleasedReturnValue();
    withoutHeaderConstraints = v3->_withoutHeaderConstraints;
    v3->_withoutHeaderConstraints = (NSArray *)v77;

    -[CLKUIColoringLabel firstBaselineAnchor](v3->_descriptionLine1Label, "firstBaselineAnchor");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel lastBaselineAnchor](v3->_headerLabel, "lastBaselineAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v205, "constraintEqualToAnchor:constant:", v79, *(double *)&kActiveLayout_2_4);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v222[0] = v80;
    -[CLKUIColoringLabel firstBaselineAnchor](v3->_headerLabel, "firstBaselineAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](v3->_contentLayoutGuide, "topAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:constant:", v82, *(double *)&kActiveLayout_1_4);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v222[1] = v83;
    -[UILayoutGuide topAnchor](v3->_descriptionTextLayoutGuide, "topAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel lastBaselineAnchor](v3->_headerLabel, "lastBaselineAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v222[2] = v86;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v222, 3);
    v87 = objc_claimAutoreleasedReturnValue();
    withHeaderConstraints = v3->_withHeaderConstraints;
    v3->_withHeaderConstraints = (NSArray *)v87;

    -[CLKUIColoringLabel leadingAnchor](v3->_headerLabel, "leadingAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v3->_contentLayoutGuide, "leadingAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "constraintEqualToAnchor:", v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v221[0] = v91;
    -[CLKUIColoringLabel trailingAnchor](v3->_headerLabel, "trailingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v3->_contentLayoutGuide, "trailingAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "constraintEqualToAnchor:", v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v221[1] = v94;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v221, 2);
    v95 = objc_claimAutoreleasedReturnValue();
    headerWithNoImageConstraints = v3->_headerWithNoImageConstraints;
    v3->_headerWithNoImageConstraints = (NSArray *)v95;

    -[REUpNextImageView leadingAnchor](v3->_headerImage, "leadingAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v3->_contentLayoutGuide, "leadingAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "constraintEqualToAnchor:", v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v220[0] = v99;
    -[CLKUIColoringLabel leadingAnchor](v3->_headerLabel, "leadingAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextImageView trailingAnchor](v3->_headerImage, "trailingAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "constraintEqualToAnchor:constant:", v101, *(double *)&kActiveLayout_4_2);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v220[1] = v102;
    -[CLKUIColoringLabel trailingAnchor](v3->_headerLabel, "trailingAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v3->_contentLayoutGuide, "trailingAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "constraintEqualToAnchor:", v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v220[2] = v105;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v220, 3);
    v106 = objc_claimAutoreleasedReturnValue();
    headerWithLeftImageConstraints = v3->_headerWithLeftImageConstraints;
    v3->_headerWithLeftImageConstraints = (NSArray *)v106;

    -[CLKUIColoringLabel leadingAnchor](v3->_headerLabel, "leadingAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v3->_contentLayoutGuide, "leadingAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "constraintEqualToAnchor:", v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v219[0] = v110;
    -[CLKUIColoringLabel trailingAnchor](v3->_headerLabel, "trailingAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextImageView leadingAnchor](v3->_headerImage, "leadingAnchor");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "constraintEqualToAnchor:constant:", v112, -*(double *)&kActiveLayout_4_2);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v219[1] = v113;
    -[REUpNextImageView trailingAnchor](v3->_headerImage, "trailingAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v3->_contentLayoutGuide, "trailingAnchor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "constraintEqualToAnchor:", v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v219[2] = v116;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v219, 3);
    v117 = objc_claimAutoreleasedReturnValue();
    headerWithRightImageConstraints = v3->_headerWithRightImageConstraints;
    v3->_headerWithRightImageConstraints = (NSArray *)v117;

    -[CLKUIColoringLabel firstBaselineAnchor](v3->_descriptionLine2Label, "firstBaselineAnchor");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel lastBaselineAnchor](v3->_descriptionLine1Label, "lastBaselineAnchor");
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v211, "constraintEqualToAnchor:constant:", v203, *(double *)&kActiveLayout_3_2);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v218[0] = v119;
    -[CLKUIColoringLabel lastBaselineAnchor](v3->_descriptionLine2Label, "lastBaselineAnchor");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v3->_descriptionTextLayoutGuide, "bottomAnchor");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "constraintEqualToAnchor:", v121);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v218[1] = v122;
    -[UILayoutGuide bottomAnchor](v3->_bodyImageSizingLayoutGuide, "bottomAnchor");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel lastBaselineAnchor](v3->_descriptionLine2Label, "lastBaselineAnchor");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "constraintEqualToAnchor:constant:", v124, *(double *)&kActiveLayout_11_0);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v218[2] = v125;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v218, 3);
    v126 = objc_claimAutoreleasedReturnValue();
    withDescription2Constraints = v3->_withDescription2Constraints;
    v3->_withDescription2Constraints = (NSArray *)v126;

    -[CLKUIColoringLabel lastBaselineAnchor](v3->_descriptionLine1Label, "lastBaselineAnchor");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v3->_descriptionTextLayoutGuide, "bottomAnchor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "constraintLessThanOrEqualToAnchor:", v129);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v217[0] = v130;
    -[UILayoutGuide bottomAnchor](v3->_bodyImageSizingLayoutGuide, "bottomAnchor");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel lastBaselineAnchor](v3->_descriptionLine1Label, "lastBaselineAnchor");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "constraintEqualToAnchor:constant:", v132, *(double *)&kActiveLayout_11_0);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v217[1] = v133;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v217, 2);
    v134 = objc_claimAutoreleasedReturnValue();
    withoutDescription2Constraints = v3->_withoutDescription2Constraints;
    v3->_withoutDescription2Constraints = (NSArray *)v134;

    -[CLKUIColoringLabel leadingAnchor](v3->_descriptionLine2Label, "leadingAnchor");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v3->_descriptionTextLayoutGuide, "leadingAnchor");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "constraintEqualToAnchor:", v137);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v216 = v138;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v216, 1);
    v139 = objc_claimAutoreleasedReturnValue();
    withoutDescriptionAccessoryConstraints = v3->_withoutDescriptionAccessoryConstraints;
    v3->_withoutDescriptionAccessoryConstraints = (NSArray *)v139;

    -[REUpNextImageView heightAnchor](v3->_descriptionImageView, "heightAnchor");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "constraintEqualToConstant:", *(double *)&kActiveLayout_10_1);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v215[0] = v142;
    -[REUpNextImageView bottomAnchor](v3->_descriptionImageView, "bottomAnchor");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v3->_contentLayoutGuide, "bottomAnchor");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "constraintEqualToAnchor:constant:", v144, -*(double *)&kActiveLayout_6_1);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v215[1] = v145;
    -[UILayoutGuide leadingAnchor](v3->_descriptionTextLayoutGuide, "leadingAnchor");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextImageView trailingAnchor](v3->_descriptionImageView, "trailingAnchor");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "constraintEqualToAnchor:constant:", v147, *(double *)&kActiveLayout_7_1);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v215[2] = v148;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v215, 3);
    v149 = objc_claimAutoreleasedReturnValue();
    withDescriptionImageViewConstraints = v3->_withDescriptionImageViewConstraints;
    v3->_withDescriptionImageViewConstraints = (NSArray *)v149;

    -[REUpNextImageView topAnchor](v3->_descriptionImageView, "topAnchor");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](v3->_bodyImageSizingLayoutGuide, "topAnchor");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "constraintEqualToAnchor:", v151);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v214[0] = v152;
    -[REUpNextImageView bottomAnchor](v3->_descriptionImageView, "bottomAnchor");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v3->_bodyImageSizingLayoutGuide, "bottomAnchor");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "constraintEqualToAnchor:", v154);
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    v214[1] = v155;
    -[UILayoutGuide leadingAnchor](v3->_descriptionTextLayoutGuide, "leadingAnchor");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextImageView trailingAnchor](v3->_descriptionImageView, "trailingAnchor");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "constraintEqualToAnchor:constant:", v157, *(double *)&kActiveLayout_7_1);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v214[2] = v158;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v214, 3);
    v159 = objc_claimAutoreleasedReturnValue();
    withStretchableDescriptionImageViewConstraints = v3->_withStretchableDescriptionImageViewConstraints;
    v3->_withStretchableDescriptionImageViewConstraints = (NSArray *)v159;

    -[UILayoutGuide leadingAnchor](v3->_descriptionTextLayoutGuide, "leadingAnchor");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v3->_contentLayoutGuide, "leadingAnchor");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "constraintEqualToAnchor:", v162);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    v213 = v163;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v213, 1);
    v164 = objc_claimAutoreleasedReturnValue();
    withoutDescriptionImageViewConstraints = v3->_withoutDescriptionImageViewConstraints;
    v3->_withoutDescriptionImageViewConstraints = (NSArray *)v164;

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v3->_withHeaderConstraints);
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v3->_headerWithNoImageConstraints);
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v3->_withoutDescription2Constraints);
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v3->_withoutDescriptionAccessoryConstraints);
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v3->_withoutDescriptionImageViewConstraints);
    v3->_showingHeader = 1;
    v3->_headerImageEdge = 0;
    -[CLKUIColoringLabel setHidden:](v3->_descriptionLine2Label, "setHidden:", 1);
    -[REUpNextImageView setHidden:](v3->_descriptionImageView, "setHidden:", 1);
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v207);
    -[CLKUIColoringLabel setNumberOfLines:](v3->_headerLabel, "setNumberOfLines:", 2);
    -[CLKUIColoringLabel setNumberOfLines:](v3->_descriptionLine1Label, "setNumberOfLines:", 2);

  }
  return v3;
}

id __39__REUpNextMultilineCell_initWithFrame___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc(MEMORY[0x24BE16F30]);
  v1 = (void *)objc_msgSend(v0, "initWithFrame:options:", 4, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v1, "setLineBreakMode:", 4);
  objc_msgSend(v1, "setNowProvider:", &__block_literal_global_4_0);
  return v1;
}

uint64_t __39__REUpNextMultilineCell_initWithFrame___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "date");
}

- (void)_updateHeaderColor
{
  void *v3;
  BOOL v4;
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

  if (v4)
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
  CLKUIColoringLabel *descriptionLine1Label;
  void *v4;
  CLKUIColoringLabel *descriptionLine2Label;
  void *v6;
  REUpNextAccessoryView *accessoryView;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)REUpNextMultilineCell;
  -[REUpNextBaseCell defaultTextColorDidChange](&v9, sel_defaultTextColorDidChange);
  -[REUpNextMultilineCell _updateHeaderColor](self, "_updateHeaderColor");
  descriptionLine1Label = self->_descriptionLine1Label;
  -[REUpNextBaseCell defaultTextColor](self, "defaultTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](descriptionLine1Label, "setTextColor:", v4);

  descriptionLine2Label = self->_descriptionLine2Label;
  -[REUpNextBaseCell defaultTextColor](self, "defaultTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](descriptionLine2Label, "setTextColor:", v6);

  accessoryView = self->_accessoryView;
  -[REUpNextBaseCell defaultTextColor](self, "defaultTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REUpNextAccessoryView setTextColor:](accessoryView, "setTextColor:", v8);

}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  int *v8;
  int *v9;
  void *v10;
  _BOOL4 v11;
  unint64_t v12;
  int *v13;
  int *v14;
  void *v15;
  void *v16;
  BOOL v17;
  unsigned int v18;
  REUpNextImageView *headerImage;
  int v20;
  int *v21;
  int *v22;
  void *v23;
  _BOOL4 v24;
  REUpNextAccessoryView *v25;
  REUpNextAccessoryView *v26;
  REUpNextAccessoryView *accessoryView;
  REUpNextAccessoryView *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSArray *v33;
  NSArray *withDescriptionAccessoryConstraints;
  void *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  int v39;
  int v40;
  _BOOL4 showingDescriptionImage;
  double v42;
  BOOL v43;
  float v44;
  uint64_t v45;
  int *v46;
  int *v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  int *v57;
  objc_super v58;
  _QWORD v59[4];

  v59[3] = *MEMORY[0x24BDAC8D0];
  -[REUpNextBaseCell content](self, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v3, "description2TextProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  if (self->_showingThreeLineLayout != v7)
  {
    self->_showingThreeLineLayout = v7;
    -[CLKUIColoringLabel setHidden:](self->_descriptionLine2Label, "setHidden:", v6 == 0);
    if (self->_showingThreeLineLayout)
      v8 = &OBJC_IVAR___REUpNextMultilineCell__withoutDescription2Constraints;
    else
      v8 = &OBJC_IVAR___REUpNextMultilineCell__withDescription2Constraints;
    if (self->_showingThreeLineLayout)
      v9 = &OBJC_IVAR___REUpNextMultilineCell__withDescription2Constraints;
    else
      v9 = &OBJC_IVAR___REUpNextMultilineCell__withoutDescription2Constraints;
    objc_msgSend(v5, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v8));
    objc_msgSend(v4, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v9));
  }
  objc_msgSend(v3, "headerTextProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 != 0;

  v12 = 0x254B8C000uLL;
  if (self->_showingHeader != v11)
  {
    self->_showingHeader = v11;
    -[CLKUIColoringLabel setHidden:](self->_headerLabel, "setHidden:", v10 == 0);
    if (self->_showingHeader)
      v13 = &OBJC_IVAR___REUpNextMultilineCell__withoutHeaderConstraints;
    else
      v13 = &OBJC_IVAR___REUpNextMultilineCell__withHeaderConstraints;
    if (self->_showingHeader)
      v14 = &OBJC_IVAR___REUpNextMultilineCell__withHeaderConstraints;
    else
      v14 = &OBJC_IVAR___REUpNextMultilineCell__withoutHeaderConstraints;
    objc_msgSend(v5, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v13));
    objc_msgSend(v4, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v14));
  }
  objc_msgSend(v3, "headerImageProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(v3, "overrideHeaderImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      v17 = v10 == 0;
    else
      v17 = 1;
    v11 = !v17;

  }
  v18 = objc_msgSend(v3, "headerImageEdge");
  if (self->_showingHeaderImage != v11 || v18 != self->_headerImageEdge)
  {
    self->_showingHeaderImage = v11;
    self->_headerImageEdge = v18;
    headerImage = self->_headerImage;
    if (self->_showingHeaderImage)
    {
      -[REUpNextImageView setHidden:](headerImage, "setHidden:", 0);
      objc_msgSend(v5, "addObjectsFromArray:", self->_headerWithNoImageConstraints);
      v20 = objc_msgSend(v3, "headerImageEdge");
      if (v20 == 2)
        v21 = &OBJC_IVAR___REUpNextMultilineCell__headerWithLeftImageConstraints;
      else
        v21 = &OBJC_IVAR___REUpNextMultilineCell__headerWithRightImageConstraints;
      if (v20 == 2)
        v22 = &OBJC_IVAR___REUpNextMultilineCell__headerWithRightImageConstraints;
      else
        v22 = &OBJC_IVAR___REUpNextMultilineCell__headerWithLeftImageConstraints;
    }
    else
    {
      -[REUpNextImageView setHidden:](headerImage, "setHidden:", 1);
      objc_msgSend(v5, "addObjectsFromArray:", self->_headerWithLeftImageConstraints);
      v22 = &OBJC_IVAR___REUpNextMultilineCell__headerWithNoImageConstraints;
      v21 = &OBJC_IVAR___REUpNextMultilineCell__headerWithRightImageConstraints;
    }
    objc_msgSend(v5, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v21));
    objc_msgSend(v4, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v22));
  }
  objc_msgSend(v3, "descriptionAccessory");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23 != 0;

  if (self->_showingAccessory == v24)
  {
    if (!v23)
      goto LABEL_45;
LABEL_43:
    v36 = 0;
    goto LABEL_49;
  }
  self->_showingAccessory = v24;
  if (v23)
  {
    if (!self->_accessoryView)
    {
      v25 = [REUpNextAccessoryView alloc];
      v26 = -[REUpNextAccessoryView initWithFrame:](v25, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      accessoryView = self->_accessoryView;
      self->_accessoryView = v26;

      v28 = self->_accessoryView;
      objc_msgSend(v3, "descriptionAccessory");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[REUpNextAccessoryView configureWithDescription:](v28, "configureWithDescription:", v29);

      -[REUpNextAccessoryView setTranslatesAutoresizingMaskIntoConstraints:](self->_accessoryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[CLKUIColoringLabel leadingAnchor](self->_descriptionLine2Label, "leadingAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[REUpNextAccessoryView trailingAnchor](self->_accessoryView, "trailingAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "constraintEqualToAnchor:constant:", v55, *(double *)&kActiveLayout_0_4);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = v54;
      -[REUpNextAccessoryView leadingAnchor](self->_accessoryView, "leadingAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide leadingAnchor](self->_descriptionTextLayoutGuide, "leadingAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "constraintEqualToAnchor:", v52);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v59[1] = v51;
      -[REUpNextAccessoryView firstBaselineAnchor](self->_accessoryView, "firstBaselineAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKUIColoringLabel firstBaselineAnchor](self->_descriptionLine2Label, "firstBaselineAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v59[2] = v32;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 3);
      v33 = (NSArray *)objc_claimAutoreleasedReturnValue();
      withDescriptionAccessoryConstraints = self->_withDescriptionAccessoryConstraints;
      self->_withDescriptionAccessoryConstraints = v33;

    }
    -[REUpNextMultilineCell contentView](self, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addSubview:", self->_accessoryView);

    objc_msgSend(v5, "addObjectsFromArray:", self->_withoutDescriptionAccessoryConstraints);
    objc_msgSend(v4, "addObjectsFromArray:", self->_withDescriptionAccessoryConstraints);
    goto LABEL_43;
  }
  objc_msgSend(v5, "addObjectsFromArray:", self->_withDescriptionAccessoryConstraints);
  objc_msgSend(v4, "addObjectsFromArray:", self->_withoutDescriptionAccessoryConstraints);
  -[REUpNextAccessoryView removeFromSuperview](self->_accessoryView, "removeFromSuperview");
LABEL_45:
  objc_msgSend(v3, "bodyImageProvider");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v36 = 1;
  }
  else
  {
    objc_msgSend(v3, "overrideBodyImage");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v38 != 0;

  }
LABEL_49:
  v39 = objc_msgSend(v3, "bodyImageShouldStretch");
  v40 = v39;
  if (self->_showingDescriptionImage != v36 || self->_usingStretchableImage != v39)
  {
    self->_showingDescriptionImage = v36;
    self->_usingStretchableImage = v39;
    showingDescriptionImage = self->_showingDescriptionImage;
    if (self->_showingDescriptionImage)
    {
      objc_msgSend(v5, "addObjectsFromArray:", self->_withoutDescriptionImageViewConstraints);
      v43 = v40 == 0;
      if (v40)
        v44 = 250.0;
      else
        v44 = 1000.0;
      if (v40)
        v45 = 0;
      else
        v45 = 6;
      v46 = &OBJC_IVAR___REUpNextMultilineCell__withStretchableDescriptionImageViewConstraints;
      if (v43)
        v47 = &OBJC_IVAR___REUpNextMultilineCell__withStretchableDescriptionImageViewConstraints;
      else
        v47 = &OBJC_IVAR___REUpNextMultilineCell__withDescriptionImageViewConstraints;
      if (v43)
        v46 = &OBJC_IVAR___REUpNextMultilineCell__withDescriptionImageViewConstraints;
      v57 = v46;
      *(float *)&v42 = v44;
      -[REUpNextImageView setContentHuggingPriority:forAxis:](self->_descriptionImageView, "setContentHuggingPriority:forAxis:", 1, v42);
      *(float *)&v48 = v44;
      -[REUpNextImageView setContentCompressionResistancePriority:forAxis:](self->_descriptionImageView, "setContentCompressionResistancePriority:forAxis:", 1, v48);
      -[REUpNextImageView setContentMode:](self->_descriptionImageView, "setContentMode:", v45);
      v12 = 0x254B8C000;
      objc_msgSend(v5, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v47));
      objc_msgSend(v4, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v57));
    }
    else
    {
      objc_msgSend(v5, "addObjectsFromArray:", self->_withDescriptionImageViewConstraints);
      objc_msgSend(v5, "addObjectsFromArray:", self->_withStretchableDescriptionImageViewConstraints);
      objc_msgSend(v4, "addObjectsFromArray:", self->_withoutDescriptionImageViewConstraints);
    }
    -[REUpNextImageView setHidden:](self->_descriptionImageView, "setHidden:", !showingDescriptionImage);
  }
  objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", v5);
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v4);
  if (self->_showingThreeLineLayout)
  {
    v49 = 1;
    v50 = 1;
  }
  else if (self->_showingHeaderImage || self->_showingDescriptionImage)
  {
    v50 = 2;
    v49 = 1;
  }
  else
  {
    if (!self->_showingHeader)
    {
      v50 = 3;
      goto LABEL_73;
    }
    v49 = 2;
    v50 = 2;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + *(int *)(v12 + 3636)), "setNumberOfLines:", v49);
LABEL_73:
  -[CLKUIColoringLabel setNumberOfLines:](self->_descriptionLine1Label, "setNumberOfLines:", v50);
  v58.receiver = self;
  v58.super_class = (Class)REUpNextMultilineCell;
  -[REUpNextMultilineCell updateConstraints](&v58, sel_updateConstraints);

}

- (void)configureWithContent:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  REUpNextImageView *headerImage;
  void *v7;
  void *v8;
  REUpNextImageView *v9;
  void *v10;
  void *v11;
  REUpNextImageView *v12;
  REUpNextImageView *descriptionImageView;
  void *v14;
  void *v15;
  REUpNextImageView *v16;
  void *v17;
  void *v18;
  REUpNextImageView *v19;
  CLKUIColoringLabel *headerLabel;
  void *v21;
  CLKUIColoringLabel *descriptionLine1Label;
  void *v23;
  CLKUIColoringLabel *descriptionLine2Label;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)REUpNextMultilineCell;
  -[REUpNextBaseCell configureWithContent:](&v30, sel_configureWithContent_, v4);
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __46__REUpNextMultilineCell_configureWithContent___block_invoke;
  v29[3] = &unk_24CF79D40;
  v29[4] = self;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199AF51C](v29);
  ((void (**)(_QWORD, CLKUIColoringLabel *, uint64_t))v5)[2](v5, self->_descriptionLine1Label, objc_msgSend(v4, "description1FontStyle"));
  ((void (**)(_QWORD, CLKUIColoringLabel *, uint64_t))v5)[2](v5, self->_descriptionLine2Label, objc_msgSend(v4, "description2FontStyle"));
  -[REUpNextMultilineCell _updateHeaderColor](self, "_updateHeaderColor");
  headerImage = self->_headerImage;
  objc_msgSend(v4, "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REUpNextImageView setFallbackTintColor:](headerImage, "setFallbackTintColor:", v7);

  objc_msgSend(v4, "headerImageProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = self->_headerImage;
    objc_msgSend(v4, "headerImageProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextImageView setImageProvider:](v9, "setImageProvider:", v10);
  }
  else
  {
    objc_msgSend(v4, "overrideHeaderImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_6;
    v12 = self->_headerImage;
    objc_msgSend(v4, "overrideHeaderImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextImageView setOverrideImage:](v12, "setOverrideImage:", v10);
  }

LABEL_6:
  descriptionImageView = self->_descriptionImageView;
  objc_msgSend(v4, "tintColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[REUpNextImageView setFallbackTintColor:](descriptionImageView, "setFallbackTintColor:", v14);

  objc_msgSend(v4, "bodyImageProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = self->_descriptionImageView;
    objc_msgSend(v4, "bodyImageProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextImageView setImageProvider:](v16, "setImageProvider:", v17);
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v4, "overrideBodyImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = self->_descriptionImageView;
    objc_msgSend(v4, "overrideBodyImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextImageView setOverrideImage:](v19, "setOverrideImage:", v17);
    goto LABEL_10;
  }
LABEL_11:
  headerLabel = self->_headerLabel;
  objc_msgSend(v4, "headerTextProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](headerLabel, "setTextProvider:", v21);

  descriptionLine1Label = self->_descriptionLine1Label;
  objc_msgSend(v4, "description1TextProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](descriptionLine1Label, "setTextProvider:", v23);

  descriptionLine2Label = self->_descriptionLine2Label;
  objc_msgSend(v4, "description2TextProvider");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](descriptionLine2Label, "setTextProvider:", v25);

  objc_msgSend(v4, "headerTextProvider");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setPaused:", 0);

  objc_msgSend(v4, "description1TextProvider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setPaused:", 0);

  objc_msgSend(v4, "description2TextProvider");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setPaused:", 0);

  -[REUpNextMultilineCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

void __46__REUpNextMultilineCell_configureWithContent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  double v6;
  int *v7;
  id v8;

  v5 = a2;
  v6 = 0.0;
  v8 = v5;
  v7 = &OBJC_IVAR___REUpNextMultilineCell__standardFont;
  switch(a3)
  {
    case 0:
      goto LABEL_7;
    case 1:
      if (!REIsCurrentLocaleCJK())
        v7 = &OBJC_IVAR___REUpNextMultilineCell__italicFont;
      goto LABEL_7;
    case 2:
      v7 = &OBJC_IVAR___REUpNextMultilineCell__boldFont;
      goto LABEL_7;
    case 3:
      v6 = 0.8;
LABEL_7:
      objc_msgSend(v8, "setFont:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + *v7));
      v5 = v8;
      break;
    default:
      break;
  }
  objc_msgSend(v5, "setMinimumScaleFactor:", v6);
  objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", v6 != 0.0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_withoutDescriptionImageViewConstraints, 0);
  objc_storeStrong((id *)&self->_withStretchableDescriptionImageViewConstraints, 0);
  objc_storeStrong((id *)&self->_withDescriptionImageViewConstraints, 0);
  objc_storeStrong((id *)&self->_withoutDescriptionAccessoryConstraints, 0);
  objc_storeStrong((id *)&self->_withDescriptionAccessoryConstraints, 0);
  objc_storeStrong((id *)&self->_withoutDescription2Constraints, 0);
  objc_storeStrong((id *)&self->_withDescription2Constraints, 0);
  objc_storeStrong((id *)&self->_headerWithNoImageConstraints, 0);
  objc_storeStrong((id *)&self->_headerWithRightImageConstraints, 0);
  objc_storeStrong((id *)&self->_headerWithLeftImageConstraints, 0);
  objc_storeStrong((id *)&self->_withoutHeaderConstraints, 0);
  objc_storeStrong((id *)&self->_withHeaderConstraints, 0);
  objc_storeStrong((id *)&self->_boldFont, 0);
  objc_storeStrong((id *)&self->_italicFont, 0);
  objc_storeStrong((id *)&self->_standardFont, 0);
  objc_storeStrong((id *)&self->_descriptionImageView, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_headerImage, 0);
  objc_storeStrong((id *)&self->_descriptionLine2Label, 0);
  objc_storeStrong((id *)&self->_descriptionLine1Label, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_bodyImageSizingLayoutGuide, 0);
  objc_storeStrong((id *)&self->_descriptionTextLayoutGuide, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
}

@end
