@implementation SBRootFolderViewPageManagementLayoutManager

- (SBRootFolderViewPageManagementLayoutManager)init
{
  SBRootFolderViewPageManagementLayoutManager *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBRootFolderViewPageManagementLayoutManager;
  result = -[SBRootFolderViewPageManagementLayoutManager init](&v3, sel_init);
  if (result)
    result->_allowsPageHiding = 1;
  return result;
}

- (void)setActiveFocusMode:(id)a3
{
  SBHFocusMode *v5;

  v5 = (SBHFocusMode *)a3;
  if (self->_activeFocusMode != v5)
  {
    objc_storeStrong((id *)&self->_activeFocusMode, a3);
    -[SBRootFolderViewPageManagementLayoutManager setAllowsPageHiding:](self, "setAllowsPageHiding:", -[SBHFocusMode customizedHomeScreenPagesEnabled](v5, "customizedHomeScreenPagesEnabled") ^ 1);
  }

}

- (void)layoutScrollViewAndRootListViewInFolderView:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double Height;
  double Width;
  id v16;
  CGRect v17;
  CGRect v18;

  objc_msgSend(a3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SBRootFolderViewPageManagementLayoutManager pageManagementScrollView](self, "pageManagementScrollView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v5, v7, v9, v11);
  -[SBRootFolderViewPageManagementLayoutManager rootListView](self, "rootListView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBRootFolderViewPageManagementLayoutManager layoutConfiguration](self, "layoutConfiguration") == 5)
  {
    objc_msgSend(v12, "intrinsicContentSize");
    Height = v13;
  }
  else
  {
    v17.origin.x = v5;
    v17.origin.y = v7;
    v17.size.width = v9;
    v17.size.height = v11;
    Height = CGRectGetHeight(v17);
  }
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  Width = CGRectGetWidth(v18);
  objc_msgSend(v16, "setContentSize:", Width, Height);
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, Width, Height);

}

- (void)layoutHeaderViewsInFolderView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  void *v27;
  double MinY;
  CGFloat v29;
  uint64_t v30;
  CGRect remainder;
  CGRect slice;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayScale");
  v30 = v14;

  objc_msgSend(v4, "safeAreaInsets");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v23 = v6 + v18;
  v24 = v8 + v16;
  v25 = v10 - (v18 + v22);
  v26 = v12 - (v16 + v20);
  -[SBRootFolderViewPageManagementLayoutManager rootListView](self, "rootListView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "rectForIconAtIndex:", 0);
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  MinY = CGRectGetMinY(v33);
  v34.origin.x = v23;
  v34.origin.y = v24;
  v34.size.width = v25;
  v34.size.height = v26;
  v29 = MinY - CGRectGetMinY(v34);
  v35.origin.x = v23;
  v35.origin.y = v24;
  v35.size.width = v25;
  v35.size.height = v26;
  CGRectDivide(v35, &slice, &remainder, v29, CGRectMinYEdge);
  -[UIImageView sizeThatFits:](self->_focusModeSymbolView, "sizeThatFits:", v10, v12);
  UIRectCenteredIntegralRectScale();
  -[UIImageView setFrame:](self->_focusModeSymbolView, "setFrame:", v30);

}

- (void)layoutFooterViewsInFolderView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  void *v30;
  double v31;
  double v32;
  SBTitledHomeScreenButton *focusModeOptionsButton;
  double MidX;
  uint64_t v35;
  id v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayScale");
  v35 = v10;

  -[SBRootFolderViewPageManagementLayoutManager rootListView](self, "rootListView");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "icons");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "rectForIconAtIndex:", objc_msgSend(v11, "count") - 1);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  objc_msgSend(v4, "maxDockHeight");
  v21 = v20;

  v22 = v21 * 0.25;
  -[SBTitledHomeScreenButton sizeThatFits:](self->_focusModeOptionsButton, "sizeThatFits:", v6, v8);
  UIRectCenteredXInRectScale();
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v37.origin.x = v13;
  v37.origin.y = v15;
  v37.size.width = v17;
  v37.size.height = v19;
  v29 = v22 + CGRectGetMaxY(v37);
  -[SBRootFolderViewPageManagementLayoutManager pageManagementScrollView](self, "pageManagementScrollView", v35);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "contentSize");
  v32 = v31;
  v38.origin.x = v24;
  v38.origin.y = v29;
  v38.size.width = v26;
  v38.size.height = v28;
  objc_msgSend(v30, "setContentSize:", v32, v22 + CGRectGetMaxY(v38));
  -[SBTitledHomeScreenButton setBounds:](self->_focusModeOptionsButton, "setBounds:", v24, v29, v26, v28);
  focusModeOptionsButton = self->_focusModeOptionsButton;
  v39.origin.x = v24;
  v39.origin.y = v29;
  v39.size.width = v26;
  v39.size.height = v28;
  MidX = CGRectGetMidX(v39);
  v40.origin.x = v24;
  v40.origin.y = v29;
  v40.size.width = v26;
  v40.size.height = v28;
  -[SBTitledHomeScreenButton setCenter:](focusModeOptionsButton, "setCenter:", MidX, CGRectGetMidY(v40));
  -[SBTitledHomeScreenButton setNeedsLayout](self->_focusModeOptionsButton, "setNeedsLayout");
  -[SBTitledHomeScreenButton layoutIfNeeded](self->_focusModeOptionsButton, "layoutIfNeeded");

}

