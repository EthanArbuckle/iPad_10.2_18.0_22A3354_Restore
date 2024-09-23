@implementation PUPickerOnboardingView

- (PUPickerOnboardingView)initWithClientDisplayName:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  PUPickerOnboardingView *v9;
  uint64_t v10;
  NSString *clientDisplayName;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *lastContentSizeCategory;
  uint64_t v16;
  UIView *overlayView;
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
  id v28;
  void *v29;
  uint64_t v30;
  UIVisualEffectView *platter;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
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
  uint64_t v49;
  NSArray *platterInsetConstraints;
  UILayoutGuide *v51;
  UILayoutGuide *contentLayoutGuide;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  NSArray *contentCenterConstraints;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  NSArray *contentInsetConstraints;
  id v73;
  void *v74;
  uint64_t v75;
  UIImageView *largeIconView;
  id v77;
  uint64_t v78;
  void *v79;
  void *v80;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  NSArray *largeIconViewConstraints;
  id v93;
  id v94;
  void *v95;
  uint64_t v96;
  UIImageView *attachmentAnchorView;
  id v98;
  void *v99;
  uint64_t v100;
  UIImageView *attachmentIconView;
  UITextView *v102;
  void *v103;
  void *v104;
  UITextView *textView;
  void *v106;
  uint64_t v107;
  NSLayoutConstraint *textViewWidthConstraint;
  double v109;
  void *v110;
  void *v111;
  uint64_t v112;
  NSLayoutConstraint *textViewTopAnchorToLargeIconConstraint;
  void *v114;
  void *v115;
  uint64_t v116;
  NSLayoutConstraint *textViewTopAnchorToPlatterConstraint;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  NSArray *textViewConstraints;
  void *v126;
  void *v127;
  uint64_t v128;
  UIButtonConfiguration *filledButtonConfiguration;
  void *v130;
  uint64_t v131;
  UIButtonConfiguration *plainButtonConfiguration;
  void *v133;
  UIButtonConfiguration *v134;
  void *v135;
  id *v136;
  void *v137;
  double v138;
  id v139;
  void *v140;
  void *v141;
  uint64_t v142;
  id v143;
  void *v144;
  void *v145;
  uint64_t v146;
  id v147;
  double v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  uint64_t v155;
  id v156;
  PUPickerPrivacyBadge *v157;
  id v158;
  PUPickerBadgeIconView *v159;
  id v160;
  void *v161;
  uint64_t v162;
  id v163;
  void *v164;
  void *v165;
  void *v166;
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
  id v182;
  void *v183;
  void *v184;
  void *v185;
  objc_super v186;
  _QWORD v187[4];
  _QWORD v188[3];
  _QWORD v189[4];
  _QWORD v190[4];
  _QWORD v191[2];
  _QWORD v192[4];
  _QWORD v193[6];

  v193[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v186.receiver = self;
  v186.super_class = (Class)PUPickerOnboardingView;
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = -[PUPickerOnboardingView initWithFrame:](&v186, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v6, v7, v8);
  if (v9)
  {
    v10 = objc_msgSend(v4, "copy");
    clientDisplayName = v9->_clientDisplayName;
    v9->_clientDisplayName = (NSString *)v10;

    -[PUPickerOnboardingView traitCollection](v9, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferredContentSizeCategory");
    v182 = v4;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    lastContentSizeCategory = v9->_lastContentSizeCategory;
    v9->_lastContentSizeCategory = (NSString *)v14;

    v9->_lastHeight = 1.79769313e308;
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v5, v6, v7, v8);
    overlayView = v9->_overlayView;
    v9->_overlayView = (UIView *)v16;

    objc_msgSend(MEMORY[0x1E0DC3658], "px_colorNamed:", CFSTR("PrivacyViewDimming"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9->_overlayView, "setBackgroundColor:", v18);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v9->_overlayView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUPickerOnboardingView addSubview:](v9, "addSubview:", v9->_overlayView);
    v170 = (void *)MEMORY[0x1E0CB3718];
    -[UIView topAnchor](v9->_overlayView, "topAnchor");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerOnboardingView topAnchor](v9, "topAnchor");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "constraintEqualToAnchor:", v183);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    v193[0] = v178;
    -[UIView bottomAnchor](v9->_overlayView, "bottomAnchor");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerOnboardingView bottomAnchor](v9, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v193[1] = v20;
    -[UIView leadingAnchor](v9->_overlayView, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerOnboardingView leadingAnchor](v9, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v193[2] = v23;
    -[UIView trailingAnchor](v9->_overlayView, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerOnboardingView trailingAnchor](v9, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v193[3] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v193, 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "activateConstraints:", v27);

    v28 = objc_alloc(MEMORY[0x1E0DC3F58]);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "initWithEffect:", v29);
    platter = v9->_platter;
    v9->_platter = (UIVisualEffectView *)v30;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v33 = objc_msgSend(v32, "CGColor");
    -[UIVisualEffectView layer](v9->_platter, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setShadowColor:", v33);

    -[UIVisualEffectView layer](v9->_platter, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v36) = 1041865114;
    objc_msgSend(v35, "setShadowOpacity:", v36);

    v37 = *MEMORY[0x1E0C9D820];
    v38 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    -[UIVisualEffectView layer](v9->_platter, "layer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setShadowOffset:", v37, v38);

    -[UIVisualEffectView layer](v9->_platter, "layer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setShadowRadius:", 1.0);

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v9->_platter, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIVisualEffectView _setCornerRadius:](v9->_platter, "_setCornerRadius:", 10.0);
    -[PUPickerOnboardingView addSubview:](v9, "addSubview:", v9->_platter);
    -[UIVisualEffectView leadingAnchor](v9->_platter, "leadingAnchor");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerOnboardingView leadingAnchor](v9, "leadingAnchor");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v185, "constraintGreaterThanOrEqualToAnchor:constant:", v179, 24.0);
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    v192[0] = v175;
    -[UIVisualEffectView topAnchor](v9->_platter, "topAnchor");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerOnboardingView topAnchor](v9, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v171, "constraintGreaterThanOrEqualToAnchor:constant:", v41, 24.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v192[1] = v42;
    -[PUPickerOnboardingView trailingAnchor](v9, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView trailingAnchor](v9->_platter, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintGreaterThanOrEqualToAnchor:constant:", v44, 24.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v192[2] = v45;
    -[PUPickerOnboardingView bottomAnchor](v9, "bottomAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView bottomAnchor](v9->_platter, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintGreaterThanOrEqualToAnchor:constant:", v47, 24.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v192[3] = v48;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v192, 4);
    v49 = objc_claimAutoreleasedReturnValue();
    platterInsetConstraints = v9->_platterInsetConstraints;
    v9->_platterInsetConstraints = (NSArray *)v49;

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v9->_platterInsetConstraints);
    v51 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
    contentLayoutGuide = v9->_contentLayoutGuide;
    v9->_contentLayoutGuide = v51;

    -[UILayoutGuide centerXAnchor](v9->_contentLayoutGuide, "centerXAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerOnboardingView safeAreaLayoutGuide](v9, "safeAreaLayoutGuide");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "centerXAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v191[0] = v56;
    -[UILayoutGuide centerYAnchor](v9->_contentLayoutGuide, "centerYAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerOnboardingView safeAreaLayoutGuide](v9, "safeAreaLayoutGuide");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "centerYAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v191[1] = v60;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v191, 2);
    v61 = objc_claimAutoreleasedReturnValue();
    contentCenterConstraints = v9->_contentCenterConstraints;
    v9->_contentCenterConstraints = (NSArray *)v61;

    -[UILayoutGuide leadingAnchor](v9->_contentLayoutGuide, "leadingAnchor");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView leadingAnchor](v9->_platter, "leadingAnchor");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v176, "constraintEqualToAnchor:constant:", v172, 16.0);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    v190[0] = v169;
    -[UILayoutGuide topAnchor](v9->_contentLayoutGuide, "topAnchor");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView topAnchor](v9->_platter, "topAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "constraintEqualToAnchor:constant:", v63, 16.0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v190[1] = v64;
    -[UIVisualEffectView trailingAnchor](v9->_platter, "trailingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v9->_contentLayoutGuide, "trailingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:constant:", v66, 16.0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v190[2] = v67;
    -[UIVisualEffectView bottomAnchor](v9->_platter, "bottomAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](v9->_contentLayoutGuide, "bottomAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:constant:", v69, 16.0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v190[3] = v70;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v190, 4);
    v71 = objc_claimAutoreleasedReturnValue();
    contentInsetConstraints = v9->_contentInsetConstraints;
    v9->_contentInsetConstraints = (NSArray *)v71;

    -[PUPickerOnboardingView addLayoutGuide:](v9, "addLayoutGuide:", v9->_contentLayoutGuide);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v9->_contentCenterConstraints);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v9->_contentInsetConstraints);
    v73 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("photos-32"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v73, "initWithImage:", v74);
    largeIconView = v9->_largeIconView;
    v9->_largeIconView = (UIImageView *)v75;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v9->_largeIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v77 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v78 = objc_msgSend(v77, "CGColor");
    -[UIImageView layer](v9->_largeIconView, "layer");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setShadowColor:", v78);

    -[UIImageView layer](v9->_largeIconView, "layer");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v81) = 1041865114;
    objc_msgSend(v80, "setShadowOpacity:", v81);

    -[UIImageView layer](v9->_largeIconView, "layer");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setShadowOffset:", v37, v38);

    -[UIImageView layer](v9->_largeIconView, "layer");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setShadowRadius:", 1.0);

    -[UIImageView widthAnchor](v9->_largeIconView, "widthAnchor");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v180, "constraintEqualToConstant:", 32.0);
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    v189[0] = v177;
    -[UIImageView heightAnchor](v9->_largeIconView, "heightAnchor");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v173, "constraintEqualToConstant:", 32.0);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v189[1] = v84;
    -[UIImageView topAnchor](v9->_largeIconView, "topAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](v9->_contentLayoutGuide, "topAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:", v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v189[2] = v87;
    -[UIImageView centerXAnchor](v9->_largeIconView, "centerXAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide centerXAnchor](v9->_contentLayoutGuide, "centerXAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "constraintEqualToAnchor:", v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v189[3] = v90;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v189, 4);
    v91 = objc_claimAutoreleasedReturnValue();
    largeIconViewConstraints = v9->_largeIconViewConstraints;
    v9->_largeIconViewConstraints = (NSArray *)v91;

    -[PUPickerOnboardingView addSubview:](v9, "addSubview:", v9->_largeIconView);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v9->_largeIconViewConstraints);
    v93 = objc_alloc(MEMORY[0x1E0DC3828]);
    -[PUPickerOnboardingView attachmentAnchorSize](v9, "attachmentAnchorSize");
    v181 = (void *)objc_msgSend(v93, "initWithSize:");
    v94 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(v181, "imageWithActions:", &__block_literal_global_104423);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v94, "initWithImage:", v95);
    attachmentAnchorView = v9->_attachmentAnchorView;
    v9->_attachmentAnchorView = (UIImageView *)v96;

    v98 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("PhotosIndicator"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v98, "initWithImage:", v99);
    attachmentIconView = v9->_attachmentIconView;
    v9->_attachmentIconView = (UIImageView *)v100;

    objc_msgSend(MEMORY[0x1E0DC3E50], "textViewUsingTextLayoutManager:", 1);
    v102 = (UITextView *)objc_claimAutoreleasedReturnValue();
    -[UITextView textContainer](v102, "textContainer");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "setLineFragmentPadding:", 0.0);

    -[UITextView setTextContainerInset:](v102, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v102, "setBackgroundColor:", v104);

    -[UITextView setEditable:](v102, "setEditable:", 0);
    -[UITextView setScrollEnabled:](v102, "setScrollEnabled:", 0);
    -[UITextView setDelaysContentTouches:](v102, "setDelaysContentTouches:", 0);
    -[UITextView setSelectable:](v102, "setSelectable:", 1);
    -[UITextView _setInteractiveTextSelectionDisabled:](v102, "_setInteractiveTextSelectionDisabled:", 1);
    textView = v9->_textView;
    v9->_textView = v102;

    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v9->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextView setAdjustsFontForContentSizeCategory:](v9->_textView, "setAdjustsFontForContentSizeCategory:", 1);
    -[UITextView setDelegate:](v9->_textView, "setDelegate:", v9);
    -[UITextView widthAnchor](v9->_textView, "widthAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "constraintEqualToConstant:", 320.0);
    v107 = objc_claimAutoreleasedReturnValue();
    textViewWidthConstraint = v9->_textViewWidthConstraint;
    v9->_textViewWidthConstraint = (NSLayoutConstraint *)v107;

    LODWORD(v109) = 1144750080;
    -[NSLayoutConstraint setPriority:](v9->_textViewWidthConstraint, "setPriority:", v109);
    -[UITextView topAnchor](v9->_textView, "topAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v9->_largeIconView, "bottomAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "constraintEqualToAnchor:constant:", v111, 12.0);
    v112 = objc_claimAutoreleasedReturnValue();
    textViewTopAnchorToLargeIconConstraint = v9->_textViewTopAnchorToLargeIconConstraint;
    v9->_textViewTopAnchorToLargeIconConstraint = (NSLayoutConstraint *)v112;

    -[UITextView topAnchor](v9->_textView, "topAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](v9->_contentLayoutGuide, "topAnchor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "constraintEqualToAnchor:", v115);
    v116 = objc_claimAutoreleasedReturnValue();
    textViewTopAnchorToPlatterConstraint = v9->_textViewTopAnchorToPlatterConstraint;
    v9->_textViewTopAnchorToPlatterConstraint = (NSLayoutConstraint *)v116;

    v188[0] = v9->_textViewWidthConstraint;
    -[UITextView leadingAnchor](v9->_textView, "leadingAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v9->_contentLayoutGuide, "leadingAnchor");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "constraintEqualToAnchor:", v119);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v188[1] = v120;
    -[UILayoutGuide trailingAnchor](v9->_contentLayoutGuide, "trailingAnchor");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView trailingAnchor](v9->_textView, "trailingAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "constraintEqualToAnchor:", v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v188[2] = v123;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v188, 3);
    v124 = objc_claimAutoreleasedReturnValue();
    textViewConstraints = v9->_textViewConstraints;
    v9->_textViewConstraints = (NSArray *)v124;

    -[PUPickerOnboardingView _updateTextView](v9, "_updateTextView");
    -[PUPickerOnboardingView addSubview:](v9, "addSubview:", v9->_textView);
    v126 = (void *)MEMORY[0x1E0CB3718];
    -[NSArray arrayByAddingObject:](v9->_textViewConstraints, "arrayByAddingObject:", v9->_textViewTopAnchorToLargeIconConstraint);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "activateConstraints:", v127);

    objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
    v128 = objc_claimAutoreleasedReturnValue();
    filledButtonConfiguration = v9->_filledButtonConfiguration;
    v9->_filledButtonConfiguration = (UIButtonConfiguration *)v128;

    -[UIButtonConfiguration setCornerStyle:](v9->_filledButtonConfiguration, "setCornerStyle:", 4);
    -[UIButtonConfiguration setButtonSize:](v9->_filledButtonConfiguration, "setButtonSize:", 2);
    PULocalizedString(CFSTR("PICKER_PRIVACY_OK_BUTTON_TITLE"));
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButtonConfiguration setTitle:](v9->_filledButtonConfiguration, "setTitle:", v130);

    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v131 = objc_claimAutoreleasedReturnValue();
    plainButtonConfiguration = v9->_plainButtonConfiguration;
    v9->_plainButtonConfiguration = (UIButtonConfiguration *)v131;

    -[UIButtonConfiguration setContentInsets:](v9->_plainButtonConfiguration, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
    -[UIButtonConfiguration setButtonSize:](v9->_plainButtonConfiguration, "setButtonSize:", 2);
    -[UIButtonConfiguration title](v9->_filledButtonConfiguration, "title");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButtonConfiguration setTitle:](v9->_plainButtonConfiguration, "setTitle:", v133);

    v134 = v9->_filledButtonConfiguration;
    v135 = (void *)MEMORY[0x1E0DC3518];
    v136 = v9;
    objc_msgSend(v135, "buttonWithConfiguration:primaryAction:", v134, 0);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "addTarget:action:forControlEvents:", v136, sel_transitionToBadge_, 0x2000);

    LODWORD(v138) = 1148846080;
    objc_msgSend(v137, "setContentHuggingPriority:forAxis:", 1, v138);
    objc_msgSend(v137, "setRole:", 1);
    v139 = v136[73];
    v136[73] = v137;

    objc_msgSend(v136[73], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v136[73], "topAnchor");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView bottomAnchor](v9->_textView, "bottomAnchor");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "constraintEqualToAnchor:constant:", v141, 16.0);
    v142 = objc_claimAutoreleasedReturnValue();
    v143 = v136[76];
    v136[76] = (id)v142;

    -[UILayoutGuide bottomAnchor](v9->_contentLayoutGuide, "bottomAnchor");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136[73], "bottomAnchor");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "constraintEqualToAnchor:", v145);
    v146 = objc_claimAutoreleasedReturnValue();
    v147 = v136[77];
    v136[77] = (id)v146;

    LODWORD(v148) = 1132199936;
    objc_msgSend(v136[77], "setPriority:", v148);
    objc_msgSend(v136[77], "constant");
    v136[79] = v149;
    v187[0] = v136[76];
    v187[1] = v136[77];
    objc_msgSend(v136[73], "widthAnchor");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "constraintGreaterThanOrEqualToConstant:", 80.0);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v187[2] = v151;
    objc_msgSend(v136[73], "centerXAnchor");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "centerXAnchor");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "constraintEqualToAnchor:", v153);
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    v187[3] = v154;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v187, 4);
    v155 = objc_claimAutoreleasedReturnValue();
    v156 = v136[78];
    v136[78] = (id)v155;

    objc_msgSend(v136, "addSubview:", v136[73]);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v136[78]);
    v157 = objc_alloc_init(PUPickerPrivacyBadge);
    v158 = v136[82];
    v136[82] = v157;

    objc_msgSend(v136[82], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v136[82], "setHidden:", 1);
    objc_msgSend(v136, "addSubview:", v136[82]);
    objc_msgSend(v136, "_updateBadgeConstraints");
    v159 = -[PUPickerBadgeIconView initWithFrame:]([PUPickerBadgeIconView alloc], "initWithFrame:", 0.0, 0.0, 20.0, 20.0);
    v160 = v136[84];
    v136[84] = v159;

    objc_msgSend(v136[84], "setHidden:", 1);
    -[UIVisualEffectView contentView](v9->_platter, "contentView");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "addSubview:", v136[84]);

    v162 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    v163 = v136[85];
    v136[85] = (id)v162;

    objc_msgSend(v136[82], "labelFont");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136[85], "setFont:", v164);

    objc_msgSend(v136[82], "labelText");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136[85], "setText:", v165);

    objc_msgSend(v136[85], "setHidden:", 1);
    -[UIVisualEffectView contentView](v9->_platter, "contentView");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v182;
    objc_msgSend(v166, "addSubview:", v136[85]);

  }
  return v9;
}

