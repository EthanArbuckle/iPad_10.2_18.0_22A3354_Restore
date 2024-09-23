@implementation STUsageSummaryTitleView

- (STUsageSummaryTitleView)initWithVibrancy:(BOOL)a3 usageItemType:(unint64_t)a4 truncateAverageLabel:(BOOL)a5
{
  void *v10;
  STUsageSummaryTitleView *v11;
  objc_super v13;

  if (a4 > 6 || ((1 << a4) & 0x62) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUsageSummaryTitleView.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(usageItemType == STUsageItemTypeScreenTime) || (usageItemType == STUsageItemTypePickups) || (usageItemType == STUsageItemTypeNotifications)"));

  }
  v13.receiver = self;
  v13.super_class = (Class)STUsageSummaryTitleView;
  v11 = -[STUsageSummaryTitleView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v11->_useVibrancy = a3;
  v11->_truncateAverageLabel = a5;
  -[STUsageSummaryTitleView _setupSubviews](v11, "_setupSubviews");
  -[STUsageSummaryTitleView setUsageItemType:](v11, "setUsageItemType:", a4);
  return v11;
}

- (STUsageSummaryTitleView)initWithCoder:(id)a3
{
  STUsageSummaryTitleView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STUsageSummaryTitleView;
  result = -[STUsageSummaryTitleView initWithCoder:](&v4, sel_initWithCoder_, a3);
  result->_usageItemType = 1;
  return result;
}

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUsageSummaryTitleView;
  -[STUsageSummaryTitleView awakeFromNib](&v3, sel_awakeFromNib);
  -[STUsageSummaryTitleView _setupSubviews](self, "_setupSubviews");
}

