@implementation RUIOsloStyle

- (RUIOsloStyle)init
{
  RUIOsloStyle *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)RUIOsloStyle;
  v2 = -[RUIStyle init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "_labelColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIStyle setFooterLabelTextColor:](v2, "setFooterLabelTextColor:", v3);

    objc_msgSend(MEMORY[0x24BEBD4B8], "_labelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIStyle setHeaderLabelTextColor:](v2, "setHeaderLabelTextColor:", v4);

    -[RUIStyle setHeaderLabelAlignment:](v2, "setHeaderLabelAlignment:", 1);
    objc_msgSend(MEMORY[0x24BEBD4B8], "_labelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIStyle setSubHeaderLabelTextColor:](v2, "setSubHeaderLabelTextColor:", v5);

    -[RUIStyle setSubHeaderLabelAlignment:](v2, "setSubHeaderLabelAlignment:", 1);
    objc_msgSend(MEMORY[0x24BEBD4B8], "_labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIStyle setDetailHeaderLabelTextColor:](v2, "setDetailHeaderLabelTextColor:", v6);

    -[RUIStyle setFooterLabelAlignment:](v2, "setFooterLabelAlignment:", 1);
    -[RUIOsloStyle _backgroundColor](v2, "_backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIStyle setBackgroundColor:](v2, "setBackgroundColor:", v7);

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 15.0, *MEMORY[0x24BEBB608]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIStyle setFooterFont:](v2, "setFooterFont:", v8);

    -[RUIStyle setHeaderImagePadding:](v2, "setHeaderImagePadding:", 16.0);
    -[RUIStyle setUseNonOBStyleButton:](v2, "setUseNonOBStyleButton:", 1);
    objc_msgSend(MEMORY[0x24BEBD4B8], "_secondaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIStyle setSpinnerLabelColor:](v2, "setSpinnerLabelColor:", v9);

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 15.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIStyle setSpinnerLabelFont:](v2, "setSpinnerLabelFont:", v10);

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 18.0, *MEMORY[0x24BEBB610]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIStyle setNavBarButtonLabelFont:](v2, "setNavBarButtonLabelFont:", v11);

    -[RUIStyle setNavBarLabelSpacingWithImage:](v2, "setNavBarLabelSpacingWithImage:", 6.0);
    -[RUIStyle setFooterTopMargin:](v2, "setFooterTopMargin:", 22.0);
    -[RUIStyle setSubHeaderTopMargin:](v2, "setSubHeaderTopMargin:", 16.0);
    -[RUIStyle setHeaderMargin:](v2, "setHeaderMargin:", 0.0, 0.0, 0.0, 0.0);
    -[RUIStyle setMultiChoiceStackViewElementSpacing:](v2, "setMultiChoiceStackViewElementSpacing:", 10.0);
    -[RUIStyle setMultiChoiceStackViewTopAndBottomMargin:](v2, "setMultiChoiceStackViewTopAndBottomMargin:", 5.0);
    -[RUIStyle setSectionHeaderHeight:](v2, "setSectionHeaderHeight:", 22.0);
    -[RUIStyle setHeaderContainerSideMargin:](v2, "setHeaderContainerSideMargin:", 16.0);
    -[RUIStyle setMinimumHeightOfAdaptiveSheet:](v2, "setMinimumHeightOfAdaptiveSheet:", 505.0);
  }
  return v2;
}

- (void)_applyToTitleLabel:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(getBFFStyleClass(), "sharedStyle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applyThemeToTitleLabel:", v3);

}

- (void)applyToLabel:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(getBFFStyleClass(), "sharedStyle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applyThemeToLabel:", v3);

}

- (void)applyToNavigationBar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RUIOsloStyle;
  v4 = a3;
  -[RUIStyle applyToNavigationBar:](&v7, sel_applyToNavigationBar_, v4);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "setBackgroundImage:forBarMetrics:", v5, 0, v7.receiver, v7.super_class);

  -[RUIStyle backgroundColor](self, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v6);

}

