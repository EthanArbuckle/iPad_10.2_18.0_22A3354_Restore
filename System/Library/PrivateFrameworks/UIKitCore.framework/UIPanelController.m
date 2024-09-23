@implementation UIPanelController

void __56__UIPanelController__collapseWithTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;
  id v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[2] = __56__UIPanelController__collapseWithTransitionCoordinator___block_invoke_3;
  v4[3] = &unk_1E16C15B0;
  v2 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v10 = *(_BYTE *)(a1 + 88);
  v3 = *(_QWORD *)(a1 + 80);
  v8 = *(_QWORD *)(a1 + 72);
  v9 = v3;
  v4[1] = 3221225472;
  v7 = *(_OWORD *)(a1 + 56);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v4);

}

- (UIViewController)mainViewController
{
  void *v2;
  void *v3;

  -[UIPanelController _internalState](self, "_internalState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v3;
}

- (UIViewController)collapsedViewController
{
  void *v2;
  void *v3;

  -[UIPanelController _internalState](self, "_internalState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collapsedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v3;
}

- (BOOL)isCollapsed
{
  void *v2;
  uint64_t v3;

  -[UIPanelController _internalState](self, "_internalState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "collapsedState");

  return (unint64_t)(v3 - 1) < 2;
}

- (int64_t)style
{
  return self->_style;
}

- (UIViewController)leadingViewController
{
  void *v2;
  void *v3;

  -[UIPanelController _internalState](self, "_internalState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leadingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v3;
}

- (_UIPanelInternalState)_internalState
{
  return self->__internalState;
}

- (UISlidingBarState)_lastComputedPublicState
{
  return self->__lastComputedPublicState;
}

id __54__UIPanelController__updateToNewPublicState_withSize___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *v4;
  unint64_t v5;
  NSObject *v6;
  int v7;
  char v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v19;
  uint8_t v20[16];
  uint8_t buf[16];

  v3 = a2;
  if (v3)
  {
    v4 = *(_BYTE **)(a1 + 32);
    if ((v4[9] & 0x80) != 0)
    {
      objc_msgSend(v4, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "panelController:navigationBarForViewController:", *(_QWORD *)(a1 + 32), v3);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v19, OS_LOG_TYPE_FAULT, "Fallback for finding a navigation bar is unreliable", buf, 2u);
        }

      }
      else
      {
        v5 = _UIInternalPreference_UIViewDebugSignposts_block_invoke_2___s_category_1;
        if (!_UIInternalPreference_UIViewDebugSignposts_block_invoke_2___s_category_1)
        {
          v5 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v5, (unint64_t *)&_UIInternalPreference_UIViewDebugSignposts_block_invoke_2___s_category_1);
        }
        v6 = *(NSObject **)(v5 + 8);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v20 = 0;
          _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Fallback for finding a navigation bar is unreliable", v20, 2u);
        }
      }
      v7 = objc_msgSend(v3, "_isNavigationController");
      v8 = v7;
      if (v7)
        v9 = v3;
      else
        v9 = 0;
      v10 = v9;
      v11 = v3;
      if ((v8 & 1) == 0)
      {
        objc_msgSend(v3, "childViewControllers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "_isNavigationController");

        if (v14)
        {
          objc_msgSend(v3, "childViewControllers");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "firstObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v11 = 0;
        }
      }
      objc_msgSend(v11, "navigationBar");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v17;

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UILayoutContainerView *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _UIPanelControllerContentView *v21;
  UILayoutContainerView *view;
  _UIPanelControllerContentView *v23;

  -[UIPanelController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIPanelController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_class *)objc_msgSend(v4, "viewClassForPanelController:", self);

  }
  else
  {
    v5 = (objc_class *)objc_opt_class();
  }

  -[UIPanelController owningViewController](self, "owningViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_defaultInitialViewFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = (UILayoutContainerView *)objc_msgSend([v5 alloc], "initWithFrame:", v8, v10, v12, v14);
  if (!dyld_program_sdk_at_least())
  {
    +[UIColor systemGrayColor](UIColor, "systemGrayColor");
    v20 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v18 = (void *)v20;
    -[UILayoutContainerView setDefaultBackgroundColor:](v15, "setDefaultBackgroundColor:", v20);
    goto LABEL_10;
  }
  -[UIPanelController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) == 0)
  {
    +[UIColor _splitViewBorderColor](UIColor, "_splitViewBorderColor");
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  -[UIPanelController delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "primaryBackgroundColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutContainerView setDefaultBackgroundColor:](v15, "setDefaultBackgroundColor:", v19);

LABEL_10:
  -[UIView setAutoresizingMask:](v15, "setAutoresizingMask:", 18);
  -[UILayoutContainerView setDelegate:](v15, "setDelegate:", self);
  v21 = [_UIPanelControllerContentView alloc];
  -[UIView bounds](v15, "bounds");
  v23 = -[UIView initWithFrame:](v21, "initWithFrame:");
  -[_UIPanelControllerContentView _setPanelController:](v23, "_setPanelController:", self);
  -[UIView setAutoresizingMask:](v23, "setAutoresizingMask:", 18);
  -[UILayoutContainerView addSubview:](v15, "addSubview:", v23);
  -[UIPanelController _setContentView:](self, "_setContentView:", v23);
  view = self->_view;
  self->_view = v15;

}

- (UIPanelControllerDelegate)delegate
{
  void *v2;
  void *v3;

  -[UIPanelController _internalState](self, "_internalState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIPanelControllerDelegate *)v3;
}

- (void)_setContentView:(id)a3
{
  objc_storeStrong((id *)&self->__contentView, a3);
}

- (void)_unspecifiedUpdateToNewPublicState:(id)a3 withSize:(CGSize)a4
{
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  uint64_t v49;
  char v50;
  char v51;
  char v52;
  char v53;
  char v54;
  char v55;
  CGFloat v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  id v65;
  id v66;
  id v67;
  id v68;
  int v69;
  int v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double Width;
  double v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  void *v96;
  double v97;
  double v98;
  CGFloat Height;
  id v100;
  id v101;
  void *v102;
  void (**v103)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v104;
  void *v105;
  BOOL v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  int v113;
  int v114;
  double v115;
  double v116;
  unsigned int v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  void *v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  void *v134;
  double v135;
  double v136;
  double v137;
  id v138;
  void *v139;
  double v140;
  void *v141;
  void *v142;
  id v143;
  id v144;
  id v145;
  void *v146;
  id v147;
  id v148;
  id v149;
  void *v150;
  id v151;
  void *v152;
  id v153;
  void *v154;
  id v155;
  id v156;
  id v157;
  int v158;
  id v159;
  id v160;
  void *v161;
  id v162;
  id v163;
  void *v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  id v170;
  id v171;
  id v172;
  id v173;
  id v174;
  id v175;
  id v176;
  id v177;
  id v178;
  _QWORD aBlock[4];
  id v180;
  id v181;
  _QWORD *v182;
  CGFloat v183;
  char v184;
  _QWORD v185[3];
  double v186;
  _BYTE v187[128];
  uint64_t v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;
  CGRect v192;
  CGRect v193;
  CGRect v194;
  CGRect v195;
  CGRect v196;
  CGRect v197;
  CGRect v198;
  CGRect v199;
  CGRect v200;
  CGRect v201;
  CGRect v202;
  CGRect v203;

  v188 = *MEMORY[0x1E0C80C00];
  v162 = a3;
  -[UIPanelController _contentView](self, "_contentView");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPanelController _internalState](self, "_internalState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingViewController");
  v150 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPanelController _internalState](self, "_internalState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mainViewController");
  v142 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPanelController _internalState](self, "_internalState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trailingViewController");
  v139 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v162, "_collapsedState") == 1 || objc_msgSend(v162, "_collapsedState") == 2;
  -[UIPanelController _internalState](self, "_internalState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collapsedViewController");
  v141 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v138 = v141;
    objc_msgSend(v138, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    goto LABEL_35;
  }
  v138 = v142;
  objc_msgSend(v138, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v162;
  objc_msgSend(v162, "leadingWidth");
  if (v16 <= 0.0)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v150, "view");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v15 = v162;
  }
  objc_msgSend(v15, "trailingWidth");
  if (v17 <= 0.0)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v139, "view");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v15 = v162;
  }
  objc_msgSend(v15, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "borderColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {

  }
  else if (-[UILayoutContainerView backgroundColorIsDefault](self->_view, "backgroundColorIsDefault"))
  {
    +[UIColor _splitViewBorderColor](UIColor, "_splitViewBorderColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  objc_msgSend(v18, "borderColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    -[UIView backgroundColor](self->_view, "backgroundColor");
    v22 = (id)objc_claimAutoreleasedReturnValue();

    v21 = 0;
    goto LABEL_19;
  }
LABEL_17:
  v21 = v20;
  v22 = v21;
LABEL_19:

  if (v14
    && (objc_msgSend(v162, "configuration"),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v23, "leadingBorderWidthForScale:", 1.0),
        v25 = v24,
        v23,
        v25 > 0.0))
  {
    -[UIPanelController _leadingBorderView](self, "_leadingBorderView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      -[UIPanelController _createBorderView](self, "_createBorderView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPanelController _setLeadingBorderView:](self, "_setLeadingBorderView:", v27);

    }
    -[UIPanelController _leadingBorderView](self, "_leadingBorderView");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v12, "setBackgroundColor:", v22);
    objc_msgSend((id)v12, "setNeedsLayout");
    if (!v13)
      goto LABEL_30;
  }
  else
  {
    v12 = 0;
    if (!v13)
      goto LABEL_30;
  }
  objc_msgSend(v162, "configuration");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "trailingBorderWidthForScale:", 1.0);
  v30 = v29;

  if (v30 > 0.0)
  {
    -[UIPanelController _trailingBorderView](self, "_trailingBorderView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v31)
    {
      -[UIPanelController _createBorderView](self, "_createBorderView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPanelController _setTrailingBorderView:](self, "_setTrailingBorderView:", v32);

    }
    -[UIPanelController _trailingBorderView](self, "_trailingBorderView");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v11, "setBackgroundColor:", v22);
    objc_msgSend((id)v11, "setNeedsLayout");
    goto LABEL_31;
  }
LABEL_30:
  v11 = 0;
LABEL_31:
  if (v12 | v11)
  {
    objc_msgSend(v162, "configuration");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "borderColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPanelController _setBorderViewsObserveViewBackgroundColor:](self, "_setBorderViewsObserveViewBackgroundColor:", v34 == 0);

  }
  else
  {
    -[UIPanelController _setBorderViewsObserveViewBackgroundColor:](self, "_setBorderViewsObserveViewBackgroundColor:", 0);
  }

LABEL_35:
  v177 = 0;
  v178 = v10;
  v176 = 0;
  __65__UIPanelController__unspecifiedUpdateToNewPublicState_withSize___block_invoke(&v178, &v177, &v176);
  v159 = v178;

  v155 = v177;
  v145 = v176;
  v174 = 0;
  v175 = v14;
  v173 = 0;
  __65__UIPanelController__unspecifiedUpdateToNewPublicState_withSize___block_invoke(&v175, &v174, &v173);
  v35 = v175;

  v157 = v174;
  v144 = v173;
  v171 = 0;
  v172 = v13;
  v170 = 0;
  __65__UIPanelController__unspecifiedUpdateToNewPublicState_withSize___block_invoke(&v172, &v171, &v170);
  v36 = v172;

  v37 = v171;
  v143 = v170;
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", 5);
  v152 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 5);
  if (v159)
    objc_msgSend(v38, "addObject:");
  v39 = v157;
  if (v155)
    objc_msgSend(v38, "addObject:");
  v146 = v37;
  v161 = v36;
  if ((!v35 || (objc_msgSend(v162, "leadingOverlapsMain") & 1) == 0)
    && (!v36 || !objc_msgSend(v162, "trailingOverlapsMain")))
  {
    v40 = 0;
    if (!v35)
      goto LABEL_52;
    goto LABEL_48;
  }
  -[UIPanelController dimmingView](self, "dimmingView");
  v40 = objc_claimAutoreleasedReturnValue();
  if (v40)
    objc_msgSend(v38, "addObject:", v40);
  v39 = v157;
  if (v35)
  {
LABEL_48:
    objc_msgSend(v38, "addObject:", v35);
    if (v39)
      objc_msgSend(v38, "addObject:", v39);
    objc_msgSend(v152, "addObject:", v35);
    if (v12)
      objc_msgSend(v38, "addObject:", v12);
  }
LABEL_52:
  if (v36)
  {
    objc_msgSend(v38, "addObject:", v36);
    if (v37)
      objc_msgSend(v38, "addObject:", v37);
    objc_msgSend(v152, "addObject:", v36);
    if (v11)
      objc_msgSend(v38, "addObject:", v11);
  }
  v154 = (void *)v40;
  objc_msgSend(v165, "subviews");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "array");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v41, "isEqualToArray:", v42);

  if ((v43 & 1) == 0)
  {
    v168 = 0u;
    v169 = 0u;
    v166 = 0u;
    v167 = 0u;
    objc_msgSend(v165, "subviews");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v166, v187, 16);
    if (v45)
    {
      v46 = *(_QWORD *)v167;
      do
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v167 != v46)
            objc_enumerationMutation(v44);
          v48 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * i);
          if ((objc_msgSend(v38, "containsObject:", v48) & 1) == 0)
            objc_msgSend(v48, "removeFromSuperview");
        }
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v166, v187, 16);
      }
      while (v45);
    }

    if (v159)
    {
      objc_msgSend(v165, "insertSubview:atIndex:", v159, 0);
      v49 = 1;
    }
    else
    {
      v49 = 0;
    }
    if (v155)
      objc_msgSend(v165, "insertSubview:atIndex:", v155, v49++);
    if (v154)
      objc_msgSend(v165, "insertSubview:atIndex:", v154, v49++);
    v50 = dyld_program_sdk_at_least();
    v51 = v50;
    if (v12)
      v52 = v50;
    else
      v52 = 1;
    if ((v52 & 1) == 0)
      objc_msgSend(v165, "insertSubview:atIndex:", v12, v49++);
    if (v35)
      objc_msgSend(v165, "insertSubview:atIndex:", v35, v49++);
    if (v157)
      objc_msgSend(v165, "insertSubview:atIndex:", v157, v49++);
    if (v11)
      v53 = v51;
    else
      v53 = 1;
    if ((v53 & 1) == 0)
      objc_msgSend(v165, "insertSubview:atIndex:", v11, v49++);
    if (v161)
      objc_msgSend(v165, "insertSubview:atIndex:", v161, v49++);
    if (v146)
      objc_msgSend(v165, "insertSubview:atIndex:", v146, v49++);
    v54 = v51 ^ 1;
    if (v12 && (v54 & 1) == 0)
      objc_msgSend(v165, "insertSubview:atIndex:", v12, v49++);
    if (v11)
      v55 = v54;
    else
      v55 = 1;
    if ((v55 & 1) == 0)
      objc_msgSend(v165, "insertSubview:atIndex:", v11, v49);
  }
  if ((*(_BYTE *)&self->_panelControllerFlags & 8) != 0)
  {
    v59 = *MEMORY[0x1E0C9D538];
    v61 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    objc_msgSend(v165, "bounds");
    a4.width = v56;
    a4.height = v57;
    v59 = v58;
    v61 = v60;
  }
  -[UIPanelController view](self, "view");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = objc_msgSend(v62, "_shouldReverseLayoutDirection");

  objc_msgSend(v165, "_currentScreenScale");
  v64 = v63;
  objc_msgSend(v154, "setFrame:", v59, v61, a4.width, a4.height);
  v147 = v35;
  v65 = (id)v12;
  v156 = v159;
  v66 = (id)v11;
  v148 = v161;
  v67 = v162;
  v68 = v152;
  v153 = v150;
  v163 = v138;
  v151 = v139;
  if (v35)
    v69 = objc_msgSend(v67, "leadingOverlapsMain") ^ 1;
  else
    v69 = 0;
  if (v161)
    v70 = objc_msgSend(v67, "trailingOverlapsMain") ^ 1;
  else
    v70 = 0;
  objc_msgSend(v67, "leadingWidth");
  UIRoundToScale(v71, v64);
  v73 = v72;
  objc_msgSend(v67, "trailingWidth");
  UIRoundToScale(v74, v64);
  v140 = v75;
  v76 = 0.0;
  if ((objc_msgSend(v67, "leadingOverlapsMain") & 1) == 0)
  {
    objc_msgSend(v67, "leadingDragOffset");
    if (v77 > 0.0)
    {
      objc_msgSend(v67, "leadingDragOffset");
      v76 = 0.0 - v78;
    }
  }
  if (objc_msgSend(v67, "leadingOverlapsMain")
    && (objc_msgSend(v67, "_leadingEntirelyOverlapsMain") & 1) == 0)
  {
    objc_msgSend(v67, "_leadingOverlayWidth");
    v76 = v76 + v73 - v79;
  }
  v80 = 0.0;
  if ((objc_msgSend(v67, "trailingOverlapsMain") & 1) == 0)
  {
    objc_msgSend(v67, "trailingDragOffset");
    if (v81 > 0.0)
    {
      objc_msgSend(v67, "trailingDragOffset");
      v80 = v82 + 0.0;
    }
  }
  if (objc_msgSend(v67, "trailingOverlapsMain")
    && (objc_msgSend(v67, "_trailingEntirelyOverlapsMain") & 1) == 0)
  {
    objc_msgSend(v67, "trailingWidth");
    v84 = v83;
    objc_msgSend(v67, "_trailingOverlayWidth");
    v80 = v80 + v85 - v84;
  }
  UIRoundToScale(v76, v64);
  v87 = v86;
  UIRoundToScale(v80, v64);
  if (v159)
  {
    v89 = v88;
    v189.origin.x = v59;
    v189.origin.y = v61;
    v189.size.width = a4.width;
    v189.size.height = a4.height;
    Width = CGRectGetWidth(v189);
    if (v69)
    {
      v91 = -v87;
      if (v87 >= 0.0)
        v91 = v87;
      Width = Width - (v73 - v91);
      if (v65)
      {
        objc_msgSend(v67, "configuration");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "leadingBorderWidthForScale:", v64);
        v94 = v93;

        Width = Width - v94;
      }
    }
    if (v70)
    {
      v95 = -v89;
      if (v89 >= 0.0)
        v95 = v89;
      Width = Width - (v140 - v95);
      if (v66)
      {
        objc_msgSend(v67, "configuration");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "trailingBorderWidthForScale:", v64);
        v98 = v97;

        Width = Width - v98;
      }
    }
  }
  else
  {
    Width = 0.0;
  }
  v190.origin.x = v59;
  v190.origin.y = v61;
  v190.size.width = a4.width;
  v190.size.height = a4.height;
  Height = CGRectGetHeight(v190);
  v185[0] = 0;
  v185[1] = v185;
  v185[2] = 0x2020000000;
  v186 = 0.0;
  if (v158)
  {
    v191.origin.x = v59;
    v191.origin.y = v61;
    v191.size.width = a4.width;
    v191.size.height = a4.height;
    v87 = CGRectGetWidth(v191) - v87;
  }
  v186 = v87;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __unspecifiedLayoutSideBySideViews_block_invoke;
  aBlock[3] = &unk_1E16C1868;
  v184 = v158 ^ 1;
  v182 = v185;
  v183 = Height;
  v100 = v68;
  v180 = v100;
  v101 = v67;
  v181 = v101;
  v102 = _Block_copy(aBlock);
  v103 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v102;
  if (v69)
  {
    (*((void (**)(void *, id, _QWORD, id, double))v102 + 2))(v102, v147, 0, v153, v73);
    objc_msgSend(v101, "configuration");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "leadingBorderWidthForScale:", v64);
    ((void (**)(_QWORD, id, _QWORD, _QWORD))v103)[2](v103, v65, 0, 0);

  }
  ((void (*)(void (**)(_QWORD, _QWORD, _QWORD, _QWORD), id, _QWORD, id, double))v103[2])(v103, v156, 0, v163, Width);
  if (v70)
  {
    objc_msgSend(v101, "configuration");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "trailingBorderWidthForScale:", v64);
    ((void (**)(_QWORD, id, _QWORD, _QWORD))v103)[2](v103, v66, 0, 0);

    ((void (*)(void (**)(_QWORD, _QWORD, _QWORD, _QWORD), id, _QWORD, id, double))v103[2])(v103, v148, 0, v151, v140);
  }
  v106 = v35 == 0;

  _Block_object_dispose(v185, 8);
  v107 = v147;
  v160 = v65;
  v149 = v148;
  v108 = v66;
  v109 = v101;
  v110 = v100;
  v111 = v153;
  v112 = v151;
  if (v106)
    v113 = 0;
  else
    v113 = objc_msgSend(v109, "leadingOverlapsMain");
  if (v161)
    v114 = objc_msgSend(v109, "trailingOverlapsMain");
  else
    v114 = 0;
  objc_msgSend(v109, "leadingDragOffset");
  v116 = v115;
  v117 = objc_msgSend(v109, "trailingOverlapsMain");
  if (v113)
  {
    objc_msgSend(v109, "leadingWidth");
    v119 = v118;
    v192.origin.x = v59;
    v192.origin.y = v61;
    v192.size.width = a4.width;
    v192.size.height = a4.height;
    v120 = CGRectGetHeight(v192);
    if (v158)
    {
      v193.origin.x = v59;
      v193.origin.y = v61;
      v193.size.width = a4.width;
      v193.size.height = a4.height;
      v121 = CGRectGetWidth(v193);
      v194.origin.x = 0.0;
      v194.origin.y = 0.0;
      v194.size.width = v119;
      v194.size.height = v120;
      v122 = v116 + v121 - CGRectGetWidth(v194);
    }
    else
    {
      v122 = -v116;
    }
    if (objc_msgSend(v110, "containsObject:", v107))
    {
      objc_msgSend(v109, "_keyboardAdjustment");
      v120 = v120 - v123;
    }
    if (v111)
      objc_msgSend(v111, "_updateControlledViewsToFrame:", v122, 0.0, v119, v120);
    else
      objc_msgSend(v107, "setFrame:", v122, 0.0, v119, v120);
    if (v160)
    {
      objc_msgSend(v109, "configuration");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "leadingBorderWidthForScale:", v64);
      v126 = v125;

      if ((v158 & 1) != 0)
      {
        v127 = -v126;
      }
      else
      {
        v195.origin.y = 0.0;
        v195.origin.x = v122;
        v195.size.width = v119;
        v195.size.height = v120;
        v127 = CGRectGetWidth(v195);
      }
      v196.origin.y = 0.0;
      v196.origin.x = v122;
      v196.size.width = v119;
      v196.size.height = v120;
      v197 = CGRectOffset(v196, v127, 0.0);
      objc_msgSend(v160, "setFrame:", v197.origin.x, v197.origin.y, v126, v197.size.height);
    }
  }
  if (v114)
  {
    objc_msgSend(v109, "trailingWidth");
    v129 = v128;
    v198.origin.x = v59;
    v198.origin.y = v61;
    v198.size.width = a4.width;
    v198.size.height = a4.height;
    v130 = CGRectGetHeight(v198);
    v131 = (double)v117;
    if ((v158 & 1) == 0)
    {
      v199.origin.x = v59;
      v199.origin.y = v61;
      v199.size.width = a4.width;
      v199.size.height = a4.height;
      v132 = CGRectGetWidth(v199);
      v200.origin.x = 0.0;
      v200.origin.y = 0.0;
      v200.size.width = v129;
      v200.size.height = v130;
      v131 = v132 - CGRectGetWidth(v200) - v131;
    }
    if (objc_msgSend(v110, "containsObject:", v107))
    {
      objc_msgSend(v109, "_keyboardAdjustment");
      v130 = v130 - v133;
    }
    if (v112)
      objc_msgSend(v112, "_updateControlledViewsToFrame:", v131, 0.0, v129, v130);
    else
      objc_msgSend(v149, "setFrame:", v131, 0.0, v129, v130);
    if (v108)
    {
      objc_msgSend(v109, "configuration");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "trailingBorderWidthForScale:", v64);
      v136 = v135;

      if ((v158 & 1) != 0)
      {
        v201.origin.y = 0.0;
        v201.origin.x = v131;
        v201.size.width = v129;
        v201.size.height = v130;
        v137 = CGRectGetWidth(v201);
      }
      else
      {
        v137 = -v136;
      }
      v202.origin.y = 0.0;
      v202.origin.x = v131;
      v202.size.width = v129;
      v202.size.height = v130;
      v203 = CGRectOffset(v202, v137, 0.0);
      objc_msgSend(v108, "setFrame:", v203.origin.x, v203.origin.y, v136, v203.size.height);
    }
  }

  layoutPresentationViews(v165, v163, v145);
  layoutPresentationViews(v165, v111, v144);
  layoutPresentationViews(v165, v112, v143);

}

