@implementation VUIAccessView_iOS

- (VUIAccessView_iOS)initWithApps:(id)a3
{
  id v5;
  VUIAccessView_iOS *v6;
  VUIAccessView_iOS *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIAccessView_iOS;
  v6 = -[VUIAccessView_iOS init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_apps, a3);
    -[VUIAccessView_iOS setupView](v7, "setupView");
  }

  return v7;
}

+ (BOOL)tooManyIconsWithAppCount:(unint64_t)a3
{
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "userInterfaceIdiom"))
    v5 = 7;
  else
    v5 = 5;

  return v5 < a3;
}

- (void)setupView
{
  UIButton *v3;
  UIButton *allowButton;
  UIButton *v5;
  UIButton *nackButton;
  UIButton *v7;
  UIButton *seeAllButton;
  id v9;

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v3 = (UIButton *)objc_claimAutoreleasedReturnValue();
  allowButton = self->_allowButton;
  self->_allowButton = v3;

  -[UIButton addObserver:forKeyPath:options:context:](self->_allowButton, "addObserver:forKeyPath:options:context:", self, CFSTR("highlighted"), 3, CFSTR("__VUIAccessView_iOSObservationContext"));
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v5 = (UIButton *)objc_claimAutoreleasedReturnValue();
  nackButton = self->_nackButton;
  self->_nackButton = v5;

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v7 = (UIButton *)objc_claimAutoreleasedReturnValue();
  seeAllButton = self->_seeAllButton;
  self->_seeAllButton = v7;

  -[UIButton setVuiAccessibilityIdentifier:](self->_allowButton, "setVuiAccessibilityIdentifier:", CFSTR("UIA.TV.Button.access.connect"));
  -[VUIAccessView_iOS setVuiAccessibilityIdentifier:](self, "setVuiAccessibilityIdentifier:", CFSTR("UIA.TV.View.access.connect"));
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIAccessView_iOS setTintColor:](self, "setTintColor:", v9);

}

- (void)dealloc
{
  objc_super v3;

  -[UIButton removeObserver:forKeyPath:](self->_allowButton, "removeObserver:forKeyPath:", self, CFSTR("highlighted"));
  v3.receiver = self;
  v3.super_class = (Class)VUIAccessView_iOS;
  -[VUIAccessView_iOS dealloc](&v3, sel_dealloc);
}

+ (CGSize)iconSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 60.0;
  v3 = 60.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)allowButton
{
  return self->_allowButton;
}

- (id)seeAllButton
{
  return self->_seeAllButton;
}

- (id)nackButton
{
  return self->_nackButton;
}

- (id)bodyScroll
{
  return self->_bodyScroll;
}

- (void)setTitle:(id)a3
{
  id v4;
  UILabel *titleLabel;
  id v6;

  v4 = a3;
  titleLabel = self->_titleLabel;
  v6 = v4;
  if (!titleLabel)
  {
    -[VUIAccessView_iOS layoutSubviews](self, "layoutSubviews");
    v4 = v6;
    titleLabel = self->_titleLabel;
  }
  -[UILabel setText:](titleLabel, "setText:", v4);

}

- (void)setBody:(id)a3
{
  id v4;
  UILabel *bodyLabel;
  id v6;

  v4 = a3;
  bodyLabel = self->_bodyLabel;
  v6 = v4;
  if (!bodyLabel)
  {
    -[VUIAccessView_iOS layoutSubviews](self, "layoutSubviews");
    v4 = v6;
    bodyLabel = self->_bodyLabel;
  }
  -[UILabel setText:](bodyLabel, "setText:", v4);

}

- (void)setSecondaryBody:(id)a3
{
  id v4;
  UILabel *secondaryBodyLabel;
  id v6;

  v4 = a3;
  secondaryBodyLabel = self->_secondaryBodyLabel;
  v6 = v4;
  if (!secondaryBodyLabel)
  {
    -[VUIAccessView_iOS layoutSubviews](self, "layoutSubviews");
    v4 = v6;
    secondaryBodyLabel = self->_secondaryBodyLabel;
  }
  -[UILabel setText:](secondaryBodyLabel, "setText:", v4);
  -[UILabel setHidden:](self->_secondaryBodyLabel, "setHidden:", 0);

}