- (int64_t)tableViewStyle
{
  return 2;
}

- (id)_backgroundColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "systemGroupedBackgroundColor");
}

- (void)applyToObjectModel:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
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
  uint64_t v53;
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
  int v65;
  void *v66;
  uint64_t v67;
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
  int v90;
  void *v91;
  uint64_t v92;
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
  int v103;
  void *v104;
  void *v105;
  void *v106;
  int v107;
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
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  char v126;
  void *v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  RUIOsloStyle *v133;
  uint64_t v134;
  id obj;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  uint64_t v140;
  id v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  id v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  objc_super v158;
  _BYTE v159[128];
  _BYTE v160[128];
  _BYTE v161[128];
  uint64_t v162;

  v162 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v158.receiver = self;
  v158.super_class = (Class)RUIOsloStyle;
  -[RUIStyle applyToObjectModel:](&v158, sel_applyToObjectModel_, v4);
  objc_msgSend(v4, "setNextButtonStyle:", 2);
  v131 = v4;
  objc_msgSend(v4, "allPages");
  v154 = 0u;
  v155 = 0u;
  v156 = 0u;
  v157 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v154, v161, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v155;
    v8 = *MEMORY[0x24BEBB5E8];
    v9 = *MEMORY[0x24BEBB610];
    v132 = *(_QWORD *)v155;
    v133 = self;
    do
    {
      v10 = 0;
      v134 = v6;
      do
      {
        if (*(_QWORD *)v155 != v7)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * v10);
        objc_msgSend(v11, "setShowsTitlesAsHeaderViews:", 0);
        objc_msgSend(v11, "setExtendedLayoutIncludesOpaqueBars:", 1);
        objc_msgSend(v11, "setEdgesForExtendedLayout:", 1);
        objc_msgSend(v11, "loadViewIfNeeded");
        objc_msgSend(v11, "titleLabel");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[RUIOsloStyle _applyToTitleLabel:](self, "_applyToTitleLabel:", v12);

        objc_msgSend(v11, "attributes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("horizontalMargin"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v11, "attributes");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("horizontalMargin"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "floatValue");
          v18 = v17;
LABEL_8:
          objc_msgSend(v11, "setCustomMargin:", v18);

LABEL_9:
          goto LABEL_10;
        }
        objc_msgSend(v11, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "superview");
        v124 = objc_claimAutoreleasedReturnValue();
        if (!v124)
          goto LABEL_9;
        v125 = (void *)v124;
        v126 = objc_msgSend(v11, "hasTableView");

        if ((v126 & 1) == 0)
        {
          objc_msgSend(v11, "view");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v127, "traitCollection");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          v129 = objc_msgSend(v128, "horizontalSizeClass");

          if (v129 == 1)
          {
            objc_msgSend(getBFFStyleClass(), "sharedStyle");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "view");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "horizontalMarginForView:", v16);
            goto LABEL_8;
          }
          objc_msgSend(v11, "setCustomMargin:", 0.0);
        }