void __65__UIPanelController__unspecifiedUpdateToNewPublicState_withSize___block_invoke(id *a1, _QWORD *a2, _QWORD *a3)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  id v11;
  id *v12;

  v12 = (id *)*a1;
  -[UIView __viewDelegate](v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_presentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && (objc_msgSend(v7, "shouldPresentInFullscreen") & 1) == 0
    && (objc_msgSend(v7, "containerView"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    v9 = objc_msgSend(v7, "shouldRemovePresentersView");
    objc_msgSend(v7, "containerView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      *a1 = v10;
      *a2 = 0;
    }
    else
    {
      *a2 = v10;
    }
    objc_msgSend(v7, "containerView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
    *a2 = 0;
  }
  *a3 = v11;

}

- (void)removeChildViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  v4 = a3;
  if (v4)
  {
    v20 = v4;
    if (!-[UIPanelController _changingViewControllerParentage](self, "_changingViewControllerParentage"))
    {
      -[UIPanelController _internalState](self, "_internalState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "leadingViewController");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (v6 == v20)
      {
        -[UIPanelController _internalState](self, "_internalState");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setLeadingViewController:", 0);

      }
      -[UIPanelController _internalState](self, "_internalState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "mainViewController");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v9 == v20)
      {
        -[UIPanelController _internalState](self, "_internalState");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setMainViewController:", 0);

      }
      -[UIPanelController _internalState](self, "_internalState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "trailingViewController");
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12 == v20)
      {
        -[UIPanelController _internalState](self, "_internalState");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setTrailingViewController:", 0);

      }
      -[UIPanelController _internalState](self, "_internalState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "collapsedViewController");
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if (v15 == v20)
      {
        -[UIPanelController _internalState](self, "_internalState");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setCollapsedViewController:", 0);

      }
      -[UIPanelController _internalState](self, "_internalState");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "preservedDetailController");
      v18 = (id)objc_claimAutoreleasedReturnValue();

      if (v18 == v20)
      {
        -[UIPanelController _internalState](self, "_internalState");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setPreservedDetailController:", 0);

      }
    }
    -[UIPanelController _setNeedsDeferredUpdate](self, "_setNeedsDeferredUpdate");
    v4 = v20;
  }

}

- (BOOL)_changingViewControllerParentage
{
  return self->__changingViewControllerParentage;
}

- (int64_t)collapsedState
{
  void *v2;
  int64_t v3;

  -[UIPanelController _internalState](self, "_internalState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "collapsedState");

  return v3;
}

- (BOOL)isAnimating
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  char v8;
  void *v9;
  void *v10;

  -[UIPanelController _internalState](self, "_internalState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UIPanelController _internalState](self, "_internalState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "animationState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "progress");
    if (v7 >= 1.0)
    {
      -[UIPanelController _internalState](self, "_internalState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "animationState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "isFinishingAnimation");

    }
    else
    {
      v8 = 1;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_collapseWithTransitionCoordinator:(id)a3
{
  void *v3;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  void (**v31)(void *, _QWORD);
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void (**v45)(void *, _QWORD);
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  UIPanelController *v51;
  id v52;
  _QWORD v53[2];
  id (*v54)(uint64_t, void *);
  void *v55;
  BOOL v56;
  _QWORD aBlock[5];
  id v58;
  id v59;
  __int128 *p_buf;
  uint64_t *v61;
  uint64_t *v62;
  uint64_t v63;
  BOOL v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  __int128 buf;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  -[UIPanelController _internalState](self, "_internalState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "collapsedState");

  if ((unint64_t)(v6 - 1) > 1)
  {
    -[UIPanelController _internalState](self, "_internalState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCollapsedState:", 1);

    -[UIPanelController setRunExpandScheduled:](self, "setRunExpandScheduled:", 0);
    -[UIPanelController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v78 = 0x3032000000;
    v79 = __Block_byref_object_copy__57;
    v80 = __Block_byref_object_dispose__57;
    v81 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "primaryViewControllerForCollapsingPanelController:", self);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v11;

    }
    v71 = 0;
    v72 = &v71;
    v73 = 0x3032000000;
    v74 = __Block_byref_object_copy__57;
    v75 = __Block_byref_object_dispose__57;
    -[UIPanelController _internalState](self, "_internalState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "supplementaryViewController");
    v76 = (id)objc_claimAutoreleasedReturnValue();

    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      v14 = 0;
    }
    else
    {
      -[UIPanelController leadingViewController](self, "leadingViewController");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (v15)
      {
        v17 = 0;
        v18 = (void *)v15;
      }
      else
      {
        -[UIPanelController trailingViewController](self, "trailingViewController");
        v19 = objc_claimAutoreleasedReturnValue();
        v3 = (void *)v19;
        if (v19)
        {
          v17 = 0;
          v18 = (void *)v19;
        }
        else
        {
          v18 = (void *)v72[5];
          if (v18)
          {
            v3 = 0;
            v17 = 0;
          }
          else
          {
            -[UIPanelController mainViewController](self, "mainViewController");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v3 = 0;
            v17 = 1;
          }
        }
      }
      objc_storeStrong((id *)(*((_QWORD *)&buf + 1) + 40), v18);
      if (v17)

      if (!v16)
      v14 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) == v72[5];
    }
    v65 = 0;
    v66 = &v65;
    v67 = 0x3032000000;
    v68 = __Block_byref_object_copy__57;
    v69 = __Block_byref_object_dispose__57;
    -[UIPanelController mainViewController](self, "mainViewController");
    v70 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v66;
    if (v66[5])
    {
      -[UIPanelController setPreservedDetailController:](self, "setPreservedDetailController:");
      v20 = v66;
      v21 = (void *)v66[5];
    }
    else
    {
      v21 = 0;
    }
    if (v21 == *(void **)(*((_QWORD *)&buf + 1) + 40))
    {
      v20[5] = 0;

    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v23 = 2;
      goto LABEL_36;
    }
    v22 = objc_msgSend(v10, "topColumnForCollapsingPanelController:", self);
    v23 = v22;
    if (v22)
    {
      if (v22 == 1)
      {
LABEL_34:
        v27 = (void *)v66[5];
        v66[5] = 0;

        goto LABEL_36;
      }
      if (v22 != 3)
      {
LABEL_36:
        v28 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __56__UIPanelController__collapseWithTransitionCoordinator___block_invoke;
        aBlock[3] = &unk_1E16C15D8;
        aBlock[4] = self;
        p_buf = &buf;
        v64 = v14;
        v61 = &v71;
        v62 = &v65;
        v63 = v23;
        v29 = v10;
        v58 = v29;
        v30 = v46;
        v59 = v30;
        v31 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
        v53[0] = v28;
        v53[1] = 3221225472;
        v54 = __56__UIPanelController__collapseWithTransitionCoordinator___block_invoke_364;
        v55 = &__block_descriptor_33_e24___UIView_16__0__UIView_8l;
        v56 = -[UIPanelController style](self, "style") != 0;
        -[UIPanelController leadingViewController](self, "leadingViewController");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "_existingView");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        __56__UIPanelController__collapseWithTransitionCoordinator___block_invoke_364((uint64_t)v53, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIPanelController supplementaryViewController](self, "supplementaryViewController");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "_existingView");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v54((uint64_t)v53, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIPanelController trailingViewController](self, "trailingViewController");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "_existingView");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v54((uint64_t)v53, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        v47[0] = v28;
        v47[1] = 3221225472;
        v47[2] = __56__UIPanelController__collapseWithTransitionCoordinator___block_invoke_2_367;
        v47[3] = &unk_1E16C1620;
        v41 = v34;
        v48 = v41;
        v42 = v37;
        v49 = v42;
        v43 = v40;
        v50 = v43;
        v51 = self;
        v44 = v29;
        v52 = v44;
        v45 = (void (**)(void *, _QWORD))_Block_copy(v47);
        if (v30)
        {
          objc_msgSend(v30, "animateAlongsideTransition:completion:", v31, v45);
        }
        else
        {
          v31[2](v31, 0);
          v45[2](v45, 0);
        }

        _Block_object_dispose(&v65, 8);
        _Block_object_dispose(&v71, 8);

        _Block_object_dispose(&buf, 8);
        goto LABEL_40;
      }
      objc_msgSend(v10, "viewControllerForColumn:", 3);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v24;

    }
    v26 = (void *)v72[5];
    v72[5] = 0;

    goto LABEL_34;
  }
  if (os_variant_has_internal_diagnostics())
  {
    v7 = _collapseWithTransitionCoordinator____s_category;
    if (!_collapseWithTransitionCoordinator____s_category)
    {
      v7 = __UILogCategoryGetNode("UIPanelController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&_collapseWithTransitionCoordinator____s_category);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134283521;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring redundant collapse request (non-workaround path): current collapsedState: %{private}ld", (uint8_t *)&buf, 0xCu);
    }
  }
LABEL_40:

}

- (UIViewController)trailingViewController
{
  void *v2;
  void *v3;

  -[UIPanelController _internalState](self, "_internalState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trailingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v3;
}

- (UIViewController)supplementaryViewController
{
  void *v2;
  void *v3;

  -[UIPanelController _internalState](self, "_internalState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supplementaryViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v3;
}

- (void)_performSingleDeferredUpdatePass
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  BOOL v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  uint64_t i;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  UIPanelController *v40;
  void *v41;
  void *v42;
  BOOL v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  $C2610746699A0CC72A5FB1B737BB04DE *p_panelControllerFlags;
  void *v52;
  id v53;
  UIPanelController *v54;
  char v55;
  void *v56;
  void (**v57)(void);
  void *v58;
  void *v59;
  void *v60;
  _QWORD v62[5];
  id v63;
  double v64;
  double v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[4];
  id v71;
  id v72;
  id location;
  char v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  -[UIPanelController delegate](self, "delegate");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v58, "panelControllerWillUpdate:", self);
    v57 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v57 = 0;
  }
  -[UIPanelController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v74 = 0;
  -[UIPanelController _internalState](self, "_internalState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "forceOverlay");

  -[UIPanelController _internalState](self, "_internalState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPanelController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "computePossibleStatesGivenParentView:withSize:forceOverlay:", v11, v9, v4, v6);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    v57[2]();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPanelController _internalState](self, "_internalState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setStateRequest:", v12);

    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      -[UIPanelController _internalState](self, "_internalState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setExternallyAnimatingStateRequest:", v12);

      -[UIPanelController currentState](self, "currentState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = affectedSidesFromState(v15);
      -[UIPanelController _internalState](self, "_internalState");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setExternallyAnimatingAffectedSides:", v16);

      objc_initWeak(&location, self);
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __53__UIPanelController__performSingleDeferredUpdatePass__block_invoke;
      v70[3] = &unk_1E16B7008;
      objc_copyWeak(&v72, &location);
      v71 = v12;
      +[UIView _addCompletion:](UIView, "_addCompletion:", v70);

      objc_destroyWeak(&v72);
      objc_destroyWeak(&location);
    }

  }
  -[UIPanelController _internalState](self, "_internalState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(v18, "copy");

  objc_msgSend(v60, "animationState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    objc_msgSend(v60, "externallyAnimatingStateRequest");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(v60, "externallyAnimatingStateRequest");
      v32 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "_stateForInteractiveRequest:withAffectedSides:inPossibleStates:", v32, objc_msgSend(v60, "externallyAnimatingAffectedSides"), v59);
      v33 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v60, "interactiveStateRequest");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        objc_msgSend(v60, "interactiveStateRequest");
        v32 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "_stateForInteractiveRequest:withAffectedSides:inPossibleStates:", v32, 0, v59);
        v33 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v60, "stateRequest");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v39)
          goto LABEL_35;
        objc_msgSend(v60, "stateRequest");
        v32 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "_matchingState:", v59);
        v33 = objc_claimAutoreleasedReturnValue();
      }
    }
    v37 = (void *)v33;
    goto LABEL_34;
  }
  objc_msgSend(v60, "animationState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "progress");
  v22 = v21 == 0.0;

  if (!v22)
  {
    v32 = v59;
    goto LABEL_28;
  }
  -[UIPanelController possibleStates](self, "possibleStates");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v23 = v59;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
  if (!v24)
  {

    v28 = 1;
    v27 = 1;
    v26 = 1;
LABEL_27:
    v32 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v56, 1);

    _updateTreatsHiddenAsOverlapsInStates(v32, v26, v27, v28);
    goto LABEL_28;
  }
  v25 = *(_QWORD *)v67;
  v26 = 1;
  v27 = 1;
  v28 = 1;
  while (2)
  {
    for (i = 0; i != v24; ++i)
    {
      if (*(_QWORD *)v67 != v25)
        objc_enumerationMutation(v23);
      v30 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
      v26 &= objc_msgSend(v30, "leadingOverlapsMain", v56);
      v27 &= objc_msgSend(v30, "trailingOverlapsMain");
      v28 &= objc_msgSend(v30, "supplementaryOverlapsMain");
      if (((v26 | v27) & 1) == 0 && !v28)
      {
        v26 = 0;
        v27 = 0;
        goto LABEL_23;
      }
    }
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
    if (v24)
      continue;
    break;
  }
LABEL_23:

  if ((v26 | v27 | v28) == 1)
    goto LABEL_27;
  v32 = v56;
LABEL_28:
  objc_msgSend(v60, "animationState", v56);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "stateRequest");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "animationState");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "_stateForInteractiveRequest:withAffectedSides:inPossibleStates:", v35, objc_msgSend(v36, "affectedSides"), v32);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_34:
  if (!v37)
  {
LABEL_35:
    objc_msgSend(v59, "firstObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v37)
      goto LABEL_50;
  }
  v40 = self;
  if ((*(_BYTE *)&self->_panelControllerFlags & 8) != 0)
  {
    -[UIPanelController _previousInternalState](self, "_previousInternalState");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42 == 0;

    if (v43)
    {
      v41 = v37;
    }
    else
    {
      v44 = affectedSidesFromState(v37);
      -[UIPanelController _previousInternalState](self, "_previousInternalState");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPanelController _previousInternalState](self, "_previousInternalState");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "stateRequest");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPanelController _lastPossiblePublicStates](self, "_lastPossiblePublicStates");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "_stateForInteractiveRequest:withAffectedSides:inPossibleStates:", v47, v44, v48);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIPanelController _lastViewSize](self, "_lastViewSize");
      if (!v41)
        goto LABEL_50;
      v4 = v49;
      v6 = v50;
    }
    v40 = self;
  }
  else
  {
    v41 = v37;
  }
  p_panelControllerFlags = &v40->_panelControllerFlags;
  *(_DWORD *)&v40->_panelControllerFlags |= 1u;
  -[UIPanelController delegate](v40, "delegate");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)p_panelControllerFlags & 8) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v52, "panelController:willChangeToState:", self, v41);
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __53__UIPanelController__performSingleDeferredUpdatePass__block_invoke_2;
  v62[3] = &unk_1E16B80A8;
  v62[4] = self;
  v53 = v41;
  v63 = v53;
  v64 = v4;
  v65 = v6;
  -[UIPanelController _performWrappedUpdate:](self, "_performWrappedUpdate:", v62);
  v54 = self;
  if ((*(_BYTE *)&self->_panelControllerFlags & 8) == 0)
  {
    -[UIPanelController _setLastComputedPublicState:](self, "_setLastComputedPublicState:", v53);
    -[UIPanelController _setPreviousInternalState:](self, "_setPreviousInternalState:", v60);
    -[UIPanelController _setLastPossiblePublicStates:](self, "_setLastPossiblePublicStates:", v59);
    -[UIPanelController _setLastViewSize:](self, "_setLastViewSize:", v4, v6);
    v55 = objc_opt_respondsToSelector();
    v54 = self;
    if ((v55 & 1) != 0)
    {
      objc_msgSend(v52, "panelController:didChangeToState:withSize:", self, v53, v4, v6);
      v54 = self;
    }
  }
  *(_DWORD *)&v54->_panelControllerFlags &= ~1u;

LABEL_50:
}

- (void)_setNeedsDeferredUpdate
{
  $C2610746699A0CC72A5FB1B737BB04DE panelControllerFlags;
  void *v4;
  $C2610746699A0CC72A5FB1B737BB04DE v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  panelControllerFlags = self->_panelControllerFlags;
  if ((*(_WORD *)&panelControllerFlags & 0x144) != 0)
  {
    if ((*(_BYTE *)&panelControllerFlags & 1) != 0)
      self->_panelControllerFlags = ($C2610746699A0CC72A5FB1B737BB04DE)(*(_DWORD *)&panelControllerFlags | 2);
  }
  else
  {
    -[UIPanelController _internalState](self, "_internalState");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "externallyAnimatingStateRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {

    }
    else
    {
      v5 = self->_panelControllerFlags;

      if ((*(_BYTE *)&v5 & 8) == 0)
      {
        if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled")&& (-[UIView window](self->_view, "window"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6)&& (-[UIPanelController collapsedState](self, "collapsedState") & 0xFFFFFFFFFFFFFFFDLL) != 1)
        {
          v8[0] = MEMORY[0x1E0C809B0];
          v8[1] = 3221225472;
          v8[2] = __44__UIPanelController__setNeedsDeferredUpdate__block_invoke;
          v8[3] = &unk_1E16B1B28;
          v8[4] = self;
          +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);
          *(_DWORD *)&self->_panelControllerFlags &= ~8u;
          -[UIPanelController _setNeedsLayoutAndPerformImmediately:](self, "_setNeedsLayoutAndPerformImmediately:", 1);
        }
        else
        {
          -[UIPanelController _setNeedsLayoutAndPerformImmediately:](self, "_setNeedsLayoutAndPerformImmediately:", 0);
        }
      }
    }
  }
}

- (UILayoutContainerView)view
{
  UILayoutContainerView *view;

  view = self->_view;
  if (!view)
  {
    -[UIPanelController loadView](self, "loadView");
    view = self->_view;
  }
  return view;
}

- (UISlidingBarStateRequest)stateRequest
{
  void *v2;
  void *v3;
  void *v4;

  -[UIPanelController _internalState](self, "_internalState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stateRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (UISlidingBarStateRequest *)v4;
}

- (void)setShowShadowViews:(BOOL)a3
{
  self->_showShadowViews = a3;
}

- (void)_setPreviousInternalState:(id)a3
{
  objc_storeStrong((id *)&self->__previousInternalState, a3);
}

- (void)_setLastViewSize:(CGSize)a3
{
  self->__lastViewSize = a3;
}

- (void)_setLastPossiblePublicStates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)_setLastComputedPublicState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)_performWrappedUpdate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *wrapperBlocksForNextUpdate;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  id *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = (id *)&v12;
  v14 = 0x3042000000;
  v15 = __Block_byref_object_copy__385;
  v16 = __Block_byref_object_dispose__386;
  v17 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__UIPanelController__performWrappedUpdate___block_invoke;
  v9[3] = &unk_1E16C1760;
  v11 = &v12;
  v5 = v4;
  v10 = v5;
  v6 = _Block_copy(v9);
  objc_storeWeak(v13 + 5, v6);
  v7 = self->_wrapperBlocksForNextUpdate;
  wrapperBlocksForNextUpdate = self->_wrapperBlocksForNextUpdate;
  self->_wrapperBlocksForNextUpdate = 0;

  (*((void (**)(void *, NSMutableArray *))v6 + 2))(v6, v7);
  _Block_object_dispose(&v12, 8);
  objc_destroyWeak(&v17);

}

void __43__UIPanelController__performWrappedUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void (*v7)(_QWORD *, _QWORD *);
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(v3, "firstObject");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __43__UIPanelController__performWrappedUpdate___block_invoke_2;
    v10[3] = &unk_1E16BACE0;
    v6 = *(_QWORD *)(a1 + 40);
    v11 = v5;
    v12 = v6;
    v7 = (void (*)(_QWORD *, _QWORD *))v4[2];
    v8 = v5;
    v7(v4, v10);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      (*(void (**)(void))(v9 + 16))();
  }

}

uint64_t __53__UIPanelController__performSingleDeferredUpdatePass__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateToNewPublicState:withSize:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (UISlidingBarConfiguration)configuration
{
  void *v2;
  void *v3;
  void *v4;

  -[UIPanelController _internalState](self, "_internalState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (UISlidingBarConfiguration *)v4;
}

- (void)setRunExpandScheduled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_panelControllerFlags = ($C2610746699A0CC72A5FB1B737BB04DE)(*(_DWORD *)&self->_panelControllerFlags & 0xFFFEFFFF | v3);
}

- (void)setDimmingView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_dimmingView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_dimmingView, a3);
    -[UIPanelController _setNeedsDeferredUpdate](self, "_setNeedsDeferredUpdate");
    v5 = v6;
  }

}

- (void)setPreservedDetailController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIPanelController _internalState](self, "_internalState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreservedDetailController:", v4);

}

- (void)setClippingViewsUnnecessary:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_panelControllerFlags = ($C2610746699A0CC72A5FB1B737BB04DE)(*(_DWORD *)&self->_panelControllerFlags & 0xFFFFFFDF | v3);
}

- (BOOL)areClippingViewsUnnecessary
{
  return (*(_BYTE *)&self->_panelControllerFlags >> 5) & 1;
}

- (void)_layoutContainerViewWillMoveToWindow:(id)a3
{
  _UIViewControllerNullAnimationTransitionCoordinator *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    if (-[UIPanelController _needsFirstTimeUpdateForTraitCollection](self, "_needsFirstTimeUpdateForTraitCollection"))
    {
      -[UIPanelController _setNeedsFirstTimeUpdateForTraitCollection:](self, "_setNeedsFirstTimeUpdateForTraitCollection:", 0);
      v4 = objc_alloc_init(_UIViewControllerNullAnimationTransitionCoordinator);
      -[UIPanelController owningViewController](self, "owningViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "traitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      +[UITraitCollection traitCollectionWithHorizontalSizeClass:](UITraitCollection, "traitCollectionWithHorizontalSizeClass:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPanelController _updateForTraitCollection:oldTraitCollection:withTransitionCoordinator:](self, "_updateForTraitCollection:oldTraitCollection:withTransitionCoordinator:", v6, v7, v4);

      -[UIPanelController owningViewController](self, "owningViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setLastNotifiedTraitCollection:", v6);

      -[_UIViewControllerNullAnimationTransitionCoordinator _runAlongsideAnimations](v4, "_runAlongsideAnimations");
      -[_UIViewControllerNullAnimationTransitionCoordinator _runAlongsideCompletionsAfterCommit](v4, "_runAlongsideCompletionsAfterCommit");

    }
    -[UIPanelController _setNeedsDeferredUpdate](self, "_setNeedsDeferredUpdate");
  }
  else
  {
    -[UIPanelController _setNeedsFirstTimeUpdateForTraitCollection:](self, "_setNeedsFirstTimeUpdateForTraitCollection:", 1);
  }
}

- (void)_removeIdentifiedChildViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UILayoutContainerView *v8;
  UILayoutContainerView *view;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPanelController owningViewController](self, "owningViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    objc_msgSend(v10, "willMoveToParentViewController:", 0);
    objc_msgSend(v10, "_existingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (self->_view)
    {
      objc_msgSend(v6, "superview");
      v8 = (UILayoutContainerView *)objc_claimAutoreleasedReturnValue();
      view = self->_view;

      if (v8 == view)
        objc_msgSend(v7, "removeFromSuperview");
    }
    objc_msgSend(v10, "removeFromParentViewController");

  }
}

- (void)_addIdentifiedChildViewController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  void *v19;
  void *v20;
  id v21;

  v4 = a3;
  if (v4)
  {
    v21 = v4;
    objc_msgSend(v4, "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPanelController owningViewController](self, "owningViewController");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v5 == (void *)v6)
    {

LABEL_15:
      goto LABEL_16;
    }
    v7 = (void *)v6;
    -[UIPanelController owningViewController](self, "owningViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "childViewControllers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "indexOfObjectIdenticalTo:", v21);

    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_16:
      -[UIPanelController _setNeedsDeferredUpdate](self, "_setNeedsDeferredUpdate");
      v4 = v21;
      goto LABEL_17;
    }
    -[UIPanelController owningViewController](self, "owningViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addChildViewController:", v21);

    if (!-[UIPanelController style](self, "style"))
    {
      -[UIPanelController leadingViewController](self, "leadingViewController");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v12 == v21)
      {

      }
      else
      {
        -[UIPanelController trailingViewController](self, "trailingViewController");
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 != v21)
          goto LABEL_11;
      }
      +[UITraitCollection traitCollectionWithHorizontalSizeClass:](UITraitCollection, "traitCollectionWithHorizontalSizeClass:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPanelController owningViewController](self, "owningViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setOverrideTraitCollection:forChildViewController:", v14, v21);

    }
LABEL_11:
    -[UIPanelController _contentView](self, "_contentView");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      v18 = -[UIPanelController style](self, "style");

      if (!v18)
      {
        -[UIPanelController _contentView](self, "_contentView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "view");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addSubview:", v20);

      }
    }
    -[UIPanelController owningViewController](self, "owningViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "didMoveToParentViewController:", v5);
    goto LABEL_15;
  }
LABEL_17:

}

- (UIViewController)owningViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_owningViewController);
}

- (void)_setNeedsLayoutAndPerformImmediately:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[UIView setNeedsLayout](self->_view, "setNeedsLayout");
  *(_DWORD *)&self->_panelControllerFlags |= 0x2000u;
  if (v3)
    -[UIView layoutIfNeeded](self->_view, "layoutIfNeeded");
}

- (UIView)_contentView
{
  return self->__contentView;
}

- (UIPanelController)initWithOwningViewController:(id)a3
{
  id v4;
  UIPanelController *v5;
  UIPanelController *v6;
  _UIPanelInternalState *v7;
  UISlidingBarConfiguration *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIPanelController;
  v5 = -[UIPanelController init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[UIPanelController setOwningViewController:](v5, "setOwningViewController:", v4);
    v7 = objc_alloc_init(_UIPanelInternalState);
    -[UIPanelController _setInternalState:](v6, "_setInternalState:", v7);

    v8 = objc_alloc_init(UISlidingBarConfiguration);
    -[UIPanelController _internalState](v6, "_internalState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setConfiguration:", v8);

    -[UIPanelController _setNeedsFirstTimeUpdateForTraitCollection:](v6, "_setNeedsFirstTimeUpdateForTraitCollection:", 1);
  }

  return v6;
}

- (void)_setNeedsFirstTimeUpdateForTraitCollection:(BOOL)a3
{
  self->__needsFirstTimeUpdateForTraitCollection = a3;
}

- (void)setOwningViewController:(id)a3
{
  objc_storeWeak((id *)&self->_owningViewController, a3);
}

- (void)_setInternalState:(id)a3
{
  objc_storeStrong((id *)&self->__internalState, a3);
}

- (BOOL)_needsFirstTimeUpdateForTraitCollection
{
  return self->__needsFirstTimeUpdateForTraitCollection;
}

- (void)setLeadingTrailingWrapsNavigationController:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_panelControllerFlags = ($C2610746699A0CC72A5FB1B737BB04DE)(*(_DWORD *)&self->_panelControllerFlags & 0xFFFFBFFF | v3);
}

- (void)setSupplementaryViewController:(id)a3
{
  -[UIPanelController setSupplementaryViewController:changingParentage:](self, "setSupplementaryViewController:changingParentage:", a3, 1);
}

- (void)__viewWillLayoutSubviews
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  $C2610746699A0CC72A5FB1B737BB04DE panelControllerFlags;
  $C2610746699A0CC72A5FB1B737BB04DE v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  $C2610746699A0CC72A5FB1B737BB04DE v20;

  -[UIPanelController _sourceTransitionView](self, "_sourceTransitionView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[UIPanelController _sourceTransitionView](self, "_sourceTransitionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPanelController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      panelControllerFlags = self->_panelControllerFlags;

      if ((*(_WORD *)&panelControllerFlags & 0x400) == 0)
        return;
    }
    else
    {

    }
  }
  v9 = self->_panelControllerFlags;
  if ((*(_WORD *)&v9 & 0x200) == 0)
  {
    if ((*(_WORD *)&v9 & 0x2000) != 0)
    {
      self->_panelControllerFlags = ($C2610746699A0CC72A5FB1B737BB04DE)(*(_DWORD *)&v9 & 0xFFFFDFFF);
    }
    else
    {
      -[UIPanelController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      v12 = v11;
      v14 = v13;
      -[UIPanelController _lastViewSize](self, "_lastViewSize");
      v16 = v15;
      v18 = v17;

      if (v12 == v16 && v14 == v18)
        return;
      v19 = +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled");
      v20 = self->_panelControllerFlags;
      if ((((*(_BYTE *)&v20 & 8) == 0) & ~v19) == 0 && (*(_BYTE *)&v20 & 0x80) != 0)
        return;
    }
    -[UIPanelController _performDeferredUpdate](self, "_performDeferredUpdate");
  }
}

- (UIView)_sourceTransitionView
{
  return self->__sourceTransitionView;
}

- (void)_performDeferredUpdate
{
  int panelControllerFlags;
  char v4;

  panelControllerFlags = *(_DWORD *)&self->_panelControllerFlags | 4;
  v4 = 1;
  do
  {
    self->_panelControllerFlags = ($C2610746699A0CC72A5FB1B737BB04DE)(panelControllerFlags & 0xFFFFFFFD);
    -[UIPanelController _performSingleDeferredUpdatePass](self, "_performSingleDeferredUpdatePass");
    panelControllerFlags = (int)self->_panelControllerFlags;
    if ((v4 & 1) == 0)
      break;
    v4 = 0;
  }
  while ((panelControllerFlags & 2) != 0);
  self->_panelControllerFlags = ($C2610746699A0CC72A5FB1B737BB04DE)(panelControllerFlags & 0xFFFFFFF9);
}

- (CGSize)_lastViewSize
{
  double width;
  double height;
  CGSize result;

  width = self->__lastViewSize.width;
  height = self->__lastViewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4 superBlock:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  _UIPanelControllerMeshAnimatingTransitionView *v15;
  id v16;
  CGAffineTransform v17;

  v16 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  -[UIPanelController owningViewController](self, "owningViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView window](self->_view, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (v8)
      objc_msgSend(v8, "targetTransform");
    else
      memset(&v17, 0, sizeof(v17));
    if (!CGAffineTransformIsIdentity(&v17))
    {
      if (-[UIPanelController _willCollapseWithNewTraitCollection:oldTraitCollection:](self, "_willCollapseWithNewTraitCollection:oldTraitCollection:", v16, v11))
      {

      }
      else
      {
        v13 = -[UIPanelController _willExpandWithNewTraitCollection:oldTraitCollection:](self, "_willExpandWithNewTraitCollection:oldTraitCollection:", v16, v11);

        if (!v13)
          goto LABEL_12;
      }
      -[UIPanelController _contentView](self, "_contentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "snapshotViewAfterScreenUpdates:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v15 = -[_UIPanelControllerMeshAnimatingTransitionView initWithView:]([_UIPanelControllerMeshAnimatingTransitionView alloc], "initWithView:", v12);
        -[UIPanelController _setSourceTransitionView:](self, "_setSourceTransitionView:", v15);

      }
    }
  }

LABEL_12:
  *(_DWORD *)&self->_panelControllerFlags |= 0x40u;
  -[UIPanelController _updateForTraitCollection:oldTraitCollection:withTransitionCoordinator:](self, "_updateForTraitCollection:oldTraitCollection:withTransitionCoordinator:", v16, v11, v8);
  *(_DWORD *)&self->_panelControllerFlags &= ~0x40u;
  if (v9)
    v9[2](v9);

}

void __56__UIPanelController__collapseWithTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  objc_msgSend(*(id *)(a1 + 32), "_internalState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "collapsedState");

  if (v3 == 1)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[2] = __56__UIPanelController__collapseWithTransitionCoordinator___block_invoke_2;
    v6[3] = &unk_1E16C15B0;
    v4 = *(void **)(a1 + 40);
    v6[4] = *(_QWORD *)(a1 + 32);
    v12 = *(_BYTE *)(a1 + 88);
    v5 = *(_QWORD *)(a1 + 80);
    v10 = *(_QWORD *)(a1 + 72);
    v11 = v5;
    v6[1] = 3221225472;
    v9 = *(_OWORD *)(a1 + 56);
    v7 = v4;
    v8 = *(id *)(a1 + 48);
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v6);

  }
}

- (void)setDelegate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  int v7;
  id v8;

  v8 = a3;
  -[UIPanelController _internalState](self, "_internalState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v8)
  {
    -[UIPanelController _internalState](self, "_internalState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", v8);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 0x8000;
    else
      v7 = 0;
    self->_panelControllerFlags = ($C2610746699A0CC72A5FB1B737BB04DE)(*(_DWORD *)&self->_panelControllerFlags & 0xFFFF7FFF | v7);
  }

}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (id)allViewControllers
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

  v3 = (void *)objc_opt_new();
  -[UIPanelController mainViewController](self, "mainViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIPanelController mainViewController](self, "mainViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[UIPanelController leadingViewController](self, "leadingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIPanelController leadingViewController](self, "leadingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  -[UIPanelController trailingViewController](self, "trailingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIPanelController trailingViewController](self, "trailingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  -[UIPanelController collapsedViewController](self, "collapsedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_msgSend(v3, "indexOfObjectIdenticalTo:", v10);
    if (v11)
    {
      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v3, "removeObjectAtIndex:", v11);
      objc_msgSend(v3, "insertObject:atIndex:", v10, 0);
    }
  }

  return v3;
}

- (UIViewControllerTransitionCoordinator)transitionCoordinator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[UIPanelController _internalState](self, "_internalState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "animatorShouldCoordinate"))
  {
    -[UIPanelController _internalState](self, "_internalState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "animationState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "animator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return (UIViewControllerTransitionCoordinator *)v7;
}

- (BOOL)supportsColumnStyle
{
  return self->_style != 0;
}

- (void)_layoutContainerViewDidMoveToWindow:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (v8)
    {
      objc_msgSend(v8, "screen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPanelController _observeKeyboardNotificationsOnScreen:](self, "_observeKeyboardNotificationsOnScreen:", v6);

      -[UIPanelController _adjustForKeyboardInfo:](self, "_adjustForKeyboardInfo:", 0);
    }
    else
    {
      -[UIPanelController _stopObservingKeyboardNotifications](self, "_stopObservingKeyboardNotifications");
      -[UIPanelController _internalState](self, "_internalState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setKeyboardAdjustment:", 0.0);

    }
  }

}

- (void)traitCollectionDidChange:(id)a3 toNewTraits:(id)a4
{
  id v6;
  _BOOL4 v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (-[UIPanelController _hasUpdatedForTraitCollection](self, "_hasUpdatedForTraitCollection"))
  {
    if (dyld_program_sdk_at_least())
    {
      v7 = objc_msgSend(v6, "horizontalSizeClass") == 1;
      if (v7 != -[UIPanelController isCollapsed](self, "isCollapsed"))
        -[UIPanelController _updateForTraitCollection:oldTraitCollection:withTransitionCoordinator:](self, "_updateForTraitCollection:oldTraitCollection:withTransitionCoordinator:", v6, v8, 0);
    }
  }

}

- (void)_updateForTraitCollection:(id)a3 oldTraitCollection:(id)a4 withTransitionCoordinator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UIPanelController _internalState](self, "_internalState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leadingViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[UIPanelController _internalState](self, "_internalState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mainViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      -[UIPanelController _internalState](self, "_internalState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "trailingViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        -[UIPanelController _internalState](self, "_internalState");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "collapsedViewController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
          goto LABEL_13;
        goto LABEL_7;
      }

    }
  }