- (void)_updateTextView
{
  NSAttributedString *attributedText;
  void *v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIFont *v13;
  UIFont *titleFont;
  UIFont *v15;
  UIFont *bodyFont;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  attributedText = self->_attributedText;
  self->_attributedText = 0;

  -[PUPickerOnboardingView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  switch(self->_compressionLevel)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
      objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4B10], v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (uint64_t *)MEMORY[0x1E0DC4AB8];
      goto LABEL_3;
    case 5uLL:
      objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4AB8], v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (uint64_t *)MEMORY[0x1E0DC4A98];
      goto LABEL_3;
    case 6uLL:
      objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4A98], v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (uint64_t *)MEMORY[0x1E0DC4AA0];
LABEL_3:
      v7 = *v6;
      goto LABEL_4;
    case 7uLL:
      v7 = *MEMORY[0x1E0DC4AA0];
      objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4AA0], v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:
      objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v7, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v8 = 0;
      v5 = 0;
      break;
  }
  v21 = *MEMORY[0x1E0DC13C0];
  v19 = *MEMORY[0x1E0DC1458];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1448]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptorByAddingAttributes:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v12, 0.0);
  v13 = (UIFont *)objc_claimAutoreleasedReturnValue();
  titleFont = self->_titleFont;
  self->_titleFont = v13;

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v8, 0.0);
  v15 = (UIFont *)objc_claimAutoreleasedReturnValue();
  bodyFont = self->_bodyFont;
  self->_bodyFont = v15;

  -[PUPickerOnboardingView attributedText](self, "attributedText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerOnboardingView textView](self, "textView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAttributedText:", v17);

}