- (void)_setupSubviews
{
  NSString *v3;
  UILabel *v4;
  UILabel *usageLabel;
  void *v6;
  double v7;
  double v8;
  double v9;
  UIImageView *v10;
  UIImageView *deltaAverageImageView;
  void *v12;
  double v13;
  UILabel *v14;
  UILabel *deltaAverageLabel;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  void *v20;
  UILabel *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  UIImageView *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  UILabel *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  UILabel *v51;
  UILabel *titleLabel;
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
  NSLayoutConstraint *v65;
  NSLayoutConstraint *deltaAverageImageViewWidthConstraint;
  void *v67;
  NSLayoutConstraint *v68;
  NSLayoutConstraint *deltaAverageImageViewHeightConstraint;
  void *v70;
  void *v71;
  NSLayoutConstraint *v72;
  NSLayoutConstraint *deltaAverageImageViewVerticalPosition;
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
  id v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;

  v111 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)*MEMORY[0x24BEBDF78], "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  self->_hasMultilineLayout = UIContentSizeCategoryIsAccessibilityCategory(v3);

  self->_previousWidth = 0.0;
  v4 = (UILabel *)objc_opt_new();
  usageLabel = self->_usageLabel;
  self->_usageLabel = v4;

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE210]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_usageLabel, "setFont:", v6);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_usageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v7) = 1144750080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_usageLabel, "setContentHuggingPriority:forAxis:", 0, v7);
  LODWORD(v8) = 1144750080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_usageLabel, "setContentHuggingPriority:forAxis:", 1, v8);
  LODWORD(v9) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_usageLabel, "setContentCompressionResistancePriority:forAxis:", 1, v9);
  v10 = (UIImageView *)objc_opt_new();
  deltaAverageImageView = self->_deltaAverageImageView;
  self->_deltaAverageImageView = v10;

  if (self->_useVibrancy)
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemDarkGrayColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_deltaAverageImageView, "setTintColor:", v12);

  -[UIImageView setAdjustsImageSizeForAccessibilityContentSizeCategory:](self->_deltaAverageImageView, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_deltaAverageImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v13) = 1144750080;
  -[UIImageView setContentHuggingPriority:forAxis:](self->_deltaAverageImageView, "setContentHuggingPriority:forAxis:", 0, v13);
  v14 = (UILabel *)objc_opt_new();
  deltaAverageLabel = self->_deltaAverageLabel;
  self->_deltaAverageLabel = v14;

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_deltaAverageLabel, "setTextColor:", v16);

  v17 = *MEMORY[0x24BEBE1D0];
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_deltaAverageLabel, "setFont:", v18);

  if (!self->_truncateAverageLabel)
  {
    -[UILabel setNumberOfLines:](self->_deltaAverageLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](self->_deltaAverageLabel, "setLineBreakMode:", 0);
  }
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_deltaAverageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v19) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_deltaAverageLabel, "setContentCompressionResistancePriority:forAxis:", 1, v19);
  v106 = (void *)objc_opt_new();
  if (self->_useVibrancy)
  {
    objc_msgSend(MEMORY[0x24BEBDAF0], "widgetEffectForVibrancyStyle:", 101);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v103);
    objc_msgSend(v102, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[STUsageSummaryTitleView addSubview:](self, "addSubview:", v102);
    objc_msgSend(v102, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", self->_usageLabel);
    v21 = self->_usageLabel;
    v101 = v20;
    objc_msgSend(v101, "topAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel topAnchor](v21, "topAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "constraintEqualToAnchor:", v99);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = v97;
    objc_msgSend(v101, "leadingAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v21, "leadingAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "constraintEqualToAnchor:", v91);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = v22;
    objc_msgSend(v101, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v21, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v25;
    objc_msgSend(v101, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel trailingAnchor](v21, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = v28;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v107, 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v106, "addObjectsFromArray:", v29);
    objc_msgSend(MEMORY[0x24BEBDAF0], "widgetEffectForVibrancyStyle:", 101);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v105);
    objc_msgSend(v100, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[STUsageSummaryTitleView addSubview:](self, "addSubview:", v100);
    objc_msgSend(v100, "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addSubview:", self->_deltaAverageImageView);
    v31 = self->_deltaAverageImageView;
    v98 = v30;
    objc_msgSend(v98, "topAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView topAnchor](v31, "topAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "constraintEqualToAnchor:", v92);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = v89;
    objc_msgSend(v98, "leadingAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView leadingAnchor](v31, "leadingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "constraintEqualToAnchor:", v85);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = v32;
    objc_msgSend(v98, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v31, "bottomAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v35;
    objc_msgSend(v98, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIImageView trailingAnchor](v31, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = v38;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v107, 4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v106, "addObjectsFromArray:", v39);
    v96 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v105);
    objc_msgSend(v96, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[STUsageSummaryTitleView addSubview:](self, "addSubview:", v96);
    objc_msgSend(v96, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addSubview:", self->_deltaAverageLabel);
    v41 = self->_deltaAverageLabel;
    v42 = v40;
    objc_msgSend(v42, "topAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel topAnchor](v41, "topAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:", v90);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = v88;
    objc_msgSend(v42, "leadingAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v41, "leadingAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "constraintEqualToAnchor:", v84);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = v83;
    objc_msgSend(v42, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v41, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v45;
    objc_msgSend(v42, "trailingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel trailingAnchor](v41, "trailingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = v48;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v107, 4);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = v106;
    objc_msgSend(v106, "addObjectsFromArray:", v49);

  }
  else
  {
    -[STUsageSummaryTitleView addSubview:](self, "addSubview:", self->_usageLabel);
    -[STUsageSummaryTitleView addSubview:](self, "addSubview:", self->_deltaAverageImageView);
    -[STUsageSummaryTitleView addSubview:](self, "addSubview:", self->_deltaAverageLabel);
    v51 = (UILabel *)objc_opt_new();
    titleLabel = self->_titleLabel;
    self->_titleLabel = v51;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v17);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_titleLabel, "setFont:", v53);

    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v54);

    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 0);
    -[STUsageSummaryTitleView addSubview:](self, "addSubview:", self->_titleLabel);
    -[UILabel topAnchor](self->_titleLabel, "topAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUsageSummaryTitleView topAnchor](self, "topAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v106;
    objc_msgSend(v106, "addObject:", v57);

    -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUsageSummaryTitleView leadingAnchor](self, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "addObject:", v60);

    -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUsageSummaryTitleView trailingAnchor](self, "trailingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "addObject:", v63);

  }
  -[UIImageView widthAnchor](self->_deltaAverageImageView, "widthAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToConstant:", 0.0);
  v65 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  deltaAverageImageViewWidthConstraint = self->_deltaAverageImageViewWidthConstraint;
  self->_deltaAverageImageViewWidthConstraint = v65;

  objc_msgSend(v50, "addObject:", self->_deltaAverageImageViewWidthConstraint);
  -[UIImageView heightAnchor](self->_deltaAverageImageView, "heightAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToConstant:", 0.0);
  v68 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  deltaAverageImageViewHeightConstraint = self->_deltaAverageImageViewHeightConstraint;
  self->_deltaAverageImageViewHeightConstraint = v68;

  objc_msgSend(v50, "addObject:", self->_deltaAverageImageViewHeightConstraint);
  -[UIImageView bottomAnchor](self->_deltaAverageImageView, "bottomAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel firstBaselineAnchor](self->_deltaAverageLabel, "firstBaselineAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:", v71);
  v72 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  deltaAverageImageViewVerticalPosition = self->_deltaAverageImageViewVerticalPosition;
  self->_deltaAverageImageViewVerticalPosition = v72;

  objc_msgSend(v50, "addObject:", self->_deltaAverageImageViewVerticalPosition);
  -[UILabel leadingAnchor](self->_usageLabel, "leadingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageSummaryTitleView leadingAnchor](self, "leadingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:", v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addObject:", v76);

  -[UILabel leadingAnchor](self->_deltaAverageLabel, "leadingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView leadingAnchor](self->_deltaAverageImageView, "leadingAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:", v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addObject:", v79);

  -[UILabel trailingAnchor](self->_deltaAverageLabel, "trailingAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageSummaryTitleView trailingAnchor](self, "trailingAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:", v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addObject:", v82);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v50);
}

- (void)setUsageItemType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
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
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  if (self->_usageItemType != a3)
  {
    self->_usageItemType = a3;
    if (a3 == 5)
    {
      objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "circleImageWithFillColor:fillDiameter:outlineColor:outlineWidth:", v5, 0, 9.0, 0.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v23);
      objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v6, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
      -[STUsageSummaryTitleView setNotificationDot:](self, "setNotificationDot:", v6);
      -[STUsageSummaryTitleView addSubview:](self, "addSubview:", v6);
      -[STUsageSummaryTitleView usageLabel](self, "usageLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "font");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ascender");
      v10 = v9 + -4.5;

      v20 = (void *)MEMORY[0x24BDD1628];
      objc_msgSend(v6, "leadingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "trailingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, 3.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v11;
      objc_msgSend(v6, "heightAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "widthAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v14;
      objc_msgSend(v7, "lastBaselineAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "topAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[2] = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "activateConstraints:", v18);

    }
    else
    {
      -[STUsageSummaryTitleView notificationDot](self, "notificationDot");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeFromSuperview");

      -[STUsageSummaryTitleView setNotificationDot:](self, "setNotificationDot:", 0);
    }
  }
}

- (void)setUsageReport:(id)a3
{
  objc_storeStrong((id *)&self->_usageReport, a3);
  -[STUsageSummaryTitleView _updateTitleLabel](self, "_updateTitleLabel");
  -[STUsageSummaryTitleView _updateUsageLabel](self, "_updateUsageLabel");
  -[STUsageSummaryTitleView _updateDeltaAverageViews](self, "_updateDeltaAverageViews");
  -[STUsageSummaryTitleView _setUpConstraints](self, "_setUpConstraints");
}

- (void)_updateTitleLabel
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
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  -[STUsageSummaryTitleView titleLabel](self, "titleLabel");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  -[STUsageSummaryTitleView usageReport](self, "usageReport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reportDateInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "type");
  if (!v8)
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 0x2000, -1, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isDate:equalToDate:toUnitGranularity:", v5, v9, 0x2000))
    {
      v13 = CFSTR("CurrentWeekDailyAverageTitle");
    }
    else
    {
      if (!objc_msgSend(v6, "isDate:equalToDate:toUnitGranularity:", v5, v10, 0x2000))
      {
        v11 = (void *)objc_opt_new();
        objc_msgSend(v11, "setDateTemplate:", CFSTR("MMMdd"));
        objc_msgSend(v11, "stringFromDateInterval:", v4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("WeekDailyAverageTitleFormat"), &stru_24DB8A1D0, 0);
        v25 = v10;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v20, "initWithFormat:locale:", v19, v21, v23);
        objc_msgSend(v26, "setText:", v22);

        v10 = v25;
        goto LABEL_16;
      }
      v13 = CFSTR("LastWeekDailyAverageTitle");
    }
    objc_msgSend(v7, "localizedStringForKey:value:table:", v13, &stru_24DB8A1D0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setText:", v11);
LABEL_16:

    goto LABEL_17;
  }
  if (v8 == 1)
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setFormattingContext:", 2);
    objc_msgSend(v9, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMMd"));
    objc_msgSend(v9, "stringFromDate:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isDateInToday:", v5))
    {
      v12 = CFSTR("TodayScreenTimeFormat");
    }
    else
    {
      if (!objc_msgSend(v6, "isDateInYesterday:", v5))
      {
        v16 = objc_msgSend(v6, "component:fromDate:", 512, v5);
        objc_msgSend(v6, "standaloneWeekdaySymbols");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", v16 - 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("WeekdayScreenTimeFormat"), &stru_24DB8A1D0, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v10;
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:locale:", v15, v11, v14, v10);
        objc_msgSend(v26, "setText:", v18);

        v10 = v24;
        goto LABEL_14;
      }
      v12 = CFSTR("YesterdayScreenTimeFormat");
    }
    objc_msgSend(v7, "localizedStringForKey:value:table:", v12, &stru_24DB8A1D0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:locale:", v14, v11, v10);
    objc_msgSend(v26, "setText:", v15);
LABEL_14:

    goto LABEL_16;
  }
LABEL_17:

}

