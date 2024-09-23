@implementation SearchUIDetailedView

- (SearchUIDetailedView)initWithFeedbackDelegate:(id)a3
{
  id v4;
  SearchUIDetailedView *v5;
  SearchUIDetailedView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SearchUIDetailedView;
  v5 = -[SearchUIDetailedView init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SearchUIDetailedView setFeedbackDelegate:](v5, "setFeedbackDelegate:", v4);
    -[NUIContainerStackView setSpacing:](v6, "setSpacing:", *MEMORY[0x1E0DBDA78]);
    -[SearchUIDetailedView setLayoutMarginsRelativeArrangement:](v6, "setLayoutMarginsRelativeArrangement:", 1);
    v7 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0DBDA50], "makeContainerShadowCompatible:", v7);
    objc_msgSend(v7, "setDelegate:", v6);
    -[SearchUIDetailedView addArrangedSubview:](v6, "addArrangedSubview:", v7);
    -[SearchUIDetailedView setInnerContainer:](v6, "setInnerContainer:", v7);
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setAxis:", 1);
    objc_msgSend(v8, "setSpacing:", 11.0);
    objc_msgSend(MEMORY[0x1E0DBDA50], "makeContainerShadowCompatible:", v8);
    -[SearchUIDetailedView setButtonAndDetailViewStackView:](v6, "setButtonAndDetailViewStackView:", v8);
    -[SearchUIDetailedView innerContainer](v6, "innerContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIDetailedView buttonAndDetailViewStackView](v6, "buttonAndDetailViewStackView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addArrangedSubview:", v10);

    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setDelegate:", v6);
    objc_msgSend(v11, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    objc_msgSend(MEMORY[0x1E0DBDA50], "makeContainerShadowCompatible:", v11);
    -[SearchUIDetailedView setDetailsView:](v6, "setDetailsView:", v11);
    -[SearchUIDetailedView buttonAndDetailViewStackView](v6, "buttonAndDetailViewStackView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addArrangedSubview:", v11);

    v13 = (void *)objc_opt_new();
    -[SearchUIDetailedView setLeadingViewControllers:](v6, "setLeadingViewControllers:", v13);

    v14 = (void *)objc_opt_new();
    -[SearchUIDetailedView setAccessoryViewControllers:](v6, "setAccessoryViewControllers:", v14);

    -[SearchUIDetailedView setIsVerticalAlignment:](v6, "setIsVerticalAlignment:", 0);
  }

  return v6;
}

