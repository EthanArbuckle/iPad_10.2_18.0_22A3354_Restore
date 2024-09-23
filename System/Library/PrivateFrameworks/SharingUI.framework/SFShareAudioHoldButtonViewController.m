@implementation SFShareAudioHoldButtonViewController

- (void)viewDidLoad
{
  id v3;
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
  id v14;
  void *v15;
  void *v16;
  void *v17;
  SFMediaPlayerView *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
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
  void *v127;
  void *v128;
  _QWORD v129[18];

  v129[16] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BEBD708]);
  -[SFShareAudioBaseViewController setTitleLabel:](self, "setTitleLabel:", v3);

  -[SFShareAudioBaseViewController titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioBaseViewController titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColor:", v5);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE240]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioBaseViewController titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  -[SFShareAudioBaseViewController titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextAlignment:", 1);

  -[SFShareAudioBaseViewController titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAdjustsFontSizeToFitWidth:", 1);

  -[SFShareAudioBaseViewController titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMinimumScaleFactor:", 0.5);

  -[SFShareAudioHoldButtonViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioBaseViewController titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v13);

  v14 = objc_alloc_init(MEMORY[0x24BEBD668]);
  -[SFShareAudioHoldButtonViewController setShareImageView:](self, "setShareImageView:", v14);

  -[SFShareAudioHoldButtonViewController shareImageView](self, "shareImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[SFShareAudioHoldButtonViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioHoldButtonViewController shareImageView](self, "shareImageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

  v18 = objc_alloc_init(SFMediaPlayerView);
  -[SFShareAudioHoldButtonViewController setProductMovieView:](self, "setProductMovieView:", v18);

  -[SFShareAudioHoldButtonViewController productMovieView](self, "productMovieView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[SFShareAudioHoldButtonViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioHoldButtonViewController productMovieView](self, "productMovieView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", v21);

  v22 = objc_alloc_init(MEMORY[0x24BEBD708]);
  -[SFShareAudioHoldButtonViewController setInfoLabel:](self, "setInfoLabel:", v22);

  -[SFShareAudioHoldButtonViewController infoLabel](self, "infoLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[SFShareAudioHoldButtonViewController infoLabel](self, "infoLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setNumberOfLines:", 2);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioHoldButtonViewController infoLabel](self, "infoLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setColor:", v25);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioHoldButtonViewController infoLabel](self, "infoLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFont:", v27);

  -[SFShareAudioHoldButtonViewController infoLabel](self, "infoLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTextAlignment:", 1);

  -[SFShareAudioHoldButtonViewController infoLabel](self, "infoLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAdjustsFontSizeToFitWidth:", 1);

  -[SFShareAudioHoldButtonViewController infoLabel](self, "infoLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setMinimumScaleFactor:", 0.5);

  -[SFShareAudioHoldButtonViewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioHoldButtonViewController infoLabel](self, "infoLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addSubview:", v33);

  objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioHoldButtonViewController setCancelButton:](self, "setCancelButton:", v34);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioHoldButtonViewController cancelButton](self, "cancelButton");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTintColor:", v35);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioHoldButtonViewController cancelButton](self, "cancelButton");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "titleLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFont:", v37);

  -[SFShareAudioHoldButtonViewController cancelButton](self, "cancelButton");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[SFShareAudioHoldButtonViewController cancelButton](self, "cancelButton");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  SFLocalizedStringForKey();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setTitle:forState:", v42, 0);

  -[SFShareAudioHoldButtonViewController cancelButton](self, "cancelButton");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addTarget:action:forControlEvents:", self, sel_eventCancel_, 64);

  -[SFShareAudioHoldButtonViewController view](self, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioHoldButtonViewController cancelButton](self, "cancelButton");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addSubview:", v45);

  -[SFShareAudioHoldButtonViewController productMovieView](self, "productMovieView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioHoldButtonViewController view](self, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:constant:", v49, 8.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioHoldButtonViewController setMovieViewLeadingConstraint:](self, "setMovieViewLeadingConstraint:", v50);

  -[SFShareAudioHoldButtonViewController productMovieView](self, "productMovieView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioHoldButtonViewController view](self, "view");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "trailingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:constant:", v54, -8.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioHoldButtonViewController setMovieViewTrailingConstraint:](self, "setMovieViewTrailingConstraint:", v55);

  -[SFShareAudioHoldButtonViewController productMovieView](self, "productMovieView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "heightAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToConstant:", 281.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioHoldButtonViewController setMovieViewHeightConstraint:](self, "setMovieViewHeightConstraint:", v58);

  v100 = (void *)MEMORY[0x24BDD1628];
  -[SFShareAudioBaseViewController titleLabel](self, "titleLabel");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "leadingAnchor");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioHoldButtonViewController view](self, "view");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "leadingAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "constraintEqualToAnchor:constant:", v125, 36.0);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v129[0] = v124;
  -[SFShareAudioBaseViewController titleLabel](self, "titleLabel");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "trailingAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioHoldButtonViewController view](self, "view");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "trailingAnchor");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "constraintEqualToAnchor:constant:", v120, -36.0);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v129[1] = v119;
  -[SFShareAudioBaseViewController titleLabel](self, "titleLabel");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "topAnchor");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioHoldButtonViewController view](self, "view");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "topAnchor");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "constraintEqualToAnchor:constant:", v115, 36.0);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v129[2] = v114;
  -[SFShareAudioHoldButtonViewController productMovieView](self, "productMovieView");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "topAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioBaseViewController titleLabel](self, "titleLabel");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "topAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "constraintEqualToAnchor:", v110);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v129[3] = v109;
  -[SFShareAudioHoldButtonViewController movieViewHeightConstraint](self, "movieViewHeightConstraint");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v129[4] = v108;
  -[SFShareAudioHoldButtonViewController movieViewLeadingConstraint](self, "movieViewLeadingConstraint");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v129[5] = v107;
  -[SFShareAudioHoldButtonViewController movieViewTrailingConstraint](self, "movieViewTrailingConstraint");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v129[6] = v106;
  -[SFShareAudioHoldButtonViewController shareImageView](self, "shareImageView");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "centerXAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioHoldButtonViewController view](self, "view");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "centerXAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "constraintEqualToAnchor:", v102);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v129[7] = v101;
  -[SFShareAudioHoldButtonViewController shareImageView](self, "shareImageView");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "topAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioBaseViewController titleLabel](self, "titleLabel");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "bottomAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "constraintGreaterThanOrEqualToAnchor:constant:", v96, 26.0);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v129[8] = v95;
  -[SFShareAudioHoldButtonViewController shareImageView](self, "shareImageView");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "bottomAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioHoldButtonViewController infoLabel](self, "infoLabel");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "topAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "constraintLessThanOrEqualToAnchor:constant:", v91, -16.0);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v129[9] = v90;
  -[SFShareAudioHoldButtonViewController infoLabel](self, "infoLabel");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "leadingAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioHoldButtonViewController view](self, "view");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "leadingAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "constraintGreaterThanOrEqualToAnchor:constant:", v86, 16.0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v129[10] = v85;
  -[SFShareAudioHoldButtonViewController infoLabel](self, "infoLabel");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "trailingAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioHoldButtonViewController view](self, "view");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "trailingAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintLessThanOrEqualToAnchor:constant:", v81, -16.0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v129[11] = v80;
  -[SFShareAudioHoldButtonViewController infoLabel](self, "infoLabel");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "bottomAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioHoldButtonViewController cancelButton](self, "cancelButton");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "topAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:constant:", v76, -26.0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v129[12] = v75;
  -[SFShareAudioHoldButtonViewController cancelButton](self, "cancelButton");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "leadingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioHoldButtonViewController view](self, "view");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "leadingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:constant:", v71, 36.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v129[13] = v70;
  -[SFShareAudioHoldButtonViewController cancelButton](self, "cancelButton");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "trailingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioHoldButtonViewController view](self, "view");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "trailingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:constant:", v61, -36.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v129[14] = v62;
  -[SFShareAudioHoldButtonViewController cancelButton](self, "cancelButton");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "bottomAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareAudioHoldButtonViewController view](self, "view");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "bottomAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:constant:", v66, -21.0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v129[15] = v67;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v129, 16);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "activateConstraints:", v68);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  __objc2_meth_list **p_class_meths;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t colorCode;
  __CFString *v13;
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
  id v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  _QWORD v48[6];
  objc_super v49;
  _QWORD v50[4];
  void *v51;
  _QWORD v52[2];

  v3 = a3;
  v52[1] = *MEMORY[0x24BDAC8D0];
  p_class_meths = &OBJC_PROTOCOL___CAStateControllerDelegate.class_meths;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v49.receiver = self;
  v49.super_class = (Class)SFShareAudioHoldButtonViewController;
  -[SFShareAudioBaseViewController viewWillAppear:](&v49, sel_viewWillAppear_, v3);
  -[SFShareAudioViewController mainBundle](self->super._mainController, "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE90170]), "initWithProductID:", self->_colorCode);
  objc_msgSend(MEMORY[0x24BE90170], "airPodsMax");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Localizable-PID_%d"), self->_colorCode);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDD1628];
    -[SFShareAudioHoldButtonViewController movieViewHeightConstraint](self, "movieViewHeightConstraint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deactivateConstraints:", v16);

    -[SFShareAudioHoldButtonViewController productMovieView](self, "productMovieView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "heightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFShareAudioHoldButtonViewController productMovieView](self, "productMovieView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "widthAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:multiplier:", v20, 0.9375);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFShareAudioHoldButtonViewController setMovieViewHeightConstraint:](self, "setMovieViewHeightConstraint:", v21);

    v22 = (void *)MEMORY[0x24BDD1628];
    -[SFShareAudioHoldButtonViewController movieViewHeightConstraint](self, "movieViewHeightConstraint");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v51, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activateConstraints:", v24);

    -[SFShareAudioHoldButtonViewController movieViewLeadingConstraint](self, "movieViewLeadingConstraint");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setConstant:", 0.0);

    -[SFShareAudioHoldButtonViewController movieViewTrailingConstraint](self, "movieViewTrailingConstraint");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setConstant:", 0.0);

    -[SFShareAudioHoldButtonViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "layoutIfNeeded");

    v28 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    -[SFShareAudioHoldButtonViewController productMovieView](self, "productMovieView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bounds");
    objc_msgSend(v28, "setFrame:");

    v30 = objc_alloc_init(MEMORY[0x24BDE56B8]);
    objc_msgSend(v28, "bounds");
    objc_msgSend(v30, "setFrame:");
    objc_msgSend(v30, "setLocations:", &unk_24CE21E80);
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 1.0, 0.0);
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v32 = objc_msgSend(v31, "CGColor");

    v50[0] = v32;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v50[1] = objc_msgSend(v33, "CGColor");
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v50[2] = objc_msgSend(v34, "CGColor");
    v50[3] = v32;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setColors:", v35);

    p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___CAStateControllerDelegate + 32);
    objc_msgSend(v28, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addSublayer:", v30);

    -[SFShareAudioHoldButtonViewController productMovieView](self, "productMovieView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setMaskView:", v28);

LABEL_12:
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BE90170], "b768e");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v7 == (void *)v9)
  {
    v28 = v7;
    v13 = CFSTR("Localizable-PID_8219");
    goto LABEL_12;
  }
  v10 = (void *)v9;
  objc_msgSend(MEMORY[0x24BE90170], "b768m");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v11)
  {
    v13 = CFSTR("Localizable-PID_8219");
  }
  else
  {
    colorCode = self->_colorCode;
    if ((_DWORD)colorCode == 8203)
      goto LABEL_9;
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE90170]), "initWithProductID:", colorCode);
    if (v41)
    {
      v42 = v41;
      v43 = objc_msgSend(v41, "buttonLocation");

      if (!v43)
        goto LABEL_9;
    }
    v44 = self->_colorCode;
    v13 = CFSTR("Localizable-ShareAudio");
    if (((v44 - 8194) > 0xD || ((1 << (v44 - 2)) & 0x3001) == 0) && (_DWORD)v44 != 0x10000)
    {
      v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE90170]), "initWithProductID:", v44);
      objc_msgSend(v45, "isAirPods");