- (void)showNackScreen
{
  UILabel *v3;
  void *v4;
  void *v5;
  UILabel *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UILabel *titleLabel;
  void *v12;
  void *v13;
  void *v14;
  UILabel *bodyLabel;
  void *v16;

  if (-[NSArray count](self->_apps, "count") < 2)
  {
    -[NSArray firstObject](self->_apps, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("appName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:", CFSTR("ACCESS_NACK_TITLE_FORMAT"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    titleLabel = self->_titleLabel;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%@"), 0, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](titleLabel, "setText:", v12);

    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:", CFSTR("ACCESS_NACK_BODY_IOS_FORMAT"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    bodyLabel = self->_bodyLabel;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%@"), 0, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](bodyLabel, "setText:", v16);

  }
  else
  {
    v3 = self->_titleLabel;
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:", CFSTR("ACCESS_NACK_TITLE_PLURAL"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3, "setText:", v5);

    v6 = self->_bodyLabel;
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:", CFSTR("ACCESS_NACK_BODY_IOS_PLURAL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v6, "setText:", v8);
  }

  -[UILabel setHidden:](self->_secondaryBodyLabel, "setHidden:", 1);
  -[UIStackView setHidden:](self->_bottomStack, "setHidden:", 1);
  -[UIButton setHidden:](self->_seeAllButton, "setHidden:", 1);
  -[UIButton setHidden:](self->_nackButton, "setHidden:", 0);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  UILayoutGuide *v7;
  UILayoutGuide *titlePlacementGuide;
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
  double v22;
  double v23;
  double v24;
  double v25;
  UILabel *v26;
  UILabel *titleLabel;
  uint64_t v28;
  uint64_t v29;
  UILabel *v30;
  void *v31;
  void *v32;
  UILabel *v33;
  UILabel *bodyLabel;
  UILabel *v35;
  void *v36;
  id v37;
  UILabel *v38;
  UILabel *secondaryBodyLabel;
  UILabel *v40;
  void *v41;
  id v42;
  UILabel *v43;
  UIButton *seeAllButton;
  void *v45;
  UIStackView *v46;
  UIStackView *scrollStack;
  VUILabel *v48;
  VUILabel *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  UIScrollView *v56;
  UIScrollView *bodyScroll;
  _BOOL4 v58;
  _TVCarouselView *v59;
  _TVCarouselView *carouselView;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  UIButton *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  UIStackView *v81;
  UIStackView *logoStack;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  UIButton *allowButton;
  void *v93;
  void *v94;
  UIButton *v95;
  void *v96;
  UIButton *v97;
  void *v98;
  UIButton *nackButton;
  void *v100;
  void *v101;
  UIButton *v102;
  void *v103;
  UIButton *v104;
  void *v105;
  id v106;
  void *v107;
  UIStackView *v108;
  UIStackView *bottomStack;
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
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
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
  uint64_t v161;
  double v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
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
  uint64_t v179;
  uint64_t v180;
  void *v181;
  void *v182;
  void *v183;
  objc_super v184;
  UIButton *v185;
  _QWORD v186[6];

  v186[4] = *MEMORY[0x1E0C80C00];
  v184.receiver = self;
  v184.super_class = (Class)VUIAccessView_iOS;
  -[VUIAccessView_iOS layoutSubviews](&v184, sel_layoutSubviews);
  if (!self->_didLayout)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAccessView_iOS setBackgroundColor:](self, "setBackgroundColor:", v3);

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    v6 = 20.0;
    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v6 = 74.0;
    -[VUIAccessView_iOS setLayoutMargins:](self, "setLayoutMargins:", 20.0, v6, 0.0, v6);
    v7 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
    titlePlacementGuide = self->_titlePlacementGuide;
    self->_titlePlacementGuide = v7;

    -[VUIAccessView_iOS addLayoutGuide:](self, "addLayoutGuide:", self->_titlePlacementGuide);
    -[UILayoutGuide centerXAnchor](self->_titlePlacementGuide, "centerXAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAccessView_iOS centerXAnchor](self, "centerXAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActive:", 1);

    -[UILayoutGuide heightAnchor](self->_titlePlacementGuide, "heightAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAccessView_iOS heightAnchor](self, "heightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:multiplier:", v13, 0.25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActive:", 1);

    -[UILayoutGuide widthAnchor](self->_titlePlacementGuide, "widthAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAccessView_iOS widthAnchor](self, "widthAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

    -[UILayoutGuide topAnchor](self->_titlePlacementGuide, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAccessView_iOS topAnchor](self, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActive:", 1);

    v21 = objc_alloc(MEMORY[0x1E0DC3990]);
    v22 = *MEMORY[0x1E0C9D648];
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v24 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v26 = (UILabel *)objc_msgSend(v21, "initWithFrame:", *MEMORY[0x1E0C9D648], v23, v24, v25);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v26;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
    v28 = *MEMORY[0x1E0DC4900];
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4B50], *MEMORY[0x1E0DC4900]);
    v29 = objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_titleLabel, "setFont:", v29);
    -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
    v30 = self->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v30, "setTextColor:", v31);

    -[UILabel setVuiAccessibilityIdentifier:](self->_titleLabel, "setVuiAccessibilityIdentifier:", CFSTR("UIA.TV.Label.access.connect"));
    v179 = *MEMORY[0x1E0DC4A88];
    v180 = v28;
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v22, v23, v24, v25);
    bodyLabel = self->_bodyLabel;
    self->_bodyLabel = v33;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_bodyLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setFont:](self->_bodyLabel, "setFont:", v32);
    -[UILabel setNumberOfLines:](self->_bodyLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](self->_bodyLabel, "setTextAlignment:", 1);
    -[UILabel setVuiAccessibilityIdentifier:](self->_bodyLabel, "setVuiAccessibilityIdentifier:", CFSTR("UIA.TV.Label.access.body"));
    v35 = self->_bodyLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v35, "setTextColor:", v36);

    v37 = v32;
    v38 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v22, v23, v24, v25);
    secondaryBodyLabel = self->_secondaryBodyLabel;
    self->_secondaryBodyLabel = v38;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_secondaryBodyLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setFont:](self->_secondaryBodyLabel, "setFont:", v37);
    -[UILabel setNumberOfLines:](self->_secondaryBodyLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](self->_secondaryBodyLabel, "setTextAlignment:", 1);
    v40 = self->_secondaryBodyLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v40, "setTextColor:", v41);

    v42 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v43 = self->_bodyLabel;
    v186[0] = self->_titleLabel;
    v186[1] = v43;
    seeAllButton = self->_seeAllButton;
    v186[2] = self->_secondaryBodyLabel;
    v186[3] = seeAllButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v186, 4);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (UIStackView *)objc_msgSend(v42, "initWithArrangedSubviews:", v45);
    scrollStack = self->_scrollStack;
    self->_scrollStack = v46;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollStack, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](self->_scrollStack, "setAxis:", 1);
    -[UIStackView setAlignment:](self->_scrollStack, "setAlignment:", 3);
    v48 = -[VUILabel initWithFrame:]([VUILabel alloc], "initWithFrame:", v22, v23, v24, v25);
    v182 = (void *)v29;
    -[VUILabel setFont:](v48, "setFont:", v29);
    v49 = -[VUILabel initWithFrame:]([VUILabel alloc], "initWithFrame:", v22, v23, v24, v25);
    v183 = v37;
    -[VUILabel setFont:](v49, "setFont:", v37);
    -[VUILabel topMarginWithBaselineMargin:maximumContentSizeCategory:](v49, "topMarginWithBaselineMargin:maximumContentSizeCategory:", 5, 32.0);
    v51 = v50;
    -[VUILabel bottomMarginWithBaselineMargin:maximumContentSizeCategory:](v48, "bottomMarginWithBaselineMargin:maximumContentSizeCategory:", 5, 0.0);
    -[UIStackView setCustomSpacing:afterView:](self->_scrollStack, "setCustomSpacing:afterView:", self->_titleLabel, v51 + v52);
    -[VUILabel topMarginWithBaselineMargin:maximumContentSizeCategory:](v49, "topMarginWithBaselineMargin:maximumContentSizeCategory:", 5, 32.0);
    v54 = v53;
    -[VUILabel bottomMarginWithBaselineMargin:maximumContentSizeCategory:](v49, "bottomMarginWithBaselineMargin:maximumContentSizeCategory:", 5, 0.0);
    -[UIStackView setCustomSpacing:afterView:](self->_scrollStack, "setCustomSpacing:afterView:", self->_bodyLabel, v54 + v55);
    -[UIStackView setCustomSpacing:afterView:](self->_scrollStack, "setCustomSpacing:afterView:", self->_secondaryBodyLabel, 19.0);
    v56 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
    bodyScroll = self->_bodyScroll;
    self->_bodyScroll = v56;

    -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_bodyScroll, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIScrollView addSubview:](self->_bodyScroll, "addSubview:", self->_scrollStack);
    -[VUIAccessView_iOS addSubview:](self, "addSubview:", self->_bodyScroll);
    v58 = +[VUIAccessView_iOS tooManyIconsWithAppCount:](VUIAccessView_iOS, "tooManyIconsWithAppCount:", -[NSArray count](self->_apps, "count"));
    if (v58)
    {
      -[VUIAccessView_iOS _buildCarousel](self, "_buildCarousel");
      v59 = (_TVCarouselView *)objc_claimAutoreleasedReturnValue();
      carouselView = self->_carouselView;
      self->_carouselView = v59;

      -[VUIAccessView_iOS addSubview:](self, "addSubview:", self->_carouselView);
      -[_TVCarouselView setTranslatesAutoresizingMaskIntoConstraints:](self->_carouselView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[_TVCarouselView centerXAnchor](self->_carouselView, "centerXAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIAccessView_iOS centerXAnchor](self, "centerXAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "constraintEqualToAnchor:", v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setActive:", 1);

      -[_TVCarouselView widthAnchor](self->_carouselView, "widthAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIAccessView_iOS widthAnchor](self, "widthAnchor");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "constraintEqualToAnchor:", v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setActive:", 1);

      -[_TVCarouselView heightAnchor](self->_carouselView, "heightAnchor");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUIAccessView_iOS iconSize](VUIAccessView_iOS, "iconSize");
      objc_msgSend(v67, "constraintEqualToConstant:", v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setActive:", 1);

      -[_TVCarouselView topAnchor](self->_carouselView, "topAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIAccessView_iOS topAnchor](self, "topAnchor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "constraintGreaterThanOrEqualToAnchor:constant:", v71, 8.0);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setActive:", 1);

      -[_TVCarouselView bottomAnchor](self->_carouselView, "bottomAnchor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScrollView firstBaselineAnchor](self->_bodyScroll, "firstBaselineAnchor");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "constraintEqualToAnchor:constant:", v74, -16.0);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "setActive:", 1);

      v76 = self->_seeAllButton;
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "localizedStringForKey:", CFSTR("ACCESS_SEE_ALL_BUTTON"));
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTitle:forState:](v76, "setTitle:forState:", v78, 0);

      -[UIButton titleLabel](self->_seeAllButton, "titleLabel");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setLineBreakMode:", 0);

      -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_seeAllButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v80 = v183;
      -[UIButton _setFont:](self->_seeAllButton, "_setFont:", v183);
    }
    else
    {
      -[VUIAccessView_iOS _buildLogoStack](self, "_buildLogoStack");
      v81 = (UIStackView *)objc_claimAutoreleasedReturnValue();
      logoStack = self->_logoStack;
      self->_logoStack = v81;

      -[VUIAccessView_iOS addSubview:](self, "addSubview:", self->_logoStack);
      -[UIStackView centerXAnchor](self->_logoStack, "centerXAnchor");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIAccessView_iOS centerXAnchor](self, "centerXAnchor");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "constraintEqualToAnchor:", v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "setActive:", 1);

      -[UIStackView topAnchor](self->_logoStack, "topAnchor");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIAccessView_iOS topAnchor](self, "topAnchor");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "constraintGreaterThanOrEqualToAnchor:constant:", v87, 8.0);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "setActive:", 1);

      -[UIStackView bottomAnchor](self->_logoStack, "bottomAnchor");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScrollView firstBaselineAnchor](self->_bodyScroll, "firstBaselineAnchor");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "constraintEqualToAnchor:constant:", v90, -16.0);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "setActive:", 1);

      v80 = v183;
    }
    -[UIButton setHidden:](self->_seeAllButton, "setHidden:", !v58);
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:maximumContentSizeCategory:", v179, 1024, v180);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    allowButton = self->_allowButton;
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "localizedStringForKey:", CFSTR("ACCESS_ALLOW"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](allowButton, "setTitle:forState:", v94, 0);

    v95 = self->_allowButton;
    -[VUIAccessView_iOS tintColor](self, "tintColor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v95, "setBackgroundColor:", v96);

    v97 = self->_allowButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v97, "setTitleColor:forState:", v98, 0);

    -[UIButton _setFont:](self->_allowButton, "_setFont:", v181);
    -[UIButton _setContinuousCornerRadius:](self->_allowButton, "_setContinuousCornerRadius:", 8.0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_nackButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    nackButton = self->_nackButton;
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "localizedStringForKey:", CFSTR("ACCESS_NACK_BUTTON"));
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](nackButton, "setTitle:forState:", v101, 0);

    v102 = self->_nackButton;
    -[VUIAccessView_iOS tintColor](self, "tintColor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v102, "setBackgroundColor:", v103);

    v104 = self->_nackButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v104, "setTitleColor:forState:", v105, 0);

    -[UIButton _setFont:](self->_nackButton, "_setFont:", v80);
    -[UIButton _setContinuousCornerRadius:](self->_nackButton, "_setContinuousCornerRadius:", 8.0);
    -[VUIAccessView_iOS addSubview:](self, "addSubview:", self->_nackButton);
    -[UIButton setHidden:](self->_nackButton, "setHidden:", 1);
    v106 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v185 = self->_allowButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v185, 1);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = (UIStackView *)objc_msgSend(v106, "initWithArrangedSubviews:", v107);
    bottomStack = self->_bottomStack;
    self->_bottomStack = v108;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_bottomStack, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](self->_bottomStack, "setAxis:", 1);
    -[UIStackView setAlignment:](self->_bottomStack, "setAlignment:", 3);
    -[UIStackView setDistribution:](self->_bottomStack, "setDistribution:", 3);
    -[UIStackView setSpacing:](self->_bottomStack, "setSpacing:", 0.0);
    -[VUIAccessView_iOS addSubview:](self, "addSubview:", self->_bottomStack);
    -[UIScrollView leadingAnchor](self->_bodyScroll, "leadingAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAccessView_iOS readableContentGuide](self, "readableContentGuide");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "leadingAnchor");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "constraintEqualToAnchor:", v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "setActive:", 1);

    -[UIScrollView trailingAnchor](self->_bodyScroll, "trailingAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAccessView_iOS readableContentGuide](self, "readableContentGuide");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "trailingAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "constraintEqualToAnchor:", v116);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setActive:", 1);

    -[UIScrollView topAnchor](self->_bodyScroll, "topAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](self->_titlePlacementGuide, "bottomAnchor");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "constraintEqualToAnchor:", v119);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "setActive:", 1);

    -[UIScrollView bottomAnchor](self->_bodyScroll, "bottomAnchor");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView topAnchor](self->_bottomStack, "topAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "constraintEqualToAnchor:constant:", v122, -22.0);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "setActive:", 1);

    -[UIStackView leadingAnchor](self->_scrollStack, "leadingAnchor");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView leadingAnchor](self->_bodyScroll, "leadingAnchor");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "constraintEqualToAnchor:", v125);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "setActive:", 1);

    -[UIStackView trailingAnchor](self->_scrollStack, "trailingAnchor");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView trailingAnchor](self->_bodyScroll, "trailingAnchor");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "constraintEqualToAnchor:", v128);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "setActive:", 1);

    -[UIStackView topAnchor](self->_scrollStack, "topAnchor");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView topAnchor](self->_bodyScroll, "topAnchor");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "constraintEqualToAnchor:", v131);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setActive:", 1);

    -[UIStackView bottomAnchor](self->_scrollStack, "bottomAnchor");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView bottomAnchor](self->_bodyScroll, "bottomAnchor");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "constraintEqualToAnchor:", v134);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "setActive:", 1);

    -[UIStackView widthAnchor](self->_scrollStack, "widthAnchor");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAccessView_iOS readableContentGuide](self, "readableContentGuide");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "widthAnchor");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "constraintEqualToAnchor:", v138);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "setActive:", 1);

    -[UIStackView widthAnchor](self->_bottomStack, "widthAnchor");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAccessView_iOS readableContentGuide](self, "readableContentGuide");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "widthAnchor");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "constraintEqualToAnchor:", v142);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "setActive:", 1);

    -[UIButton widthAnchor](self->_seeAllButton, "widthAnchor");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "constraintEqualToConstant:", 288.0);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "setActive:", 1);

    -[UIButton centerXAnchor](self->_allowButton, "centerXAnchor");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAccessView_iOS centerXAnchor](self, "centerXAnchor");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "constraintEqualToAnchor:", v147);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "setActive:", 1);

    -[UIButton widthAnchor](self->_allowButton, "widthAnchor");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "constraintEqualToConstant:", 288.0);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "setActive:", 1);

    -[UIButton heightAnchor](self->_allowButton, "heightAnchor");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "constraintEqualToConstant:", 50.0);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "setActive:", 1);

    -[UIStackView centerXAnchor](self->_bottomStack, "centerXAnchor");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAccessView_iOS centerXAnchor](self, "centerXAnchor");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "constraintEqualToAnchor:", v154);
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "setActive:", 1);

    -[UIStackView bottomAnchor](self->_bottomStack, "bottomAnchor");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAccessView_iOS readableContentGuide](self, "readableContentGuide");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "bottomAnchor");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "constraintEqualToAnchor:constant:", v158, -22.0);
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "setActive:", 1);

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = objc_msgSend(v160, "userInterfaceIdiom");

    if ((v161 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v162 = 60.0;
    else
      v162 = 44.0;
    -[UIButton bottomAnchor](self->_nackButton, "bottomAnchor");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAccessView_iOS readableContentGuide](self, "readableContentGuide");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "bottomAnchor");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "constraintEqualToAnchor:constant:", v165, -v162);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "setActive:", 1);

    -[UIButton topAnchor](self->_nackButton, "topAnchor");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView bottomAnchor](self->_bodyScroll, "bottomAnchor");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "constraintGreaterThanOrEqualToAnchor:constant:", v168, 22.0);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "setActive:", 1);

    -[UIButton centerXAnchor](self->_nackButton, "centerXAnchor");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAccessView_iOS centerXAnchor](self, "centerXAnchor");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "constraintEqualToAnchor:", v171);
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "setActive:", 1);

    -[UIButton widthAnchor](self->_nackButton, "widthAnchor");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton widthAnchor](self->_allowButton, "widthAnchor");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v173, "constraintEqualToAnchor:", v174);
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "setActive:", 1);

    -[UIButton heightAnchor](self->_nackButton, "heightAnchor");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton heightAnchor](self->_allowButton, "heightAnchor");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v176, "constraintEqualToAnchor:", v177);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "setActive:", 1);

    self->_didLayout = 1;
  }
}