- (void)setIsVerticalAlignment:(BOOL)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a3;
  self->_isVerticalAlignment = a3;
  -[SearchUIDetailedView innerContainer](self, "innerContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)v3)
  {
    objc_msgSend(v5, "setAxis:", 1);

    -[NUIContainerStackView setAxis:](self, "setAxis:", 1);
    -[NUIContainerStackView setAlignment:](self, "setAlignment:", 1);
    -[NUIContainerStackView setBaselineRelativeArrangement:](self, "setBaselineRelativeArrangement:", 1);
    -[SearchUIDetailedView detailsView](self, "detailsView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewForFirstBaselineLayout");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    v8 = objc_opt_respondsToSelector();
    if ((v8 & 1) != 0)
    {
      v9 = (void *)MEMORY[0x1E0DBD9B0];
      objc_msgSend(v15, "font");
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "scaledValueForValue:withFont:view:", v3, self, 22.0);
      v11 = v10;
    }
    else
    {
      v11 = *MEMORY[0x1E0DBDA78];
    }
    -[SearchUIDetailedView innerContainer](self, "innerContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSpacing:", v11);

    if ((v8 & 1) != 0)
    -[SearchUIDetailedView innerContainer](self, "innerContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBaselineRelativeArrangement:", 1);

  }
  else
  {
    objc_msgSend(v5, "setFlipsToVerticalAxisForAccessibilityContentSizes:", 1);

    -[SearchUIDetailedView innerContainer](self, "innerContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBaselineRelativeArrangement:", 0);

    -[NUIContainerStackView setAxis:](self, "setAxis:", 0);
    -[NUIContainerStackView setAlignment:](self, "setAlignment:", 3);
    -[NUIContainerStackView setBaselineRelativeArrangement:](self, "setBaselineRelativeArrangement:", 0);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUIDetailedView;
  -[SearchUIDetailedView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[SearchUIDetailedView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[SearchUIDetailedView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[SearchUIDetailedView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_vibrancy");
  v8 = objc_msgSend(v4, "_vibrancy");

  if (v7 != v8)
    goto LABEL_4;
LABEL_5:

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUIDetailedView;
  -[SearchUIDetailedView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[SearchUIDetailedView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchUIDetailedView;
  v4 = a3;
  -[SearchUIDetailedView tlk_updateForAppearance:](&v7, sel_tlk_updateForAppearance_, v4);
  -[SearchUIDetailedView currentAccessoryViewController](self, "currentAccessoryViewController", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tlk_updateForAppearance:", v4);

  -[SearchUIDetailedView currentLeadingViewController](self, "currentLeadingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tlk_updateForAppearance:", v4);

}

- (void)setFeedbackDelegate:(id)a3
{
  SearchUIFeedbackDelegate **p_feedbackDelegate;
  id v5;
  void *v6;
  id v7;

  p_feedbackDelegate = &self->_feedbackDelegate;
  v5 = a3;
  objc_storeWeak((id *)p_feedbackDelegate, v5);
  -[SearchUIDetailedView currentLeadingViewController](self, "currentLeadingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFeedbackDelegate:", v5);

  -[SearchUIDetailedView currentAccessoryViewController](self, "currentAccessoryViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFeedbackDelegate:", v5);

}

- (void)updateWithRowModel:(id)a3
{
  id v3;
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
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
  uint64_t v40;
  objc_class *v41;
  id v42;
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
  int v53;
  _BOOL4 v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t j;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  void *v74;
  BOOL v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  SearchUIDetailedView *v79;
  void *v80;
  uint64_t *v81;
  _BOOL4 v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  SearchUIDetailedView *v87;
  void *v88;
  SearchUIDetailedView **v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  int v95;
  unint64_t v96;
  void *v97;
  int v98;
  int v99;
  double v100;
  int v101;
  double v102;
  int v103;
  double v104;
  void *v105;
  double v106;
  int v107;
  void *v108;
  uint64_t v109;
  double v110;
  void *v111;
  void *v112;
  id v113;
  double v114;
  void *v115;
  void *v116;
  id v117;
  double v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  int v124;
  id v125;
  void *v126;
  void *v127;
  void *v128;
  double v129;
  double v130;
  double v131;
  id v132;
  void *v133;
  double v134;
  double v135;
  double v136;
  double v137;
  void *v138;
  unint64_t v139;
  void *v140;
  double v141;
  void *v142;
  int v143;
  double *v144;
  double v145;
  double v146;
  void *v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  void *v154;
  void *v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  double v169;
  void *v170;
  void *v171;
  void *v172;
  _BOOL8 v173;
  void *v174;
  void *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t k;
  uint64_t v181;
  void *v182;
  uint64_t v183;
  id v184;
  id v185;
  char v186;
  void *v187;
  char v188;
  double v189;
  void *v190;
  void *v191;
  void *v192;
  int v193;
  void *v194;
  id v195;
  int v196;
  SearchUIDetailedView *v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  _QWORD v202[4];
  id v203;
  SearchUIDetailedView *v204;
  id v205;
  id v206;
  char v207;
  char v208;
  char v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  _BYTE v218[128];
  _QWORD v219[2];
  SearchUIDetailedView *v220;
  uint64_t v221;
  SearchUIDetailedView *v222;
  uint64_t v223;
  _BYTE v224[128];
  _QWORD v225[2];
  _QWORD v226[2];
  _BYTE v227[128];
  uint64_t v228;

  v228 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[SearchUIDetailedView setRowModel:](self, "setRowModel:", v5);
  -[SearchUIDetailedView currentLeadingViewController](self, "currentLeadingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hide");

  -[SearchUIDetailedView currentAccessoryViewController](self, "currentAccessoryViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hide");

  v8 = +[SearchUILeadingViewController leadingViewClassForRowModel:](SearchUILeadingViewController, "leadingViewClassForRowModel:", v5);
  if (!v8)
  {
    v13 = 0;
    goto LABEL_17;
  }
  v9 = v8;
  v216 = 0u;
  v217 = 0u;
  v214 = 0u;
  v215 = 0u;
  -[SearchUIDetailedView leadingViewControllers](self, "leadingViewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v214, v227, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v215;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v215 != v14)
          objc_enumerationMutation(v10);
        v3 = *(id *)(*((_QWORD *)&v214 + 1) + 8 * i);
        if ((objc_class *)objc_opt_class() == v9)
        {
          v3 = v3;

          v13 = v3;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v214, v227, 16);
    }
    while (v12);

    if (v13)
      goto LABEL_16;
  }
  else
  {

  }
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIAutoLayout requireIntrinsicSizeForView:](SearchUIAutoLayout, "requireIntrinsicSizeForView:", v16);

  -[SearchUIDetailedView innerContainer](self, "innerContainer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "insertArrangedSubview:atIndex:", v18, 0);

  -[SearchUIDetailedView leadingViewControllers](self, "leadingViewControllers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v13);

LABEL_16:
  objc_msgSend(v13, "updateWithRowModel:", v5);
  objc_msgSend(v13, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setHidden:", 0);

  objc_msgSend(v13, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAlpha:", 1.0);

  -[SearchUIDetailedView feedbackDelegate](self, "feedbackDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFeedbackDelegate:", v22);

LABEL_17:
  -[SearchUIDetailedView setCurrentLeadingViewController:](self, "setCurrentLeadingViewController:", v13);
  -[SearchUIDetailedView detailsView](self, "detailsView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v193 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");
  v197 = self;
  if ((objc_msgSend(v5, "isLocalApplicationResult") & 1) != 0
    || (objc_msgSend(v5, "identifyingResult"),
        v25 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v25, "contentType"),
        v26 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = (id)objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.application-bundle")),
        v26,
        v25,
        (_DWORD)v3))
  {
    objc_msgSend(v5, "applicationBundleIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = +[SearchUIUtilities bundleIdentifierIsBlockedForScreenTimeExpiration:](SearchUIUtilities, "bundleIdentifierIsBlockedForScreenTimeExpiration:", v27);

    if (v28)
    {
      v194 = v23;
      v29 = v24;
      v30 = (void *)objc_opt_new();
      +[SearchUIUtilities imageForBlockedApp](SearchUIUtilities, "imageForBlockedApp");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setGlyph:", v31);

      objc_msgSend(v5, "title");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "text");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v193)
      {
        objc_msgSend(v33, "stringByAppendingString:", CFSTR("  "));
        v3 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D8C3D0], "textWithString:", v3);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v226[0] = v35;
        v226[1] = v30;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v226, 2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "view");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setAlpha:", 0.25);
      }
      else
      {
        objc_msgSend(CFSTR("  "), "stringByAppendingString:", v33);
        v3 = (id)objc_claimAutoreleasedReturnValue();

        v225[0] = v30;
        objc_msgSend(MEMORY[0x1E0D8C3D0], "textWithString:", v3);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v225[1] = v37;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v225, 2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v38 = (void *)objc_opt_new();
      objc_msgSend(v38, "setFormattedTextPieces:", v36);
      objc_msgSend(v38, "setMaxLines:", 1);
      v24 = v38;

      v23 = v194;
    }
  }
  -[SearchUIDetailedView rowModel](self, "rowModel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "sectionType");

  if (v40 == 2)
    objc_msgSend(v24, "setMaxLines:", 1);
  v195 = v24;
  v41 = +[SearchUIAccessoryViewController accessoryViewClassForRowModel:](SearchUIAccessoryViewController, "accessoryViewClassForRowModel:", v5);
  v188 = -[objc_class isEqual:](v41, "isEqual:", objc_opt_class());
  v186 = -[objc_class isEqual:](v41, "isEqual:", objc_opt_class());
  if ((objc_msgSend(v5, "buttonItemsAreTrailing") & 1) != 0)
  {
    v42 = 0;
  }
  else
  {
    objc_msgSend(v5, "buttonItems");
    v42 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v42, "count"))
  {
    -[SearchUIDetailedView buttonItemStackView](self, "buttonItemStackView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v43)
    {
      v44 = (void *)objc_opt_new();
      -[SearchUIDetailedView setButtonItemStackView:](self, "setButtonItemStackView:", v44);

      -[SearchUIDetailedView buttonItemStackView](self, "buttonItemStackView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setIsCompact:", 1);

      -[SearchUIDetailedView buttonItemStackView](self, "buttonItemStackView");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setFlipsToVerticalAxisForAccessibilityContentSizes:", 1);

      -[SearchUIDetailedView buttonAndDetailViewStackView](self, "buttonAndDetailViewStackView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIDetailedView buttonItemStackView](self, "buttonItemStackView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addArrangedSubview:", v48);

      -[SearchUIDetailedView buttonAndDetailViewStackView](self, "buttonAndDetailViewStackView");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIDetailedView buttonItemStackView](self, "buttonItemStackView");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setAlignment:forView:inAxis:", 1, v50, 0);

    }
    v41 = 0;
  }
  -[SearchUIDetailedView buttonItemStackView](self, "buttonItemStackView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIDetailedView feedbackDelegate](self, "feedbackDelegate");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v191 = v42;
  objc_msgSend(v51, "updateWithButtonItems:maxButtonItems:buttonItemViewType:rowModel:feedbackDelegate:", v42, 3, 3, v5, v52);

  v53 = TLKSnippetModernizationEnabled();
  v192 = v13;
  if (v53)
  {
    -[SearchUIDetailedView buttonItemStackView](self, "buttonItemStackView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v54 = v3 != 0;
    if (!v3
      || (-[SearchUIDetailedView buttonItemStackView](self, "buttonItemStackView"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v13, "isHidden")))
    {
      v55 = 3;
    }
    else
    {
      v54 = 1;
      v55 = 1;
    }
  }
  else
  {
    v54 = 0;
    v55 = 1;
  }
  -[SearchUIDetailedView innerContainer](self, "innerContainer");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setAlignment:", v55);

  if (v54)
  {

    if (!v53)
    {
LABEL_42:
      if (v41)
        goto LABEL_43;
LABEL_56:
      v60 = 0;
      goto LABEL_79;
    }
  }
  else if (!v53)
  {
    goto LABEL_42;
  }

  if (!v41)
    goto LABEL_56;
LABEL_43:
  v212 = 0u;
  v213 = 0u;
  v210 = 0u;
  v211 = 0u;
  -[SearchUIDetailedView accessoryViewControllers](self, "accessoryViewControllers");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v210, v224, 16);
  if (!v58)
  {

LABEL_58:
    v60 = (void *)objc_opt_new();
    -[SearchUIDetailedView accessoryViewControllers](self, "accessoryViewControllers");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "addObject:", v60);

    objc_msgSend(v60, "view");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIAutoLayout requireIntrinsicSizeForView:](SearchUIAutoLayout, "requireIntrinsicSizeForView:", v66);

    goto LABEL_59;
  }
  v59 = v58;
  v60 = 0;
  v61 = *(_QWORD *)v211;
  do
  {
    for (j = 0; j != v59; ++j)
    {
      if (*(_QWORD *)v211 != v61)
        objc_enumerationMutation(v57);
      v63 = *(void **)(*((_QWORD *)&v210 + 1) + 8 * j);
      if ((objc_class *)objc_opt_class() == v41)
      {
        v64 = v63;

        v60 = v64;
      }
    }
    v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v210, v224, 16);
  }
  while (v59);

  if (!v60)
    goto LABEL_58;
LABEL_59:
  objc_msgSend(v60, "setDelegate:", self);
  -[SearchUIDetailedView feedbackDelegate](self, "feedbackDelegate");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setFeedbackDelegate:", v67);

  objc_msgSend(v60, "view");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setHidden:", 0);

  objc_msgSend(v60, "updateWithRowModel:", v5);
  -[SearchUIDetailedView rowModel](self, "rowModel");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "secondaryTitle");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (v70)
  {
    -[SearchUIDetailedView rowModel](self, "rowModel");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "secondaryTitleIsDetached");

  }
  else
  {
    v72 = 0;
  }

  objc_msgSend(v60, "view");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIDetailedView innerContainer](self, "innerContainer");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v74, "axis") != 1)
  {

    goto LABEL_67;
  }
  v75 = -[SearchUIDetailedView isVerticalAlignment](self, "isVerticalAlignment");

  if (v75)
  {
LABEL_67:
    v82 = -[SearchUIDetailedView isVerticalAlignment](self, "isVerticalAlignment");
    v77 = objc_opt_class();
    -[SearchUIDetailedView innerContainer](self, "innerContainer");
    v83 = objc_claimAutoreleasedReturnValue();
    v79 = (SearchUIDetailedView *)v83;
    if (v82)
    {
      v221 = v83;
      v80 = (void *)MEMORY[0x1E0C99D20];
      v81 = &v221;
      goto LABEL_69;
    }
    v220 = self;
    v88 = (void *)MEMORY[0x1E0C99D20];
    v89 = &v220;
LABEL_72:
    objc_msgSend(v88, "arrayWithObjects:count:", v89, 1);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = (void *)v77;
    v86 = v73;
    v87 = v79;
    goto LABEL_73;
  }
  v76 = objc_msgSend(v60, "shouldTopAlignForAccessibilityContentSizes");
  v77 = objc_opt_class();
  -[SearchUIDetailedView innerContainer](self, "innerContainer");
  v78 = objc_claimAutoreleasedReturnValue();
  v79 = (SearchUIDetailedView *)v78;
  if (!v76)
  {
    v222 = self;
    v88 = (void *)MEMORY[0x1E0C99D20];
    v89 = &v222;
    goto LABEL_72;
  }
  v223 = v78;
  v80 = (void *)MEMORY[0x1E0C99D20];
  v81 = &v223;
