@implementation UIActivityActionGroupCell

- (UIActivityActionGroupCell)initWithFrame:(CGRect)a3
{
  UIActivityActionGroupCell *v3;
  _UIActivityActionCellTitleLabel *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *v17;
  double v18;
  double v19;
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
  double v63;
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
  double v86;
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
  uint64_t v120;
  NSLayoutConstraint *titleLabelHeightAnchor;
  void *v122;
  void *v123;
  double v124;
  void *v126;
  NSString *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  objc_super v132;

  v132.receiver = self;
  v132.super_class = (Class)UIActivityActionGroupCell;
  v3 = -[UIActivityActionCell initWithFrame:](&v132, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(_UIActivityActionCellTitleLabel);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityActionCellTitleLabel setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[_UIActivityActionCellTitleLabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UIActivityActionCellTitleLabel setLineBreakMode:](v4, "setLineBreakMode:", 4);
    -[_UIActivityActionCellTitleLabel setAlpha:](v4, "setAlpha:", 0.0);
    -[UIActivityActionGroupCell setTitleLabel:](v3, "setTitleLabel:", v4);
    v6 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    objc_msgSend(v6, "setContentMode:", 4);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v131 = v6;
    -[UIActivityActionGroupCell setActivityImageView:](v3, "setActivityImageView:", v6);
    v7 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v130 = v7;
    -[UIActivityActionGroupCell setActivitySlotView:](v3, "setActivitySlotView:", v7);
    v8 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v129 = v8;
    -[UIActivityActionGroupCell setTitleSlotView:](v3, "setTitleSlotView:", v8);
    v9 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    objc_msgSend(v9, "setAxis:", 1);
    objc_msgSend(v9, "setSpacing:", -2.0);
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v128 = v9;
    -[UIActivityActionGroupCell setTitleStackView:](v3, "setTitleStackView:", v9);
    v10 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    objc_msgSend(v10, "setAlignment:", 3);
    objc_msgSend(v10, "setSpacing:", 8.0);
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v126 = v10;
    -[UIActivityActionGroupCell setImageStackView:](v3, "setImageStackView:", v10);
    -[UIActivityActionGroupCell contentView](v3, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0DC37E8];
    v13 = *MEMORY[0x1E0DC4A88];
    objc_msgSend(MEMORY[0x1E0DC37F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0x8000, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fontWithDescriptor:size:", v14, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIActivityActionGroupCell traitCollection](v3, "traitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "preferredContentSizeCategory");
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();

    -[UIActivityActionGroupCell _legacyIconSizeForContentSizeCategory:](v3, "_legacyIconSizeForContentSizeCategory:", v17);
    v19 = v18;
    v127 = v17;
    if (UIContentSizeCategoryIsAccessibilityCategory(v17))
    {
      v20 = (void *)MEMORY[0x1E0DC37F0];
      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0DC48D8]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v13, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "fontDescriptorWithSymbolicTraits:", 0x8000);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC37E8], "fontWithDescriptor:size:", v23, 0.0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v24 = v15;
    }
    -[UIActivityActionGroupCell titleStackView](v3, "titleStackView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityActionGroupCell titleLabel](v3, "titleLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addArrangedSubview:", v26);

    -[UIActivityActionGroupCell imageStackView](v3, "imageStackView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityActionGroupCell activityImageView](v3, "activityImageView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addArrangedSubview:", v28);

    -[UIActivityActionGroupCell titleStackView](v3, "titleStackView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v29);

    -[UIActivityActionGroupCell imageStackView](v3, "imageStackView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v30);

    -[UIActivityActionGroupCell activitySlotView](v3, "activitySlotView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v31);

    -[UIActivityActionGroupCell titleSlotView](v3, "titleSlotView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v32);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityActionGroupCell titleStackView](v3, "titleStackView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutMarginsGuide");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v38);

    -[UIActivityActionGroupCell titleStackView](v3, "titleStackView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintGreaterThanOrEqualToAnchor:constant:", v41, 4.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v42);

    objc_msgSend(v11, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityActionGroupCell titleStackView](v3, "titleStackView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "bottomAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintGreaterThanOrEqualToAnchor:constant:", v45, 4.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v46);

    objc_msgSend(v11, "heightAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityActionGroupCell titleLabel](v3, "titleLabel");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "heightAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintGreaterThanOrEqualToAnchor:constant:", v49, 30.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v50);

    -[UIActivityActionGroupCell titleStackView](v3, "titleStackView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "centerYAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "centerYAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v54);

    -[UIActivityActionGroupCell imageStackView](v3, "imageStackView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityActionGroupCell titleStackView](v3, "titleStackView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "trailingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:constant:", v58, 16.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v59);

    objc_msgSend(v11, "trailingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityActionGroupCell imageStackView](v3, "imageStackView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "trailingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "lineHeight");
    objc_msgSend(v60, "constraintEqualToAnchor:constant:", v62, v63 + 6.0 + v19 * -0.5);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v64);

    -[UIActivityActionGroupCell imageStackView](v3, "imageStackView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "centerYAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "centerYAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v68);

    -[UIActivityActionGroupCell imageStackView](v3, "imageStackView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "heightAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToConstant:", v19);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v71);

    -[UIActivityActionGroupCell activityImageView](v3, "activityImageView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "widthAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToConstant:", v19);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v74);

    -[UIActivityActionGroupCell activityImageView](v3, "activityImageView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "heightAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToConstant:", v19);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v77);

    -[UIActivityActionGroupCell activitySlotView](v3, "activitySlotView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "centerXAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityActionGroupCell activityImageView](v3, "activityImageView");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "centerXAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintEqualToAnchor:", v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v82);

    objc_msgSend(v11, "trailingAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityActionGroupCell activitySlotView](v3, "activitySlotView");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "centerXAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "lineHeight");
    objc_msgSend(v83, "constraintEqualToAnchor:constant:", v85, v86 + 6.0);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v87);

    -[UIActivityActionGroupCell activitySlotView](v3, "activitySlotView");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "centerYAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "centerYAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "constraintEqualToAnchor:", v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v91);

    -[UIActivityActionGroupCell activitySlotView](v3, "activitySlotView");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "widthAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToConstant:", v19);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v94);

    -[UIActivityActionGroupCell activitySlotView](v3, "activitySlotView");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "heightAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "constraintEqualToConstant:", v19);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v97);

    -[UIActivityActionGroupCell titleSlotView](v3, "titleSlotView");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "widthAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityActionGroupCell titleLabel](v3, "titleLabel");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "widthAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "constraintEqualToAnchor:", v101);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v102);

    -[UIActivityActionGroupCell titleSlotView](v3, "titleSlotView");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "heightAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityActionGroupCell titleLabel](v3, "titleLabel");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "heightAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "constraintEqualToAnchor:", v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v107);

    -[UIActivityActionGroupCell titleSlotView](v3, "titleSlotView");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "centerYAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityActionGroupCell titleLabel](v3, "titleLabel");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "centerYAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "constraintEqualToAnchor:", v111);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v112);

    -[UIActivityActionGroupCell titleSlotView](v3, "titleSlotView");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "centerXAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityActionGroupCell titleLabel](v3, "titleLabel");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "centerXAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "constraintEqualToAnchor:", v116);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v117);

    -[UIActivityActionGroupCell titleLabel](v3, "titleLabel");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "heightAnchor");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "constraintGreaterThanOrEqualToConstant:", 0.0);
    v120 = objc_claimAutoreleasedReturnValue();
    titleLabelHeightAnchor = v3->_titleLabelHeightAnchor;
    v3->_titleLabelHeightAnchor = (NSLayoutConstraint *)v120;

    -[NSLayoutConstraint setActive:](v3->_titleLabelHeightAnchor, "setActive:", 0);
    objc_msgSend(v33, "addObject:", v3->_titleLabelHeightAnchor);
    objc_msgSend(v11, "heightAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "constraintEqualToConstant:", 0.0);
    v123 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v124) = 1132068864;
    objc_msgSend(v123, "setPriority:", v124);
    objc_msgSend(v33, "addObject:", v123);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v33);

  }
  return v3;
}