- (unint64_t)numberOfItemsInCarouselView:(id)a3
{
  return -[NSArray count](self->_apps, "count", a3);
}

- (id)carouselView:(id)a3 cellForItemAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *apps;
  id v11;
  void *v12;
  void *v13;

  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndex:", CFSTR("cell"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    apps = self->_apps;
    v11 = v9;
    -[NSArray objectAtIndexedSubscript:](apps, "objectAtIndexedSubscript:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("appIcon"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImage:", v13);

  }
  else
  {
    -[VUIAccessView_iOS _imageViewForIndex:](self, "_imageViewForIndex:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAutoresizingMask:", 18);
    objc_msgSend(v9, "removeFromSuperview");
    objc_msgSend(v7, "addSubview:", v12);
  }

  return v6;
}

- (id)_buildCarousel
{
  id v3;
  void *v4;

  v3 = objc_alloc(MEMORY[0x1E0DB1FD8]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v4, "setDataSource:", self);
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("cell"));
  +[VUIAccessView_iOS iconSize](VUIAccessView_iOS, "iconSize");
  objc_msgSend(v4, "setItemSize:");
  objc_msgSend(v4, "setScrollMode:", 1);
  objc_msgSend(v4, "setUnitScrollDuration:", 4.0);
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);
  objc_msgSend(v4, "setInteritemSpacing:", 15.0);
  return v4;
}