LABEL_69:
  objc_msgSend(v80, "arrayWithObjects:count:", v81, 1);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = (void *)v77;
  v86 = v73;
  v87 = self;
LABEL_73:
  objc_msgSend(v85, "addViewIfNecessary:toStackView:removeFromStackViews:", v86, v87, v84);

  if (v72)
    v90 = v73;
  else
    v90 = 0;
  objc_msgSend(v23, "setAccessoryView:", v90);
  if (v72)
  {
    v91 = (void *)objc_opt_class();
    v219[0] = self;
    -[SearchUIDetailedView innerContainer](self, "innerContainer");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v219[1] = v92;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v219, 2);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addViewIfNecessary:toStackView:removeFromStackViews:", v73, 0, v93);

  }
LABEL_79:
  -[SearchUIDetailedView setCurrentAccessoryViewController:](self, "setCurrentAccessoryViewController:", v60);
  -[SearchUIDetailedView currentLeadingViewController](self, "currentLeadingViewController");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v94, "shouldCenterAlignToTitle");

  v96 = 0x1E0DBD000;
  v97 = v195;
  if (-[SearchUIDetailedView isVerticalAlignment](self, "isVerticalAlignment"))
    goto LABEL_113;
  v98 = objc_msgSend(v5, "isHorizontalInLayout");
  if (v98)
    v99 = 8;
  else
    v99 = 14;
  if ((v98 & 1) == 0 && ((v193 ^ 1) & 1) == 0)
  {
    if (TLKSnippetModernizationEnabled())
      v99 = 12;
    else
      v99 = 10;
  }
  v100 = 8.0;
  v101 = TLKBiggerSuggestionsLayoutEnabled();
  if ((v95 & 1) == 0)
  {
    if (v101)
      v102 = 14.0;
    else
      v102 = 10.0;
    v103 = objc_msgSend(v5, "useCompactVersionOfUI");
    v104 = 8.0;
    if (!v193)
      v104 = v102;
    if (v103)
      v100 = v104;
    else
      v100 = (double)v99;
  }
  self = v197;
  -[SearchUIDetailedView innerContainer](v197, "innerContainer");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "setSpacing:", v100);

  if ((objc_msgSend(v5, "useCompactVersionOfUI") & 1) != 0 || !TLKSnippetModernizationEnabled())
  {
    v106 = *MEMORY[0x1E0CFAA78];
  }
  else if (v193)
  {
    v106 = 12.0;
  }
  else
  {
    v106 = 14.0;
  }
  v107 = v95;
  -[SearchUIDetailedView innerContainer](v197, "innerContainer");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = objc_msgSend(v108, "axis");

  v110 = 8.0;
  if (v109 != 1)
    goto LABEL_112;
  objc_msgSend(v23, "viewForFirstBaselineLayout");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = 8.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v23, "viewForFirstBaselineLayout");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "font");
    v113 = (id)objc_claimAutoreleasedReturnValue();

    if (!v113)
    {
      v97 = v195;
      v96 = 0x1E0DBD000;
      goto LABEL_108;
    }
    v96 = 0x1E0DBD000uLL;
    objc_msgSend(MEMORY[0x1E0DBD9B0], "scaledValueForValue:withFont:view:", v113, v197, 8.0);
    v106 = v114;
    v111 = v113;
    v97 = v195;
  }