- (id)subtitleLabel
{
  void *v3;
  _UIActivityActionCellTitleLabel *v4;
  void *v5;
  void *v6;

  -[UIActivityActionGroupCell subtitleLabelIfLoaded](self, "subtitleLabelIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(_UIActivityActionCellTitleLabel);
    -[_UIActivityActionCellTitleLabel setTextStyle:](v4, "setTextStyle:", *MEMORY[0x1E0DC4B10]);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityActionCellTitleLabel setTextColor:](v4, "setTextColor:", v5);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityActionCellTitleLabel setBackgroundColor:](v4, "setBackgroundColor:", v6);

    -[_UIActivityActionCellTitleLabel setLineBreakMode:](v4, "setLineBreakMode:", 4);
    -[_UIActivityActionCellTitleLabel setAlpha:](v4, "setAlpha:", 0.0);
    -[_UIActivityActionCellTitleLabel setHidden:](v4, "setHidden:", 1);
    -[UIStackView addArrangedSubview:](self->_titleStackView, "addArrangedSubview:", v4);
    -[UIActivityActionGroupCell setSubtitleLabelIfLoaded:](self, "setSubtitleLabelIfLoaded:", v4);

  }
  return -[UIActivityActionGroupCell subtitleLabelIfLoaded](self, "subtitleLabelIfLoaded");
}

