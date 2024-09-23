@implementation RUISetupAssistantStyle

- (RUISetupAssistantStyle)init
{
  RUISetupAssistantStyle *v2;
  void *v3;
  void *v4;
  void *v5;
  RUISetupAssitantLayout *v6;
  RUISetupAssitantLayout *setupAssistantLayout;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RUISetupAssistantStyle;
  v2 = -[RUIStyle init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "_labelColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIStyle setHeaderLabelTextColor:](v2, "setHeaderLabelTextColor:", v3);

    -[RUIStyle setHeaderLabelAlignment:](v2, "setHeaderLabelAlignment:", 1);
    objc_msgSend(MEMORY[0x24BEBD4B8], "_labelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIStyle setSubHeaderLabelTextColor:](v2, "setSubHeaderLabelTextColor:", v4);

    -[RUIStyle setSubHeaderLabelAlignment:](v2, "setSubHeaderLabelAlignment:", 1);
    objc_msgSend(MEMORY[0x24BEBD4B8], "_labelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIStyle setDetailHeaderLabelTextColor:](v2, "setDetailHeaderLabelTextColor:", v5);

    -[RUIStyle setFooterLabelAlignment:](v2, "setFooterLabelAlignment:", 1);
    v6 = objc_alloc_init(RUISetupAssitantLayout);
    setupAssistantLayout = v2->_setupAssistantLayout;
    v2->_setupAssistantLayout = v6;

  }
  return v2;
}

- (id)barBackgroundImageForUserInterfaceStyle:(int64_t)a3
{
  void *v3;
  void *v4;
  CGSize v6;
  CGRect v7;

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.width = 1.0;
  v6.height = 1.0;
  UIGraphicsBeginImageContext(v6);
  objc_msgSend(v3, "set");
  v7.origin.x = 0.0;
  v7.origin.y = 0.0;
  v7.size.width = 1.0;
  v7.size.height = 1.0;
  UIRectFill(v7);
  UIGraphicsGetImageFromCurrentImageContext();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v4;
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

- (id)_backgroundColor
{
  void *v2;
  void *v3;

  objc_msgSend(getBFFStyleClass(), "sharedStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_applyToFooter:(id)a3 view:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "linkButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    UISystemFontForSize();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v6);

  }
}

- (id)insetGroupedCellBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithDynamicProvider:", &__block_literal_global_242);
}

id __57__RUISetupAssistantStyle_insetGroupedCellBackgroundColor__block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemGroupedBackgroundColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGroupedBackgroundColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)applyToObjectModel:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
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
  void *v27;
  uint64_t v28;
  RUISetupAssistantStyle *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  uint64_t v83;
  void *v84;
  double v85;
  uint64_t v86;
  uint64_t v87;
  id obj;
  void *v89;
  void *v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  double v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  objc_super v110;
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v110.receiver = self;
  v110.super_class = (Class)RUISetupAssistantStyle;
  -[RUIStyle applyToObjectModel:](&v110, sel_applyToObjectModel_, v4);
  objc_msgSend(v4, "setNextButtonStyle:", 2);
  v84 = v4;
  objc_msgSend(v4, "allPages");
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v107;
    v85 = *MEMORY[0x24BEBE730];
    v86 = *(_QWORD *)v107;
    do
    {
      v8 = 0;
      v87 = v6;
      do
      {
        if (*(_QWORD *)v107 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v8);
        objc_msgSend(v9, "setShowsTitlesAsHeaderViews:", 1);
        objc_msgSend(v9, "loadViewIfNeeded");
        if (objc_msgSend(v9, "hasWebView"))
        {
          objc_msgSend(v9, "webViewOM");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "webView");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "scrollView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setDecelerationRate:", v85);

          objc_msgSend(v11, "evaluateJavaScript:completionHandler:", CFSTR("document.body.style.webkitUserSelect='none';"),
            0);

        }
        objc_msgSend(v9, "attributes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("horizontalMargin"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v9, "attributes");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("horizontalMargin"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "floatValue");
          v18 = v17;
LABEL_10:
          objc_msgSend(v9, "setCustomMargin:", v18);

LABEL_11:
          goto LABEL_12;
        }
        objc_msgSend(v9, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "superview");
        v49 = objc_claimAutoreleasedReturnValue();
        if (!v49)
          goto LABEL_11;
        v50 = (void *)v49;
        v51 = objc_msgSend(v9, "hasTableView");

        if ((v51 & 1) == 0)
        {
          objc_msgSend(v9, "view");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "traitCollection");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "horizontalSizeClass");

          if (v54 == 1)
          {
            objc_msgSend(getBFFStyleClass(), "sharedStyle");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "view");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "horizontalMarginForView:", v16);
            goto LABEL_10;
          }
          objc_msgSend(v9, "setCustomMargin:", 0.0);
        }