- (void)_updateBadgeConstraints
{
  uint64_t v3;
  void *v4;
  PUPickerOnboardingView *v5;
  PUPickerOnboardingView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *badgeConstraints;
  void *v16;
  NSArray *v17;
  void *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  if (self->_badgeConstraints)
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
  -[PUPickerOnboardingView badgeContainerView](self, "badgeContainerView");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (PUPickerOnboardingView *)v3;
  else
    v5 = self;
  v6 = v5;

  -[PUPickerPrivacyBadge leadingAnchor](self->_badge, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerOnboardingView safeAreaLayoutGuide](v6, "safeAreaLayoutGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v8, 8.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  -[PUPickerPrivacyBadge topAnchor](self->_badge, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerOnboardingView safeAreaLayoutGuide](v6, "safeAreaLayoutGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, 8.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  badgeConstraints = self->_badgeConstraints;
  self->_badgeConstraints = v14;

  v16 = (void *)MEMORY[0x1E0CB3718];
  v17 = self->_badgeConstraints;

  objc_msgSend(v16, "activateConstraints:", v17);
}

- (void)transitionToBadge:(id)a3
{
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double MaxX;
  id v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  void *v83;
  id v84;
  id v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  id v96;
  void *v97;
  double v98;
  void *v99;
  double v100;
  id v101;
  void *v102;
  void *v103;
  _QWORD v104[4];
  id v105;
  id v106;
  _QWORD v107[4];
  id v108;
  _QWORD v109[4];
  id v110;
  _QWORD v111[4];
  id v112;
  id v113;
  _QWORD v114[4];
  id v115;
  _QWORD v116[4];
  id v117;
  id v118;
  id v119;
  _QWORD v120[4];
  id v121;
  id v122;
  _QWORD v123[4];
  id v124;
  id v125;
  _QWORD v126[4];
  id v127;
  id v128;
  _QWORD v129[4];
  id v130;
  id v131;
  CGAffineTransform v132;
  CGAffineTransform v133;
  _QWORD v134[4];
  id v135;
  _QWORD v136[4];
  id v137;
  id location[3];
  CGRect v139;
  CGRect v140;

  v96 = a3;
  -[PUPickerOnboardingView platter](self, "platter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  v5 = (void *)MEMORY[0x1E0CB3718];
  -[PUPickerOnboardingView platterInsetConstraints](self, "platterInsetConstraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deactivateConstraints:", v6);

  v7 = (void *)MEMORY[0x1E0CB3718];
  -[PUPickerOnboardingView contentCenterConstraints](self, "contentCenterConstraints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deactivateConstraints:", v8);

  v9 = (void *)MEMORY[0x1E0CB3718];
  -[PUPickerOnboardingView contentInsetConstraints](self, "contentInsetConstraints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deactivateConstraints:", v10);

  -[PUPickerOnboardingView largeIconView](self, "largeIconView");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  v11 = (void *)MEMORY[0x1E0CB3718];
  -[PUPickerOnboardingView largeIconViewConstraints](self, "largeIconViewConstraints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deactivateConstraints:", v12);

  -[PUPickerOnboardingView textView](self, "textView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  objc_msgSend(v13, "setAutoresizingMask:", 40);
  v14 = (void *)MEMORY[0x1E0CB3718];
  -[PUPickerOnboardingView textViewConstraints](self, "textViewConstraints");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "deactivateConstraints:", v15);

  -[PUPickerOnboardingView button](self, "button");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  v17 = (void *)MEMORY[0x1E0CB3718];
  -[PUPickerOnboardingView buttonConstraints](self, "buttonConstraints");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "deactivateConstraints:", v18);

  -[PUPickerOnboardingView badge](self, "badge");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerOnboardingView delegate](self, "delegate");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  v20 = objc_alloc(MEMORY[0x1E0DC3F38]);
  v136[0] = MEMORY[0x1E0C809B0];
  v136[1] = 3221225472;
  v136[2] = __44__PUPickerOnboardingView_transitionToBadge___block_invoke;
  v136[3] = &unk_1E58ABD10;
  v21 = v16;
  v137 = v21;
  v103 = (void *)objc_msgSend(v20, "initWithDuration:controlPoint1:controlPoint2:animations:", v136, 0.3);
  v22 = objc_alloc(MEMORY[0x1E0DC3F38]);
  v134[0] = MEMORY[0x1E0C809B0];
  v134[1] = 3221225472;
  v134[2] = __44__PUPickerOnboardingView_transitionToBadge___block_invoke_2;
  v134[3] = &unk_1E58ABD10;
  v94 = v21;
  v135 = v94;
  v102 = (void *)objc_msgSend(v22, "initWithDuration:controlPoint1:controlPoint2:animations:", v134, 0.3, 0.33, 0.0);
  objc_msgSend(v103, "startAnimation");
  objc_msgSend(v102, "startAnimation");
  if (-[PUPickerOnboardingView compressionLevel](self, "compressionLevel"))
    -[PUPickerOnboardingView attachmentIconView](self, "attachmentIconView");
  else
    -[PUPickerOnboardingView largeIconView](self, "largeIconView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bounds");
  objc_msgSend(v23, "convertRect:toView:", v4);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  -[PUPickerOnboardingView badgeIconView](self, "badgeIconView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);
  objc_msgSend(v32, "setAlpha:", 0.0);
  objc_msgSend(v32, "setHidden:", 0);
  -[PUPickerOnboardingView badgeLabel](self, "badgeLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerOnboardingView titleFont](self, "titleFont");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "pointSize");
  v36 = v35;
  objc_msgSend(v33, "font");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "pointSize");
  v39 = v38;

  -[PUPickerOnboardingView traitCollection](self, "traitCollection");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v40, "layoutDirection"))
    v41 = -1.0;
  else
    v41 = 1.0;

  -[PUPickerOnboardingView attachmentAnchorView](self, "attachmentAnchorView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v41;
  v100 = v39;
  v43 = v36;
  objc_msgSend(v42, "bounds");
  objc_msgSend(v42, "convertRect:toView:", v4);
  v45 = v44;
  v47 = v46;
  v49 = v48;
  v51 = v50;
  objc_msgSend(v33, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v53 = v52;
  v55 = v54;
  v139.origin.x = v45;
  v139.origin.y = v47;
  v139.size.width = v49;
  v139.size.height = v51;
  MaxX = CGRectGetMaxX(v139);
  v93 = v42;
  v140.origin.x = v45;
  v140.origin.y = v47;
  v140.size.width = v49;
  v140.size.height = v51;
  objc_msgSend(v33, "setCenter:", MaxX + v43 / v100 * v53 * 0.5 * v98, CGRectGetMidY(v140));
  objc_msgSend(v33, "setBounds:", 0.0, 0.0, v53, v55);
  CGAffineTransformMakeScale(&v133, v43 / v100, v43 / v100);
  v132 = v133;
  objc_msgSend(v33, "setTransform:", &v132);
  objc_msgSend(v33, "setAlpha:", 0.0);
  objc_msgSend(v33, "setHidden:", 0);
  v57 = objc_alloc(MEMORY[0x1E0DC3F38]);
  v129[0] = MEMORY[0x1E0C809B0];
  v129[1] = 3221225472;
  v129[2] = __44__PUPickerOnboardingView_transitionToBadge___block_invoke_3;
  v129[3] = &unk_1E58ABCA8;
  v101 = v23;
  v130 = v101;
  v58 = v32;
  v131 = v58;
  v59 = (void *)objc_msgSend(v57, "initWithDuration:curve:animations:", 3, v129, 0.167);
  objc_msgSend(v59, "startAnimation");
  v99 = v59;
  v60 = objc_alloc(MEMORY[0x1E0DC3F38]);
  v126[0] = MEMORY[0x1E0C809B0];
  v126[1] = 3221225472;
  v126[2] = __44__PUPickerOnboardingView_transitionToBadge___block_invoke_4;
  v126[3] = &unk_1E58ABCA8;
  v61 = v4;
  v127 = v61;
  v62 = v19;
  v128 = v62;
  v63 = (void *)objc_msgSend(v60, "initWithDuration:controlPoint1:controlPoint2:animations:", v126, 0.5, 0.33, 0.0, 0.2, 1.0);
  objc_msgSend(v63, "startAnimationAfterDelay:", 0.167);
  v64 = objc_alloc(MEMORY[0x1E0DC3F38]);
  v123[0] = MEMORY[0x1E0C809B0];
  v123[1] = 3221225472;
  v123[2] = __44__PUPickerOnboardingView_transitionToBadge___block_invoke_5;
  v123[3] = &unk_1E58ABCA8;
  v65 = v61;
  v124 = v65;
  v66 = v62;
  v125 = v66;
  v67 = (void *)objc_msgSend(v64, "initWithDuration:controlPoint1:controlPoint2:animations:", v123, 0.5, 0.33, 0.0, 0.2, 1.0);
  objc_msgSend(v67, "startAnimationAfterDelay:", 0.217);
  v92 = v67;
  v68 = objc_alloc(MEMORY[0x1E0DC3F38]);
  v120[0] = MEMORY[0x1E0C809B0];
  v120[1] = 3221225472;
  v120[2] = __44__PUPickerOnboardingView_transitionToBadge___block_invoke_6;
  v120[3] = &unk_1E58ABCA8;
  v69 = v33;
  v121 = v69;
  v70 = v13;
  v122 = v70;
  v71 = (void *)objc_msgSend(v68, "initWithDuration:controlPoint1:controlPoint2:animations:", v120, 0.167, 0.33, 0.0, 0.67, 1.0);
  objc_msgSend(v71, "startAnimationAfterDelay:", 0.167);
  v91 = v71;
  v72 = objc_alloc(MEMORY[0x1E0DC3F38]);
  v116[0] = MEMORY[0x1E0C809B0];
  v116[1] = 3221225472;
  v116[2] = __44__PUPickerOnboardingView_transitionToBadge___block_invoke_7;
  v116[3] = &unk_1E58AB790;
  v73 = v58;
  v117 = v73;
  v74 = v66;
  v118 = v74;
  v90 = v69;
  v119 = v90;
  v75 = (void *)objc_msgSend(v72, "initWithDuration:controlPoint1:controlPoint2:animations:", v116, 0.5, 0.33, 0.0, 0.2, 1.0);
  objc_msgSend(v75, "startAnimationAfterDelay:", 0.167);
  v89 = v74;
  -[PUPickerOnboardingView overlayView](self, "overlayView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v63;
  v77 = objc_alloc(MEMORY[0x1E0DC3F38]);
  v114[0] = MEMORY[0x1E0C809B0];
  v114[1] = 3221225472;
  v114[2] = __44__PUPickerOnboardingView_transitionToBadge___block_invoke_8;
  v114[3] = &unk_1E58ABD10;
  v78 = v76;
  v115 = v78;
  v79 = (void *)objc_msgSend(v77, "initWithDuration:controlPoint1:controlPoint2:animations:", v114, 0.333, 0.33, 0.0, 0.67, 1.0);
  objc_msgSend(v79, "startAnimationAfterDelay:", 0.334);
  v111[0] = MEMORY[0x1E0C809B0];
  v111[1] = 3221225472;
  v111[2] = __44__PUPickerOnboardingView_transitionToBadge___block_invoke_9;
  v111[3] = &unk_1E58AB470;
  v80 = v97;
  v112 = v80;
  objc_copyWeak(&v113, location);
  objc_msgSend(v79, "addCompletion:", v111);
  objc_msgSend(v73, "flipToPrivacyIconAfterDelay:", 1.167);
  v81 = objc_alloc(MEMORY[0x1E0DC3F38]);
  v109[0] = MEMORY[0x1E0C809B0];
  v109[1] = 3221225472;
  v109[2] = __44__PUPickerOnboardingView_transitionToBadge___block_invoke_10;
  v109[3] = &unk_1E58ABD10;
  v82 = v65;
  v110 = v82;
  v83 = (void *)objc_msgSend(v81, "initWithDuration:controlPoint1:controlPoint2:animations:", v109, 0.167, 0.33, 0.0, 0.8, 0.7);
  objc_msgSend(v83, "startAnimationAfterDelay:", 3.217);
  v84 = objc_alloc(MEMORY[0x1E0DC3F38]);
  v107[0] = MEMORY[0x1E0C809B0];
  v107[1] = 3221225472;
  v107[2] = __44__PUPickerOnboardingView_transitionToBadge___block_invoke_11;
  v107[3] = &unk_1E58ABD10;
  v85 = v82;
  v108 = v85;
  v86 = (void *)objc_msgSend(v84, "initWithDuration:controlPoint1:controlPoint2:animations:", v107, 0.167, 0.33, 0.0, 0.67, 1.0);
  objc_msgSend(v86, "startAnimationAfterDelay:", 3.217);
  v104[0] = MEMORY[0x1E0C809B0];
  v104[1] = 3221225472;
  v104[2] = __44__PUPickerOnboardingView_transitionToBadge___block_invoke_12;
  v104[3] = &unk_1E58AB470;
  v87 = v80;
  v105 = v87;
  objc_copyWeak(&v106, location);
  objc_msgSend(v86, "addCompletion:", v104);
  objc_destroyWeak(&v106);

  objc_destroyWeak(&v113);
  objc_destroyWeak(location);

}

- (CGSize)attachmentIconSize
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  NSString *v7;
  BOOL IsAccessibilityCategory;
  unint64_t v9;
  double v10;
  CGSize result;

  -[PUPickerOnboardingView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 14.0;
  if (v4 != 5)
  {
    -[PUPickerOnboardingView traitCollection](self, "traitCollection", 14.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredContentSizeCategory");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

    if (IsAccessibilityCategory)
    {
      v5 = 32.0;
    }
    else
    {
      v9 = -[PUPickerOnboardingView compressionLevel](self, "compressionLevel");
      switch(v9)
      {
        case 5uLL:
          v5 = 18.0;
          break;
        case 7uLL:
          v5 = 14.0;
          break;
        case 6uLL:
          v5 = 16.0;
          break;
        default:
          v5 = 20.0;
          break;
      }
    }
  }
  v10 = v5;
  result.height = v10;
  result.width = v5;
  return result;
}

- (CGSize)attachmentAnchorSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  -[UIFont lineHeight](self->_titleFont, "lineHeight");
  v3 = v2;
  v4 = 3.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (NSAttributedString)attributedText
{
  NSAttributedString *attributedText;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PUImageTextAttachment *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  PUImageTextAttachment *v40;
  void *v41;
  PUImageTextAttachment *v42;
  void *v43;
  void *v44;
  NSAttributedString *v45;
  NSAttributedString *v46;
  NSAttributedString *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[3];
  _QWORD v61[3];
  _QWORD v62[3];
  _QWORD v63[3];
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[5];

  v67[3] = *MEMORY[0x1E0C80C00];
  attributedText = self->_attributedText;
  if (attributedText)
    return attributedText;
  PULocalizedString(CFSTR("PICKER_PRIVACY_TITLE"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerOnboardingView clientDisplayName](self, "clientDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {

    goto LABEL_7;
  }
  -[PUPickerOnboardingView clientDisplayName](self, "clientDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_7:
    PULocalizedString(CFSTR("PICKER_PRIVACY_MESSAGE_GENERIC"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  PULocalizedString(CFSTR("PICKER_PRIVACY_MESSAGE_%@_APP_NAME"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v8, v6);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  PULocalizedString(CFSTR("PICKER_PRIVACY_LEARN_MORE_MESSAGE"));
  v51 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1288], "defaultParagraphStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "setAlignment:", 1);
  objc_msgSend(v10, "setLineSpacing:", -2.0);
  v58 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v10, "setParagraphSpacing:", 2.0);
  v55 = v10;
  v11 = objc_msgSend(v10, "copy");
  v12 = [PUImageTextAttachment alloc];
  -[PUPickerOnboardingView attachmentAnchorView](self, "attachmentAnchorView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerOnboardingView attachmentAnchorSize](self, "attachmentAnchorSize");
  v14 = -[PUImageTextAttachment initWithImageView:size:](v12, "initWithImageView:size:", v13);

  v54 = (void *)v14;
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  v17 = *MEMORY[0x1E0DC1178];
  v57 = v16;
  objc_msgSend(v16, "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v11, 0, objc_msgSend(v16, "length"));
  v64 = *MEMORY[0x1E0DC1138];
  v18 = v64;
  -[PUPickerOnboardingView titleFont](self, "titleFont");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v19;
  v65 = *MEMORY[0x1E0DC1140];
  v20 = v65;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v17;
  v67[1] = v21;
  v67[2] = v11;
  v56 = (void *)v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, &v64, 3);
  v22 = objc_claimAutoreleasedReturnValue();

  v23 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(v59, "stringByAppendingString:", CFSTR("\n"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)v22;
  v25 = (void *)objc_msgSend(v23, "initWithString:attributes:", v24, v22);

  v62[0] = v18;
  -[PUPickerOnboardingView bodyFont](self, "bodyFont");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v26;
  v62[1] = v20;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v17;
  v63[1] = v27;
  v63[2] = v58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 3);
  v28 = objc_claimAutoreleasedReturnValue();

  v29 = objc_alloc(MEMORY[0x1E0CB3498]);
  v30 = v53;
  objc_msgSend(v53, "stringByAppendingString:", CFSTR(" "));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)v28;
  v32 = objc_msgSend(v29, "initWithString:attributes:", v31, v28);

  v33 = (void *)v32;
  v60[0] = v18;
  -[PUPickerOnboardingView bodyFont](self, "bodyFont");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = *MEMORY[0x1E0DC1160];
  v61[0] = v34;
  v61[1] = CFSTR("foo://bar");
  v60[1] = v35;
  v60[2] = v17;
  v49 = v17;
  v61[2] = v58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 3);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (void *)v51;
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:");
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v57);
  objc_msgSend(v39, "appendAttributedString:", v25);
  objc_msgSend(v39, "appendAttributedString:", v33);
  objc_msgSend(v39, "appendAttributedString:", v38);
  if (-[PUPickerOnboardingView compressionLevel](self, "compressionLevel"))
  {
    v48 = v25;
    v40 = [PUImageTextAttachment alloc];
    -[PUPickerOnboardingView attachmentIconView](self, "attachmentIconView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerOnboardingView attachmentIconSize](self, "attachmentIconSize");
    v42 = -[PUImageTextAttachment initWithImageView:size:](v40, "initWithImageView:size:", v41);

    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v43, "mutableCopy");

    v30 = v53;
    v37 = (void *)v51;
    objc_msgSend(v44, "addAttribute:value:range:", v49, v56, 0, objc_msgSend(v44, "length"));
    objc_msgSend(v39, "insertAttributedString:atIndex:", v44, 0);

    v25 = v48;
  }
  v45 = (NSAttributedString *)objc_msgSend(v39, "copy");
  v46 = self->_attributedText;
  self->_attributedText = v45;

  v47 = self->_attributedText;
  return v47;
}

- (void)setCompressionLevel:(unint64_t)a3
{
  unint64_t compressionLevel;
  double buttonBottomSpacing;
  unint64_t v6;
  double v7;
  double v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  BOOL v21;
  double v22;
  int *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (self->_compressionLevel != a3)
  {
    self->_compressionLevel = a3;
    -[PUPickerOnboardingView updateTraitsIfNeeded](self, "updateTraitsIfNeeded");
    -[PUPickerOnboardingView _updateTextView](self, "_updateTextView");
    -[PUPickerOnboardingView setNeedsLayout](self, "setNeedsLayout");
    compressionLevel = self->_compressionLevel;
    -[UIImageView setHidden:](self->_largeIconView, "setHidden:", compressionLevel != 0);
    if (compressionLevel)
    {
      -[NSLayoutConstraint setActive:](self->_textViewTopAnchorToLargeIconConstraint, "setActive:", 0);
      -[NSLayoutConstraint setActive:](self->_textViewTopAnchorToPlatterConstraint, "setActive:", 1);
      buttonBottomSpacing = self->_buttonBottomSpacing * 0.5;
    }
    else
    {
      -[NSLayoutConstraint setActive:](self->_textViewTopAnchorToPlatterConstraint, "setActive:", 0);
      -[NSLayoutConstraint setActive:](self->_textViewTopAnchorToLargeIconConstraint, "setActive:", 1);
      buttonBottomSpacing = self->_buttonBottomSpacing;
    }
    -[NSLayoutConstraint setConstant:](self->_buttonBottomConstraint, "setConstant:", buttonBottomSpacing);
    v6 = self->_compressionLevel;
    if (v6 == 2)
      v7 = 16.0;
    else
      v7 = 8.0;
    if (v6 >= 2)
      v8 = v7;
    else
      v8 = 24.0;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v9 = self->_platterInsetConstraints;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v29;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v13++), "setConstant:", v8);
        }
        while (v11 != v13);
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v11);
    }

    if (self->_compressionLevel <= 2)
      v14 = 16.0;
    else
      v14 = 8.0;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v15 = self->_contentInsetConstraints;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v19++), "setConstant:", v14, (_QWORD)v24);
        }
        while (v17 != v19);
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v17);
    }

    v20 = self->_compressionLevel;
    v21 = v20 > 3;
    if (v20 <= 3)
      v22 = 16.0;
    else
      v22 = 4.0;
    v23 = &OBJC_IVAR___PUPickerOnboardingView__filledButtonConfiguration;
    if (v21)
      v23 = &OBJC_IVAR___PUPickerOnboardingView__plainButtonConfiguration;
    -[UIButton setConfiguration:](self->_button, "setConfiguration:", *(Class *)((char *)&self->super.super.super.isa + *v23), (_QWORD)v24);
    -[NSLayoutConstraint setConstant:](self->_buttonTopConstraint, "setConstant:", v22);
  }
}