LABEL_7:
  if (-[UIPanelController _willCollapseWithNewTraitCollection:oldTraitCollection:](self, "_willCollapseWithNewTraitCollection:oldTraitCollection:", v8, v9))
  {
    if (os_variant_has_internal_diagnostics())
    {
      v17 = _updateForTraitCollection_oldTraitCollection_withTransitionCoordinator____s_category[0];
      if (!_updateForTraitCollection_oldTraitCollection_withTransitionCoordinator____s_category[0])
      {
        v17 = __UILogCategoryGetNode("UIPanelController", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v17, _updateForTraitCollection_oldTraitCollection_withTransitionCoordinator____s_category);
      }
      v18 = *(NSObject **)(v17 + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = v18;
        -[UIPanelController _internalState](self, "_internalState");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "collapsedState");
        -[UIPanelController owningViewController](self, "owningViewController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "traitCollection");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 134284035;
        v25 = v21;
        v26 = 2113;
        v27 = v23;
        v28 = 2113;
        v29 = v8;
        _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_DEFAULT, "About to collapse, current collapsedState : %{private}ld, current traitCollection: %{private}@ new traitCollection: %{private}@", (uint8_t *)&v24, 0x20u);

      }
    }
    -[UIPanelController _collapseWithTransitionCoordinator:](self, "_collapseWithTransitionCoordinator:", v10);
  }
  else if (-[UIPanelController _willExpandWithNewTraitCollection:oldTraitCollection:](self, "_willExpandWithNewTraitCollection:oldTraitCollection:", v8, v9))
  {
    -[UIPanelController _expandWithTransitionCoordinator:](self, "_expandWithTransitionCoordinator:", v10);
  }
  -[UIPanelController _setHasUpdatedForTraitCollection:](self, "_setHasUpdatedForTraitCollection:", 1);
LABEL_13:

}

- (BOOL)_willCollapseWithNewTraitCollection:(id)a3 oldTraitCollection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;

  v6 = a4;
  v7 = a3;
  -[UIPanelController _internalState](self, "_internalState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "collapsedState");

  v10 = objc_msgSend(v6, "horizontalSizeClass");
  v11 = objc_msgSend(v7, "horizontalSizeClass");

  if (v11 != 1)
    return 0;
  v12 = !-[UIPanelController _hasUpdatedForTraitCollection](self, "_hasUpdatedForTraitCollection");
  if (v10 == 2)
    LOBYTE(v12) = 1;
  return !v9 || v12;
}

- (BOOL)_hasUpdatedForTraitCollection
{
  return self->__hasUpdatedForTraitCollection;
}

- (void)_setHasUpdatedForTraitCollection:(BOOL)a3
{
  self->__hasUpdatedForTraitCollection = a3;
}

- (BOOL)_willExpandWithNewTraitCollection:(id)a3 oldTraitCollection:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v14;

  v6 = a3;
  v7 = a4;
  if (-[UIPanelController _willCollapseWithNewTraitCollection:oldTraitCollection:](self, "_willCollapseWithNewTraitCollection:oldTraitCollection:", v6, v7))
  {
    v8 = 0;
  }
  else
  {
    -[UIPanelController _internalState](self, "_internalState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "collapsedState");

    v11 = objc_msgSend(v7, "horizontalSizeClass");
    v12 = objc_msgSend(v6, "horizontalSizeClass");
    v14 = v11 == 1 || v10 == 2;
    v8 = v12 == 2 && v14;
  }

  return v8;
}

- (void)_updateToNewPublicState:(id)a3 withSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  double v25;
  double v26;
  id v27;
  _BOOL4 v28;
  id v29;
  int v30;
  void *v31;
  id v32;
  UIPanelController *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  UIPanelController *v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  UIPanelController *v42;
  void *v43;
  void *v44;
  int v45;
  double v46;
  void *v47;
  UIPanelController *v48;
  void *v49;
  uint64_t v50;
  _BOOL4 v51;
  void *v52;
  UIPanelController *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  UIPanelController *v59;
  void *v60;
  void *v61;
  UIPanelController *v62;
  double v63;
  void *v64;
  UIPanelController *v65;
  void *v66;
  void *v67;
  UIDimmingView *v68;
  void *v69;
  UIDimmingView *v70;
  $C2610746699A0CC72A5FB1B737BB04DE panelControllerFlags;
  id v72;
  uint64_t v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  UIPanelController *v78;
  int v79;
  uint64_t v80;
  unint64_t v81;
  int v82;
  int v83;
  _UIMTCaptureView *v84;
  char v85;
  char v86;
  char v87;
  char v88;
  void *v89;
  id v90;
  _BOOL4 v91;
  unint64_t v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  int v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t i;
  void *v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t j;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t k;
  void *v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t m;
  void *v123;
  void *v124;
  BOOL v125;
  void *v126;
  void *v127;
  void *v128;
  BOOL v129;
  void *v130;
  void *v131;
  void *v132;
  BOOL v133;
  void *v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  void *v140;
  UIPanelController *v141;
  double v142;
  double v143;
  double v144;
  double v145;
  void *v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  void *v157;
  _BOOL4 v158;
  id v159;
  int v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  CGFloat v174;
  CGFloat v175;
  char v176;
  double v177;
  CGFloat v178;
  CGFloat v179;
  double v180;
  void *v181;
  int v182;
  double v183;
  double v184;
  char v185;
  double v186;
  double v187;
  double v188;
  id v189;
  double v190;
  double v191;
  double v192;
  double v193;
  id v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  double v203;
  double v204;
  uint64_t v205;
  char v206;
  double v207;
  double v208;
  double v209;
  double v210;
  double v211;
  double v212;
  double v213;
  double v214;
  double v215;
  void *v216;
  void *v217;
  id v218;
  void *v219;
  id v220;
  int v221;
  id v222;
  id v223;
  BOOL v224;
  int v225;
  char v226;
  int v227;
  int v228;
  int v229;
  void *v230;
  void *v231;
  double v232;
  double v233;
  double v234;
  void *v235;
  double v236;
  double v237;
  double v238;
  double v239;
  double v240;
  double v241;
  double v242;
  double v243;
  double v244;
  double v245;
  double v246;
  double v247;
  double v248;
  double v249;
  double v250;
  double v251;
  double v252;
  double v253;
  double v254;
  double v255;
  double v256;
  double v257;
  double v258;
  double v259;
  double v260;
  double v261;
  double v262;
  double v263;
  double v264;
  double v265;
  char v266;
  double v267;
  double v268;
  int v269;
  double v270;
  double v271;
  BOOL v272;
  char v273;
  double v274;
  double v275;
  double v277;
  double v278;
  unint64_t v279;
  NSObject *v280;
  double v281;
  double v282;
  double v283;
  double v285;
  double v286;
  double v288;
  double v289;
  unint64_t v290;
  NSObject *v291;
  double v292;
  double v293;
  double v294;
  double v295;
  double v296;
  double v297;
  double v298;
  double v299;
  double v300;
  double v301;
  id v302;
  int v303;
  char v304;
  double v305;
  BOOL v306;
  double v307;
  int v308;
  int v309;
  char v310;
  double v311;
  double v312;
  int v313;
  int v314;
  char v315;
  double v316;
  double v317;
  CGFloat v318;
  double MaxX;
  double *v320;
  int v321;
  unsigned __int8 v322;
  double v323;
  double v324;
  double v325;
  unsigned __int8 v326;
  double v327;
  double v328;
  id v329;
  id v330;
  double v331;
  double v332;
  double v333;
  void *v334;
  double v335;
  unsigned int v336;
  double v337;
  double v338;
  unsigned int v339;
  unsigned int v340;
  unsigned int v341;
  unsigned int v342;
  double *v343;
  double v344;
  int v345;
  double v346;
  double v347;
  double v348;
  double v349;
  void *v350;
  id v351;
  id v352;
  int v353;
  int v354;
  int v355;
  int v356;
  char v357;
  int v358;
  int v359;
  double v360;
  double v361;
  double v362;
  double v363;
  double v364;
  double v365;
  double v366;
  double v367;
  double v368;
  double v369;
  double v370;
  double v371;
  void *v372;
  double v373;
  double v374;
  double v375;
  double v376;
  double v377;
  double v378;
  double v379;
  double v380;
  double v381;
  double v382;
  double v383;
  double v384;
  double v385;
  double v386;
  double v387;
  int v388;
  CGFloat v389;
  CGFloat v390;
  CGFloat v391;
  double v392;
  double v393;
  double v394;
  double v395;
  double x;
  double v397;
  void *v398;
  id v399;
  id v400;
  void *v401;
  void *v402;
  double v403;
  double v404;
  double v405;
  double y;
  double v407;
  double v408;
  int v409;
  double v410;
  double v411;
  double v412;
  double v413;
  double v414;
  double v415;
  double v416;
  double v417;
  double v418;
  double v419;
  double v420;
  double v421;
  int v422;
  CGFloat v423;
  CGFloat v424;
  CGFloat v425;
  double v426;
  double v427;
  double v428;
  double v429;
  double v430;
  double v431;
  double v432;
  void *v433;
  id v434;
  id v435;
  void *v436;
  void *v437;
  double v438;
  double v439;
  double v440;
  double v441;
  double v442;
  double v443;
  int v444;
  double v445;
  double v446;
  double v447;
  double v448;
  id v449;
  id v450;
  double v451;
  double v452;
  double v453;
  double v454;
  id v455;
  double v456;
  double v457;
  double v458;
  double v459;
  double v460;
  double v461;
  double v462;
  double v463;
  void *v464;
  void *v465;
  void *v466;
  void *v467;
  void *v468;
  void *v469;
  int v470;
  void *v471;
  _BOOL4 v472;
  uint64_t v473;
  uint64_t v474;
  id v475;
  BOOL v477;
  void *v478;
  char v479;
  id v480;
  id v481;
  void *v482;
  int v483;
  int v484;
  BOOL v485;
  unint64_t v486;
  NSObject *v487;
  id v488;
  id v489;
  id v490;
  id v491;
  double v492;
  double v493;
  double v494;
  double v495;
  int v496;
  int v497;
  void *v498;
  BOOL v499;
  CGFloat v500;
  CGFloat v501;
  CGFloat v502;
  CGFloat v503;
  CGFloat v504;
  CGFloat v505;
  CGFloat v506;
  CGFloat v507;
  void (**v508)(void *, uint64_t);
  void *v509;
  void *v510;
  void *v511;
  unint64_t v512;
  NSObject *v513;
  unint64_t v514;
  NSObject *v515;
  unint64_t v516;
  NSObject *v517;
  unint64_t v518;
  NSObject *v519;
  unint64_t v520;
  NSObject *v521;
  unint64_t v522;
  NSObject *v523;
  unint64_t v524;
  NSObject *v525;
  unint64_t v526;
  NSObject *v527;
  NSObject *v528;
  double v529;
  id v530;
  int v531;
  id v532;
  _BOOL4 v533;
  double v534;
  _BOOL4 v535;
  id v536;
  void *v537;
  void *v538;
  int v539;
  id v540;
  _BOOL4 v541;
  id v542;
  id v543;
  id v544;
  id v545;
  id v546;
  id v547;
  double v548;
  id v549;
  id v550;
  uint64_t v551;
  void *v552;
  void *v553;
  double v554;
  double v555;
  id v556;
  id v557;
  int v558;
  id v559;
  id v560;
  id v561;
  double v562;
  void *v563;
  id v564;
  double v565;
  id v566;
  void *v567;
  double v568;
  id v569;
  uint64_t v570;
  uint64_t v571;
  uint64_t v572;
  id v573;
  id v574;
  id v575;
  id v576;
  id v577;
  void *v578;
  id v579;
  id v580;
  double v581;
  id v582;
  id v583;
  int v584;
  id v585;
  void *v586;
  void *v587;
  double v588;
  id v589;
  void *v590;
  id v591;
  id v592;
  void *v593;
  id v594;
  id v595;
  _UIMTCaptureView *v596;
  void *v597;
  id v598;
  id v599;
  void *v600;
  void *v601;
  void *v602;
  double rect;
  uint64_t v604;
  id v605;
  CGFloat r1;
  unint64_t r1_8;
  id r1_16;
  CGFloat r1_24;
  CGFloat v610;
  unint64_t v611;
  int v612;
  int v613;
  int v614;
  int v615;
  int v616;
  double v617;
  void *v618;
  int v619;
  int v620;
  void *v621;
  void *v622;
  UIPanelController *v623;
  int v624;
  _QWORD aBlock[4];
  id v626;
  id v627;
  _QWORD v628[2];
  void (*v629)(uint64_t);
  void *v630;
  _QWORD *v631;
  _QWORD v632[2];
  BOOL (*v633)(uint64_t, void *);
  void *v634;
  _QWORD *v635;
  _QWORD v636[2];
  void (*v637)(uint64_t, void *);
  void *v638;
  UIPanelController *v639;
  __int128 v640;
  __int128 v641;
  __int128 v642;
  __int128 v643;
  __int128 v644;
  __int128 v645;
  __int128 v646;
  __int128 v647;
  __int128 v648;
  __int128 v649;
  __int128 v650;
  __int128 v651;
  __int128 v652;
  __int128 v653;
  __int128 v654;
  __int128 v655;
  id v656;
  id v657;
  id v658;
  id v659;
  id v660;
  id v661;
  id v662;
  id v663;
  id v664;
  id v665;
  id v666;
  id v667;
  uint8_t v668[16];
  uint8_t buf[8];
  uint64_t v670;
  void (*v671)(uint64_t, void *, void *, void *, double, double, double);
  void *v672;
  id v673;
  id v674;
  uint64_t *v675;
  CGFloat v676;
  char v677;
  uint64_t v678;
  double *v679;
  uint64_t v680;
  double v681;
  _BYTE v682[128];
  _BYTE v683[128];
  _BYTE v684[128];
  _BYTE v685[128];
  uint64_t v686;
  CGRect v687;
  CGRect v688;
  CGRect v689;
  CGRect v690;
  CGRect v691;
  CGRect v692;
  CGRect v693;
  CGRect v694;
  CGRect v695;
  CGRect v696;
  CGRect v697;
  CGRect v698;
  CGRect v699;
  CGRect v700;
  CGRect v701;
  CGRect v702;
  CGRect v703;
  CGRect v704;
  CGRect v705;
  CGRect v706;
  CGRect v707;
  CGRect v708;
  CGRect v709;
  CGRect v710;
  CGRect v711;
  CGRect v712;
  CGRect v713;
  CGRect v714;
  CGRect v715;
  CGRect v716;
  CGRect v717;
  CGRect v718;
  CGRect v719;
  CGRect v720;
  CGRect v721;
  CGRect v722;
  CGRect v723;
  CGRect v724;
  CGRect v725;
  CGRect v726;
  CGRect v727;
  CGRect v728;
  CGRect v729;
  CGRect v730;
  CGRect v731;
  CGRect v732;
  CGRect v733;
  CGRect v734;
  CGRect v735;
  CGRect v736;

  height = a4.height;
  width = a4.width;
  v686 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!-[UIPanelController style](self, "style"))
  {
    -[UIPanelController _unspecifiedUpdateToNewPublicState:withSize:](self, "_unspecifiedUpdateToNewPublicState:withSize:", v7, width, height);
    goto LABEL_794;
  }
  r1_24 = width;
  v610 = height;
  v622 = v7;
  v623 = self;
  -[UIPanelController _contentView](self, "_contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPanelController _internalState](v623, "_internalState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leadingViewController");
  v602 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPanelController _internalState](v623, "_internalState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mainViewController");
  v538 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPanelController _internalState](v623, "_internalState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trailingViewController");
  v601 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPanelController _internalState](v623, "_internalState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "supplementaryViewController");
  v586 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v622, "_collapsedState") == 1 || objc_msgSend(v622, "_collapsedState") == 2;
  -[UIPanelController _internalState](v623, "_internalState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "collapsedViewController");
  v537 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPanelController configuration](v623, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v551 = objc_msgSend(v15, "supplementaryEdge");

  objc_msgSend(v622, "configuration");
  v600 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v583 = v538;
    objc_msgSend(v583, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v622;
    objc_msgSend(v622, "leadingWidth");
    if (v20 <= 0.0 && (objc_msgSend(v622, "leadingOffscreenWidth"), v21 <= 0.0))
    {
      v17 = 0;
    }
    else
    {
      objc_msgSend(v602, "view");
      v17 = (unint64_t)(id)objc_claimAutoreleasedReturnValue();

      v19 = v622;
    }
    objc_msgSend(v19, "trailingWidth");
    if (v22 <= 0.0 && (objc_msgSend(v19, "trailingOffscreenWidth"), v23 <= 0.0))
    {
      v24 = 0;
    }
    else
    {
      objc_msgSend(v601, "view");
      v24 = (id)objc_claimAutoreleasedReturnValue();

      v19 = v622;
    }
    objc_msgSend(v19, "supplementaryWidth");
    if (v25 <= 0.0 && (objc_msgSend(v19, "supplementaryOffscreenWidth"), v26 <= 0.0))
    {
      v612 = 0;
      v28 = 0;
      r1_16 = 0;
    }
    else
    {
      objc_msgSend(v586, "view");
      v27 = (id)objc_claimAutoreleasedReturnValue();

      v612 = 0;
      v28 = v27 != 0;
      r1_16 = v27;
      if (v27 && !v17 && !v24)
      {
        v29 = v27;
        v17 = (unint64_t)v29;
        if (v551)
        {
          v18 = 0;
          v28 = 1;
          r1_16 = v29;
          v612 = 1;
          v30 = 1;
          if ((objc_msgSend(v600, "forceOverlay") & 1) != 0)
            goto LABEL_38;
          goto LABEL_32;
        }
        v24 = 0;
        v612 = 1;
        v28 = 1;
        r1_16 = v29;
      }
    }
    if ((objc_msgSend(v600, "forceOverlay") & 1) != 0 || v17 && (objc_msgSend(v622, "leadingOverlapsMain") & 1) != 0)
    {
      v30 = 1;
      v18 = v17;
      v17 = (unint64_t)v24;
      goto LABEL_38;
    }
    v18 = v17;
    if (!v24)
    {
      v17 = 0;
LABEL_35:
      if (r1_16)
      {
        v30 = objc_msgSend(v622, "supplementaryOverlapsMain");
      }
      else
      {
        r1_16 = 0;
        v30 = 0;
      }
LABEL_38:
      objc_msgSend(v600, "borderColor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {

      }
      else if (-[UILayoutContainerView backgroundColorIsDefault](v623->_view, "backgroundColorIsDefault"))
      {
        +[UIColor _splitViewBorderColor](UIColor, "_splitViewBorderColor");
        v32 = (id)objc_claimAutoreleasedReturnValue();

        if ((v30 & 1) != 0)
        {
          v615 = 0;
          v33 = v623;
          if (!v18)
            goto LABEL_66;
          goto LABEL_49;
        }
        v33 = v623;
        if (objc_msgSend(v600, "borderAbuttingMainRendersAsShadow"))
        {
          if (v18 | v17)
            v45 = 1;
          else
            v45 = v28;
          v615 = v45;
          if (!v18)
            goto LABEL_66;
          goto LABEL_49;
        }
LABEL_48:
        v615 = 0;
        if (!v18)
          goto LABEL_66;
LABEL_49:
        objc_msgSend(v600, "leadingBorderWidthForScale:", 1.0);
        if (v36 > 0.0)
        {
          -[UIPanelController _leadingBorderView](v33, "_leadingBorderView");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          v38 = v623;
          if (!v37)
          {
            -[UIPanelController _createBorderView](v623, "_createBorderView");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v623;
            -[UIPanelController _setLeadingBorderView:](v623, "_setLeadingBorderView:", v39);

          }
          -[UIPanelController _leadingBorderView](v38, "_leadingBorderView");
          v604 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v604, "setRenderAsShadow:", 0);
          objc_msgSend((id)v604, "setBackgroundColor:", v32);
          objc_msgSend((id)v604, "setNeedsLayout");
          v40 = v551 != 0;
          if (!r1_16)
            v40 = 1;
          if (((v612 | v40) & 1) != 0)
          {
            v567 = 0;
          }
          else
          {
            -[UIPanelController _supplementaryBorderView](v623, "_supplementaryBorderView");
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            v42 = v623;
            if (!v41)
            {
              -[UIPanelController _createBorderView](v623, "_createBorderView");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = v623;
              -[UIPanelController _setSupplementaryBorderView:](v623, "_setSupplementaryBorderView:", v43);

            }
            -[UIPanelController _supplementaryBorderView](v42, "_supplementaryBorderView");
            v567 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v567, "setRenderAsShadow:", 0);
            objc_msgSend((id)v604, "backgroundColor");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v567, "setBackgroundColor:", v44);

            objc_msgSend(v567, "setNeedsLayout");
          }
          v33 = v623;
          if (!v17)
            goto LABEL_77;
LABEL_67:
          objc_msgSend(v600, "trailingBorderWidthForScale:", 1.0);
          if (v46 > 0.0)
          {
            -[UIPanelController _trailingBorderView](v33, "_trailingBorderView");
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            v48 = v623;
            if (!v47)
            {
              -[UIPanelController _createBorderView](v623, "_createBorderView");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = v623;
              -[UIPanelController _setTrailingBorderView:](v623, "_setTrailingBorderView:", v49);

            }
            -[UIPanelController _trailingBorderView](v48, "_trailingBorderView");
            v50 = objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v50, "setRenderAsShadow:", 0);
            objc_msgSend((id)v50, "setBackgroundColor:", v32);
            objc_msgSend((id)v50, "setNeedsLayout");
            if (r1_16)
              v51 = v551 == 0;
            else
              v51 = 1;
            if (((v612 | v51) & 1) == 0)
            {
              -[UIPanelController _supplementaryBorderView](v623, "_supplementaryBorderView");
              v52 = (void *)objc_claimAutoreleasedReturnValue();

              v53 = v623;
              if (!v52)
              {
                -[UIPanelController _createBorderView](v623, "_createBorderView");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = v623;
                -[UIPanelController _setSupplementaryBorderView:](v623, "_setSupplementaryBorderView:", v54);

              }
              -[UIPanelController _supplementaryBorderView](v53, "_supplementaryBorderView");
              v55 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v55, "setRenderAsShadow:", 0);
              objc_msgSend((id)v50, "backgroundColor");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "setBackgroundColor:", v56);

              objc_msgSend(v55, "setNeedsLayout");
              v567 = v55;
            }
LABEL_78:
            if (v18 | v17)
              v57 = v612 ^ 1;
            else
              v57 = 0;
            v563 = (void *)v50;
            if (v604 | v50)
            {
              objc_msgSend(v600, "borderColor");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIPanelController _setBorderViewsObserveViewBackgroundColor:](v623, "_setBorderViewsObserveViewBackgroundColor:", v58 == 0);

              if (!v30)
              {
LABEL_83:
                v553 = 0;
                goto LABEL_89;
              }
            }
            else
            {
              -[UIPanelController _setBorderViewsObserveViewBackgroundColor:](v623, "_setBorderViewsObserveViewBackgroundColor:", 0);
              if (!v30)
                goto LABEL_83;
            }
            v59 = v623;
            if (-[UIPanelController showShadowViews](v623, "showShadowViews"))
            {
              -[UIPanelController _overlayEdgeShadowView](v623, "_overlayEdgeShadowView");
              v60 = (void *)objc_claimAutoreleasedReturnValue();

              v59 = v623;
              if (!v60)
              {
                -[UIPanelController _createOverlayShadowView](v623, "_createOverlayShadowView");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                v59 = v623;
                -[UIPanelController _setOverlayEdgeShadowView:](v623, "_setOverlayEdgeShadowView:", v61);

              }
            }
            -[UIPanelController _overlayEdgeShadowView](v59, "_overlayEdgeShadowView");
            v553 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_89:
            v619 = v28 & v57;
            if ((v28 & v57) != 0)
            {
              v62 = v623;
              if (!-[UIPanelController isAnimating](v623, "isAnimating"))
              {
                objc_msgSend(v622, "supplementaryDragOffset");
                if (v63 == 0.0)
                {
                  v552 = 0;
                  v578 = 0;
                  goto LABEL_103;
                }
              }
              -[UIPanelController _supplementaryParallaxShadowView](v623, "_supplementaryParallaxShadowView");
              v64 = (void *)objc_claimAutoreleasedReturnValue();

              v65 = v623;
              if (!v64)
              {
                -[UIPanelController _createOverlayShadowView](v623, "_createOverlayShadowView");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = v623;
                -[UIPanelController _setSupplementaryParallaxShadowView:](v623, "_setSupplementaryParallaxShadowView:", v66);

              }
              -[UIPanelController _supplementaryParallaxShadowView](v65, "_supplementaryParallaxShadowView");
              v578 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIPanelController _primaryParallaxDimmingView](v623, "_primaryParallaxDimmingView");
              v67 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v67)
              {
                v68 = [UIDimmingView alloc];
                if (v18)
                  v69 = (void *)v18;
                else
                  v69 = (void *)v17;
                objc_msgSend(v69, "frame");
                v70 = -[UIDimmingView initWithFrame:](v68, "initWithFrame:");
                -[UIPanelController _setPrimaryParallaxDimmingView:](v623, "_setPrimaryParallaxDimmingView:", v70);

              }
              -[UIPanelController _primaryParallaxDimmingView](v623, "_primaryParallaxDimmingView");
              v552 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v552 = 0;
              v578 = 0;
            }
            v62 = v623;
LABEL_103:
            if (((v30 | ((*(_BYTE *)&v62->_panelControllerFlags & 0x20) >> 5)) & 1) == 0
              && (objc_msgSend(v600, "allowTotalWidthGreaterThanParent") & 1) == 0
              && (panelControllerFlags = v62->_panelControllerFlags, (*(_BYTE *)&panelControllerFlags & 0x80) == 0)
              && ((*(_BYTE *)&panelControllerFlags & 8) != 0
               || -[UIPanelController isAnimating](v62, "isAnimating")
               || (*(_BYTE *)&v62->_panelControllerFlags & 0x10) != 0))
            {
              -[UIPanelController leadingBarContentClippingView](v62, "leadingBarContentClippingView");
              v572 = objc_claimAutoreleasedReturnValue();
              -[UIPanelController trailingBarContentClippingView](v623, "trailingBarContentClippingView");
              v571 = objc_claimAutoreleasedReturnValue();
              v205 = -[UIPanelController style](v623, "style");
              v206 = v612 ^ 1;
              if (v205 != 2)
                v206 = 1;
              if ((v206 & 1) != 0)
              {
                v570 = 0;
              }
              else
              {
                -[UIPanelController supplementaryBarContentClippingView](v623, "supplementaryBarContentClippingView");
                v570 = objc_claimAutoreleasedReturnValue();
              }
            }
            else
            {
              v570 = 0;
              v571 = 0;
              v572 = 0;
            }

            goto LABEL_111;
          }
LABEL_77:
          v50 = 0;
          goto LABEL_78;
        }
LABEL_66:
        v567 = 0;
        v604 = 0;
        if (!v17)
          goto LABEL_77;
        goto LABEL_67;
      }
      objc_msgSend(v600, "borderColor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (v34)
      {
        v32 = v34;
      }
      else
      {
        -[UIView backgroundColor](v623->_view, "backgroundColor");
        v32 = (id)objc_claimAutoreleasedReturnValue();

      }
      v33 = v623;

      goto LABEL_48;
    }
    v17 = (unint64_t)v24;
LABEL_32:
    if ((objc_msgSend(v622, "trailingOverlapsMain") & 1) != 0)
    {
      v30 = 1;
      goto LABEL_38;
    }
    goto LABEL_35;
  }
  v583 = v537;
  objc_msgSend(v583, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v615 = 0;
  v619 = 0;
  v570 = 0;
  v571 = 0;
  v572 = 0;
  v552 = 0;
  v553 = 0;
  v578 = 0;
  v567 = 0;
  v563 = 0;
  v604 = 0;
  r1_16 = 0;
  v17 = 0;
  v18 = 0;
LABEL_111:
  v667 = v16;
  v666 = 0;
  v665 = 0;
  __65__UIPanelController__unspecifiedUpdateToNewPublicState_withSize___block_invoke(&v667, &v666, &v665);
  v559 = v667;

  v547 = v666;
  v545 = v665;
  v664 = (id)v18;
  v663 = 0;
  v662 = 0;
  __65__UIPanelController__unspecifiedUpdateToNewPublicState_withSize___block_invoke(&v664, &v663, &v662);
  r1_8 = (unint64_t)v664;

  v546 = v663;
  v544 = v662;
  v661 = (id)v17;
  v660 = 0;
  v659 = 0;
  __65__UIPanelController__unspecifiedUpdateToNewPublicState_withSize___block_invoke(&v661, &v660, &v659);
  v611 = (unint64_t)v661;

  v540 = v660;
  v543 = v659;
  if (v619)
  {
    v658 = r1_16;
    v657 = 0;
    v656 = 0;
    __65__UIPanelController__unspecifiedUpdateToNewPublicState_withSize___block_invoke(&v658, &v657, &v656);
    v72 = v658;

    v536 = v657;
    v542 = v656;
    v73 = 7;
    r1_16 = v72;
  }
  else
  {
    v542 = 0;
    v536 = 0;
    v73 = 5;
  }
  v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", v73);
  v593 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v73);
  v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", 2);
  v76 = v74;
  v77 = v76;
  v78 = v623;
  v79 = r1_8;
  v80 = v604;
  v81 = (unint64_t)v563;
  if (v559)
    objc_msgSend(v76, "addObject:");
  if (v547)
    objc_msgSend(v77, "addObject:");
  if (r1_8)
  {
    if ((objc_msgSend(v622, "leadingOverlapsMain") & 1) != 0)
    {
      v79 = 1;
    }
    else if (r1_16 == (id)r1_8)
    {
      v79 = objc_msgSend(v622, "supplementaryOverlapsMain");
    }
    else
    {
      v79 = 0;
    }
  }
  if (!v611)
    goto LABEL_128;
  if (objc_msgSend(v622, "trailingOverlapsMain"))
  {
    objc_msgSend(v600, "allowTotalWidthGreaterThanParent");
    goto LABEL_130;
  }
  if (r1_16 == (id)v611)
    v82 = objc_msgSend(v622, "supplementaryOverlapsMain");
  else