- (id)badgeView
{
  void *v3;
  _UIActivityActionCellBadgeView *v4;
  void *v5;

  -[UIActivityActionGroupCell badgeViewIfLoaded](self, "badgeViewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(_UIActivityActionCellBadgeView);
    -[_UIActivityActionCellBadgeView setAlpha:](v4, "setAlpha:", 0.0);
    -[_UIActivityActionCellBadgeView setHidden:](v4, "setHidden:", 1);
    -[UIActivityActionGroupCell imageStackView](self, "imageStackView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertArrangedSubview:atIndex:", v4, 0);

    -[UIActivityActionGroupCell setBadgeViewIfLoaded:](self, "setBadgeViewIfLoaded:", v4);
  }
  return -[UIActivityActionGroupCell badgeViewIfLoaded](self, "badgeViewIfLoaded");
}

- (id)statusImageView
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;

  -[UIActivityActionGroupCell statusImageViewIfLoaded](self, "statusImageViewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPreferredSymbolConfiguration:", v5);

    objc_msgSend(v4, "setContentMode:", 4);
    objc_msgSend(v4, "setAlpha:", 0.0);
    objc_msgSend(v4, "setHidden:", 1);
    LODWORD(v6) = 1144766464;
    objc_msgSend(v4, "setContentHuggingPriority:forAxis:", 0, v6);
    -[UIActivityActionGroupCell imageStackView](self, "imageStackView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityActionGroupCell badgeViewIfLoaded](self, "badgeViewIfLoaded");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertArrangedSubview:atIndex:", v4, v8 != 0);

    -[UIActivityActionGroupCell setStatusImageViewIfLoaded:](self, "setStatusImageViewIfLoaded:", v4);
  }
  return -[UIActivityActionGroupCell statusImageViewIfLoaded](self, "statusImageViewIfLoaded");
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIActivityActionGroupCell;
  -[UIActivityActionCell prepareForReuse](&v4, sel_prepareForReuse);
  -[UIActivityActionGroupCell imageStackView](self, "imageStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v3 = a3;
  -[UIActivityActionGroupCell activitySlotView](self, "activitySlotView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIActivityActionGroupCell titleSlotView](self, "titleSlotView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15.receiver = self;
  v15.super_class = (Class)UIActivityActionGroupCell;
  -[UIActivityActionCell setHighlighted:](&v15, sel_setHighlighted_, v3);
  -[UIActivityActionGroupCell activitySlotView](self, "activitySlotView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setContents:", v7);

  -[UIActivityActionGroupCell titleSlotView](self, "titleSlotView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContents:", v10);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v3 = a3;
  -[UIActivityActionGroupCell activitySlotView](self, "activitySlotView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIActivityActionGroupCell titleSlotView](self, "titleSlotView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15.receiver = self;
  v15.super_class = (Class)UIActivityActionGroupCell;
  -[UIActivityActionGroupCell setSelected:](&v15, sel_setSelected_, v3);
  -[UIActivityActionGroupCell activitySlotView](self, "activitySlotView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setContents:", v7);

  -[UIActivityActionGroupCell titleSlotView](self, "titleSlotView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContents:", v10);

}

- (void)setDisabled:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIActivityActionGroupCell;
  -[UIActivityActionCell setDisabled:](&v10, sel_setDisabled_);
  if (v3)
    v5 = 0.4;
  else
    v5 = 1.0;
  -[UIActivityActionGroupCell titleStackView](self, "titleStackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

  -[UIActivityActionGroupCell imageStackView](self, "imageStackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v5);

  -[UIActivityActionGroupCell activitySlotView](self, "activitySlotView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v5);

  -[UIActivityActionGroupCell titleSlotView](self, "titleSlotView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", v5);

}

- (double)_legacyIconSizeForContentSizeCategory:(id)a3
{
  double result;

  +[UIActivity imageWidthForContentSizeCategory:](UIActivity, "imageWidthForContentSizeCategory:", a3);
  return result;
}

- (void)setTitle:(id)a3
{
  id v5;
  NSString *title;
  NSString *v7;
  char v8;
  NSString *v9;

  v5 = a3;
  title = self->_title;
  v9 = (NSString *)v5;
  v7 = title;
  if (v7 == v9)
  {

  }
  else
  {
    if ((v9 == 0) != (v7 != 0))
    {
      v8 = -[NSString isEqual:](v9, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_title, a3);
    -[UIActivityActionGroupCell _updateTitleView](self, "_updateTitleView");
  }
LABEL_8:

}

- (void)setSubtitle:(id)a3
{
  id v5;
  NSString *subtitle;
  NSString *v7;
  char v8;
  NSString *v9;

  v5 = a3;
  subtitle = self->_subtitle;
  v9 = (NSString *)v5;
  v7 = subtitle;
  if (v7 == v9)
  {

  }
  else
  {
    if ((v9 == 0) != (v7 != 0))
    {
      v8 = -[NSString isEqual:](v9, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_subtitle, a3);
    -[UIActivityActionGroupCell _updateSubtitleLabel](self, "_updateSubtitleLabel");
  }
LABEL_8:

}

- (void)setImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    -[UIActivityActionGroupCell _updateImageView](self, "_updateImageView");
    v5 = v6;
  }

}

- (void)setStatusImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_statusImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_statusImage, a3);
    -[UIActivityActionGroupCell _updateStatusImageView](self, "_updateStatusImageView");
    v5 = v6;
  }

}

- (void)setStatusImageTintColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_statusImageTintColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_statusImageTintColor, a3);
    -[UIActivityActionGroupCell _updateStatusImageView](self, "_updateStatusImageView");
    v5 = v6;
  }

}