LABEL_10:
        if (objc_msgSend(v11, "hasTableView"))
        {
          v140 = v10;
          objc_msgSend(v11, "tableViewOM");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "tableView");
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v138, "setBounces:", 0);
          objc_msgSend(v19, "headerView");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "headerLabel");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "setAdjustsFontSizeToFitWidth:", 1);
          objc_msgSend(v21, "setMinimumScaleFactor:", 0.70588237);
          objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 24.0, v8);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v137 = v21;
          objc_msgSend(v21, "setFont:", v22);

          objc_msgSend(v19, "headerView");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "subHeaderLabel");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "setAdjustsFontSizeToFitWidth:", 1);
          objc_msgSend(v24, "setMinimumScaleFactor:", 0.70588237);
          objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 15.0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v136 = v24;
          objc_msgSend(v24, "setFont:", v25);

          v139 = v19;
          objc_msgSend(v19, "sections");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v150 = 0u;
          v151 = 0u;
          v152 = 0u;
          v153 = 0u;
          v141 = v26;
          v143 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v150, v160, 16);
          if (!v143)
            goto LABEL_58;
          v142 = *(_QWORD *)v151;
          while (1)
          {
            v27 = 0;
            do
            {
              if (*(_QWORD *)v151 != v142)
                objc_enumerationMutation(v141);
              v144 = v27;
              objc_msgSend(*(id *)(*((_QWORD *)&v150 + 1) + 8 * v27), "rows");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v146 = 0u;
              v147 = 0u;
              v148 = 0u;
              v149 = 0u;
              v145 = v28;
              v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v146, v159, 16);
              if (v29)
              {
                v30 = v29;
                v31 = *(_QWORD *)v147;
                do
                {
                  v32 = 0;
                  do
                  {
                    if (*(_QWORD *)v147 != v31)
                      objc_enumerationMutation(v145);
                    v33 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * v32);
                    objc_msgSend(v33, "tableCell");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "attributes");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "objectForKey:", CFSTR("class"));
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v36, "isEqualToString:", CFSTR("label")) & 1) != 0)
                    {
                      objc_msgSend(v33, "attributes");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v37, "objectForKey:", CFSTR("detailLinkURL"));
                      v38 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v38)
                      {
                        objc_msgSend(v34, "ruiTextLabel");
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v39, "text");
                        v40 = (void *)objc_claimAutoreleasedReturnValue();
                        v41 = objc_msgSend(v40, "length");

                        if (v41)
                        {
                          objc_msgSend(v39, "setAdjustsFontSizeToFitWidth:", 1);
                          objc_msgSend(v39, "setMinimumScaleFactor:", 0.70588237);
                          objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 13.0);
                          v42 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v39, "setFont:", v42);

                          objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
                          if (objc_msgSend(v33, "hasImage")
                            && (objc_msgSend(v33, "attributes"),
                                v43 = (void *)objc_claimAutoreleasedReturnValue(),
                                objc_msgSend(v43, "objectForKey:", CFSTR("accessory")),
                                v44 = (void *)objc_claimAutoreleasedReturnValue(),
                                v44,
                                v43,
                                !v44))
                          {
                            objc_msgSend(v34, "ruiImageView");
                            v45 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v45, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
                            objc_msgSend(v45, "leadingAnchor");
                            v113 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v34, "leadingAnchor");
                            v114 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v113, "constraintEqualToAnchor:constant:", v114, 16.0);
                            v115 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v115, "setActive:", 1);

                            objc_msgSend(v45, "centerYAnchor");
                            v116 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v34, "centerYAnchor");
                            v117 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v116, "constraintEqualToAnchor:", v117);
                            v118 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v118, "setActive:", 1);

                            objc_msgSend(v39, "leadingAnchor");
                            v46 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v45, "trailingAnchor");
                            v47 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v46, "constraintEqualToAnchor:constant:", v47, 15.0);
                            v119 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v119, "setActive:", 1);

                          }
                          else
                          {
                            objc_msgSend(v39, "leadingAnchor");
                            v45 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v34, "leadingAnchor");
                            v46 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v45, "constraintEqualToAnchor:constant:", v46, 16.0);
                            v47 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v47, "setActive:", 1);
                          }

                          objc_msgSend(v39, "centerYAnchor");
                          v48 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v34, "centerYAnchor");
                          v49 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v48, "constraintEqualToAnchor:", v49);
                          v50 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v50, "setActive:", 1);

                          objc_msgSend(v34, "detailTextLabel");
                          v51 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v51, "text");
                          v52 = (void *)objc_claimAutoreleasedReturnValue();
                          v53 = objc_msgSend(v52, "length");

                          if (v53)
                          {
                            objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 15.0, v9);
                            v54 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v51, "setFont:", v54);

                            objc_msgSend(v51, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
                            objc_msgSend(v51, "leadingAnchor");
                            v55 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v39, "trailingAnchor");
                            v56 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v55, "constraintEqualToAnchor:constant:", v56, 16.0);
                            v57 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v57, "setActive:", 1);

                            objc_msgSend(v51, "bottomAnchor");
                            v58 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v39, "bottomAnchor");
                            v59 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v58, "constraintEqualToAnchor:", v59);
                            v60 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v60, "setActive:", 1);

                          }
                          objc_msgSend(v33, "attributes");
                          v61 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v61, "objectForKey:", CFSTR("labelAlign"));
                          v62 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v62)
                            objc_msgSend(v39, "setTextAlignment:", +[RUIParser textAlignmentForString:](RUIParser, "textAlignmentForString:", v62));
                          goto LABEL_49;
                        }
                        goto LABEL_51;
                      }
                    }
                    else
                    {

                    }
                    objc_msgSend(v33, "attributes");
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v63, "objectForKey:", CFSTR("class"));
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    v65 = objc_msgSend(v64, "isEqualToString:", CFSTR("editableText"));

                    if (v65)
                    {
                      objc_msgSend(v34, "ruiTextLabel");
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v39, "text");
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                      v67 = objc_msgSend(v66, "length");

                      if (v67)
                      {
                        objc_msgSend(v39, "setAdjustsFontSizeToFitWidth:", 1);
                        objc_msgSend(v39, "setMinimumScaleFactor:", 0.70588237);
                        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 13.0);
                        v68 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v39, "setFont:", v68);

                        objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
                        objc_msgSend(v39, "centerYAnchor");
                        v69 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v34, "centerYAnchor");
                        v70 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v69, "constraintEqualToAnchor:", v70);
                        v71 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v71, "setActive:", 1);

                        objc_msgSend(v39, "leadingAnchor");
                        v72 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v34, "leadingAnchor");
                        v73 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v72, "constraintEqualToAnchor:constant:", v73, 16.0);
                        v74 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v74, "setActive:", 1);

                        objc_msgSend(v39, "trailingAnchor");
                        v75 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v34, "leadingAnchor");
                        v76 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v75, "constraintEqualToAnchor:constant:", v76, 66.0);
                        v77 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v77, "setActive:", 1);

                        objc_msgSend(v33, "attributes");
                        v78 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v78, "objectForKey:", CFSTR("labelAlign"));
                        v51 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v51)
                          objc_msgSend(v39, "setTextAlignment:", +[RUIParser textAlignmentForString:](RUIParser, "textAlignmentForString:", v51));
                        objc_msgSend(v34, "ruiEditableTextField");
                        v79 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 15.0);
                        v80 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v79, "setFont:", v80);

                        objc_msgSend(MEMORY[0x24BEBD4B8], "_labelColor");
                        v81 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v79, "setTextColor:", v81);

                        objc_msgSend(v79, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
                        objc_msgSend(v79, "leadingAnchor");
                        v82 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v39, "trailingAnchor");
                        v83 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v82, "constraintEqualToAnchor:constant:", v83, 16.0);
                        v84 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v84, "setActive:", 1);

                        objc_msgSend(v79, "bottomAnchor");
                        v85 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v39, "bottomAnchor");
                        v86 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v85, "constraintEqualToAnchor:", v86);
                        v87 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v87, "setActive:", 1);

                        goto LABEL_50;
                      }
                    }
                    else
                    {
                      objc_msgSend(v33, "attributes");
                      v88 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v88, "objectForKey:", CFSTR("class"));
                      v89 = (void *)objc_claimAutoreleasedReturnValue();
                      v90 = objc_msgSend(v89, "isEqualToString:", CFSTR("link"));

                      if (!v90)
                      {
                        objc_msgSend(v33, "attributes");
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v39, "objectForKey:", CFSTR("class"));
                        v51 = (void *)objc_claimAutoreleasedReturnValue();
                        if (objc_msgSend(v51, "isEqualToString:", CFSTR("label")))
                        {
                          objc_msgSend(v33, "attributes");
                          v101 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v101, "objectForKey:", CFSTR("customDetailLink"));
                          v102 = (void *)objc_claimAutoreleasedReturnValue();
                          v103 = objc_msgSend(v102, "isEqualToString:", CFSTR("true"));

                          if (!v103)
                            goto LABEL_52;
                          objc_msgSend(v34, "ruiTextLabel");
                          v39 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v33, "attributes");
                          v104 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v104, "objectForKey:", CFSTR("labelAlign"));
                          v51 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v51)
                            objc_msgSend(v39, "setTextAlignment:", +[RUIParser textAlignmentForString:](RUIParser, "textAlignmentForString:", v51));
                        }
                        goto LABEL_50;
                      }
                      objc_msgSend(v34, "ruiTextLabel");
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v39, "text");
                      v91 = (void *)objc_claimAutoreleasedReturnValue();
                      v92 = objc_msgSend(v91, "length");

                      if (v92)
                      {
                        objc_msgSend(v39, "setAdjustsFontSizeToFitWidth:", 1);
                        objc_msgSend(v39, "setMinimumScaleFactor:", 0.70588237);
                        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 15.0);
                        v93 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v39, "setFont:", v93);

                        if (objc_msgSend(v33, "hasImage"))
                        {
                          objc_msgSend(v34, "ruiImageView");
                          v94 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v94, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
                          objc_msgSend(v94, "centerYAnchor");
                          v95 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v34, "centerYAnchor");
                          v96 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v95, "constraintEqualToAnchor:", v96);
                          v97 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v97, "setActive:", 1);

                          objc_msgSend(v94, "trailingAnchor");
                          v98 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v39, "leadingAnchor");
                          v99 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v98, "constraintEqualToAnchor:constant:", v99, -6.0);
                          v100 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v100, "setActive:", 1);

                        }
                        else
                        {
                          objc_msgSend(v39, "leadingAnchor");
                          v94 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v34, "leadingAnchor");
                          v98 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v94, "constraintEqualToAnchor:constant:", v98, 15.0);
                          v99 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v99, "setActive:", 1);
                        }

                        objc_msgSend(v33, "attributes");
                        v105 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("labelBold"));
                        v106 = (void *)objc_claimAutoreleasedReturnValue();
                        v107 = objc_msgSend(v106, "BOOLValue");

                        if (v107)
                        {
                          v108 = (void *)MEMORY[0x24BEBB520];
                          objc_msgSend(v34, "ruiTextLabel");
                          v109 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v109, "font");
                          v110 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v110, "pointSize");
                          objc_msgSend(v108, "boldSystemFontOfSize:");
                          v111 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v39, "setFont:", v111);

                        }
                        objc_msgSend(v39, "centerYAnchor");
                        v51 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v34, "centerYAnchor");
                        v62 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v51, "constraintEqualToAnchor:", v62);
                        v112 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v112, "setActive:", 1);

LABEL_49:
LABEL_50:

                      }
                    }
LABEL_51:

LABEL_52:
                    ++v32;
                  }
                  while (v30 != v32);
                  v120 = objc_msgSend(v145, "countByEnumeratingWithState:objects:count:", &v146, v159, 16);
                  v30 = v120;
                }
                while (v120);
              }

              v27 = v144 + 1;
            }
            while (v144 + 1 != v143);
            v143 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v150, v160, 16);
            if (!v143)
            {
LABEL_58:

              self = v133;
              v6 = v134;
              v7 = v132;
              v121 = v139;
              v10 = v140;
              v122 = v138;
              goto LABEL_61;
            }
          }
        }
        -[RUIOsloStyle _backgroundColor](self, "_backgroundColor");
        v123 = (void *)objc_claimAutoreleasedReturnValue();

        if (v123)
        {
          objc_msgSend(v11, "containerView");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          -[RUIOsloStyle _backgroundColor](self, "_backgroundColor");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "setBackgroundColor:", v122);
LABEL_61:

        }
        ++v10;
      }
      while (v10 != v6);
      v130 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v154, v161, 16);
      v6 = v130;
    }
    while (v130);
  }

}

@end