LABEL_128:
    v82 = 0;
  v83 = objc_msgSend(v600, "allowTotalWidthGreaterThanParent");
  if ((v79 | v82) != 1)
  {
    v596 = 0;
    v597 = 0;
    if ((v619 & v83) != 1)
      goto LABEL_138;
    goto LABEL_134;
  }
LABEL_130:
  -[UIPanelController _captureView](v623, "_captureView");
  v78 = v623;
  v84 = (_UIMTCaptureView *)objc_claimAutoreleasedReturnValue();
  if (!v84)
  {
    v84 = objc_alloc_init(_UIMTCaptureView);
    -[UIPanelController _setMaterialThemesCaptureView:](v623, "_setMaterialThemesCaptureView:", v84);
  }
  v596 = v84;
  objc_msgSend(v77, "addObject:", v84);
LABEL_134:
  -[UIPanelController dimmingView](v78, "dimmingView");
  v597 = (void *)objc_claimAutoreleasedReturnValue();
  if (v597)
    objc_msgSend(v77, "addObject:");
  else
    v597 = 0;
  v80 = v604;
  v81 = (unint64_t)v563;
LABEL_138:
  v85 = dyld_program_sdk_at_least();
  v86 = v85;
  if (v80 && (v85 & 1) == 0)
    objc_msgSend(v77, "addObject:", v80);
  if (r1_8)
  {
    objc_msgSend(v77, "addObject:", r1_8);
    if (v546)
      objc_msgSend(v77, "addObject:", v546);
    objc_msgSend(v593, "addObject:", r1_8);
  }
  if (v81)
    v87 = v86;
  else
    v87 = 1;
  if ((v87 & 1) == 0)
    objc_msgSend(v77, "addObject:", v81);
  if (v611)
  {
    objc_msgSend(v77, "addObject:", v611);
    if (v540)
      objc_msgSend(v77, "addObject:");
    objc_msgSend(v593, "addObject:", v611);
    if (v81)
      objc_msgSend(v77, "addObject:", v81);
  }
  if (v619)
  {
    objc_msgSend(v77, "addObject:", r1_16);
    if (v536)
      objc_msgSend(v77, "addObject:");
    objc_msgSend(v593, "addObject:", r1_16);
    if (v567)
      objc_msgSend(v77, "addObject:", v567);
  }
  v88 = v86 ^ 1;
  if (!((v80 == 0) | v88 & 1))
    objc_msgSend(v77, "addObject:", v80);
  if (!((v81 == 0) | v88 & 1))
    objc_msgSend(v77, "addObject:", v81);
  if (v553 && v597)
    objc_msgSend(v77, "insertObject:atIndex:", v553, objc_msgSend(v77, "indexOfObject:", v597) + 1);
  if (v615)
  {
    if (v80)
      v89 = (void *)v80;
    else
      v89 = (void *)v81;
    if (v567)
      v89 = v567;
    v90 = v89;
    objc_msgSend(v90, "setRenderAsShadow:", 1);

  }
  if (r1_8 | v611)
    v91 = v552 != 0;
  else
    v91 = 0;
  v533 = v91;
  if (v91)
  {
    if (r1_8)
      v92 = r1_8;
    else
      v92 = v611;
    objc_msgSend(v77, "insertObject:atIndex:", v552, objc_msgSend(v77, "indexOfObject:", v92) + 1);
  }
  if (v578)
  {
    v93 = objc_msgSend(v77, "indexOfObject:", r1_16);
    if (v81 | v80)
    {
      if (v80)
      {
        objc_msgSend(v77, "insertObject:atIndex:", v80, v93);
        v94 = v77;
        v95 = v80;
      }
      else
      {
        objc_msgSend(v77, "insertObject:atIndex:", v81, v93);
        v94 = v77;
        v95 = v81;
      }
      v93 = objc_msgSend(v94, "indexOfObject:", v95);
    }
    objc_msgSend(v77, "insertObject:atIndex:", v578, v93);
  }
  v541 = (r1_8 | v611) != 0;
  objc_msgSend(v8, "subviews");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "array");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(v96, "isEqualToArray:", v97);

  objc_msgSend(0, "contentView");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  if (v99)
  {
    v100 = v99;

LABEL_193:
    objc_msgSend(v100, "subviews");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "array");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v616 = objc_msgSend(v101, "isEqualToArray:", v102) ^ 1;

    goto LABEL_194;
  }
  objc_msgSend(0, "contentView");
  v100 = (id)objc_claimAutoreleasedReturnValue();

  if (v100)
    goto LABEL_193;
  v616 = 0;
LABEL_194:
  if (v98)
  {
    objc_msgSend(v8, "setNeedsLayout");
  }
  else
  {
    v654 = 0u;
    v655 = 0u;
    v652 = 0u;
    v653 = 0u;
    objc_msgSend(v8, "subviews");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v652, v685, 16);
    if (v104)
    {
      v105 = *(_QWORD *)v653;
      do
      {
        for (i = 0; i != v104; ++i)
        {
          if (*(_QWORD *)v653 != v105)
            objc_enumerationMutation(v103);
          v107 = *(void **)(*((_QWORD *)&v652 + 1) + 8 * i);
          if ((objc_msgSend(v77, "containsObject:", v107) & 1) == 0
            && (objc_msgSend(v75, "containsObject:", v107) & 1) == 0)
          {
            objc_msgSend(v107, "removeFromSuperview");
          }
        }
        v104 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v652, v685, 16);
      }
      while (v104);
    }

    v650 = 0u;
    v651 = 0u;
    v648 = 0u;
    v649 = 0u;
    v108 = v77;
    v109 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v648, v684, 16);
    if (v109)
    {
      v110 = 0;
      v111 = *(_QWORD *)v649;
      do
      {
        for (j = 0; j != v109; ++j)
        {
          if (*(_QWORD *)v649 != v111)
            objc_enumerationMutation(v108);
          objc_msgSend(v8, "insertSubview:atIndex:", *(_QWORD *)(*((_QWORD *)&v648 + 1) + 8 * j), v110 + j);
        }
        v109 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v648, v684, 16);
        v110 += j;
      }
      while (v109);
    }

  }
  if (v616)
  {
    v646 = 0u;
    v647 = 0u;
    v644 = 0u;
    v645 = 0u;
    objc_msgSend(v100, "subviews");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v644, v683, 16);
    if (v114)
    {
      v115 = *(_QWORD *)v645;
      do
      {
        for (k = 0; k != v114; ++k)
        {
          if (*(_QWORD *)v645 != v115)
            objc_enumerationMutation(v113);
          v117 = *(void **)(*((_QWORD *)&v644 + 1) + 8 * k);
          if ((objc_msgSend(v77, "containsObject:", v117) & 1) == 0
            && (objc_msgSend(v75, "containsObject:", v117) & 1) == 0)
          {
            objc_msgSend(v117, "removeFromSuperview");
          }
        }
        v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v644, v683, 16);
      }
      while (v114);
    }

    v642 = 0u;
    v643 = 0u;
    v640 = 0u;
    v641 = 0u;
    v118 = v75;
    v119 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v640, v682, 16);
    if (v119)
    {
      v120 = 0;
      v121 = *(_QWORD *)v641;
      do
      {
        for (m = 0; m != v119; ++m)
        {
          if (*(_QWORD *)v641 != v121)
            objc_enumerationMutation(v118);
          objc_msgSend(v100, "insertSubview:atIndex:", *(_QWORD *)(*((_QWORD *)&v640 + 1) + 8 * m), v120 + m);
        }
        v119 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v640, v682, 16);
        v120 += m;
      }
      while (v119);
    }

  }
  v636[0] = MEMORY[0x1E0C809B0];
  v636[1] = 3221225472;
  v637 = (void (*)(uint64_t, void *))__54__UIPanelController__updateToNewPublicState_withSize___block_invoke_2;
  v638 = &unk_1E16C1788;
  v639 = v623;
  v632[0] = MEMORY[0x1E0C809B0];
  v632[1] = 3221225472;
  v633 = __54__UIPanelController__updateToNewPublicState_withSize___block_invoke_401;
  v634 = &__block_descriptor_40_e37_B24__0__UIView_8__UIViewController_16lu32l8;
  v635 = v636;
  if (__54__UIPanelController__updateToNewPublicState_withSize___block_invoke_401((uint64_t)v632, (void *)v572))
  {
    -[UIPanelController leadingBarContentClippingView](v623, "leadingBarContentClippingView");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "subviews");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = objc_msgSend(v124, "count") == 0;

    if (!v125)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v513 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v513, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v513, OS_LOG_TYPE_FAULT, "Removing nonempty clipping view. UINavigationBar content may be missing", buf, 2u);
        }
      }
      else
      {
        v512 = qword_1ECD76CF8;
        if (!qword_1ECD76CF8)
        {
          v512 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v512, (unint64_t *)&qword_1ECD76CF8);
        }
        v513 = *(id *)(v512 + 8);
        if (os_log_type_enabled(v513, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v513, OS_LOG_TYPE_ERROR, "Removing nonempty clipping view. UINavigationBar content may be missing", buf, 2u);
        }
      }

    }
    -[UIPanelController leadingBarContentClippingView](v623, "leadingBarContentClippingView");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "removeFromSuperview");

  }
  if (v633((uint64_t)v632, (void *)v571))
  {
    -[UIPanelController trailingBarContentClippingView](v623, "trailingBarContentClippingView");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "subviews");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = objc_msgSend(v128, "count") == 0;

    if (!v129)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v515 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v515, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v515, OS_LOG_TYPE_FAULT, "Removing nonempty clipping view. UINavigationBar content may be missing", buf, 2u);
        }
      }
      else
      {
        v514 = qword_1ECD76D00;
        if (!qword_1ECD76D00)
        {
          v514 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v514, (unint64_t *)&qword_1ECD76D00);
        }
        v515 = *(id *)(v514 + 8);
        if (os_log_type_enabled(v515, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v515, OS_LOG_TYPE_ERROR, "Removing nonempty clipping view. UINavigationBar content may be missing", buf, 2u);
        }
      }

    }
    -[UIPanelController trailingBarContentClippingView](v623, "trailingBarContentClippingView");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "removeFromSuperview");

  }
  if (v633((uint64_t)v632, (void *)v570))
  {
    -[UIPanelController supplementaryBarContentClippingView](v623, "supplementaryBarContentClippingView");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "subviews");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = objc_msgSend(v132, "count") == 0;

    if (!v133)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v517 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v517, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v517, OS_LOG_TYPE_FAULT, "Removing nonempty clipping view. UINavigationBar content may be missing", buf, 2u);
        }
      }
      else
      {
        v516 = qword_1ECD76D08;
        if (!qword_1ECD76D08)
        {
          v516 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v516, (unint64_t *)&qword_1ECD76D08);
        }
        v517 = *(id *)(v516 + 8);
        if (os_log_type_enabled(v517, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v517, OS_LOG_TYPE_ERROR, "Removing nonempty clipping view. UINavigationBar content may be missing", buf, 2u);
        }
      }

    }
    -[UIPanelController supplementaryBarContentClippingView](v623, "supplementaryBarContentClippingView");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "removeFromSuperview");

  }
  if (+[UIView _materialSidebarsEnabled]())
  {
    if (objc_msgSend(v622, "leadingOverlapsMain"))
      v135 = 2;
    else
      v135 = 0;
    -[UIPanelController leadingViewController](v623, "leadingViewController");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "_setOverrideUserInterfaceRenderingMode:", v135);

    if (objc_msgSend(v622, "trailingOverlapsMain"))
      v137 = 2;
    else
      v137 = 0;
    -[UIPanelController trailingViewController](v623, "trailingViewController");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "_setOverrideUserInterfaceRenderingMode:", v137);

    if (objc_msgSend(v622, "supplementaryOverlapsMain"))
      v139 = 2;
    else
      v139 = 0;
    -[UIPanelController supplementaryViewController](v623, "supplementaryViewController");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "_setOverrideUserInterfaceRenderingMode:", v139);

  }
  v141 = v623;
  if ((*(_BYTE *)&v623->_panelControllerFlags & 8) != 0)
  {
    r1 = *MEMORY[0x1E0C9D538];
    rect = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    objc_msgSend(v8, "bounds");
    r1 = v142;
    rect = v143;
    r1_24 = v144;
    v610 = v145;
    v141 = v623;
  }
  -[UIPanelController view](v141, "view");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v613 = objc_msgSend(v146, "_shouldReverseLayoutDirection");

  objc_msgSend(v8, "_currentScreenScale");
  v617 = v147;
  if (v619)
  {
    objc_msgSend(v622, "leadingWidth");
    v149 = v148;
    objc_msgSend(v622, "leadingDragOffset");
    if (v149 - v150 <= 0.0
      && (objc_msgSend(v622, "trailingWidth"), v152 = v151, objc_msgSend(v622, "trailingDragOffset"), v152 - v153 <= 0.0))
    {
      v535 = 0;
    }
    else
    {
      objc_msgSend(v622, "supplementaryWidth");
      v155 = v154;
      objc_msgSend(v622, "supplementaryDragOffset");
      v535 = v155 - v156 > 0.0;
    }
    v590 = v567;
    v157 = r1_16;
  }
  else
  {
    v590 = 0;
    v157 = 0;
    v535 = 0;
  }
  v158 = -[UIPanelController wantsFloatingSidebar](v623, "wantsFloatingSidebar");
  v592 = v597;
  v159 = v622;
  v160 = v158 | dyld_program_sdk_at_least() ^ 1;
  v161 = r1;
  v162 = r1_24;
  v163 = v610;
  if ((v160 & 1) == 0)
  {
    if (r1_8)
    {
      objc_msgSend(v159, "leadingWidth");
      v165 = v164;
      objc_msgSend(v159, "leadingDragOffset");
    }
    else
    {
      objc_msgSend(v159, "trailingWidth");
      v165 = v167;
      objc_msgSend(v159, "trailingDragOffset");
    }
    v168 = v166;
    objc_msgSend(v159, "supplementaryWidth");
    v170 = v169;
    objc_msgSend(v159, "supplementaryDragOffset");
    v172 = v165 + v170 - v168 - v171;
    if (((r1_8 == 0) | v613) == 1)
    {
      v173 = r1;
      v161 = r1;
      v175 = r1_24;
      v174 = v610;
      v162 = r1_24;
      v163 = v610;
      if (v172 <= 0.0)
        goto LABEL_277;
      v176 = v613 ^ 1;
      if (!v611)
        v176 = 1;
      if ((v176 & 1) != 0)
      {
        v161 = r1;
LABEL_276:
        v177 = rect;
        v178 = v175;
        v179 = v174;
        v180 = CGRectGetWidth(*(CGRect *)&v173);
        v687.origin.x = r1;
        v687.origin.y = rect;
        v687.size.width = r1_24;
        v687.size.height = v610;
        v163 = CGRectGetHeight(v687);
        v162 = v180 - v172;
        goto LABEL_277;
      }
    }
    else
    {
      v173 = r1;
      v161 = r1;
      v175 = r1_24;
      v174 = v610;
      v162 = r1_24;
      v163 = v610;
      if (v172 <= 0.0)
        goto LABEL_277;
    }
    v161 = v173 + v172;
    goto LABEL_276;
  }
LABEL_277:
  objc_msgSend(v592, "setFrame:", v161, rect, v162, v163);
  objc_msgSend(v159, "configuration");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = objc_msgSend(v181, "allowTotalWidthGreaterThanParent");

  v184 = 1.0;
  if ((!v535 | v182) != 1)
    goto LABEL_303;
  if (r1_16)
    v185 = v182;
  else
    v185 = 1;
  if ((v185 & 1) != 0)
  {
    v184 = 0.0;
    if (!(r1_8 | v611))
      goto LABEL_303;
    if ((v535 & v182) == 1)
    {
      objc_msgSend(v159, "leadingDragOffset", 0.0);
      v187 = v186;
      objc_msgSend(v159, "trailingDragOffset");
      v184 = v187 + v188;
      v183 = 1.0;
      if (v184 == 0.0)
        goto LABEL_300;
    }
    if (v182)
    {
      v189 = v159;
      objc_msgSend(v189, "leadingWidth");
      v191 = v190;
      objc_msgSend(v189, "trailingWidth");
      v193 = v192;

      v194 = v189;
      objc_msgSend(v194, "leadingDragOffset");
      v196 = v195;
      objc_msgSend(v194, "trailingDragOffset");
      v198 = v197;
      objc_msgSend(v194, "supplementaryDragOffset");
      v200 = v199;

      v183 = 0.0;
      if (v191 + v193 > 0.0)
      {
        v201 = (v191 + v193 - (v196 + v198 + v200)) / (v191 + v193);
        goto LABEL_298;
      }
    }
    else
    {
      objc_msgSend(v159, "leadingWidth", v184);
      v208 = v207;
      objc_msgSend(v159, "trailingWidth");
      v210 = v209;
      objc_msgSend(v159, "leadingDragOffset");
      v212 = v211;
      objc_msgSend(v159, "trailingDragOffset");
      v183 = 0.0;
      if (v208 + v210 > 0.0)
      {
        v201 = (v208 + v210 - (v212 + v213)) / (v208 + v210);
LABEL_298:
        v214 = fmax(v201, 0.0);
        v183 = 1.0;
        if (v214 <= 1.0)
          v183 = v214;
      }
    }
LABEL_300:
    v215 = 1.0;
    if (v182)
      v215 = 0.5;
    v184 = v215 * v183;
    goto LABEL_303;
  }
  objc_msgSend(v159, "supplementaryWidth", 1.0);
  v203 = v202;
  objc_msgSend(v159, "supplementaryDragOffset");
  v183 = v204;
  v184 = 0.0;
  if (v203 > 0.0)
  {
    v184 = fmax((v203 - v183) / v203, 0.0);
    v183 = 1.0;
    if (v184 > 1.0)
      v184 = 1.0;
  }
LABEL_303:
  objc_msgSend(v592, "setPercentDisplayed:", v184, v183);

  if (v551)
    v216 = 0;
  else
    v216 = v586;
  if (v551)
    v217 = v586;
  else
    v217 = 0;
  if (v602)
    v216 = v602;
  v218 = v216;
  v219 = v601;
  if (!v601)
    v219 = v217;
  v220 = v219;
  v531 = objc_msgSend(v600, "_supplementaryAdoptsPrimaryBackgroundStyle");
  v221 = v619 ^ 1;
  if (!r1_16)
    v221 = 0;
  v620 = v221;
  v549 = (id)r1_8;
  v573 = (id)v604;
  v222 = v157;
  v598 = v590;
  v561 = v578;
  v591 = v559;
  v576 = v563;
  v550 = (id)v611;
  v223 = v159;
  v532 = v593;
  v594 = v218;
  v580 = v586;
  v575 = v583;
  v557 = v220;
  v587 = v222;
  if (v222)
    v224 = r1_8 != 0;
  else
    v224 = 0;
  if (v611 != 0 && v224)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v510 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void layoutSideBySideViewsColumnStyle(UIView *__strong, UIView *__strong, UIPanelBorderView *__strong, UIView *__strong, BOOL, UIPanelBorderView *__strong, UIView *__strong, UIView *__strong, UIPanelBorderView *__strong, UIView *__strong, UIView *__strong, BOOL, UISlidingBarState *__strong, BOOL, CGRect, NSMutableSet *__strong, CGFloat, UIViewController *__strong, UIViewController *__strong, UIViewController *__strong, UIViewController *__strong)");
    v511 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v510, "handleFailureInFunction:file:lineNumber:description:", v511, CFSTR("UIPanelController.m"), 3164, CFSTR("Side-by-side layout not supported for all non-nil leading, trailing, and supplementary views. This is an internal UIKit problem."));

  }
  v225 = objc_msgSend(v223, "supplementaryOverlapsMain");
  if (v594)
    v226 = v620;
  else
    v226 = 1;
  if (v594)
    v227 = v225;
  else
    v227 = 0;
  if ((v226 & 1) != 0)
  {
    if (v594)
      v228 = v225;
    else
      v228 = 1;
    if (v594)
      v229 = 0;
    else
      v229 = v225;
    if (v620 & 1 | (v594 != 0))
    {
      v584 = (v594 != 0) | v225;
    }
    else
    {
      v584 = objc_msgSend(v223, "trailingOverlapsMain");
      v228 = 1;
      v229 = v584;
    }
  }
  else
  {
    v227 = objc_msgSend(v223, "leadingOverlapsMain");
    v229 = 0;
    v584 = 1;
    v228 = v227;
  }
  v230 = v573;
  if (!v604)
    v230 = v576;
  if (v598)
    v230 = v598;
  v530 = v230;
  objc_msgSend(v530, "renderAsShadow");
  if ((v541 & v620) != 1)
  {
    v565 = 0.0;
    v548 = 0.0;
    if (!(r1_8 | v611))
      goto LABEL_347;
    goto LABEL_346;
  }
  if (v594 == v580 || (v565 = 0.0, v548 = 0.0, v557 == v580))
  {
LABEL_346:
    objc_msgSend(v223, "configuration");
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v231, "rubberBandExtension");
    v565 = v232;

    objc_msgSend(v223, "_rubberBandInset");
    UIRoundToScale(v233, v617);
    v548 = v234;
  }
LABEL_347:
  if (v604)
  {
    objc_msgSend(v223, "configuration");
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v235, "leadingBorderWidthForScale:", v617);
    v568 = v236;
LABEL_351:

    goto LABEL_352;
  }
  if (v576)
  {
    objc_msgSend(v223, "configuration");
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v235, "trailingBorderWidthForScale:", v617);
    v568 = v237;
    goto LABEL_351;
  }
  v568 = 0.0;
LABEL_352:
  objc_msgSend(v223, "supplementaryWidth");
  v239 = v238;
  objc_msgSend(v223, "supplementaryOffscreenWidth");
  if (v239 >= v240)
    v240 = v239;
  UIRoundToScale(v240, v617);
  v242 = v241;
  if (v594)
  {
    objc_msgSend(v223, "leadingOffscreenWidth");
    if (v243 > 0.0)
    {
      objc_msgSend(v223, "leadingWidth");
      if (v244 != 0.0)
      {
        objc_msgSend(v223, "leadingWidth");
        objc_msgSend(v223, "leadingOffscreenWidth");
      }
    }
  }
  else
  {
    objc_msgSend(v223, "trailingOffscreenWidth");
    if (v245 > 0.0)
    {
      objc_msgSend(v223, "trailingWidth");
      if (v246 != 0.0)
      {
        objc_msgSend(v223, "trailingWidth");
        objc_msgSend(v223, "trailingOffscreenWidth");
      }
    }
  }
  objc_msgSend(v223, "supplementaryOffscreenWidth");
  v248 = v247;
  objc_msgSend(v223, "_supplementaryOverlayWidth");
  v250 = v249;
  v251 = 0.0;
  if ((v620 & 1) != 0)
  {
    v534 = 0.0;
    v529 = v248;
    v555 = v242;
    v252 = 0.0;
  }
  else
  {
    objc_msgSend(v223, "leadingWidth");
    v254 = v253;
    objc_msgSend(v223, "leadingOffscreenWidth");
    if (v254 >= v255)
      v255 = v254;
    UIRoundToScale(v255, v617);
    v257 = v256;
    objc_msgSend(v223, "leadingOffscreenWidth");
    v529 = v258;
    objc_msgSend(v223, "trailingWidth");
    v260 = v259;
    objc_msgSend(v223, "trailingOffscreenWidth");
    if (v260 >= v261)
      v261 = v260;
    UIRoundToScale(v261, v617);
    v555 = v262;
    objc_msgSend(v223, "trailingOffscreenWidth");
    v264 = v263;
    objc_msgSend(v223, "supplementaryDragOffset");
    v252 = v265;
    v251 = v242;
    v534 = v248;
    v248 = v264;
    v242 = v257;
  }
  if ((v228 & v584 & 1) != 0)
    v266 = 0;
  else
    v266 = objc_msgSend(v223, "_supplementaryEntirelyOverlapsMain");
  v267 = 0.0;
  v268 = 0.0;
  v269 = v620;
  if ((v228 & 1) == 0)
  {
    if (v620)
    {
      objc_msgSend(v223, "supplementaryDragOffset");
      v271 = v270;
      v272 = v270 == 0.0 && v242 > 0.0;
      v273 = v266;
      if (v272)
      {
        objc_msgSend(v223, "supplementaryWidth");
        if (v274 == 0.0)
          v271 = v242;
        v273 = v266;
      }
    }
    else
    {
      objc_msgSend(v223, "leadingDragOffset");
      v271 = v275;
      if (v275 == 0.0 && v242 > 0.0)
      {
        objc_msgSend(v223, "leadingWidth");
        if (v277 == 0.0)
          v271 = v242;
      }
      v273 = objc_msgSend(v223, "_leadingEntirelyOverlapsMain");
    }
    v278 = 0.0 - v271;
    if (!v227 || (v273 & 1) != 0)
    {
      v269 = v620;
    }
    else
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v280 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v280, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v280, OS_LOG_TYPE_FAULT, "Unexpected overlay and side-by-side combination", buf, 2u);
        }
      }
      else
      {
        v279 = qword_1ECD76D10;
        if (!qword_1ECD76D10)
        {
          v279 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v279, (unint64_t *)&qword_1ECD76D10);
        }
        v280 = *(id *)(v279 + 8);
        if (os_log_type_enabled(v280, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v280, OS_LOG_TYPE_ERROR, "Unexpected overlay and side-by-side combination", buf, 2u);
        }
      }

      v281 = v250;
      v269 = v620;
      if ((v620 & 1) == 0)
      {
        objc_msgSend(v223, "_leadingOverlayWidth", v250);
        v269 = v620;
      }
      v278 = v278 + v242 - v281;
    }
    v268 = v548 - v565 + v278;
  }
  if ((v584 & 1) == 0)
  {
    if (v269)
    {
      objc_msgSend(v223, "supplementaryDragOffset", v555);
      v283 = v282;
      if (v282 == 0.0 && v555 > 0.0)
      {
        objc_msgSend(v223, "supplementaryWidth");
        if (v285 == 0.0)
          v283 = v555;
      }
    }
    else
    {
      objc_msgSend(v223, "trailingDragOffset", v555);
      v283 = v286;
      if (v286 == 0.0 && v555 > 0.0)
      {
        objc_msgSend(v223, "trailingWidth");
        if (v288 == 0.0)
          v283 = v555;
      }
      v266 = objc_msgSend(v223, "_trailingEntirelyOverlapsMain");
    }
    v289 = v283 + 0.0;
    if (v229 && (v266 & 1) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v291 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v291, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v291, OS_LOG_TYPE_FAULT, "Unexpected overlay and side-by-side combination", buf, 2u);
        }
      }
      else
      {
        v290 = qword_1ECD76D18;
        if (!qword_1ECD76D18)
        {
          v290 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v290, (unint64_t *)&qword_1ECD76D18);
        }
        v291 = *(id *)(v290 + 8);
        if (os_log_type_enabled(v291, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v291, OS_LOG_TYPE_ERROR, "Unexpected overlay and side-by-side combination", buf, 2u);
        }
      }

      if ((v620 & 1) == 0)
      {
        objc_msgSend(v223, "_trailingOverlayWidth");
        v250 = v292;
      }
      v289 = v289 + v555 - v250;
    }
    v267 = v565 - v548 + v289;
  }
  UIRoundToScale(v268, v617);
  v294 = v293;
  UIRoundToScale(v267, v617);
  v296 = v295;
  UIRoundToScale(v252, v617);
  v298 = v297;
  objc_msgSend(v223, "mainWidth");
  v300 = v299;
  if ((v228 & 1) != 0)
  {
    v301 = 0.0;
    v302 = v559;
    if ((v584 & 1) == 0)
      v301 = v565 - v548 + v251 + v555 - v296 - v298;
    v303 = v620;
  }
  else
  {
    v301 = v565 - v548 + v251 + v242 + v294 - v298;
    v303 = v620;
    v302 = v559;
    if (v294 != 0.0 && v242 + v294 == 0.0 && (!v587 ? (v304 = 1) : (v304 = v620), (v304 & 1) != 0 || v534 == 0.0))
    {
      v305 = v568;
    }
    else
    {
      v305 = 0.0;
      v306 = v534 != v242 - v294 - v298 || v534 == 0.0;
      if (!v306)
        v305 = v568;
    }
    v294 = v294 - v305;
  }
  v539 = v303 ^ 1;
  if (v302)
  {
    v307 = v300;
    if (v300 == 0.0)
    {
      v688.origin.x = r1;
      v688.origin.y = rect;
      v688.size.width = r1_24;
      v688.size.height = v610;
      v307 = CGRectGetWidth(v688);
      if ((v228 & 1) == 0)
      {
        v308 = 0;
        if (v604)
        {
          if (v242 > 0.0)
          {
            v308 = 0;
            if (v529 < v242 && v298 == 0.0)
              v308 = objc_msgSend(v573, "renderAsShadow", v529) ^ 1;
          }
        }
        v309 = 0;
        v310 = v539 ^ 1;
        if (!v598)
          v310 = 1;
        if ((v310 & 1) == 0 && v251 > 0.0 && v534 < v251)
          v309 = objc_msgSend(v598, "renderAsShadow", v534) ^ 1;
        v311 = 1.0;
        if ((v308 & v309) != 0)
          v311 = 2.0;
        v312 = v568 * v311;
        if (!(v308 | v309))
          v312 = 0.0;
        v307 = v307 - v301 - v312;
      }
      if ((v584 & 1) == 0)
      {
        v313 = 0;
        if (v563)
        {
          if (v555 > 0.0)
          {
            v313 = 0;
            if (v248 < v555 && v298 == 0.0)
              v313 = objc_msgSend(v576, "renderAsShadow") ^ 1;
          }
        }
        v314 = 0;
        v315 = v539 ^ 1;
        if (!v598)
          v315 = 1;
        if ((v315 & 1) == 0 && v251 > 0.0 && v534 < v251)
          v314 = objc_msgSend(v598, "renderAsShadow", v534) ^ 1;
        v316 = 1.0;
        if ((v313 & v314) != 0)
          v316 = 2.0;
        v317 = v568 * v316;
        if (!(v313 | v314))
          v317 = 0.0;
        v307 = v307 - v301 - v317;
      }
    }
  }
  else
  {
    v307 = v300;
  }
  v689.origin.x = r1;
  v689.origin.y = rect;
  v689.size.width = r1_24;
  v689.size.height = v610;
  v318 = CGRectGetHeight(v689);
  v678 = 0;
  v679 = (double *)&v678;
  v680 = 0x2020000000;
  v681 = 0.0;
  if ((v613 & 1) != 0)
  {
    v690.origin.x = r1;
    v690.origin.y = rect;
    v690.size.width = r1_24;
    v690.size.height = v610;
    MaxX = CGRectGetMaxX(v690);
    v320 = v679;
    v679[3] = MaxX;
    if ((v228 & 1) != 0)
    {
      v321 = v620;
      if ((v584 & 1) != 0)
        goto LABEL_509;
      if (v300 == 0.0)
      {
        v324 = v548;
      }
      else
      {
        MaxX = v548 + v301 + v307;
        v320[3] = MaxX;
        if (v301 <= 0.0)
          goto LABEL_509;
        v322 = v539;
        if (!v598)
          v322 = 0;
        if (v251 <= 0.0)
          v322 = 0;
        v323 = 1.0;
        if ((v322 & (v534 < v251)) != 0)
          v323 = 2.0;
        v324 = v568 * v323;
      }
      v328 = v324 + MaxX;
      goto LABEL_777;
    }
    v320[3] = MaxX - v294;
LABEL_508:
    v321 = v620;
    goto LABEL_509;
  }
  if ((v228 & 1) == 0)
  {
    v681 = v294;
    goto LABEL_508;
  }
  v321 = v620;
  if ((v584 & 1) != 0)
    goto LABEL_509;
  if (v300 == 0.0)
  {
    v681 = -v548;
    goto LABEL_509;
  }
  v691.origin.x = r1;
  v691.origin.y = rect;
  v691.size.width = r1_24;
  v691.size.height = v610;
  v325 = CGRectGetMaxX(v691) - v301 - v307;
  v320 = v679;
  v679[3] = v325;
  v321 = v620;
  if (v301 <= 0.0)
    goto LABEL_509;
  v326 = v539;
  if (!v598)
    v326 = 0;
  if (v251 <= 0.0)
    v326 = 0;
  v327 = 1.0;
  if ((v326 & (v534 < v251)) != 0)
    v327 = 2.0;
  v328 = v325 - v568 * v327;