- (void)setBadgeContainerView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  id obj;

  v4 = a3;
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerOnboardingView window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
    v7 = v4;
  else
    v7 = 0;
  obj = v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_badgeContainerView);
  v9 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_badgeContainerView, obj);
    -[PUPickerOnboardingView _updateBadgeConstraints](self, "_updateBadgeConstraints");
    v9 = obj;
  }

}

- (void)setMaximumContentSizeCategory:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPickerOnboardingView;
  -[PUPickerOnboardingView setMaximumContentSizeCategory:](&v4, sel_setMaximumContentSizeCategory_, a3);
  -[PUPickerOnboardingView updateTraitsIfNeeded](self, "updateTraitsIfNeeded");
  -[PUPickerOnboardingView _updateTextView](self, "_updateTextView");
  -[PUPickerOnboardingView setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateTraitsIfNeeded
{
  objc_super v3;

  if (objc_msgSend(MEMORY[0x1E0DC3F10], "instancesRespondToSelector:", sel_updateTraitsIfNeeded))
  {
    v3.receiver = self;
    v3.super_class = (Class)PUPickerOnboardingView;
    -[PUPickerOnboardingView updateTraitsIfNeeded](&v3, sel_updateTraitsIfNeeded);
  }
}

- (void)layoutSubviews
{
  void *v3;
  int v4;
  uint64_t (**v5)(_QWORD);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSString *lastContentSizeCategory;
  void *v11;
  NSString *v12;
  NSComparisonResult v13;
  double Height;
  objc_class *v15;
  int *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSString *v40;
  NSString *v41;
  NSComparisonResult v42;
  void *v43;
  NSString *v44;
  NSString *v45;
  void *v46;
  void *v47;
  objc_super v48;
  objc_super v49;
  objc_super v50;
  objc_super v51;
  objc_super v52;
  objc_super v53;
  objc_super v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  objc_super v59;
  objc_super v60;
  objc_super v61;
  objc_super v62;
  objc_super v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  objc_super v68;
  objc_super v69;
  objc_super v70;
  objc_super v71;
  objc_super v72;
  objc_super v73;
  _QWORD aBlock[5];
  objc_super v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _QWORD v78[8];
  CGRect v79;

  v78[6] = *MEMORY[0x1E0C80C00];
  v75.receiver = self;
  v75.super_class = (Class)PUPickerOnboardingView;
  -[PUPickerOnboardingView layoutSubviews](&v75, sel_layoutSubviews);
  -[PUPickerOnboardingView overlayView](self, "overlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUserInteractionEnabled");

  if (v4)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __40__PUPickerOnboardingView_layoutSubviews__block_invoke;
    aBlock[3] = &unk_1E58AB498;
    aBlock[4] = self;
    v5 = (uint64_t (**)(_QWORD))_Block_copy(aBlock);
    v6 = *MEMORY[0x1E0DC48D8];
    v78[0] = *MEMORY[0x1E0DC48D0];
    v78[1] = v6;
    v7 = *MEMORY[0x1E0DC48F8];
    v78[2] = *MEMORY[0x1E0DC48F0];
    v78[3] = v7;
    v8 = *MEMORY[0x1E0DC4918];
    v78[4] = *MEMORY[0x1E0DC4900];
    v78[5] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    lastContentSizeCategory = self->_lastContentSizeCategory;
    -[PUPickerOnboardingView traitCollection](self, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferredContentSizeCategory");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    v13 = UIContentSizeCategoryCompareToCategory(lastContentSizeCategory, v12);

    -[PUPickerOnboardingView bounds](self, "bounds");
    Height = CGRectGetHeight(v79);
    v15 = *(objc_class **)&Height;
    v16 = &OBJC_IVAR___PUHeadroomVariableBlurView__blurFilter;
    if (v13 == NSOrderedSame)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", Height);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_lastHeight);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v17, "compare:", v18);

      v16 = &OBJC_IVAR___PUHeadroomVariableBlurView__blurFilter;
    }
    if (v13 == NSOrderedDescending)
    {
      if (-[PUPickerOnboardingView compressionLevel](self, "compressionLevel") == 7)
      {
        -[PUPickerOnboardingView setCompressionLevel:](self, "setCompressionLevel:", 6);
        v60.receiver = self;
        v60.super_class = (Class)PUPickerOnboardingView;
        -[PUPickerOnboardingView layoutSubviews](&v60, sel_layoutSubviews);
        if ((v5[2](v5) & 1) == 0)
          -[PUPickerOnboardingView setCompressionLevel:](self, "setCompressionLevel:", 7);
      }
      if (-[PUPickerOnboardingView compressionLevel](self, "compressionLevel") == 6)
      {
        -[PUPickerOnboardingView setCompressionLevel:](self, "setCompressionLevel:", 5);
        v59.receiver = self;
        v59.super_class = (Class)PUPickerOnboardingView;
        -[PUPickerOnboardingView layoutSubviews](&v59, sel_layoutSubviews);
        if ((v5[2](v5) & 1) == 0)
          -[PUPickerOnboardingView setCompressionLevel:](self, "setCompressionLevel:", 6);
      }
      if (-[PUPickerOnboardingView compressionLevel](self, "compressionLevel") == 5)
      {
        v47 = v9;
        objc_msgSend(v9, "reverseObjectEnumerator");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "nextObject");
        v22 = (id)objc_claimAutoreleasedReturnValue();
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v23 = v21;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v55, v76, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v56;
          while (2)
          {
            v27 = 0;
            v28 = v22;
            do
            {
              if (*(_QWORD *)v56 != v26)
                objc_enumerationMutation(v23);
              v29 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v27);
              -[PUPickerOnboardingView maximumContentSizeCategory](self, "maximumContentSizeCategory");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v30, "isEqualToString:", v28);

              if (v31)
              {
                -[PUPickerOnboardingView setMaximumContentSizeCategory:](self, "setMaximumContentSizeCategory:", v29);
                v54.receiver = self;
                v54.super_class = (Class)PUPickerOnboardingView;
                -[PUPickerOnboardingView layoutSubviews](&v54, sel_layoutSubviews);
                if ((((uint64_t (*)(void))v5[2])() & 1) == 0)
                {
                  -[PUPickerOnboardingView setMaximumContentSizeCategory:](self, "setMaximumContentSizeCategory:", v28);
                  v22 = v28;
                  goto LABEL_42;
                }
              }
              v22 = v29;

              ++v27;
              v28 = v22;
            }
            while (v25 != v27);
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v55, v76, 16);
            if (v25)
              continue;
            break;
          }
        }