- (void)transitionToActive:(BOOL)a3 inFolderView:(id)a4 usingAnimator:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSMapTable *v26;
  NSMapTable *iconViewControllersByIcon;
  NSMapTable *v28;
  NSMapTable *iconViewControllersByListModel;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSMapTable *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  SBTitledHomeScreenButton *v63;
  SBTitledHomeScreenButton *v64;
  SBTitledHomeScreenButton *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSMapTable *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t k;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  CGFloat v85;
  double v86;
  CGFloat v87;
  double v88;
  CGFloat v89;
  double v90;
  CGFloat v91;
  void *v92;
  double v93;
  double v94;
  double Width;
  double v96;
  double v97;
  void *v98;
  char v99;
  NSMapTable *v100;
  NSMapTable *pageIconsByListModel;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  unint64_t v107;
  uint64_t v108;
  void *v109;
  void *v110;
  double v111;
  double v112;
  uint64_t v113;
  id v114;
  SBIconListViewDominoPivotAnimator *v115;
  id v116;
  id v117;
  void *v118;
  id v119;
  void (**v120)(_QWORD);
  id v121;
  id v122;
  id v123;
  id v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  unint64_t v132;
  void *v133;
  id v134;
  unint64_t v135;
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
  void *v146;
  void *v147;
  id v148;
  id v149;
  id v150;
  void *v151;
  _BOOL4 v152;
  void *v153;
  id v154;
  double v155;
  id v156;
  void *v157;
  id v158;
  _QWORD v159[5];
  id v160;
  id v161;
  id v162;
  unint64_t v163;
  BOOL v164;
  _QWORD v165[5];
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  id v171;
  id v172;
  double v173;
  double v174;
  double v175;
  BOOL v176;
  _QWORD v177[5];
  _QWORD aBlock[4];
  id v179;
  SBRootFolderViewPageManagementLayoutManager *v180;
  id v181;
  id v182;
  id v183;
  id v184;
  double v185;
  double v186;
  _BYTE v187[336];
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  _QWORD v192[4];
  id v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  _QWORD __src[41];
  _BYTE v203[128];
  _BYTE v204[128];
  _BYTE v205[128];
  uint64_t v206;
  CGRect v207;
  CGRect v208;
  CGRect v209;
  CGRect v210;

  v152 = a3;
  v206 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v149 = a5;
  objc_msgSend(v7, "folder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrollView");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "widgetButton");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrollAccessoryView");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rootFolderVisualConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBRootFolderViewPageManagementLayoutManager focusModeSymbolView](self, "focusModeSymbolView");
  v10 = objc_claimAutoreleasedReturnValue();
  -[SBRootFolderViewPageManagementLayoutManager focusModeOptionsButton](self, "focusModeOptionsButton");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBRootFolderViewPageManagementLayoutManager rootListView](self, "rootListView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBRootFolderViewPageManagementLayoutManager pageManagementScrollView](self, "pageManagementScrollView");
  v12 = objc_claimAutoreleasedReturnValue();
  -[SBRootFolderViewPageManagementLayoutManager backgroundTapGestureRecognizer](self, "backgroundTapGestureRecognizer");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pageManagementPageCheckboxVerticalMargin");
  v15 = v14;
  v142 = v9;
  objc_msgSend(v9, "pageManagementPageCheckboxDiameter");
  v17 = v16;
  v135 = -[SBRootFolderViewPageManagementLayoutManager activeTransitionCount](self, "activeTransitionCount");
  memset(__src, 0, sizeof(__src));
  objc_msgSend(v7, "getMetrics:", __src);
  v157 = v7;
  v18 = objc_msgSend(v7, "iconListModelIndexForPageIndex:", objc_msgSend(v7, "currentPageIndex"));
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = objc_msgSend(v7, "firstIconPageIndex");
    objc_msgSend(v7, "setCurrentPageIndex:animated:", v19, 0);
    v18 = objc_msgSend(v7, "iconListModelIndexForPageIndex:", v19);
  }
  if (objc_msgSend(v8, "isTrailingEmptyListIndex:", v18))
  {
    v20 = (void *)v10;
    do
    {
      v21 = objc_msgSend(v8, "precedingVisibleListIndexBeforeIndex:", v18);
      if (v21 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v22 = v21;
      objc_msgSend(v157, "setCurrentPageIndex:animated:", objc_msgSend(v157, "pageIndexForIconListModelIndex:", v21), 0);
      v18 = v22;
    }
    while ((objc_msgSend(v8, "isTrailingEmptyListIndex:", v22) & 1) != 0);
  }
  else
  {
    v20 = (void *)v10;
  }
  v155 = v15 + v17;
  objc_msgSend(v8, "listAtIndex:", v18);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  v25 = (id)v12;
  if (v152)
  {
    v133 = (void *)v23;
    objc_msgSend(v157, "currentIconListView");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "setIncludesHiddenIconListPages:", 1);
    objc_msgSend(v157, "setAutomaticallyCreatesIconListViews:", 0);
    if (!self->_iconViewControllersByIcon)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v26 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      iconViewControllersByIcon = self->_iconViewControllersByIcon;
      self->_iconViewControllersByIcon = v26;

    }
    if (!self->_iconViewControllersByListModel)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v28 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      iconViewControllersByListModel = self->_iconViewControllersByListModel;
      self->_iconViewControllersByListModel = v28;

    }
    if (self->_pageIconsByListModel)
    {
      if (v12)
      {
LABEL_16:
        if (!v11)
        {
          -[SBRootFolderViewPageManagementLayoutManager makeRootListViewInFolderView:animated:](self, "makeRootListViewInFolderView:animated:", v157, v149 != 0);
          -[SBRootFolderViewPageManagementLayoutManager rootListView](self, "rootListView");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (!v13)
        {
          v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_backgroundTapped_);
          objc_msgSend(v11, "addGestureRecognizer:", v13);
        }
        v137 = v11;
        v141 = (void *)v13;
        v200 = 0u;
        v201 = 0u;
        v198 = 0u;
        v199 = 0u;
        objc_msgSend(v157, "additionalIconListViews");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v198, v205, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v199;
          do
          {
            for (i = 0; i != v32; ++i)
            {
              if (*(_QWORD *)v199 != v33)
                objc_enumerationMutation(v30);
              v35 = *(void **)(*((_QWORD *)&v198 + 1) + 8 * i);
              objc_msgSend(v35, "setEditing:", 0);
              objc_msgSend(v35, "updateEditingStateAnimated:", v149 != 0);
            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v198, v205, 16);
          }
          while (v32);
        }

        objc_msgSend(v157, "scalingView");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "superview");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v37)
        {
          objc_msgSend(v36, "bounds");
          objc_msgSend(v25, "setFrame:");
          objc_msgSend(v36, "insertSubview:aboveSubview:", v25, v153);
        }
        v128 = v36;
        objc_msgSend(v137, "superview");
        v38 = (id)objc_claimAutoreleasedReturnValue();

        if (v38 != v25)
          objc_msgSend(v25, "addSubview:", v137);
        v150 = v25;
        -[SBRootFolderViewPageManagementLayoutManager layoutScrollViewAndRootListViewInFolderView:](self, "layoutScrollViewAndRootListViewInFolderView:", v157);
        objc_msgSend(v137, "layoutIconsNow");
        v196 = 0u;
        v197 = 0u;
        v194 = 0u;
        v195 = 0u;
        v39 = self->_iconViewControllersByIcon;
        v40 = -[NSMapTable countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v194, v204, 16);
        if (v40)
        {
          v41 = v40;
          v42 = *(_QWORD *)v195;
          do
          {
            for (j = 0; j != v41; ++j)
            {
              if (*(_QWORD *)v195 != v42)
                objc_enumerationMutation(v39);
              -[NSMapTable objectForKey:](self->_iconViewControllersByIcon, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v194 + 1) + 8 * j));
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "bs_beginAppearanceTransition:animated:", 1, 0);
              objc_msgSend(v44, "bs_endAppearanceTransition:", 1);
              objc_msgSend(v44, "listView");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v192[0] = MEMORY[0x1E0C809B0];
              v192[1] = 3221225472;
              v192[2] = __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke;
              v192[3] = &unk_1E8D85CC0;
              v193 = v44;
              v46 = v44;
              objc_msgSend(v45, "enumerateKnownIconViewsUsingBlock:", v192);

            }
            v41 = -[NSMapTable countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v194, v204, 16);
          }
          while (v41);
        }

        -[NSMapTable objectForKey:](self->_pageIconsByListModel, "objectForKey:", v133);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v137;
        if (v47)
        {
          objc_msgSend(v137, "rectForIcon:", v47);
          v208 = CGRectInset(v207, -8.0, -8.0);
          objc_msgSend(v25, "scrollRectToVisible:animated:", 0, v208.origin.x, v208.origin.y, v208.size.width, v208.size.height);
        }
        -[SBRootFolderViewPageManagementLayoutManager activeFocusMode](self, "activeFocusMode");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v149;
        if (objc_msgSend(v48, "customizedHomeScreenPagesEnabled"))
        {
          if (!v20)
          {
            objc_msgSend(v48, "symbol");
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:", *MEMORY[0x1E0DC4AE8]);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v143, v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v51);
            objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
            v52 = v48;
            v53 = v47;
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setTintColor:", v54);

            v47 = v53;
            v48 = v52;
            -[SBRootFolderViewPageManagementLayoutManager setFocusModeSymbolView:](self, "setFocusModeSymbolView:", v20);

            v49 = v149;
          }
          objc_msgSend(v25, "insertSubview:aboveSubview:", v20, v137);
          if (!v147)
          {
            +[SBIconView componentBackgroundView](SBIconView, "componentBackgroundView");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            SBHBundle();
            v126 = v48;
            v56 = v49;
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("OPTIONS"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            v49 = v56;
            objc_msgSend(v142, "pageManagementFocusModeOptionsButtonSize");
            v60 = v59;
            v62 = v61;
            v63 = [SBTitledHomeScreenButton alloc];
            v64 = -[SBTitledHomeScreenButton initWithFrame:backgroundView:type:content:](v63, "initWithFrame:backgroundView:type:content:", v55, 1, v58, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
            -[SBTitledHomeScreenButton setPreferredContentFittingSize:](v64, "setPreferredContentFittingSize:", v60, v62);
            -[SBTitledHomeScreenButton addTarget:action:forControlEvents:](v64, "addTarget:action:forControlEvents:", self, sel_focusModeOptionsButtonTapped_, 0x2000);
            -[SBRootFolderViewPageManagementLayoutManager setFocusModeOptionsButton:](self, "setFocusModeOptionsButton:", v64);
            v147 = v64;
            v65 = v64;
            v48 = v126;
            objc_msgSend(v25, "insertSubview:aboveSubview:", v65, v137);
            -[SBRootFolderViewPageManagementLayoutManager layoutFooterViewsInFolderView:](self, "layoutFooterViewsInFolderView:", v157);

          }
        }
        -[SBRootFolderViewPageManagementLayoutManager dockOffscreenAssertion](self, "dockOffscreenAssertion");
        v71 = objc_claimAutoreleasedReturnValue();
        if (!v71)
        {
          objc_msgSend(v157, "beginModifyingDockOffscreenFractionForReason:", CFSTR("PageEditing"));
          v71 = objc_claimAutoreleasedReturnValue();
          -[SBRootFolderViewPageManagementLayoutManager setDockOffscreenAssertion:](self, "setDockOffscreenAssertion:", v71);
        }
        v131 = (void *)v71;
        -[SBRootFolderViewPageManagementLayoutManager scrollAccessoryBorrowedAssertion](self, "scrollAccessoryBorrowedAssertion");
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v72)
        {
          objc_msgSend(v157, "borrowScrollAccessoryForReason:", CFSTR("PageEditing"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBRootFolderViewPageManagementLayoutManager setScrollAccessoryBorrowedAssertion:](self, "setScrollAccessoryBorrowedAssertion:", v73);

        }
        -[SBRootFolderViewPageManagementLayoutManager pageDotsVisibilityAssertion](self, "pageDotsVisibilityAssertion");
        v74 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v74)
        {
          objc_msgSend(v157, "requirePageDotsVisibilityForReason:", CFSTR("PageEditing"));
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBRootFolderViewPageManagementLayoutManager setPageDotsVisibilityAssertion:](self, "setPageDotsVisibilityAssertion:", v75);

        }
        -[SBRootFolderViewPageManagementLayoutManager layoutHeaderViewsInFolderView:](self, "layoutHeaderViewsInFolderView:", v157);
        if (v49)
        {
          v125 = v47;
          v127 = v48;
          v144 = v20;
          v190 = 0u;
          v191 = 0u;
          v188 = 0u;
          v189 = 0u;
          v76 = self->_iconViewControllersByIcon;
          v77 = -[NSMapTable countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v188, v203, 16);
          if (v77)
          {
            v78 = v77;
            v79 = *(_QWORD *)v189;
            do
            {
              for (k = 0; k != v78; ++k)
              {
                if (*(_QWORD *)v189 != v79)
                  objc_enumerationMutation(v76);
                v81 = *(void **)(*((_QWORD *)&v188 + 1) + 8 * k);
                -[NSMapTable objectForKey:](self->_iconViewControllersByIcon, "objectForKey:", v81);
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v82, "setScalesListView:", 0);
                objc_msgSend(v81, "listModel");
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v157, "_frameForIconListAtIndex:", objc_msgSend(v8, "indexOfList:", v83));
                objc_msgSend(v137, "convertRect:fromView:", v153);
                v85 = v84;
                v87 = v86;
                v89 = v88;
                v91 = v90;
                objc_msgSend(v137, "iconViewForIcon:", v81);
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v92, "iconImageInfo");
                v94 = v93;
                v209.origin.x = v85;
                v209.origin.y = v87;
                v209.size.width = v89;
                v209.size.height = v91;
                Width = CGRectGetWidth(v209);
                v210.origin.x = v85;
                v210.origin.y = v87;
                v210.size.width = v89;
                v210.size.height = v91;
                v96 = v155 + CGRectGetHeight(v210);
                objc_msgSend(v92, "_continuousCornerRadius");
                objc_msgSend(v92, "setIconImageInfo:", Width, v96, v94, v97);
                objc_msgSend(v92, "layoutIfNeeded");
                UIRectGetCenter();
                objc_msgSend(v92, "setCenter:");

              }
              v78 = -[NSMapTable countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v188, v203, 16);
            }
            while (v78);
          }

          v20 = v144;
          objc_msgSend(v144, "setAlpha:", 0.0);
          objc_msgSend(v147, "setAlpha:", 0.0);
          v68 = v129;
          objc_msgSend(v129, "model");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = objc_msgSend(v8, "isTrailingEmptyList:", v98);

          v25 = v150;
          v47 = v125;
          v48 = v127;
          if ((v99 & 1) == 0)
            objc_msgSend(v129, "addSubview:", v146);
        }
        else
        {
          objc_msgSend(v137, "setEditing:", self->_allowsEditing);
          objc_msgSend(v137, "updateEditingStateAnimated:", 0);
          v68 = v129;
        }

        v24 = v133;
        goto LABEL_72;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v100 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      pageIconsByListModel = self->_pageIconsByListModel;
      self->_pageIconsByListModel = v100;

      if (v12)
        goto LABEL_16;
    }
    v25 = objc_alloc_init(MEMORY[0x1E0DC3C28]);
    objc_msgSend(v25, "setDelegate:", self);
    objc_msgSend(v25, "setShowsVerticalScrollIndicator:", 0);
    objc_msgSend(v25, "setShowsHorizontalScrollIndicator:", 0);
    -[SBRootFolderViewPageManagementLayoutManager setPageManagementScrollView:](self, "setPageManagementScrollView:", v25);
    goto LABEL_16;
  }
  -[SBRootFolderViewPageManagementLayoutManager turnOffIconViewRazterizationForNormalSizeListViews](self, "turnOffIconViewRazterizationForNormalSizeListViews");
  if (objc_msgSend(v24, "isHidden"))
  {
    v66 = objc_msgSend(v8, "precedingVisibleListIndexBeforeIndex:", v18);
    if (v66 == 0x7FFFFFFFFFFFFFFFLL)
      v66 = objc_msgSend(v8, "nextVisibleListIndexAfterIndex:", v18);
    objc_msgSend(v8, "listAtIndex:", v66);
    v67 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v157, "setCurrentPageIndex:animated:", objc_msgSend(v157, "pageIndexForIconListModelIndex:", v66), 0);
    v24 = (void *)v67;
  }
  v141 = (void *)v13;
  objc_msgSend(v11, "setEditing:", 0);
  objc_msgSend(v11, "updateEditingStateAnimated:", v149 != 0);
  objc_msgSend(v11, "model");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "removeListObserver:", self);
  if (v149)
  {
    -[NSMapTable objectForKey:](self->_iconViewControllersByListModel, "objectForKey:", v24);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "listView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "addSubview:", v146);
    objc_msgSend(v146, "setAlpha:", 0.0);
    objc_msgSend(v70, "removeIconViewConfigurationOption:", 2);
    objc_msgSend(v70, "enumerateIconViewsUsingBlock:", &__block_literal_global_50);

  }
  else
  {
    -[SBRootFolderViewPageManagementLayoutManager cleanUpViewsInFolderView:](self, "cleanUpViewsInFolderView:", v157);
  }