LABEL_777:
  v320[3] = v328;
LABEL_509:
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  v670 = 3221225472;
  v671 = __layoutSideBySideViewsColumnStyle_block_invoke;
  v672 = &unk_1E16C1890;
  v677 = v613 ^ 1;
  v675 = &v678;
  v676 = v318;
  v329 = v532;
  v673 = v329;
  v330 = v223;
  v674 = v330;
  v692.origin.x = r1;
  v692.origin.y = rect;
  v692.size.width = r1_24;
  v692.size.height = v610;
  v331 = CGRectGetWidth(v692);
  if ((v228 & 1) == 0)
  {
    v332 = v331 - v307 - (v565 + v242 + v294);
    if (v321 | v531 ^ 1)
      v332 = 0.0;
    v333 = -v332;
    if (!v613)
      v333 = v332;
    if (v321)
      v334 = v580;
    else
      v334 = v594;
    v671((uint64_t)buf, v549, 0, v334, v565 + v242, v333, 0.0);
    if (v587)
    {
      if (v298 > 0.0)
      {
        v335 = v568 + v298;
        if (!v613)
          v335 = -(v568 + v298);
        v679[3] = v335 + v679[3];
      }
      v336 = objc_msgSend(v573, "renderAsShadow");
      v671((uint64_t)buf, v573, 0, 0, v568, 0.0, (double)v336);
      if (v578)
      {
        v337 = -1.0;
        if (v613)
          v337 = 1.0;
        v679[3] = v337 + v679[3];
        v671((uint64_t)buf, v561, 0, 0, 1.0, 0.0, 0.0);
        if (v242 <= 0.0 || v251 <= 0.0)
        {
          if (os_variant_has_internal_diagnostics())
          {
            __UIFaultDebugAssertLog();
            v527 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v527, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)v668 = 0;
              _os_log_fault_impl(&dword_185066000, v527, OS_LOG_TYPE_FAULT, "parallaxShadowView is unnecessarily present in sidebar layout", v668, 2u);
            }
          }
          else
          {
            v526 = qword_1ECD76D20;
            if (!qword_1ECD76D20)
            {
              v526 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v526, (unint64_t *)&qword_1ECD76D20);
            }
            v527 = *(id *)(v526 + 8);
            if (os_log_type_enabled(v527, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v668 = 0;
              _os_log_impl(&dword_185066000, v527, OS_LOG_TYPE_ERROR, "parallaxShadowView is unnecessarily present in sidebar layout", v668, 2u);
            }
          }

          v321 = v620;
        }
        v338 = 0.0;
        if (v242 > 0.0)
          v338 = v298 / (v242 * -0.5) + 1.0;
        objc_msgSend(v561, "setAlpha:", 1.0 - v338);
      }
      v671((uint64_t)buf, v587, 0, v580, v251, 0.0, 0.0);
      v339 = objc_msgSend(v598, "renderAsShadow");
      v671((uint64_t)buf, v598, 0, 0, v568, 0.0, (double)v339);
    }
    else
    {
      v340 = objc_msgSend(v573, "renderAsShadow");
      v671((uint64_t)buf, v573, 0, 0, v568, 0.0, (double)v340);
    }
  }
  v671((uint64_t)buf, v591, 0, v575, v307, 0.0, 0.0);
  if ((v584 & 1) == 0)
  {
    if (v531)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v519 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v519, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v668 = 0;
          _os_log_fault_impl(&dword_185066000, v519, OS_LOG_TYPE_FAULT, "SPI to put supplementary col in background view not implemented for trailing primary", v668, 2u);
        }
      }
      else
      {
        v518 = qword_1ECD76D28;
        if (!qword_1ECD76D28)
        {
          v518 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v518, (unint64_t *)&qword_1ECD76D28);
        }
        v519 = *(id *)(v518 + 8);
        if (os_log_type_enabled(v519, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v668 = 0;
          _os_log_impl(&dword_185066000, v519, OS_LOG_TYPE_ERROR, "SPI to put supplementary col in background view not implemented for trailing primary", v668, 2u);
        }
      }

      v321 = v620;
    }
    if (v587)
    {
      v341 = objc_msgSend(v598, "renderAsShadow");
      v671((uint64_t)buf, v598, 0, 0, v568, 0.0, (double)v341);
      v671((uint64_t)buf, v587, 0, v580, v251, 0.0, 0.0);
    }
    v342 = objc_msgSend(v576, "renderAsShadow");
    v671((uint64_t)buf, v576, 0, 0, v568, 0.0, (double)v342);
    v343 = v679;
    if (v578)
    {
      v344 = -v568;
      v345 = v613;
      if (v613)
        v344 = v568;
      v679[3] = v344 + v679[3];
      v671((uint64_t)buf, v561, 0, 0, 1.0, 0.0, 0.0);
      if (v555 <= 0.0 || v251 <= 0.0)
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v521 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v521, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v668 = 0;
            _os_log_fault_impl(&dword_185066000, v521, OS_LOG_TYPE_FAULT, "parallaxShadowView is unnecessarily present in sidebar layout", v668, 2u);
          }
        }
        else
        {
          v520 = qword_1ECD76D30;
          if (!qword_1ECD76D30)
          {
            v520 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v520, (unint64_t *)&qword_1ECD76D30);
          }
          v521 = *(id *)(v520 + 8);
          if (os_log_type_enabled(v521, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v668 = 0;
            _os_log_impl(&dword_185066000, v521, OS_LOG_TYPE_ERROR, "parallaxShadowView is unnecessarily present in sidebar layout", v668, 2u);
          }
        }

        v345 = v613;
        v321 = v620;
      }
      v346 = 0.0;
      if (v555 > 0.0)
        v346 = v298 / (v555 * -0.5) + 1.0;
      objc_msgSend(v561, "setAlpha:", 1.0 - v346);
      v347 = 1.0 - v568;
      if (!v345)
        v347 = -(1.0 - v568);
      v343 = v679;
      v348 = v347 + v679[3];
      v679[3] = v348;
    }
    else
    {
      v348 = v679[3];
      v345 = v613;
    }
    v349 = -v298;
    if (v345)
      v349 = v298;
    v343[3] = v349 + v348;
    if (v321)
      v350 = v580;
    else
      v350 = v557;
    v671((uint64_t)buf, v550, 0, v350, v565 + v555, 0.0, 0.0);
  }

  _Block_object_dispose(&v678, 8);
  v351 = v549;
  v574 = v573;
  v556 = v587;
  v560 = v598;
  v564 = v550;
  v569 = v576;
  v585 = v553;
  v577 = v561;
  v352 = v330;
  v566 = v329;
  v599 = v594;
  v595 = v557;
  v605 = v580;
  v353 = objc_msgSend(v352, "supplementaryOverlapsMain");
  v354 = v353;
  v355 = v620;
  if (v620 & 1 | (r1_8 == 0))
  {
    v356 = (r1_8 != 0) & v353;
  }
  else
  {
    v356 = objc_msgSend(v352, "leadingOverlapsMain");
    v355 = v620;
  }
  if (v611)
    v357 = v355;
  else
    v357 = 1;
  if (v611)
    v358 = v354;
  else
    v358 = 0;
  if ((v357 & 1) == 0)
  {
    v358 = objc_msgSend(v352, "trailingOverlapsMain");
    v355 = v620;
  }
  v359 = v354 & v539;
  if (!v587)
    v359 = 0;
  v558 = v359;
  if (!v356)
  {
    if ((v358 & 1) == 0)
    {
      v362 = 0.0;
      v361 = 0.0;
      v363 = 0.0;
      if ((v355 & 1) != 0)
        goto LABEL_577;
      goto LABEL_576;
    }
    v361 = 0.0;
    if (v355)
      goto LABEL_572;
    goto LABEL_574;
  }
  if ((v355 & 1) == 0)
  {
    objc_msgSend(v352, "leadingDragOffset");
    v361 = -v365;
    v362 = 0.0;
    if ((v358 & 1) == 0)
    {
LABEL_576:
      objc_msgSend(v352, "supplementaryDragOffset");
      v363 = v367;
      goto LABEL_577;
    }
LABEL_574:
    objc_msgSend(v352, "trailingDragOffset");
    v362 = v366;
    goto LABEL_576;
  }
  objc_msgSend(v352, "supplementaryDragOffset");
  v361 = -v360;
  v362 = 0.0;
  v363 = 0.0;
  if ((v358 & 1) != 0)
  {
LABEL_572:
    objc_msgSend(v352, "supplementaryDragOffset");
    v362 = v364;
    v363 = 0.0;
  }
LABEL_577:
  objc_msgSend(v352, "supplementaryWidth");
  v369 = v368;
  objc_msgSend(v352, "supplementaryOffscreenWidth");
  if (v369 >= v370)
    v370 = v369;
  v588 = v370;
  if ((v541 & v620) == 0)
  {
    v371 = 0.0;
    v562 = 0.0;
    if (!(r1_8 | v611))
      goto LABEL_585;
    goto LABEL_584;
  }
  if (v599 == v605 || (v371 = 0.0, v562 = 0.0, v595 == v605))
  {
LABEL_584:
    objc_msgSend(v352, "configuration");
    v372 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v372, "rubberBandExtension");
    v371 = v373;

    objc_msgSend(v352, "_rubberBandInset");
    UIRoundToScale(v374, v617);
    v562 = v375;
  }
LABEL_585:
  UIRoundToScale(v361, v617);
  v377 = v376;
  UIRoundToScale(v362, v617);
  v554 = v378;
  UIRoundToScale(v363, v617);
  v581 = v379;
  if (!v356)
    goto LABEL_653;
  if (!v620)
  {
    objc_msgSend(v352, "leadingWidth");
    v386 = v385;
    objc_msgSend(v352, "leadingOffscreenWidth");
    if (v386 >= v387)
      v383 = v386;
    else
      v383 = v387;
    if (v383 > 0.0)
    {
      objc_msgSend(v352, "leadingWidth");
      goto LABEL_598;
    }
LABEL_596:
    v388 = 1;
    v389 = r1_24;
    v390 = v610;
    v391 = r1;
    goto LABEL_602;
  }
  objc_msgSend(v352, "supplementaryWidth");
  v381 = v380;
  objc_msgSend(v352, "supplementaryOffscreenWidth");
  if (v381 >= v382)
    v383 = v381;
  else
    v383 = v382;
  if (v383 <= 0.0)
    goto LABEL_596;
  objc_msgSend(v352, "supplementaryWidth");
LABEL_598:
  v306 = v384 == 0.0;
  v389 = r1_24;
  v390 = v610;
  v391 = r1;
  v388 = 0;
  if (v306 && v377 > -v383)
    v377 = -v383;
LABEL_602:
  v392 = rect;
  v393 = CGRectGetHeight(*(CGRect *)&v391);
  v394 = v371 + v383;
  if ((v613 & 1) != 0)
  {
    v693.origin.x = r1;
    v693.origin.y = rect;
    v693.size.width = r1_24;
    v693.size.height = v610;
    v395 = CGRectGetWidth(v693);
    v694.origin.x = 0.0;
    v694.origin.y = 0.0;
    v694.size.width = v371 + v383;
    v694.size.height = v393;
    x = v371 - v562 + v395 - CGRectGetWidth(v694) - v377;
  }
  else
  {
    x = v377 - (v371 - v562);
  }
  if (objc_msgSend(v566, "containsObject:", v351))
  {
    objc_msgSend(v352, "_keyboardAdjustment");
    v393 = v393 - v397;
  }
  if (v620)
    v398 = v605;
  else
    v398 = v599;
  v399 = v351;
  v400 = v398;
  v401 = v400;
  if (v400)
    objc_msgSend(v400, "_updateControlledViewsToFrame:", x, 0.0, v371 + v383, v393);
  else
    objc_msgSend(v399, "setFrame:", x, 0.0, v371 + v383, v393);

  if (v574)
  {
    objc_msgSend(v352, "configuration");
    v402 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v402, "leadingBorderWidthForScale:", v617);
    v404 = v403;

    if (v581 <= 0.0)
    {
      if ((v613 & 1) != 0)
      {
        v405 = -v404;
      }
      else
      {
        v699.origin.y = 0.0;
        v699.origin.x = x;
        v699.size.width = v371 + v383;
        v699.size.height = v393;
        v405 = CGRectGetWidth(v699);
      }
      v700.origin.y = 0.0;
      v700.origin.x = x;
      v700.size.width = v371 + v383;
      v700.size.height = v393;
      v698 = CGRectOffset(v700, v405, 0.0);
LABEL_628:
      x = v698.origin.x;
      y = v698.origin.y;
      v393 = v698.size.height;
      objc_msgSend(v574, "setFrame:");
      v394 = v404;
      goto LABEL_629;
    }
LABEL_618:
    if ((v613 & 1) != 0)
    {
      v407 = -(v588 - v581);
    }
    else
    {
      v695.origin.y = 0.0;
      v695.origin.x = x;
      v695.size.width = v371 + v383;
      v695.size.height = v393;
      v407 = CGRectGetWidth(v695) - v581;
    }
    v696.origin.y = 0.0;
    v696.origin.x = x;
    v696.size.width = v371 + v383;
    v696.size.height = v393;
    v697 = CGRectOffset(v696, v407, 0.0);
    x = v697.origin.x;
    y = v697.origin.y;
    v394 = v697.size.width;
    v393 = v697.size.height;
    if (!v574)
      goto LABEL_629;
    if (v613)
      v408 = v588;
    else
      v408 = -v404;
    v698 = CGRectOffset(v697, v408, 0.0);
    goto LABEL_628;
  }
  v404 = 0.0;
  y = 0.0;
  if (v581 > 0.0)
    goto LABEL_618;
LABEL_629:
  if (v578)
  {
    if ((v613 & 1) == 0)
    {
      v701.origin.x = x;
      v701.origin.y = y;
      v701.size.width = v394;
      v701.size.height = v393;
      v702 = CGRectOffset(v701, -(1.0 - v404), 0.0);
      x = v702.origin.x;
      y = v702.origin.y;
      v393 = v702.size.height;
    }
    objc_msgSend(v577, "setFrame:", x, y, 1.0, v393);
    if (v588 <= 0.0)
      v409 = 1;
    else
      v409 = v388;
    if (v409 == 1)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v523 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v523, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v523, OS_LOG_TYPE_FAULT, "parallaxShadowView is unnecessarily present in sidebar layout", buf, 2u);
        }
      }
      else
      {
        v522 = qword_1ECD76D38;
        if (!qword_1ECD76D38)
        {
          v522 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v522, (unint64_t *)&qword_1ECD76D38);
        }
        v523 = *(id *)(v522 + 8);
        if (os_log_type_enabled(v523, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v523, OS_LOG_TYPE_ERROR, "parallaxShadowView is unnecessarily present in sidebar layout", buf, 2u);
        }
      }

    }
    v410 = 0.0;
    if ((v388 & 1) == 0)
      v410 = v581 / (v383 * -0.5) + 1.0;
    v394 = 1.0;
    objc_msgSend(v577, "setAlpha:", 1.0 - v410);
    if ((v613 & 1) == 0)
    {
      v703.size.width = 1.0;
      v703.origin.x = x;
      v703.origin.y = y;
      v703.size.height = v393;
      v704 = CGRectOffset(v703, 1.0 - v404, 0.0);
      x = v704.origin.x;
      y = v704.origin.y;
      v394 = v704.size.width;
      v393 = v704.size.height;
    }
  }
  if (v558)
  {
    v411 = v613 ? -v588 : v404;
    v705.origin.x = x;
    v705.origin.y = y;
    v705.size.width = v394;
    v705.size.height = v393;
    v706 = CGRectOffset(v705, v411, 0.0);
    x = v706.origin.x;
    y = v706.origin.y;
    v393 = v706.size.height;
    objc_msgSend(v556, "setFrame:");
    if (v560)
    {
      if ((v613 & 1) != 0)
      {
        v412 = -v404;
      }
      else
      {
        v707.origin.x = x;
        v707.origin.y = y;
        v707.size.width = v588;
        v707.size.height = v393;
        v412 = CGRectGetWidth(v707);
      }
      v708.origin.x = x;
      v708.origin.y = y;
      v708.size.width = v588;
      v708.size.height = v393;
      v709 = CGRectOffset(v708, v412, 0.0);
      x = v709.origin.x;
      y = v709.origin.y;
      v393 = v709.size.height;
      objc_msgSend(v560, "setFrame:");
    }
  }
  if (v585)
  {
    v413 = 0.0;
    if (v613)
    {
      v710.size.width = 1.0;
      v710.origin.x = x;
      v710.origin.y = y;
      v710.size.height = v393;
      v413 = -CGRectGetWidth(v710);
    }
    v711.size.width = 1.0;
    v711.origin.x = x;
    v711.origin.y = y;
    v711.size.height = v393;
    v712 = CGRectOffset(v711, v413, 0.0);
    objc_msgSend(v585, "setFrame:", v712.origin.x, v712.origin.y, v712.size.width, v712.size.height);
  }
LABEL_653:
  if (!v358)
    goto LABEL_722;
  if (v620)
  {
    objc_msgSend(v352, "supplementaryWidth");
    v415 = v414;
    objc_msgSend(v352, "supplementaryOffscreenWidth");
    if (v415 >= v416)
      v417 = v415;
    else
      v417 = v416;
    if (v417 > 0.0)
    {
      objc_msgSend(v352, "supplementaryWidth");
      goto LABEL_666;
    }
LABEL_664:
    v422 = 1;
    v423 = r1_24;
    v424 = v610;
    v425 = r1;
    goto LABEL_671;
  }
  objc_msgSend(v352, "trailingWidth");
  v420 = v419;
  objc_msgSend(v352, "trailingOffscreenWidth");
  if (v420 >= v421)
    v417 = v420;
  else
    v417 = v421;
  if (v417 <= 0.0)
    goto LABEL_664;
  objc_msgSend(v352, "trailingWidth");
LABEL_666:
  v306 = v418 == 0.0;
  v423 = r1_24;
  v424 = v610;
  v425 = r1;
  v422 = 0;
  if (v306)
  {
    v426 = v554;
    if (v417 >= v554)
      v426 = v417;
    v554 = v426;
  }
LABEL_671:
  v427 = rect;
  v428 = CGRectGetHeight(*(CGRect *)&v425);
  v429 = v371 + v417;
  if ((v613 & 1) != 0)
  {
    v430 = -v554 - (v371 - v562);
  }
  else
  {
    v713.origin.x = r1;
    v713.origin.y = rect;
    v713.size.width = r1_24;
    v713.size.height = v610;
    v431 = CGRectGetWidth(v713);
    v714.origin.x = 0.0;
    v714.origin.y = 0.0;
    v714.size.width = v371 + v417;
    v714.size.height = v428;
    v430 = v371 - v562 + v554 + v431 - CGRectGetWidth(v714);
  }
  if (objc_msgSend(v566, "containsObject:", v351))
  {
    objc_msgSend(v352, "_keyboardAdjustment");
    v428 = v428 - v432;
  }
  if (v620)
    v433 = v605;
  else
    v433 = v595;
  v434 = v564;
  v435 = v433;
  v436 = v435;
  if (v435)
    objc_msgSend(v435, "_updateControlledViewsToFrame:", v430, 0.0, v371 + v417, v428);
  else
    objc_msgSend(v434, "setFrame:", v430, 0.0, v371 + v417, v428);

  if (v569)
  {
    objc_msgSend(v352, "configuration");
    v437 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v437, "trailingBorderWidthForScale:", v617);
    v439 = v438;

    if (v581 <= 0.0)
    {
      if ((v613 & 1) != 0)
      {
        v715.origin.y = 0.0;
        v715.origin.x = v430;
        v715.size.width = v371 + v417;
        v715.size.height = v428;
        v440 = CGRectGetWidth(v715);
      }
      else
      {
        v440 = -v439;
      }
      v719.origin.y = 0.0;
      v719.origin.x = v430;
      v719.size.width = v371 + v417;
      v719.size.height = v428;
      v718 = CGRectOffset(v719, v440, 0.0);
LABEL_697:
      v430 = v718.origin.x;
      v441 = v718.origin.y;
      v428 = v718.size.height;
      objc_msgSend(v569, "setFrame:");
      v429 = v439;
      goto LABEL_698;
    }
LABEL_687:
    if ((v613 & 1) != 0)
      v442 = v371 - v562 + v417 - v581;
    else
      v442 = -(v588 - v581);
    v716.origin.y = 0.0;
    v716.origin.x = v430;
    v716.size.width = v371 + v417;
    v716.size.height = v428;
    v717 = CGRectOffset(v716, v442, 0.0);
    v430 = v717.origin.x;
    v441 = v717.origin.y;
    v429 = v717.size.width;
    v428 = v717.size.height;
    if (!v569)
      goto LABEL_698;
    if (v613)
      v443 = -v439;
    else
      v443 = v588;
    v718 = CGRectOffset(v717, v443, 0.0);
    goto LABEL_697;
  }
  v439 = 0.0;
  v441 = 0.0;
  if (v581 > 0.0)
    goto LABEL_687;
LABEL_698:
  if (v578)
  {
    if (v613)
    {
      v720.origin.x = v430;
      v720.origin.y = v441;
      v720.size.width = v429;
      v720.size.height = v428;
      v721 = CGRectOffset(v720, -(1.0 - v439), 0.0);
      v430 = v721.origin.x;
      v441 = v721.origin.y;
      v428 = v721.size.height;
    }
    objc_msgSend(v577, "setFrame:", v430, v441, 1.0, v428);
    if (v588 <= 0.0)
      v444 = 1;
    else
      v444 = v422;
    if (v444 == 1)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v525 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v525, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v525, OS_LOG_TYPE_FAULT, "parallaxShadowView is unnecessarily present in sidebar layout", buf, 2u);
        }
      }
      else
      {
        v524 = qword_1ECD76D40;
        if (!qword_1ECD76D40)
        {
          v524 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v524, (unint64_t *)&qword_1ECD76D40);
        }
        v525 = *(id *)(v524 + 8);
        if (os_log_type_enabled(v525, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v525, OS_LOG_TYPE_ERROR, "parallaxShadowView is unnecessarily present in sidebar layout", buf, 2u);
        }
      }

    }
    v445 = 0.0;
    if ((v422 & 1) == 0)
      v445 = v581 / (v417 * -0.5) + 1.0;
    v429 = 1.0;
    objc_msgSend(v577, "setAlpha:", 1.0 - v445);
    if (v613)
    {
      v722.size.width = 1.0;
      v722.origin.x = v430;
      v722.origin.y = v441;
      v722.size.height = v428;
      v723 = CGRectOffset(v722, 1.0 - v439, 0.0);
      v430 = v723.origin.x;
      v441 = v723.origin.y;
      v429 = v723.size.width;
      v428 = v723.size.height;
    }
  }
  if (v558)
  {
    v446 = v613 ? v439 : -v588;
    v724.origin.x = v430;
    v724.origin.y = v441;
    v724.size.width = v429;
    v724.size.height = v428;
    v725 = CGRectOffset(v724, v446, 0.0);
    v430 = v725.origin.x;
    v441 = v725.origin.y;
    v428 = v725.size.height;
    objc_msgSend(v556, "setFrame:");
    if (v560)
    {
      if ((v613 & 1) != 0)
      {
        v726.origin.x = v430;
        v726.origin.y = v441;
        v726.size.width = v588;
        v726.size.height = v428;
        v447 = CGRectGetWidth(v726);
      }
      else
      {
        v447 = -v439;
      }
      v727.origin.x = v430;
      v727.origin.y = v441;
      v727.size.width = v588;
      v727.size.height = v428;
      v728 = CGRectOffset(v727, v447, 0.0);
      v430 = v728.origin.x;
      v441 = v728.origin.y;
      v428 = v728.size.height;
      objc_msgSend(v560, "setFrame:");
    }
  }
  if (v585)
  {
    v448 = 0.0;
    if ((v613 & 1) == 0)
    {
      v729.size.width = 1.0;
      v729.origin.x = v430;
      v729.origin.y = v441;
      v729.size.height = v428;
      v448 = -CGRectGetWidth(v729);
    }
    v730.size.width = 1.0;
    v730.origin.x = v430;
    v730.origin.y = v441;
    v730.size.height = v428;
    v731 = CGRectOffset(v730, v448, 0.0);
    objc_msgSend(v585, "setFrame:", v731.origin.x, v731.origin.y, v731.size.width, v731.size.height);
  }
LABEL_722:

  v589 = v552;
  v582 = v351;
  v579 = v564;
  v449 = v352;
  if (v533)
  {
    if (r1_8)
      objc_msgSend(v582, "frame");
    else
      objc_msgSend(v579, "frame");
    objc_msgSend(v589, "setFrame:");
    v450 = v449;
    objc_msgSend(v450, "leadingWidth");
    v452 = v451;
    objc_msgSend(v450, "trailingWidth");
    v454 = v453;

    v455 = v450;
    objc_msgSend(v455, "leadingDragOffset");
    v457 = v456;
    objc_msgSend(v455, "trailingDragOffset");
    v459 = v458;
    objc_msgSend(v455, "supplementaryDragOffset");
    v461 = v460;

    v462 = 0.0;
    if (v452 + v454 > 0.0)
    {
      v463 = fmax((v452 + v454 - (v457 + v459 + v461)) / (v452 + v454), 0.0);
      v462 = 1.0;
      if (v463 <= 1.0)
        v462 = v463;
    }
    objc_msgSend(v589, "setPercentDisplayed:", (1.0 - v462) * 0.5);
  }

  layoutPresentationViews(v8, v575, v545);
  layoutPresentationViews(v8, v602, v544);
  layoutPresentationViews(v8, v601, v543);
  layoutPresentationViews(v8, v605, v542);
  objc_msgSend(v8, "bounds");
  -[UIView setFrame:](v596, "setFrame:");
  -[_UIMTCaptureView mt_captureGroupName](v596, "mt_captureGroupName");
  v464 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v602, "_existingView");
  v465 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v465, "mt_setCaptureGroupName:", v464);

  -[_UIMTCaptureView mt_captureGroupName](v596, "mt_captureGroupName");
  v466 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v601, "_existingView");
  v467 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v467, "mt_setCaptureGroupName:", v466);

  -[_UIMTCaptureView mt_captureGroupName](v596, "mt_captureGroupName");
  v468 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v605, "_existingView");
  v469 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v469, "mt_setCaptureGroupName:", v468);

  -[UIPanelController floatingBarButtonItem](v623, "floatingBarButtonItem");
  v621 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v621, "_isFloatable"))
  {
    v470 = objc_msgSend(v621, "_isFloating");
    if (v572 | v571 | v570)
    {
      if ((v470 & 1) != 0)
        goto LABEL_736;
    }
    else if (!v470)
    {
      goto LABEL_736;
    }
    objc_msgSend(v621, "_setFloating:", (v572 | v571 | v570) != 0);
    v628[0] = MEMORY[0x1E0C809B0];
    v628[1] = 3221225472;
    v629 = __54__UIPanelController__updateToNewPublicState_withSize___block_invoke_406;
    v630 = &__block_descriptor_40_e26_v16__0__UIViewController_8lu32l8;
    v631 = v636;
    v637((uint64_t)v636, v602);
    v471 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v471, "_setNeedsStaticNavBarButtonUpdate");

    ((void (*)(_QWORD *, void *))__54__UIPanelController__updateToNewPublicState_withSize___block_invoke_406)(v628, v601);
    ((void (*)(_QWORD *, id))v629)(v628, v605);
    ((void (*)(_QWORD *, id))v629)(v628, v575);
  }