LABEL_42:

        v9 = v47;
        objc_msgSend(v47, "firstObject");
        v32 = (id)objc_claimAutoreleasedReturnValue();

        if (v22 == v32)
        {
          -[PUPickerOnboardingView setMaximumContentSizeCategory:](self, "setMaximumContentSizeCategory:", 0);
          v53.receiver = self;
          v53.super_class = (Class)PUPickerOnboardingView;
          -[PUPickerOnboardingView layoutSubviews](&v53, sel_layoutSubviews);
          if ((v5[2](v5) & 1) == 0)
            -[PUPickerOnboardingView setMaximumContentSizeCategory:](self, "setMaximumContentSizeCategory:", v22);
        }

        v16 = &OBJC_IVAR___PUHeadroomVariableBlurView__blurFilter;
      }
      if (-[PUPickerOnboardingView compressionLevel](self, "compressionLevel") == 5)
      {
        -[PUPickerOnboardingView maximumContentSizeCategory](self, "maximumContentSizeCategory");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v33)
        {
          -[PUPickerOnboardingView setCompressionLevel:](self, "setCompressionLevel:", 4);
          v52.receiver = self;
          v52.super_class = (Class)PUPickerOnboardingView;
          -[PUPickerOnboardingView layoutSubviews](&v52, sel_layoutSubviews);
          if ((v5[2](v5) & 1) == 0)
            -[PUPickerOnboardingView setCompressionLevel:](self, "setCompressionLevel:", 5);
        }
      }
      if (-[PUPickerOnboardingView compressionLevel](self, "compressionLevel") == 4)
      {
        -[PUPickerOnboardingView setCompressionLevel:](self, "setCompressionLevel:", 3);
        v51.receiver = self;
        v51.super_class = (Class)PUPickerOnboardingView;
        -[PUPickerOnboardingView layoutSubviews](&v51, sel_layoutSubviews);
        if ((v5[2](v5) & 1) == 0)
          -[PUPickerOnboardingView setCompressionLevel:](self, "setCompressionLevel:", 4);
      }
      if (-[PUPickerOnboardingView compressionLevel](self, "compressionLevel") == 3)
      {
        -[PUPickerOnboardingView setCompressionLevel:](self, "setCompressionLevel:", 2);
        v50.receiver = self;
        v50.super_class = (Class)PUPickerOnboardingView;
        -[PUPickerOnboardingView layoutSubviews](&v50, sel_layoutSubviews);
        if ((v5[2](v5) & 1) == 0)
          -[PUPickerOnboardingView setCompressionLevel:](self, "setCompressionLevel:", 3);
      }
      if (-[PUPickerOnboardingView compressionLevel](self, "compressionLevel") == 2)
      {
        -[PUPickerOnboardingView setCompressionLevel:](self, "setCompressionLevel:", 1);
        v49.receiver = self;
        v49.super_class = (Class)PUPickerOnboardingView;
        -[PUPickerOnboardingView layoutSubviews](&v49, sel_layoutSubviews);
        if ((v5[2](v5) & 1) == 0)
          -[PUPickerOnboardingView setCompressionLevel:](self, "setCompressionLevel:", 2);
      }
      if (-[PUPickerOnboardingView compressionLevel](self, "compressionLevel") == 1)
      {
        -[PUPickerOnboardingView setCompressionLevel:](self, "setCompressionLevel:", 0);
        v48.receiver = self;
        v48.super_class = (Class)PUPickerOnboardingView;
        -[PUPickerOnboardingView layoutSubviews](&v48, sel_layoutSubviews);
        if ((v5[2](v5) & 1) == 0)
          -[PUPickerOnboardingView setCompressionLevel:](self, "setCompressionLevel:", 1);
      }
    }
    else if (v13 == NSOrderedAscending)
    {
      if (!-[PUPickerOnboardingView compressionLevel](self, "compressionLevel") && (v5[2](v5) & 1) == 0)
      {
        -[PUPickerOnboardingView setCompressionLevel:](self, "setCompressionLevel:", 1);
        v73.receiver = self;
        v73.super_class = (Class)PUPickerOnboardingView;
        -[PUPickerOnboardingView layoutSubviews](&v73, sel_layoutSubviews);
      }
      if (-[PUPickerOnboardingView compressionLevel](self, "compressionLevel") == 1 && (v5[2](v5) & 1) == 0)
      {
        -[PUPickerOnboardingView setCompressionLevel:](self, "setCompressionLevel:", 2);
        v72.receiver = self;
        v72.super_class = (Class)PUPickerOnboardingView;
        -[PUPickerOnboardingView layoutSubviews](&v72, sel_layoutSubviews);
      }
      if (-[PUPickerOnboardingView compressionLevel](self, "compressionLevel") == 2 && (v5[2](v5) & 1) == 0)
      {
        -[PUPickerOnboardingView setCompressionLevel:](self, "setCompressionLevel:", 3);
        v71.receiver = self;
        v71.super_class = (Class)PUPickerOnboardingView;
        -[PUPickerOnboardingView layoutSubviews](&v71, sel_layoutSubviews);
      }
      if (-[PUPickerOnboardingView compressionLevel](self, "compressionLevel") == 3 && (v5[2](v5) & 1) == 0)
      {
        -[PUPickerOnboardingView setCompressionLevel:](self, "setCompressionLevel:", 4);
        v70.receiver = self;
        v70.super_class = (Class)PUPickerOnboardingView;
        -[PUPickerOnboardingView layoutSubviews](&v70, sel_layoutSubviews);
      }
      if (-[PUPickerOnboardingView compressionLevel](self, "compressionLevel") == 4 && (v5[2](v5) & 1) == 0)
      {
        -[PUPickerOnboardingView setCompressionLevel:](self, "setCompressionLevel:", 5);
        v69.receiver = self;
        v69.super_class = (Class)PUPickerOnboardingView;
        -[PUPickerOnboardingView layoutSubviews](&v69, sel_layoutSubviews);
      }
      if (-[PUPickerOnboardingView compressionLevel](self, "compressionLevel") == 5)
      {
        objc_msgSend(v9, "objectEnumerator");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPickerOnboardingView maximumContentSizeCategory](self, "maximumContentSizeCategory");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v9;
        if (v20)
        {

        }
        else if ((v5[2](v5) & 1) == 0)
        {
          objc_msgSend(v19, "nextObject");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUPickerOnboardingView setMaximumContentSizeCategory:](self, "setMaximumContentSizeCategory:", v34);

          v68.receiver = self;
          v68.super_class = (Class)PUPickerOnboardingView;
          -[PUPickerOnboardingView layoutSubviews](&v68, sel_layoutSubviews);
        }
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v35 = v19;
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v65;
LABEL_66:
          v39 = 0;
          while (1)
          {
            if (*(_QWORD *)v65 != v38)
              objc_enumerationMutation(v35);
            v40 = *(NSString **)(*((_QWORD *)&v64 + 1) + 8 * v39);
            if ((v5[2](v5) & 1) != 0)
              break;
            -[PUPickerOnboardingView maximumContentSizeCategory](self, "maximumContentSizeCategory");
            v41 = (NSString *)objc_claimAutoreleasedReturnValue();
            v42 = UIContentSizeCategoryCompareToCategory(v41, v40);

            if (v42 != NSOrderedAscending)
            {
              -[PUPickerOnboardingView setMaximumContentSizeCategory:](self, "setMaximumContentSizeCategory:", v40);
              v63.receiver = self;
              v63.super_class = (Class)PUPickerOnboardingView;
              -[PUPickerOnboardingView layoutSubviews](&v63, sel_layoutSubviews);
            }
            if (v37 == ++v39)
            {
              v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
              if (v37)
                goto LABEL_66;
              break;
            }
          }
        }

        v9 = v46;
        v16 = &OBJC_IVAR___PUHeadroomVariableBlurView__blurFilter;
      }
      if (-[PUPickerOnboardingView compressionLevel](self, "compressionLevel") == 5 && (v5[2](v5) & 1) == 0)
      {
        -[PUPickerOnboardingView setCompressionLevel:](self, "setCompressionLevel:", 6);
        v62.receiver = self;
        v62.super_class = (Class)PUPickerOnboardingView;
        -[PUPickerOnboardingView layoutSubviews](&v62, sel_layoutSubviews);
      }
      if (-[PUPickerOnboardingView compressionLevel](self, "compressionLevel") == 6 && (v5[2](v5) & 1) == 0)
      {
        -[PUPickerOnboardingView setCompressionLevel:](self, "setCompressionLevel:", 7);
        v61.receiver = self;
        v61.super_class = (Class)PUPickerOnboardingView;
        -[PUPickerOnboardingView layoutSubviews](&v61, sel_layoutSubviews);
      }
    }
    -[PUPickerOnboardingView traitCollection](self, "traitCollection");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "preferredContentSizeCategory");
    v44 = (NSString *)objc_claimAutoreleasedReturnValue();
    v45 = self->_lastContentSizeCategory;
    self->_lastContentSizeCategory = v44;

    *(Class *)((char *)&self->super.super.super.isa + v16[181]) = v15;
  }
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  void *v7;

  -[PUPickerOnboardingView delegate](self, "delegate", a3, a4, a5.location, a5.length, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetPickerOnboardingViewWantsToLearnMoreAboutDataAccess:", self);

  return 0;
}