- (void)setImageSlotID:(unsigned int)a3
{
  if (self->_imageSlotID != a3)
  {
    self->_imageSlotID = a3;
    -[UIActivityActionGroupCell _updateImageView](self, "_updateImageView");
  }
}

- (void)setTitleSlotID:(unsigned int)a3
{
  if (self->_titleSlotID != a3)
  {
    self->_titleSlotID = a3;
    -[UIActivityActionGroupCell _updateTitleView](self, "_updateTitleView");
  }
}

- (void)setPlatterTextHeight:(double)a3
{
  if (self->_platterTextHeight != a3)
  {
    self->_platterTextHeight = a3;
    -[UIActivityActionGroupCell _updateTitleHeight](self, "_updateTitleHeight");
  }
}

- (void)setContentTintColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_contentTintColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_contentTintColor, a3);
    -[UIActivityActionGroupCell _updateContentTintColor](self, "_updateContentTintColor");
    v5 = v6;
  }

}

- (void)_updateContentTintColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  -[UIActivityActionGroupCell contentTintColor](self, "contentTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityActionGroupCell titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v3);

  -[UIActivityActionGroupCell contentTintColor](self, "contentTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityActionGroupCell activityImageView](self, "activityImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v5);

  -[UIActivityActionGroupCell contentTintColor](self, "contentTintColor");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v10, "CGColor");
  -[UIActivityActionGroupCell activitySlotView](self, "activitySlotView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentsMultiplyColor:", v7);

}

- (void)_updateSubtitleLabel
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  double v8;
  void *v9;
  id v10;

  -[UIActivityActionGroupCell subtitle](self, "subtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  -[UIActivityActionGroupCell subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityActionGroupCell subtitleLabel](self, "subtitleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  v7 = v4 == 0;
  if (v4)
    v8 = 1.0;
  else
    v8 = 0.0;
  -[UIActivityActionGroupCell subtitleLabel](self, "subtitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", v8);

  -[UIActivityActionGroupCell subtitleLabel](self, "subtitleLabel");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v7);

}