LABEL_736:
  if (v613)
    v472 = v611 != 0;
  else
    v472 = r1_8 != 0;
  layoutClippingView((void *)v572, v621, v472);
  layoutClippingView((void *)v570, v621, v472);
  layoutClippingView((void *)v571, v621, v472);
  v473 = -[UIPanelController style](v623, "style");
  v474 = v473;
  if (v551)
    v475 = v595;
  else
    v475 = v599;
  v477 = v473 != 1 && v475 == v605;
  -[UIPanelController navigationBarForContentLayoutGuideAnimation](v623, "navigationBarForContentLayoutGuideAnimation");
  v618 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v618, "window");
  v478 = (void *)objc_claimAutoreleasedReturnValue();
  if (v478)
  {
    v479 = objc_msgSend(v618, "_isAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange");

    if ((v479 & 1) == 0)
    {
      objc_msgSend(v618, "layoutIfNeeded");
      objc_msgSend(v618, "_beginAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange");
    }
  }
  -[UIPanelController navigationBarForContentLayoutGuideAnimation](v623, "navigationBarForContentLayoutGuideAnimation");
  v480 = (id)objc_claimAutoreleasedReturnValue();
  v481 = v449;
  objc_msgSend(v481, "configuration");
  v482 = (void *)objc_claimAutoreleasedReturnValue();
  v624 = objc_msgSend(v482, "allowTotalWidthGreaterThanParent");

  if ((objc_msgSend(v481, "leadingOverlapsMain") & 1) != 0 || (objc_msgSend(v481, "trailingOverlapsMain") & 1) != 0)
    v483 = 1;
  else
    v483 = objc_msgSend(v481, "supplementaryOverlapsMain");
  v614 = v483;
  v484 = v483 | v624;
  v485 = !v477;
  if (v474 == 1)
    v485 = 0;
  if (!v485 && v484)
  {
    if (v624)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v528 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v528, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v528, OS_LOG_TYPE_FAULT, "Unexpected attempt to layout for Displace behavior in double-column UISVC", buf, 2u);
        }

      }
      else
      {
        v486 = qword_1ECD76D48;
        if (!qword_1ECD76D48)
        {
          v486 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v486, (unint64_t *)&qword_1ECD76D48);
        }
        v487 = *(NSObject **)(v486 + 8);
        if (os_log_type_enabled(v487, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v487, OS_LOG_TYPE_ERROR, "Unexpected attempt to layout for Displace behavior in double-column UISVC", buf, 2u);
        }
      }
    }
    goto LABEL_786;
  }
  if (objc_msgSend(v480, "_isAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange"))
  {
    if (v484)
    {
      if (v535)
      {
        v488 = v481;
        objc_msgSend(v488, "leadingWidth");
        objc_msgSend(v488, "trailingWidth");

        v489 = v488;
        objc_msgSend(v489, "leadingDragOffset");
        objc_msgSend(v489, "trailingDragOffset");
        objc_msgSend(v489, "supplementaryDragOffset");

      }
    }
    else if (v474 == 1)
    {
      v490 = v481;
      objc_msgSend(v490, "leadingWidth");
      objc_msgSend(v490, "trailingWidth");

      objc_msgSend(v490, "leadingDragOffset");
      objc_msgSend(v490, "trailingDragOffset");
    }
    else if (v475 == v605)
    {
      objc_msgSend(v481, "supplementaryWidth");
      objc_msgSend(v481, "supplementaryDragOffset");
    }
    else
    {
      v491 = v481;
      objc_msgSend(v491, "leadingWidth");
      v493 = v492;
      objc_msgSend(v491, "trailingWidth");
      v495 = v494;

      if (v493 + v495 > 0.0)
        totalObscuredPrimaryWidthForState(v491);
    }
    objc_msgSend(v480, "_navItemContentLayoutGuideAnimationDistance");
    UIRoundToViewScale(v480);
    v496 = objc_msgSend(v480, "_updateNavItemContentLayoutGuideAnimationConstraintConstant:");
    v497 = v614 | v496 ^ 1;
    if (((v497 | v624) & 1) != 0)
    {
      if ((v496 | v497 ^ 1) != 1)
        goto LABEL_785;
    }
    else
    {
      objc_msgSend(v480, "_staticNavBarButtonItem");
      v498 = (void *)objc_claimAutoreleasedReturnValue();
      v499 = v498 == 0;

      if (!v499)
      {
LABEL_785:
        objc_msgSend(v480, "layoutIfNeeded");
        goto LABEL_786;
      }
    }
    objc_msgSend(v480, "_setNeedsStaticNavBarButtonUpdate");
    goto LABEL_785;
  }
LABEL_786:

  objc_msgSend(v591, "frame");
  v736.origin.x = v500;
  v736.origin.y = v501;
  v736.size.width = v502;
  v736.size.height = v503;
  v732.origin.x = r1;
  v732.origin.y = rect;
  v732.size.width = r1_24;
  v732.size.height = v610;
  v733 = CGRectIntersection(v732, v736);
  v504 = v733.origin.x;
  v505 = v733.origin.y;
  v506 = v733.size.width;
  v507 = v733.size.height;
  if (CGRectGetWidth(v733) == 0.0)
    goto LABEL_789;
  v734.origin.x = v504;
  v734.origin.y = v505;
  v734.size.width = v506;
  v734.size.height = v507;
  if (CGRectGetHeight(v734) == 0.0
    || (v735.origin.x = v504,
        v735.origin.y = v505,
        v735.size.width = v506,
        v735.size.height = v507,
        CGRectEqualToRect(v735, *MEMORY[0x1E0C9D628])))
  {
LABEL_789:
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__UIPanelController__updateToNewPublicState_withSize___block_invoke_2_408;
    aBlock[3] = &unk_1E16B2218;
    v626 = v592;
    v627 = v591;
    v508 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      +[UIView _currentViewAnimationState](UIView, "_currentViewAnimationState");
      v509 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v509, "_addCompletion:", v508);

    }
    else
    {
      v508[2](v508, 1);
    }

  }
  v7 = v622;
LABEL_794:

}

- (UIView)trailingBarContentClippingView
{
  return self->_trailingBarContentClippingView;
}

- (UIView)supplementaryBarContentClippingView
{
  return self->_supplementaryBarContentClippingView;
}

- (UINavigationBar)navigationBarForContentLayoutGuideAnimation
{
  return self->_navigationBarForContentLayoutGuideAnimation;
}

- (UIView)leadingBarContentClippingView
{
  return self->_leadingBarContentClippingView;
}

- (_UIFloatableBarButtonItem)floatingBarButtonItem
{
  return self->_floatingBarButtonItem;
}

- (void)setConfiguration:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[UIPanelController _internalState](self, "_internalState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    -[UIPanelController _internalState](self, "_internalState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setConfiguration:", v8);

    -[UIPanelController _setNeedsDeferredUpdate](self, "_setNeedsDeferredUpdate");
  }

}

void __56__UIPanelController__collapseWithTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__UIPanelController__collapseWithTransitionCoordinator___block_invoke_4;
  v4[3] = &unk_1E16C15B0;
  v11 = *(_BYTE *)(a1 + 88);
  v2 = *(_QWORD *)(a1 + 80);
  v9 = *(_QWORD *)(a1 + 72);
  v10 = v2;
  v3 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v8 = *(_OWORD *)(a1 + 56);
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v5, "_withDisabledAppearanceTransitionsPerform:", v4);

}

- (void)_withDisabledAppearanceTransitionsPerform:(id)a3
{
  id v4;
  _DWORD *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIPanelController owningViewController](self, "owningViewController");
  v5 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_class();
  if (v5)
    v7 = ((v5[92] >> 1) & 3u) - 1 < 2;
  else
    v7 = 0;
  objc_msgSend(v6, "_withDisabledAppearanceTransitions:forVisibleDescendantsOf:perform:", v7, v5, v4, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v15, "_existingView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "window");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
          objc_msgSend(v9, "addObject:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v9, "count"))
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __63__UIPanelController__withDisabledAppearanceTransitionsPerform___block_invoke;
    v19[3] = &unk_1E16C1710;
    v20 = v9;
    -[UIPanelController addWrapperBlockForNextUpdate:](self, "addWrapperBlockForNextUpdate:", v19);

  }
}

+ (id)_withDisabledAppearanceTransitions:(BOOL)a3 forVisibleDescendantsOf:(id)a4 perform:(id)a5
{
  _BOOL4 v6;
  id v7;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD);
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD aBlock[4];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  id *v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v6 = a3;
  v41 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  v9 = v8;
  if (!v6)
  {
    v13 = 0;
    if (!v8)
      goto LABEL_13;
    goto LABEL_12;
  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = 0;
  v34 = (id *)&v33;
  v35 = 0x3042000000;
  v36 = __Block_byref_object_copy__385;
  v37 = __Block_byref_object_dispose__386;
  v38 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__UIPanelController__withDisabledAppearanceTransitions_forVisibleDescendantsOf_perform___block_invoke;
  aBlock[3] = &unk_1E16C1738;
  v11 = v10;
  v31 = v11;
  v32 = &v33;
  v12 = _Block_copy(aBlock);
  objc_storeWeak(v34 + 5, v12);
  (*((void (**)(void *, id))v12 + 2))(v12, v7);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "setAppearanceTransitionsAreDisabled:", 1);
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
    }
    while (v14);
  }

  _Block_object_dispose(&v33, 8);
  objc_destroyWeak(&v38);
  if (v9)
LABEL_12:
    v9[2](v9);
LABEL_13:
  if (v6)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v17 = v13;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v39, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "setAppearanceTransitionsAreDisabled:", 0, (_QWORD)v22);
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v39, 16);
      }
      while (v18);
    }

  }
  return v13;
}

uint64_t __56__UIPanelController__collapseWithTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "_setChangingViewControllerParentage:", 1);
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "_internalState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCollapsedViewController:", v2);

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 80);
    if (v5 == 3)
    {
      v6 = 0;
    }
    else
    {
      if (objc_msgSend(*(id *)(a1 + 32), "leadingTrailingWrapsNavigationController")
        && !*(_BYTE *)(a1 + 88))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "childViewControllers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        v6 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v6 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      }
      objc_msgSend(v6, "_setAllowNestedNavigationControllers:", 1);
      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    }
    objc_msgSend(v4, "_setOverrideUserInterfaceRenderingMode:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "_setOverrideUserInterfaceRenderingMode:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "_setOverrideUserInterfaceRenderingMode:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_addIdentifiedChildViewController:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    if (v5 != 3
      && ((objc_opt_respondsToSelector() & 1) == 0
       || (objc_msgSend(*(id *)(a1 + 40), "panelController:collapseOntoPrimaryViewController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)) & 1) == 0))
    {
      v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      if (v8 || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
      {
        if (!objc_msgSend(v8, "_isNavigationController")
          || (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "viewControllers"),
              v9 = (void *)objc_claimAutoreleasedReturnValue(),
              v10 = objc_msgSend(v9, "count"),
              v9,
              v10))
        {
          if ((objc_opt_respondsToSelector() & 1) == 0
            || (objc_msgSend(*(id *)(a1 + 40), "panelController:collapsePrimaryViewController:withFallbackSecondaryViewController:onTopOfSupplementaryViewController:transitionCoordinator:", *(_QWORD *)(a1 + 32), v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 48)) & 1) == 0)
          {
            if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
            {
              if (os_variant_has_internal_diagnostics())
              {
                __UIFaultDebugAssertLog();
                v14 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_fault_impl(&dword_185066000, v14, OS_LOG_TYPE_FAULT, "Incomplete collapse because of unexpectedly nil secondary view controller.", buf, 2u);
                }

              }
              else
              {
                v12 = _UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_2;
                if (!_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_2)
                {
                  v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                  atomic_store(v12, (unint64_t *)&_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_2);
                }
                v13 = *(NSObject **)(v12 + 8);
                if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)v15 = 0;
                  _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Incomplete collapse because of unexpectedly nil secondary view controller.", v15, 2u);
                }
              }
            }
            if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) && (objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(*(id *)(a1 + 40), "panelController:collapsePrimaryViewController:withFallbackSecondaryViewController:transitionCoordinator:", *(_QWORD *)(a1 + 32), v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 48));
          }
        }
      }
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "_setChangingViewControllerParentage:", 0);
}

- (void)_setChangingViewControllerParentage:(BOOL)a3
{
  self->__changingViewControllerParentage = a3;
}

void __88__UIPanelController__withDisabledAppearanceTransitions_forVisibleDescendantsOf_perform___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void (**WeakRetained)(id, void *);
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "_existingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "isHidden") & 1) == 0)
    {
      objc_msgSend(v5, "window");
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)v6;
        v8 = objc_msgSend(v3, "appearanceTransitionsAreDisabled");

        if ((v8 & 1) == 0)
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
      }
    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v3, "mutableChildViewControllers", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v14, "_existingView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isDescendantOfView:", v5);

          if (v16)
          {
            WeakRetained = (void (**)(id, void *))objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                                        + 40));
            WeakRetained[2](WeakRetained, v14);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

  }
}

- (BOOL)leadingTrailingWrapsNavigationController
{
  return (*((unsigned __int8 *)&self->_panelControllerFlags + 1) >> 6) & 1;
}

- (void)setMainViewController:(id)a3 changingParentage:(BOOL)a4
{
  -[UIPanelController setMainViewController:changingParentage:animateTransition:](self, "setMainViewController:changingParentage:animateTransition:", a3, a4, 0);
}

- (void)setMainViewController:(id)a3
{
  -[UIPanelController setMainViewController:changingParentage:](self, "setMainViewController:changingParentage:", a3, 1);
}

- (void)setLeadingViewController:(id)a3 changingParentage:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[UIPanelController _internalState](self, "_internalState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v9)
  {
    if (v4)
      -[UIPanelController _removeIdentifiedChildViewController:](self, "_removeIdentifiedChildViewController:", v7);
    -[UIPanelController _internalState](self, "_internalState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLeadingViewController:", v9);

  }
  if (v4)
    -[UIPanelController _addIdentifiedChildViewController:](self, "_addIdentifiedChildViewController:", v9);

}

- (void)setMainViewController:(id)a3 changingParentage:(BOOL)a4 animateTransition:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v5 = a4;
  v10 = a3;
  -[UIPanelController _internalState](self, "_internalState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mainViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v10)
  {
    if (v5)
      -[UIPanelController _removeIdentifiedChildViewController:](self, "_removeIdentifiedChildViewController:", v8);
    -[UIPanelController _internalState](self, "_internalState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMainViewController:", v10);

  }
  if (v5)
    -[UIPanelController _addIdentifiedChildViewController:](self, "_addIdentifiedChildViewController:", v10);

}

- (void)setLeadingViewController:(id)a3
{
  -[UIPanelController setLeadingViewController:changingParentage:](self, "setLeadingViewController:changingParentage:", a3, 1);
}

- (void)setTrailingViewController:(id)a3 changingParentage:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[UIPanelController _internalState](self, "_internalState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v9)
  {
    if (v4)
      -[UIPanelController _removeIdentifiedChildViewController:](self, "_removeIdentifiedChildViewController:", v7);
    -[UIPanelController _internalState](self, "_internalState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTrailingViewController:", v9);

  }
  if (v4)
    -[UIPanelController _addIdentifiedChildViewController:](self, "_addIdentifiedChildViewController:", v9);

}

- (void)setTrailingViewController:(id)a3
{
  -[UIPanelController setTrailingViewController:changingParentage:](self, "setTrailingViewController:changingParentage:", a3, 1);
}

- (void)setSupplementaryViewController:(id)a3 changingParentage:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[UIPanelController _internalState](self, "_internalState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "supplementaryViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v9)
  {
    if (v4)
      -[UIPanelController _removeIdentifiedChildViewController:](self, "_removeIdentifiedChildViewController:", v7);
    -[UIPanelController _internalState](self, "_internalState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSupplementaryViewController:", v9);

  }
  if (v4)
    -[UIPanelController _addIdentifiedChildViewController:](self, "_addIdentifiedChildViewController:", v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__destTransitionView, 0);
  objc_storeStrong((id *)&self->__sourceTransitionView, 0);
  objc_storeStrong((id *)&self->__primaryParallaxDimmingView, 0);
  objc_storeStrong((id *)&self->__captureView, 0);
  objc_storeStrong((id *)&self->__supplementaryParallaxShadowView, 0);
  objc_storeStrong((id *)&self->__primaryOrSupplementaryShadowView, 0);
  objc_storeStrong((id *)&self->__overlayEdgeShadowView, 0);
  objc_storeStrong((id *)&self->__supplementaryBorderView, 0);
  objc_storeStrong((id *)&self->__trailingBorderView, 0);
  objc_storeStrong((id *)&self->__leadingBorderView, 0);
  objc_storeStrong((id *)&self->__contentView, 0);
  objc_storeStrong((id *)&self->__lastPossiblePublicStates, 0);
  objc_storeStrong((id *)&self->__lastComputedPublicState, 0);
  objc_storeStrong((id *)&self->__suspendedConfiguration, 0);
  objc_storeStrong((id *)&self->__previousInternalState, 0);
  objc_storeStrong((id *)&self->__internalState, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_floatingBarButtonItem, 0);
  objc_storeStrong((id *)&self->_navigationBarForContentLayoutGuideAnimation, 0);
  objc_storeStrong((id *)&self->_supplementaryBarContentClippingView, 0);
  objc_storeStrong((id *)&self->_trailingBarContentClippingView, 0);
  objc_storeStrong((id *)&self->_leadingBarContentClippingView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_destroyWeak((id *)&self->_owningViewController);
  objc_storeStrong((id *)&self->_wrapperBlocksForNextUpdate, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[UIPanelController _stopObservingKeyboardNotifications](self, "_stopObservingKeyboardNotifications");
  -[UIPanelController _setBorderViewsObserveViewBackgroundColor:](self, "_setBorderViewsObserveViewBackgroundColor:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIPanelController;
  -[UIPanelController dealloc](&v3, sel_dealloc);
}

- (void)_stopObservingKeyboardNotifications
{
  id v3;

  if ((*((_BYTE *)&self->_panelControllerFlags + 1) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIKeyboardPrivateWillShowNotification"), 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIKeyboardPrivateWillHideNotification"), 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIKeyboardPrivateDidChangeFrameNotification"), 0);
    *(_DWORD *)&self->_panelControllerFlags &= ~0x800u;

  }
}

- (void)_setBorderViewsObserveViewBackgroundColor:(BOOL)a3
{
  UILayoutContainerView *view;
  int v5;

  if (((((*((_BYTE *)&self->_panelControllerFlags + 1) & 0x10) == 0) ^ a3) & 1) == 0)
  {
    view = self->_view;
    if (a3)
    {
      -[UILayoutContainerView addObserver:forKeyPath:options:context:](view, "addObserver:forKeyPath:options:context:", self, CFSTR("backgroundColor"), 1, 0);
      v5 = 4096;
    }
    else
    {
      -[UILayoutContainerView removeObserver:forKeyPath:](view, "removeObserver:forKeyPath:", self, CFSTR("backgroundColor"));
      v5 = 0;
    }
    self->_panelControllerFlags = ($C2610746699A0CC72A5FB1B737BB04DE)(*(_DWORD *)&self->_panelControllerFlags & 0xFFFFEFFF | v5);
  }
}

- (void)setPresentationGestureActive:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_panelControllerFlags = ($C2610746699A0CC72A5FB1B737BB04DE)(*(_DWORD *)&self->_panelControllerFlags & 0xFFFFFFEF | v3);
}

- (BOOL)isPresentationGestureActive
{
  return (*(_BYTE *)&self->_panelControllerFlags >> 4) & 1;
}

- (BOOL)isRunExpandScheduled
{
  return *((_BYTE *)&self->_panelControllerFlags + 2) & 1;
}

- (UIViewController)preservedDetailController
{
  void *v2;
  void *v3;

  -[UIPanelController _internalState](self, "_internalState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preservedDetailController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v3;
}

- (void)setCollapsedViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIPanelController _internalState](self, "_internalState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCollapsedViewController:", v4);

}

- (void)setStateRequest:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  -[UIPanelController _internalState](self, "_internalState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stateRequest");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
  {
    -[UIPanelController _internalState](self, "_internalState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStateRequest:", v7);

    if (!v7 || !v5 || (objc_msgSend(v5, "isEqual:", v7) & 1) == 0)
      -[UIPanelController _setNeedsDeferredUpdate](self, "_setNeedsDeferredUpdate");
  }

}

- (void)addWrapperBlockForNextUpdate:(id)a3
{
  id v4;
  NSMutableArray *wrapperBlocksForNextUpdate;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *aBlock;

  v4 = a3;
  wrapperBlocksForNextUpdate = self->_wrapperBlocksForNextUpdate;
  aBlock = v4;
  if (!wrapperBlocksForNextUpdate)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_wrapperBlocksForNextUpdate;
    self->_wrapperBlocksForNextUpdate = v6;

    v4 = aBlock;
    wrapperBlocksForNextUpdate = self->_wrapperBlocksForNextUpdate;
  }
  v8 = _Block_copy(v4);
  -[NSMutableArray addObject:](wrapperBlocksForNextUpdate, "addObject:", v8);

}

- (id)gatherMultitaskingDragExclusionRectsFromVisibleColumns
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (**v25)(_QWORD, _QWORD);
  void (*v26)(void *, void *, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *);
  void *v33;
  id v34;
  id v35;

  -[UIPanelController _internalState](self, "_internalState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPanelController _internalState](self, "_internalState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPanelController _internalState](self, "_internalState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trailingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPanelController _internalState](self, "_internalState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "supplementaryViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPanelController _lastComputedPublicState](self, "_lastComputedPublicState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "_collapsedState");

  -[UIPanelController _internalState](self, "_internalState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "collapsedViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPanelController owningViewController](self, "owningViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "viewIfLoaded");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = v12 - 1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = MEMORY[0x1E0C809B0];
    v31 = 3221225472;
    v32 = __75__UIPanelController_gatherMultitaskingDragExclusionRectsFromVisibleColumns__block_invoke;
    v33 = &unk_1E16C0D98;
    v34 = v16;
    v35 = v18;
    v19 = v18;
    v20 = _Block_copy(&v30);
    v25 = (void (**)(_QWORD, _QWORD))v20;
    v26 = (void (*)(void *, void *, uint64_t, uint64_t, uint64_t, uint64_t))*((_QWORD *)v20 + 2);
    if (v17 > 1)
    {
      v26(v20, v4, v21, v22, v23, v24);
      ((void (**)(_QWORD, void *))v25)[2](v25, v6);
      ((void (**)(_QWORD, void *))v25)[2](v25, v8);
      v26 = (void (*)(void *, void *, uint64_t, uint64_t, uint64_t, uint64_t))v25[2];
      v20 = v25;
      v27 = v10;
    }
    else
    {
      v27 = v14;
    }
    ((void (*)(void *, void *))v26)(v20, v27);
    v28 = (void *)objc_msgSend(v19, "copy", v30, v31, v32, v33);

  }
  else
  {
    v28 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v28;
}

void __75__UIPanelController_gatherMultitaskingDragExclusionRectsFromVisibleColumns__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_effectiveViewControllerForMultitaskingDragExclusionRects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_effectiveViewControllerForMultitaskingDragExclusionRects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewIfLoaded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v16 = v5;
      objc_msgSend(v5, "_multitaskingDragExclusionRects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v18;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(a1 + 32);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "CGRectValue");
            objc_msgSend(v13, "convertRect:fromView:", v7);
            v14 = *(void **)(a1 + 40);
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v15);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v10);
      }

      v5 = v16;
    }

  }
}

id __56__UIPanelController__collapseWithTransitionCoordinator___block_invoke_364(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  int v6;

  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(a1 + 32))
  {
LABEL_4:
    v5 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v3, "window");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v4, "autoresizingMask");
    if ((v6 & 2) != 0)
    {
      objc_msgSend(v4, "setAutoresizingMask:", v6 & 0xFFFFFFFD);
      v5 = v4;
      goto LABEL_6;
    }
    goto LABEL_4;
  }
LABEL_6:

  return v5;
}

void __56__UIPanelController__collapseWithTransitionCoordinator___block_invoke_2_367(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = a1[4];
  if (v3)
    objc_msgSend(a1[4], "setAutoresizingMask:", objc_msgSend(v3, "autoresizingMask") | 2);
  v4 = a1[5];
  if (v4)
    objc_msgSend(a1[5], "setAutoresizingMask:", objc_msgSend(v4, "autoresizingMask") | 2);
  v5 = a1[6];
  if (v5)
    objc_msgSend(a1[6], "setAutoresizingMask:", objc_msgSend(v5, "autoresizingMask") | 2);
  objc_msgSend(a1[7], "_internalState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "collapsedState");

  if (v7 == 1)
  {
    objc_msgSend(a1[7], "_internalState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCollapsedState:", 2);

    objc_msgSend(a1[7], "_setNeedsDeferredUpdate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(a1[8], "panelControllerDidCollapse:", a1[7]);
  }

}

- (void)_expandWithTransitionCoordinator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  UIPanelController *v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  _QWORD aBlock[5];
  id v34;
  id v35;

  v4 = a3;
  -[UIPanelController _internalState](self, "_internalState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCollapsedState:", 3);

  -[UIPanelController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0
    || (-[UIPanelController delegate](self, "delegate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "primaryViewControllerForExpandingPanelController:", self),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    -[UIPanelController _internalState](self, "_internalState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "collapsedViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[UIPanelController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__UIPanelController__expandWithTransitionCoordinator___block_invoke;
  aBlock[3] = &unk_1E16BF9D0;
  aBlock[4] = self;
  v13 = v9;
  v34 = v13;
  v14 = v11;
  v35 = v14;
  v15 = _Block_copy(aBlock);
  v31[0] = v12;
  v31[1] = 3221225472;
  v31[2] = __54__UIPanelController__expandWithTransitionCoordinator___block_invoke_5;
  v31[3] = &unk_1E16B2E68;
  v31[4] = self;
  v16 = v14;
  v32 = v16;
  v17 = _Block_copy(v31);
  if (UIApp)
  {
    if (!-[UIPanelController style](self, "style"))
      goto LABEL_14;
    objc_msgSend(v13, "_window");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
      goto LABEL_14;
    v19 = (void *)v18;
    v20 = objc_msgSend(v13, "_isNavigationController");

    if (!v20)
      goto LABEL_14;
    objc_msgSend(v13, "_transitionConductor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "transitionCoordinator");
    v22 = (id)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = v4;
      if (v22 != v4)
      {
        v24 = v12;
        v25 = 3221225472;
        v26 = __54__UIPanelController__expandWithTransitionCoordinator___block_invoke_6;
        v27 = &unk_1E16C1648;
        v28 = self;
        v29 = v15;
        v30 = v17;
        objc_msgSend(v22, "animateAlongsideTransition:completion:", 0, &v24);
        -[UIPanelController setRunExpandScheduled:](self, "setRunExpandScheduled:", 1, v24, v25, v26, v27, v28);

        v23 = v22;
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
LABEL_14:
      v23 = 0;
    }
    if (!-[UIPanelController isRunExpandScheduled](self, "isRunExpandScheduled"))
    {
      if (v4)
      {
        objc_msgSend(v4, "animateAlongsideTransition:completion:", v15, v17);
        -[UIPanelController setRunExpandScheduled:](self, "setRunExpandScheduled:", 1);
      }
      else
      {
        (*((void (**)(void *, _QWORD))v15 + 2))(v15, 0);
        (*((void (**)(void *, _QWORD))v17 + 2))(v17, 0);
      }
    }
    goto LABEL_19;
  }
  if (v4)
  {
    objc_msgSend(v4, "animateAlongsideTransition:completion:", v15, v17);
  }
  else
  {
    (*((void (**)(void *, _QWORD))v15 + 2))(v15, 0);
    (*((void (**)(void *, _QWORD))v17 + 2))(v17, 0);
  }
LABEL_20:

}

void __54__UIPanelController__expandWithTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_internalState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "collapsedState");

  if (v3 == 3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __54__UIPanelController__expandWithTransitionCoordinator___block_invoke_2;
    v5[3] = &unk_1E16B47A8;
    v4 = *(void **)(a1 + 40);
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    v7 = *(id *)(a1 + 48);
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v5);

  }
}

void __54__UIPanelController__expandWithTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[2] = __54__UIPanelController__expandWithTransitionCoordinator___block_invoke_3;
  v3[3] = &unk_1E16B47A8;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v3[1] = 3221225472;
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v3);

}

void __54__UIPanelController__expandWithTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__UIPanelController__expandWithTransitionCoordinator___block_invoke_4;
  v3[3] = &unk_1E16B47A8;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_withDisabledAppearanceTransitionsPerform:", v3);

}

void __54__UIPanelController__expandWithTransitionCoordinator___block_invoke_4(id *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;

  objc_msgSend(a1[4], "_setChangingViewControllerParentage:", 1);
  if (!a1[5])
  {
    v3 = 0;
    v19 = 0;
    goto LABEL_29;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1[6], "panelController:separateSecondaryViewControllerFromPrimaryViewController:", a1[4], a1[5]);
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v19 = (id)v2;
  if (a1[5])
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(a1[6], "panelController:separateSupplementaryViewControllerFromPrimaryViewController:", a1[4], a1[5]);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
        objc_msgSend(a1[4], "_addIdentifiedChildViewController:", v3);
    }
    else
    {
      v3 = 0;
    }
    if (v19)
      goto LABEL_14;
  }
  else
  {
    v3 = 0;
    if (v2)
LABEL_14:
      objc_msgSend(a1[4], "_addIdentifiedChildViewController:", v19);
  }
  v4 = a1[5];
  if (!v4)
    goto LABEL_29;
  objc_msgSend(v4, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "owningViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 != v6)
  {

LABEL_28:
    goto LABEL_29;
  }
  v7 = a1[5];
  objc_msgSend(a1[4], "mainViewController");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v7 == (id)v8)
  {

LABEL_27:
    goto LABEL_28;
  }
  v9 = (void *)v8;
  v10 = a1[5];
  objc_msgSend(a1[4], "leadingViewController");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v10 == (id)v11)
  {

LABEL_26:
    goto LABEL_27;
  }
  v12 = (void *)v11;
  v13 = a1[5];
  objc_msgSend(a1[4], "trailingViewController");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v13 == (id)v14)
  {

    goto LABEL_26;
  }
  v15 = (void *)v14;
  v16 = a1[5];
  objc_msgSend(a1[4], "supplementaryViewController");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v16 != v17)
    objc_msgSend(a1[4], "_removeIdentifiedChildViewController:", a1[5]);
