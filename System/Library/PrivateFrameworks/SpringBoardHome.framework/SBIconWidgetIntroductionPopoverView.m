@implementation SBIconWidgetIntroductionPopoverView

+ (CGSize)contentSize:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1 && a3)
  {
    v6 = 120.0;
    v7 = 320.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    v7 = dbl_1D0193E20[(v9 & 0xFFFFFFFFFFFFFFFBLL) == 1];
    v6 = 74.0;
  }
  result.height = v6;
  result.width = v7;
  return result;
}

- (SBIconWidgetIntroductionPopoverView)initWithDelegate:(id)a3 vertical:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  SBIconWidgetIntroductionPopoverView *v8;
  SBIconWidgetIntroductionPopoverView *v9;
  SBIconWidgetIntroductionPopoverView *v10;
  objc_super v12;

  v4 = a4;
  v6 = a3;
  if (v4)
    v7 = 2;
  else
    v7 = 0;
  v12.receiver = self;
  v12.super_class = (Class)SBIconWidgetIntroductionPopoverView;
  v8 = -[SBHPopoverView initWithArrowLocation:](&v12, sel_initWithArrowLocation_, v7);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    -[SBIconWidgetIntroductionPopoverView _setUpViews:](v9, "_setUpViews:", v4);
    -[SBIconWidgetIntroductionPopoverView _updateForUserInterfaceStyle](v9, "_updateForUserInterfaceStyle");
    v10 = v9;
  }

  return v9;
}