LABEL_72:

  v132 = -[SBRootFolderViewPageManagementLayoutManager transitionCount](self, "transitionCount") + 1;
  -[SBRootFolderViewPageManagementLayoutManager setTransitionCount:](self, "setTransitionCount:");
  -[NSMapTable objectForKey:](self->_iconViewControllersByListModel, "objectForKey:", v24);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_pageIconsByListModel, "objectForKey:", v24);
  v103 = objc_claimAutoreleasedReturnValue();
  v138 = v102;
  objc_msgSend(v102, "listView");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = (void *)v103;
  -[SBIconListView coordinateForIcon:](self->_rootListView, "coordinateForIcon:", v103);
  v105 = v104;
  v106 = -[SBIconListView iconColumnsForCurrentOrientation](self->_rootListView, "iconColumnsForCurrentOrientation");
  if (v106)
  {
    v107 = v106;
    v108 = 0;
    do
    {
      -[SBIconListView iconViewForCoordinate:](self->_rootListView, "iconViewForCoordinate:", ++v108, v105);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconListView bringSubviewToFront:](self->_rootListView, "bringSubviewToFront:", v109);

    }
    while (v107 != v108);
  }
  v110 = v24;
  if (v149)
  {
    -[SBRootFolderViewPageManagementLayoutManager setActiveTransitionCount:](self, "setActiveTransitionCount:", v135 + 1);
    -[SBRootFolderViewPageManagementLayoutManager setLatestActiveTransitionAnimator:](self, "setLatestActiveTransitionAnimator:", v149);
  }
  if (v152)
    v111 = 1.0;
  else
    v111 = 0.0;
  if (v152)
    v112 = 0.0;
  else
    v112 = 1.0;
  v113 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_2;
  aBlock[3] = &unk_1E8D8AC50;
  v136 = v149;
  v179 = v136;
  v180 = self;
  v187[328] = v152;
  v114 = v157;
  v181 = v114;
  v185 = v112;
  v158 = v20;
  v182 = v158;
  v186 = v111;
  v134 = v147;
  v183 = v134;
  v148 = v139;
  v184 = v148;
  memcpy(v187, __src, 0x148uLL);
  v140 = _Block_copy(aBlock);
  if (v152)
  {
    if (v149)
    {
      v177[0] = v113;
      v177[1] = 3221225472;
      v177[2] = __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_4;
      v177[3] = &unk_1E8D84C50;
      v177[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v177, 0, 0.2);
      v115 = -[SBIconListViewDominoPivotAnimator initWithPivotIcon:]([SBIconListViewDominoPivotAnimator alloc], "initWithPivotIcon:", v145);
      -[SBIconListViewDominoPivotAnimator setDelegate:](v115, "setDelegate:", self);
      objc_msgSend(v11, "setIconsNeedLayout");
      -[SBRootFolderViewPageManagementLayoutManager setLayoutAction:](self, "setLayoutAction:", 1);
      objc_msgSend(v11, "layoutIconsIfNeededUsingAnimator:options:", v115, 0);
      -[SBRootFolderViewPageManagementLayoutManager setLayoutAction:](self, "setLayoutAction:", 0);

    }
    else
    {
      -[SBRootFolderViewPageManagementLayoutManager makeMaterialViewsVisible](self, "makeMaterialViewsVisible");
    }
  }
  v151 = v25;
  v165[0] = v113;
  v165[1] = 3221225472;
  v165[2] = __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_5;
  v165[3] = &unk_1E8D8AC78;
  v176 = v152;
  v173 = v111;
  v165[4] = self;
  v166 = v8;
  v167 = v110;
  v116 = v114;
  v168 = v116;
  v117 = v11;
  v169 = v117;
  v170 = v153;
  v174 = v155;
  v118 = v8;
  v119 = v130;
  v171 = v119;
  v175 = v112;
  v120 = v140;
  v172 = v120;
  v156 = v153;
  v154 = v110;
  v121 = v118;
  objc_msgSend(v136, "addAnimations:", v165);
  if (!v149)
  {
    objc_msgSend(v116, "setIncludesHiddenIconListPages:", 0);
    -[SBRootFolderViewPageManagementLayoutManager _updateCloseBoxVisibilityWithAnimation:](self, "_updateCloseBoxVisibilityWithAnimation:", 0);
    v120[2](v120);
  }
  v159[0] = MEMORY[0x1E0C809B0];
  v159[1] = 3221225472;
  v159[2] = __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_8;
  v159[3] = &unk_1E8D8ACA0;
  v162 = v116;
  v163 = v132;
  v159[4] = self;
  v160 = v117;
  v164 = v152;
  v161 = v119;
  v122 = v116;
  v123 = v119;
  v124 = v117;
  objc_msgSend(v136, "addCompletion:", v159);
  if (!v149 && v152)
    -[SBRootFolderViewPageManagementLayoutManager rasterizeIconViewsForImprovedLegibilityInScaledDownListViews](self, "rasterizeIconViewsForImprovedLegibilityInScaledDownListViews");

}

void __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char isKindOfClass;

  v3 = a2;
  objc_msgSend(v3, "customIconImageViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "bs_addChildViewController:", v4);
    SBLogRootController();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

    objc_opt_self();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      objc_msgSend(v4, "setForcesVisible:", 1);
  }
  objc_msgSend(v3, "setCustomIconImageViewControllerPresentationMode:", 0);

}

void __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_31(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setIconLabelAlpha:", 0.0);
  objc_msgSend(v2, "layoutIfNeeded");

}

void __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[336];

  +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconEditingSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultSpringDuration");
  v5 = v4;
  objc_msgSend(v3, "defaultSpringDampingRatio");
  v7 = v6;
  v8 = objc_alloc(MEMORY[0x1E0DC3F38]);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_3;
  v16 = &unk_1E8D8AC50;
  v9 = *(id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(void **)(a1 + 48);
  v17 = v9;
  v18 = v10;
  v25[328] = *(_BYTE *)(a1 + 424);
  v19 = v11;
  v23 = *(_QWORD *)(a1 + 80);
  v20 = *(id *)(a1 + 56);
  v24 = *(_QWORD *)(a1 + 88);
  v21 = *(id *)(a1 + 64);
  v22 = *(id *)(a1 + 72);
  memcpy(v25, (const void *)(a1 + 96), 0x148uLL);
  v12 = (void *)objc_msgSend(v8, "initWithDuration:dampingRatio:animations:", &v13, v5, v7);
  objc_msgSend(v12, "startAnimation", v13, v14, v15, v16);

}

uint64_t __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  uint64_t result;
  double v7;
  double v8;
  double v9;
  double v10;
  CGAffineTransform v11;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "dockOffscreenAssertion");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = 1.0;
    if (!*(_BYTE *)(a1 + 424))
      v4 = 0.0;
    objc_msgSend(v2, "setDockOffscreenFraction:", v4);
    objc_msgSend(v3, "layoutIfNeededForDockOffscreenFractionChanged");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "dockView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", *(double *)(a1 + 80));
  }

  objc_msgSend(*(id *)(a1 + 56), "setAlpha:", *(double *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 64), "setAlpha:", *(double *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 48), "scrollAccessoryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", *(double *)(a1 + 80));

  result = objc_msgSend(*(id *)(a1 + 72), "setAlpha:", *(double *)(a1 + 80));
  if (*(_QWORD *)(a1 + 32))
  {
    UIRectGetCenter();
    v8 = v7;
    v10 = v9;
    if (*(_BYTE *)(a1 + 424))
    {
      memset(&v11, 0, sizeof(v11));
      CGAffineTransformMakeScale(&v11, 0.01, 0.01);
      objc_msgSend(*(id *)(a1 + 72), "setBounds:", 0.0, 0.0, *(double *)(a1 + 184) * v11.c + v11.a * *(double *)(a1 + 176), *(double *)(a1 + 184) * v11.d + v11.b * *(double *)(a1 + 176));
      return objc_msgSend(*(id *)(a1 + 72), "setCenter:", v8, -v10);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 72), "setBounds:", 0.0, 0.0, *(double *)(a1 + 176), *(double *)(a1 + 184));
      return objc_msgSend(*(id *)(a1 + 72), "setCenter:", v8, v10);
    }
  }
  return result;
}

uint64_t __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "makeMaterialViewsVisible");
}

void __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_5(uint64_t a1)
{
  void *v2;
  float minimum;
  float maximum;
  float preferred;
  void *v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  CAFrameRateRange v22;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v22 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v22.minimum;
  maximum = v22.maximum;
  preferred = v22.preferred;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_6;
  v10[3] = &unk_1E8D8AC78;
  v21 = *(_BYTE *)(a1 + 120);
  v6 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v10[1] = 3221225472;
  v18 = *(_QWORD *)(a1 + 96);
  v11 = v6;
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 64);
  v15 = *(id *)(a1 + 72);
  v19 = *(_QWORD *)(a1 + 104);
  v16 = *(id *)(a1 + 80);
  v20 = *(_QWORD *)(a1 + 112);
  v17 = *(id *)(a1 + 88);
  *(float *)&v7 = minimum;
  *(float *)&v8 = maximum;
  *(float *)&v9 = preferred;
  objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114129, v10, v7, v8, v9);

}

uint64_t __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_6(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double Width;
  CGFloat v24;
  double v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  _QWORD v36[5];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;
  CGRect v48;
  CGRect v49;

  v47 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 120))
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v42 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setScalesListView:", 0);
          objc_msgSend(v8, "listBackgroundView");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setWeighting:", *(double *)(a1 + 96));
          objc_msgSend(v7, "listModel");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(*(id *)(a1 + 32), "folderListIndexToAnimateOutForList:inFolder:avoidingList:", v10, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
          if (v11 == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v8, "view");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setAlpha:", 0.0);
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 56), "_frameForIconListAtIndex:", v11);
            objc_msgSend(*(id *)(a1 + 64), "convertRect:fromView:", *(_QWORD *)(a1 + 72));
            v14 = v13;
            v16 = v15;
            v18 = v17;
            v20 = v19;
            objc_msgSend(*(id *)(a1 + 64), "iconViewForIcon:", v7);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "iconImageInfo");
            v22 = v21;
            v48.origin.x = v14;
            v48.origin.y = v16;
            v48.size.width = v18;
            v48.size.height = v20;
            Width = CGRectGetWidth(v48);
            v49.origin.x = v14;
            v49.origin.y = v16;
            v49.size.width = v18;
            v49.size.height = v20;
            v24 = CGRectGetHeight(v49) + *(double *)(a1 + 104);
            objc_msgSend(v12, "_continuousCornerRadius");
            objc_msgSend(v12, "setIconImageInfo:", Width, v24, v22, v25);
            objc_msgSend(v12, "layoutIfNeeded");
            UIRectGetCenter();
            objc_msgSend(v12, "setCenter:");
          }

          if (objc_msgSend(v10, "isHidden"))
          {
            objc_msgSend(v8, "listView");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setAlpha:", *(double *)(a1 + 96));

          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v4);
    }

    v27 = objc_msgSend(*(id *)(a1 + 56), "isEditing");
    objc_msgSend(*(id *)(a1 + 80), "setEditing:", v27);
    objc_msgSend(*(id *)(a1 + 80), "updateEditingStateAnimated:", 1);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(*(id *)(a1 + 56), "additionalIconListViews");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v38 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
          objc_msgSend(v33, "setEditing:", v27);
          objc_msgSend(v33, "updateEditingStateAnimated:", 1);
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v30);
    }

    objc_msgSend(*(id *)(a1 + 56), "setIncludesHiddenIconListPages:", 0);
  }
  v34 = *(void **)(a1 + 80);
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_7;
  v36[3] = &__block_descriptor_40_e27_v32__0__SBIconView_8Q16_B24l;
  v36[4] = *(_QWORD *)(a1 + 112);
  objc_msgSend(v34, "enumerateIconViewsUsingBlock:", v36);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
}

uint64_t __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIconLabelAlpha:", *(double *)(a1 + 32));
}