- (void)_updateUsageLabel
{
  void *v4;
  unint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  BOOL v22;
  double v23;
  id v24;

  -[STUsageSummaryTitleView usageLabel](self, "usageLabel");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[STUsageSummaryTitleView usageReport](self, "usageReport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[STUsageSummaryTitleView usageItemType](self, "usageItemType");
  if (v5 == 6)
  {
    v10 = objc_msgSend(v4, "totalPickups");
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("PickupsCount");
LABEL_10:
    objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_24DB8A1D0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v4, "type");
    if (v15)
    {
      if (v15 != 1)
      {
LABEL_19:

        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%lu"), 0, v10);
    }
    else
    {
      objc_msgSend(v4, "activePickupDateIntervals");
      v17 = 0.0;
      if (v16 > 0.0)
        v17 = (double)v10 / v16;
      objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%lu"), 0, vcvtad_u64_f64(v17));
    }
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v19 = (void *)v18;
    objc_msgSend(v24, "setText:", v18);

    goto LABEL_19;
  }
  if (v5 == 5)
  {
    v10 = objc_msgSend(v4, "totalNotifications");
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("NotificationsCount");
    goto LABEL_10;
  }
  if (v5 != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUsageSummaryTitleView.m"), 306, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NO"));
    goto LABEL_19;
  }
  objc_msgSend(v4, "totalScreenTime");
  v7 = v6;
  v8 = objc_msgSend(v4, "type");
  if (!v8)
  {
    v14 = (void *)objc_opt_new();
    objc_msgSend(v14, "setAllowedUnits:", 96);
    objc_msgSend(v14, "setUnitsStyle:", 1);
    objc_msgSend(v4, "activePickupDateIntervals");
    v21 = v7 / v20;
    v22 = v20 <= 0.0;
    v23 = 0.0;
    if (!v22)
      v23 = v21;
    objc_msgSend(v14, "stringFromTimeInterval:", v23);
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (v8 == 1)
  {
    if (v7 >= 60.0)
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend(v9, "setAllowedUnits:", 96);
      objc_msgSend(v9, "setUnitsStyle:", 1);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD14F8], "st_sharedAbbreviatedSecondsDateFormatter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "stringFromTimeInterval:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "setText:", v14);
    goto LABEL_19;
  }