LABEL_108:
  objc_msgSend(v23, "viewForLastBaselineLayout");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_111:

    goto LABEL_112;
  }
  objc_msgSend(v23, "viewForLastBaselineLayout");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "font");
  v117 = (id)objc_claimAutoreleasedReturnValue();

  if (v117)
  {
    objc_msgSend(*(id *)(v96 + 2480), "scaledValueForValue:withFont:view:", v117, v197, 8.0);
    v110 = v118;
    v115 = v117;
    goto LABEL_111;
  }
LABEL_112:
  -[SearchUIDetailedView innerContainer](v197, "innerContainer");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIDetailedView currentLeadingViewController](v197, "currentLeadingViewController");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "view");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "setCustomSpacing:afterView:", v121, v106);

  -[SearchUIDetailedView innerContainer](v197, "innerContainer");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIDetailedView buttonAndDetailViewStackView](v197, "buttonAndDetailViewStackView");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "setCustomSpacing:afterView:", v123, v110);

  v95 = v107;
LABEL_113:
  v124 = objc_msgSend(*(id *)(v96 + 2480), "isSuperLargeAccessibilitySize");
  v202[0] = MEMORY[0x1E0C809B0];
  v202[1] = 3221225472;
  v202[2] = __43__SearchUIDetailedView_updateWithRowModel___block_invoke;
  v202[3] = &unk_1EA1F8BB0;
  v125 = v23;
  v203 = v125;
  v204 = self;
  v185 = v5;
  v205 = v185;
  v184 = v97;
  v206 = v184;
  v196 = v124;
  v207 = v124;
  v208 = v188;
  v209 = v186;
  objc_msgSend(v125, "performBatchUpdates:", v202);
  -[SearchUIDetailedView detailsView](self, "detailsView");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "viewForFirstBaselineLayout");
  v127 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIDetailedView rowModel](self, "rowModel");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v124) = objc_msgSend(v128, "useCompactVersionOfUI");

  v129 = 0.0;
  v130 = 0.0;
  v131 = 0.0;
  if ((v124 & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v127, "font");
      v132 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v132 = 0;
    }
    v133 = *(void **)(v96 + 2480);
    objc_msgSend(v132, "ascender");
    v135 = v134;
    objc_msgSend(v132, "capHeight");
    objc_msgSend(v133, "deviceScaledRoundedValue:forView:", self, v135 - v136);
    v130 = v137;
    v138 = *(void **)(v96 + 2480);
    objc_msgSend(v125, "viewForLastBaselineLayout");
    v139 = v96;
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "effectiveBaselineOffsetFromContentBottom");
    objc_msgSend(v138, "deviceScaledRoundedValue:forView:", self);
    v131 = v141;

    v96 = v139;
  }
  -[SearchUIDetailedView rowModel](self, "rowModel");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = objc_msgSend(v142, "isHorizontalInLayout");

  v144 = (double *)MEMORY[0x1E0DC49E8];
  v145 = v130;
  v146 = 0.0;
  if (v143)
  {
    v145 = *MEMORY[0x1E0DC49E8];
    v129 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v131 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v146 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  objc_msgSend(v125, "setCustomAlignmentRectInsets:", v145, v129, v131, v146);
  v189 = v129;
  if (TLKBiggerSuggestionsLayoutEnabled())
  {
    -[SearchUIDetailedView rowModel](self, "rowModel");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v147, "useCompactVersionOfUI") & 1) != 0)
    {
      v148 = -3.0;
      v149 = -4.0;
      v150 = 0.0;
      v151 = 0.0;
    }
    else
    {
      v148 = *v144;
      v151 = v144[1];
      v149 = v144[2];
      v150 = v144[3];
    }

  }
  else
  {
    v148 = *v144;
    v151 = v144[1];
    v149 = v144[2];
    v150 = v144[3];
  }
  if (((v143 | v95 ^ 1) & 1) == 0)
  {
    objc_msgSend(v127, "intrinsicContentSize");
    v153 = v152;
    -[SearchUIDetailedView currentLeadingViewController](self, "currentLeadingViewController");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "view");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "intrinsicContentSize");
    v148 = v130 + (v153 - v156) * -0.5;

    v150 = 0.0;
    v149 = 0.0;
    v151 = 0.0;
  }
  objc_msgSend(*(id *)(v96 + 2480), "deviceScaledRoundedInsets:forView:", self, v148, v151, v149, v150);
  v158 = v157;
  v160 = v159;
  v162 = v161;
  v164 = v163;
  -[SearchUIDetailedView currentLeadingViewController](self, "currentLeadingViewController");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "view");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "setCustomAlignmentRectInsets:", v158, v160, v162, v164);

  objc_msgSend(v125, "accessoryView");
  v167 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v167)
  {
    -[SearchUIDetailedView currentAccessoryViewController](self, "currentAccessoryViewController");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v168, "type") == 1)
    {
      v169 = v189;
    }
    else
    {
      v145 = *v144;
      v169 = v144[1];
      v131 = v144[2];
      v146 = v144[3];
    }
    -[SearchUIDetailedView currentAccessoryViewController](self, "currentAccessoryViewController");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "view");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v171, "setCustomAlignmentRectInsets:", v145, v169, v131, v146);

  }
  v187 = v127;
  v190 = v125;
  -[SearchUIDetailedView innerContainer](self, "innerContainer");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v173 = objc_msgSend(v172, "axis") == 0;

  v200 = 0u;
  v201 = 0u;
  v198 = 0u;
  v199 = 0u;
  -[SearchUIDetailedView innerContainer](self, "innerContainer");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "arrangedSubviews");
  v175 = (void *)objc_claimAutoreleasedReturnValue();

  v176 = objc_msgSend(v175, "countByEnumeratingWithState:objects:count:", &v198, v218, 16);
  if (v176)
  {
    v177 = v176;
    v178 = *(_QWORD *)v199;
    if (v95)
      v179 = 2;
    else
      v179 = -1;
    do
    {
      for (k = 0; k != v177; ++k)
      {
        if (*(_QWORD *)v199 != v178)
          objc_enumerationMutation(v175);
        v181 = *(_QWORD *)(*((_QWORD *)&v198 + 1) + 8 * k);
        -[SearchUIDetailedView innerContainer](v197, "innerContainer");
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[SearchUIDetailedView arrangedViewMustCenter:](v197, "arrangedViewMustCenter:", v181) | v196)
          v183 = v179;
        else
          v183 = 3;
        objc_msgSend(v182, "setAlignment:forView:inAxis:", v183, v181, v173);

      }
      v177 = objc_msgSend(v175, "countByEnumeratingWithState:objects:count:", &v198, v218, 16);
    }
    while (v177);
  }

  -[SearchUIDetailedView updateLayoutMargins](v197, "updateLayoutMargins");
  -[SearchUIDetailedView tlk_updateWithCurrentAppearance](v197, "tlk_updateWithCurrentAppearance");

}

