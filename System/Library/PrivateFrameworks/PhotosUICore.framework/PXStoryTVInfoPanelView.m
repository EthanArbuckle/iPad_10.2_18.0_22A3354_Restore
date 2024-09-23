@implementation PXStoryTVInfoPanelView

- (PXStoryTVInfoPanelView)initWithFrame:(CGRect)a3
{
  PXStoryTVInfoPanelView *v3;
  uint64_t v4;
  PXUpdater *updater;
  uint64_t v6;
  UIVisualEffectView *visualEffectView;
  void *v8;
  uint64_t v9;
  void *v10;
  UIView *v11;
  UIView *assetContainerView;
  void *v13;
  void *v14;
  void *v15;
  UILabel *v16;
  UILabel *titleLabel;
  void *v18;
  void *v19;
  UILabel *v20;
  UILabel *footerLabel;
  void *v22;
  void *v23;
  uint64_t v24;
  PXStoryTVInfoPanelView *v25;
  void (**v26)(void *, const __CFString *);
  id *v27;
  void (**v28)(void *);
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  PXStoryTVInfoPanelButton *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  void *v55;
  uint64_t v56;
  id v57;
  void *v58;
  void *v59;
  uint64_t v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  id v65;
  void *v66;
  uint64_t v67;
  id v68;
  void *v69;
  void *v70;
  uint64_t v71;
  id v72;
  void *v73;
  void *v74;
  uint64_t v75;
  id v76;
  void *v77;
  void *v78;
  uint64_t v79;
  id v80;
  void *v81;
  void *v82;
  uint64_t v83;
  id v84;
  void *v85;
  void *v86;
  uint64_t v87;
  id v88;
  void *v89;
  void *v90;
  uint64_t v91;
  id v92;
  void *v93;
  void *v94;
  uint64_t v95;
  id v96;
  void *v97;
  void *v98;
  uint64_t v99;
  id v100;
  void *v101;
  void *v102;
  uint64_t v103;
  id v104;
  void *v105;
  void *v106;
  uint64_t v107;
  id v108;
  void *v109;
  void *v110;
  uint64_t v111;
  id v112;
  void *v113;
  void *v114;
  uint64_t v115;
  id v116;
  void *v117;
  void *v118;
  uint64_t v119;
  id v120;
  void *v121;
  void *v122;
  uint64_t v123;
  id v124;
  void *v125;
  void *v126;
  uint64_t v127;
  id v128;
  void *v129;
  void *v130;
  uint64_t v131;
  id v132;
  void *v133;
  void *v134;
  uint64_t v135;
  id v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  id v146;
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
  void *v161;
  void *v162;
  void (**v163)(void *);
  void (**v164)(void *, const __CFString *);
  void *v165;
  _QWORD v166[4];
  id *v167;
  _QWORD aBlock[4];
  PXStoryTVInfoPanelView *v169;
  objc_super v170;
  uint64_t v171;
  _QWORD v172[31];
  _QWORD v173[3];

  v173[1] = *MEMORY[0x1E0C80C00];
  v170.receiver = self;
  v170.super_class = (Class)PXStoryTVInfoPanelView;
  v3 = -[PXStoryTVInfoPanelView initWithFrame:](&v170, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v3, sel__setNeedsUpdate);
    updater = v3->_updater;
    v3->_updater = (PXUpdater *)v4;

    -[PXUpdater addUpdateSelector:](v3->_updater, "addUpdateSelector:", sel__updateMainModel);
    -[PXUpdater addUpdateSelector:](v3->_updater, "addUpdateSelector:", sel__updateRecipeManager);
    -[PXUpdater addUpdateSelector:](v3->_updater, "addUpdateSelector:", sel__updateKeyAsset);
    -[PXUpdater addUpdateSelector:](v3->_updater, "addUpdateSelector:", sel__updateTitleLabel);
    -[PXUpdater addUpdateSelector:](v3->_updater, "addUpdateSelector:", sel__updateMusicLabel);
    -[PXUpdater addUpdateSelector:](v3->_updater, "addUpdateSelector:", sel__updateColorGradeLabel);
    -[PXUpdater addUpdateSelector:](v3->_updater, "addUpdateSelector:", sel__updateFooterLabel);
    -[PXUpdater addUpdateSelector:needsUpdate:](v3->_updater, "addUpdateSelector:needsUpdate:", sel__updateContentAlpha, 1);
    -[PXUpdater addUpdateSelector:needsUpdate:](v3->_updater, "addUpdateSelector:needsUpdate:", sel__updateCompositingFilters, 1);
    -[PXUpdater addUpdateSelector:](v3->_updater, "addUpdateSelector:", sel__updateAutolayoutConstraints);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 4);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v165);
    visualEffectView = v3->_visualEffectView;
    v3->_visualEffectView = (UIVisualEffectView *)v6;

    -[UIVisualEffectView setClipsToBounds:](v3->_visualEffectView, "setClipsToBounds:", 1);
    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v3->_visualEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIVisualEffectView layer](v3->_visualEffectView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerRadius:", 24.0);

    v9 = *MEMORY[0x1E0CD2A68];
    -[UIVisualEffectView layer](v3->_visualEffectView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCornerCurve:", v9);

    -[PXStoryTVInfoPanelView addSubview:](v3, "addSubview:", v3->_visualEffectView);
    v11 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    assetContainerView = v3->_assetContainerView;
    v3->_assetContainerView = v11;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_assetContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_assetContainerView, "setBackgroundColor:", v13);

    -[UIView layer](v3->_assetContainerView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerRadius:", 12.0);

    -[UIView layer](v3->_assetContainerView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCornerCurve:", v9);

    -[UIView setClipsToBounds:](v3->_assetContainerView, "setClipsToBounds:", 1);
    -[PXStoryTVInfoPanelView addSubview:](v3, "addSubview:", v3->_assetContainerView);
    v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v16;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v18);

    PXFontWithTextStyleAndWeight();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v19);

    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 1);
    -[PXStoryTVInfoPanelView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    footerLabel = v3->_footerLabel;
    v3->_footerLabel = v20;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_footerLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_footerLabel, "setTextColor:", v22);

    PXFontWithTextStyle();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_footerLabel, "setFont:", v23);

    -[UILabel setNumberOfLines:](v3->_footerLabel, "setNumberOfLines:", 1);
    -[PXStoryTVInfoPanelView addSubview:](v3, "addSubview:", v3->_footerLabel);
    v24 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __40__PXStoryTVInfoPanelView_initWithFrame___block_invoke;
    aBlock[3] = &unk_1E51346E8;
    v25 = v3;
    v169 = v25;
    v26 = (void (**)(void *, const __CFString *))_Block_copy(aBlock);
    v166[0] = v24;
    v166[1] = 3221225472;
    v166[2] = __40__PXStoryTVInfoPanelView_initWithFrame___block_invoke_2;
    v166[3] = &unk_1E5134710;
    v27 = v25;
    v167 = v27;
    v28 = (void (**)(void *))_Block_copy(v166);
    v26[2](v26, CFSTR("music"));
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v27[58];
    v27[58] = (id)v29;

    v28[2](v28);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v27[59];
    v27[59] = (id)v31;

    v164 = v26;
    v164[2](v164, CFSTR("camera.filters"));
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = v27[60];
    v27[60] = (id)v33;

    v163 = v28;
    v28[2](v28);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = v27[61];
    v27[61] = (id)v35;

    v37 = objc_alloc_init(PXStoryTVInfoPanelButton);
    v38 = v27[55];
    v27[55] = v37;

    PXLocalizedStringFromTable(CFSTR("InteractiveMemoryInfoPanelTabTitle"), CFSTR("PhotosUICore"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27[55], "setText:", v39);

    objc_msgSend(v27, "addSubview:", v27[55]);
    v40 = objc_alloc_init(MEMORY[0x1E0DC37D0]);
    v41 = v27[52];
    v27[52] = v40;

    v173[0] = v27[55];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v173, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27[52], "setPreferredFocusEnvironments:", v42);

    objc_msgSend(v27, "addLayoutGuide:", v27[52]);
    -[UIVisualEffectView leadingAnchor](v3->_visualEffectView, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v44);
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = v27[63];
    v27[63] = (id)v45;

    objc_msgSend(v27, "trailingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView trailingAnchor](v3->_visualEffectView, "trailingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v48);
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = v27[64];
    v27[64] = (id)v49;

    objc_msgSend(v27, "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView bottomAnchor](v3->_visualEffectView, "bottomAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v52);
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = v27[65];
    v27[65] = (id)v53;

    -[UIVisualEffectView heightAnchor](v3->_visualEffectView, "heightAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToConstant:", 0.0);
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = v27[66];
    v27[66] = (id)v56;

    objc_msgSend(v27[55], "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView leadingAnchor](v3->_visualEffectView, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v59);
    v60 = objc_claimAutoreleasedReturnValue();
    v61 = v27[67];
    v27[67] = (id)v60;

    objc_msgSend(v27[55], "bottomAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView topAnchor](v3->_visualEffectView, "topAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v63);
    v64 = objc_claimAutoreleasedReturnValue();
    v65 = v27[68];
    v27[68] = (id)v64;

    objc_msgSend(v27[55], "heightAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToConstant:", 0.0);
    v67 = objc_claimAutoreleasedReturnValue();
    v68 = v27[69];
    v27[69] = (id)v67;

    -[UIView topAnchor](v3->_assetContainerView, "topAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView topAnchor](v3->_visualEffectView, "topAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:", v70);
    v71 = objc_claimAutoreleasedReturnValue();
    v72 = v27[70];
    v27[70] = (id)v71;

    -[UIVisualEffectView bottomAnchor](v3->_visualEffectView, "bottomAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v3->_assetContainerView, "bottomAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:", v74);
    v75 = objc_claimAutoreleasedReturnValue();
    v76 = v27[71];
    v27[71] = (id)v75;

    -[UIView leadingAnchor](v3->_assetContainerView, "leadingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView leadingAnchor](v3->_visualEffectView, "leadingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:", v78);
    v79 = objc_claimAutoreleasedReturnValue();
    v80 = v27[72];
    v27[72] = (id)v79;

    -[UILabel firstBaselineAnchor](v3->_titleLabel, "firstBaselineAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView topAnchor](v3->_visualEffectView, "topAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v82);
    v83 = objc_claimAutoreleasedReturnValue();
    v84 = v27[74];
    v27[74] = (id)v83;

    objc_msgSend(v27[58], "firstBaselineAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v3->_titleLabel, "lastBaselineAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:", v86);
    v87 = objc_claimAutoreleasedReturnValue();
    v88 = v27[79];
    v27[79] = (id)v87;

    objc_msgSend(v27[60], "firstBaselineAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27[59], "lastBaselineAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "constraintEqualToAnchor:", v90);
    v91 = objc_claimAutoreleasedReturnValue();
    v92 = v27[80];
    v27[80] = (id)v91;

    objc_msgSend(v27[58], "centerXAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v3->_assetContainerView, "trailingAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintEqualToAnchor:", v94);
    v95 = objc_claimAutoreleasedReturnValue();
    v96 = v27[75];
    v27[75] = (id)v95;

    objc_msgSend(v27[59], "leadingAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v3->_assetContainerView, "trailingAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "constraintEqualToAnchor:", v98);
    v99 = objc_claimAutoreleasedReturnValue();
    v100 = v27[77];
    v27[77] = (id)v99;

    objc_msgSend(v27[59], "trailingAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView trailingAnchor](v3->_visualEffectView, "trailingAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "constraintLessThanOrEqualToAnchor:", v102);
    v103 = objc_claimAutoreleasedReturnValue();
    v104 = v27[78];
    v27[78] = (id)v103;

    objc_msgSend(v27[60], "centerXAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v3->_assetContainerView, "trailingAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "constraintEqualToAnchor:", v106);
    v107 = objc_claimAutoreleasedReturnValue();
    v108 = v27[76];
    v27[76] = (id)v107;

    objc_msgSend(v27[61], "leadingAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v3->_assetContainerView, "trailingAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "constraintEqualToAnchor:", v110);
    v111 = objc_claimAutoreleasedReturnValue();
    v112 = v27[81];
    v27[81] = (id)v111;

    objc_msgSend(v27[61], "trailingAnchor");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView trailingAnchor](v3->_visualEffectView, "trailingAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "constraintLessThanOrEqualToAnchor:", v114);
    v115 = objc_claimAutoreleasedReturnValue();
    v116 = v27[82];
    v27[82] = (id)v115;

    -[UIVisualEffectView bottomAnchor](v3->_visualEffectView, "bottomAnchor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v3->_footerLabel, "lastBaselineAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "constraintEqualToAnchor:", v118);
    v119 = objc_claimAutoreleasedReturnValue();
    v120 = v27[83];
    v27[83] = (id)v119;

    -[UILabel leadingAnchor](v3->_titleLabel, "leadingAnchor");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v3->_assetContainerView, "trailingAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "constraintEqualToAnchor:", v122);
    v123 = objc_claimAutoreleasedReturnValue();
    v124 = v27[84];
    v27[84] = (id)v123;

    -[UILabel leadingAnchor](v3->_footerLabel, "leadingAnchor");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v3->_assetContainerView, "trailingAnchor");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "constraintEqualToAnchor:", v126);
    v127 = objc_claimAutoreleasedReturnValue();
    v128 = v27[85];
    v27[85] = (id)v127;

    -[UILabel trailingAnchor](v3->_titleLabel, "trailingAnchor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView trailingAnchor](v3->_visualEffectView, "trailingAnchor");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "constraintLessThanOrEqualToAnchor:", v130);
    v131 = objc_claimAutoreleasedReturnValue();
    v132 = v27[86];
    v27[86] = (id)v131;

    -[UILabel trailingAnchor](v3->_footerLabel, "trailingAnchor");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView trailingAnchor](v3->_visualEffectView, "trailingAnchor");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "constraintLessThanOrEqualToAnchor:", v134);
    v135 = objc_claimAutoreleasedReturnValue();
    v136 = v27[87];
    v27[87] = (id)v135;

    v153 = (void *)MEMORY[0x1E0CB3718];
    v172[0] = v27[63];
    v172[1] = v27[64];
    v172[2] = v27[65];
    v172[3] = v27[66];
    v172[4] = v27[67];
    v172[5] = v27[68];
    v172[6] = v27[69];
    objc_msgSend(v27[55], "widthAnchor");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27[55], "text");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXStoryTVInfoPanelButton widthForText:](PXStoryTVInfoPanelButton, "widthForText:", v161);
    objc_msgSend(v160, "constraintEqualToConstant:");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    v172[7] = v159;
    objc_msgSend(v27[52], "leadingAnchor");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView leadingAnchor](v3->_visualEffectView, "leadingAnchor");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "constraintEqualToAnchor:", v157);
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    v172[8] = v156;
    objc_msgSend(v27[52], "widthAnchor");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView widthAnchor](v3->_visualEffectView, "widthAnchor");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "constraintEqualToAnchor:", v154);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v172[9] = v152;
    objc_msgSend(v27[52], "topAnchor");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27[55], "topAnchor");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "constraintEqualToAnchor:", v150);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v172[10] = v149;
    objc_msgSend(v27[52], "heightAnchor");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27[55], "heightAnchor");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "constraintEqualToAnchor:", v148);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v172[11] = v137;
    v172[12] = v27[70];
    v172[13] = v27[71];
    v172[14] = v27[72];
    v172[15] = v27[84];
    v172[16] = v27[86];
    v172[17] = v27[74];
    v172[18] = v27[79];
    v172[19] = v27[75];
    v172[20] = v27[77];
    v172[21] = v27[78];
    objc_msgSend(v27[59], "firstBaselineAnchor");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27[58], "firstBaselineAnchor");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "constraintEqualToAnchor:", v139);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v172[22] = v140;
    v172[23] = v27[76];
    v172[24] = v27[81];
    v172[25] = v27[82];
    v172[26] = v27[80];
    objc_msgSend(v27[61], "firstBaselineAnchor");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27[60], "firstBaselineAnchor");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "constraintEqualToAnchor:", v142);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v172[27] = v143;
    v172[28] = v27[85];
    v172[29] = v27[87];
    v172[30] = v27[83];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v172, 31);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "activateConstraints:", v144);

    v171 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v171, 1);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = (id)objc_msgSend(v27, "registerForTraitChanges:withAction:", v145, sel__invalidateCompositingFilters);

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[PXStoryTVInfoPanelView _reuseAssetView](self, "_reuseAssetView");
  v3.receiver = self;
  v3.super_class = (Class)PXStoryTVInfoPanelView;
  -[PXStoryTVInfoPanelView dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  -[PXStoryTVInfoPanelView updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

  v4.receiver = self;
  v4.super_class = (Class)PXStoryTVInfoPanelView;
  -[PXStoryTVInfoPanelView layoutSubviews](&v4, sel_layoutSubviews);
}

- (void)_reuseAssetView
{
  PXDisplayAssetContentView *assetView;
  PXDisplayAssetContentView *v4;

  assetView = self->_assetView;
  if (assetView)
  {
    -[PXDisplayAssetContentView removeFromSuperview](assetView, "removeFromSuperview");
    +[PXDisplayAssetContentView checkInView:](PXDisplayAssetContentView, "checkInView:", self->_assetView);
    v4 = self->_assetView;
    self->_assetView = 0;

  }
}

- (void)_dismiss
{
  id v2;

  -[PXStoryTVInfoPanelView mainModel](self, "mainModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performChanges:", &__block_literal_global_196321);

}

- (void)_invalidateMainModel
{
  id v2;

  -[PXStoryTVInfoPanelView updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateMainModel);

}

- (void)_updateMainModel
{
  void *v3;
  void *v4;
  id v5;

  -[PXStoryTVInfoPanelView userData](self, "userData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryTVInfoPanelView setMainModel:](self, "setMainModel:", v4);

}

- (void)_invalidateRecipeManager
{
  id v2;

  -[PXStoryTVInfoPanelView updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateRecipeManager);

}

- (void)_updateRecipeManager
{
  void *v3;
  id v4;

  -[PXStoryTVInfoPanelView mainModel](self, "mainModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryTVInfoPanelView setRecipeManager:](self, "setRecipeManager:", v3);

}

- (void)_invalidateKeyAsset
{
  id v2;

  -[PXStoryTVInfoPanelView updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateKeyAsset);

}

- (void)_updateKeyAsset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PXDisplayAssetContentView *v7;
  PXDisplayAssetContentView *assetView;
  id v9;

  -[PXStoryTVInfoPanelView _reuseAssetView](self, "_reuseAssetView");
  -[PXStoryTVInfoPanelView recipeManager](self, "recipeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recipe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyAsset");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(off_1E50B3348, "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageProviderForAsset:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[PXDisplayAssetContentView checkOutViewForAsset:withPlaybackStyle:](PXDisplayAssetContentView, "checkOutViewForAsset:withPlaybackStyle:", v9, 1);
    v7 = (PXDisplayAssetContentView *)objc_claimAutoreleasedReturnValue();
    assetView = self->_assetView;
    self->_assetView = v7;

    -[PXDisplayAssetContentView setMediaProvider:](self->_assetView, "setMediaProvider:", v6);
    -[UIView bounds](self->_assetContainerView, "bounds");
    -[PXDisplayAssetContentView setFrame:](self->_assetView, "setFrame:");
    -[PXDisplayAssetContentView setCanDisplayLoadingIndicator:](self->_assetView, "setCanDisplayLoadingIndicator:", 1);
    -[PXDisplayAssetContentView setAutoresizingMask:](self->_assetView, "setAutoresizingMask:", 18);
    -[UIView addSubview:](self->_assetContainerView, "addSubview:", self->_assetView);

  }
}

- (void)_invalidateTitleLabel
{
  id v2;

  -[PXStoryTVInfoPanelView updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateTitleLabel);

}

- (void)_updateTitleLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  -[PXStoryTVInfoPanelView mainModel](self, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentAssetCollection");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E50B3470, "defaultHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayableTextForTitle:intent:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E50B3470, "defaultHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedSubtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayableTextForTitle:intent:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v10, "simulateLongChromeStrings");

  if ((_DWORD)v8)
  {
    objc_msgSend(v6, "px_stringByRepeating:", 10);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "px_stringByRepeating:", 10);
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
    v9 = (void *)v12;
  }
  PXLocalizedStringFromTable(CFSTR("InteractiveMemoryInfoPanelTitleFormat"), CFSTR("PhotosUICore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PXStringWithValidatedFormat();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v14, v6, v9);

}

- (void)_invalidateMusicLabel
{
  id v2;

  -[PXStoryTVInfoPanelView updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateMusicLabel);

}

- (void)_updateMusicLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[PXStoryTVInfoPanelView mainModel](self, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentSongResource");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "px_storyResourceSongAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "artistName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "simulateLongChromeStrings");

    if (v9)
    {
      objc_msgSend(v6, "px_stringByRepeating:", 10);
      v10 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "px_stringByRepeating:", 10);
      v11 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v10;
      v7 = (void *)v11;
    }
    PXLocalizedStringFromTable(CFSTR("InteractiveMemoryChromeLandscapeSongTitleFormat"), CFSTR("PhotosUICore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PXStringWithValidatedFormat();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_musicLabel, "setText:", v13, v6, v7);

    -[UILabel setHidden:](self->_musicLabel, "setHidden:", 0);
    -[UIImageView setHidden:](self->_musicSymbolView, "setHidden:", 0);

  }
  else
  {
    -[UILabel setHidden:](self->_musicLabel, "setHidden:", 1);
    -[UIImageView setHidden:](self->_musicSymbolView, "setHidden:", 1);
  }

}

- (void)_invalidateColorGradeLabel
{
  id v2;

  -[PXStoryTVInfoPanelView updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateColorGradeLabel);

}

- (void)_updateColorGradeLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;

  -[PXStoryTVInfoPanelView mainModel](self, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "customColorGradeKind");

  if (!v5)
  {
    -[PXStoryTVInfoPanelView mainModel](self, "mainModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "originalColorGradeCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXStoryTVInfoPanelView mainModel](self, "mainModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "colorGradingRepository");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v10, "colorGradeKindForColorGradeCategory:", v8);

  }
  -[PXStoryTVInfoPanelView mainModel](self, "mainModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "colorGradingRepository");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedTitleForColorGradeKind:", v5);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v13, "simulateLongChromeStrings");

  if ((_DWORD)v11)
  {
    objc_msgSend(v16, "px_stringByRepeating:", 10);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v14;
  }
  else
  {
    v15 = v16;
  }
  v17 = v15;
  -[UILabel setText:](self->_colorGradeLabel, "setText:", v15);

}

- (void)_invalidateFooterLabel
{
  id v2;

  -[PXStoryTVInfoPanelView updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateFooterLabel);

}

- (void)_updateFooterLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;

  -[PXStoryTVInfoPanelView recipeManager](self, "recipeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recipe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "curatedAssets");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "countOfAssetsWithMediaType:", 1);
    objc_msgSend(v9, "countOfAssetsWithMediaType:", 2);
    PLLocalizedCountDescription();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "simulateLongChromeStrings");

    if (v7)
    {
      objc_msgSend(v5, "px_stringByRepeating:", 10);
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v8;
    }
    -[UILabel setHidden:](self->_footerLabel, "setHidden:", 0);
    -[UILabel setText:](self->_footerLabel, "setText:", v5);

  }
  else
  {
    -[UILabel setHidden:](self->_footerLabel, "setHidden:", 1);
    -[UILabel setText:](self->_footerLabel, "setText:", &stru_1E5149688);
  }

}

