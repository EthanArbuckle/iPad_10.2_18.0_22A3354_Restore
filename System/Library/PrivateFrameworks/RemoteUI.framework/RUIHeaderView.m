@implementation RUIHeaderView

- (double)_headerOffsetInView:(id)a3
{
  void *v4;
  uint64_t v5;
  double result;

  objc_msgSend(a3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "horizontalSizeClass");

  result = 36.0;
  if (v5 == 1)
    result = 26.0;
  if (!self->_isFirstSection)
    return 16.0;
  return result;
}

- (id)_makeSpacer
{
  id v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  v2 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(v2, "setUserInteractionEnabled:", 0);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v2, "heightAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToConstant:", 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = 1132068864;
  objc_msgSend(v4, "setPriority:", v5);
  objc_msgSend(v4, "setActive:", 1);
  LODWORD(v6) = 1112014848;
  objc_msgSend(v2, "setContentHuggingPriority:forAxis:", 0, v6);
  LODWORD(v7) = 1112014848;
  objc_msgSend(v2, "setContentCompressionResistancePriority:forAxis:", 0, v7);

  return v2;
}

- (RUIHeaderView)initWithAttributes:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  RUIHeaderView *v7;
  uint64_t v8;
  UILabel *headerLabel;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  UIImageView *iconView;
  uint64_t v16;
  UIView *iconLeadingSpacer;
  uint64_t v18;
  UIView *iconTrailingSpacer;
  void *v20;
  uint64_t v21;
  UIStackView *iconStackView;
  double v23;
  uint64_t v24;
  UIView *headerLeadingSpacer;
  uint64_t v26;
  UIView *headerTrailingSpacer;
  void *v28;
  uint64_t v29;
  UIStackView *headerStackView;
  uint64_t v31;
  UIView *subHeaderLeadingSpacer;
  uint64_t v33;
  UIView *subHeaderTrailingSpacer;
  void *v35;
  void *v36;
  uint64_t v37;
  UIStackView *subHeaderStackView;
  uint64_t v39;
  UIView *navTitleLeadingSpacer;
  uint64_t v41;
  UIView *navTitleTrailingSpacer;
  void *v43;
  void *v44;
  uint64_t v45;
  UIStackView *navTitleStackView;
  uint64_t v47;
  UIView *navSubtitleLeadingSpacer;
  uint64_t v49;
  UIView *navSubtitleTrailingSpacer;
  void *v51;
  void *v52;
  uint64_t v53;
  UIStackView *navSubtitleStackView;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  UIStackView *labelsStackView;
  double v61;
  RUILinkLabel *v62;
  RUILinkLabel *detailHeaderLabel;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  void *v70;
  double v71;
  id v72;
  void *v73;
  uint64_t v74;
  UIStackView *mainStackView;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  objc_super v95;
  _QWORD v96[4];
  _QWORD v97[3];
  _QWORD v98[6];
  _QWORD v99[3];
  _QWORD v100[3];
  _QWORD v101[3];
  _QWORD v102[3];
  _QWORD v103[5];

  v103[3] = *MEMORY[0x24BDAC8D0];
  v95.receiver = self;
  v95.super_class = (Class)RUIHeaderView;
  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v7 = -[RUIHeaderView initWithFrame:](&v95, sel_initWithFrame_, a3, *MEMORY[0x24BDBF090], v4, v5, v6);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v3, v4, v5, v6);
    headerLabel = v7->_headerLabel;
    v7->_headerLabel = (UILabel *)v8;

    RemoteUIHeaderFont();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7->_headerLabel, "setFont:", v10);

    RemoteUIHeaderTextColor();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v7->_headerLabel, "setTextColor:", v11);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v7->_headerLabel, "setBackgroundColor:", v12);

    -[UILabel setNumberOfLines:](v7->_headerLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7->_headerLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v13) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v7->_headerLabel, "setContentCompressionResistancePriority:forAxis:", 0, v13);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithFrame:", v3, v4, v5, v6);
    iconView = v7->_iconView;
    v7->_iconView = (UIImageView *)v14;

    -[RUIHeaderView _makeSpacer](v7, "_makeSpacer");
    v16 = objc_claimAutoreleasedReturnValue();
    iconLeadingSpacer = v7->_iconLeadingSpacer;
    v7->_iconLeadingSpacer = (UIView *)v16;

    -[RUIHeaderView _makeSpacer](v7, "_makeSpacer");
    v18 = objc_claimAutoreleasedReturnValue();
    iconTrailingSpacer = v7->_iconTrailingSpacer;
    v7->_iconTrailingSpacer = (UIView *)v18;

    v103[0] = v7->_iconLeadingSpacer;
    v103[1] = v7->_iconView;
    v103[2] = v7->_iconTrailingSpacer;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v103, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIHeaderView _paddedStackViewWithArrangedSubviews:](v7, "_paddedStackViewWithArrangedSubviews:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    iconStackView = v7->_iconStackView;
    v7->_iconStackView = (UIStackView *)v21;

    LODWORD(v23) = 1148846080;
    -[UIStackView setContentHuggingPriority:forAxis:](v7->_iconStackView, "setContentHuggingPriority:forAxis:", 0, v23);
    -[RUIHeaderView _makeSpacer](v7, "_makeSpacer");
    v24 = objc_claimAutoreleasedReturnValue();
    headerLeadingSpacer = v7->_headerLeadingSpacer;
    v7->_headerLeadingSpacer = (UIView *)v24;

    -[RUIHeaderView _makeSpacer](v7, "_makeSpacer");
    v26 = objc_claimAutoreleasedReturnValue();
    headerTrailingSpacer = v7->_headerTrailingSpacer;
    v7->_headerTrailingSpacer = (UIView *)v26;

    v102[0] = v7->_headerLeadingSpacer;
    v102[1] = v7->_headerLabel;
    v102[2] = v7->_headerTrailingSpacer;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v102, 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIHeaderView _paddedStackViewWithArrangedSubviews:](v7, "_paddedStackViewWithArrangedSubviews:", v28);
    v29 = objc_claimAutoreleasedReturnValue();
    headerStackView = v7->_headerStackView;
    v7->_headerStackView = (UIStackView *)v29;

    -[RUIHeaderView _makeSpacer](v7, "_makeSpacer");
    v31 = objc_claimAutoreleasedReturnValue();
    subHeaderLeadingSpacer = v7->_subHeaderLeadingSpacer;
    v7->_subHeaderLeadingSpacer = (UIView *)v31;

    -[RUIHeaderView _makeSpacer](v7, "_makeSpacer");
    v33 = objc_claimAutoreleasedReturnValue();
    subHeaderTrailingSpacer = v7->_subHeaderTrailingSpacer;
    v7->_subHeaderTrailingSpacer = (UIView *)v33;

    v101[0] = v7->_subHeaderLeadingSpacer;
    -[RUIHeaderView subHeaderLabel](v7, "subHeaderLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v101[1] = v35;
    v101[2] = v7->_subHeaderTrailingSpacer;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v101, 3);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIHeaderView _paddedStackViewWithArrangedSubviews:](v7, "_paddedStackViewWithArrangedSubviews:", v36);
    v37 = objc_claimAutoreleasedReturnValue();
    subHeaderStackView = v7->_subHeaderStackView;
    v7->_subHeaderStackView = (UIStackView *)v37;

    -[RUIHeaderView _makeSpacer](v7, "_makeSpacer");
    v39 = objc_claimAutoreleasedReturnValue();
    navTitleLeadingSpacer = v7->_navTitleLeadingSpacer;
    v7->_navTitleLeadingSpacer = (UIView *)v39;

    -[RUIHeaderView _makeSpacer](v7, "_makeSpacer");
    v41 = objc_claimAutoreleasedReturnValue();
    navTitleTrailingSpacer = v7->_navTitleTrailingSpacer;
    v7->_navTitleTrailingSpacer = (UIView *)v41;

    v100[0] = v7->_navTitleLeadingSpacer;
    -[RUIHeaderView navTitleLabel](v7, "navTitleLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v100[1] = v43;
    v100[2] = v7->_navTitleTrailingSpacer;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v100, 3);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIHeaderView _paddedStackViewWithArrangedSubviews:](v7, "_paddedStackViewWithArrangedSubviews:", v44);
    v45 = objc_claimAutoreleasedReturnValue();
    navTitleStackView = v7->_navTitleStackView;
    v7->_navTitleStackView = (UIStackView *)v45;

    -[UIStackView setHidden:](v7->_navTitleStackView, "setHidden:", 1);
    -[RUIHeaderView _makeSpacer](v7, "_makeSpacer");
    v47 = objc_claimAutoreleasedReturnValue();
    navSubtitleLeadingSpacer = v7->_navSubtitleLeadingSpacer;
    v7->_navSubtitleLeadingSpacer = (UIView *)v47;

    -[RUIHeaderView _makeSpacer](v7, "_makeSpacer");
    v49 = objc_claimAutoreleasedReturnValue();
    navSubtitleTrailingSpacer = v7->_navSubtitleTrailingSpacer;
    v7->_navSubtitleTrailingSpacer = (UIView *)v49;

    v99[0] = v7->_navSubtitleLeadingSpacer;
    -[RUIHeaderView navSubHeaderLabel](v7, "navSubHeaderLabel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v99[1] = v51;
    v99[2] = v7->_navSubtitleTrailingSpacer;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v99, 3);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIHeaderView _paddedStackViewWithArrangedSubviews:](v7, "_paddedStackViewWithArrangedSubviews:", v52);
    v53 = objc_claimAutoreleasedReturnValue();
    navSubtitleStackView = v7->_navSubtitleStackView;
    v7->_navSubtitleStackView = (UIStackView *)v53;

    -[UIStackView setHidden:](v7->_navSubtitleStackView, "setHidden:", 1);
    v55 = objc_alloc(MEMORY[0x24BEBD978]);
    -[RUIHeaderView _makeSpacer](v7, "_makeSpacer");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v98[0] = v56;
    v98[1] = v7->_navTitleStackView;
    v98[2] = v7->_navSubtitleStackView;
    v98[3] = v7->_headerStackView;
    v98[4] = v7->_subHeaderStackView;
    -[RUIHeaderView _makeSpacer](v7, "_makeSpacer");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v98[5] = v57;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v98, 6);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v55, "initWithArrangedSubviews:", v58);
    labelsStackView = v7->_labelsStackView;
    v7->_labelsStackView = (UIStackView *)v59;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v7->_labelsStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v7->_labelsStackView, "setAxis:", 1);
    -[UIStackView setAlignment:](v7->_labelsStackView, "setAlignment:", 0);
    -[UIStackView setDistribution:](v7->_labelsStackView, "setDistribution:", 3);
    LODWORD(v61) = 1132068864;
    -[UIStackView setContentHuggingPriority:forAxis:](v7->_labelsStackView, "setContentHuggingPriority:forAxis:", 0, v61);
    v62 = -[RUILinkLabel initWithFrame:]([RUILinkLabel alloc], "initWithFrame:", v3, v4, v5, v6);
    detailHeaderLabel = v7->_detailHeaderLabel;
    v7->_detailHeaderLabel = v62;

    RemoteUIHeaderFont();
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUILinkLabel textLabel](v7->_detailHeaderLabel, "textLabel");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setFont:", v64);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUILinkLabel textLabel](v7->_detailHeaderLabel, "textLabel");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setBackgroundColor:", v66);

    -[RUILinkLabel setTranslatesAutoresizingMaskIntoConstraints:](v7->_detailHeaderLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[RUILinkLabel setNumberOfLines:](v7->_detailHeaderLabel, "setNumberOfLines:", 1);
    -[RUILinkLabel setLineBreakMode:](v7->_detailHeaderLabel, "setLineBreakMode:", 5);
    -[RUILinkLabel textLabel](v7->_detailHeaderLabel, "textLabel");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v69) = 1148846080;
    objc_msgSend(v68, "setContentCompressionResistancePriority:forAxis:", 0, v69);

    -[RUILinkLabel textLabel](v7->_detailHeaderLabel, "textLabel");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v71) = 1132068864;
    objc_msgSend(v70, "setContentHuggingPriority:forAxis:", 0, v71);

    -[RUILinkLabel setHidden:](v7->_detailHeaderLabel, "setHidden:", 1);
    v72 = objc_alloc(MEMORY[0x24BEBD978]);
    v97[0] = v7->_iconStackView;
    v97[1] = v7->_labelsStackView;
    v97[2] = v7->_detailHeaderLabel;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v97, 3);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v72, "initWithArrangedSubviews:", v73);
    mainStackView = v7->_mainStackView;
    v7->_mainStackView = (UIStackView *)v74;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v7->_mainStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAlignment:](v7->_mainStackView, "setAlignment:", 0);
    -[UIStackView setDistribution:](v7->_mainStackView, "setDistribution:", 0);
    -[UIImageView setContentMode:](v7->_iconView, "setContentMode:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v7->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[RUIHeaderView setLayoutMargins:](v7, "setLayoutMargins:", 0.0, 0.0, 8.0, 0.0);
    -[RUIHeaderView setLayoutMarginsFollowReadableWidth:](v7, "setLayoutMarginsFollowReadableWidth:", 0);
    -[RUIHeaderView setPreservesSuperviewLayoutMargins:](v7, "setPreservesSuperviewLayoutMargins:", 0);
    -[UIStackView setHidden:](v7->_iconStackView, "setHidden:", 1);
    v7->_imageLabelPadding = 12.0;
    -[RUIHeaderView addSubview:](v7, "addSubview:", v7->_mainStackView);
    v87 = (void *)MEMORY[0x24BDD1628];
    -[UIStackView leadingAnchor](v7->_mainStackView, "leadingAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIHeaderView layoutMarginsGuide](v7, "layoutMarginsGuide");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "leadingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:", v92);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v96[0] = v91;
    -[UIStackView topAnchor](v7->_mainStackView, "topAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIHeaderView layoutMarginsGuide](v7, "layoutMarginsGuide");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "topAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "constraintEqualToAnchor:", v88);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v96[1] = v86;
    -[UIStackView bottomAnchor](v7->_mainStackView, "bottomAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIHeaderView layoutMarginsGuide](v7, "layoutMarginsGuide");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "bottomAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToAnchor:", v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v96[2] = v79;
    -[UIStackView trailingAnchor](v7->_mainStackView, "trailingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIHeaderView layoutMarginsGuide](v7, "layoutMarginsGuide");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "trailingAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:", v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v96[3] = v83;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v96, 4);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "activateConstraints:", v84);

    -[RUIHeaderView _arrangeItems](v7, "_arrangeItems");
  }
  return v7;
}

- (id)_paddedStackViewWithArrangedSubviews:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BEBD978];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithArrangedSubviews:", v4);

  objc_msgSend(v5, "setAxis:", 0);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "setAlignment:", 3);
  objc_msgSend(v5, "setDistribution:", 3);
  return v5;
}