- (void)_setUpViews:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
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
  _QWORD *v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
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
  uint64_t v55;
  void *v56;
  void *v57;
  const __CFString *v58;
  uint64_t v59;
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
  UILabel *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  _QWORD *v84;
  void *v85;
  void *v86;
  UILabel *textLabel;
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
  _BOOL4 v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v119;
  id v120;
  _QWORD v121[4];
  _QWORD v122[4];
  _QWORD v123[4];
  _QWORD v124[4];
  _QWORD v125[4];
  _QWORD v126[4];
  _QWORD v127[6];

  v3 = a3;
  v127[4] = *MEMORY[0x1E0C80C00];
  -[SBHPopoverView backgroundView](self, "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 1);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  v7 = v6 & 0xFFFFFFFFFFFFFFFBLL;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v8 = 14.0;
  else
    v8 = 13.0;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v9 = 22.0;
  else
    v9 = 15.0;
  if (v3)
    v10 = 40.0;
  else
    v10 = 4.0;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", v8, *MEMORY[0x1E0DC1440]);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
  objc_msgSend(v4, "addLayoutGuide:");
  v113 = v3;
  v119 = v4;
  if (v3)
  {
    v101 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v120, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingAnchor");
    v116 = v13;
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v127[0] = v106;
    objc_msgSend(v120, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v127[1] = v16;
    objc_msgSend(v120, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -10.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v127[2] = v19;
    objc_msgSend(v120, "heightAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintLessThanOrEqualToConstant:", 32.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v127[3] = v21;
    v22 = (void *)MEMORY[0x1E0C99D20];
    v23 = v127;
  }
  else
  {
    v24 = dbl_1D0193E30[(v12 & 0xFFFFFFFFFFFFFFFBLL) == 1];
    v101 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v120, "widthAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "constraintEqualToConstant:", v24);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v126[0] = v110;
    objc_msgSend(v120, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v25;
    objc_msgSend(v25, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v126[1] = v15;
    objc_msgSend(v120, "centerYAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerYAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v126[2] = v18;
    objc_msgSend(v120, "heightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "heightAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, -25.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v126[3] = v21;
    v22 = (void *)MEMORY[0x1E0C99D20];
    v23 = v126;
  }
  objc_msgSend(v22, "arrayWithObjects:count:", v23, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "activateConstraints:", v26);

  v27 = dbl_1D0193E40[v7 == 1];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 15.0, *MEMORY[0x1E0DC1448]);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v119, "addSubview:", v28);
  objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v94 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v28, "centerXAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "centerXAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "constraintEqualToAnchor:", v107);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v125[0] = v102;
  objc_msgSend(v28, "centerYAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "centerYAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v125[1] = v30;
  objc_msgSend(v28, "widthAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "scale");
  objc_msgSend(v31, "constraintEqualToConstant:", 2.0 / v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v125[2] = v34;
  objc_msgSend(v28, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v125[3] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v125, 4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "activateConstraints:", v38);

  v112 = v28;
  objc_storeStrong((id *)&self->_verticalDividerLine, v28);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  SBHBundle();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("WIDGET_DISCOVERABILITY_OK"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setTitle:forState:", v41, 0);

  objc_msgSend(v39, "titleLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setFont:", v117);

  objc_msgSend(v39, "titleLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setAdjustsFontSizeToFitWidth:", 1);

  objc_msgSend(v39, "setAccessibilityIdentifier:", CFSTR("SBWidgetIntroductionButton-OK"));
  objc_msgSend(v119, "addSubview:", v39);
  objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v95 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v39, "trailingAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "trailingAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "constraintEqualToAnchor:constant:", v103, -v10);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v124[0] = v99;
  objc_msgSend(v39, "widthAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToConstant:", v27);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v124[1] = v45;
  objc_msgSend(v39, "centerYAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "centerYAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v124[2] = v48;
  objc_msgSend(v39, "heightAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "heightAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v124[3] = v51;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 4);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "activateConstraints:", v52);

  objc_msgSend(v39, "addTarget:action:forControlEvents:", self, sel__okButtonTapped_, 64);
  v109 = v39;
  objc_storeStrong((id *)&self->_okButton, v39);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "userInterfaceIdiom");

  SBHBundle();
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v56;
  if ((v55 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v58 = CFSTR("WIDGET_DISCOVERABILITY_EDIT");
  else
    v58 = CFSTR("WIDGET_DISCOVERABILITY_UNDO");
  objc_msgSend(v56, "localizedStringForKey:value:table:", v58, &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v59 = objc_claimAutoreleasedReturnValue();

  v100 = (void *)v59;
  objc_msgSend(v53, "setTitle:forState:", v59, 0);
  objc_msgSend(v53, "titleLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setFont:", v117);

  objc_msgSend(v53, "titleLabel");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setAdjustsFontSizeToFitWidth:", 1);

  objc_msgSend(v53, "setAccessibilityIdentifier:", CFSTR("SBWidgetIntroductionButton-Edit"));
  objc_msgSend(v119, "addSubview:", v53);
  objc_msgSend(v53, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v90 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v53, "leadingAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "leadingAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "constraintEqualToAnchor:constant:", v96, v10);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v123[0] = v92;
  objc_msgSend(v53, "widthAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToConstant:", v27);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v123[1] = v63;
  objc_msgSend(v53, "centerYAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "centerYAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v123[2] = v66;
  objc_msgSend(v53, "heightAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "heightAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v123[3] = v69;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v123, 4);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "activateConstraints:", v70);

  objc_msgSend(v53, "addTarget:action:forControlEvents:", self, sel__editButtonTapped_, 64);
  v105 = v53;
  objc_storeStrong((id *)&self->_editButton, v53);
  v71 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  SBHBundle();
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "localizedStringForKey:value:table:", CFSTR("WIDGET_DISCOVERABILITY_DESCRIPTION"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v71, "setText:", v73);

  -[UILabel setFont:](v71, "setFont:", v115);
  -[UILabel setAdjustsFontSizeToFitWidth:](v71, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setMinimumScaleFactor:](v71, "setMinimumScaleFactor:", 0.6);
  -[UILabel setNumberOfLines:](v71, "setNumberOfLines:", 3);
  objc_msgSend(v119, "addSubview:", v71);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v71, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTextAlignment:](v71, "setTextAlignment:", 1);
  v89 = (void *)MEMORY[0x1E0CB3718];
  -[UILabel leadingAnchor](v71, "leadingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "leadingAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = v74;
  objc_msgSend(v74, "constraintEqualToAnchor:constant:", v9);
  v75 = objc_claimAutoreleasedReturnValue();
  v91 = (void *)v75;
  if (v113)
  {
    v122[0] = v75;
    -[UILabel trailingAnchor](v71, "trailingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "trailingAnchor");
    v114 = v76;
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToAnchor:constant:", -v9);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v122[1] = v77;
    -[UILabel centerXAnchor](v71, "centerXAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "centerXAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:", v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v122[2] = v80;
    -[UILabel bottomAnchor](v71, "bottomAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "topAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:constant:", v82, -15.0);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v122[3] = v83;
    v84 = v122;
  }
  else
  {
    v121[0] = v75;
    -[UILabel trailingAnchor](v71, "trailingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "leadingAnchor");
    v114 = v85;
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:constant:", -v10);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v121[1] = v77;
    -[UILabel centerYAnchor](v71, "centerYAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "centerYAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:", v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v121[2] = v80;
    -[UILabel heightAnchor](v71, "heightAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "heightAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintLessThanOrEqualToAnchor:constant:", v82, -8.0);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v121[3] = v83;
    v84 = v121;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 4);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "activateConstraints:", v86);

  textLabel = self->_textLabel;
  self->_textLabel = v71;

}

- (void)_updateForUserInterfaceStyle
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
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconWidgetIntroductionPopoverView textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedColorWithTraitCollection:", v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v5);

  objc_msgSend(v3, "_setDrawsAsBackdropOverlayWithBlendMode:", 2);
  -[SBIconWidgetIntroductionPopoverView verticalDividerLine](self, "verticalDividerLine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resolvedColorWithTraitCollection:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v8);

  objc_msgSend(v6, "_setDrawsAsBackdropOverlayWithBlendMode:", 2);
  -[SBIconWidgetIntroductionPopoverView okButton](self, "okButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resolvedColorWithTraitCollection:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTintColor:", v11);

  objc_msgSend(v9, "_setDrawsAsBackdropOverlayWithBlendMode:", 2);
  -[SBIconWidgetIntroductionPopoverView editButton](self, "editButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resolvedColorWithTraitCollection:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTintColor:", v14);

  objc_msgSend(v12, "_setDrawsAsBackdropOverlayWithBlendMode:", 2);
}

- (void)_okButtonTapped:(id)a3
{
  id v3;

  -[SBIconWidgetIntroductionPopoverView delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "acceptWidgetIntroduction");

}

- (void)_editButtonTapped:(id)a3
{
  id v3;

  -[SBIconWidgetIntroductionPopoverView delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rejectWidgetIntroduction");

}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (UIButton)editButton
{
  return self->_editButton;
}

- (void)setEditButton:(id)a3
{
  objc_storeStrong((id *)&self->_editButton, a3);
}

- (UIButton)okButton
{
  return self->_okButton;
}

- (void)setOkButton:(id)a3
{
  objc_storeStrong((id *)&self->_okButton, a3);
}

- (UIView)verticalDividerLine
{
  return self->_verticalDividerLine;
}

- (void)setVerticalDividerLine:(id)a3
{
  objc_storeStrong((id *)&self->_verticalDividerLine, a3);
}

- (SBIconWidgetIntroductionDelegate)delegate
{
  return (SBIconWidgetIntroductionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_verticalDividerLine, 0);
  objc_storeStrong((id *)&self->_okButton, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