void __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_8(uint64_t a1)
{
  _BOOL8 v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setActiveTransitionCount:", objc_msgSend(*(id *)(a1 + 32), "activeTransitionCount") - 1);
  objc_msgSend(*(id *)(a1 + 32), "setLatestActiveTransitionAnimator:", 0);
  if (objc_msgSend(*(id *)(a1 + 32), "transitionCount") == *(_QWORD *)(a1 + 64))
  {
    if (*(_BYTE *)(a1 + 72))
      v2 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) != 0;
    else
      v2 = 0;
    objc_msgSend(*(id *)(a1 + 40), "setEditing:", v2);
    objc_msgSend(*(id *)(a1 + 40), "updateEditingStateAnimated:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_updateCloseBoxVisibilityWithAnimation:", 0);
    if (*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(*(id *)(a1 + 48), "addIconViewConfigurationOption:", 2);
      objc_msgSend(*(id *)(a1 + 48), "enumerateIconViewsUsingBlock:", &__block_literal_global_38_0);
      objc_msgSend(*(id *)(a1 + 32), "rasterizeIconViewsForImprovedLegibilityInScaledDownListViews");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "cleanUpViewsInFolderView:", *(_QWORD *)(a1 + 56));
      objc_msgSend(*(id *)(a1 + 32), "alertPresentationViewController");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

    }
  }
}

uint64_t __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIconLabelAlpha:", 1.0);
}

- (void)rasterizeIconViewsForImprovedLegibilityInScaledDownListViews
{
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_iconViewControllersByIcon;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        -[NSMapTable objectForKey:](self->_iconViewControllersByIcon, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "listView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = v7;
        v11[1] = 3221225472;
        v11[2] = __107__SBRootFolderViewPageManagementLayoutManager_rasterizeIconViewsForImprovedLegibilityInScaledDownListViews__block_invoke;
        v11[3] = &unk_1E8D87340;
        v11[4] = self;
        objc_msgSend(v10, "enumerateIconViewsUsingBlock:", v11);

        ++v8;
      }
      while (v5 != v8);
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

void __107__SBRootFolderViewPageManagementLayoutManager_rasterizeIconViewsForImprovedLegibilityInScaledDownListViews__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  SBHPageManagementIconViewScalingAttributes *v4;
  void *v5;
  uint64_t v6;
  double v7;
  SBHPageManagementIconViewScalingAttributes *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_canRasterizeIconView:"))
  {
    objc_msgSend(v14, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = [SBHPageManagementIconViewScalingAttributes alloc];
    objc_msgSend(v3, "minificationFilter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "shouldRasterize");
    objc_msgSend(v3, "rasterizationScale");
    v8 = -[SBHPageManagementIconViewScalingAttributes initWithMinificationFilter:shouldRasterize:rasterizationScale:allowsEdgeAntialiasing:](v4, "initWithMinificationFilter:shouldRasterize:rasterizationScale:allowsEdgeAntialiasing:", v5, v6, objc_msgSend(v3, "allowsEdgeAntialiasing"), v7);

    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 32);
      *(_QWORD *)(v11 + 32) = v10;

      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    }
    objc_msgSend(v9, "setObject:forKey:", v8, v14);
    objc_msgSend(v3, "setMinificationFilter:", *MEMORY[0x1E0CD2B98]);
    objc_msgSend(v3, "setShouldRasterize:", 1);
    objc_msgSend(v14, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "displayScale");
    objc_msgSend(v3, "setRasterizationScale:");

    objc_msgSend(v3, "setAllowsEdgeAntialiasing:", 1);
  }

}

- (void)turnOffIconViewRazterizationForNormalSizeListViews
{
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_initialScalingAttributesByIconView;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_initialScalingAttributesByIconView, "objectForKey:", v8, (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "layer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "minificationFilter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setMinificationFilter:", v11);

        objc_msgSend(v10, "setShouldRasterize:", objc_msgSend(v9, "shouldRasterize"));
        objc_msgSend(v9, "rasterizationScale");
        objc_msgSend(v10, "setRasterizationScale:");
        objc_msgSend(v10, "setAllowsEdgeAntialiasing:", objc_msgSend(v9, "allowsEdgeAntialiasing"));

      }
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)makeMaterialViewsVisible
{
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_iconViewControllersByIcon;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        -[NSMapTable objectForKey:](self->_iconViewControllersByIcon, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7), (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "listBackgroundView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "toggleButtonBackgroundView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setWeighting:", 1.0);
        objc_msgSend(v10, "setWeighting:", 1.0);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)makeRootListViewInFolderView:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  int v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  BOOL v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  SBIconListModel *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  uint64_t v57;
  double v58;
  SBIconListModel *v59;
  double v60;
  void *v61;
  uint64_t v62;
  double v63;
  uint64_t v64;
  double v65;
  double v66;
  void *v67;
  uint64_t v68;
  double v69;
  double v70;
  void *v71;
  uint64_t v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  SBIconListGridLayoutConfiguration *v81;
  SBIconListGridLayoutConfiguration *v82;
  SBIconListGridLayout *v83;
  SBHCustomIconListLayoutProvider *v84;
  void *v85;
  SBHCustomIconListLayoutProvider *v86;
  SBIconListModel *v87;
  SBIconListView *v88;
  void *v89;
  void *v90;
  void *v91;
  SBIconListView *v92;
  void *v93;
  void *v94;
  void *v95;
  CGFloat rect;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  unint64_t v105;
  void *v106;
  id v107;
  void *v108;
  id v109;
  id v111;
  uint64_t v112;
  void *v113;
  double v114;
  double v115;
  double v116;
  id v117;
  void *v118;
  double v119;
  void *v120;
  _QWORD v121[4];
  SBIconListView *v122;
  _QWORD v123[4];
  id v124;
  id v125;
  id v126;
  SBRootFolderViewPageManagementLayoutManager *v127;
  id v128;
  SBIconListModel *v129;
  double v130;
  double v131;
  double v132;
  double v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  double v138;
  double v139;
  double v140;
  BOOL v141;
  char v142;
  const __CFString *v143;
  _QWORD v144[3];
  CGRect v145;
  CGRect v146;

  v144[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "folder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addFolderObserver:", self);
  -[SBRootFolderViewPageManagementLayoutManager activeFocusMode](self, "activeFocusMode");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v108, "customizedHomeScreenPagesEnabled");
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v6, "visibleListCount");
  else
    v9 = objc_msgSend(v6, "listCount");
  v10 = v9;
  v11 = objc_msgSend(v6, "trailingEmptyListCount");
  v12 = v10 - v11;
  if (v11)
    v13 = v10 == v11;
  else
    v13 = 0;
  if (v13)
    ++v12;
  v14 = 2;
  if (v12 >= 5)
    v14 = 3;
  if (v12 >= 3)
    v15 = v14;
  else
    v15 = v12;
  if (v12 % v15)
    v16 = v12 / v15 + 1;
  else
    v16 = v12 / v15;
  v17 = -[SBIconListModel initWithFolder:gridSize:]([SBIconListModel alloc], "initWithFolder:gridSize:", 0, ((_DWORD)v16 << 16) | (unint64_t)(unsigned __int16)v15);
  -[SBIconListModel setAllowsRotatedLayout:](v17, "setAllowsRotatedLayout:", 0);
  -[SBIconListModel addListObserver:](v17, "addListObserver:", self);
  objc_msgSend(v5, "currentIconListModel");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v99 = v19;
  v100 = v18;
  rect = v20;
  v98 = v21;
  objc_msgSend(v5, "safeAreaInsets");
  v116 = v22;
  objc_msgSend(v5, "_iconListViewSize");
  v24 = v23;
  v26 = v25;
  objc_msgSend(v5, "rootListLayout");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstIconListView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "orientation");

  v112 = v29;
  objc_msgSend(v27, "layoutInsetsForOrientation:", v29);
  v31 = v30;
  v33 = v32;
  v119 = v34;
  SBHIconListLayoutIconImageInfoForGridSizeClass(v27, CFSTR("SBHIconGridSizeClassSmall"));
  v36 = v35;
  v113 = v27;
  SBHIconListLayoutIconImageInfoForGridSizeClass(v27, CFSTR("SBHIconGridSizeClassDefault"));
  v38 = (v36 - v37) * 0.5;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "userInterfaceIdiom");

  v41 = v33;
  if ((v40 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v102 = v26 - v31 - v119 + v38 * 2.0 + (v31 - v38) * 2.0;
  }
  else
  {
    objc_msgSend(v5, "maxDockHeight");
    v102 = v26 - v116 - v42;
  }
  objc_msgSend(v5, "rootFolderVisualConfiguration");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0.0;
  v44 = 0.0;
  if (-[SBRootFolderViewPageManagementLayoutManager allowsPageHiding](self, "allowsPageHiding"))
  {
    objc_msgSend(v120, "pageManagementPageCheckboxDiameter");
    v43 = v45;
    objc_msgSend(v120, "pageManagementPageCheckboxVerticalMargin");
    v44 = v46;
  }
  v105 = v16;
  v103 = v31;
  v101 = v43;
  if (v15 >= 2)
  {
    if (v15 == 2)
    {
      if (v16 < 2)
        v47 = 1;
      else
        v47 = 2;
    }
    else if (v16 >= 3)
    {
      if (v16 == 3)
        v47 = 4;
      else
        v47 = 5;
    }
    else
    {
      v47 = 3;
    }
  }
  else
  {
    v47 = 0;
  }
  -[SBRootFolderViewPageManagementLayoutManager setLayoutConfiguration:](self, "setLayoutConfiguration:", v47);
  objc_msgSend(v120, "pageManagementLayoutMetricsForLayoutConfiguration:", v47);
  v104 = v48;
  v114 = v50;
  v115 = v49;
  v52 = v51;
  v97 = v24 * 0.03 * 0.5;
  v53 = v24;
  v54 = v24 * v51;
  v55 = v26 * v51;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "userInterfaceIdiom");

  v58 = 0.0;
  if ((v57 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    v58 = -(v103 * v52 - (v97 + v41 * v52));
  v123[0] = MEMORY[0x1E0C809B0];
  v123[1] = 3221225472;
  v123[2] = __85__SBRootFolderViewPageManagementLayoutManager_makeRootListViewInFolderView_animated___block_invoke;
  v123[3] = &unk_1E8D8ACC8;
  v124 = v6;
  v117 = v5;
  v125 = v117;
  v141 = a4;
  v107 = v106;
  v126 = v107;
  v127 = self;
  v109 = v108;
  v128 = v109;
  v142 = v8;
  v130 = v53;
  v131 = v26;
  v132 = v54;
  v133 = v55;
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  v137 = 0u;
  v138 = v58;
  v139 = v101;
  v140 = v44;
  v59 = v17;
  v129 = v59;
  v111 = v124;
  objc_msgSend(v124, "enumerateListsWithOptions:usingBlock:", 4, v123);
  v60 = v101 + v44;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "userInterfaceIdiom");

  if ((v62 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v63 = v60 + v102 * v52;
    v64 = v112;
    v65 = v114;
  }
  else
  {
    v63 = v60 + v102 * (v52 + 0.03);
    objc_msgSend(v118, "displayCornerRadius");
    v64 = v112;
    v65 = v114;
    if ((BSFloatIsZero() & 1) == 0)
      objc_msgSend(v113, "iconImageInfo");
  }
  v66 = 0.0;
  switch(v47)
  {
    case 0:
    case 1:
      goto LABEL_41;
    case 2:
    case 3:
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v67, "userInterfaceIdiom");

      if ((v68 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
LABEL_41:
        v69 = *MEMORY[0x1E0DC49E8];
        v66 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
        v65 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
        v70 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
        goto LABEL_52;
      }
      v145.origin.x = v100 + 0.0;
      v145.origin.y = v99 + v116;
      v145.size.width = rect;
      v145.size.height = v98 - (v116 + 0.0);
      v73 = CGRectGetHeight(v145) - v63 - v115 - v63 - v65;
      if (-[SBRootFolderViewPageManagementLayoutManager allowsPageHiding](self, "allowsPageHiding"))
        goto LABEL_51;
      objc_msgSend(v120, "pageManagementPageCheckboxDiameter");
      v75 = v74;
      objc_msgSend(v120, "pageManagementPageCheckboxVerticalMargin");
      v77 = v76 + v76;
      v78 = 2.0;
      goto LABEL_50;
    case 4:
    case 5:
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v71, "userInterfaceIdiom");

      if ((v72 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        v69 = 140.0;
LABEL_45:
        v70 = 0.0;
      }
      else
      {
        v146.origin.x = v100 + 0.0;
        v146.origin.y = v99 + v116;
        v146.size.width = rect;
        v146.size.height = v98 - (v116 + 0.0);
        v73 = CGRectGetHeight(v146) - v63 - v115 - v63 - v115 - v63 - v65;
        if (!-[SBRootFolderViewPageManagementLayoutManager allowsPageHiding](self, "allowsPageHiding"))
        {
          objc_msgSend(v120, "pageManagementPageCheckboxDiameter");
          v75 = v79;
          objc_msgSend(v120, "pageManagementPageCheckboxVerticalMargin");
          v78 = 3.0;
          v77 = v80 * 3.0;
LABEL_50:
          v73 = v73 - (v77 + v75 * v78);
        }
LABEL_51:
        v69 = v116 + v73;
        v70 = 0.0;
        v65 = v114;
      }
LABEL_52:
      v81 = objc_alloc_init(SBIconListGridLayoutConfiguration);
      v82 = v81;
      if ((unint64_t)(v64 - 1) > 1)
      {
        -[SBIconListGridLayoutConfiguration setNumberOfLandscapeColumns:](v81, "setNumberOfLandscapeColumns:", v15);
        -[SBIconListGridLayoutConfiguration setNumberOfLandscapeRows:](v82, "setNumberOfLandscapeRows:", v105);
        -[SBIconListGridLayoutConfiguration setLandscapeLayoutInsets:](v82, "setLandscapeLayoutInsets:", v69, v66, v65, v70);
      }
      else
      {
        -[SBIconListGridLayoutConfiguration setNumberOfPortraitColumns:](v81, "setNumberOfPortraitColumns:", v15);
        -[SBIconListGridLayoutConfiguration setNumberOfPortraitRows:](v82, "setNumberOfPortraitRows:", v105);
        -[SBIconListGridLayoutConfiguration setPortraitLayoutInsets:](v82, "setPortraitLayoutInsets:", v69, v66, v65, v70);
      }
      objc_msgSend(v118, "displayScale");
      UISizeRoundToScale();
      -[SBIconListGridLayoutConfiguration setIconImageInfo:](v82, "setIconImageInfo:");
      v83 = -[SBIconListGridLayout initWithLayoutConfiguration:]([SBIconListGridLayout alloc], "initWithLayoutConfiguration:", v82);
      v84 = [SBHCustomIconListLayoutProvider alloc];
      v143 = CFSTR("SBRootFolderViewPageManagement");
      v144[0] = v83;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v144, &v143, 1);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = -[SBHCustomIconListLayoutProvider initWithListLayouts:](v84, "initWithListLayouts:", v85);

      v87 = v59;
      v88 = -[SBIconListView initWithModel:layoutProvider:iconLocation:orientation:iconViewProvider:]([SBIconListView alloc], "initWithModel:layoutProvider:iconLocation:orientation:iconViewProvider:", v59, v86, CFSTR("SBRootFolderViewPageManagement"), v64, self);
      objc_msgSend(v117, "traitCollection");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "sbh_iconImageStyleConfiguration");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconListView setOverrideIconImageStyleConfiguration:](v88, "setOverrideIconImageStyleConfiguration:", v90);
      v91 = (void *)*MEMORY[0x1E0DC4730];
      v121[0] = MEMORY[0x1E0C809B0];
      v121[1] = 3221225472;
      v121[2] = __85__SBRootFolderViewPageManagementLayoutManager_makeRootListViewInFolderView_animated___block_invoke_3;
      v121[3] = &unk_1E8D84C50;
      v92 = v88;
      v122 = v92;
      objc_msgSend(v91, "_performBlockAfterCATransactionCommits:", v121);
      -[SBRootFolderViewPageManagementLayoutManager iconDragManager](self, "iconDragManager");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconListView setDragDelegate:](v92, "setDragDelegate:", v93);

      -[SBIconListView setAutomaticallyAdjustsLayoutMetricsToFit:](v92, "setAutomaticallyAdjustsLayoutMetricsToFit:", 0);
      -[SBIconListView setIconSpacing:](v92, "setIconSpacing:", v104, v115);
      -[SBIconListView setLayoutInsetsMode:](v92, "setLayoutInsetsMode:", 2);
      -[SBIconListView setIconViewConfigurationOptions:](v92, "setIconViewConfigurationOptions:", 82);
      if (self->_allowsEditing)
        -[SBIconListView setIconDragTypeIdentifier:](v92, "setIconDragTypeIdentifier:", CFSTR("com.apple.SpringBoardHome.PageReordering"));
      objc_msgSend(v117, "bounds");
      -[SBIconListView setFrame:](v92, "setFrame:");
      -[SBRootFolderViewPageManagementLayoutManager setRootListView:](self, "setRootListView:", v92);
      -[SBRootFolderViewPageManagementLayoutManager setPageManagementListModel:](self, "setPageManagementListModel:", v87);
      objc_msgSend(v117, "window");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "rootViewController");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBRootFolderViewPageManagementLayoutManager setAlertPresentationViewController:](self, "setAlertPresentationViewController:", v95);

      return;
    default:
      v69 = 0.0;
      v65 = 0.0;
      goto LABEL_45;
  }
}

