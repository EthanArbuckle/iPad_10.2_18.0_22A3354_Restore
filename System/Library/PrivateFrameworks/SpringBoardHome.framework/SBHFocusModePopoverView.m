@implementation SBHFocusModePopoverView

- (SBHFocusModePopoverView)initWithDelegate:(id)a3 iconListView:(id)a4
{
  id v6;
  SBHFocusModePopoverView *v7;
  SBHFocusModePopoverView *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
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
  void *v129;
  SBHFocusModePopoverView *v130;
  id v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  id obj;
  double v139[5];
  objc_super v140;
  _QWORD v141[23];
  _QWORD v142[2];
  _QWORD v143[4];

  v143[2] = *MEMORY[0x1E0C80C00];
  obj = a3;
  v6 = a4;
  v140.receiver = self;
  v140.super_class = (Class)SBHFocusModePopoverView;
  v7 = -[SBHPopoverView initWithArrowLocation:](&v140, sel_initWithArrowLocation_, 1);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, obj);
    objc_storeWeak((id *)&v8->_iconListView, v6);
    objc_msgSend(obj, "focusModePopoverViewActiveFocusMode:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addLayoutObserver:", v8);
    -[SBHPopoverView backgroundView](v8, "backgroundView");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBHFocusModePopoverView addSubview:](v8, "addSubview:", v11);
    v12 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    v13 = (void *)MEMORY[0x1E0CB3940];
    SBHBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("FOCUS_MODE_POPOVER_BODY"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = (void *)v10;
    objc_msgSend(v13, "stringWithFormat:", v15, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v16);

    objc_msgSend(v12, "setNumberOfLines:", 0);
    v17 = *MEMORY[0x1E0DC1440];
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 15.0, *MEMORY[0x1E0DC1440]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v18);

    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_storeStrong((id *)&v8->_bodyLabel, v12);
    v135 = v12;
    objc_msgSend(v11, "addSubview:", v12);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addTarget:action:forControlEvents:", v8, sel__editPageButtonTapped_, 0x2000);
    SBHBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("EDIT_PAGES"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTitle:forState:", v21, 0);

    objc_msgSend(v19, "titleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 15.0, v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFont:", v23);

    objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_storeStrong((id *)&v8->_editPageButton, v19);
    v136 = v11;
    v134 = v19;
    objc_msgSend(v11, "addSubview:", v19);
    v24 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBackgroundColor:", v25);

    objc_msgSend(v24, "_setCornerRadius:", 27.0);
    objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBHFocusModePopoverView addSubview:](v8, "addSubview:", v24);
    objc_msgSend(v9, "symbol");
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "unspecifiedConfiguration");
    v127 = (void *)v26;
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", v26);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v125);
    objc_msgSend(v27, "setContentMode:", 1);
    v129 = v9;
    objc_msgSend(v9, "color");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTintColor:");
    objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v133 = v24;
    v132 = v27;
    objc_msgSend(v24, "addSubview:", v27);
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3518]), "initWithFrame:", 0.0, 0.0, 40.0, 40.0);
    objc_msgSend(v28, "addTarget:action:forControlEvents:", v8, sel__closeButtonTapped_, 64);
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 7, 10.0);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("xmark"));
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setImage:");
    v122 = v29;
    objc_msgSend(v28, "setConfiguration:", v29);
    objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_storeStrong((id *)&v8->_closeButton, v28);
    v123 = v28;
    -[SBHFocusModePopoverView addSubview:](v8, "addSubview:", v28);
    objc_msgSend(v6, "addSubview:", v8);
    objc_msgSend(v6, "bringSubviewToFront:", v8);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "userInterfaceIdiom");

    v131 = v6;
    v130 = v8;
    if ((v31 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v32 = (void *)MEMORY[0x1E0CB3718];
      -[SBHFocusModePopoverView widthAnchor](v8, "widthAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      SBHGetScreenSpecification(3, (uint64_t)v139);
      v118 = v33;
      objc_msgSend(v33, "constraintEqualToConstant:", v139[0]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v143[0] = v34;
      -[SBHFocusModePopoverView centerXAnchor](v8, "centerXAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "centerXAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "constraintEqualToAnchor:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v143[1] = v37;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v143, 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "activateConstraints:", v38);
    }
    else
    {
      objc_msgSend(v6, "layoutProvider");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "layoutForIconLocation:", CFSTR("SBIconLocationRoot"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "rootFolderVisualConfiguration");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "dockBackgroundViewInsets");
      v40 = v39;
      if (BSFloatIsZero())
        v40 = 10.0;
      v116 = (void *)MEMORY[0x1E0CB3718];
      -[SBHFocusModePopoverView leadingAnchor](v8, "leadingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "leadingAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, v40);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v142[0] = v38;
      -[SBHFocusModePopoverView trailingAnchor](v8, "trailingAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "trailingAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42, -v40);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v142[1] = v43;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v142, 2);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "activateConstraints:", v44);

      v8 = v130;
      v6 = v131;

    }
    objc_msgSend(obj, "focusModePopoverViewFolderScrollAccessoryFrame:", v8);
    v46 = v45;
    objc_msgSend(v6, "frame");
    v48 = v47 - v46;
    v90 = (void *)MEMORY[0x1E0CB3718];
    -[SBHFocusModePopoverView bottomAnchor](v8, "bottomAnchor");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bottomAnchor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "constraintEqualToAnchor:constant:", v117, -v48);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v141[0] = v115;
    objc_msgSend(v136, "leadingAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "leadingAnchor");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "constraintEqualToAnchor:constant:", v113, 24.0);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v141[1] = v112;
    objc_msgSend(v136, "trailingAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "leadingAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "constraintEqualToAnchor:constant:", v110, -8.0);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v141[2] = v109;
    objc_msgSend(v136, "topAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "topAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "constraintEqualToAnchor:constant:", v107, 18.0);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v141[3] = v106;
    objc_msgSend(v136, "bottomAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "bottomAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "constraintEqualToAnchor:constant:", v104, -18.0);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v141[4] = v103;
    objc_msgSend(v135, "leadingAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "leadingAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "constraintEqualToAnchor:", v101);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v141[5] = v100;
    objc_msgSend(v135, "trailingAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "trailingAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "constraintEqualToAnchor:", v98);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v141[6] = v97;
    objc_msgSend(v135, "topAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "topAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "constraintEqualToAnchor:", v95);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v141[7] = v94;
    objc_msgSend(v134, "leadingAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "leadingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:", v92);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v141[8] = v91;
    objc_msgSend(v134, "topAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "bottomAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "constraintEqualToAnchor:", v88);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v141[9] = v87;
    objc_msgSend(v134, "bottomAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "bottomAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "constraintEqualToAnchor:", v85);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v141[10] = v84;
    objc_msgSend(v133, "centerYAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "centerYAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintEqualToAnchor:", v82);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v141[11] = v81;
    objc_msgSend(v133, "trailingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "trailingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:constant:", v79, -33.0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v141[12] = v78;
    objc_msgSend(v133, "widthAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "heightAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:", v76);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v141[13] = v75;
    objc_msgSend(v133, "widthAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToConstant:", 54.0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v141[14] = v73;
    objc_msgSend(v132, "centerXAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "centerXAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:", v71);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v141[15] = v70;
    objc_msgSend(v132, "centerYAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "centerYAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:", v68);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v141[16] = v67;
    objc_msgSend(v132, "widthAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "heightAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v65);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v141[17] = v64;
    objc_msgSend(v132, "widthAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToConstant:", 37.8);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v141[18] = v62;
    objc_msgSend(v123, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "topAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v60);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v141[19] = v59;
    objc_msgSend(v123, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v141[20] = v51;
    objc_msgSend(v123, "widthAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "heightAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v141[21] = v54;
    objc_msgSend(v123, "widthAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToConstant:", 40.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v141[22] = v56;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v141, 23);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "activateConstraints:", v57);

    v8 = v130;
    v6 = v131;

    -[SBHFocusModePopoverView _updateForUserInterfaceStyle](v130, "_updateForUserInterfaceStyle");
  }

  return v8;
}

- (void)_closeButtonTapped:(id)a3
{
  void *v4;
  id v5;

  -[SBHFocusModePopoverView delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHFocusModePopoverView iconListView](self, "iconListView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusModePopoverView:closeButtonTappedForIconListView:", self, v4);

}

- (void)_editPageButtonTapped:(id)a3
{
  void *v4;
  id v5;

  -[SBHFocusModePopoverView delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHFocusModePopoverView iconListView](self, "iconListView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusModePopoverView:editPageButtonTappedForIconListView:", self, v4);

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
  void *v15;
  void *v16;
  void *v17;
  id v18;

  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHFocusModePopoverView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedColorWithTraitCollection:", v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v5);

  objc_msgSend(v3, "_setDrawsAsBackdropOverlayWithBlendMode:", 2);
  -[SBHFocusModePopoverView bodyLabel](self, "bodyLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resolvedColorWithTraitCollection:", v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v8);

  objc_msgSend(v6, "_setDrawsAsBackdropOverlayWithBlendMode:", 2);
  -[SBHFocusModePopoverView editPageButton](self, "editPageButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resolvedColorWithTraitCollection:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTintColor:", v11);

  objc_msgSend(v9, "_setDrawsAsBackdropOverlayWithBlendMode:", 2);
  -[SBHFocusModePopoverView imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resolvedColorWithTraitCollection:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTintColor:", v14);

  objc_msgSend(v12, "_setDrawsAsBackdropOverlayWithBlendMode:", 2);
  -[SBHFocusModePopoverView closeButton](self, "closeButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resolvedColorWithTraitCollection:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTintColor:", v17);

  objc_msgSend(v15, "_setDrawsAsBackdropOverlayWithBlendMode:", 2);
}

- (void)iconListView:(id)a3 didAddIconView:(id)a4
{
  objc_msgSend(a3, "bringSubviewToFront:", self, a4);
}

- (SBHFocusModePopoverViewDelegate)delegate
{
  return (SBHFocusModePopoverViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SBIconListView)iconListView
{
  return (SBIconListView *)objc_loadWeakRetained((id *)&self->_iconListView);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bodyLabel, a3);
}

- (UIButton)editPageButton
{
  return self->_editPageButton;
}

- (void)setEditPageButton:(id)a3
{
  objc_storeStrong((id *)&self->_editPageButton, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_editPageButton, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_iconListView);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