LABEL_20:

}

- (void)_updateDeltaAverageViews
{
  void *v4;
  unint64_t v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  id v34;
  NSString *v35;
  double v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x24BDAC8D0];
  -[STUsageSummaryTitleView usageReport](self, "usageReport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[STUsageSummaryTitleView usageItemType](self, "usageItemType");
  switch(v5)
  {
    case 6uLL:
      objc_msgSend(v4, "pickupDeltaFromHistoricalAverage");
      break;
    case 5uLL:
      objc_msgSend(v4, "notificationDeltaFromHistoricalAverage");
      break;
    case 1uLL:
      objc_msgSend(v4, "screenTimeDeltaFromHistoricalAverage");
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUsageSummaryTitleView.m"), 331, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NO"));

      goto LABEL_31;
  }
  v7 = v6;
  if (objc_msgSend(v4, "type"))
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    goto LABEL_21;
  }
  if (v7 >= 0.05 && v7 <= 2.0)
  {
    v16 = (void *)MEMORY[0x24BEBD640];
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "imageNamed:inBundle:", CFSTR("AverageUp"), v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("WeeklyUsageTotalDeltaAverageFormat"), &stru_24DB8A1D0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x24BDD16F0];
    v20 = (void *)MEMORY[0x24BDD16E0];
    v21 = v7;