- (PUPickerOnboardingViewDelegate)delegate
{
  return (PUPickerOnboardingViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)badgeContainerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_badgeContainerView);
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIFont)bodyFont
{
  return self->_bodyFont;
}

- (NSString)clientDisplayName
{
  return self->_clientDisplayName;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (UIVisualEffectView)platter
{
  return self->_platter;
}

- (NSArray)platterInsetConstraints
{
  return self->_platterInsetConstraints;
}

- (UILayoutGuide)contentLayoutGuide
{
  return self->_contentLayoutGuide;
}

- (NSArray)contentCenterConstraints
{
  return self->_contentCenterConstraints;
}

- (NSArray)contentInsetConstraints
{
  return self->_contentInsetConstraints;
}

- (UIImageView)largeIconView
{
  return self->_largeIconView;
}

- (NSArray)largeIconViewConstraints
{
  return self->_largeIconViewConstraints;
}

- (UITextView)textView
{
  return self->_textView;
}

- (NSLayoutConstraint)textViewWidthConstraint
{
  return self->_textViewWidthConstraint;
}

- (NSLayoutConstraint)textViewTopAnchorToLargeIconConstraint
{
  return self->_textViewTopAnchorToLargeIconConstraint;
}

- (NSLayoutConstraint)textViewTopAnchorToPlatterConstraint
{
  return self->_textViewTopAnchorToPlatterConstraint;
}

- (NSArray)textViewConstraints
{
  return self->_textViewConstraints;
}

- (UIButton)button
{
  return self->_button;
}

- (UIButtonConfiguration)filledButtonConfiguration
{
  return self->_filledButtonConfiguration;
}

- (UIButtonConfiguration)plainButtonConfiguration
{
  return self->_plainButtonConfiguration;
}

- (NSLayoutConstraint)buttonTopConstraint
{
  return self->_buttonTopConstraint;
}

- (NSLayoutConstraint)buttonBottomConstraint
{
  return self->_buttonBottomConstraint;
}

- (NSArray)buttonConstraints
{
  return self->_buttonConstraints;
}

- (double)buttonBottomSpacing
{
  return self->_buttonBottomSpacing;
}

- (UIImageView)attachmentIconView
{
  return self->_attachmentIconView;
}

- (UIImageView)attachmentAnchorView
{
  return self->_attachmentAnchorView;
}

- (PUPickerPrivacyBadge)badge
{
  return self->_badge;
}

- (NSArray)badgeConstraints
{
  return self->_badgeConstraints;
}

- (PUPickerBadgeIconView)badgeIconView
{
  return self->_badgeIconView;
}

- (UILabel)badgeLabel
{
  return self->_badgeLabel;
}

- (NSArray)contentMarginConstraints
{
  return self->_contentMarginConstraints;
}

- (unint64_t)compressionLevel
{
  return self->_compressionLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentMarginConstraints, 0);
  objc_storeStrong((id *)&self->_badgeLabel, 0);
  objc_storeStrong((id *)&self->_badgeIconView, 0);
  objc_storeStrong((id *)&self->_badgeConstraints, 0);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_attachmentAnchorView, 0);
  objc_storeStrong((id *)&self->_attachmentIconView, 0);
  objc_storeStrong((id *)&self->_buttonConstraints, 0);
  objc_storeStrong((id *)&self->_buttonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_buttonTopConstraint, 0);
  objc_storeStrong((id *)&self->_plainButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_filledButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_textViewConstraints, 0);
  objc_storeStrong((id *)&self->_textViewTopAnchorToPlatterConstraint, 0);
  objc_storeStrong((id *)&self->_textViewTopAnchorToLargeIconConstraint, 0);
  objc_storeStrong((id *)&self->_textViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_largeIconViewConstraints, 0);
  objc_storeStrong((id *)&self->_largeIconView, 0);
  objc_storeStrong((id *)&self->_contentInsetConstraints, 0);
  objc_storeStrong((id *)&self->_contentCenterConstraints, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_platterInsetConstraints, 0);
  objc_storeStrong((id *)&self->_platter, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_clientDisplayName, 0);
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_destroyWeak((id *)&self->_badgeContainerView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_lastContentSizeCategory, 0);
}