void __43__SearchUIDetailedView_updateWithRowModel___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL8 v28;
  void *v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  _QWORD v64[3];

  v64[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "bannerBadgeForRowModel:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBannerBadge:", v2);

  objc_msgSend(*(id *)(a1 + 48), "topText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTopText:", v4);

  +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTitle:", v5);

  v6 = *(_BYTE *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMaxLines:", objc_msgSend(v7, "maxLines") << v6);

  objc_msgSend(*(id *)(a1 + 32), "setTruncateTitleMiddle:", objc_msgSend(*(id *)(a1 + 48), "truncateTitleMiddle"));
  objc_msgSend(*(id *)(a1 + 48), "secondaryTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKMultilineTextConverter formattedTextForSearchUIText:](SearchUITLKMultilineTextConverter, "formattedTextForSearchUIText:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_new();
  v48 = (void *)v9;
  v64[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFormattedTextItems:", v11);

  v47 = v10;
  objc_msgSend(*(id *)(a1 + 32), "setSecondaryTitle:", v10);
  objc_msgSend(*(id *)(a1 + 48), "secondaryTitleImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIImage imageWithSFImage:variantForAppIcon:](SearchUIImage, "imageWithSFImage:variantForAppIcon:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKImageConverter imageForSFImage:](SearchUITLKImageConverter, "imageForSFImage:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSecondaryTitleImage:", v14);

  objc_msgSend(*(id *)(a1 + 32), "secondaryTitleImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setIsTemplate:", 1);

  objc_msgSend(*(id *)(a1 + 32), "setSecondaryTitleIsDetached:", objc_msgSend(*(id *)(a1 + 48), "secondaryTitleIsDetached"));
  v16 = (void *)objc_opt_new();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  objc_msgSend(*(id *)(a1 + 48), "details");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v58 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
        +[SearchUITLKMultilineTextConverter richTextForSearchUIText:withCompletionHandler:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:withCompletionHandler:", v22, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23
          && ((objc_msgSend(v23, "hasContent") & 1) != 0
           || +[SearchUITLKMultilineTextConverter richTextOverridesAsyncLoader:](SearchUITLKMultilineTextConverter, "richTextOverridesAsyncLoader:", v22)))
        {
          objc_msgSend(v24, "setMaxLines:", objc_msgSend(v24, "maxLines") << v6);
          objc_msgSend(v16, "addObject:", v24);
        }

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
    }
    while (v19);
  }

  objc_msgSend(*(id *)(a1 + 32), "setDetails:", v16);
  objc_msgSend(*(id *)(a1 + 48), "footnote");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setFootnote:", v26);

  objc_msgSend(*(id *)(a1 + 48), "footnoteButtonText");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setFootnoteButtonText:", v27);

  objc_msgSend(*(id *)(a1 + 32), "setUseCompactMode:", objc_msgSend(*(id *)(a1 + 48), "useCompactVersionOfUI"));
  if (*(_BYTE *)(a1 + 65))
    v28 = 1;
  else
    v28 = *(_BYTE *)(a1 + 66) != 0;
  objc_msgSend(*(id *)(a1 + 32), "setIsAccessoryViewBottomAligned:", v28);
  if (objc_msgSend(*(id *)(a1 + 48), "buttonItemsAreTrailing"))
  {
    objc_msgSend(*(id *)(a1 + 48), "buttonItems");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v30 = v29;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
  v32 = v30;
  if (v31)
  {
    v33 = v31;
    v34 = *(_QWORD *)v54;
LABEL_20:
    v35 = 0;
    while (1)
    {
      if (*(_QWORD *)v54 != v34)
        objc_enumerationMutation(v30);
      if ((objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * v35), "_searchUIButtonItemGeneratorClass"), "mayRequireAsyncGenerationForButtonItem:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v35)) & 1) != 0)break;
      if (v33 == ++v35)
      {
        v33 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
        if (v33)
          goto LABEL_20;
        v32 = v30;
        goto LABEL_43;
      }
    }

    if (*(_BYTE *)(a1 + 64) || !objc_msgSend(*(id *)(a1 + 40), "hasSecondLine"))
      goto LABEL_44;
    v36 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "title");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_msgSend(*(id *)(a1 + 32), "title");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addObject:", v38);

    }
    objc_msgSend(*(id *)(a1 + 32), "details");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      objc_msgSend(*(id *)(a1 + 32), "details");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addObjectsFromArray:", v40);

    }
    objc_msgSend(*(id *)(a1 + 32), "footnote");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      objc_msgSend(*(id *)(a1 + 32), "footnote");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addObject:", v42);

    }
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v32 = v36;
    v43 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v50 != v45)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "setMaxLines:", 1);
        }
        v44 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
      }
      while (v44);
    }

  }