LABEL_9:
      v13 = CFSTR("Localizable-ShareAudio");
    }
  }
LABEL_13:
  SFLocalizedStringEx();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_infoLabel, "setText:", v38);

  SFLocalizedStringEx();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->super._titleLabel, "setText:", v39);

  if (self->_colorCode)
  {
    v40 = *((_DWORD *)p_class_meths + 360);
    if (v40 <= 30 && (v40 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v46 = objc_alloc_init(MEMORY[0x24BE900F0]);
    objc_msgSend(v46, "setBluetoothProductID:", LOWORD(self->_colorCode));
    objc_msgSend(v46, "setColorCode:", *((unsigned int *)&self->super._viewActive + 1));
    objc_msgSend(v46, "setTimeoutSeconds:", 5.0);
    v47 = objc_alloc_init(MEMORY[0x24BE900E8]);
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __55__SFShareAudioHoldButtonViewController_viewWillAppear___block_invoke;
    v48[3] = &unk_24CE0FEA0;
    v48[4] = v47;
    v48[5] = self;
    objc_msgSend(v47, "getDeviceAssets:completion:", v46, v48);

  }
  else
  {
    -[SFShareAudioHoldButtonViewController _updateDeviceVisual:](self, "_updateDeviceVisual:", 0);
  }

}

void __55__SFShareAudioHoldButtonViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  _BYTE *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v3 = *(_BYTE **)(a1 + 40);
  if (v3[992])
  {
    objc_msgSend(v5, "assetBundlePath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_updateDeviceVisual:", v4);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)SFShareAudioHoldButtonViewController;
  -[SFShareAudioBaseViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFShareAudioHoldButtonViewController;
  -[SFShareAudioHoldButtonViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SFMediaPlayerView stop](self->_productMovieView, "stop");
}

- (void)eventCancel:(id)a3
{
  id v4;

  v4 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SFShareAudioViewController reportUserCancelled](self->super._mainController, "reportUserCancelled");

}