void __85__SBRootFolderViewPageManagementLayoutManager_makeRootListViewInFolderView_animated___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  SBHPageManagementCellViewController *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  SBHPageManagementCellViewController *v19;
  SBHPageManagementIcon *v20;
  _OWORD v21[7];
  uint64_t v22;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isTrailingEmptyList:", v6))
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "iconListViewWithList:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v7, "setEditing:", 0);
      objc_msgSend(v8, "updateEditingStateAnimated:", *(unsigned __int8 *)(a1 + 200));
      objc_msgSend(v8, "ignoreNextWindowChange");
      objc_msgSend(*(id *)(a1 + 40), "_removeIconListView:purge:", v8, 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_createIconListViewForList:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (*(_BYTE *)(a1 + 200) && *(id *)(a1 + 48) == v6)
      v9 = 20;
    else
      v9 = 22;
    objc_msgSend(v8, "addIconViewConfigurationOption:", v9);
    objc_msgSend(v8, "showAllIcons");
    objc_msgSend(v8, "enumerateKnownIconViewsUsingBlock:", &__block_literal_global_42_0);
    v10 = (void *)objc_msgSend(*(id *)(a1 + 56), "newCellBackgroundMaterialViewInFolderView:initialWeighting:", *(_QWORD *)(a1 + 40), 0.0);
    v11 = (void *)objc_msgSend(*(id *)(a1 + 56), "newCellBackgroundMaterialViewInFolderView:initialWeighting:", *(_QWORD *)(a1 + 40), 0.0);
    objc_msgSend(v10, "setGroupNameBase:", CFSTR("List-And-Toggle-Background"));
    objc_msgSend(v11, "setGroupNameBase:", CFSTR("List-And-Toggle-Background"));
    v12 = objc_msgSend(*(id *)(a1 + 64), "wantsListVisible:", v6);
    if (!*(_BYTE *)(a1 + 201) || v12)
    {
      v13 = [SBHPageManagementCellViewController alloc];
      v14 = *(_QWORD *)(a1 + 32);
      v15 = objc_msgSend(*(id *)(a1 + 56), "allowsPageHiding");
      v16 = *(_OWORD *)(a1 + 160);
      v21[4] = *(_OWORD *)(a1 + 144);
      v21[5] = v16;
      v21[6] = *(_OWORD *)(a1 + 176);
      v22 = *(_QWORD *)(a1 + 192);
      v17 = *(_OWORD *)(a1 + 96);
      v21[0] = *(_OWORD *)(a1 + 80);
      v21[1] = v17;
      v18 = *(_OWORD *)(a1 + 128);
      v21[2] = *(_OWORD *)(a1 + 112);
      v21[3] = v18;
      v19 = -[SBHPageManagementCellViewController initWithListView:listBackgroundView:toggleButtonBackgroundView:folder:metrics:toggleButtonAllowed:](v13, "initWithListView:listBackgroundView:toggleButtonBackgroundView:folder:metrics:toggleButtonAllowed:", v8, v10, v11, v14, v21, v15);
      -[SBHPageManagementCellViewController setDelegate:](v19, "setDelegate:", *(_QWORD *)(a1 + 56));
      v20 = -[SBHPageManagementIcon initWithListModel:]([SBHPageManagementIcon alloc], "initWithListModel:", v6);
      objc_msgSend(*(id *)(a1 + 72), "addIcon:", v20);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "setObject:forKey:", v19, v20);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 16), "setObject:forKey:", v19, v6);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 24), "setObject:forKey:", v20, v6);

    }
  }

}

void __85__SBRootFolderViewPageManagementLayoutManager_makeRootListViewInFolderView_animated___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(a2, "customIconImageViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7 = v2;
    v3 = objc_opt_class();
    v4 = v7;
    if (v3)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5 = v4;
      else
        v5 = 0;
    }
    else
    {
      v5 = 0;
    }
    v6 = v5;

    objc_msgSend(v6, "setWantsEditingDisplayStyle:animated:", 1, 0);
    v2 = v7;
  }

}

uint64_t __85__SBRootFolderViewPageManagementLayoutManager_makeRootListViewInFolderView_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOverrideIconImageStyleConfiguration:", 0);
}

- (id)newCellBackgroundMaterialViewInFolderView:(id)a3 initialWeighting:(double)a4
{
  void *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend(a3, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBIconView componentBackgroundViewOfType:compatibleWithTraitCollection:initialWeighting:](SBIconView, "componentBackgroundViewOfType:compatibleWithTraitCollection:initialWeighting:", 2, v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __106__SBRootFolderViewPageManagementLayoutManager_newCellBackgroundMaterialViewInFolderView_initialWeighting___block_invoke;
  v8[3] = &__block_descriptor_40_e8_d16__0d8l;
  v8[4] = 0x3FC0000000000000;
  objc_msgSend(v6, "setBackdropScaleAdjustment:", v8);
  return v6;
}

double __106__SBRootFolderViewPageManagementLayoutManager_newCellBackgroundMaterialViewInFolderView_initialWeighting___block_invoke(uint64_t a1, double a2)
{
  double v2;
  double result;
  double v4;

  v2 = *(double *)(a1 + 32);
  result = v2 / a2;
  v4 = v2 * 4.0;
  if (result > v4)
    return v4;
  return result;
}

- (unint64_t)folderListIndexToAnimateOutForList:(id)a3 inFolder:(id)a4 avoidingList:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  void *v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v8, "indexOfList:", v7);
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_25;
  v12 = v10;
  objc_msgSend(v8, "listAtIndex:", v10);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v7 != v9)
  {
    v14 = v9;
    if ((id)v13 == v9)
    {
LABEL_10:

      goto LABEL_11;
    }
  }
  v15 = v12 - 1;
  v14 = (void *)v13;
  while (objc_msgSend(v14, "isHidden"))
  {
    if (v15 == -1)
      goto LABEL_10;

    objc_msgSend(v8, "listAtIndex:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v16;
    --v15;
    if (v7 != v9 && (id)v16 == v9)
    {
      v14 = v9;
      goto LABEL_10;
    }
  }
  v11 = objc_msgSend(v8, "indexOfList:", v14);

  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_11:
    v17 = objc_msgSend(v8, "listCount");
    v18 = v12 + 1;
    if (v18 >= v17)
    {
LABEL_16:
      v11 = 0x7FFFFFFFFFFFFFFFLL;
      if (!v9)
        goto LABEL_25;
    }
    else
    {
      v19 = v17;
      while (1)
      {
        objc_msgSend(v8, "listAtIndex:", v18);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        if (v20 == v9)
        {
          v11 = 0x7FFFFFFFFFFFFFFFLL;
          v21 = v9;
          goto LABEL_22;
        }
        v21 = v20;
        if ((objc_msgSend(v20, "isHidden") & 1) == 0)
          break;

        if (v19 == ++v18)
          goto LABEL_16;
      }
      v11 = objc_msgSend(v8, "indexOfList:", v21);
LABEL_22:

      if (!v9)
        goto LABEL_25;
    }
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      v11 = objc_msgSend(v8, "indexOfList:", v9);
  }
