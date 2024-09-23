@implementation NCAppPickerViewCell

- (NCAppPickerViewCell)initWithFrame:(CGRect)a3
{
  NCAppPickerViewCell *v3;
  NCAppPickerViewCell *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  UIView *backgroundView;
  void *v13;
  uint64_t v14;
  NCCheckmarkButton *checkmarkButton;
  void *v16;
  uint64_t v17;
  UIImageView *iconImageView;
  void *v19;
  uint64_t v20;
  UIView *titleAndFrequencyContainer;
  void *v22;
  uint64_t v23;
  UILabel *titleLabel;
  UILabel *v25;
  void *v26;
  UILabel *v27;
  void *v28;
  uint64_t v29;
  UIView *frequencyLineView;
  UIView *v31;
  void *v32;
  uint64_t v33;
  UIView *frequencyDotView;
  UIView *v35;
  void *v36;
  uint64_t v37;
  UILabel *frequencyLabel;
  UILabel *v39;
  void *v40;
  UILabel *v41;
  void *v42;
  id v43;
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
  uint64_t v127;
  NSLayoutConstraint *frequencyLineWidthConstraint;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  uint64_t v138;
  NSLayoutConstraint *frequencyDotLeadingConstraint;
  void *v141;
  objc_super v142;

  v142.receiver = self;
  v142.super_class = (Class)NCAppPickerViewCell;
  v3 = -[NCAppPickerViewCell initWithFrame:](&v142, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[NCAppPickerViewCell traitCollection](v3, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "userInterfaceStyle") == 2)
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGray6Color");
    v141 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], v8, v9, v10);
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = (UIView *)v11;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView _setContinuousCornerRadius:](v4->_backgroundView, "_setContinuousCornerRadius:", 12.0);
    -[UIView setBackgroundColor:](v4->_backgroundView, "setBackgroundColor:", v141);
    -[NCAppPickerViewCell contentView](v4, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v4->_backgroundView);

    +[NCCheckmarkButton button](NCCheckmarkButton, "button");
    v14 = objc_claimAutoreleasedReturnValue();
    checkmarkButton = v4->_checkmarkButton;
    v4->_checkmarkButton = (NCCheckmarkButton *)v14;

    -[NCCheckmarkButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_checkmarkButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[NCCheckmarkButton setUserInteractionEnabled:](v4->_checkmarkButton, "setUserInteractionEnabled:", 0);
    -[NCAppPickerViewCell contentView](v4, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v4->_checkmarkButton);

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v7, v8, v9, v10);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = (UIImageView *)v17;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[NCAppPickerViewCell contentView](v4, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v4->_iconImageView);

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v7, v8, v9, v10);
    titleAndFrequencyContainer = v4->_titleAndFrequencyContainer;
    v4->_titleAndFrequencyContainer = (UIView *)v20;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleAndFrequencyContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[NCAppPickerViewCell contentView](v4, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v4->_titleAndFrequencyContainer);

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v23;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v25 = v4->_titleLabel;
    objc_msgSend((id)objc_opt_class(), "_titleFont");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v25, "setFont:", v26);

    v27 = v4->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v27, "setTextColor:", v28);

    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setMinimumScaleFactor:](v4->_titleLabel, "setMinimumScaleFactor:", 0.8);
    -[UIView addSubview:](v4->_titleAndFrequencyContainer, "addSubview:", v4->_titleLabel);
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v7, v8, v9, v10);
    frequencyLineView = v4->_frequencyLineView;
    v4->_frequencyLineView = (UIView *)v29;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_frequencyLineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v31 = v4->_frequencyLineView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray3Color");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v31, "setBackgroundColor:", v32);

    -[UIView _setContinuousCornerRadius:](v4->_frequencyLineView, "_setContinuousCornerRadius:", 2.0);
    -[UIView addSubview:](v4->_titleAndFrequencyContainer, "addSubview:", v4->_frequencyLineView);
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v7, v8, v9, v10);
    frequencyDotView = v4->_frequencyDotView;
    v4->_frequencyDotView = (UIView *)v33;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_frequencyDotView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v35 = v4->_frequencyDotView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v35, "setBackgroundColor:", v36);

    -[UIView _setCornerRadius:](v4->_frequencyDotView, "_setCornerRadius:", 4.5);
    -[UIView addSubview:](v4->_titleAndFrequencyContainer, "addSubview:", v4->_frequencyDotView);
    v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    frequencyLabel = v4->_frequencyLabel;
    v4->_frequencyLabel = (UILabel *)v37;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_frequencyLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v39 = v4->_frequencyLabel;
    objc_msgSend((id)objc_opt_class(), "_frequencyFont");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v39, "setFont:", v40);

    v41 = v4->_frequencyLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v41, "setTextColor:", v42);

    -[UILabel setMinimumScaleFactor:](v4->_frequencyLabel, "setMinimumScaleFactor:", 0.5);
    -[UILabel setAdjustsFontSizeToFitWidth:](v4->_frequencyLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UIView addSubview:](v4->_titleAndFrequencyContainer, "addSubview:", v4->_frequencyLabel);
    v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[UIView topAnchor](v4->_backgroundView, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCAppPickerViewCell contentView](v4, "contentView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v47);

    -[NCAppPickerViewCell contentView](v4, "contentView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v4->_backgroundView, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v51);

    -[UIView leadingAnchor](v4->_backgroundView, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCAppPickerViewCell contentView](v4, "contentView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v55);

    -[NCAppPickerViewCell contentView](v4, "contentView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "bottomAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v4->_backgroundView, "bottomAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v59);

    -[NCCheckmarkButton leadingAnchor](v4->_checkmarkButton, "leadingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCAppPickerViewCell contentView](v4, "contentView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "leadingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:constant:", v62, 2.0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v63);

    -[NCCheckmarkButton heightAnchor](v4->_checkmarkButton, "heightAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCAppPickerViewCell contentView](v4, "contentView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "heightAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v67);

    -[NCCheckmarkButton centerYAnchor](v4->_checkmarkButton, "centerYAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCAppPickerViewCell contentView](v4, "contentView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "centerYAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v71);

    -[NCCheckmarkButton widthAnchor](v4->_checkmarkButton, "widthAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToConstant:", 44.0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v73);

    -[UIImageView heightAnchor](v4->_iconImageView, "heightAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToConstant:", 29.0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v75);

    -[UIImageView widthAnchor](v4->_iconImageView, "widthAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToConstant:", 29.0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v77);

    -[UIImageView leadingAnchor](v4->_iconImageView, "leadingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCAppPickerViewCell contentView](v4, "contentView");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "leadingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:constant:", v80, 47.0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v81);

    -[UIImageView centerYAnchor](v4->_iconImageView, "centerYAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCAppPickerViewCell contentView](v4, "contentView");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "centerYAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintEqualToAnchor:", v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v85);

    -[UIView centerYAnchor](v4->_titleAndFrequencyContainer, "centerYAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCAppPickerViewCell contentView](v4, "contentView");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "centerYAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "constraintEqualToAnchor:", v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v89);

    -[UIView leadingAnchor](v4->_titleAndFrequencyContainer, "leadingAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v4->_iconImageView, "trailingAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToAnchor:constant:", v91, 12.0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v92);

    -[NCAppPickerViewCell contentView](v4, "contentView");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "trailingAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v4->_titleAndFrequencyContainer, "trailingAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "constraintEqualToAnchor:constant:", v95, 14.0);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v96);

    -[UILabel topAnchor](v4->_titleLabel, "topAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v4->_titleAndFrequencyContainer, "topAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "constraintEqualToAnchor:", v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v99);

    -[UIView trailingAnchor](v4->_titleAndFrequencyContainer, "trailingAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v4->_titleLabel, "trailingAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "constraintEqualToAnchor:", v101);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v102);

    -[UILabel leadingAnchor](v4->_titleLabel, "leadingAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v4->_titleAndFrequencyContainer, "leadingAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "constraintEqualToAnchor:", v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v105);

    -[UILabel topAnchor](v4->_frequencyLabel, "topAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v4->_titleLabel, "bottomAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "constraintEqualToAnchor:constant:", v107, 2.0);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v108);

    -[UILabel leadingAnchor](v4->_frequencyLabel, "leadingAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v4->_frequencyDotView, "trailingAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "constraintEqualToAnchor:constant:", v110, 4.0);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v111);

    -[UIView trailingAnchor](v4->_titleAndFrequencyContainer, "trailingAnchor");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v4->_frequencyLabel, "trailingAnchor");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "constraintGreaterThanOrEqualToAnchor:constant:", v113, 0.0);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v114);

    -[UIView bottomAnchor](v4->_titleAndFrequencyContainer, "bottomAnchor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v4->_frequencyLabel, "bottomAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "constraintEqualToAnchor:", v116);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v117);

    -[UIView centerYAnchor](v4->_frequencyLineView, "centerYAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel centerYAnchor](v4->_frequencyLabel, "centerYAnchor");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "constraintEqualToAnchor:", v119);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v120);

    -[UIView leadingAnchor](v4->_frequencyLineView, "leadingAnchor");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v4->_titleAndFrequencyContainer, "leadingAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "constraintEqualToAnchor:", v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v123);

    -[UIView heightAnchor](v4->_frequencyLineView, "heightAnchor");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "constraintEqualToConstant:", 4.0);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v125);

    -[UIView widthAnchor](v4->_frequencyLineView, "widthAnchor");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "constraintEqualToConstant:", 0.0);
    v127 = objc_claimAutoreleasedReturnValue();
    frequencyLineWidthConstraint = v4->_frequencyLineWidthConstraint;
    v4->_frequencyLineWidthConstraint = (NSLayoutConstraint *)v127;

    objc_msgSend(v43, "addObject:", v4->_frequencyLineWidthConstraint);
    -[UIView centerYAnchor](v4->_frequencyDotView, "centerYAnchor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v4->_frequencyLineView, "centerYAnchor");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "constraintEqualToAnchor:", v130);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v131);

    -[UIView heightAnchor](v4->_frequencyDotView, "heightAnchor");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "constraintEqualToConstant:", 9.0);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v133);

    -[UIView widthAnchor](v4->_frequencyDotView, "widthAnchor");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "constraintEqualToConstant:", 9.0);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObject:", v135);

    -[UIView leadingAnchor](v4->_frequencyDotView, "leadingAnchor");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v4->_frequencyLineView, "trailingAnchor");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "constraintEqualToAnchor:", v137);
    v138 = objc_claimAutoreleasedReturnValue();
    frequencyDotLeadingConstraint = v4->_frequencyDotLeadingConstraint;
    v4->_frequencyDotLeadingConstraint = (NSLayoutConstraint *)v138;

    objc_msgSend(v43, "addObject:", v4->_frequencyDotLeadingConstraint);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v43);

  }
  return v4;
}

