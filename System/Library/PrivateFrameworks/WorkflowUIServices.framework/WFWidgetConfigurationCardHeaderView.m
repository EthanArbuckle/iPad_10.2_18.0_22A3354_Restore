@implementation WFWidgetConfigurationCardHeaderView

- (WFWidgetConfigurationCardHeaderView)initWithRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  WFWidgetConfigurationCardHeaderView *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  WFWidgetConfigurationCardHeaderView *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  WFWidgetConfigurationCardHeaderView *v45;
  void *v47;
  void *v48;

  v4 = a3;
  objc_msgSend(v4, "intent");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE60128]), "initWithOptions:", 0);
    objc_msgSend(v5, "_intents_bundleIdForLaunching");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appIntentIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionsForBundleIdentifier:andActionIdentifier:error:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "attributionBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(v5, "_intents_bundleIdForDisplay");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;

    v15 = v5;
  }
  else
  {

    objc_msgSend(v5, "_intents_bundleIdForDisplay");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
  }
  objc_msgSend(v4, "remoteDeviceIdentifier");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    objc_msgSend(v4, "remoteAppLocalizedName");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      objc_msgSend(v4, "remoteAppIcon");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v4, "remoteAppLocalizedName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "remoteAppIcon");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
    }
    else
    {

    }
  }
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v14, 1, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14E0], "applicationIconImageForBundleIdentifier:", v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  if (objc_msgSend(v4, "resolvedWidgetConfigurationStyle") == 1)
  {
    v24 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:weight:", 4, 24.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x24BEBD660];
    objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "configurationWithHierarchicalColor:", v27);
    v47 = v14;
    v28 = self;
    v29 = v15;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "configurationByApplyingConfiguration:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("xmark.circle.fill"), v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD438], "plainButtonConfiguration");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setImage:", v32);
    objc_msgSend(v33, "setContentInsets:", -12.0, 0.0, 0.0, 0.0);
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithConfiguration:primaryAction:", v33, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v15 = v29;
    self = v28;
    v14 = v47;

  }
  objc_msgSend(v4, "widgetDisplayName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v34)
  {
    v36 = v34;
  }
  else
  {
    v48 = v22;
    v37 = v21;
    v38 = v14;
    v39 = self;
    v40 = v15;
    objc_msgSend(v5, "_title");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v41)
    {
      v43 = v41;
    }
    else
    {
      objc_msgSend(v4, "fallbackDisplayName");
      v43 = (id)objc_claimAutoreleasedReturnValue();
    }
    v36 = v43;

    v15 = v40;
    self = v39;
    v14 = v38;
    v21 = v37;
    v22 = v48;
  }

  objc_msgSend(v22, "platformImage");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[WFWidgetConfigurationCardHeaderView initWithIcon:closeButton:title:subtitle:](self, "initWithIcon:closeButton:title:subtitle:", v44, v24, v36, v21);

  return v45;
}