LABEL_25:

  return v11;
}

- (void)cleanUpViewsInFolderView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
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
  SBRootFolderViewPageManagementLayoutManager *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _OWORD v46[3];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "folder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBRootFolderViewPageManagementLayoutManager focusModeSymbolView](self, "focusModeSymbolView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "removeFromSuperview");
  -[SBRootFolderViewPageManagementLayoutManager focusModeOptionsButton](self, "focusModeOptionsButton");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "removeFromSuperview");
  objc_msgSend(v4, "widgetButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v46[0] = *MEMORY[0x1E0C9BAA8];
  v46[1] = v7;
  v46[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v6, "setTransform:", v46);
  v30 = v6;
  objc_msgSend(v6, "setAlpha:", 1.0);
  -[SBRootFolderViewPageManagementLayoutManager dockOffscreenAssertion](self, "dockOffscreenAssertion");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "invalidate");
  -[SBRootFolderViewPageManagementLayoutManager setDockOffscreenAssertion:](self, "setDockOffscreenAssertion:", 0);
  objc_msgSend(v4, "dockView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", 1.0);

  -[SBRootFolderViewPageManagementLayoutManager scrollAccessoryBorrowedAssertion](self, "scrollAccessoryBorrowedAssertion");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "invalidate");
  -[SBRootFolderViewPageManagementLayoutManager setScrollAccessoryBorrowedAssertion:](self, "setScrollAccessoryBorrowedAssertion:", 0);
  -[SBRootFolderViewPageManagementLayoutManager pageDotsVisibilityAssertion](self, "pageDotsVisibilityAssertion");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "invalidate");
  v34 = self;
  -[SBRootFolderViewPageManagementLayoutManager setPageDotsVisibilityAssertion:](self, "setPageDotsVisibilityAssertion:", 0);
  objc_msgSend(v4, "setPageControlAlpha:", 1.0);
  v35 = v4;
  v9 = objc_msgSend(v4, "isEditing");
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v33 = v5;
  objc_msgSend(v5, "visibleLists");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v43;
    v14 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(v10);
        -[NSMapTable objectForKey:](v34->_iconViewControllersByListModel, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "listView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "cleanUpListView");
        objc_msgSend(v4, "_addIconListView:atEnd:", v17, 0);
        objc_msgSend(v17, "removeIconViewConfigurationOption:", 22);
        objc_msgSend(v17, "setEditing:", v9);
        objc_msgSend(v17, "updateEditingStateAnimated:", 1);
        v40[0] = v14;
        v40[1] = 3221225472;
        v40[2] = __72__SBRootFolderViewPageManagementLayoutManager_cleanUpViewsInFolderView___block_invoke;
        v40[3] = &unk_1E8D85CC0;
        v41 = v16;
        v18 = v16;
        objc_msgSend(v17, "enumerateKnownIconViewsUsingBlock:", v40);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v12);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v4, "additionalIconListViews");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
        objc_msgSend(v24, "setEditing:", v9);
        objc_msgSend(v24, "updateEditingStateAnimated:", 1);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
    }
    while (v21);
  }

  -[SBRootFolderViewPageManagementLayoutManager rootListView](v34, "rootListView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "removeFromSuperview");
  -[SBRootFolderViewPageManagementLayoutManager pageManagementScrollView](v34, "pageManagementScrollView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "removeFromSuperview");
  objc_msgSend(v35, "setAutomaticallyCreatesIconListViews:", 1);

}

void __72__SBRootFolderViewPageManagementLayoutManager_cleanUpViewsInFolderView___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  char isKindOfClass;

  objc_msgSend(a2, "customIconImageViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    SBLogRootController();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __72__SBRootFolderViewPageManagementLayoutManager_cleanUpViewsInFolderView___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

    objc_msgSend(*(id *)(a1 + 32), "bs_removeChildViewController:", v3);
    v11 = objc_opt_class();
    v12 = v3;
    if (v11)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    v14 = v13;

    objc_msgSend(v14, "setWantsEditingDisplayStyle:animated:", 0, 1);
    objc_opt_self();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      objc_msgSend(v12, "setForcesVisible:", 0);

  }
}

- (BOOL)pageContainsBookmarkIcons:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "listModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconsOfClass:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "count") != 0;
  return (char)v4;
}

- (id)parentViewControllerForCustomIconImageViewControllerForIconView:(id)a3
{
  id v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  NSMapTable *obj;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_iconViewControllersByIcon;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v22;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v7)
        objc_enumerationMutation(obj);
      -[NSMapTable objectForKey:](self->_iconViewControllersByIcon, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v8));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bs_beginAppearanceTransition:animated:", 1, 0);
      objc_msgSend(v9, "bs_endAppearanceTransition:", 1);
      objc_msgSend(v9, "listView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v18 = &v17;
      v19 = 0x2020000000;
      v20 = 0;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __111__SBRootFolderViewPageManagementLayoutManager_parentViewControllerForCustomIconImageViewControllerForIconView___block_invoke;
      v14[3] = &unk_1E8D85B48;
      v15 = v5;
      v16 = &v17;
      objc_msgSend(v10, "enumerateKnownIconViewsUsingBlock:", v14);
      v11 = *((unsigned __int8 *)v18 + 24);
      if (*((_BYTE *)v18 + 24))
        v3 = v9;

      _Block_object_dispose(&v17, 8);
      if (v11)
        break;
      if (v6 == ++v8)
      {
        v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    v3 = 0;
  }

  return v3;
}

uint64_t __111__SBRootFolderViewPageManagementLayoutManager_parentViewControllerForCustomIconImageViewControllerForIconView___block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  if (*(_QWORD *)(result + 32) == a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)isTrackingActiveOrDroppingIconDrags
{
  void *v2;
  char v3;

  -[SBRootFolderViewPageManagementLayoutManager iconDragManager](self, "iconDragManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTrackingActiveOrDroppingIconDrags");

  return v3;
}

- (BOOL)_canRasterizeIconView:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFolderIcon") ^ 1;

  return v4;
}