- (id)headerLabel
{
  return self->_headerLabel;
}

- (void)setText:(id)a3 attributes:(id)a4
{
  UILabel *headerLabel;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  UILabel *v11;
  void *v12;

  headerLabel = self->_headerLabel;
  v7 = a4;
  -[UILabel setText:](headerLabel, "setText:", a3);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("largeFont"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(headerLabel) = objc_msgSend(v8, "isEqualToString:", CFSTR("true"));
  if ((_DWORD)headerLabel)
  {
    self->_hasLargeIcon = 1;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 24.0, *MEMORY[0x24BEBB610]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE248]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self->_headerLabel;
    objc_msgSend(v10, "scaledFontForFont:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11, "setFont:", v12);

    -[UILabel setNumberOfLines:](self->_headerLabel, "setNumberOfLines:", 5);
    -[UILabel setMinimumScaleFactor:](self->_headerLabel, "setMinimumScaleFactor:", 0.5);
    -[UILabel setAdjustsFontSizeToFitWidth:](self->_headerLabel, "setAdjustsFontSizeToFitWidth:", 1);

  }
  -[RUIHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setHeaderAlignment:(int64_t)a3
{
  -[UILabel setTextAlignment:](self->_headerLabel, "setTextAlignment:", a3);
  -[RUIHeaderView _arrangeItems](self, "_arrangeItems");
}

- (void)setHeaderColor:(id)a3
{
  if (a3)
    -[UILabel setTextColor:](self->_headerLabel, "setTextColor:");
}

- (id)subHeaderLabel
{
  UILabel *subHeaderLabel;
  id v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  void *v8;
  void *v9;

  subHeaderLabel = self->_subHeaderLabel;
  if (!subHeaderLabel)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD708]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_subHeaderLabel;
    self->_subHeaderLabel = v5;

    RemoteUISubheaderFont();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_subHeaderLabel, "setFont:", v7);

    RemoteUISubheaderTextColor();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_subHeaderLabel, "setTextColor:", v8);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](self->_subHeaderLabel, "setBackgroundColor:", v9);

    -[UILabel setLineBreakMode:](self->_subHeaderLabel, "setLineBreakMode:", 0);
    -[UILabel setNumberOfLines:](self->_subHeaderLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subHeaderLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    subHeaderLabel = self->_subHeaderLabel;
  }
  return subHeaderLabel;
}