- (WFWidgetConfigurationCardHeaderView)initWithIcon:(id)a3 closeButton:(id)a4 title:(id)a5 subtitle:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  WFWidgetConfigurationCardHeaderView *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  uint64_t v22;
  UIView *blendedBorderView;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  UILabel *v34;
  UILabel *titleLabel;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _BOOL8 v47;
  void *v48;
  UILabel *v49;
  UILabel *subtitleLabel;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _BOOL8 v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  UIStackView *labelsStackView;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  void *v81;
  double v82;
  void *v83;
  double v84;
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
  uint64_t v96;
  NSLayoutConstraint *bottomAreaHeightConstraint;
  double v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  WFWidgetConfigurationCardHeaderView *v108;
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
  id obj;
  id obja;
  id v153;
  void *v154;
  void *v155;
  id v156;
  void *v157;
  objc_super v158;
  _QWORD v159[13];
  _QWORD v160[2];
  _QWORD v161[4];

  v161[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v158.receiver = self;
  v158.super_class = (Class)WFWidgetConfigurationCardHeaderView;
  v14 = -[WFWidgetConfigurationCardHeaderView initWithFrame:](&v158, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v14)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v10);
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v16) = 1148829696;
    objc_msgSend(v15, "setContentHuggingPriority:forAxis:", 0, v16);
    LODWORD(v17) = 1148829696;
    objc_msgSend(v15, "setContentHuggingPriority:forAxis:", 1, v17);
    LODWORD(v18) = 1148829696;
    objc_msgSend(v15, "setContentCompressionResistancePriority:forAxis:", 0, v18);
    LODWORD(v19) = 1148829696;
    objc_msgSend(v15, "setContentCompressionResistancePriority:forAxis:", 1, v19);
    v157 = v13;
    v20 = objc_alloc(MEMORY[0x24BEBDB00]);
    obj = a4;
    v21 = v15;
    v154 = v15;
    objc_msgSend(v15, "bounds");
    v22 = objc_msgSend(v20, "initWithFrame:");
    blendedBorderView = v14->_blendedBorderView;
    v14->_blendedBorderView = (UIView *)v22;

    -[WFWidgetConfigurationCardHeaderView blendedBorderView](v14, "blendedBorderView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAutoresizingMask:", 18);

    -[WFWidgetConfigurationCardHeaderView traitCollection](v14, "traitCollection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "displayScale");
    v27 = 1.0 / v26;
    -[WFWidgetConfigurationCardHeaderView blendedBorderView](v14, "blendedBorderView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setBorderWidth:", v27);

    v30 = *MEMORY[0x24BDE58E8];
    -[WFWidgetConfigurationCardHeaderView blendedBorderView](v14, "blendedBorderView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setCornerCurve:", v30);

    -[WFWidgetConfigurationCardHeaderView updateIconBorderColor](v14, "updateIconBorderColor");
    -[WFWidgetConfigurationCardHeaderView updateIconBorderWidth](v14, "updateIconBorderWidth");
    -[WFWidgetConfigurationCardHeaderView blendedBorderView](v14, "blendedBorderView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", v33);

    v34 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    titleLabel = v14->_titleLabel;
    v14->_titleLabel = v34;

    -[WFWidgetConfigurationCardHeaderView titleLabel](v14, "titleLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[WFWidgetConfigurationCardHeaderView titleLabel](v14, "titleLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setText:", v12);

    v38 = *MEMORY[0x24BEBE200];
    objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE200]);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = v10;
    v40 = (void *)MEMORY[0x24BEBB520];
    v41 = *MEMORY[0x24BEBE0B8];
    objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x24BEBE0B8]);
    v153 = v11;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "preferredFontForTextStyle:compatibleWithTraitCollection:", v38, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "scaledFontForFont:maximumPointSize:", v43, 40.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardHeaderView titleLabel](v14, "titleLabel");
    v155 = v12;
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setFont:", v44);

    -[WFWidgetConfigurationCardHeaderView titleLabel](v14, "titleLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setAdjustsFontForContentSizeCategory:", 1);

    v47 = objc_msgSend(v155, "length") == 0;
    -[WFWidgetConfigurationCardHeaderView titleLabel](v14, "titleLabel");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setHidden:", v47);

    v49 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    subtitleLabel = v14->_subtitleLabel;
    v14->_subtitleLabel = v49;

    -[WFWidgetConfigurationCardHeaderView subtitleLabel](v14, "subtitleLabel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[WFWidgetConfigurationCardHeaderView subtitleLabel](v14, "subtitleLabel");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setText:", v157);

    v53 = *MEMORY[0x24BEBE1E0];
    objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE1E0]);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithPreferredContentSizeCategory:", v41);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "preferredFontForTextStyle:compatibleWithTraitCollection:", v53, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "scaledFontForFont:maximumPointSize:", v57, 32.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardHeaderView subtitleLabel](v14, "subtitleLabel");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setFont:", v58);

    -[WFWidgetConfigurationCardHeaderView subtitleLabel](v14, "subtitleLabel");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setAdjustsFontForContentSizeCategory:", 1);

    v61 = objc_msgSend(v157, "length") == 0;
    -[WFWidgetConfigurationCardHeaderView subtitleLabel](v14, "subtitleLabel");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setHidden:", v61);

    v63 = objc_alloc(MEMORY[0x24BEBD978]);
    -[WFWidgetConfigurationCardHeaderView titleLabel](v14, "titleLabel");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v161[0] = v64;
    -[WFWidgetConfigurationCardHeaderView subtitleLabel](v14, "subtitleLabel");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v161[1] = v65;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v161, 2);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v63, "initWithArrangedSubviews:", v66);
    labelsStackView = v14->_labelsStackView;
    v14->_labelsStackView = (UIStackView *)v67;

    -[WFWidgetConfigurationCardHeaderView labelsStackView](v14, "labelsStackView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[WFWidgetConfigurationCardHeaderView labelsStackView](v14, "labelsStackView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setAxis:", 1);

    -[WFWidgetConfigurationCardHeaderView labelsStackView](v14, "labelsStackView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setAlignment:", 1);

    -[WFWidgetConfigurationCardHeaderView labelsStackView](v14, "labelsStackView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setBaselineRelativeArrangement:", 1);

    -[WFWidgetConfigurationCardHeaderView labelsStackView](v14, "labelsStackView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setSpacing:", 1.17549435e-38);

    v74 = objc_alloc(MEMORY[0x24BEBD978]);
    v160[0] = v154;
    -[WFWidgetConfigurationCardHeaderView labelsStackView](v14, "labelsStackView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v160[1] = v75;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v160, 2);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = (void *)objc_msgSend(v74, "initWithArrangedSubviews:", v76);

    v78 = v77;
    objc_msgSend(v77, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v77, "setSpacing:", 8.0);
    objc_msgSend(v77, "setAlignment:", 3);
    v150 = v77;
    objc_msgSend(v77, "setDistribution:", 0);
    objc_storeStrong((id *)&v14->_closeButton, obj);
    -[WFWidgetConfigurationCardHeaderView closeButton](v14, "closeButton");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v80) = 1148829696;
    objc_msgSend(v79, "setContentCompressionResistancePriority:forAxis:", 0, v80);

    -[WFWidgetConfigurationCardHeaderView closeButton](v14, "closeButton");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v82) = 1148829696;
    objc_msgSend(v81, "setContentCompressionResistancePriority:forAxis:", 1, v82);

    -[WFWidgetConfigurationCardHeaderView closeButton](v14, "closeButton");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v84) = 1148829696;
    objc_msgSend(v83, "setContentHuggingPriority:forAxis:", 0, v84);

    -[WFWidgetConfigurationCardHeaderView closeButton](v14, "closeButton");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v86) = 1148829696;
    objc_msgSend(v85, "setContentHuggingPriority:forAxis:", 1, v86);

    -[WFWidgetConfigurationCardHeaderView closeButton](v14, "closeButton");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "addTarget:action:forControlEvents:", v14, sel_close, 0x2000);

    v88 = (void *)MEMORY[0x24BDBCE30];
    -[WFWidgetConfigurationCardHeaderView closeButton](v14, "closeButton");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "arrayWithObjects:", v78, v89, 0);
    obja = (id)objc_claimAutoreleasedReturnValue();

    v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD978]), "initWithArrangedSubviews:", obja);
    objc_msgSend(v90, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v90, "setSpacing:", 8.0);
    objc_msgSend(v90, "setAlignment:", 1);
    objc_msgSend(v90, "setDistribution:", 0);
    objc_msgSend(v154, "setHidden:", v156 == 0);
    -[WFWidgetConfigurationCardHeaderView addSubview:](v14, "addSubview:", v90);
    v91 = (void *)objc_opt_new();
    v92 = (void *)objc_opt_new();
    -[WFWidgetConfigurationCardHeaderView addLayoutGuide:](v14, "addLayoutGuide:", v91);
    -[WFWidgetConfigurationCardHeaderView addLayoutGuide:](v14, "addLayoutGuide:", v92);
    v93 = v91;
    objc_msgSend(v91, "heightAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "heightAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardHeaderView widgetDescriptionTallScriptCompensatedSpacing](v14, "widgetDescriptionTallScriptCompensatedSpacing");
    objc_msgSend(v94, "constraintEqualToAnchor:constant:", v95);
    v96 = objc_claimAutoreleasedReturnValue();
    bottomAreaHeightConstraint = v14->_bottomAreaHeightConstraint;
    v14->_bottomAreaHeightConstraint = (NSLayoutConstraint *)v96;

    LODWORD(v98) = 1148354560;
    -[NSLayoutConstraint setPriority:](v14->_bottomAreaHeightConstraint, "setPriority:", v98);
    v129 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v154, "widthAnchor");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "heightAnchor");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "constraintEqualToAnchor:", v148);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v159[0] = v147;
    objc_msgSend(v90, "topAnchor");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardHeaderView layoutMarginsGuide](v14, "layoutMarginsGuide");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "topAnchor");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "constraintEqualToAnchor:", v144);
    v142 = v90;
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v159[1] = v143;
    objc_msgSend(v90, "leadingAnchor");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardHeaderView layoutMarginsGuide](v14, "layoutMarginsGuide");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "leadingAnchor");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "constraintEqualToAnchor:", v139);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v159[2] = v138;
    objc_msgSend(v90, "bottomAnchor");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "topAnchor");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "constraintEqualToAnchor:", v136);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v159[3] = v135;
    objc_msgSend(v90, "trailingAnchor");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardHeaderView layoutMarginsGuide](v14, "layoutMarginsGuide");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "trailingAnchor");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "constraintEqualToAnchor:", v132);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v159[4] = v131;
    objc_msgSend(v93, "topAnchor");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardHeaderView topAnchor](v14, "topAnchor");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "constraintEqualToAnchor:", v127);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v159[5] = v126;
    v130 = v93;
    objc_msgSend(v93, "bottomAnchor");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardHeaderView layoutMarginsGuide](v14, "layoutMarginsGuide");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "topAnchor");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "constraintEqualToAnchor:", v122);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v159[6] = v121;
    objc_msgSend(v92, "bottomAnchor");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardHeaderView bottomAnchor](v14, "bottomAnchor");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "constraintEqualToAnchor:", v119);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v159[7] = v118;
    v159[8] = v14->_bottomAreaHeightConstraint;
    objc_msgSend(v93, "leadingAnchor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardHeaderView layoutMarginsGuide](v14, "layoutMarginsGuide");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "leadingAnchor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "constraintEqualToAnchor:", v115);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v159[9] = v114;
    objc_msgSend(v93, "trailingAnchor");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardHeaderView layoutMarginsGuide](v14, "layoutMarginsGuide");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "trailingAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "constraintEqualToAnchor:", v111);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v159[10] = v110;
    v124 = v92;
    objc_msgSend(v92, "leadingAnchor");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardHeaderView layoutMarginsGuide](v14, "layoutMarginsGuide");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "leadingAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "constraintEqualToAnchor:", v101);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v159[11] = v102;
    objc_msgSend(v92, "trailingAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardHeaderView layoutMarginsGuide](v14, "layoutMarginsGuide");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "trailingAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "constraintEqualToAnchor:", v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v159[12] = v106;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v159, 13);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "activateConstraints:", v107);

    v11 = v153;
    v12 = v155;

    v10 = v156;
    v13 = v157;

    v108 = v14;
  }

  return v14;
}