LABEL_20:
    objc_msgSend(v20, "numberWithDouble:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringFromNumber:numberStyle:", v22, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_21;
  }
  v8 = 0;
  if (v7 >= -0.9)
  {
    v9 = 0;
    v10 = 0;
    if (v7 > -0.05)
      goto LABEL_21;
    v12 = (void *)MEMORY[0x24BEBD640];
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageNamed:inBundle:", CFSTR("AverageDown"), v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("WeeklyUsageTotalDeltaAverageFormat"), &stru_24DB8A1D0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x24BDD16F0];
    v20 = (void *)MEMORY[0x24BDD16E0];
    v21 = -v7;
    if (v7 >= 0.0)
      v21 = v7;
    goto LABEL_20;
  }
  v9 = 0;
  v10 = 0;
LABEL_21:
  -[STUsageSummaryTitleView deltaAverageImageView](self, "deltaAverageImageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setImage:", v10);
  objc_msgSend(v23, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v25 = v24;
  v27 = v26;
  -[STUsageSummaryTitleView deltaAverageImageViewWidthConstraint](self, "deltaAverageImageViewWidthConstraint");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setConstant:", v25);

  -[STUsageSummaryTitleView deltaAverageImageViewHeightConstraint](self, "deltaAverageImageViewHeightConstraint");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setConstant:", v27);

  if (v9 && v8)
  {
    v48 = v10;
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), 0, v8);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUsageSummaryTitleView deltaAverageLabel](self, "deltaAverageLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[STUsageSummaryTitleView truncateAverageLabel](self, "truncateAverageLabel");
    v33 = (void *)*MEMORY[0x24BEBDF78];
    v34 = v30;
    objc_msgSend(v33, "preferredContentSizeCategory");
    v35 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (UIContentSizeCategoryIsAccessibilityCategory(v35))
      v36 = 8.0;
    else
      v36 = 4.0;

    objc_msgSend(MEMORY[0x24BEBB490], "defaultParagraphStyle");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v37, "mutableCopy");

    objc_msgSend(v38, "setFirstLineHeadIndent:", v25 + v36);
    if (v32)
      objc_msgSend(v38, "setLineBreakMode:", 4);
    v39 = objc_alloc(MEMORY[0x24BDD1458]);
    v49 = *MEMORY[0x24BEBB3A8];
    v50[0] = v38;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v39, "initWithString:attributes:", v34, v40);

    objc_msgSend(v31, "setAttributedText:", v41);
    objc_msgSend(v31, "font");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "capHeight");
    v44 = v43;

    -[STUsageSummaryTitleView deltaAverageImageViewVerticalPosition](self, "deltaAverageImageViewVerticalPosition");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setConstant:", (v27 - v44) * 0.5);

    v10 = v48;
  }
  else
  {
    -[STUsageSummaryTitleView deltaAverageLabel](self, "deltaAverageLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setAttributedText:", 0);

    -[STUsageSummaryTitleView deltaAverageImageViewVerticalPosition](self, "deltaAverageImageViewVerticalPosition");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setConstant:", 0.0);

  }