LABEL_12:
        objc_msgSend(v9, "titleLabel");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[RUISetupAssistantStyle _applyToTitleLabel:](self, "_applyToTitleLabel:", v19);

        -[RUISetupAssistantStyle _backgroundColor](self, "_backgroundColor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          -[RUISetupAssistantStyle _backgroundColor](self, "_backgroundColor");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "view");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setBackgroundColor:", v21);

        }
        if (objc_msgSend(v9, "hasTableView"))
        {
          v90 = v9;
          v91 = v8;
          objc_msgSend(v9, "tableViewOM");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "tableView");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setBackgroundColor:", v25);

          objc_msgSend(v24, "setBackgroundView:", 0);
          objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 1.0, 0.3);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setSeparatorBottomShadowColor:", v26);

          v89 = v23;
          objc_msgSend(v23, "sections");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = 0u;
          v103 = 0u;
          v104 = 0u;
          v105 = 0u;
          v92 = v27;
          v94 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
          if (v94)
          {
            v93 = *(_QWORD *)v103;
            do
            {
              v28 = 0;
              do
              {
                v29 = self;
                if (*(_QWORD *)v103 != v93)
                  objc_enumerationMutation(v92);
                v95 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * v28);
                v96 = v28;
                objc_msgSend(v95, "rows");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v98 = 0u;
                v99 = 0u;
                v100 = 0u;
                v101 = 0u;
                v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v98, v111, 16);
                if (v31)
                {
                  v32 = v31;
                  v33 = *(_QWORD *)v99;
                  do
                  {
                    for (i = 0; i != v32; ++i)
                    {
                      if (*(_QWORD *)v99 != v33)
                        objc_enumerationMutation(v30);
                      v35 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
                      objc_msgSend(v35, "tableCell");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v24, "style") == 2)
                      {
                        objc_msgSend(v36, "backgroundColor");
                        v37 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v37)
                        {
                          objc_msgSend(v36, "setBackgroundColor:", v37);
                        }
                        else
                        {
                          -[RUISetupAssistantStyle insetGroupedCellBackgroundColor](v29, "insetGroupedCellBackgroundColor");
                          v38 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v36, "setBackgroundColor:", v38);

                        }
                      }
                      objc_msgSend(v35, "attributes");
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v39, "objectForKey:", CFSTR("class"));
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      v41 = objc_msgSend(v40, "isEqualToString:", CFSTR("label"));

                      if (v41)
                      {
                        objc_msgSend(v36, "ruiTextLabel");
                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v42, "setAdjustsFontSizeToFitWidth:", 1);
                        objc_msgSend(v42, "setMinimumScaleFactor:", 0.70588237);

                      }
                    }
                    v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v98, v111, 16);
                  }
                  while (v32);
                }
                objc_msgSend(v95, "footer");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v95, "footerView");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                self = v29;
                -[RUISetupAssistantStyle _applyToFooter:view:](v29, "_applyToFooter:view:", v43, v44);

                v28 = v96 + 1;
              }
              while (v96 + 1 != v94);
              v94 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
            }
            while (v94);
          }

          v7 = v86;
          v6 = v87;
          v9 = v90;
          v8 = v91;
          v45 = v89;
          goto LABEL_45;
        }
        if (objc_msgSend(v9, "hasPasscodeView"))
        {
          objc_msgSend(v9, "passcodeViewOM");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "passcodeView");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[RUISetupAssistantStyle _backgroundColor](self, "_backgroundColor");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setBackgroundColor:", v47);

          objc_msgSend(v45, "footer");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "footerView");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[RUISetupAssistantStyle _applyToFooter:view:](self, "_applyToFooter:view:", v24, v48);

LABEL_45:
          goto LABEL_46;
        }
        -[RUISetupAssistantStyle _backgroundColor](self, "_backgroundColor");
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (v55)
        {
          objc_msgSend(v9, "containerView");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[RUISetupAssistantStyle _backgroundColor](self, "_backgroundColor");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setBackgroundColor:", v24);
          goto LABEL_45;
        }
LABEL_46:
        objc_msgSend(v9, "toolbar");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v56;
        if (v56)
        {
          objc_msgSend(v56, "setTranslucent:", 1);
          objc_msgSend(v57, "_setHidesShadow:", 1);
          objc_msgSend(v9, "traitCollection");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[RUISetupAssistantStyle barBackgroundImageForUserInterfaceStyle:](self, "barBackgroundImageForUserInterfaceStyle:", objc_msgSend(v58, "userInterfaceStyle"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "setBackgroundImage:forToolbarPosition:barMetrics:", v59, 0, 0);

          objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "traitCollection");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v61, "userInterfaceStyle");

          if (v62 == 2)
          {
            objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "setBackgroundColor:", v63);

          }
        }
        objc_msgSend(v9, "view");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "setEdgesPreservingSuperviewLayoutMargins:", 15);

        objc_msgSend(v9, "view");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "directionalLayoutMargins");
        v67 = v66;
        v69 = v68;
        v97 = v70;
        v72 = v71;

        -[RUISetupAssistantStyle setupAssistantLayout](self, "setupAssistantLayout");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "directionalLayoutMarginsForViewController:", v9);
        v75 = v74;
        v77 = v76;
        v79 = v78;
        v81 = v80;

        if (v69 != v77 || v67 != v75 || v72 != v81 || v97 != v79)
        {
          objc_msgSend(v9, "view");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "setDirectionalLayoutMargins:", v75, v77, v79, v81);

        }
        ++v8;
      }
      while (v8 != v6);
      v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
      v6 = v83;
    }
    while (v83);
  }

}

- (void)applyToNavigationBar:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RUISetupAssistantStyle;
  v3 = a3;
  -[RUIStyle applyToNavigationBar:](&v7, sel_applyToNavigationBar_, v3);
  objc_msgSend(v3, "_setHidesShadow:", 1, v7.receiver, v7.super_class);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "setBackgroundImage:forBarMetrics:", v4, 0);

  objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v5);
  objc_msgSend(v3, "_setBackgroundView:", v6);

}

- (BOOL)supportActivityIndicatorInPinView
{
  return 1;
}

- (RUISetupAssitantLayout)setupAssistantLayout
{
  return self->_setupAssistantLayout;
}

- (void)setSetupAssistantLayout:(id)a3
{
  objc_storeStrong((id *)&self->_setupAssistantLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupAssistantLayout, 0);
}

@end