- (void)setWidgetDescriptionTallScriptCompensatedSpacing:(double)a3
{
  id v4;

  self->_widgetDescriptionTallScriptCompensatedSpacing = a3;
  -[WFWidgetConfigurationCardHeaderView bottomAreaHeightConstraint](self, "bottomAreaHeightConstraint");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WFWidgetConfigurationCardHeaderView;
  -[WFWidgetConfigurationCardHeaderView traitCollectionDidChange:](&v20, sel_traitCollectionDidChange_, v4);
  -[WFWidgetConfigurationCardHeaderView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE200]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scaledValueForValue:", 18.0);
    v10 = v9;
    -[WFWidgetConfigurationCardHeaderView labelsStackView](self, "labelsStackView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSpacing:", v10);

  }
  -[WFWidgetConfigurationCardHeaderView traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceStyle");
  v14 = objc_msgSend(v4, "userInterfaceStyle");

  if (v13 != v14)
    -[WFWidgetConfigurationCardHeaderView updateIconBorderColor](self, "updateIconBorderColor");
  -[WFWidgetConfigurationCardHeaderView traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "displayScale");
  v17 = v16;
  objc_msgSend(v4, "displayScale");
  v19 = v18;

  if (v17 != v19)
    -[WFWidgetConfigurationCardHeaderView updateIconBorderWidth](self, "updateIconBorderWidth");

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFWidgetConfigurationCardHeaderView;
  -[WFWidgetConfigurationCardHeaderView layoutSubviews](&v8, sel_layoutSubviews);
  -[WFWidgetConfigurationCardHeaderView blendedBorderView](self, "blendedBorderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4 * 0.224999994;
  -[WFWidgetConfigurationCardHeaderView blendedBorderView](self, "blendedBorderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", v5);

}

- (void)updateIconBorderWidth
{
  void *v2;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  -[WFWidgetConfigurationCardHeaderView traitCollection](self, "traitCollection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayScale");
  v5 = v4;
  if (v4 <= 0.0)
  {
    v7 = 1.0;
  }
  else
  {
    -[WFWidgetConfigurationCardHeaderView traitCollection](self, "traitCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "displayScale");
    v7 = 1.0 / v6;
  }
  -[WFWidgetConfigurationCardHeaderView blendedBorderView](self, "blendedBorderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBorderWidth:", v7);

  if (v5 > 0.0)
}

- (void)updateIconBorderColor
{
  void *v3;
  uint64_t v4;
  CGColorRef SRGB;
  void *v6;
  void *v7;
  uint64_t *v8;
  CGColorRef v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  -[WFWidgetConfigurationCardHeaderView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == 1)
  {
    SRGB = CGColorCreateSRGB(0.874509811, 0.874509811, 0.894117653, 1.0);
    -[WFWidgetConfigurationCardHeaderView blendedBorderView](self, "blendedBorderView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBorderColor:", SRGB);

    v8 = (uint64_t *)MEMORY[0x24BDE5A28];
  }
  else
  {
    v9 = CGColorCreateSRGB(0.247058824, 0.247058824, 0.247058824, 1.0);
    -[WFWidgetConfigurationCardHeaderView blendedBorderView](self, "blendedBorderView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBorderColor:", v9);

    v8 = (uint64_t *)MEMORY[0x24BDE5B48];
  }
  v12 = *v8;
  -[WFWidgetConfigurationCardHeaderView blendedBorderView](self, "blendedBorderView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCompositingFilter:", v12);

}

- (void)close
{
  id v3;

  -[WFWidgetConfigurationCardHeaderView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widgetConfigurationCardHeaderViewDidRequestToClose:", self);

}

- (WFWidgetConfigurationCardHeaderViewDelegate)delegate
{
  return (WFWidgetConfigurationCardHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (NSLayoutConstraint)bottomAreaHeightConstraint
{
  return self->_bottomAreaHeightConstraint;
}

- (UIStackView)labelsStackView
{
  return self->_labelsStackView;
}

- (UIView)blendedBorderView
{
  return self->_blendedBorderView;
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (double)widgetDescriptionTallScriptCompensatedSpacing
{
  return self->_widgetDescriptionTallScriptCompensatedSpacing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_blendedBorderView, 0);
  objc_storeStrong((id *)&self->_labelsStackView, 0);
  objc_storeStrong((id *)&self->_bottomAreaHeightConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