- (void)_removePageIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[SBRootFolderViewPageManagementLayoutManager rootListView](self, "rootListView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsEditingAnimation:", 0);

  -[SBRootFolderViewPageManagementLayoutManager rootListView](self, "rootListView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "markIcon:asNeedingAnimation:", v6, 0);
  -[SBRootFolderViewPageManagementLayoutManager rootFolderView](self, "rootFolderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "folder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startCoalescingContentChangesForReason:", CFSTR("SBPageManagementIconCoalesceID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeIcon:options:", v6, 0);
  objc_msgSend(v5, "removeIcon:", v6);
  objc_msgSend(v10, "invalidate");
  objc_msgSend(v7, "setIconsNeedLayout");
  objc_msgSend(v7, "layoutIconsIfNeededWithAnimationType:options:", 2, 1);

}

- (void)backgroundTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  BOOL v13;
  void *v14;
  id v15;
  CGPoint v16;
  CGRect v17;

  v15 = a3;
  -[SBRootFolderViewPageManagementLayoutManager rootListView](self, "rootListView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "locationInView:", v4);
  objc_msgSend(v4, "iconAtPoint:index:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "iconViewForIcon:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "customIconImageViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v15, "locationInView:", v8);
      v10 = v9;
      v12 = v11;
      objc_msgSend(v8, "bounds");
      v16.x = v10;
      v16.y = v12;
      v13 = CGRectContainsPoint(v17, v16);

      if (v13)
        goto LABEL_7;
    }
    else
    {

    }
  }
  -[SBRootFolderViewPageManagementLayoutManager rootFolderView](self, "rootFolderView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "exitPageManagementUIWithCompletionHandler:", 0);

LABEL_7:
}

- (void)focusModeOptionsButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SBRootFolderViewPageManagementLayoutManager activeFocusMode](self, "activeFocusMode", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E98];
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("prefs:root=DO_NOT_DISTURB&path=%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBRootFolderViewPageManagementLayoutManager setCompletionURL:](self, "setCompletionURL:", v8);
  -[SBRootFolderViewPageManagementLayoutManager rootFolderView](self, "rootFolderView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "exitPageManagementUIWithCompletionHandler:", 0);

}

- (void)presentPageDeleteConfirmationAlertForIconView:(id)a3 completion:(id)a4
{
  id v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0DC3450];
  SBHBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("REMOVE_PAGE_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBHBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("REMOVE_PAGE_BODY"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v8, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC3448];
  SBHBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("REMOVE_PAGE_BUTTON"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __104__SBRootFolderViewPageManagementLayoutManager_presentPageDeleteConfirmationAlertForIconView_completion___block_invoke;
  v22[3] = &unk_1E8D8ACF0;
  v23 = v5;
  v15 = v5;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 2, v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addAction:", v16);
  v17 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E8D8E958, CFSTR("SpringBoard"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 1, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addAction:", v20);
  objc_msgSend(v11, "setPreferredAction:", v20);
  -[SBRootFolderViewPageManagementLayoutManager alertPresentationViewController](self, "alertPresentationViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "presentViewController:animated:completion:", v11, 1, 0);

}

uint64_t __104__SBRootFolderViewPageManagementLayoutManager_presentPageDeleteConfirmationAlertForIconView_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)presentSecondPageDeleteConfirmationAlertBookmarksFoundForIconView:(id)a3 completion:(id)a4
{
  id v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0DC3450];
  SBHBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("REMOVE_PAGE_BOOKMARKS_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBHBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("REMOVE_PAGE_BOOKMARKS_BODY"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v8, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC3448];
  SBHBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("REMOVE_PAGE_BUTTON"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __124__SBRootFolderViewPageManagementLayoutManager_presentSecondPageDeleteConfirmationAlertBookmarksFoundForIconView_completion___block_invoke;
  v22[3] = &unk_1E8D8ACF0;
  v23 = v5;
  v15 = v5;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 2, v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addAction:", v16);
  v17 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E8D8E958, CFSTR("SpringBoard"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 1, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addAction:", v20);
  objc_msgSend(v11, "setPreferredAction:", v20);
  -[SBRootFolderViewPageManagementLayoutManager alertPresentationViewController](self, "alertPresentationViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "presentViewController:animated:completion:", v11, 1, 0);

}

uint64_t __124__SBRootFolderViewPageManagementLayoutManager_presentSecondPageDeleteConfirmationAlertBookmarksFoundForIconView_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_allowsCloseBoxForIconView:(id)a3
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  char v7;

  objc_msgSend(a3, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "listModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isHidden");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_updateCloseBoxVisibilityWithAnimation:(int64_t)a3
{
  void *v5;
  _QWORD v6[6];

  -[SBRootFolderViewPageManagementLayoutManager rootListView](self, "rootListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__SBRootFolderViewPageManagementLayoutManager__updateCloseBoxVisibilityWithAnimation___block_invoke;
  v6[3] = &unk_1E8D8AD18;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "enumerateIconViewsUsingBlock:", v6);

}

void __86__SBRootFolderViewPageManagementLayoutManager__updateCloseBoxVisibilityWithAnimation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setAllowsCloseBox:withAnimation:", objc_msgSend(v3, "_allowsCloseBoxForIconView:", v4), *(_QWORD *)(a1 + 40));

}

- (void)folder:(id)a3 listHiddenDidChange:(id)a4
{
  -[SBRootFolderViewPageManagementLayoutManager _updateCloseBoxVisibilityWithAnimation:](self, "_updateCloseBoxVisibilityWithAnimation:", 0, a4);
}

- (id)dequeueReusableIconViewOfClass:(Class)a3
{
  return 0;
}

- (BOOL)isIconViewRecycled:(id)a3
{
  return 0;
}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setStartsDragMoreQuickly:", 1);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setEditingAnimationStrength:", 0.25);
  objc_msgSend(v5, "setAllowsCloseBox:", 0);

}

- (id)customImageViewControllerForIconView:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_iconViewControllersByIcon, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)iconDragManager:(id)a3 canBeginIconDragForIconView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t i;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  BOOL v20;
  BOOL v22;
  int v23;
  int v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  CGPoint v32;
  CGRect v33;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (self->_allowsEditing)
  {
    -[SBRootFolderViewPageManagementLayoutManager rootFolderView](self, "rootFolderView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v6, "isPageManagementUIVisible");
    v23 = objc_msgSend(v6, "isPageManagementUITransitioningOutOfVisible");
    v22 = -[SBRootFolderViewPageManagementLayoutManager isTrackingActiveOrDroppingIconDrags](self, "isTrackingActiveOrDroppingIconDrags");
    objc_msgSend(v5, "icon");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](self->_iconViewControllersByIcon, "objectForKey:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "listBackgroundView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v5, "gestureRecognizers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      v13 = 1;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v15, "state") == 1)
          {
            objc_msgSend(v15, "locationInView:", v5);
            v17 = v16;
            v19 = v18;
            objc_msgSend(v8, "bounds");
            v32.x = v17;
            v32.y = v19;
            v13 = CGRectContainsPoint(v33, v32);
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v11);
    }
    else
    {
      v13 = 1;
    }

    v20 = ((v24 ^ 1 | v23) & 1) == 0 && !v22 && v13;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (SBIconDragManager)iconDragManager
{
  SBIconDragManager *iconDragManager;
  SBIconDragManager *v4;
  SBIconDragManager *v5;

  iconDragManager = self->_iconDragManager;
  if (!iconDragManager)
  {
    v4 = objc_alloc_init(SBIconDragManager);
    v5 = self->_iconDragManager;
    self->_iconDragManager = v4;

    -[SBIconDragManager setDelegate:](self->_iconDragManager, "setDelegate:", self);
    iconDragManager = self->_iconDragManager;
  }
  return iconDragManager;
}

- (id)iconDragManager:(id)a3 dragItemsForIconView:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a4;
  objc_msgSend(v4, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBHIconDragItemWithIconAndIconView(v5, v4, CFSTR("com.apple.SpringBoardHome.PageReordering"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)iconDragManager:(id)a3 iconView:(id)a4 willBeginDragSession:(id)a5
{
  objc_msgSend(a4, "setAllowsCloseBox:withAnimation:", 0, 2, a5);
}

- (BOOL)iconDragManager:(id)a3 canAddDragItemsToSession:(id)a4 fromIconView:(id)a5
{
  return 0;
}

- (void)iconDragManager:(id)a3 iconView:(id)a4 willAnimateDragLiftWithAnimator:(id)a5 session:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  objc_msgSend(a4, "icon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "listModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_iconViewControllersByListModel, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __112__SBRootFolderViewPageManagementLayoutManager_iconDragManager_iconView_willAnimateDragLiftWithAnimator_session___block_invoke;
  v13[3] = &unk_1E8D84C50;
  v14 = v11;
  v12 = v11;
  objc_msgSend(v8, "addAnimations:", v13);

  -[SBRootFolderViewPageManagementLayoutManager setDraggingIcon:](self, "setDraggingIcon:", v9);
}

uint64_t __112__SBRootFolderViewPageManagementLayoutManager_iconDragManager_iconView_willAnimateDragLiftWithAnimator_session___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setToggleButtonAlpha:", 0.0);
}

- (void)iconDragManager:(id)a3 iconView:(id)a4 item:(id)a5 willAnimateDragCancelWithAnimator:(id)a6
{
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[SBRootFolderViewPageManagementLayoutManager _updateCloseBoxVisibilityWithAnimation:](self, "_updateCloseBoxVisibilityWithAnimation:", 0, a4, a5, a6);
  if (-[SBRootFolderViewPageManagementLayoutManager allowsPageHiding](self, "allowsPageHiding"))
  {
    -[NSMapTable objectEnumerator](self->_iconViewControllersByListModel, "objectEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "setToggleButtonAlpha:", 1.0, (_QWORD)v14);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (void)iconDragManager:(id)a3 didPerformIconDrop:(id)a4 withIcons:(id)a5 inIconListView:(id)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;

  -[SBRootFolderViewPageManagementLayoutManager rootFolderView](self, "rootFolderView", a3, a4, a5, a6);
  v35 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "folder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBRootFolderViewPageManagementLayoutManager draggingIcon](self, "draggingIcon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBRootFolderViewPageManagementLayoutManager rootListView](self, "rootListView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "listModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "indexOfList:", v11);

  v13 = objc_msgSend(v10, "indexForIcon:", v8);
  -[SBRootFolderViewPageManagementLayoutManager activeFocusMode](self, "activeFocusMode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "customizedHomeScreenPagesEnabled"))
  {
    objc_msgSend(v7, "lists");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");

    v31 = v9;
    v32 = (void *)v16;
    v33 = v14;
    if (v13)
      objc_msgSend(v10, "iconAtIndex:", v13 - 1);
    else
      objc_msgSend(v10, "firstIcon");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_class();
    v20 = v18;
    if (v19)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v21 = v20;
      else
        v21 = 0;
    }
    else
    {
      v21 = 0;
    }
    v22 = v21;

    v34 = v22;
    if (v22)
    {
      if (v13 + 1 >= objc_msgSend(v10, "numberOfIcons"))
      {
        v23 = 0;
      }
      else
      {
        objc_msgSend(v10, "iconAtIndex:", v13 + 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v24 = objc_opt_class();
      v25 = v23;
      if (v24)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v26 = v25;
        else
          v26 = 0;
      }
      else
      {
        v26 = 0;
      }
      v27 = v26;

      if (v25)
      {
        objc_msgSend(v27, "listModel");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v7, "indexOfList:", v28);

        v13 = (__PAIR128__(v29, v12) - (unint64_t)v29) >> 64;
      }
      else
      {
        objc_msgSend(v34, "listModel");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v7, "indexOfList:", v30);

      }
    }
    else
    {
      v13 = 0;
    }
    v9 = v31;
    if (v12 != 0x7FFFFFFFFFFFFFFFLL && v13 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v7, "moveListAtIndex:toIndex:", v12, v13);
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __107__SBRootFolderViewPageManagementLayoutManager_iconDragManager_didPerformIconDrop_withIcons_inIconListView___block_invoke;
    v36[3] = &unk_1E8D877F8;
    v37 = v7;
    objc_msgSend(v32, "enumerateObjectsWithOptions:usingBlock:", 2 * (v13 > v12), v36);

    v17 = v35;
    v14 = v33;
  }
  else
  {
    if (v12 != 0x7FFFFFFFFFFFFFFFLL && v13 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v7, "moveListAtIndex:toIndex:", v12, v13);
    v17 = v35;
  }
  if (objc_msgSend(v35, "iconListModelIndexForPageIndex:", objc_msgSend(v17, "currentPageIndex", v31)) == v12)
    objc_msgSend(v35, "setCurrentPageIndex:animated:", objc_msgSend(v35, "pageIndexForIconListModelIndex:", v13), 0);
  -[SBRootFolderViewPageManagementLayoutManager setDraggingIcon:](self, "setDraggingIcon:", 0);

}

void __107__SBRootFolderViewPageManagementLayoutManager_iconDragManager_didPerformIconDrop_withIcons_inIconListView___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "isHidden"))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "indexOfList:", v6);
    if (v5 != a3)
      objc_msgSend(*(id *)(a1 + 32), "moveListAtIndex:toIndex:", v5, a3);
  }

}

- (BOOL)iconShouldAllowCloseBoxTap:(id)a3
{
  return !-[SBRootFolderViewPageManagementLayoutManager isTrackingActiveOrDroppingIconDrags](self, "isTrackingActiveOrDroppingIconDrags", a3);
}

- (void)iconCloseBoxTapped:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBRootFolderViewPageManagementLayoutManager *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__SBRootFolderViewPageManagementLayoutManager_iconCloseBoxTapped___block_invoke;
  v6[3] = &unk_1E8D84EF0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[SBRootFolderViewPageManagementLayoutManager presentPageDeleteConfirmationAlertForIconView:completion:](self, "presentPageDeleteConfirmationAlertForIconView:completion:", v5, v6);

}

void __66__SBRootFolderViewPageManagementLayoutManager_iconCloseBoxTapped___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "icon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 40), "pageContainsBookmarkIcons:", v2);
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  if (v3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __66__SBRootFolderViewPageManagementLayoutManager_iconCloseBoxTapped___block_invoke_2;
    v6[3] = &unk_1E8D84EF0;
    v6[4] = v5;
    v7 = v4;
    objc_msgSend(v5, "presentSecondPageDeleteConfirmationAlertBookmarksFoundForIconView:completion:", v7, v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_removePageIcon:", v4);
  }

}

uint64_t __66__SBRootFolderViewPageManagementLayoutManager_iconCloseBoxTapped___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removePageIcon:", *(_QWORD *)(a1 + 40));
}

- (BOOL)iconViewCanBecomeFocused:(id)a3
{
  return 0;
}

- (int64_t)closeBoxTypeForIconView:(id)a3
{
  return 1;
}

- (void)iconDragManager:(id)a3 iconListView:(id)a4 item:(id)a5 willAnimateDropWithAnimator:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;

  v8 = a6;
  objc_msgSend(a5, "sbh_appDragLocalContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBRootFolderViewPageManagementLayoutManager pageManagementListModel](self, "pageManagementListModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "directlyContainedIconWithIdentifier:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  v14 = v12;
  if (v13)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
  }
  else
  {
    v15 = 0;
  }
  v16 = v15;

  objc_msgSend(v16, "listModel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMapTable objectForKey:](self->_iconViewControllersByListModel, "objectForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setToggleButtonAlpha:", 0.0);
  v19 = MEMORY[0x1E0C809B0];
  v20 = (void *)MEMORY[0x1E0DC3F10];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __109__SBRootFolderViewPageManagementLayoutManager_iconDragManager_iconListView_item_willAnimateDropWithAnimator___block_invoke;
  v23[3] = &unk_1E8D84C50;
  v24 = v18;
  v21 = v18;
  objc_msgSend(v20, "animateWithDuration:animations:", v23, 0.2);
  v22[0] = v19;
  v22[1] = 3221225472;
  v22[2] = __109__SBRootFolderViewPageManagementLayoutManager_iconDragManager_iconListView_item_willAnimateDropWithAnimator___block_invoke_2;
  v22[3] = &unk_1E8D863E0;
  v22[4] = self;
  objc_msgSend(v8, "addCompletion:", v22);

}

uint64_t __109__SBRootFolderViewPageManagementLayoutManager_iconDragManager_iconListView_item_willAnimateDropWithAnimator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setToggleButtonAlpha:", 1.0);
}