LABEL_43:

LABEL_44:
}

- (BOOL)hasSecondLine
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  char v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SearchUIDetailedView detailsView](self, "detailsView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "details");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "hasContent") & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  -[SearchUIDetailedView detailsView](self, "detailsView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "footnote");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasContent");

  return v9 | v12;
}

- (void)updateLayoutMargins
{
  void *v3;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  _BOOL4 v20;
  int v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  int v29;
  double v30;
  int v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;

  -[SearchUIDetailedView rowModel](self, "rowModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "useCompactVersionOfUI");

  if (v4)
  {
    if (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"))
    {
      v5 = 14.0;
      v6 = 5.0;
      if (TLKSnippetModernizationEnabled())
      {
        +[SearchUIUtilities standardTableCellContentInset](SearchUIUtilities, "standardTableCellContentInset");
        v5 = v7;
        v8 = 5.0;
        v9 = v7;
      }
      else
      {
        v8 = 5.0;
        v9 = 14.0;
      }
    }
    else
    {
      v20 = -[SearchUIDetailedView hasSecondLine](self, "hasSecondLine");
      v21 = TLKBiggerSuggestionsLayoutEnabled();
      v22 = 11.8;
      if (v20)
        v22 = 8.3;
      v23 = 8.67;
      if (v20)
        v23 = 6.84;
      if (v21)
        v24 = v22;
      else
        v24 = v23;
      -[SearchUIDetailedView currentAccessoryViewController](self, "currentAccessoryViewController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIDetailedView trailingMarginForAccessoryViewController:](self, "trailingMarginForAccessoryViewController:", v25);
      v9 = v26;

      v5 = v9;
      if (objc_msgSend(MEMORY[0x1E0DBD9B0], "isLTR"))
      {
        +[SearchUIUtilities standardCompactHorizontalMargin](SearchUIUtilities, "standardCompactHorizontalMargin");
        v5 = v27;
      }
      if ((objc_msgSend(MEMORY[0x1E0DBD9B0], "isLTR") & 1) == 0)
      {
        +[SearchUIUtilities standardCompactHorizontalMargin](SearchUIUtilities, "standardCompactHorizontalMargin");
        v9 = v28;
      }
      v29 = TLKBiggerSuggestionsLayoutEnabled();
      v30 = 0.3;
      if (!v29)
        v30 = 0.0;
      v6 = v24 - v30;
      v31 = TLKBiggerSuggestionsLayoutEnabled();
      v32 = 0.5;
      if (v31)
        v32 = 0.0;
      v8 = v24 - v32;
    }
    objc_msgSend(MEMORY[0x1E0DBD9B0], "deviceScaledRoundedInsets:forView:", self, v6, v5, v8, v9);
    v11 = v33;
    v13 = v34;
    v15 = v35;
    v17 = v36;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBDA50], "defaultLayoutMargins");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[SearchUIDetailedView rowModel](self, "rowModel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "sectionType");

    if (v19 == 2)
    {
      v13 = 0.0;
      v11 = 10.0;
      v15 = 10.0;
      v17 = 0.0;
    }
    else if (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS")
           && TLKSnippetModernizationEnabled())
    {
      v11 = 12.0;
      v15 = 12.0;
    }
  }
  -[SearchUIDetailedView setLayoutMargins:](self, "setLayoutMargins:", v11, v13, v15, v17);
}

- (double)trailingMarginForAccessoryViewController:(id)a3
{
  id v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  char v11;
  double v12;
  double v13;
  double v14;

  v4 = a3;
  v5 = 0.0;
  if (objc_msgSend(v4, "containsSymbolImage"))
  {
    objc_msgSend(v4, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "intrinsicContentSize");
    v8 = v7;

    +[SearchUIUtilities imageAccessoryAdditionalCompactHorizontalMargin](SearchUIUtilities, "imageAccessoryAdditionalCompactHorizontalMargin");
    v5 = v9 + v8 * -0.5;
  }
  -[SearchUIDetailedView rowModel](self, "rowModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "useCompactVersionOfUI"))
  {

    goto LABEL_7;
  }
  v11 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");

  if ((v11 & 1) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0DBDA50], "defaultLayoutMargins");
    v13 = v14;
    goto LABEL_8;
  }
  +[SearchUIUtilities standardCompactHorizontalMargin](SearchUIUtilities, "standardCompactHorizontalMargin");
  v13 = v5 + v12;
LABEL_8:

  return v13;
}

+ (id)bannerBadgeForRowModel:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  SearchUISymbolImage *v7;
  void *v8;
  SearchUISymbolImage *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "nearbyBusinessesString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v7 = [SearchUISymbolImage alloc];
    objc_msgSend(MEMORY[0x1E0DBD940], "cachedFontForTextStyle:isShort:isBold:", *MEMORY[0x1E0DC4AA0], TLKSnippetModernizationEnabled() ^ 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SearchUISymbolImage initWithSymbolName:font:scale:](v7, "initWithSymbolName:font:scale:", CFSTR("location.fill"), v8, 1);
    objc_msgSend(v6, "setGlyph:", v9);

    v10 = (void *)objc_opt_new();
    v20[0] = v6;
    v11 = (void *)MEMORY[0x1E0D8C3D0];
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "nearbyBusinessesString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedUppercaseString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR(" %@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textWithString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFormattedTextPieces:", v17);

    +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)arrangedViewMustCenter:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[SearchUIDetailedView currentLeadingViewController](self, "currentLeadingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[SearchUIDetailedView currentLeadingViewController](self, "currentLeadingViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    v12 = v11;
    v10 = objc_msgSend(v11, "shouldVerticallyCenter");
LABEL_15:

    goto LABEL_16;
  }
  -[SearchUIDetailedView buttonAndDetailViewStackView](self, "buttonAndDetailViewStackView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
    -[SearchUIDetailedView detailsView](self, "detailsView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "secondaryTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[SearchUIDetailedView detailsView](self, "detailsView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "secondaryTitleIsDetached"))
        v10 = TLKSnippetModernizationEnabled();
      else
        v10 = 1;

    }
    else
    {
      v10 = 1;
    }

    goto LABEL_15;
  }
  -[SearchUIDetailedView currentAccessoryViewController](self, "currentAccessoryViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v4)
  {
    -[SearchUIDetailedView currentAccessoryViewController](self, "currentAccessoryViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v10 = 1;
LABEL_16:

  return v10;
}

+ (void)addViewIfNecessary:(id)a3 toStackView:(id)a4 removeFromStackViews:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  char v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v14, "arrangedSubviews");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "containsObject:", v7);

        if (v16)
          objc_msgSend(v14, "removeArrangedSubview:", v7);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }
  objc_msgSend(v8, "arrangedSubviews");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsObject:", v7);

  if ((v18 & 1) == 0)
    objc_msgSend(v8, "addArrangedSubview:", v7);

}