LABEL_29:
  objc_msgSend(a1[4], "_setChangingViewControllerParentage:", 0);
  objc_msgSend(a1[5], "_setAllowNestedNavigationControllers:", 0);
  objc_msgSend(a1[4], "_internalState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCollapsedViewController:", 0);

}

uint64_t __54__UIPanelController__expandWithTransitionCoordinator___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_internalState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "collapsedState");

  if (v3 == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_internalState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCollapsedState:", 0);

    objc_msgSend(*(id *)(a1 + 32), "setPreservedDetailController:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_setNeedsDeferredUpdate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 40), "panelControllerDidExpand:", *(_QWORD *)(a1 + 32));
  }
  return objc_msgSend(*(id *)(a1 + 32), "setRunExpandScheduled:", 0);
}

uint64_t __54__UIPanelController__expandWithTransitionCoordinator___block_invoke_6(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "_internalState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "collapsedState");

  if (v3 == 3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  return objc_msgSend(*(id *)(a1 + 32), "setRunExpandScheduled:", 0);
}

- (void)_storeSuspendedConfiguration
{
  void *v3;
  id v4;

  -[UIPanelController _internalState](self, "_internalState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPanelController _setSuspendedConfiguration:](self, "_setSuspendedConfiguration:", v3);

}

- (void)_clearSuspendedConfiguration
{
  -[UIPanelController _setSuspendedConfiguration:](self, "_setSuspendedConfiguration:", 0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4 superBlock:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id WeakRetained;
  void *v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[5];
  id v45;
  id v46;
  CGAffineTransform *v47;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;
  CGAffineTransform *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD v63[5];
  id v64;
  char v65;
  _QWORD aBlock[5];
  id v67;
  CGFloat v68;
  CGFloat v69;
  CGAffineTransform v70;

  height = a3.height;
  width = a3.width;
  v9 = a4;
  v10 = a5;
  -[UIPanelController _stopAnimationsBeginningInteraction:](self, "_stopAnimationsBeginningInteraction:", 0);
  *(_DWORD *)&self->_panelControllerFlags |= 0x80u;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__UIPanelController_viewWillTransitionToSize_withTransitionCoordinator_superBlock___block_invoke;
  aBlock[3] = &unk_1E16C1670;
  aBlock[4] = self;
  v68 = width;
  v69 = height;
  v12 = v10;
  v67 = v12;
  v13 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[UIPanelController _sourceTransitionView](self, "_sourceTransitionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPanelController _contentView](self, "_contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v9, "targetTransform");
  else
    memset(&v70, 0, sizeof(v70));
  v16 = 0;
  if (!CGAffineTransformIsIdentity(&v70) && !v14)
  {
    if ((*((_BYTE *)&self->_panelControllerFlags + 1) & 2) != 0)
    {
      v16 = 0;
    }
    else
    {
      v17 = objc_msgSend(v15, "autoresizesSubviews");
      *(_DWORD *)&self->_panelControllerFlags |= 0x200u;
      objc_msgSend(v15, "setAutoresizesSubviews:", 0);
      v63[0] = v11;
      v63[1] = 3221225472;
      v63[2] = __83__UIPanelController_viewWillTransitionToSize_withTransitionCoordinator_superBlock___block_invoke_2;
      v63[3] = &unk_1E16B4008;
      v63[4] = self;
      v64 = v15;
      v65 = v17;
      v16 = _Block_copy(v63);

    }
  }
  v70.a = 0.0;
  *(_QWORD *)&v70.b = &v70;
  *(_QWORD *)&v70.c = 0x3032000000;
  *(_QWORD *)&v70.d = __Block_byref_object_copy__57;
  *(_QWORD *)&v70.tx = __Block_byref_object_dispose__57;
  v70.ty = 0.0;
  objc_msgSend(v15, "bounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend(v15, "center");
  v42 = v27;
  v43 = v26;
  WeakRetained = objc_loadWeakRetained((id *)&self->_owningViewController);
  -[UIPanelController _internalState](self, "_internalState");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = _transitionInsetsForViewController(WeakRetained, v29);
  v32 = v31;
  v34 = v33;
  v36 = v35;

  v48[0] = v11;
  v48[1] = 3221225472;
  v48[2] = __83__UIPanelController_viewWillTransitionToSize_withTransitionCoordinator_superBlock___block_invoke_3;
  v48[3] = &unk_1E16C16C0;
  v48[4] = self;
  v37 = v16;
  v51 = v37;
  v38 = v14;
  v49 = v38;
  v39 = v15;
  v50 = v39;
  v52 = &v70;
  v53 = v25;
  v54 = v23;
  v55 = v21;
  v56 = v19;
  v57 = v30;
  v58 = v32;
  v59 = v34;
  v60 = v36;
  v61 = v43;
  v62 = v42;
  objc_msgSend(v9, "animateAlongsideTransition:completion:", v48, 0);
  v13[2](v13);
  v44[0] = v11;
  v44[1] = 3221225472;
  v44[2] = __83__UIPanelController_viewWillTransitionToSize_withTransitionCoordinator_superBlock___block_invoke_6;
  v44[3] = &unk_1E16C16E8;
  v44[4] = self;
  v40 = v38;
  v45 = v40;
  v47 = &v70;
  v41 = v39;
  v46 = v41;
  objc_msgSend(v9, "animateAlongsideTransition:completion:", 0, v44);

  _Block_object_dispose(&v70, 8);
}

void __83__UIPanelController_viewWillTransitionToSize_withTransitionCoordinator_superBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) |= 0x100u;
  objc_msgSend(*(id *)(a1 + 32), "_internalState");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_lastComputedPublicState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_lastPossiblePublicStates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(*(id *)(a1 + 32), "_setInternalState:", v4);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "panelControllerWillUpdate:", *(_QWORD *)(a1 + 32));
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "computePossibleStatesGivenParentView:withSize:", v7, *(double *)(a1 + 48), *(double *)(a1 + 56));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    ((void (**)(_QWORD, void *, _QWORD))v6)[2](v6, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setStateRequest:", v9);

  }
  objc_msgSend(v4, "stateRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10
    || (objc_msgSend(v4, "stateRequest"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "_matchingState:", v8),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        !v12))
  {
    objc_msgSend(v8, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "panelController:willChangeToState:", *(_QWORD *)(a1 + 32), v12);
  objc_msgSend(*(id *)(a1 + 32), "_setLastComputedPublicState:", v12);
  objc_msgSend(*(id *)(a1 + 32), "_setLastPossiblePublicStates:", v8);
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(void))(v13 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_setInternalState:", v14);
  objc_msgSend(*(id *)(a1 + 32), "_setLastComputedPublicState:", v2);
  objc_msgSend(*(id *)(a1 + 32), "_setLastPossiblePublicStates:", v3);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) &= ~0x100u;

}

uint64_t __83__UIPanelController_viewWillTransitionToSize_withTransitionCoordinator_superBlock___block_invoke_2(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) &= ~0x200u;
  return objc_msgSend(*(id *)(a1 + 40), "setAutoresizesSubviews:", *(unsigned __int8 *)(a1 + 48));
}

void __83__UIPanelController_viewWillTransitionToSize_withTransitionCoordinator_superBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _UIPortalView *v8;
  _UIPortalView *v9;
  _UIPanelControllerMeshAnimatingTransitionView *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  id WeakRetained;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double Width;
  double v28;
  double v29;
  double v30;
  double Height;
  double v32;
  id v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double rect;
  _OWORD v51[3];
  CGAffineTransform v52;
  _QWORD v53[4];
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  CGAffineTransform v63;
  double v64;
  double v65;
  CGFloat v66;
  CGFloat v67;
  double v68;
  double v69;
  double v70;
  double v71;
  CGAffineTransform v72;
  _QWORD v73[5];
  CGRect v74;
  CGRect v75;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 56);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  v5 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v5, "_destTransitionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) |= 0x400u;
      v7 = MEMORY[0x1E0C809B0];
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = __83__UIPanelController_viewWillTransitionToSize_withTransitionCoordinator_superBlock___block_invoke_4;
      v73[3] = &unk_1E16B1B28;
      v73[4] = *(_QWORD *)(a1 + 32);
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v73);
      objc_msgSend(*(id *)(a1 + 48), "_removeAllAnimationsIncludingSubviewsTrackingForAnimationRestoration");
      v8 = [_UIPortalView alloc];
      objc_msgSend(*(id *)(a1 + 48), "bounds");
      v9 = -[_UIPortalView initWithFrame:](v8, "initWithFrame:");
      -[_UIPortalView setSourceView:](v9, "setSourceView:", *(_QWORD *)(a1 + 48));
      -[_UIPortalView setHidesSourceView:](v9, "setHidesSourceView:", 1);
      v10 = -[_UIPanelControllerMeshAnimatingTransitionView initWithView:]([_UIPanelControllerMeshAnimatingTransitionView alloc], "initWithView:", v9);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      objc_msgSend(*(id *)(a1 + 32), "_setDestinationTransitionView:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) &= ~0x400u;
      objc_msgSend(*(id *)(a1 + 48), "bounds");
      v14 = v13;
      rect = v15;
      v17 = v16;
      v19 = v18;
      v20 = v16 * 0.5;
      v47 = v18 * 0.5;
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
      objc_msgSend(*(id *)(a1 + 32), "_internalState");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = _transitionInsetsForViewController(WeakRetained, v22);
      v45 = v24;
      v46 = v23;
      v43 = v26;
      v44 = v25;

      Width = CGRectGetWidth(*(CGRect *)(a1 + 72));
      v28 = 1.0;
      v29 = 1.0;
      if (Width > 0.0)
      {
        v30 = Width;
        v74.origin.x = v14;
        v74.origin.y = rect;
        v74.size.width = v17;
        v74.size.height = v19;
        v29 = CGRectGetWidth(v74) / v30;
      }
      v48 = rect + v47;
      v49 = v14 + v20;
      Height = CGRectGetHeight(*(CGRect *)(a1 + 72));
      if (Height > 0.0)
      {
        v32 = Height;
        v75.origin.x = v14;
        v75.origin.y = rect;
        v75.size.width = v17;
        v75.size.height = v19;
        v28 = CGRectGetHeight(v75) / v32;
      }
      memset(&v72, 0, sizeof(v72));
      CGAffineTransformMakeScale(&v72, v29, v28);
      v53[0] = v7;
      v53[1] = 3221225472;
      v53[2] = __83__UIPanelController_viewWillTransitionToSize_withTransitionCoordinator_superBlock___block_invoke_5;
      v53[3] = &unk_1E16C1698;
      v54 = *(id *)(a1 + 48);
      v33 = *(id *)(a1 + 40);
      v34 = *(_OWORD *)(a1 + 88);
      v58 = *(_OWORD *)(a1 + 72);
      v59 = v34;
      v35 = *(_OWORD *)(a1 + 120);
      v60 = *(_OWORD *)(a1 + 104);
      v61 = v35;
      v57 = *(_QWORD *)(a1 + 64);
      v62 = *(_OWORD *)(a1 + 136);
      v63 = v72;
      v64 = v14;
      v65 = rect;
      v66 = v17;
      v67 = v19;
      v68 = v46;
      v69 = v45;
      v70 = v44;
      v71 = v43;
      v36 = *(_QWORD *)(a1 + 32);
      v55 = v33;
      v56 = v36;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v53);
      objc_msgSend(*(id *)(a1 + 40), "setCenter:", v49, v48);
      v52 = v72;
      objc_msgSend(*(id *)(a1 + 40), "setTransform:", &v52);
      _resizeMeshTransform(*(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128), v14, rect, v17, v19, v46, v45, v44, v43);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "layer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setMeshTransform:", v37);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setAlpha:", 1.0);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setCenter:", v49, v48);
      v39 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v40 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v51[0] = *MEMORY[0x1E0C9BAA8];
      v51[1] = v40;
      v51[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      objc_msgSend(v39, "setTransform:", v51);
      _resizeMeshTransform(v14, rect, v17, v19, v46, v45, v44, v43, v14, rect, v17, v19, v46, v45, v44, v43);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "layer");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setMeshTransform:", v41);

    }
  }
  else
  {
    objc_msgSend(v5, "_setNeedsDeferredUpdate");
  }

}

uint64_t __83__UIPanelController_viewWillTransitionToSize_withTransitionCoordinator_superBlock___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setNeedsLayoutAndPerformImmediately:", 1);
}

void __83__UIPanelController_viewWillTransitionToSize_withTransitionCoordinator_superBlock___block_invoke_5(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayScale");
  v4 = v3;

  _resizeMeshTransform(*(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMeshTransform:", v5);

  objc_msgSend(*(id *)(a1 + 40), "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRasterizationScale:", v4);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCenter:", *(double *)(a1 + 128), *(double *)(a1 + 136));
  v8 = *(_OWORD *)(a1 + 160);
  *(_OWORD *)&v16.a = *(_OWORD *)(a1 + 144);
  *(_OWORD *)&v16.c = v8;
  *(_OWORD *)&v16.tx = *(_OWORD *)(a1 + 176);
  CGAffineTransformInvert(&v17, &v16);
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v15 = v17;
  objc_msgSend(v9, "setTransform:", &v15);
  _resizeMeshTransform(*(CGFloat *)(a1 + 192), *(CGFloat *)(a1 + 200), *(CGFloat *)(a1 + 208), *(CGFloat *)(a1 + 216), *(double *)(a1 + 224), *(double *)(a1 + 232), *(double *)(a1 + 240), *(double *)(a1 + 248), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMeshTransform:", v10);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRasterizationScale:", v4);

  objc_msgSend(*(id *)(a1 + 48), "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "insertSubview:aboveSubview:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 48), "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "insertSubview:aboveSubview:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 40));

}

void *__83__UIPanelController_viewWillTransitionToSize_withTransitionCoordinator_superBlock___block_invoke_6(uint64_t a1)
{
  void *result;

  result = *(void **)(a1 + 40);
  if (result && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(result, "removeFromSuperview");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "removeFromSuperview");
    objc_msgSend(*(id *)(a1 + 32), "_setSourceTransitionView:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_setDestinationTransitionView:", 0);
    result = (void *)objc_msgSend(*(id *)(a1 + 48), "_finishTrackingForAnimationRestoration");
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) &= ~0x80u;
  return result;
}

void __63__UIPanelController__withDisabledAppearanceTransitionsPerform___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v8++), "setAppearanceTransitionsAreDisabled:", 1);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v6);
  }

  if (v3)
    v3[2](v3);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = *(id *)(a1 + 32);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v13++), "setAppearanceTransitionsAreDisabled:", 0);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v11);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = *(id *)(a1 + 32);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v18);
        if (v19)
        {
          if (((*(_DWORD *)(v19 + 368) >> 1) & 3u) - 1 <= 1)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v18), "_existingView", (_QWORD)v22);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "window");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v21)
            {
              -[UIViewController __viewWillDisappear:](v19, 0);
              -[UIViewController __viewDidDisappear:](v19, 0);
            }
          }
        }
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v16);
  }

}

uint64_t __44__UIPanelController__setNeedsDeferredUpdate__block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) |= 8u;
  return objc_msgSend(*(id *)(a1 + 32), "_setNeedsLayoutAndPerformImmediately:", 1);
}

void __53__UIPanelController__performSingleDeferredUpdatePass__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "_internalState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "externallyAnimatingStateRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v3) = objc_msgSend(v3, "isEqual:", v5);

    WeakRetained = v8;
    if ((_DWORD)v3)
    {
      objc_msgSend(v8, "_internalState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setExternallyAnimatingStateRequest:", 0);

      objc_msgSend(v8, "_internalState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setExternallyAnimatingAffectedSides:", 0);

      objc_msgSend(v8, "setNeedsUpdate");
      WeakRetained = v8;
    }
  }

}

void __43__UIPanelController__performWrappedUpdate___block_invoke_2(uint64_t a1)
{
  void (**WeakRetained)(id, _QWORD);

  WeakRetained = (void (**)(id, _QWORD))objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                              + 40));
  WeakRetained[2](WeakRetained, *(_QWORD *)(a1 + 32));

}

BOOL __54__UIPanelController__updateToNewPublicState_withSize___block_invoke_401(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (v3)
    {
      objc_msgSend(v3, "superview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        objc_msgSend(v5, "_installContentClippingView:", v3);
    }
    else
    {
      objc_msgSend(v4, "_removeContentClippingView");
    }
  }

  return v3 == 0;
}

void __54__UIPanelController__updateToNewPublicState_withSize___block_invoke_406(uint64_t a1)
{
  id v1;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_setNeedsStaticNavBarButtonUpdate");

}

uint64_t __54__UIPanelController__updateToNewPublicState_withSize___block_invoke_2_408(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "removeFromSuperview");
    return objc_msgSend(*(id *)(v2 + 40), "removeFromSuperview");
  }
  return result;
}

- (double)interpolatedMarginForPrimaryNavigationBar:(id)a3 supplementaryOrSecondaryNavbar:(id)a4 getInterpolatedAlpha:(double *)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int v31;
  int v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;

  v8 = a3;
  v9 = a4;
  -[UIPanelController currentState](self, "currentState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "supplementaryWidth");
  v12 = v11;
  v13 = v10;
  objc_msgSend(v13, "leadingWidth");
  v15 = v14;
  objc_msgSend(v13, "trailingWidth");
  v17 = v16;

  v18 = v15 + v17;
  if (v12 <= 0.0)
  {
    objc_msgSend(v13, "leadingDragOffset");
    v29 = v28;
    objc_msgSend(v13, "trailingDragOffset");
    v19 = 1.0;
    if (v18 <= 0.0)
      goto LABEL_7;
    v27 = v29 + v30;
  }
  else
  {
    v19 = 1.0;
    if (v18 <= 0.0)
      goto LABEL_7;
    v20 = v13;
    objc_msgSend(v20, "leadingDragOffset");
    v22 = v21;
    objc_msgSend(v20, "trailingDragOffset");
    v24 = v22 + v23;
    objc_msgSend(v20, "supplementaryDragOffset");
    v26 = v25;

    v27 = v24 + v26;
  }
  v19 = v27 / v18;
LABEL_7:
  if (v8)
  {
    v31 = objc_msgSend(v8, "_isContentViewHidden") ^ 1;
    if (v9)
    {
LABEL_9:
      v32 = objc_msgSend(v9, "_isContentViewHidden");
      v33 = 0.0;
      if (v31)
        v34 = 1.0;
      else
        v34 = 0.0;
      if (v32)
      {
        v35 = v8;
      }
      else
      {
        v33 = 1.0;
        v35 = v9;
      }
      goto LABEL_19;
    }
  }
  else
  {
    v31 = 0;
    if (v9)
      goto LABEL_9;
  }
  v33 = 0.0;
  v34 = 1.0;
  if (!v31)
    v34 = 0.0;
  v35 = v8;
LABEL_19:
  v36 = 1.0 - v19;
  if (a5)
  {
    v34 = v36 * v34;
    v33 = v34 + v19 * v33;
    *a5 = v33;
  }
  if (v31)
    v37 = v8;
  else
    v37 = v9;
  objc_msgSend(v37, "_contentMargin", v33, v34);
  v39 = v38;
  objc_msgSend(v35, "_contentMargin");
  v41 = v36 * v39 + v19 * v40;

  return v41;
}

- (id)_createBorderView
{
  UIPanelBorderView *v2;

  v2 = [UIPanelBorderView alloc];
  return -[UIPanelBorderView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (id)_createOverlayEdgeShadowViewForEdge:(unint64_t)a3
{
  return -[_UIVerticalEdgeShadowView initWithWidth:edge:]([_UIVerticalEdgeShadowView alloc], "initWithWidth:edge:", a3, 9.0);
}

- (id)_createOverlayShadowView
{
  void *v2;
  void *v3;
  _UIDuoShadowView *v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setRadius:", 1.0);
  objc_msgSend(v2, "setOpacity:", 0.16);
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setRadius:", 4.0);
  objc_msgSend(v3, "setOpacity:", 0.1);
  v4 = objc_alloc_init(_UIDuoShadowView);
  -[_UIDuoShadowView setPrimaryShadow:]((uint64_t)v4, v2);
  -[_UIDuoShadowView setSecondaryShadow:]((uint64_t)v4, v3);

  return v4;
}

- (void)_updateBorderViewsBackgroundColor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[UIPanelController _leadingBorderView](self, "_leadingBorderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIPanelController _leadingBorderView](self, "_leadingBorderView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v10);

  }
  -[UIPanelController _trailingBorderView](self, "_trailingBorderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIPanelController _trailingBorderView](self, "_trailingBorderView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v10);

  }
  -[UIPanelController _supplementaryBorderView](self, "_supplementaryBorderView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIPanelController _supplementaryBorderView](self, "_supplementaryBorderView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v10);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;

  if (self->_view == a4)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("backgroundColor")))
    {
      -[UIView backgroundColor](self->_view, "backgroundColor");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[UIPanelController _updateBorderViewsBackgroundColor:](self, "_updateBorderViewsBackgroundColor:", v7);

    }
  }
}

- (void)_stopAnimationsBeginningInteraction:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  CGFloat MaxX;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  double Width;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  id v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v3 = a3;
  -[UIPanelController _internalState](self, "_internalState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animationState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animator");
  v50 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v50, "isRunning");
  objc_msgSend(v50, "stopAnimation:", 0);
  objc_msgSend(v50, "finishAnimationAtPosition:", 2);
  -[UIPanelController navigationBarForContentLayoutGuideAnimation](self, "navigationBarForContentLayoutGuideAnimation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "_endAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange");
    objc_msgSend(v9, "_setShouldFadeStaticNavBarButton:", 0);
    -[UIPanelController setNavigationBarForContentLayoutGuideAnimation:](self, "setNavigationBarForContentLayoutGuideAnimation:", 0);
  }
  if (v3)
  {
    -[UIPanelController currentState](self, "currentState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stateRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_msgSend(v11, "copy");
    if (v7)
    {
      -[UIPanelController _internalState](self, "_internalState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "configuration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v49 = v14;
      v15 = objc_msgSend(v14, "supplementaryEdge");
      -[UIPanelController view](self, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (v15 == 0) ^ objc_msgSend(v16, "_shouldReverseLayoutDirection");
      if (v15)
        -[UIPanelController trailingViewController](self, "trailingViewController");
      else
        -[UIPanelController leadingViewController](self, "leadingViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        MaxX = *MEMORY[0x1E0C9D648];
        v21 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        v23 = *(double *)(MEMORY[0x1E0C9D648] + 16);
        v22 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      }
      else
      {
        objc_msgSend(v16, "bounds");
        MaxX = CGRectGetMaxX(v51);
        v22 = 0.0;
        v23 = 0.0;
        v21 = 0.0;
      }
      objc_msgSend(v19, "window");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_msgSend(v19, "frame");
        MaxX = v25;
        v21 = v26;
        v23 = v27;
        v22 = v28;
      }
      -[UIPanelController supplementaryViewController](self, "supplementaryViewController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "view");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "frame");
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v38 = v37;

      if (v17)
      {
        v52.origin.x = MaxX;
        v52.origin.y = v21;
        v52.size.width = v23;
        v52.size.height = v22;
        v39 = CGRectGetMaxX(v52);
      }
      else
      {
        objc_msgSend(v16, "bounds");
        v40 = CGRectGetMaxX(v53);
        v41 = MaxX;
        v42 = v40;
        v54.origin.x = v41;
        v54.origin.y = v21;
        v54.size.width = v23;
        v54.size.height = v22;
        v39 = v42 - CGRectGetMinX(v54);
      }
      if (v15)
        objc_msgSend(v12, "setTrailingWidth:", v39);
      else
        objc_msgSend(v12, "setLeadingWidth:", v39);
      v55.origin.x = v32;
      v55.origin.y = v34;
      v55.size.width = v36;
      v55.size.height = v38;
      Width = CGRectGetWidth(v55);
      if (v17)
      {
        v56.origin.x = v32;
        v56.origin.y = v34;
        v56.size.width = v36;
        v56.size.height = v38;
        v44 = CGRectGetMaxX(v56);
      }
      else
      {
        objc_msgSend(v16, "bounds");
        v45 = CGRectGetMaxX(v57);
        v58.origin.x = v32;
        v58.origin.y = v34;
        v58.size.width = v36;
        v58.size.height = v38;
        v44 = v45 - CGRectGetMinX(v58);
      }
      if (Width < v44)
        v44 = Width;
      objc_msgSend(v12, "setSupplementaryWidth:", v44);

    }
    if (!objc_msgSend(v12, "isEqual:", v11)
      || (objc_msgSend(v12, "leadingWidth"), v46 != 0.0)
      || (objc_msgSend(v12, "supplementaryWidth"), v47 != 0.0)
      || (objc_msgSend(v12, "trailingWidth"), v48 != 0.0))
    {
      -[UIPanelController setInteractiveStateRequest:](self, "setInteractiveStateRequest:", v12);
    }

  }
}

- (void)stopAnimations
{
  -[UIPanelController _stopAnimationsBeginningInteraction:](self, "_stopAnimationsBeginningInteraction:", 1);
}

- (CGSize)_expectedSecondaryColumnSizeAfterAnimatingToState:(id)a3 getLeadingColumnSize:(CGSize *)a4 trailingColumnSize:(CGSize *)a5 supplementaryColumnSize:(CGSize *)a6
{
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  double v61;
  double v62;
  CGSize result;

  v9 = a3;
  if (!-[UIPanelController style](self, "style"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPanelController.m"), 4960, CFSTR("Unsupported code path for unspecified-style UISplitViewController"));

  }
  objc_msgSend(v9, "leadingWidth");
  v11 = v10;
  objc_msgSend(v9, "trailingWidth");
  v13 = v12;
  objc_msgSend(v9, "supplementaryWidth");
  v15 = v14;
  if (v11 <= 0.0)
    v16 = 0;
  else
    v16 = objc_msgSend(v9, "leadingOverlapsMain") ^ 1;
  if (v13 <= 0.0)
    v17 = 0;
  else
    v17 = objc_msgSend(v9, "trailingOverlapsMain") ^ 1;
  if (v15 <= 0.0)
    v18 = 0;
  else
    v18 = objc_msgSend(v9, "supplementaryOverlapsMain") ^ 1;
  objc_msgSend(v9, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPanelController _contentView](self, "_contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v22 = v21;
  -[UIPanelController mainViewController](self, "mainViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  v61 = v25;
  v62 = v26;

  -[UIPanelController leadingViewController](self, "leadingViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bounds");
  v30 = v29;
  v60 = v31;

  -[UIPanelController trailingViewController](self, "trailingViewController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bounds");
  v35 = v34;
  v59 = v36;

  -[UIPanelController supplementaryViewController](self, "supplementaryViewController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "bounds");
  v40 = v39;
  v58 = v41;

  objc_msgSend(v20, "_currentScreenScale");
  objc_msgSend(v19, "leadingBorderWidthForScale:");
  v43 = v42;
  objc_msgSend(v9, "mainWidth");
  if (v44 == 0.0)
  {
    if ((v16 | v17 | v18) == 1)
    {
      v45 = v11 + v43;
      v46 = 0.0;
      if (!v16)
        v45 = 0.0;
      v47 = v22 - v45;
      if (v17)
        v46 = v13 + v43;
      v22 = v47 - v46;
      if (v18)
        v22 = v22 - (v15 + v43);
    }
  }
  else
  {
    v22 = v44;
  }
  if (v11 == 0.0)
  {
    objc_msgSend(v9, "leadingOffscreenWidth");
    v11 = v48;
  }
  if (v13 == 0.0)
  {
    objc_msgSend(v9, "trailingOffscreenWidth");
    v13 = v49;
  }
  if (v11 > 0.0)
  {
    objc_msgSend(v19, "rubberBandExtension");
    v30 = v11 + v50;
  }
  if (v13 > 0.0)
  {
    objc_msgSend(v19, "rubberBandExtension");
    v35 = v13 + v51;
  }
  if (v15 == 0.0)
  {
    objc_msgSend(v9, "supplementaryOffscreenWidth");
    v15 = v52;
  }
  if (v15 <= 0.0)
    v53 = v40;
  else
    v53 = v15;
  if (a4)
  {
    a4->width = v30;
    a4->height = v60;
  }
  if (a5)
  {
    a5->width = v35;
    a5->height = v59;
  }
  if (a6)
  {
    a6->width = v53;
    a6->height = v58;
  }
  if (v22 <= 0.0)
    v54 = v61;
  else
    v54 = v22;

  v55 = v54;
  v56 = v62;
  result.height = v56;
  result.width = v55;
  return result;
}

- (void)_animateFromRequest:(id)a3 toRequest:(id)a4 withAffectedSides:(int64_t)a5 forceOverlay:(BOOL)a6 velocity:(double)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  _UIPanelAnimationState *v40;
  void *v41;
  _UIPanelCoordinatingAnimator *v42;
  void *v43;
  _UIPanelCoordinatingAnimator *v44;
  void *v45;
  uint64_t v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  char v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  uint64_t v69;
  void *v70;
  int64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  _QWORD v83[5];
  _QWORD v84[4];
  _UIPanelAnimationState *v85;
  UIPanelController *v86;
  id v87;
  BOOL v88;
  _QWORD v89[4];
  id v90;
  id v91;
  id v92;
  _QWORD v93[4];
  id v94;
  id v95;
  id v96;
  id v97[2];
  BOOL v98;
  id from;
  id location[2];

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = v13;
  if (v12 && v13)
  {
    -[UIPanelController _internalState](self, "_internalState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "animationState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[UIPanelController _internalState](self, "_internalState");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "animationState");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "toRequest");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqual:", v14);

      if ((v20 & 1) != 0)
        goto LABEL_25;
      -[UIPanelController _internalState](self, "_internalState");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "animationState");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "animator");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stopAnimation:", 1);

    }
    -[UIPanelController currentState](self, "currentState");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_interactiveStateRequest");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v14, "isEqual:", v25);

    if (v26)
    {
      -[UIPanelController _internalState](self, "_internalState");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setStateRequest:", v14);

      -[UIPanelController _internalState](self, "_internalState");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "animationState");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        -[UIPanelController navigationBarForContentLayoutGuideAnimation](self, "navigationBarForContentLayoutGuideAnimation");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "_endAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange");

        -[UIPanelController setNavigationBarForContentLayoutGuideAnimation:](self, "setNavigationBarForContentLayoutGuideAnimation:", 0);
      }
    }
    else
    {
      -[UIPanelController delegate](self, "delegate");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPanelController view](self, "view");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPanelController _internalState](self, "_internalState");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v32, "copy");

      objc_msgSend(v31, "bounds");
      v74 = v31;
      objc_msgSend(v33, "computePossibleStatesGivenParentView:withSize:forceOverlay:", v31, v8, v34, v35);
      v36 = objc_claimAutoreleasedReturnValue();
      v73 = v33;
      objc_msgSend(v33, "_stateForInteractiveRequest:withAffectedSides:inPossibleStates:", v14, a5, v36);
      v37 = objc_claimAutoreleasedReturnValue();
      +[_UIPanelAnimationState defaultDuration](_UIPanelAnimationState, "defaultDuration");
      v39 = v38;
      v40 = objc_alloc_init(_UIPanelAnimationState);
      -[_UIPanelAnimationState setToRequest:](v40, "setToRequest:", v14);
      -[_UIPanelAnimationState setFromRequest:](v40, "setFromRequest:", v12);
      -[_UIPanelAnimationState setAffectedSides:](v40, "setAffectedSides:", a5);
      v71 = -[UIPanelController style](self, "style");
      -[_UIPanelAnimationState setShouldAssignOffscreenWidthsToStateRequest:](v40, "setShouldAssignOffscreenWidthsToStateRequest:", v71 != 0);
      -[_UIPanelAnimationState setAnimatorShouldCoordinate:](v40, "setAnimatorShouldCoordinate:", -[UIPanelController animationRequestShouldCoordinate](self, "animationRequestShouldCoordinate"));
      -[UIPanelController setAnimationRequestShouldCoordinate:](self, "setAnimationRequestShouldCoordinate:", 0);
      -[UIPanelController _internalState](self, "_internalState");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setAnimationState:", v40);

      v72 = (void *)v36;
      v76 = (void *)v37;
      if (!-[UIPanelController _animateCustomTransitionIfNeededWithAnimationState:possiblePublicStates:newPublicState:estimatedDuration:needsInitialLayout:](self, "_animateCustomTransitionIfNeededWithAnimationState:possiblePublicStates:newPublicState:estimatedDuration:needsInitialLayout:", v40, v36, v37, v16 == 0, *(double *)&v39))
      {
        -[UIPanelController navigationBarForContentLayoutGuideAnimation](self, "navigationBarForContentLayoutGuideAnimation");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(location, self);
        objc_initWeak(&from, v40);
        v42 = [_UIPanelCoordinatingAnimator alloc];
        +[_UIPanelAnimationState timingCurveProviderWithVelocity:](_UIPanelAnimationState, "timingCurveProviderWithVelocity:", a7);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v42, "initWithDuration:timingParameters:", v43, *(double *)&v39);
        -[_UIPanelAnimationState setAnimator:](v40, "setAnimator:", v44);

        -[_UIPanelAnimationState animator](v40, "animator");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = MEMORY[0x1E0C809B0];
        v93[0] = MEMORY[0x1E0C809B0];
        v93[1] = 3221225472;
        v93[2] = __91__UIPanelController__animateFromRequest_toRequest_withAffectedSides_forceOverlay_velocity___block_invoke;
        v93[3] = &unk_1E16C17F0;
        objc_copyWeak(&v96, location);
        objc_copyWeak(v97, &from);
        v98 = v71 != 0;
        v47 = v14;
        v94 = v47;
        v48 = v76;
        v95 = v48;
        v97[1] = v39;
        objc_msgSend(v45, "addAnimations:", v93);

        -[_UIPanelAnimationState animator](v40, "animator");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v89[0] = v46;
        v89[1] = 3221225472;
        v89[2] = __91__UIPanelController__animateFromRequest_toRequest_withAffectedSides_forceOverlay_velocity___block_invoke_3;
        v89[3] = &unk_1E16C1818;
        objc_copyWeak(&v92, location);
        v90 = v47;
        v50 = v70;
        v91 = v50;
        objc_msgSend(v49, "addCompletion:", v89);

        -[UIPanelController configuration](self, "configuration");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "_setShouldFadeStaticNavBarButton:", objc_msgSend(v51, "shouldFadeStaticNavBarButton"));

        if (v16)
        {
          v83[0] = v46;
          v83[1] = 3221225472;
          v83[2] = __91__UIPanelController__animateFromRequest_toRequest_withAffectedSides_forceOverlay_velocity___block_invoke_5;
          v83[3] = &unk_1E16B1B28;
          v83[4] = self;
          +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v83);
        }
        else
        {
          v84[0] = v46;
          v84[1] = 3221225472;
          v84[2] = __91__UIPanelController__animateFromRequest_toRequest_withAffectedSides_forceOverlay_velocity___block_invoke_4;
          v84[3] = &unk_1E16B4030;
          v88 = v71 != 0;
          v85 = v40;
          v86 = self;
          v87 = v50;
          +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v84);

        }
        -[UIPanelController _contentView](self, "_contentView", v48);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIPanelAnimationState animator](v40, "animator");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setContainerView:", v52);

        if (v71)
        {
          if (-[_UIPanelAnimationState animatorShouldCoordinate](v40, "animatorShouldCoordinate"))
          {
            -[UIPanelController delegate](self, "delegate");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_opt_respondsToSelector();

            if ((v55 & 1) != 0)
            {
              v81 = 0.0;
              v82 = 0.0;
              v79 = 0.0;
              v80 = 0.0;
              v77 = 0.0;
              v78 = 0.0;
              -[UIPanelController _expectedSecondaryColumnSizeAfterAnimatingToState:getLeadingColumnSize:trailingColumnSize:supplementaryColumnSize:](self, "_expectedSecondaryColumnSizeAfterAnimatingToState:getLeadingColumnSize:trailingColumnSize:supplementaryColumnSize:", v69, &v81, &v79, &v77);
              v57 = v56;
              v59 = v58;
              v60 = v81;
              v61 = v82;
              v62 = v79;
              v63 = v80;
              -[UIPanelController delegate](self, "delegate");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = v64;
              if (v62 <= 0.0)
                v66 = v61;
              else
                v66 = v63;
              if (v62 <= 0.0)
                v67 = v60;
              else
                v67 = v62;
              objc_msgSend(v64, "panelController:willBeginAnimationToPrimarySize:supplementarySize:secondarySize:", self, v67, v66, v77, v78, v57, v59);

            }
          }
        }
        -[_UIPanelAnimationState animator](v40, "animator");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "startAnimation");

        objc_destroyWeak(&v92);
        objc_destroyWeak(v97);
        objc_destroyWeak(&v96);
        objc_destroyWeak(&from);
        objc_destroyWeak(location);

      }
    }
  }