- (void)_updateBadgeWithText:(id)a3 textColor:(id)a4 backgroundColor:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  double v18;
  void *v19;
  id v20;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(v10, "length");
  -[UIActivityActionGroupCell badgeView](self, "badgeView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v10);

  -[UIActivityActionGroupCell badgeView](self, "badgeView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextColor:", v9);

  -[UIActivityActionGroupCell badgeView](self, "badgeView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v8);

  v17 = v11 == 0;
  if (v11)
    v18 = 1.0;
  else
    v18 = 0.0;
  -[UIActivityActionGroupCell badgeView](self, "badgeView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAlpha:", v18);

  -[UIActivityActionGroupCell badgeView](self, "badgeView");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setHidden:", v17);

}

- (void)_updateImageView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  id v16;

  -[UIActivityActionGroupCell image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIActivityActionGroupCell image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityActionGroupCell activityImageView](self, "activityImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

  if (v3)
    v6 = 1.0;
  else
    v6 = 0.0;
  -[UIActivityActionGroupCell activityImageView](self, "activityImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v6);

  v8 = -[UIActivityActionGroupCell imageSlotID](self, "imageSlotID");
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CD2720], "objectForSlot:", -[UIActivityActionGroupCell imageSlotID](self, "imageSlotID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0CD2F88];
    -[UIActivityActionGroupCell activitySlotView](self, "activitySlotView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContentsGravity:", v10);

    -[UIActivityActionGroupCell activitySlotView](self, "activitySlotView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContents:", v9);

  }
  else
  {
    -[UIActivityActionGroupCell activitySlotView](self, "activitySlotView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContents:", 0);
  }

  if (v8)
    v15 = 1.0;
  else
    v15 = 0.0;
  -[UIActivityActionGroupCell activitySlotView](self, "activitySlotView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAlpha:", v15);

}

- (void)_updateStatusImageView
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  _BOOL8 v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[UIActivityActionGroupCell statusImage](self, "statusImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIActivityActionGroupCell statusImage](self, "statusImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityActionGroupCell statusImageView](self, "statusImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

  v6 = v3 == 0;
  v7 = v3 == 0;
  if (v6)
    v8 = 0.0;
  else
    v8 = 1.0;
  -[UIActivityActionGroupCell statusImageView](self, "statusImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", v8);

  -[UIActivityActionGroupCell statusImageView](self, "statusImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v7);

  -[UIActivityActionGroupCell statusImageTintColor](self, "statusImageTintColor");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[UIActivityActionGroupCell statusImageView](self, "statusImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTintColor:", v12);

}

- (void)_updateTitleView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  id *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  id v27;

  -[UIActivityActionGroupCell title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  -[UIActivityActionGroupCell title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityActionGroupCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  if (v4)
    v7 = 1.0;
  else
    v7 = 0.0;
  -[UIActivityActionGroupCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v7);

  v9 = -[UIActivityActionGroupCell titleSlotID](self, "titleSlotID");
  if (v9)
  {
    -[UIActivityActionGroupCell traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "layoutDirection");

    v12 = (id *)MEMORY[0x1E0CD2FA0];
    if (v11 != 1)
      v12 = (id *)MEMORY[0x1E0CD2F80];
    v13 = (void *)MEMORY[0x1E0CD2720];
    v14 = *v12;
    objc_msgSend(v13, "objectForSlot:", -[UIActivityActionGroupCell titleSlotID](self, "titleSlotID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = _ShareSheetDeviceScreenScale();
    -[UIActivityActionGroupCell titleSlotView](self, "titleSlotView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setContentsScale:", v16);

    v19 = _ShareSheetDeviceScreenScale();
    -[UIActivityActionGroupCell titleSlotView](self, "titleSlotView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setRasterizationScale:", v19);

    -[UIActivityActionGroupCell titleSlotView](self, "titleSlotView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setContentsGravity:", v14);

    -[UIActivityActionGroupCell titleSlotView](self, "titleSlotView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setContents:", v15);

  }
  else
  {
    -[UIActivityActionGroupCell titleSlotView](self, "titleSlotView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setContents:", 0);
  }

  if (v9)
    v26 = 1.0;
  else
    v26 = 0.0;
  -[UIActivityActionGroupCell titleSlotView](self, "titleSlotView");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAlpha:", v26);

}

- (void)_updateTitleHeight
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[NSLayoutConstraint constant](self->_titleLabelHeightAnchor, "constant");
  v4 = v3;
  -[UIActivityActionGroupCell platterTextHeight](self, "platterTextHeight");
  v6 = v5 / _ShareSheetDeviceScreenScale();
  -[NSLayoutConstraint setConstant:](self->_titleLabelHeightAnchor, "setConstant:", v6);
  -[NSLayoutConstraint setActive:](self->_titleLabelHeightAnchor, "setActive:", v6 > 0.0);
  if (vabdd_f64(v4, v6) >= 0.00000011920929)
    -[UIActivityActionGroupCell setNeedsLayout](self, "setNeedsLayout");
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (_UIHostActivityProxy)activityProxy
{
  return self->_activityProxy;
}

- (void)setActivityProxy:(id)a3
{
  objc_storeStrong((id *)&self->_activityProxy, a3);
}

- (unsigned)imageSlotID
{
  return self->_imageSlotID;
}

- (unsigned)titleSlotID
{
  return self->_titleSlotID;
}

- (double)platterTextHeight
{
  return self->_platterTextHeight;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIImage)image
{
  return self->_image;
}

- (UIImage)statusImage
{
  return self->_statusImage;
}

- (UIColor)statusImageTintColor
{
  return self->_statusImageTintColor;
}

- (UIColor)contentTintColor
{
  return self->_contentTintColor;
}

- (_UIActivityActionCellTitleLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIImageView)activityImageView
{
  return self->_activityImageView;
}

- (void)setActivityImageView:(id)a3
{
  objc_storeStrong((id *)&self->_activityImageView, a3);
}

- (UIView)activitySlotView
{
  return self->_activitySlotView;
}

- (void)setActivitySlotView:(id)a3
{
  objc_storeStrong((id *)&self->_activitySlotView, a3);
}

- (UIView)titleSlotView
{
  return self->_titleSlotView;
}

- (void)setTitleSlotView:(id)a3
{
  objc_storeStrong((id *)&self->_titleSlotView, a3);
}

- (UIView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_platterView, a3);
}

- (UIStackView)titleStackView
{
  return self->_titleStackView;
}

- (void)setTitleStackView:(id)a3
{
  objc_storeStrong((id *)&self->_titleStackView, a3);
}

- (UIStackView)imageStackView
{
  return self->_imageStackView;
}

- (void)setImageStackView:(id)a3
{
  objc_storeStrong((id *)&self->_imageStackView, a3);
}

- (_UIActivityActionCellTitleLabel)subtitleLabelIfLoaded
{
  return self->_subtitleLabelIfLoaded;
}

- (void)setSubtitleLabelIfLoaded:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabelIfLoaded, a3);
}

- (_UIActivityActionCellBadgeView)badgeViewIfLoaded
{
  return self->_badgeViewIfLoaded;
}

- (void)setBadgeViewIfLoaded:(id)a3
{
  objc_storeStrong((id *)&self->_badgeViewIfLoaded, a3);
}

- (UIImageView)statusImageViewIfLoaded
{
  return self->_statusImageViewIfLoaded;
}

- (void)setStatusImageViewIfLoaded:(id)a3
{
  objc_storeStrong((id *)&self->_statusImageViewIfLoaded, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusImageViewIfLoaded, 0);
  objc_storeStrong((id *)&self->_badgeViewIfLoaded, 0);
  objc_storeStrong((id *)&self->_subtitleLabelIfLoaded, 0);
  objc_storeStrong((id *)&self->_imageStackView, 0);
  objc_storeStrong((id *)&self->_titleStackView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_titleSlotView, 0);
  objc_storeStrong((id *)&self->_activitySlotView, 0);
  objc_storeStrong((id *)&self->_activityImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_contentTintColor, 0);
  objc_storeStrong((id *)&self->_statusImageTintColor, 0);
  objc_storeStrong((id *)&self->_statusImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_activityProxy, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_titleLabelHeightAnchor, 0);
}

@end