- (void)_invalidateContentAlpha
{
  id v2;

  -[PXStoryTVInfoPanelView updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateContentAlpha);

}

- (void)_updateContentAlpha
{
  void *v3;
  double v4;
  double v5;

  -[PXStoryTVInfoPanelView mainModel](self, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "infoPanelVisibilityFraction");
  v5 = v4;

  -[UIVisualEffectView setAlpha:](self->_visualEffectView, "setAlpha:", v5);
  -[UIView setAlpha:](self->_assetContainerView, "setAlpha:", v5);
  -[UILabel setAlpha:](self->_titleLabel, "setAlpha:", v5);
  -[UIImageView setAlpha:](self->_musicSymbolView, "setAlpha:", v5);
  -[UILabel setAlpha:](self->_musicLabel, "setAlpha:", v5);
  -[UIImageView setAlpha:](self->_colorGradeSymbolView, "setAlpha:", v5);
  -[UILabel setAlpha:](self->_colorGradeLabel, "setAlpha:", v5);
  -[UILabel setAlpha:](self->_footerLabel, "setAlpha:", v5);
}

- (void)_invalidateCompositingFilters
{
  id v2;

  -[PXStoryTVInfoPanelView updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCompositingFilters);

}

- (void)_updateCompositingFilters
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = (id)*MEMORY[0x1E0CD2E98];
  -[PXStoryTVInfoPanelView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == 2)
  {
    v5 = (id)*MEMORY[0x1E0CD2EA0];

    v10 = v5;
  }
  -[UIImageView layer](self->_musicSymbolView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCompositingFilter:", v10);

  -[UILabel layer](self->_musicLabel, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCompositingFilter:", v10);

  -[UIImageView layer](self->_colorGradeSymbolView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCompositingFilter:", v10);

  -[UILabel layer](self->_colorGradeLabel, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCompositingFilter:", v10);

}

- (void)_invalidateAutolayoutConstraints
{
  id v2;

  -[PXStoryTVInfoPanelView updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAutolayoutConstraints);

}

- (void)_updateAutolayoutConstraints
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *assetContainerConstraintAspectRatio;
  id v18;

  -[PXStoryTVInfoPanelView viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewLayoutSpec");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "infoPanelMargins");
  -[NSLayoutConstraint setConstant:](self->_panelMarginConstraintLeading, "setConstant:", v4);
  objc_msgSend(v18, "infoPanelMargins");
  -[NSLayoutConstraint setConstant:](self->_panelMarginConstraintTrailing, "setConstant:", v5);
  objc_msgSend(v18, "infoPanelMargins");
  -[NSLayoutConstraint setConstant:](self->_panelMarginConstraintBottom, "setConstant:", v6);
  objc_msgSend(v18, "infoPanelHeight");
  -[NSLayoutConstraint setConstant:](self->_panelHeightConstraint, "setConstant:");
  objc_msgSend(v18, "infoPanelButtonOffset");
  -[NSLayoutConstraint setConstant:](self->_infoButtonLeadingConstraint, "setConstant:");
  objc_msgSend(v18, "infoPanelButtonOffset");
  -[NSLayoutConstraint setConstant:](self->_infoButtonBottomConstraint, "setConstant:", v7);
  objc_msgSend(v18, "infoPanelButtonHeight");
  -[NSLayoutConstraint setConstant:](self->_infoButtonHeightConstraint, "setConstant:");
  objc_msgSend(v18, "infoPanelPadding");
  -[NSLayoutConstraint setConstant:](self->_assetContainerConstraintTop, "setConstant:");
  objc_msgSend(v18, "infoPanelPadding");
  -[NSLayoutConstraint setConstant:](self->_assetContainerConstraintBottom, "setConstant:", v8);
  objc_msgSend(v18, "infoPanelPadding");
  -[NSLayoutConstraint setConstant:](self->_assetContainerConstraintLeading, "setConstant:", v9);
  objc_msgSend(v18, "infoPanelAssetToSymbolCenter");
  -[NSLayoutConstraint setConstant:](self->_musicSymbolCenterConstraint, "setConstant:");
  objc_msgSend(v18, "infoPanelAssetToSymbolCenter");
  -[NSLayoutConstraint setConstant:](self->_colorGradeSymbolCenterConstraint, "setConstant:");
  objc_msgSend(v18, "infoPanelAssetToMetadataLabel");
  -[NSLayoutConstraint setConstant:](self->_musicLabelLeadingConstraint, "setConstant:");
  objc_msgSend(v18, "infoPanelAssetToMetadataLabel");
  -[NSLayoutConstraint setConstant:](self->_colorGradeLabelLeadingConstraint, "setConstant:");
  objc_msgSend(v18, "infoPanelPadding");
  -[NSLayoutConstraint setConstant:](self->_colorGradeLabelTrailingConstraint, "setConstant:", -v10);
  objc_msgSend(v18, "infoPanelPadding");
  -[NSLayoutConstraint setConstant:](self->_musicLabelTrailingConstraint, "setConstant:", -v11);
  objc_msgSend(v18, "infoPanelFooterLabelBaselineFromBottom");
  -[NSLayoutConstraint setConstant:](self->_footerLabelBaselineConstraint, "setConstant:");
  objc_msgSend(v18, "infoPanelTitleLabelBaselineFromTop");
  -[NSLayoutConstraint setConstant:](self->_titleLabelBaselineConstraint, "setConstant:");
  objc_msgSend(v18, "infoPanelTitleToMetadataBaselines");
  -[NSLayoutConstraint setConstant:](self->_titleToMetadataBaselineConstraint, "setConstant:");
  objc_msgSend(v18, "infoPanelMetadataToMetadataBaselines");
  -[NSLayoutConstraint setConstant:](self->_musicToColorGradeBaselineConstraint, "setConstant:");
  objc_msgSend(v18, "infoPanelDistanceBetweenAssetAndTitleLabel");
  -[NSLayoutConstraint setConstant:](self->_titleLabelLeadingConstraint, "setConstant:");
  objc_msgSend(v18, "infoPanelDistanceBetweenAssetAndTitleLabel");
  -[NSLayoutConstraint setConstant:](self->_footerLabelLeadingConstraint, "setConstant:");
  objc_msgSend(v18, "infoPanelPadding");
  -[NSLayoutConstraint setConstant:](self->_titleLabelTrailingConstraint, "setConstant:", -v12);
  objc_msgSend(v18, "infoPanelPadding");
  -[NSLayoutConstraint setConstant:](self->_footerLabelTrailingConstraint, "setConstant:", -v13);
  -[NSLayoutConstraint setActive:](self->_assetContainerConstraintAspectRatio, "setActive:", 0);
  -[UIView widthAnchor](self->_assetContainerView, "widthAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView heightAnchor](self->_assetContainerView, "heightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "infoPanelAssetAspectRatio");
  objc_msgSend(v14, "constraintEqualToAnchor:multiplier:", v15);
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  assetContainerConstraintAspectRatio = self->_assetContainerConstraintAspectRatio;
  self->_assetContainerConstraintAspectRatio = v16;

  -[NSLayoutConstraint setActive:](self->_assetContainerConstraintAspectRatio, "setActive:", 1);
}

- (void)setViewModel:(id)a3
{
  PXStoryViewModel *v5;
  PXStoryViewModel *viewModel;
  PXStoryViewModel *v7;

  v5 = (PXStoryViewModel *)a3;
  viewModel = self->_viewModel;
  if (viewModel != v5)
  {
    v7 = v5;
    -[PXStoryViewModel unregisterChangeObserver:context:](viewModel, "unregisterChangeObserver:context:", self, ViewModelObservationContext_196291);
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[PXStoryViewModel registerChangeObserver:context:](self->_viewModel, "registerChangeObserver:context:", self, ViewModelObservationContext_196291);
    -[PXStoryTVInfoPanelView _invalidateMainModel](self, "_invalidateMainModel");
    -[PXStoryTVInfoPanelView _invalidateTitleLabel](self, "_invalidateTitleLabel");
    -[PXStoryTVInfoPanelView _invalidateFooterLabel](self, "_invalidateFooterLabel");
    -[PXStoryTVInfoPanelView _invalidateAutolayoutConstraints](self, "_invalidateAutolayoutConstraints");
    v5 = v7;
  }

}

- (void)setMainModel:(id)a3
{
  PXStoryModel *v5;
  PXStoryModel *mainModel;
  PXStoryModel *v7;

  v5 = (PXStoryModel *)a3;
  mainModel = self->_mainModel;
  if (mainModel != v5)
  {
    v7 = v5;
    -[PXStoryModel unregisterChangeObserver:context:](mainModel, "unregisterChangeObserver:context:", self, ModelObservationContext_196292);
    objc_storeStrong((id *)&self->_mainModel, a3);
    -[PXStoryModel registerChangeObserver:context:](self->_mainModel, "registerChangeObserver:context:", self, ModelObservationContext_196292);
    -[PXStoryTVInfoPanelView _invalidateRecipeManager](self, "_invalidateRecipeManager");
    -[PXStoryTVInfoPanelView _invalidateMusicLabel](self, "_invalidateMusicLabel");
    -[PXStoryTVInfoPanelView _invalidateColorGradeLabel](self, "_invalidateColorGradeLabel");
    -[PXStoryTVInfoPanelView _invalidateContentAlpha](self, "_invalidateContentAlpha");
    v5 = v7;
  }

}

- (void)setRecipeManager:(id)a3
{
  PXStoryRecipeManager *v5;
  PXStoryRecipeManager *recipeManager;
  PXStoryRecipeManager *v7;

  v5 = (PXStoryRecipeManager *)a3;
  recipeManager = self->_recipeManager;
  if (recipeManager != v5)
  {
    v7 = v5;
    -[PXStoryRecipeManager unregisterChangeObserver:context:](recipeManager, "unregisterChangeObserver:context:", self, RecipeManagerObservationContext_196293);
    objc_storeStrong((id *)&self->_recipeManager, a3);
    -[PXStoryRecipeManager registerChangeObserver:context:](self->_recipeManager, "registerChangeObserver:context:", self, RecipeManagerObservationContext_196293);
    -[PXStoryTVInfoPanelView _invalidateKeyAsset](self, "_invalidateKeyAsset");
    v5 = v7;
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v9;
  id v10;

  v10 = a3;
  if ((void *)ViewModelObservationContext_196291 == a5)
  {
    if ((a4 & 0x40) != 0)
    {
      -[PXStoryTVInfoPanelView _invalidateMainModel](self, "_invalidateMainModel");
      if ((a4 & 0x20) == 0)
      {
LABEL_8:
        if ((a4 & 0x10) == 0)
          goto LABEL_20;
        goto LABEL_16;
      }
    }
    else if ((a4 & 0x20) == 0)
    {
      goto LABEL_8;
    }
    -[PXStoryTVInfoPanelView _invalidateAutolayoutConstraints](self, "_invalidateAutolayoutConstraints");
    if ((a4 & 0x10) == 0)
      goto LABEL_20;
LABEL_16:
    -[PXStoryTVInfoPanelView _invalidateTitleLabel](self, "_invalidateTitleLabel");
    goto LABEL_20;
  }
  if ((void *)ModelObservationContext_196292 == a5)
  {
    if ((a4 & 0x800000000000000) != 0)
    {
      -[PXStoryTVInfoPanelView _invalidateContentAlpha](self, "_invalidateContentAlpha");
      if ((a4 & 0x200) == 0)
      {
LABEL_12:
        if ((a4 & 0x100000000000) == 0)
          goto LABEL_20;
        goto LABEL_19;
      }
    }
    else if ((a4 & 0x200) == 0)
    {
      goto LABEL_12;
    }
    -[PXStoryTVInfoPanelView _invalidateMusicLabel](self, "_invalidateMusicLabel");
    if ((a4 & 0x100000000000) == 0)
      goto LABEL_20;
LABEL_19:
    -[PXStoryTVInfoPanelView _invalidateColorGradeLabel](self, "_invalidateColorGradeLabel");
    goto LABEL_20;
  }
  if ((void *)RecipeManagerObservationContext_196293 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTVInfoPanelView.m"), 663, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((a4 & 1) != 0)
  {
    -[PXStoryTVInfoPanelView _invalidateKeyAsset](self, "_invalidateKeyAsset");
    -[PXStoryTVInfoPanelView _invalidateFooterLabel](self, "_invalidateFooterLabel");
  }
LABEL_20:

}

- (void)setUserData:(id)a3
{
  PXStoryTVInfoPanelViewConfiguration *v4;
  void *v5;
  BOOL v6;
  PXStoryTVInfoPanelViewConfiguration *v7;
  PXStoryTVInfoPanelViewConfiguration *userData;
  void *v9;
  PXStoryTVInfoPanelViewConfiguration *v10;

  v10 = (PXStoryTVInfoPanelViewConfiguration *)a3;
  v4 = self->_userData;
  v5 = v10;
  if (v4 == v10)
    goto LABEL_4;
  v6 = -[PXStoryTVInfoPanelViewConfiguration isEqual:](v10, "isEqual:", v4);

  if (!v6)
  {
    v7 = (PXStoryTVInfoPanelViewConfiguration *)-[PXStoryTVInfoPanelViewConfiguration copy](v10, "copy");
    userData = self->_userData;
    self->_userData = v7;

    -[PXStoryTVInfoPanelView userData](self, "userData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryTVInfoPanelView setViewModel:](self, "setViewModel:", v9);

LABEL_4:
  }

}

- (void)prepareForReuse
{
  -[PXStoryTVInfoPanelView setUserData:](self, "setUserData:", 0);
  -[PXStoryTVInfoPanelView _reuseAssetView](self, "_reuseAssetView");
}

- (void)addHostedLayer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXStoryTVInfoPanelView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSublayer:", v4);

}

- (CGPoint)convertHostedChildCenter:(CGPoint)a3 fromGlobalLayer:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PXStoryTVInfoPanelView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:fromLayer:", v7, x, y);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (PXStoryTVInfoPanelViewConfiguration)userData
{
  return self->_userData;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (PXStoryModel)mainModel
{
  return self->_mainModel;
}

- (PXStoryRecipeManager)recipeManager
{
  return self->_recipeManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipeManager, 0);
  objc_storeStrong((id *)&self->_mainModel, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_footerLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_footerLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_footerLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_colorGradeLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_colorGradeLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_musicToColorGradeBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_titleToMetadataBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_musicLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_musicLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_colorGradeSymbolCenterConstraint, 0);
  objc_storeStrong((id *)&self->_musicSymbolCenterConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_assetContainerConstraintAspectRatio, 0);
  objc_storeStrong((id *)&self->_assetContainerConstraintLeading, 0);
  objc_storeStrong((id *)&self->_assetContainerConstraintBottom, 0);
  objc_storeStrong((id *)&self->_assetContainerConstraintTop, 0);
  objc_storeStrong((id *)&self->_infoButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_infoButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_infoButtonLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_panelHeightConstraint, 0);
  objc_storeStrong((id *)&self->_panelMarginConstraintBottom, 0);
  objc_storeStrong((id *)&self->_panelMarginConstraintTrailing, 0);
  objc_storeStrong((id *)&self->_panelMarginConstraintLeading, 0);
  objc_storeStrong((id *)&self->_footerLabel, 0);
  objc_storeStrong((id *)&self->_colorGradeLabel, 0);
  objc_storeStrong((id *)&self->_colorGradeSymbolView, 0);
  objc_storeStrong((id *)&self->_musicLabel, 0);
  objc_storeStrong((id *)&self->_musicSymbolView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_assetContainerView, 0);
  objc_storeStrong((id *)&self->_infoButton, 0);
  objc_storeStrong((id *)&self->_assetView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_focusGuide, 0);
}

uint64_t __34__PXStoryTVInfoPanelView__dismiss__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDesiredInfoPanelVisibilityFraction:", 0.0);
}

id __40__PXStoryTVInfoPanelView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)MEMORY[0x1E0DC3890];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (void *)MEMORY[0x1E0DC3888];
  PXFontWithTextStyle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationWithFont:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPreferredSymbolConfiguration:", v8);
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "imageWithRenderingMode:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v11);

  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v5);
  return v5;
}

id __40__PXStoryTVInfoPanelView_initWithFrame___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  PXFontWithTextStyle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v4);

  objc_msgSend(v2, "setNumberOfLines:", 1);
  objc_msgSend(v2, "setLineBreakMode:", 4);
  objc_msgSend(v2, "setAllowsDefaultTighteningForTruncation:", 1);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v2);
  return v2;
}

+ (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 1920.0;
  v4 = 400.0;
  result.height = v4;
  result.width = v3;
  return result;
}

@end