+ (id)reuseIdentifier
{
  return CFSTR("NCAppPickerViewCell");
}

+ (double)preferredHeightForText:(id)a3 cellWidth:(double)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  double v20;
  double v21;
  uint64_t v23;
  _QWORD v24[2];
  CGRect v25;

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "_titleFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!preferredHeightForText_cellWidth____drawingContext)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0DC12A0]);
    v9 = (void *)preferredHeightForText_cellWidth____drawingContext;
    preferredHeightForText_cellWidth____drawingContext = (uint64_t)v8;

    objc_msgSend((id)preferredHeightForText_cellWidth____drawingContext, "setWantsNumberOfLineFragments:", 1);
  }
  v23 = *MEMORY[0x1E0DC1138];
  v24[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 1, v10, preferredHeightForText_cellWidth____drawingContext, a4 + -102.0, 0.0);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v25.origin.x = v12;
  v25.origin.y = v14;
  v25.size.width = v16;
  v25.size.height = v18;
  CGRectGetHeight(v25);

  objc_msgSend(a1, "_frequencyFont");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lineHeight");

  _NCMainScreenScale();
  UICeilToScale();
  if (v20 >= 62.0)
    v21 = v20;
  else
    v21 = 62.0;

  return v21;
}

+ (double)preferredImageDimension
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = ceil(v3 * 29.0);

  return v4;
}