BOOL __40__PUPickerOnboardingView_layoutSubviews__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  _BOOL8 v29;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  objc_msgSend(*(id *)(a1 + 32), "button");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "button");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "alignmentRectForFrame:", v4, v6, v8, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  objc_msgSend(*(id *)(a1 + 32), "contentLayoutGuide");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layoutFrame");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v31.origin.x = v13;
  v31.origin.y = v15;
  v31.size.width = v17;
  v31.size.height = v19;
  v33 = CGRectInset(v31, 1.0, 1.0);
  v32.origin.x = v22;
  v32.origin.y = v24;
  v32.size.width = v26;
  v32.size.height = v28;
  v29 = CGRectContainsRect(v32, v33);

  return v29;
}

uint64_t __44__PUPickerOnboardingView_transitionToBadge___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, 0.5, 0.5);
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __44__PUPickerOnboardingView_transitionToBadge___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __44__PUPickerOnboardingView_transitionToBadge___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

uint64_t __44__PUPickerOnboardingView_transitionToBadge___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(*(id *)(a1 + 32), "setBounds:");
  objc_msgSend(*(id *)(a1 + 40), "_cornerRadius");
  return objc_msgSend(*(id *)(a1 + 32), "_setCornerRadius:");
}

uint64_t __44__PUPickerOnboardingView_transitionToBadge___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "center");
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:");
}

uint64_t __44__PUPickerOnboardingView_transitionToBadge___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __44__PUPickerOnboardingView_transitionToBadge___block_invoke_7(id *a1)
{
  id v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(a1[5], "imageFrame");
  objc_msgSend(a1[4], "setFrame:");
  v2 = a1[6];
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  objc_msgSend(a1[5], "labelFrame");
  return objc_msgSend(a1[6], "setFrame:");
}

uint64_t __44__PUPickerOnboardingView_transitionToBadge___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __44__PUPickerOnboardingView_transitionToBadge___block_invoke_9(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v1, "assetPickerOnboardingViewDidTransitionToBadge:", WeakRetained);

}

uint64_t __44__PUPickerOnboardingView_transitionToBadge___block_invoke_10(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, 0.75, 0.75);
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __44__PUPickerOnboardingView_transitionToBadge___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __44__PUPickerOnboardingView_transitionToBadge___block_invoke_12(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v1, "assetPickerOnboardingViewDidDismissBadge:", WeakRetained);

}

@end