- (void)_updateDeviceVisual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v12 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v5, "pathForResource:ofType:", *MEMORY[0x24BE90260], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "URLForResource:withExtension:", *MEMORY[0x24BE90240], 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_SFShareAudioViewController <= 30
      && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
    {
      v11 = v6;
      LogPrintF();
    }
    -[SFMediaPlayerView startMovieLoopWithPath:assetType:adjustmentsURL:](self->_productMovieView, "startMovieLoopWithPath:assetType:adjustmentsURL:", v6, 1, v7, v11, v12);
    -[SFMediaPlayerView setHidden:](self->_productMovieView, "setHidden:", 0);

  }
  else
  {
    if (gLogCategory_SFShareAudioViewController <= 30
      && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v8 = (void *)MEMORY[0x24BEBD640];
    -[SFShareAudioViewController mainBundle](self->super._mainController, "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("ShareAudioAirPods"), v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](self->_shareImageView, "setImage:", v10);

    -[UIImageView setHidden:](self->_shareImageView, "setHidden:", 0);
  }

}

- (SFMediaPlayerView)productMovieView
{
  return self->_productMovieView;
}

- (void)setProductMovieView:(id)a3
{
  objc_storeStrong((id *)&self->_productMovieView, a3);
}

- (UIImageView)shareImageView
{
  return self->_shareImageView;
}

- (void)setShareImageView:(id)a3
{
  objc_storeStrong((id *)&self->_shareImageView, a3);
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setInfoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_infoLabel, a3);
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (NSLayoutConstraint)movieViewLeadingConstraint
{
  return self->_movieViewLeadingConstraint;
}

- (void)setMovieViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_movieViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)movieViewTrailingConstraint
{
  return self->_movieViewTrailingConstraint;
}

- (void)setMovieViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_movieViewTrailingConstraint, a3);
}

- (NSLayoutConstraint)movieViewHeightConstraint
{
  return self->_movieViewHeightConstraint;
}

- (void)setMovieViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_movieViewHeightConstraint, a3);
}

- (unsigned)colorCode
{
  return *((_DWORD *)&self->super._viewActive + 1);
}

- (void)setColorCode:(unsigned int)a3
{
  *((_DWORD *)&self->super._viewActive + 1) = a3;
}

- (unsigned)productID
{
  return self->_colorCode;
}

- (void)setProductID:(unsigned int)a3
{
  self->_colorCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movieViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_movieViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_movieViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_shareImageView, 0);
  objc_storeStrong((id *)&self->_productMovieView, 0);
}

@end