- (void)setSubHeaderText:(id)a3 attributes:(id)a4
{
  id v5;
  void *v6;

  v5 = a3;
  -[RUIHeaderView subHeaderLabel](self, "subHeaderLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  -[RUIHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSubHeaderAlignment:(int64_t)a3
{
  void *v5;

  -[RUIHeaderView subHeaderLabel](self, "subHeaderLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextAlignment:", a3);

  -[RUIHeaderView _arrangeItems](self, "_arrangeItems");
}

- (void)setSubHeaderColor:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[RUIHeaderView subHeaderLabel](self, "subHeaderLabel");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v4);

  }
}

- (void)setImageLabelPadding:(double)a3
{
  self->_imageLabelPadding = a3;
  -[RUIHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (id)detailHeaderLabel
{
  return self->_detailHeaderLabel;
}

- (void)setDetailText:(id)a3 attributes:(id)a4
{
  -[RUILinkLabel setText:](self->_detailHeaderLabel, "setText:", a3, a4);
  -[RUILinkLabel setHidden:](self->_detailHeaderLabel, "setHidden:", 0);
  -[RUIHeaderView _arrangeItems](self, "_arrangeItems");
}

- (void)setDetailHeaderColor:(id)a3
{
  RUILinkLabel *detailHeaderLabel;
  id v4;
  id v5;

  if (a3)
  {
    detailHeaderLabel = self->_detailHeaderLabel;
    v4 = a3;
    -[RUILinkLabel textLabel](detailHeaderLabel, "textLabel");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v4);

  }
}

- (id)iconImage
{
  return -[UIImageView image](self->_iconView, "image");
}

- (void)setIconImage:(id)a3
{
  -[UIImageView setImage:](self->_iconView, "setImage:", a3);
  -[UIStackView setHidden:](self->_iconStackView, "setHidden:", 0);
  -[RUIHeaderView _arrangeItems](self, "_arrangeItems");
}

- (void)setImageSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  height = a3.height;
  width = a3.width;
  v12[2] = *MEMORY[0x24BDAC8D0];
  -[UIImageView frame](self->_iconView, "frame");
  -[UIImageView setFrame:](self->_iconView, "setFrame:");
  self->_customIconSize = 1;
  -[UIStackView setHidden:](self->_iconStackView, "setHidden:", 0);
  v6 = (void *)MEMORY[0x24BDD1628];
  -[UIImageView widthAnchor](self->_iconView, "widthAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToConstant:", width);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  -[UIImageView heightAnchor](self->_iconView, "heightAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToConstant:", height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activateConstraints:", v11);

  -[RUIHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_arrangeItems
{
  UIStackView **p_iconStackView;
  RUILinkLabel **p_detailHeaderLabel;
  uint64_t imageAlignment;
  uint64_t v6;
  RUILinkLabel **v7;

  p_iconStackView = &self->_iconStackView;
  -[UIStackView removeFromSuperview](self->_iconStackView, "removeFromSuperview");
  -[UIStackView removeFromSuperview](self->_labelsStackView, "removeFromSuperview");
  p_detailHeaderLabel = &self->_detailHeaderLabel;
  -[RUILinkLabel removeFromSuperview](self->_detailHeaderLabel, "removeFromSuperview");
  imageAlignment = self->_imageAlignment;
  if ((_DWORD)imageAlignment == 3)
  {
    v6 = 0;
    imageAlignment = 1;
    v7 = &self->_detailHeaderLabel;
    p_detailHeaderLabel = (RUILinkLabel **)p_iconStackView;
  }
  else
  {
    if ((_DWORD)imageAlignment == 1)
    {
      v6 = 0;
    }
    else if ((_DWORD)imageAlignment || (-[UIStackView isHidden](*p_iconStackView, "isHidden") & 1) == 0)
    {
      imageAlignment = 0;
      v6 = 1;
    }
    else
    {
      v6 = 0;
      imageAlignment = 1;
    }
    v7 = (RUILinkLabel **)p_iconStackView;
  }
  -[UIStackView setAxis:](*p_iconStackView, "setAxis:", imageAlignment);
  -[UIStackView setAxis:](self->_mainStackView, "setAxis:", v6);
  -[UIStackView addArrangedSubview:](self->_mainStackView, "addArrangedSubview:", *v7);
  -[UIStackView addArrangedSubview:](self->_mainStackView, "addArrangedSubview:", self->_labelsStackView);
  -[UIStackView addArrangedSubview:](self->_mainStackView, "addArrangedSubview:", *p_detailHeaderLabel);
  -[RUIHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_isLeftToRight
{
  return objc_msgSend(MEMORY[0x24BEBDB00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[RUIHeaderView semanticContentAttribute](self, "semanticContentAttribute")) == 0;
}

- (BOOL)_shouldHideLeadingSpacerForLabel:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "textAlignment");
  if ((unint64_t)(v4 - 3) < 2)
    return 1;
  if (v4 == 2)
    return !-[RUIHeaderView _isLeftToRight](self, "_isLeftToRight");
  if (v4)
    return 0;
  return -[RUIHeaderView _isLeftToRight](self, "_isLeftToRight");
}

- (BOOL)_shouldHideTrailingSpacerForLabel:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "textAlignment");
  if (v4 == 2)
    return -[RUIHeaderView _isLeftToRight](self, "_isLeftToRight");
  if (v4)
    return 0;
  return !-[RUIHeaderView _isLeftToRight](self, "_isLeftToRight");
}

- (void)layoutSubviews
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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)RUIHeaderView;
  -[RUIHeaderView layoutSubviews](&v13, sel_layoutSubviews);
  -[UIStackView setSpacing:](self->_mainStackView, "setSpacing:", self->_imageLabelPadding);
  -[UIView setHidden:](self->_headerLeadingSpacer, "setHidden:", -[RUIHeaderView _shouldHideLeadingSpacerForLabel:](self, "_shouldHideLeadingSpacerForLabel:", self->_headerLabel));
  -[UIView setHidden:](self->_headerTrailingSpacer, "setHidden:", -[RUIHeaderView _shouldHideTrailingSpacerForLabel:](self, "_shouldHideTrailingSpacerForLabel:", self->_headerLabel));
  -[RUIHeaderView subHeaderLabel](self, "subHeaderLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setHidden:](self->_subHeaderLeadingSpacer, "setHidden:", -[RUIHeaderView _shouldHideLeadingSpacerForLabel:](self, "_shouldHideLeadingSpacerForLabel:", v3));

  -[RUIHeaderView subHeaderLabel](self, "subHeaderLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setHidden:](self->_subHeaderTrailingSpacer, "setHidden:", -[RUIHeaderView _shouldHideTrailingSpacerForLabel:](self, "_shouldHideTrailingSpacerForLabel:", v4));

  -[RUIHeaderView navTitleLabel](self, "navTitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setHidden:](self->_navTitleLeadingSpacer, "setHidden:", -[RUIHeaderView _shouldHideLeadingSpacerForLabel:](self, "_shouldHideLeadingSpacerForLabel:", v5));

  -[RUIHeaderView navTitleLabel](self, "navTitleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setHidden:](self->_navTitleTrailingSpacer, "setHidden:", -[RUIHeaderView _shouldHideTrailingSpacerForLabel:](self, "_shouldHideTrailingSpacerForLabel:", v6));

  -[RUIHeaderView navSubHeaderLabel](self, "navSubHeaderLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setHidden:](self->_navSubtitleLeadingSpacer, "setHidden:", -[RUIHeaderView _shouldHideLeadingSpacerForLabel:](self, "_shouldHideLeadingSpacerForLabel:", v7));

  -[RUIHeaderView navSubHeaderLabel](self, "navSubHeaderLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setHidden:](self->_navSubtitleTrailingSpacer, "setHidden:", -[RUIHeaderView _shouldHideTrailingSpacerForLabel:](self, "_shouldHideTrailingSpacerForLabel:", v8));

  -[RUIHeaderView navTitleLabel](self, "navTitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView setHidden:](self->_navTitleStackView, "setHidden:", objc_msgSend(v10, "length") != 0);

  -[RUIHeaderView navSubHeaderLabel](self, "navSubHeaderLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView setHidden:](self->_navSubtitleStackView, "setHidden:", objc_msgSend(v12, "length") != 0);

}

- (void)setImageAlignment:(int)a3
{
  self->_imageAlignment = a3;
  -[RUIHeaderView _arrangeItems](self, "_arrangeItems");
}

- (void)setSectionIsFirst:(BOOL)a3
{
  if (self->_isFirstSection != a3)
  {
    self->_isFirstSection = a3;
    -[RUIHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)_hasIcon
{
  return -[UIStackView isHidden](self->_iconStackView, "isHidden") ^ 1;
}

- (double)headerHeightForWidth:(double)a3 inView:(id)a4
{
  double v4;

  -[RUIHeaderView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", a4, a3, *(double *)(MEMORY[0x24BEBE588] + 8));
  return v4;
}

- (void)setNavTitle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[RUIHeaderView navTitleLabel](self, "navTitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[RUIHeaderView _arrangeItems](self, "_arrangeItems");
}

- (id)navTitleLabel
{
  UILabel *navTitleLabel;
  id v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  void *v8;
  void *v9;

  navTitleLabel = self->_navTitleLabel;
  if (!navTitleLabel)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD708]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_navTitleLabel;
    self->_navTitleLabel = v5;

    RemoteUINavHeaderFont(-[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_navTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_navTitleLabel, "setFont:", v7);

    RemoteUINavHeaderTextColor();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_navTitleLabel, "setTextColor:", v8);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](self->_navTitleLabel, "setBackgroundColor:", v9);

    -[UILabel setLineBreakMode:](self->_navTitleLabel, "setLineBreakMode:", 0);
    -[UILabel setTextAlignment:](self->_navTitleLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](self->_navTitleLabel, "setNumberOfLines:", 0);
    navTitleLabel = self->_navTitleLabel;
  }
  return navTitleLabel;
}

- (void)setNavSubHeaderTitle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[RUIHeaderView navSubHeaderLabel](self, "navSubHeaderLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[RUIHeaderView _arrangeItems](self, "_arrangeItems");
}

- (id)navSubHeaderLabel
{
  UILabel *navSubHeaderLabel;
  id v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  void *v8;
  void *v9;

  navSubHeaderLabel = self->_navSubHeaderLabel;
  if (!navSubHeaderLabel)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD708]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_navSubHeaderLabel;
    self->_navSubHeaderLabel = v5;

    RemoteUINavHeaderFont(-[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_navSubHeaderLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_navSubHeaderLabel, "setFont:", v7);

    RemoteUINavSubHeaderTextColor();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_navSubHeaderLabel, "setTextColor:", v8);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](self->_navSubHeaderLabel, "setBackgroundColor:", v9);

    -[UILabel setLineBreakMode:](self->_navSubHeaderLabel, "setLineBreakMode:", 0);
    -[UILabel setTextAlignment:](self->_navSubHeaderLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](self->_navSubHeaderLabel, "setNumberOfLines:", 0);
    navSubHeaderLabel = self->_navSubHeaderLabel;
  }
  return navSubHeaderLabel;
}

- (UIEdgeInsets)margins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_margins.top;
  left = self->_margins.left;
  bottom = self->_margins.bottom;
  right = self->_margins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMargins:(UIEdgeInsets)a3
{
  self->_margins = a3;
}

- (double)subHeaderTopMarginValue
{
  return self->_subHeaderTopMarginValue;
}

- (void)setSubHeaderTopMarginValue:(double)a3
{
  self->_subHeaderTopMarginValue = a3;
}

- (double)imageLabelPadding
{
  return self->_imageLabelPadding;
}

- (UIColor)headerLabelColor
{
  return self->_headerLabelColor;
}

- (void)setHeaderLabelColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 624);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerLabelColor, 0);
  objc_storeStrong((id *)&self->_subHeaderTrailingSpacer, 0);
  objc_storeStrong((id *)&self->_subHeaderLeadingSpacer, 0);
  objc_storeStrong((id *)&self->_subHeaderStackView, 0);
  objc_storeStrong((id *)&self->_navSubtitleTrailingSpacer, 0);
  objc_storeStrong((id *)&self->_navSubtitleLeadingSpacer, 0);
  objc_storeStrong((id *)&self->_navSubtitleStackView, 0);
  objc_storeStrong((id *)&self->_navTitleTrailingSpacer, 0);
  objc_storeStrong((id *)&self->_navTitleLeadingSpacer, 0);
  objc_storeStrong((id *)&self->_navTitleStackView, 0);
  objc_storeStrong((id *)&self->_headerTrailingSpacer, 0);
  objc_storeStrong((id *)&self->_headerLeadingSpacer, 0);
  objc_storeStrong((id *)&self->_headerStackView, 0);
  objc_storeStrong((id *)&self->_labelsStackView, 0);
  objc_storeStrong((id *)&self->_iconTrailingSpacer, 0);
  objc_storeStrong((id *)&self->_iconLeadingSpacer, 0);
  objc_storeStrong((id *)&self->_iconStackView, 0);
  objc_storeStrong((id *)&self->_mainStackView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_subHeaderLabel, 0);
  objc_storeStrong((id *)&self->_detailHeaderLabel, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_navSubHeaderLabel, 0);
  objc_storeStrong((id *)&self->_navTitleLabel, 0);
}

@end