- (id)_buildLogoStack
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_apps, "count"))
  {
    v4 = 0;
    do
    {
      -[VUIAccessView_iOS _imageViewForIndex:](self, "_imageViewForIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

      ++v4;
    }
    while (v4 < -[NSArray count](self->_apps, "count"));
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithArrangedSubviews:", v3);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "setAxis:", 0);
  objc_msgSend(v6, "setAlignment:", 3);
  objc_msgSend(v6, "setDistribution:", 3);
  objc_msgSend(v6, "setSpacing:", 15.0);
  objc_msgSend(v6, "setVuiAccessibilityIdentifier:", CFSTR("UIA.TV.Image.access.connect"));

  return v6;
}

- (id)_imageViewForIndex:(unint64_t)a3
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[NSArray objectAtIndexedSubscript:](self->_apps, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("appIcon"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[VUIAccessView_iOS iconSize](VUIAccessView_iOS, "iconSize");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToConstant:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  objc_msgSend(v5, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToConstant:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  objc_msgSend(v5, "setImage:", v4);
  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  UIButton *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t *v17;
  id v18;
  objc_super v19;
  uint64_t v20;
  uint64_t v21;

  v10 = a3;
  v11 = (UIButton *)a4;
  v12 = a5;
  if (a6 == CFSTR("__VUIAccessView_iOSObservationContext") && self->_allowButton == v11)
  {
    -[VUIAccessView_iOS tintColor](self, "tintColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[UIButton isHighlighted](self->_allowButton, "isHighlighted");
    v15 = (void *)MEMORY[0x1E0DC3F10];
    if (v14)
    {
      v21 = MEMORY[0x1E0C809B0];
      v16 = __68__VUIAccessView_iOS_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v17 = &v21;
    }
    else
    {
      v20 = MEMORY[0x1E0C809B0];
      v16 = __68__VUIAccessView_iOS_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
      v17 = &v20;
    }
    v17[1] = 3221225472;
    v17[2] = (uint64_t)v16;
    v17[3] = (uint64_t)&unk_1E9F98FD8;
    v17[4] = (uint64_t)self;
    v17[5] = (uint64_t)v13;
    v18 = v13;
    objc_msgSend(v15, "animateWithDuration:animations:", v17, 0.25);

  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)VUIAccessView_iOS;
    -[VUIAccessView_iOS observeValueForKeyPath:ofObject:change:context:](&v19, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carouselView, 0);
  objc_storeStrong((id *)&self->_seeAllButton, 0);
  objc_storeStrong((id *)&self->_nackButton, 0);
  objc_storeStrong((id *)&self->_allowButton, 0);
  objc_storeStrong((id *)&self->_bottomStack, 0);
  objc_storeStrong((id *)&self->_logoStack, 0);
  objc_storeStrong((id *)&self->_secondaryBodyLabel, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_bodyScroll, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_scrollStack, 0);
  objc_storeStrong((id *)&self->_titlePlacementGuide, 0);
  objc_storeStrong((id *)&self->_apps, 0);
}

@end