LABEL_31:

}

- (void)_setUpConstraints
{
  double Width;
  _BOOL4 v4;
  _BOOL4 v6;
  _BOOL8 v7;
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
  int v37;
  int v38;
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
  double v56;
  double v57;
  double v58;
  id v59;
  CGRect v60;

  -[STUsageSummaryTitleView frame](self, "frame");
  Width = CGRectGetWidth(v60);
  -[STUsageSummaryTitleView setPreviousWidth:](self, "setPreviousWidth:");
  v4 = -[STUsageSummaryTitleView truncateAverageLabel](self, "truncateAverageLabel");
  if (Width <= 0.0 || v4)
    Width = 1.79769313e308;
  -[STUsageSummaryTitleView variableConstraints](self, "variableConstraints");
  v59 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[STUsageSummaryTitleView hasMultilineLayout](self, "hasMultilineLayout");
  v7 = -[STUsageSummaryTitleView _shouldHaveMultilineLayoutForLineWidth:](self, "_shouldHaveMultilineLayoutForLineWidth:", Width);
  v8 = v59;
  if (!v59 || v6 != v7)
  {
    -[STUsageSummaryTitleView titleLabel](self, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUsageSummaryTitleView usageLabel](self, "usageLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUsageSummaryTitleView deltaAverageImageView](self, "deltaAverageImageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUsageSummaryTitleView deltaAverageLabel](self, "deltaAverageLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_opt_new();
    objc_msgSend(v10, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (v9)
        objc_msgSend(v9, "bottomAnchor");
      else
        -[STUsageSummaryTitleView topAnchor](self, "topAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v21);

      objc_msgSend(v10, "trailingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUsageSummaryTitleView trailingAnchor](self, "trailingAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintLessThanOrEqualToAnchor:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v24);

      objc_msgSend(v11, "leadingAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUsageSummaryTitleView leadingAnchor](self, "leadingAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v27);

      objc_msgSend(v12, "topAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bottomAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v30);

      objc_msgSend(v12, "bottomAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUsageSummaryTitleView bottomAnchor](self, "bottomAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v33);

      objc_msgSend(v12, "trailingAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUsageSummaryTitleView trailingAnchor](self, "trailingAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToAnchor:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 1144750080;
      v38 = 1132068864;
    }
    else
    {
      if (v9)
      {
        objc_msgSend(v9, "bottomAnchor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "constraintGreaterThanOrEqualToAnchor:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v16);

        objc_msgSend(v11, "topAnchor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bottomAnchor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "constraintGreaterThanOrEqualToAnchor:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v19);

        objc_msgSend(v12, "topAnchor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bottomAnchor");
      }
      else
      {
        -[STUsageSummaryTitleView topAnchor](self, "topAnchor");
      }
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintGreaterThanOrEqualToAnchor:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v40);

      objc_msgSend(v10, "lastBaselineAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastBaselineAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintEqualToAnchor:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v43);

      objc_msgSend(v10, "bottomAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUsageSummaryTitleView bottomAnchor](self, "bottomAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "constraintEqualToAnchor:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v46);

      objc_msgSend(v11, "leadingAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "trailingAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "constraintGreaterThanOrEqualToAnchor:constant:", v48, 8.0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v49);

      objc_msgSend(v12, "topAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUsageSummaryTitleView topAnchor](self, "topAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "constraintGreaterThanOrEqualToAnchor:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v52);

      objc_msgSend(v12, "trailingAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUsageSummaryTitleView trailingAnchor](self, "trailingAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "constraintEqualToAnchor:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v55);

      objc_msgSend(v12, "bottomAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUsageSummaryTitleView bottomAnchor](self, "bottomAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintLessThanOrEqualToAnchor:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 1132068864;
      v38 = 1144750080;
    }
    objc_msgSend(v13, "addObject:", v36);

    LODWORD(v56) = v38;
    objc_msgSend(v12, "setContentHuggingPriority:forAxis:", 0, v56);
    LODWORD(v57) = v37;
    objc_msgSend(v12, "setContentHuggingPriority:forAxis:", 1, v57);
    LODWORD(v58) = v37;
    objc_msgSend(v12, "setContentCompressionResistancePriority:forAxis:", 0, v58);
    if (v59)
      objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", v59);
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v13);
    -[STUsageSummaryTitleView setVariableConstraints:](self, "setVariableConstraints:", v13);
    -[STUsageSummaryTitleView setHasMultilineLayout:](self, "setHasMultilineLayout:", v7);

    v8 = v59;
  }

}

- (BOOL)_shouldHaveMultilineLayoutForLineWidth:(double)a3
{
  NSString *v5;
  BOOL IsAccessibilityCategory;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;

  objc_msgSend((id)*MEMORY[0x24BEBDF78], "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  if (IsAccessibilityCategory)
    return 1;
  -[STUsageSummaryTitleView usageLabel](self, "usageLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", a3, 1.79769313e308);
  v10 = v9;
  v12 = v11;

  v13 = a3 - v10;
  if (v13 <= 0.0)
    return 0;
  -[STUsageSummaryTitleView deltaAverageImageView](self, "deltaAverageImageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v16 = v15;

  v17 = v13 - (v16 + 8.0);
  if (v17 <= 0.0)
    return 0;
  -[STUsageSummaryTitleView deltaAverageLabel](self, "deltaAverageLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sizeThatFits:", v17, 1.79769313e308);
  v20 = v19;

  return v20 > v12 + v12;
}

- (unint64_t)usageItemType
{
  return self->_usageItemType;
}

- (STUsageReport)usageReport
{
  return self->_usageReport;
}

- (BOOL)hasMultilineLayout
{
  return self->_hasMultilineLayout;
}

- (void)setHasMultilineLayout:(BOOL)a3
{
  self->_hasMultilineLayout = a3;
}

- (BOOL)useVibrancy
{
  return self->_useVibrancy;
}

- (BOOL)truncateAverageLabel
{
  return self->_truncateAverageLabel;
}

- (double)previousWidth
{
  return self->_previousWidth;
}

- (void)setPreviousWidth:(double)a3
{
  self->_previousWidth = a3;
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_getProperty(self, a2, 448, 1);
}

- (UILabel)usageLabel
{
  return (UILabel *)objc_getProperty(self, a2, 456, 1);
}

- (UIImageView)notificationDot
{
  return (UIImageView *)objc_getProperty(self, a2, 464, 1);
}

- (void)setNotificationDot:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 464);
}

- (UIImageView)deltaAverageImageView
{
  return (UIImageView *)objc_getProperty(self, a2, 472, 1);
}

- (UILabel)deltaAverageLabel
{
  return (UILabel *)objc_getProperty(self, a2, 480, 1);
}

- (NSArray)variableConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 488, 1);
}

- (void)setVariableConstraints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 488);
}

- (NSLayoutConstraint)deltaAverageImageViewVerticalPosition
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 496, 1);
}

- (NSLayoutConstraint)deltaAverageImageViewWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 504, 1);
}

- (NSLayoutConstraint)deltaAverageImageViewHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 512, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deltaAverageImageViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_deltaAverageImageViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_deltaAverageImageViewVerticalPosition, 0);
  objc_storeStrong((id *)&self->_variableConstraints, 0);
  objc_storeStrong((id *)&self->_deltaAverageLabel, 0);
  objc_storeStrong((id *)&self->_deltaAverageImageView, 0);
  objc_storeStrong((id *)&self->_notificationDot, 0);
  objc_storeStrong((id *)&self->_usageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_usageReport, 0);
}

@end
