@implementation REUpNextThumbnailCell

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    kActiveLayout_1_0 = 0x4033800000000000;
    kActiveLayout_2_0 = 0x4033800000000000;
    kActiveLayout_3_0 = 0x4033800000000000;
    kActiveLayout_4_0 = 0x4018000000000000;
    kActiveLayout_5_0 = 0x4030800000000000;
    kActiveLayout_6_0 = 0x401E000000000000;
    kActiveLayout_9 = 0x4018000000000000;
    kActiveLayout_11 = 0x4018000000000000;
    kActiveLayout_0_0 = 0x4000000000000000;
    kActiveLayout_7_0 = 0x4050600000000000;
  }
}

- (REUpNextThumbnailCell)initWithFrame:(CGRect)a3
{
  REUpNextThumbnailCell *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CLKFont *standardFont;
  uint64_t v10;
  CLKFont *boldFont;
  uint64_t v12;
  CLKFont *italicFont;
  id v14;
  uint64_t v15;
  CLKUIColoringLabel *headerLabel;
  CLKUIColoringLabel *v17;
  void *v18;
  uint64_t v19;
  CLKUIColoringLabel *descriptionLine1Label;
  CLKUIColoringLabel *v21;
  void *v22;
  uint64_t v23;
  CLKUIColoringLabel *descriptionLine2Label;
  CLKUIColoringLabel *v25;
  void *v26;
  id v27;
  uint64_t v28;
  UIImageView *imageView;
  void *v30;
  UILayoutGuide *v31;
  UILayoutGuide *labelLayoutGuide;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSLayoutConstraint *imageWidthConstraint;
  void *v41;
  uint64_t v42;
  NSLayoutConstraint *imageHeightConstraint;
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
  uint64_t v56;
  NSArray *withoutHeaderConstraints;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  NSArray *withHeaderConstraints;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  NSArray *withDescription2Constraints;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  NSArray *withoutDescription2Constraints;
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
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  objc_super v119;
  _QWORD v120[2];
  _QWORD v121[2];
  _QWORD v122[2];
  void *v123;
  _QWORD v124[16];

  v124[14] = *MEMORY[0x24BDAC8D0];
  v119.receiver = self;
  v119.super_class = (Class)REUpNextThumbnailCell;
  v3 = -[REUpNextBaseCell initWithFrame:](&v119, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDB8748], "systemFontOfSize:", *(double *)&kActiveLayout_5_0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fontDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", 1);
    v117 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDB8748], "systemFontOfSize:", *(double *)&kActiveLayout_5_0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fontDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fontDescriptorWithSymbolicTraits:", 2);
    v118 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDB8748], "systemFontOfSize:weight:", *(double *)&kActiveLayout_5_0, *MEMORY[0x24BDF7880]);
    v8 = objc_claimAutoreleasedReturnValue();
    standardFont = v3->_standardFont;
    v3->_standardFont = (CLKFont *)v8;

    objc_msgSend(MEMORY[0x24BDB8748], "fontWithDescriptor:size:", v118, *(double *)&kActiveLayout_5_0);
    v10 = objc_claimAutoreleasedReturnValue();
    boldFont = v3->_boldFont;
    v3->_boldFont = (CLKFont *)v10;

    objc_msgSend(MEMORY[0x24BDB8748], "fontWithDescriptor:size:", v117, *(double *)&kActiveLayout_5_0);
    v12 = objc_claimAutoreleasedReturnValue();
    italicFont = v3->_italicFont;
    v3->_italicFont = (CLKFont *)v12;

    v14 = objc_alloc_init(MEMORY[0x24BDF6748]);
    objc_msgSend(v14, "setLineBreakMode:", 4);
    __39__REUpNextThumbnailCell_initWithFrame___block_invoke();
    v15 = objc_claimAutoreleasedReturnValue();
    headerLabel = v3->_headerLabel;
    v3->_headerLabel = (CLKUIColoringLabel *)v15;

    -[CLKUIColoringLabel setFont:](v3->_headerLabel, "setFont:", v3->_boldFont);
    v17 = v3->_headerLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v17, "setTextColor:", v18);

    -[CLKUIColoringLabel setNumberOfLines:](v3->_headerLabel, "setNumberOfLines:", 2);
    v116 = v14;
    -[CLKUIColoringLabel setParagraphStyle:](v3->_headerLabel, "setParagraphStyle:", v14);
    __39__REUpNextThumbnailCell_initWithFrame___block_invoke();
    v19 = objc_claimAutoreleasedReturnValue();
    descriptionLine1Label = v3->_descriptionLine1Label;
    v3->_descriptionLine1Label = (CLKUIColoringLabel *)v19;

    v21 = v3->_descriptionLine1Label;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v21, "setTextColor:", v22);

    -[CLKUIColoringLabel setFont:](v3->_descriptionLine1Label, "setFont:", v3->_standardFont);
    -[CLKUIColoringLabel setParagraphStyle:](v3->_descriptionLine1Label, "setParagraphStyle:", v14);
    __39__REUpNextThumbnailCell_initWithFrame___block_invoke();
    v23 = objc_claimAutoreleasedReturnValue();
    descriptionLine2Label = v3->_descriptionLine2Label;
    v3->_descriptionLine2Label = (CLKUIColoringLabel *)v23;

    v25 = v3->_descriptionLine2Label;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v25, "setTextColor:", v26);

    -[CLKUIColoringLabel setFont:](v3->_descriptionLine2Label, "setFont:", v3->_italicFont);
    -[CLKUIColoringLabel setNumberOfLines:](v3->_descriptionLine2Label, "setNumberOfLines:", 1);
    v27 = objc_alloc(MEMORY[0x24BDF6AE8]);
    v28 = objc_msgSend(v27, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v28;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 1);
    -[UIImageView layer](v3->_imageView, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setCornerRadius:", *(double *)&kActiveLayout_0_0);

    -[UIImageView setClipsToBounds:](v3->_imageView, "setClipsToBounds:", 1);
    v31 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x24BDF6B78]);
    labelLayoutGuide = v3->_labelLayoutGuide;
    v3->_labelLayoutGuide = v31;

    -[REUpNextThumbnailCell contentView](v3, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addLayoutGuide:", v3->_labelLayoutGuide);

    -[REUpNextThumbnailCell contentView](v3, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addSubview:", v3->_imageView);

    -[REUpNextThumbnailCell contentView](v3, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addSubview:", v3->_headerLabel);

    -[REUpNextThumbnailCell contentView](v3, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addSubview:", v3->_descriptionLine1Label);

    -[REUpNextThumbnailCell contentView](v3, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addSubview:", v3->_descriptionLine2Label);

    -[UIImageView widthAnchor](v3->_imageView, "widthAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToConstant:", 1.0);
    v39 = objc_claimAutoreleasedReturnValue();
    imageWidthConstraint = v3->_imageWidthConstraint;
    v3->_imageWidthConstraint = (NSLayoutConstraint *)v39;

    -[UIImageView heightAnchor](v3->_imageView, "heightAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToConstant:", 1.0);
    v42 = objc_claimAutoreleasedReturnValue();
    imageHeightConstraint = v3->_imageHeightConstraint;
    v3->_imageHeightConstraint = (NSLayoutConstraint *)v42;

    -[UIImageView leadingAnchor](v3->_imageView, "leadingAnchor");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextThumbnailCell contentView](v3, "contentView");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "leadingAnchor");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "constraintEqualToAnchor:constant:", v112, *(double *)&kActiveLayout_4_0);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v124[0] = v111;
    -[UIImageView centerYAnchor](v3->_imageView, "centerYAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextThumbnailCell contentView](v3, "contentView");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "centerYAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "constraintEqualToAnchor:", v108);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v124[1] = v107;
    -[UILayoutGuide topAnchor](v3->_labelLayoutGuide, "topAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextThumbnailCell contentView](v3, "contentView");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "topAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "constraintEqualToAnchor:constant:", v104, 0.0);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v124[2] = v103;
    -[UILayoutGuide bottomAnchor](v3->_labelLayoutGuide, "bottomAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextThumbnailCell contentView](v3, "contentView");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "bottomAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "constraintEqualToAnchor:constant:", v100, -0.0);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v124[3] = v99;
    -[UILayoutGuide leadingAnchor](v3->_labelLayoutGuide, "leadingAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v3->_imageView, "trailingAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "constraintEqualToAnchor:constant:", v97, *(double *)&kActiveLayout_9);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v124[4] = v96;
    -[UILayoutGuide trailingAnchor](v3->_labelLayoutGuide, "trailingAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextThumbnailCell contentView](v3, "contentView");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "trailingAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "constraintEqualToAnchor:constant:", v93, -*(double *)&kActiveLayout_11);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v124[5] = v92;
    -[CLKUIColoringLabel leadingAnchor](v3->_headerLabel, "leadingAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v3->_labelLayoutGuide, "leadingAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "constraintEqualToAnchor:", v90);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v124[6] = v89;
    -[CLKUIColoringLabel trailingAnchor](v3->_headerLabel, "trailingAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v3->_labelLayoutGuide, "trailingAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "constraintEqualToAnchor:", v87);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v124[7] = v86;
    -[CLKUIColoringLabel leadingAnchor](v3->_descriptionLine1Label, "leadingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v3->_labelLayoutGuide, "leadingAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:", v84);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v124[8] = v83;
    -[CLKUIColoringLabel trailingAnchor](v3->_descriptionLine1Label, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v3->_labelLayoutGuide, "trailingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v124[9] = v46;
    -[CLKUIColoringLabel leadingAnchor](v3->_descriptionLine2Label, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v3->_labelLayoutGuide, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v124[10] = v49;
    -[CLKUIColoringLabel trailingAnchor](v3->_descriptionLine2Label, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v3->_labelLayoutGuide, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v124[11] = v52;
    v124[12] = v3->_imageHeightConstraint;
    v124[13] = v3->_imageWidthConstraint;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v124, 14);
    v115 = (void *)objc_claimAutoreleasedReturnValue();

    -[CLKUIColoringLabel firstBaselineAnchor](v3->_descriptionLine1Label, "firstBaselineAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](v3->_labelLayoutGuide, "topAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, *(double *)&kActiveLayout_1_0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = v55;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v123, 1);
    v56 = objc_claimAutoreleasedReturnValue();
    withoutHeaderConstraints = v3->_withoutHeaderConstraints;
    v3->_withoutHeaderConstraints = (NSArray *)v56;

    -[CLKUIColoringLabel firstBaselineAnchor](v3->_headerLabel, "firstBaselineAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](v3->_labelLayoutGuide, "topAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:constant:", v59, *(double *)&kActiveLayout_1_0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v122[0] = v60;
    -[CLKUIColoringLabel firstBaselineAnchor](v3->_descriptionLine1Label, "firstBaselineAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel lastBaselineAnchor](v3->_headerLabel, "lastBaselineAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:constant:", v62, *(double *)&kActiveLayout_2_0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v122[1] = v63;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v122, 2);
    v64 = objc_claimAutoreleasedReturnValue();
    withHeaderConstraints = v3->_withHeaderConstraints;
    v3->_withHeaderConstraints = (NSArray *)v64;

    -[CLKUIColoringLabel firstBaselineAnchor](v3->_descriptionLine2Label, "firstBaselineAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel lastBaselineAnchor](v3->_descriptionLine1Label, "lastBaselineAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:constant:", v67, *(double *)&kActiveLayout_3_0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v121[0] = v68;
    -[CLKUIColoringLabel lastBaselineAnchor](v3->_descriptionLine2Label, "lastBaselineAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v3->_labelLayoutGuide, "bottomAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintLessThanOrEqualToAnchor:constant:", v70, -*(double *)&kActiveLayout_6_0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v121[1] = v71;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v121, 2);
    v72 = objc_claimAutoreleasedReturnValue();
    withDescription2Constraints = v3->_withDescription2Constraints;
    v3->_withDescription2Constraints = (NSArray *)v72;

    -[CLKUIColoringLabel lastBaselineAnchor](v3->_descriptionLine1Label, "lastBaselineAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v3->_labelLayoutGuide, "bottomAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintLessThanOrEqualToAnchor:constant:", v75, -*(double *)&kActiveLayout_6_0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v120[0] = v76;
    -[CLKUIColoringLabel lastBaselineAnchor](v3->_headerLabel, "lastBaselineAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v3->_labelLayoutGuide, "bottomAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintLessThanOrEqualToAnchor:constant:", v78, -*(double *)&kActiveLayout_6_0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v120[1] = v79;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v120, 2);
    v80 = objc_claimAutoreleasedReturnValue();
    withoutDescription2Constraints = v3->_withoutDescription2Constraints;
    v3->_withoutDescription2Constraints = (NSArray *)v80;

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v3->_withoutDescription2Constraints);
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v3->_withoutHeaderConstraints);
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v115);
    -[CLKUIColoringLabel setNumberOfLines:](v3->_descriptionLine1Label, "setNumberOfLines:", 3);
    -[CLKUIColoringLabel setHidden:](v3->_headerLabel, "setHidden:", 1);
    -[CLKUIColoringLabel setHidden:](v3->_descriptionLine2Label, "setHidden:", 1);

  }
  return v3;
}

id __39__REUpNextThumbnailCell_initWithFrame___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc(MEMORY[0x24BE16F30]);
  v1 = (void *)objc_msgSend(v0, "initWithFrame:options:", 4, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v1, "setLineBreakMode:", 4);
  objc_msgSend(v1, "setNowProvider:", &__block_literal_global_4);
  return v1;
}

uint64_t __39__REUpNextThumbnailCell_initWithFrame___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "date");
}

- (void)defaultTextColorDidChange
{
  CLKUIColoringLabel *headerLabel;
  void *v4;
  CLKUIColoringLabel *descriptionLine1Label;
  void *v6;
  CLKUIColoringLabel *descriptionLine2Label;
  void *v8;
  UIImageView *imageView;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)REUpNextThumbnailCell;
  -[REUpNextBaseCell defaultTextColorDidChange](&v11, sel_defaultTextColorDidChange);
  headerLabel = self->_headerLabel;
  -[REUpNextBaseCell defaultTextColor](self, "defaultTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](headerLabel, "setTextColor:", v4);

  descriptionLine1Label = self->_descriptionLine1Label;
  -[REUpNextBaseCell defaultTextColor](self, "defaultTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](descriptionLine1Label, "setTextColor:", v6);

  descriptionLine2Label = self->_descriptionLine2Label;
  -[REUpNextBaseCell defaultTextColor](self, "defaultTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextColor:](descriptionLine2Label, "setTextColor:", v8);

  imageView = self->_imageView;
  -[REUpNextBaseCell defaultTextColor](self, "defaultTextColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](imageView, "setTintColor:", v10);

}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  _BOOL4 v12;
  int *v13;
  int *v14;
  void *v15;
  _BOOL4 v16;
  BOOL v17;
  _BOOL8 v18;
  int *v19;
  int *v20;
  CLKUIColoringLabel *headerLabel;
  uint64_t v22;
  void *v23;
  objc_super v24;

  -[REUpNextBaseCell content](self, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = *(double *)&kActiveLayout_7_0 - (*(double *)&kActiveLayout_4_0 * 2.0 + 0.0 + 0.0);
  objc_msgSend(v3, "overrideBodyImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "size");
  v10 = v9;
  if (v9 <= v8 || v9 <= v6)
  {
    if (v8 >= v9 && v8 > v6)
    {
      v10 = v6 * (v9 / v8);
      v8 = v6;
    }
  }
  else
  {
    v8 = v6 * (v8 / v9);
    v10 = v6;
  }
  -[NSLayoutConstraint setConstant:](self->_imageWidthConstraint, "setConstant:", v8);
  -[NSLayoutConstraint setConstant:](self->_imageHeightConstraint, "setConstant:", v10);
  objc_msgSend(v3, "description2TextProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 != 0;

  if (self->_showingThreeLineLayout != v12)
  {
    self->_showingThreeLineLayout = v12;
    -[CLKUIColoringLabel setHidden:](self->_descriptionLine2Label, "setHidden:", v11 == 0);
    if (self->_showingThreeLineLayout)
      v13 = &OBJC_IVAR___REUpNextThumbnailCell__withoutDescription2Constraints;
    else
      v13 = &OBJC_IVAR___REUpNextThumbnailCell__withDescription2Constraints;
    if (self->_showingThreeLineLayout)
      v14 = &OBJC_IVAR___REUpNextThumbnailCell__withDescription2Constraints;
    else
      v14 = &OBJC_IVAR___REUpNextThumbnailCell__withoutDescription2Constraints;
    objc_msgSend(v5, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v13));
    objc_msgSend(v4, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v14));
  }
  objc_msgSend(v3, "headerTextProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 != 0;

  if (self->_showingHeader != v16)
  {
    v17 = v15 == 0;
    v18 = v15 == 0;
    self->_showingHeader = v16;
    if (v15)
      v19 = &OBJC_IVAR___REUpNextThumbnailCell__withoutHeaderConstraints;
    else
      v19 = &OBJC_IVAR___REUpNextThumbnailCell__withHeaderConstraints;
    if (v17)
      v20 = &OBJC_IVAR___REUpNextThumbnailCell__withoutHeaderConstraints;
    else
      v20 = &OBJC_IVAR___REUpNextThumbnailCell__withHeaderConstraints;
    -[CLKUIColoringLabel setHidden:](self->_headerLabel, "setHidden:", v18);
    objc_msgSend(v5, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v19));
    objc_msgSend(v4, "addObjectsFromArray:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v20));
  }
  if (!self->_showingThreeLineLayout)
  {
    if (self->_showingHeader)
    {
      objc_msgSend(v3, "description1TextProvider");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      headerLabel = self->_headerLabel;
      if (v23)
      {
        -[CLKUIColoringLabel setNumberOfLines:](headerLabel, "setNumberOfLines:", 2);
        headerLabel = self->_descriptionLine1Label;
        v22 = 2;
        goto LABEL_30;
      }
    }
    else
    {
      headerLabel = self->_descriptionLine1Label;
    }
    v22 = 3;
    goto LABEL_30;
  }
  -[CLKUIColoringLabel setNumberOfLines:](self->_headerLabel, "setNumberOfLines:", 1);
  headerLabel = self->_descriptionLine1Label;
  v22 = 1;
LABEL_30:
  -[CLKUIColoringLabel setNumberOfLines:](headerLabel, "setNumberOfLines:", v22);
  objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", v5);
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v4);
  v24.receiver = self;
  v24.super_class = (Class)REUpNextThumbnailCell;
  -[REUpNextThumbnailCell updateConstraints](&v24, sel_updateConstraints);

}

- (void)configureWithContent:(id)a3
{
  id v4;
  CLKUIColoringLabel *headerLabel;
  void *v6;
  CLKUIColoringLabel *descriptionLine1Label;
  void *v8;
  CLKUIColoringLabel *descriptionLine2Label;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  UIImageView *imageView;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)REUpNextThumbnailCell;
  v4 = a3;
  -[REUpNextBaseCell configureWithContent:](&v18, sel_configureWithContent_, v4);
  headerLabel = self->_headerLabel;
  objc_msgSend(v4, "headerTextProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](headerLabel, "setTextProvider:", v6);

  descriptionLine1Label = self->_descriptionLine1Label;
  objc_msgSend(v4, "description1TextProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](descriptionLine1Label, "setTextProvider:", v8);

  descriptionLine2Label = self->_descriptionLine2Label;
  objc_msgSend(v4, "description2TextProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](descriptionLine2Label, "setTextProvider:", v10);

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __46__REUpNextThumbnailCell_configureWithContent___block_invoke;
  v17[3] = &unk_24CF79D40;
  v17[4] = self;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199AF51C](v17);
  ((void (**)(_QWORD, CLKUIColoringLabel *, uint64_t))v11)[2](v11, self->_headerLabel, objc_msgSend(v4, "headerFontStyle"));
  ((void (**)(_QWORD, CLKUIColoringLabel *, uint64_t))v11)[2](v11, self->_descriptionLine1Label, objc_msgSend(v4, "description1FontStyle"));
  ((void (**)(_QWORD, CLKUIColoringLabel *, uint64_t))v11)[2](v11, self->_descriptionLine2Label, objc_msgSend(v4, "description2FontStyle"));
  imageView = self->_imageView;
  objc_msgSend(v4, "overrideBodyImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](imageView, "setImage:", v13);

  objc_msgSend(v4, "headerTextProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPaused:", 0);

  objc_msgSend(v4, "description1TextProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPaused:", 0);

  objc_msgSend(v4, "description2TextProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setPaused:", 0);
  -[REUpNextThumbnailCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

void __46__REUpNextThumbnailCell_configureWithContent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  double v6;
  int *v7;
  id v8;

  v5 = a2;
  v6 = 0.0;
  v8 = v5;
  v7 = &OBJC_IVAR___REUpNextThumbnailCell__standardFont;
  switch(a3)
  {
    case 0:
      goto LABEL_7;
    case 1:
      if (!REIsCurrentLocaleCJK())
        v7 = &OBJC_IVAR___REUpNextThumbnailCell__italicFont;
      goto LABEL_7;
    case 2:
      v7 = &OBJC_IVAR___REUpNextThumbnailCell__boldFont;
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
  objc_storeStrong((id *)&self->_imageHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_withoutDescription2Constraints, 0);
  objc_storeStrong((id *)&self->_withDescription2Constraints, 0);
  objc_storeStrong((id *)&self->_withoutHeaderConstraints, 0);
  objc_storeStrong((id *)&self->_withHeaderConstraints, 0);
  objc_storeStrong((id *)&self->_boldFont, 0);
  objc_storeStrong((id *)&self->_italicFont, 0);
  objc_storeStrong((id *)&self->_standardFont, 0);
  objc_storeStrong((id *)&self->_descriptionLine2Label, 0);
  objc_storeStrong((id *)&self->_descriptionLine1Label, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_labelLayoutGuide, 0);
}

@end