LABEL_25:

}

void __91__UIPanelController__animateFromRequest_toRequest_withAffectedSides_forceOverlay_velocity___block_invoke(uint64_t a1)
{
  float minimum;
  float maximum;
  float preferred;
  double v5;
  double v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  char v13;
  CAFrameRateRange v14;

  v14 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v14.minimum;
  maximum = v14.maximum;
  preferred = v14.preferred;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91__UIPanelController__animateFromRequest_toRequest_withAffectedSides_forceOverlay_velocity___block_invoke_2;
  v7[3] = &unk_1E16C17F0;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  objc_copyWeak(&v11, (id *)(a1 + 56));
  v13 = *(_BYTE *)(a1 + 72);
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 64);
  *(float *)&v5 = maximum;
  *(float *)&v6 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048622, v7, COERCE_DOUBLE(__PAIR64__(HIDWORD(v12), LODWORD(minimum))), v5, v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
}

void __91__UIPanelController__animateFromRequest_toRequest_withAffectedSides_forceOverlay_velocity___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = v2;
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(v2, "setProgress:", 1.0);
    objc_msgSend(v3, "setFinishingAnimation:", 1);
  }
  else
  {
    objc_msgSend(v2, "setProgress:", 0.999);
  }
  objc_msgSend(WeakRetained, "_setNeedsLayoutAndPerformImmediately:", 1);
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "panelController:animateTransitionToStateRequest:predictedEndState:predictedDuration:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 64));

  }
}

void __91__UIPanelController__animateFromRequest_toRequest_withAffectedSides_forceOverlay_velocity___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!a2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "_internalState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStateRequest:", v4);

  }
  objc_msgSend(WeakRetained, "_internalState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAnimationState:", 0);

  objc_msgSend(WeakRetained, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "panelController:didEndAnimatedTransitionToStateRequest:", WeakRetained, *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 40), "_endAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange");
  objc_msgSend(*(id *)(a1 + 40), "_setShouldFadeStaticNavBarButton:", 0);
  objc_msgSend(WeakRetained, "setNavigationBarForContentLayoutGuideAnimation:", 0);
  objc_msgSend(WeakRetained, "_setNeedsLayoutAndPerformImmediately:", 0);

}

uint64_t __91__UIPanelController__animateFromRequest_toRequest_withAffectedSides_forceOverlay_velocity___block_invoke_4(uint64_t a1)
{
  double v2;

  v2 = 0.001;
  if (*(_BYTE *)(a1 + 56))
    v2 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "setProgress:", v2);
  objc_msgSend(*(id *)(a1 + 40), "setNavigationBarForContentLayoutGuideAnimation:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_setNeedsLayoutAndPerformImmediately:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "setNavigationBarForContentLayoutGuideAnimation:", *(_QWORD *)(a1 + 48));
}

void __91__UIPanelController__animateFromRequest_toRequest_withAffectedSides_forceOverlay_velocity___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "leadingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_existingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "supplementaryViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_existingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "trailingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_existingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "mainViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_existingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutIfNeeded");

}

- (BOOL)_animateCustomTransitionIfNeededWithAnimationState:(id)a3 possiblePublicStates:(id)a4 newPublicState:(id)a5 estimatedDuration:(double)a6 needsInitialLayout:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _UIViewControllerOneToOneTransitionContext *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double Height;
  void *v44;
  char v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  BOOL v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  void *v67;
  void *v68;
  _BOOL4 v69;
  void *v70;
  _UIViewControllerOneToOneTransitionContext *v71;
  void *v72;
  _QWORD v73[4];
  id v74;
  UIPanelController *v75;
  id v76;
  _QWORD v77[4];
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id location[2];
  CGRect v84;
  CGRect v85;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  -[UIPanelController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    -[UIPanelController delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "toRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "panelController:willBeginAnimatedTransitionToStateRequest:predictedEndState:predictedDuration:", self, v18, v14, a6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:](_UIViewControllerOneToOneTransitionContext, "_associatedTransitionContextForAnimationController:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        v69 = v7;
        v21 = objc_alloc_init(_UIViewControllerOneToOneTransitionContext);
        -[_UIViewControllerTransitionContext _setIsAnimated:](v21, "_setIsAnimated:", +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
        -[UIPanelController _contentView](self, "_contentView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIViewControllerTransitionContext _setContainerView:](v21, "_setContainerView:", v22);

        -[_UIViewControllerTransitionContext _setAnimator:](v21, "_setAnimator:", v19);
        -[_UIViewControllerTransitionContext _setDuration:](v21, "_setDuration:", a6);
        -[_UIViewControllerOneToOneTransitionContext _setFromView:](v21, "_setFromView:", 0);
        -[_UIViewControllerOneToOneTransitionContext _setFromViewController:](v21, "_setFromViewController:", 0);
        -[UIPanelController _internalState](self, "_internalState");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "leadingViewController");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "view");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIViewControllerOneToOneTransitionContext _setToView:](v21, "_setToView:", v25);

        -[UIPanelController _internalState](self, "_internalState");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "leadingViewController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v21;
        -[_UIViewControllerOneToOneTransitionContext _setToViewController:](v21, "_setToViewController:", v27);

        -[UIPanelController view](self, "view");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "fromRequest");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "toRequest");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPanelController _internalState](self, "_internalState");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v30, "copy");

        v32 = objc_msgSend(v12, "affectedSides");
        -[UIPanelController possibleStates](self, "possibleStates");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "_stateForInteractiveRequest:withAffectedSides:inPossibleStates:", v29, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v29, "leadingWidth");
        v36 = v35;
        v68 = v29;
        objc_msgSend(v29, "leadingOffscreenWidth");
        if (v36 < v37)
          v36 = v37;
        v67 = v34;
        objc_msgSend(v34, "leadingDragOffset");
        v39 = v38;
        objc_msgSend(v28, "_currentScreenScale");
        UIRoundToScale(v39, v40);
        v42 = v41;
        v72 = v28;
        objc_msgSend(v28, "bounds");
        Height = CGRectGetHeight(v84);
        -[UIPanelController view](self, "view");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "_shouldReverseLayoutDirection");

        if ((v45 & 1) != 0)
        {
          -[UIPanelController view](self, "view");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "bounds");
          v49 = v47 + v48 - (v36 - v42);

        }
        else
        {
          v49 = -v42;
        }
        v51 = 0.0;
        -[_UIViewControllerOneToOneTransitionContext _setToStartFrame:](v71, "_setToStartFrame:", v49, 0.0, v36, Height);
        objc_msgSend(v70, "leadingWidth");
        v53 = v52;
        objc_msgSend(v70, "leadingOffscreenWidth");
        if (v53 < v54)
          v53 = v54;
        objc_msgSend(v14, "leadingDragOffset");
        v56 = v55;
        objc_msgSend(v28, "_currentScreenScale");
        UIRoundToScale(v56, v57);
        v59 = v58;
        objc_msgSend(v28, "bounds");
        v60 = CGRectGetHeight(v85);
        if ((v45 & 1) != 0)
        {
          -[UIPanelController view](self, "view");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "bounds");

        }
        else
        {
          v51 = -v59;
        }
        -[_UIViewControllerOneToOneTransitionContext _setToEndFrame:](v71, "_setToEndFrame:", v51, 0.0, v53, v60);
        objc_initWeak(location, self);
        v77[0] = MEMORY[0x1E0C809B0];
        v77[1] = 3221225472;
        v77[2] = __145__UIPanelController__animateCustomTransitionIfNeededWithAnimationState_possiblePublicStates_newPublicState_estimatedDuration_needsInitialLayout___block_invoke;
        v77[3] = &unk_1E16C1840;
        objc_copyWeak(&v82, location);
        v62 = v70;
        v78 = v62;
        v79 = v14;
        v63 = v31;
        v80 = v63;
        v81 = v13;
        -[_UIViewControllerTransitionContext _setCompletionHandler:](v71, "_setCompletionHandler:", v77);
        if (v69)
        {
          -[UIPanelController navigationBarForContentLayoutGuideAnimation](self, "navigationBarForContentLayoutGuideAnimation");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v73[0] = MEMORY[0x1E0C809B0];
          v73[1] = 3221225472;
          v73[2] = __145__UIPanelController__animateCustomTransitionIfNeededWithAnimationState_possiblePublicStates_newPublicState_estimatedDuration_needsInitialLayout___block_invoke_2;
          v73[3] = &unk_1E16B47A8;
          v74 = v12;
          v75 = self;
          v65 = v64;
          v76 = v65;
          +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v73);

        }
        objc_msgSend(v19, "animateTransition:", v71);

        objc_destroyWeak(&v82);
        objc_destroyWeak(location);

      }
      v50 = 1;
    }
    else
    {
      v50 = 0;
    }
  }
  else
  {
    v50 = 0;
    v19 = 0;
  }

  return v50;
}

void __145__UIPanelController__animateCustomTransitionIfNeededWithAnimationState_possiblePublicStates_newPublicState_estimatedDuration_needsInitialLayout___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  id v22;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v22 = WeakRetained;
    if (a3)
    {
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(WeakRetained, "_internalState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setStateRequest:", v6);

      WeakRetained = v22;
    }
    objc_msgSend(WeakRetained, "_internalState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAnimationState:", 0);

    objc_msgSend(v22, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      objc_msgSend(v22, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "panelController:didEndAnimatedTransitionToStateRequest:", v22, *(_QWORD *)(a1 + 32));

    }
    objc_msgSend(v22, "_setLastComputedPublicState:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v22, "_setPreviousInternalState:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v22, "_setLastPossiblePublicStates:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v22, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    objc_msgSend(v22, "_setLastViewSize:", v13, v14);

    objc_msgSend(v22, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    WeakRetained = v22;
    if ((v16 & 1) != 0)
    {
      objc_msgSend(v22, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v22, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bounds");
      objc_msgSend(v17, "panelController:didChangeToState:withSize:", v22, v18, v20, v21);

      WeakRetained = v22;
    }
  }

}

uint64_t __145__UIPanelController__animateCustomTransitionIfNeededWithAnimationState_possiblePublicStates_newPublicState_estimatedDuration_needsInitialLayout___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setProgress:", 0.0);
  objc_msgSend(*(id *)(a1 + 40), "setNavigationBarForContentLayoutGuideAnimation:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_setNeedsLayoutAndPerformImmediately:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "setNavigationBarForContentLayoutGuideAnimation:", *(_QWORD *)(a1 + 48));
}

- (BOOL)isLeadingViewControllerVisibleAfterAnimation
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  -[UIPanelController _internalState](self, "_internalState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingWidth");
  v6 = v5 > 0.0;

  return v6;
}

- (BOOL)isTrailingViewControllerVisibleAfterAnimation
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  -[UIPanelController _internalState](self, "_internalState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingWidth");
  v6 = v5 > 0.0;

  return v6;
}

- (BOOL)isSupplementaryViewControllerVisibleAfterAnimation
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  -[UIPanelController _internalState](self, "_internalState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supplementaryWidth");
  v6 = v5 > 0.0;

  return v6;
}

- (void)animateToRequest:(id)a3
{
  -[UIPanelController animateToRequest:forceOverlay:](self, "animateToRequest:forceOverlay:", a3, 0);
}

- (void)animateToRequest:(id)a3 forceOverlay:(BOOL)a4
{
  -[UIPanelController animateToRequest:forceOverlay:withVelocity:](self, "animateToRequest:forceOverlay:withVelocity:", a3, a4, 0.0);
}

- (void)animateToRequest:(id)a3 forceOverlay:(BOOL)a4 withVelocity:(double)a5
{
  _BOOL8 v6;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  BOOL v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;

  v6 = a4;
  v29 = a3;
  -[UIPanelController interactiveStateRequest](self, "interactiveStateRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPanelController setInteractiveStateRequest:](self, "setInteractiveStateRequest:", 0);
  v9 = v8;
  v10 = v9;
  if (!v9)
  {
    -[UIPanelController currentState](self, "currentState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stateRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "isEqual:", v10))
    {
      -[UIPanelController delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "primaryEdge");

      if (v13)
      {
        objc_msgSend(v11, "trailingDragOffset");
        v15 = v14;
        objc_msgSend(v11, "supplementaryDragOffset");
        v17 = v15 + v16;
        if (v17 > 0.0)
        {
          objc_msgSend(v10, "trailingWidth");
LABEL_8:
          v22 = v17 - v18;
          v23 = v18 - v17;
          v24 = v17 < v18;
          v25 = 0.0;
          if (v24)
            v26 = 0.0;
          else
            v26 = v22;
          if (v24)
            v27 = v23;
          else
            v27 = 0.0;
          objc_msgSend(v10, "supplementaryWidth");
          if (v26 < v28)
            v25 = v28 - v26;
          if (v13)
            objc_msgSend(v10, "setTrailingWidth:", v27);
          else
            objc_msgSend(v10, "setLeadingWidth:", v27);
          objc_msgSend(v10, "setSupplementaryWidth:", v25);
        }
      }
      else
      {
        objc_msgSend(v11, "leadingDragOffset");
        v20 = v19;
        objc_msgSend(v11, "supplementaryDragOffset");
        v17 = v20 + v21;
        if (v17 > 0.0)
        {
          objc_msgSend(v10, "leadingWidth");
          goto LABEL_8;
        }
      }
    }

  }
  -[UIPanelController _animateFromRequest:toRequest:withAffectedSides:forceOverlay:velocity:](self, "_animateFromRequest:toRequest:withAffectedSides:forceOverlay:velocity:", v10, v29, 0, v6, a5);

}

- (UISlidingBarStateRequest)interactiveStateRequest
{
  void *v2;
  void *v3;

  -[UIPanelController _internalState](self, "_internalState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interactiveStateRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UISlidingBarStateRequest *)v3;
}

- (void)setInteractiveStateRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[UIPanelController _internalState](self, "_internalState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInteractiveStateRequest:", v4);

  -[UIPanelController _setNeedsLayoutAndPerformImmediately:](self, "_setNeedsLayoutAndPerformImmediately:", 0);
}

- (NSArray)uncachedPossibleStates
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;

  -[UIPanelController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPanelController _internalState](self, "_internalState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "computePossibleStatesGivenParentView:withSize:", v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (id)uncachedPossibleStatesForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;

  height = a3.height;
  width = a3.width;
  -[UIPanelController _internalState](self, "_internalState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPanelController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "computePossibleStatesGivenParentView:withSize:", v7, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_observeKeyboardNotificationsOnScreen:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4 && (*((_BYTE *)&self->_panelControllerFlags + 1) & 8) == 0)
  {
    v6 = v4;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__adjustForKeyboardInfo_, CFSTR("UIKeyboardPrivateWillShowNotification"), v6);
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__adjustForKeyboardInfo_, CFSTR("UIKeyboardPrivateWillHideNotification"), v6);
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__adjustForKeyboardInfo_, CFSTR("UIKeyboardPrivateDidChangeFrameNotification"), v6);
    *(_DWORD *)&self->_panelControllerFlags |= 0x800u;

    v4 = v6;
  }

}

- (void)_adjustForKeyboardInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UILayoutContainerView *view;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  _QWORD v29[5];

  v4 = a3;
  if (self->_view && !-[UIPanelController isCollapsed](self, "isCollapsed"))
  {
    if (!-[UIPanelController supportsColumnStyle](self, "supportsColumnStyle"))
    {
      -[UIPanelController owningViewController](self, "owningViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController _keyboardSceneDelegate](v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      view = self->_view;
      objc_msgSend(v4, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "verticalOverlapForView:usingKeyboardInfo:", view, v8);
      v10 = v9;

      -[UIPanelController _internalState](self, "_internalState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "keyboardAdjustment");
      v13 = v12;

      if (v13 != v10)
      {
        -[UIPanelController owningViewController](self, "owningViewController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        findTransitioningChildNavigationController(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v15, "transitionCoordinator");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __44__UIPanelController__adjustForKeyboardInfo___block_invoke;
          v29[3] = &unk_1E16B2150;
          v29[4] = self;
          objc_msgSend(v16, "animateAlongsideTransition:completion:", 0, v29);

        }
        else
        {
          -[UIPanelController _internalState](self, "_internalState");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setKeyboardAdjustment:", v10);

          -[UIPanelController currentState](self, "currentState");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "leadingOverlapsMain");

          if (v19)
            -[UIPanelController _setNeedsDeferredUpdate](self, "_setNeedsDeferredUpdate");
        }

      }
    }
    -[UIPanelController currentState](self, "currentState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "leadingOverlapsMain");

    if ((v21 & 1) == 0)
    {
      objc_msgSend(v4, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "isEqualToString:", CFSTR("UIKeyboardPrivateWillShowNotification")))
      {

LABEL_14:
        objc_msgSend(v4, "userInfo");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPanelController _adjustNonOverlayLeadingScrollViewsForKeyboardInfo:](self, "_adjustNonOverlayLeadingScrollViewsForKeyboardInfo:", v25);

        objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__adjustNonOverlayLeadingScrollViewsForKeyboardInfo_, 0);
        goto LABEL_15;
      }
      objc_msgSend(v4, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("UIKeyboardPrivateDidChangeFrameNotification"));

      if (v24)
        goto LABEL_14;
      objc_msgSend(v4, "name");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("UIKeyboardPrivateWillHideNotification"));

      if (v27)
      {
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0C99860]);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPanelController performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__adjustNonOverlayLeadingScrollViewsForKeyboardInfo_, 0, v28, 0.0);

      }
    }
  }
LABEL_15:

}

uint64_t __44__UIPanelController__adjustForKeyboardInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_adjustForKeyboardInfo:", 0);
}

- (void)_adjustNonOverlayLeadingScrollViewsForKeyboardInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[UIPanelController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPanelController leadingViewController](self, "leadingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "panelController:adjustLeadingViewController:forKeyboardInfo:", self, v5, v7);
  -[UIPanelController trailingViewController](self, "trailingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "panelController:adjustTrailingViewController:forKeyboardInfo:", self, v6, v7);

}

- (NSString)description
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIPanelController;
  -[UIPanelController description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (os_variant_has_internal_diagnostics())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_owningViewController);
    objc_msgSend(v4, "appendFormat:", CFSTR(" svc=%p state=%p"), WeakRetained, self->__internalState);

    if (self->__previousInternalState)
      objc_msgSend(v4, "appendFormat:", CFSTR(" prevState=%p"), self->__previousInternalState);
    if (self->__lastComputedPublicState)
      objc_msgSend(v4, "appendFormat:", CFSTR(" publicState=%p"), self->__lastComputedPublicState);
    if (-[NSArray count](self->__lastPossiblePublicStates, "count"))
      objc_msgSend(v4, "appendFormat:", CFSTR(" possibleStates=%p"), self->__lastPossiblePublicStates);
    _UISplitViewControllerStyleDescription(self->_style);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" style=%@"), v7);

  }
  return (NSString *)v4;
}

- (BOOL)animationRequestShouldCoordinate
{
  return self->_animationRequestShouldCoordinate;
}

- (void)setAnimationRequestShouldCoordinate:(BOOL)a3
{
  self->_animationRequestShouldCoordinate = a3;
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (BOOL)showShadowViews
{
  return self->_showShadowViews;
}

- (void)setLeadingBarContentClippingView:(id)a3
{
  objc_storeStrong((id *)&self->_leadingBarContentClippingView, a3);
}

- (void)setTrailingBarContentClippingView:(id)a3
{
  objc_storeStrong((id *)&self->_trailingBarContentClippingView, a3);
}

- (void)setSupplementaryBarContentClippingView:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryBarContentClippingView, a3);
}

- (void)setNavigationBarForContentLayoutGuideAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_navigationBarForContentLayoutGuideAnimation, a3);
}

- (void)setFloatingBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_floatingBarButtonItem, a3);
}

- (BOOL)wantsFloatingSidebar
{
  return self->_wantsFloatingSidebar;
}

- (void)setWantsFloatingSidebar:(BOOL)a3
{
  self->_wantsFloatingSidebar = a3;
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (_UIPanelInternalState)_previousInternalState
{
  return self->__previousInternalState;
}

- (UISlidingBarConfiguration)_suspendedConfiguration
{
  return self->__suspendedConfiguration;
}

- (void)_setSuspendedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->__suspendedConfiguration, a3);
}

- (NSArray)_lastPossiblePublicStates
{
  return self->__lastPossiblePublicStates;
}

- (UIPanelBorderView)_leadingBorderView
{
  return self->__leadingBorderView;
}

- (void)_setLeadingBorderView:(id)a3
{
  objc_storeStrong((id *)&self->__leadingBorderView, a3);
}

- (UIPanelBorderView)_trailingBorderView
{
  return self->__trailingBorderView;
}

- (void)_setTrailingBorderView:(id)a3
{
  objc_storeStrong((id *)&self->__trailingBorderView, a3);
}

- (UIPanelBorderView)_supplementaryBorderView
{
  return self->__supplementaryBorderView;
}

- (void)_setSupplementaryBorderView:(id)a3
{
  objc_storeStrong((id *)&self->__supplementaryBorderView, a3);
}

- (_UIDuoShadowView)_overlayEdgeShadowView
{
  return self->__overlayEdgeShadowView;
}

- (void)_setOverlayEdgeShadowView:(id)a3
{
  objc_storeStrong((id *)&self->__overlayEdgeShadowView, a3);
}

- (_UIDuoShadowView)_primaryOrSupplementaryShadowView
{
  return self->__primaryOrSupplementaryShadowView;
}

- (void)_setLeadingPanelShadowView:(id)a3
{
  objc_storeStrong((id *)&self->__primaryOrSupplementaryShadowView, a3);
}

- (_UIDuoShadowView)_supplementaryParallaxShadowView
{
  return self->__supplementaryParallaxShadowView;
}

- (void)_setSupplementaryParallaxShadowView:(id)a3
{
  objc_storeStrong((id *)&self->__supplementaryParallaxShadowView, a3);
}

- (_UIMTCaptureView)_captureView
{
  return self->__captureView;
}

- (void)_setMaterialThemesCaptureView:(id)a3
{
  objc_storeStrong((id *)&self->__captureView, a3);
}

- (UIDimmingView)_primaryParallaxDimmingView
{
  return self->__primaryParallaxDimmingView;
}

- (void)_setPrimaryParallaxDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->__primaryParallaxDimmingView, a3);
}

- (void)_setSourceTransitionView:(id)a3
{
  objc_storeStrong((id *)&self->__sourceTransitionView, a3);
}

- (UIView)_destTransitionView
{
  return self->__destTransitionView;
}

- (void)_setDestinationTransitionView:(id)a3
{
  objc_storeStrong((id *)&self->__destTransitionView, a3);
}

@end