- (void)configureWithName:(id)a3 image:(id)a4 avgNumberOfNotificationsCount:(unint64_t)a5 maxAvgNumberOfNotificationsCount:(unint64_t)a6 selected:(BOOL)a7
{
  _BOOL8 v7;
  UILabel *titleLabel;
  id v13;
  UILabel *frequencyLabel;
  void *v15;

  v7 = a7;
  titleLabel = self->_titleLabel;
  v13 = a4;
  -[UILabel setText:](titleLabel, "setText:", a3);
  -[UIImageView setImage:](self->_iconImageView, "setImage:", v13);

  -[NCCheckmarkButton setSelected:](self->_checkmarkButton, "setSelected:", v7);
  frequencyLabel = self->_frequencyLabel;
  -[NCAppPickerViewCell _frequencyTextForCount:](self, "_frequencyTextForCount:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](frequencyLabel, "setText:", v15);

  self->_avgNumberOfNotificationsCount = a5;
  self->_maxAvgNumberOfNotificationsCount = a6;
  -[NCAppPickerViewCell setNeedsLayout](self, "setNeedsLayout");
  -[NCAppPickerViewCell layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCAppPickerViewCell;
  -[NCAppPickerViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[UIImageView setImage:](self->_iconImageView, "setImage:", 0);
  -[UILabel setText:](self->_frequencyLabel, "setText:", 0);
  -[UILabel setText:](self->_titleLabel, "setText:", 0);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCAppPickerViewCell;
  -[NCAppPickerViewCell layoutSubviews](&v3, sel_layoutSubviews);
  -[NCAppPickerViewCell _layoutLine](self, "_layoutLine");
}

- (id)_frequencyTextForCount:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringFromNumber:numberStyle:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_layoutLine
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double Width;
  unint64_t maxAvgNumberOfNotificationsCount;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  _QWORD v18[2];
  CGRect v19;

  v18[1] = *MEMORY[0x1E0C80C00];
  -[UIView frame](self->_titleAndFrequencyContainer, "frame");
  v4 = v3;
  -[NCAppPickerViewCell _frequencyTextForCount:](self, "_frequencyTextForCount:", self->_maxAvgNumberOfNotificationsCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView frame](self->_titleAndFrequencyContainer, "frame");
  v7 = v6;
  v9 = v8;
  v17 = *MEMORY[0x1E0DC1138];
  objc_msgSend((id)objc_opt_class(), "_frequencyFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 1, v11, 0, v7, v9);
  Width = CGRectGetWidth(v19);

  maxAvgNumberOfNotificationsCount = self->_maxAvgNumberOfNotificationsCount;
  v14 = 0.0;
  if (maxAvgNumberOfNotificationsCount)
    v14 = (double)self->_avgNumberOfNotificationsCount / (double)maxAvgNumberOfNotificationsCount;
  v15 = floor(fmax(v4 - Width + -4.0 + -4.5, 0.0) * v14);
  -[NSLayoutConstraint setConstant:](self->_frequencyLineWidthConstraint, "setConstant:", v15);
  if (v15 >= 4.5)
    v16 = -4.5;
  else
    v16 = 0.0;
  -[NSLayoutConstraint setConstant:](self->_frequencyDotLeadingConstraint, "setConstant:", v16);
  -[UIView setHidden:](self->_frequencyLineView, "setHidden:", v15 < 4.5);
}

+ (id)_frequencyFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
}

+ (id)_titleFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frequencyDotLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_frequencyLineWidthConstraint, 0);
  objc_storeStrong((id *)&self->_frequencyLabel, 0);
  objc_storeStrong((id *)&self->_frequencyDotView, 0);
  objc_storeStrong((id *)&self->_frequencyLineView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleAndFrequencyContainer, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_checkmarkButton, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