uint64_t __109__SBRootFolderViewPageManagementLayoutManager_iconDragManager_iconListView_item_willAnimateDropWithAnimator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCloseBoxVisibilityWithAnimation:", 2);
}

- (BOOL)pageManagementCellViewControllerCanReceiveTap:(id)a3
{
  return 1;
}

- (void)pageManagementCellViewControllerDidReceiveTap:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  -[SBRootFolderViewPageManagementLayoutManager rootFolderView](self, "rootFolderView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "folder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "indexOfList:", v7);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v9, "setCurrentPageIndex:animated:", objc_msgSend(v9, "pageIndexForIconListModelIndex:", v8), 0);
  objc_msgSend(v9, "exitPageManagementUIWithCompletionHandler:", 0);

}

- (BOOL)pageManagementCellViewControllerShouldSuppressHighlight:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  int v7;
  char v8;

  -[SBRootFolderViewPageManagementLayoutManager rootFolderView](self, "rootFolderView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPageManagementUITransitioningOutOfVisible");
  -[SBRootFolderViewPageManagementLayoutManager latestActiveTransitionAnimator](self, "latestActiveTransitionAnimator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fractionComplete");

  v7 = BSFloatGreaterThanFloat();
  if (v7)
    LOBYTE(v7) = BSFloatLessThanFloat();
  v8 = v5 | v7;

  return v8;
}

- (id)backgroundViewForSnapshotForPageManagementCellViewController:(id)a3
{
  void *v4;
  id v5;

  -[SBRootFolderViewPageManagementLayoutManager rootFolderView](self, "rootFolderView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBRootFolderViewPageManagementLayoutManager newCellBackgroundMaterialViewInFolderView:initialWeighting:](self, "newCellBackgroundMaterialViewInFolderView:initialWeighting:", v4, 1.0);

  return v5;
}

- (BOOL)isEditing
{
  return 1;
}

- (BOOL)iconDragManager:(id)a3 doesIconRepresentRealIconPosition:(id)a4 inLocation:(id)a5
{
  return 1;
}

- (id)iconDragManager:(id)a3 dragPreviewForIconView:(id)a4
{
  id v4;
  SBHPageManagementCellDragPreview *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v4 = a4;
  v5 = -[SBHPageManagementCellDragPreview initWithReferenceIconView:]([SBHPageManagementCellDragPreview alloc], "initWithReferenceIconView:", v4);
  objc_msgSend(v4, "iconImageCenter");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v4, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertPoint:toView:", v10, v7, v9);
  v12 = v11;
  v14 = v13;

  -[SBHPageManagementCellDragPreview setCenter:](v5, "setCenter:", v12, v14);
  return v5;
}

- (id)iconListViewForIndexPath:(id)a3
{
  return self->_rootListView;
}

- (id)iconViewQueryableForIconDragManager:(id)a3
{
  return self->_rootListView;
}

- (void)iconList:(id)a3 didMoveIcon:(id)a4
{
  id v4;

  objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emitEvent:", 56);

}

- (void)iconList:(id)a3 didRemoveIcon:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if ((objc_msgSend(v5, "isPlaceholder") & 1) == 0)
  {
    -[SBRootFolderViewPageManagementLayoutManager rootFolderView](self, "rootFolderView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "folder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    v9 = v5;
    v30 = v6;
    if (v8)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    objc_msgSend(v7, "ignoredList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v11;
    objc_msgSend(v11, "listModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "iconsOfClass:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v32 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (objc_msgSend(v21, "isApplicationIcon")
            && objc_msgSend(v12, "isAllowedToContainIcon:", v21))
          {
            objc_msgSend(v12, "addIcon:", v21);
          }
          if ((objc_msgSend(v21, "isWidgetIcon") & 1) != 0 || objc_msgSend(v21, "isBookmarkIcon"))
          {
            objc_msgSend(v21, "setUninstalled");
            objc_msgSend(v21, "completeUninstall");
            objc_msgSend(v13, "removeIcon:", v21);
            objc_msgSend(v7, "model");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "removeIcon:", v21);

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v18);
    }

    v23 = objc_msgSend(v30, "iconListModelIndexForPageIndex:", objc_msgSend(v30, "currentPageIndex"));
    v24 = objc_msgSend(v7, "indexOfList:", v13);
    if (v23 <= v24)
    {
      if (v23 != v24)
      {
LABEL_27:
        objc_msgSend(v7, "removeList:", v13);
        objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "emitEvent:", 55);

        goto LABEL_28;
      }
      v25 = objc_msgSend(v30, "firstIconPageIndex");
    }
    else
    {
      v25 = objc_msgSend(v30, "pageIndexForIconListModelIndex:", v23 - 1);
      if (v25 == 0x7FFFFFFFFFFFFFFFLL)
      {
        SBLogCommon();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG);

        if (v27)
          NSLog(CFSTR("No preceding page index found when reconciling new current page index following page delete action"));
      }
    }
    objc_msgSend(v30, "setCurrentPageIndex:animated:", v25, 0);
    goto LABEL_27;
  }
LABEL_28:

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  NSMapTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_iconViewControllersByIcon;
  v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[NSMapTable objectForKey:](self->_iconViewControllersByIcon, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8), (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "cancelGestures");

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)dominoPivotAnimator:(id)a3 didLayOutIconView:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  if (-[SBRootFolderViewPageManagementLayoutManager layoutAction](self, "layoutAction") == 1)
  {
    objc_msgSend(v9, "icon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](self->_iconViewControllersByIcon, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setScalesListView:", 1);
    objc_msgSend(v6, "listBackgroundView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWeighting:", 1.0);
    objc_msgSend(v9, "clearIconImageInfo");
    objc_msgSend(v6, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutIfNeeded");

  }
}

- (SBRootFolderView)rootFolderView
{
  return (SBRootFolderView *)objc_loadWeakRetained((id *)&self->_rootFolderView);
}

- (void)setRootFolderView:(id)a3
{
  objc_storeWeak((id *)&self->_rootFolderView, a3);
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong(&self->_userInfo, a3);
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
}

- (SBHFocusMode)activeFocusMode
{
  return self->_activeFocusMode;
}

- (NSURL)completionURL
{
  return self->_completionURL;
}

- (void)setCompletionURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (UIImageView)focusModeSymbolView
{
  return self->_focusModeSymbolView;
}

- (void)setFocusModeSymbolView:(id)a3
{
  objc_storeStrong((id *)&self->_focusModeSymbolView, a3);
}

- (SBTitledHomeScreenButton)focusModeOptionsButton
{
  return self->_focusModeOptionsButton;
}

- (void)setFocusModeOptionsButton:(id)a3
{
  objc_storeStrong((id *)&self->_focusModeOptionsButton, a3);
}

- (SBIconListView)rootListView
{
  return self->_rootListView;
}

- (void)setRootListView:(id)a3
{
  objc_storeStrong((id *)&self->_rootListView, a3);
}

- (SBIconListModel)pageManagementListModel
{
  return self->_pageManagementListModel;
}

- (void)setPageManagementListModel:(id)a3
{
  objc_storeStrong((id *)&self->_pageManagementListModel, a3);
}

- (UIScrollView)pageManagementScrollView
{
  return self->_pageManagementScrollView;
}

- (void)setPageManagementScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_pageManagementScrollView, a3);
}

- (unint64_t)transitionCount
{
  return self->_transitionCount;
}

- (void)setTransitionCount:(unint64_t)a3
{
  self->_transitionCount = a3;
}

- (unint64_t)activeTransitionCount
{
  return self->_activeTransitionCount;
}

- (void)setActiveTransitionCount:(unint64_t)a3
{
  self->_activeTransitionCount = a3;
}

- (UIViewImplicitlyAnimating)latestActiveTransitionAnimator
{
  return self->_latestActiveTransitionAnimator;
}

- (void)setLatestActiveTransitionAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_latestActiveTransitionAnimator, a3);
}

- (int64_t)layoutAction
{
  return self->_layoutAction;
}

- (void)setLayoutAction:(int64_t)a3
{
  self->_layoutAction = a3;
}

- (int64_t)layoutConfiguration
{
  return self->_layoutConfiguration;
}

- (void)setLayoutConfiguration:(int64_t)a3
{
  self->_layoutConfiguration = a3;
}

- (UITapGestureRecognizer)backgroundTapGestureRecognizer
{
  return self->_backgroundTapGestureRecognizer;
}

- (void)setBackgroundTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundTapGestureRecognizer, a3);
}

- (SBDockOffscreenFractionModifying)dockOffscreenAssertion
{
  return self->_dockOffscreenAssertion;
}

- (void)setDockOffscreenAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_dockOffscreenAssertion, a3);
}

- (BSInvalidatable)scrollAccessoryBorrowedAssertion
{
  return self->_scrollAccessoryBorrowedAssertion;
}

- (void)setScrollAccessoryBorrowedAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_scrollAccessoryBorrowedAssertion, a3);
}

- (BSInvalidatable)pageDotsVisibilityAssertion
{
  return self->_pageDotsVisibilityAssertion;
}

- (void)setPageDotsVisibilityAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_pageDotsVisibilityAssertion, a3);
}

- (BOOL)allowsPageHiding
{
  return self->_allowsPageHiding;
}

- (void)setAllowsPageHiding:(BOOL)a3
{
  self->_allowsPageHiding = a3;
}

- (UIViewController)alertPresentationViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_alertPresentationViewController);
}

- (void)setAlertPresentationViewController:(id)a3
{
  objc_storeWeak((id *)&self->_alertPresentationViewController, a3);
}

- (SBHPageManagementIcon)draggingIcon
{
  return self->_draggingIcon;
}

- (void)setDraggingIcon:(id)a3
{
  objc_storeStrong((id *)&self->_draggingIcon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draggingIcon, 0);
  objc_destroyWeak((id *)&self->_alertPresentationViewController);
  objc_storeStrong((id *)&self->_pageDotsVisibilityAssertion, 0);
  objc_storeStrong((id *)&self->_scrollAccessoryBorrowedAssertion, 0);
  objc_storeStrong((id *)&self->_dockOffscreenAssertion, 0);
  objc_storeStrong((id *)&self->_backgroundTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_latestActiveTransitionAnimator, 0);
  objc_storeStrong((id *)&self->_pageManagementScrollView, 0);
  objc_storeStrong((id *)&self->_pageManagementListModel, 0);
  objc_storeStrong((id *)&self->_rootListView, 0);
  objc_storeStrong((id *)&self->_focusModeOptionsButton, 0);
  objc_storeStrong((id *)&self->_focusModeSymbolView, 0);
  objc_storeStrong((id *)&self->_completionURL, 0);
  objc_storeStrong((id *)&self->_activeFocusMode, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_destroyWeak((id *)&self->_rootFolderView);
  objc_storeStrong((id *)&self->_iconDragManager, 0);
  objc_storeStrong((id *)&self->_initialScalingAttributesByIconView, 0);
  objc_storeStrong((id *)&self->_pageIconsByListModel, 0);
  objc_storeStrong((id *)&self->_iconViewControllersByListModel, 0);
  objc_storeStrong((id *)&self->_iconViewControllersByIcon, 0);
}

void __93__SBRootFolderViewPageManagementLayoutManager_transitionToActive_inFolderView_usingAnimator___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1CFEF3000, a2, a3, "Adding %p as a child of page hiding page controller", a5, a6, a7, a8, 0);
}

void __72__SBRootFolderViewPageManagementLayoutManager_cleanUpViewsInFolderView___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1CFEF3000, a2, a3, "Removing %p as a child of page hiding page controller", a5, a6, a7, a8, 0);
}

@end