- (void)footnoteButtonPressed
{
  id v2;

  -[SearchUIDetailedView buttonDelegate](self, "buttonDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "footnoteButtonPressed");

}

- (BOOL)configureMenuForFootnoteButton:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;

  v4 = a3;
  -[SearchUIDetailedView buttonDelegate](self, "buttonDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SearchUIDetailedView buttonDelegate](self, "buttonDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "configureMenuForFootnoteButton:", v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  double y;
  CGFloat x;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a4;
  -[SearchUIDetailedView detailsView](self, "detailsView");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v10)
  {
    objc_msgSend(MEMORY[0x1E0DBD9B0], "deviceScaledRoundedValue:forView:", self, 0.5);
    y = y + v12;
  }
  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  id v6;
  id v7;
  _BOOL8 v8;
  id v9;

  v6 = a3;
  -[SearchUIDetailedView innerContainer](self, "innerContainer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    v8 = -[SearchUIDetailedView isCompactWidth](self, "isCompactWidth");
    -[SearchUIDetailedView currentLeadingViewController](self, "currentLeadingViewController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUsesCompactWidth:", v8);

  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v14;
  objc_super v15;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SearchUIDetailedView;
  -[SearchUIDetailedView hitTest:withEvent:](&v15, sel_hitTest_withEvent_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isDescendantOfView:", self)
    && (-[SearchUIDetailedView currentLeadingViewController](self, "currentLeadingViewController"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "type"),
        v9,
        v10 == 2))
  {
    -[SearchUIDetailedView currentLeadingViewController](self, "currentLeadingViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SearchUIDetailedView;
    -[SearchUIDetailedView hitTest:withEvent:](&v14, sel_hitTest_withEvent_, v7, x, y);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (UIView)leadingView
{
  void *v2;
  void *v3;
  void *v4;

  -[SearchUIDetailedView innerContainer](self, "innerContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleArrangedSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v4;
}

- (BOOL)isVerticalAlignment
{
  return self->_isVerticalAlignment;
}

- (SearchUIFeedbackDelegate)feedbackDelegate
{
  return (SearchUIFeedbackDelegate *)objc_loadWeakRetained((id *)&self->_feedbackDelegate);
}

- (SearchUIDetailedViewDelegate)buttonDelegate
{
  return (SearchUIDetailedViewDelegate *)objc_loadWeakRetained((id *)&self->_buttonDelegate);
}

- (void)setButtonDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_buttonDelegate, a3);
}

- (SearchUIAccessoryViewController)currentAccessoryViewController
{
  return self->_currentAccessoryViewController;
}

- (void)setCurrentAccessoryViewController:(id)a3
{
  objc_storeStrong((id *)&self->_currentAccessoryViewController, a3);
}

- (SearchUILeadingViewController)currentLeadingViewController
{
  return self->_currentLeadingViewController;
}

- (void)setCurrentLeadingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_currentLeadingViewController, a3);
}

- (BOOL)isCompactWidth
{
  return self->_isCompactWidth;
}

- (void)setIsCompactWidth:(BOOL)a3
{
  self->_isCompactWidth = a3;
}

- (SearchUIDetailedRowModel)rowModel
{
  return self->_rowModel;
}

- (void)setRowModel:(id)a3
{
  objc_storeStrong((id *)&self->_rowModel, a3);
}

- (TLKStackView)innerContainer
{
  return self->_innerContainer;
}

- (void)setInnerContainer:(id)a3
{
  objc_storeStrong((id *)&self->_innerContainer, a3);
}

- (SearchUIButtonItemStackView)buttonItemStackView
{
  return self->_buttonItemStackView;
}

- (void)setButtonItemStackView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonItemStackView, a3);
}

- (TLKStackView)buttonAndDetailViewStackView
{
  return self->_buttonAndDetailViewStackView;
}

- (void)setButtonAndDetailViewStackView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonAndDetailViewStackView, a3);
}

- (NSMutableArray)leadingViewControllers
{
  return self->_leadingViewControllers;
}

- (void)setLeadingViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_leadingViewControllers, a3);
}

- (TLKDetailsView)detailsView
{
  return self->_detailsView;
}

- (void)setDetailsView:(id)a3
{
  objc_storeStrong((id *)&self->_detailsView, a3);
}

- (NSMutableArray)accessoryViewControllers
{
  return self->_accessoryViewControllers;
}

- (void)setAccessoryViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryViewControllers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryViewControllers, 0);
  objc_storeStrong((id *)&self->_detailsView, 0);
  objc_storeStrong((id *)&self->_leadingViewControllers, 0);
  objc_storeStrong((id *)&self->_buttonAndDetailViewStackView, 0);
  objc_storeStrong((id *)&self->_buttonItemStackView, 0);
  objc_storeStrong((id *)&self->_innerContainer, 0);
  objc_storeStrong((id *)&self->_rowModel, 0);
  objc_storeStrong((id *)&self->_currentLeadingViewController, 0);
  objc_storeStrong((id *)&self->_currentAccessoryViewController, 0);
  objc_destroyWeak((id *)&self->_buttonDelegate);
  objc_destroyWeak((id *)&self->_feedbackDelegate);
}

@end
