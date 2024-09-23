@implementation _UIBarCustomizer

- (_UIBarCustomizer)initWithDelegate:(id)a3
{
  id v4;
  _UIBarCustomizer *v5;
  _UIBarCustomizer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIBarCustomizer;
  v5 = -[_UIBarCustomizer init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    -[_UIBarCustomizer setInitialSourceFrame:](v6, "setInitialSourceFrame:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    -[_UIBarCustomizer set_dropIndex:](v6, "set_dropIndex:", 0x7FFFFFFFFFFFFFFFLL);
  }

  return v6;
}

- (void)beginWithSession:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  _BOOL4 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  _UIBarCustomizationContainerView *v26;
  UIView *v27;
  UIView *v28;
  void *v29;
  UITapGestureRecognizer *v30;
  void *v31;
  _UIBarCustomizationItemReservoirView *v32;
  void *v33;
  _UIBarCustomizationItemReservoirView *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  UIDragInteraction *v39;
  void *v40;
  UIDropInteraction *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  uint64_t v54;
  void *v55;
  _UIBarCustomizationChiclet *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  _QWORD v65[5];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  id location;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v62 = a3;
  objc_msgSend(v62, "_mutableVisibleItems");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "_mutableAdditionalItems");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarCustomizer set_activeSession:](self, "set_activeSession:", v62);
  -[_UIBarCustomizer delegate](self, "delegate");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarCustomizer _activeSession](self, "_activeSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "barCustomizer:containerViewForSession:", self, v3);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v63, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "layoutDirection");

  if (v5 == 1)
  {
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v6 = v59;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v82;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v82 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * i), "setReverseItemsForRTL:", 1);
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
      }
      while (v7);
    }

    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v10 = v61;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v78;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v78 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * j), "setReverseItemsForRTL:", 1);
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
      }
      while (v11);
    }

  }
  -[_UIBarCustomizer containerView](self, "containerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v15)
  {
    objc_msgSend(v60, "barCustomizer:parentTraitEnvironmentForSession:", self, v62);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[_UIBarCustomizationContainerView initWithParentTraitEnvironment:]([_UIBarCustomizationContainerView alloc], "initWithParentTraitEnvironment:", v25);
    objc_msgSend(v63, "bounds");
    -[UIView setFrame:](v26, "setFrame:");
    objc_initWeak(&location, self);
    v74[0] = MEMORY[0x1E0C809B0];
    v74[1] = 3221225472;
    v74[2] = __37___UIBarCustomizer_beginWithSession___block_invoke;
    v74[3] = &unk_1E16C6D40;
    objc_copyWeak(&v75, &location);
    -[_UIBarCustomizationContainerView setTraitChangeHandler:](v26, "setTraitChangeHandler:", v74);
    v27 = [UIView alloc];
    -[UIView bounds](v26, "bounds");
    v28 = -[UIView initWithFrame:](v27, "initWithFrame:");
    -[UIView setAutoresizingMask:](v28, "setAutoresizingMask:", 18);
    +[UIColor _alertControllerDimmingViewColor](UIColor, "_alertControllerDimmingViewColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v28, "setBackgroundColor:", v29);

    -[UIView setAlpha:](v28, "setAlpha:", 0.0);
    v30 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleDimmingViewTap_);
    -[UIView addGestureRecognizer:](v28, "addGestureRecognizer:", v30);

    -[UIView addSubview:](v26, "addSubview:", v28);
    -[_UIBarCustomizer setDimmingView:](self, "setDimmingView:", v28);

    v31 = (void *)objc_opt_new();
    objc_msgSend(v31, "setShowsHorizontalScrollIndicator:", 0);
    -[UIView addSubview:](v26, "addSubview:", v31);
    -[_UIBarCustomizer setVisibleItemScrollView:](self, "setVisibleItemScrollView:", v31);

    v32 = [_UIBarCustomizationItemReservoirView alloc];
    v33 = (void *)objc_msgSend(v61, "mutableCopy");
    v34 = -[_UIBarCustomizationItemReservoirView initWithItems:](v32, "initWithItems:", v33);

    -[UIView setAlpha:](v34, "setAlpha:", 0.0);
    -[_UIBarCustomizationItemReservoirView setExpanded:animated:](v34, "setExpanded:animated:", 0, 0);
    _UILocalizedString(CFSTR("BAR_CUSTOMIZATION_POPOVER_RESET"), (uint64_t)CFSTR("Reset button in bar customization popover."), CFSTR("Reset"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __37___UIBarCustomizer_beginWithSession___block_invoke_2;
    v72[3] = &unk_1E16B58D0;
    objc_copyWeak(&v73, &location);
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v35, 0, 0, v72);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBarCustomizationItemReservoirView setResetAction:](v34, "setResetAction:", v36);

    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __37___UIBarCustomizer_beginWithSession___block_invoke_3;
    v70[3] = &unk_1E16B58D0;
    objc_copyWeak(&v71, &location);
    +[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v70);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBarCustomizationItemReservoirView setDoneAction:](v34, "setDoneAction:", v37);

    -[_UIBarCustomizer dimmingView](self, "dimmingView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView insertSubview:above:](v26, "insertSubview:above:", v34, v38);

    objc_destroyWeak(&v71);
    objc_destroyWeak(&v73);

    -[_UIBarCustomizer setReservoir:](self, "setReservoir:", v34);
    v39 = -[UIDragInteraction initWithDelegate:]([UIDragInteraction alloc], "initWithDelegate:", self);
    -[UIDragInteraction setEnabled:](v39, "setEnabled:", 0);
    -[_UIBarCustomizer setDragInteraction:](self, "setDragInteraction:", v39);

    -[_UIBarCustomizer dragInteraction](self, "dragInteraction");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addInteraction:](v26, "addInteraction:", v40);

    v41 = -[UIDropInteraction initWithDelegate:]([UIDropInteraction alloc], "initWithDelegate:", self);
    -[UIView addInteraction:](v26, "addInteraction:", v41);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 3;
    do
    {
      v44 = (void *)objc_opt_new();
      +[UIColor tintColor](UIColor, "tintColor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setBackgroundColor:", v45);

      -[_UIBarCustomizer visibleItemScrollView](self, "visibleItemScrollView");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addSubview:", v44);

      objc_msgSend(v42, "addObject:", v44);
      --v43;
    }
    while (v43);
    -[_UIBarCustomizer setEllipsisDotViews:](self, "setEllipsisDotViews:", v42);

    -[_UIBarCustomizer setContainerView:](self, "setContainerView:", v26);
    objc_destroyWeak(&v75);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(v63, "bounds");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    -[_UIBarCustomizer containerView](self, "containerView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

    v25 = (void *)objc_msgSend(v61, "mutableCopy");
    -[_UIBarCustomizer reservoir](self, "reservoir");
    v26 = (_UIBarCustomizationContainerView *)objc_claimAutoreleasedReturnValue();
    -[_UIBarCustomizationContainerView setItems:](v26, "setItems:", v25);
  }

  -[_UIBarCustomizer containerView](self, "containerView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addSubview:", v47);

  -[_UIBarCustomizer visibleItemScrollView](self, "visibleItemScrollView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setContentOffset:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarCustomizer set_visibleItems:](self, "set_visibleItems:", v49);

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v50 = v59;
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
  if (v51)
  {
    v52 = *(_QWORD *)v67;
    do
    {
      for (k = 0; k != v51; ++k)
      {
        if (*(_QWORD *)v67 != v52)
          objc_enumerationMutation(v50);
        v54 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * k);
        v55 = (void *)objc_opt_new();
        v56 = -[_UIBarCustomizationChiclet initWithItem:]([_UIBarCustomizationChiclet alloc], "initWithItem:", v54);
        -[_UIBarCustomizationChiclet sizeToFit](v56, "sizeToFit");
        objc_msgSend(v55, "setChiclet:", v56);
        -[_UIBarCustomizer _visibleItems](self, "_visibleItems");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "addObject:", v54);

        -[_UIBarCustomizer visibleItemScrollView](self, "visibleItemScrollView");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "addSubview:", v55);

      }
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
    }
    while (v51);
  }

  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __37___UIBarCustomizer_beginWithSession___block_invoke_4;
  v65[3] = &unk_1E16B1B28;
  v65[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v65);
  -[_UIBarCustomizer _setActive:](self, "_setActive:", 1);

}

- (void)end
{
  -[_UIBarCustomizer _setActive:](self, "_setActive:", 0);
}

- (void)invalidateLayout
{
  id v3;

  if (-[_UIBarCustomizer isActive](self, "isActive"))
  {
    -[_UIBarCustomizer setInitialSourceFrame:](self, "setInitialSourceFrame:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    -[_UIBarCustomizer _reflow](self, "_reflow");
    -[_UIBarCustomizer reservoir](self, "reservoir");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateLayoutAndForceUpdate:", 1);

  }
}

- (void)_handleDimmingViewTap:(id)a3
{
  -[_UIBarCustomizer _setActive:](self, "_setActive:", 0);
}

- (void)_setActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
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
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  _UIBarCustomizer *v31;
  id v32;
  id v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  id location;

  v3 = a3;
  if (-[_UIBarCustomizer isActive](self, "isActive") != a3)
  {
    self->_isActive = v3;
    -[_UIBarCustomizer dragInteraction](self, "dragInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", v3);

    -[_UIBarCustomizer containerView](self, "containerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInteractionEnabled:", v3);

    v7 = MEMORY[0x1E0C809B0];
    if (v3)
    {
      +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "vendKeyboardSuppressionAssertionForReason:", CFSTR("bar customizer"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIBarCustomizer setKeyboardSuppressionAssertion:](self, "setKeyboardSuppressionAssertion:", v9);

      -[_UIBarCustomizer _activeSession](self, "_activeSession");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "beginAnimationCoordinator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[_UIBarCustomizer setKeyboardSuppressionAssertion:](self, "setKeyboardSuppressionAssertion:", 0);
      -[_UIBarCustomizer _activeSession](self, "_activeSession");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "endAnimationCoordinator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIBarCustomizer dragInteraction](self, "dragInteraction");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_cancelDrag");

      -[_UIBarCustomizer set_activeSession:](self, "set_activeSession:", 0);
      -[_UIBarCustomizer _visibleItems](self, "_visibleItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "set_mutableVisibleItems:", v13);

      -[_UIBarCustomizer reservoir](self, "reservoir");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "items");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "set_mutableAdditionalItems:", v15);

      -[_UIBarCustomizer delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "barCustomizer:willEndSession:didReset:", self, v10, -[_UIBarCustomizer wasReset](self, "wasReset"));

      objc_initWeak(&location, self);
      v35[0] = v7;
      v35[1] = 3221225472;
      v35[2] = __31___UIBarCustomizer__setActive___block_invoke;
      v35[3] = &unk_1E16C6D68;
      objc_copyWeak(&v36, &location);
      objc_msgSend(v11, "addCompletion:", v35);
      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);
    }
    +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 0.875, 0.56);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v7;
    v28 = 3221225472;
    v29 = __31___UIBarCustomizer__setActive___block_invoke_2;
    v30 = &unk_1E16B4030;
    v31 = self;
    LOBYTE(v34) = v3;
    v32 = v10;
    v33 = v11;
    v21 = v7;
    v22 = 3221225472;
    v23 = __31___UIBarCustomizer__setActive___block_invoke_3;
    v24 = &unk_1E16B25B0;
    v25 = v33;
    v26 = v32;
    v18 = v32;
    v19 = v33;
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v17, 0, &v27, &v21);

    if (!v3)
      -[_UIBarCustomizer setInitialSourceFrame:](self, "setInitialSourceFrame:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33,
        v34);
    -[_UIBarCustomizer reservoir](self, "reservoir", v21, v22, v23, v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setExpanded:animated:", v3, 1);

  }
}

- (void)_reflow
{
  void *v2;
  double v3;
  double x;
  double v5;
  double y;
  double v7;
  double width;
  double v9;
  double height;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  int v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  id v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
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
  id v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t j;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double MinX;
  int v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  const __CFArray *SeparateComponents;
  CFIndex Count;
  CFIndex v83;
  double *v84;
  const CGPath *ValueAtIndex;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  unint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  int v98;
  int v99;
  double v100;
  void *v101;
  id v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  const __CFArray *v109;
  CFIndex v110;
  CGFloat v111;
  CFIndex v112;
  const CGPath *v113;
  CGFloat v114;
  CGFloat v115;
  CGFloat v116;
  CGFloat v117;
  double v118;
  void *v119;
  BOOL v120;
  unint64_t v121;
  void *v122;
  void *v123;
  uint64_t v124;
  double v125;
  double v126;
  id v127;
  void *v128;
  unint64_t v129;
  double v130;
  double v131;
  double v132;
  double v133;
  int v134;
  id v135;
  int64_t v136;
  void *v137;
  void *v139;
  _QWORD v140[4];
  id v141;
  CGFloat v142;
  double v143;
  double v144;
  _QWORD v145[4];
  id v146;
  double v147;
  double v148;
  CGAffineTransform v149;
  CGAffineTransform v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  _QWORD v155[4];
  id v156;
  double v157;
  _QWORD v158[4];
  id v159;
  _QWORD v160[7];
  BOOL v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  _QWORD v166[4];
  id v167;
  _UIBarCustomizer *v168;
  _BYTE v169[128];
  _BYTE v170[128];
  double v171;
  double *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect PathBoundingBox;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;
  CGRect v192;

  v175 = *MEMORY[0x1E0C80C00];
  -[_UIBarCustomizer containerView](self, "containerView");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarCustomizer visibleItemScrollView](self, "visibleItemScrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarCustomizer initialSourceFrame](self, "initialSourceFrame");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  -[_UIBarCustomizer _visibleItems](self, "_visibleItems");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v176.origin.x = x;
  v176.origin.y = y;
  v176.size.width = width;
  v176.size.height = height;
  if (CGRectIsNull(v176))
  {
    v166[0] = MEMORY[0x1E0C809B0];
    v166[1] = 3221225472;
    v166[2] = __27___UIBarCustomizer__reflow__block_invoke;
    v166[3] = &unk_1E16B1B50;
    v11 = v2;
    v167 = v11;
    v168 = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v166);
    v164 = 0u;
    v165 = 0u;
    v162 = 0u;
    v163 = 0u;
    -[_UIBarCustomizer _activeSession](self, "_activeSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sourceItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v162, v170, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v163;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v163 != v15)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v162 + 1) + 8 * i), "_sourceFrameInContainer:", v11);
          v192.origin.x = v17;
          v192.origin.y = v18;
          v192.size.width = v19;
          v192.size.height = v20;
          v177.origin.x = x;
          v177.origin.y = y;
          v177.size.width = width;
          v177.size.height = height;
          v178 = CGRectUnion(v177, v192);
          x = v178.origin.x;
          y = v178.origin.y;
          width = v178.size.width;
          height = v178.size.height;
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v162, v170, 16);
      }
      while (v14);
    }

    v179.origin.x = x;
    v179.origin.y = y;
    v179.size.width = width;
    v179.size.height = height;
    if (CGRectIsNull(v179))
    {
      objc_msgSend(v139, "bounds");
      x = CGRectGetMidX(v180);
      width = 0.0;
      height = 100.0;
      y = 0.0;
    }
    -[_UIBarCustomizer setInitialSourceFrame:](self, "setInitialSourceFrame:", x, y, width, height);

  }
  if (-[_UIBarCustomizer isActive](self, "isActive"))
  {
    v171 = 0.0;
    v172 = &v171;
    v173 = 0x2020000000;
    v174 = 0;
    objc_msgSend(v139, "traitCollection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "layoutDirection");

    v160[0] = MEMORY[0x1E0C809B0];
    v160[1] = 3221225472;
    v160[2] = __27___UIBarCustomizer__reflow__block_invoke_2;
    v160[3] = &unk_1E16C6D90;
    if (v22 == 1)
      v23 = 2;
    else
      v23 = 0;
    v161 = v22 == 1;
    v160[4] = self;
    v160[5] = &v171;
    *(double *)&v160[6] = y + height * 0.5;
    objc_msgSend(v137, "enumerateObjectsWithOptions:usingBlock:", v23, v160);
    v24 = v172[3];
    objc_msgSend(v2, "frame");
    v25 = CGRectGetWidth(v181);
    v26 = -[_UIBarCustomizer _dropIndex](self, "_dropIndex");
    v27 = objc_msgSend(v137, "count");
    v28 = 0;
    v29 = 0;
    v30 = -40.0;
    if (v22 == 1)
      v30 = 40.0;
    if (v26 != v27)
      v30 = -0.0;
    v31 = (v25 - v24) * 0.5 + v30;
    while (objc_msgSend(v137, "count") > v28)
    {
      objc_msgSend(v137, "objectAtIndexedSubscript:", v28);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "_chiclet");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "anchorView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "chiclet");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v33) = objc_msgSend(v35, "minimized");

      if ((_DWORD)v33)
      {
        v36 = (double)(int)fmin((double)(v29 / -[_UIBarCustomizer _overflowItemBucketSize](self, "_overflowItemBucketSize")), 2.0)* 0.166666667+ 0.5;
        +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v158[0] = MEMORY[0x1E0C809B0];
        v158[1] = 3221225472;
        v158[2] = __27___UIBarCustomizer__reflow__block_invoke_3;
        v158[3] = &unk_1E16B1B28;
        v38 = v34;
        v159 = v38;
        +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v37, 0, v158, 0);

        if (v31 > 0.0)
        {
          +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 0.82, v36);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v155[0] = MEMORY[0x1E0C809B0];
          v155[1] = 3221225472;
          v155[2] = __27___UIBarCustomizer__reflow__block_invoke_4;
          v155[3] = &unk_1E16B1888;
          v156 = v38;
          v157 = v31;
          +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v39, 0, v155, 0);

        }
        ++v29;
      }
      else if (v31 > 0.0)
      {
        objc_msgSend(v34, "center");
        v41 = v40;
        objc_msgSend(v34, "center");
        objc_msgSend(v34, "setCenter:", v31 + v41);
      }

      ++v28;
    }
    objc_msgSend(v2, "frame");
    objc_msgSend(v2, "setContentSize:", v24, CGRectGetHeight(v188));
    _Block_object_dispose(&v171, 8);
  }
  else
  {
    objc_msgSend(v2, "setContentOffset:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    -[_UIBarCustomizer delegate](self, "delegate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBarCustomizer _activeSession](self, "_activeSession");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "barCustomizer:overflowControlBoundsForSession:", self, v43);
    v45 = v44;
    v47 = v46;
    v49 = v48;
    v51 = v50;

    objc_msgSend(v139, "convertRect:toView:", v2, v45, v47, v49, v51);
    v132 = v52;
    v133 = v53;
    v130 = v54;
    v131 = v55;
    v153 = 0u;
    v154 = 0u;
    v151 = 0u;
    v152 = 0u;
    v56 = v137;
    v57 = 0;
    v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v151, v169, 16);
    if (v58)
    {
      v59 = *(_QWORD *)v152;
      do
      {
        for (j = 0; j != v58; ++j)
        {
          if (*(_QWORD *)v152 != v59)
            objc_enumerationMutation(v56);
          objc_msgSend(*(id *)(*((_QWORD *)&v151 + 1) + 8 * j), "_chiclet");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "anchorView");
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v62, "chiclet");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "representedItem");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "_sourceFrameInContainer:", v139);
          v66 = v65;
          v68 = v67;
          v45 = v69;
          v71 = v70;

          v182.origin.x = v66;
          v182.origin.y = v68;
          v182.size.width = v45;
          v182.size.height = v71;
          if (CGRectIsEmpty(v182))
          {
            if (-[_UIBarCustomizer wasReset](self, "wasReset"))
            {
              objc_msgSend(v62, "setAlpha:", 0.0);
              CGAffineTransformMakeScale(&v150, 0.1, 0.1);
              v149 = v150;
              objc_msgSend(v62, "setTransform:", &v149);
            }
            else
            {
              ++v57;
            }
          }
          else
          {
            objc_msgSend(v2, "frame");
            MinX = CGRectGetMinX(v183);
            objc_msgSend(v2, "frame");
            objc_msgSend(v62, "setCenter:", v45 * 0.5 + v66 - MinX, v71 * 0.5 + v68 - CGRectGetMinY(v184));
            objc_msgSend(v62, "frame");
            CGRectGetMaxX(v185);
          }

        }
        v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v151, v169, 16);
      }
      while (v58);
    }

    v136 = v57;
    -[_UIBarCustomizer setOverflowItemCount:](self, "setOverflowItemCount:");
    v73 = objc_msgSend(v56, "count");
    v134 = -[_UIBarCustomizer _overflowItemBucketSize](self, "_overflowItemBucketSize");
    -[_UIBarCustomizer containerView](self, "containerView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "traitCollection");
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    v135 = v75;
    +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "configurationWithTraitCollection:", v135);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("ellipsis.circle"), v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "_outlinePath");
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    v80 = objc_retainAutorelease(v79);
    SeparateComponents = CGPathCreateSeparateComponents((CGPathRef)objc_msgSend(v80, "CGPath"), 0);
    Count = CFArrayGetCount(SeparateComponents);
    if (Count >= 1)
    {
      v83 = 0;
      v84 = (double *)&v172;
      do
      {
        ValueAtIndex = (const CGPath *)CFArrayGetValueAtIndex(SeparateComponents, v83);
        PathBoundingBox = CGPathGetPathBoundingBox(ValueAtIndex);
        v86 = PathBoundingBox.origin.x;
        v87 = PathBoundingBox.origin.y;
        v88 = PathBoundingBox.size.width;
        v89 = PathBoundingBox.size.height;
        v90 = CGRectGetWidth(PathBoundingBox);
        objc_msgSend(v80, "bounds");
        if (v90 < CGRectGetWidth(v187) * 0.5)
        {
          *(v84 - 1) = v86 + v88 * 0.5;
          *v84 = v87 + v89 * 0.5;
        }
        ++v83;
        v84 += 2;
      }
      while (Count != v83);
      v45 = *(double *)&v173 - v171;
    }

    v91 = fabs(v45);
    v92 = v73 - v57;
    if (objc_msgSend(v56, "count") > v92)
    {
      v93 = 0;
      do
      {
        objc_msgSend(v56, "objectAtIndexedSubscript:", v92 + v93);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "_chiclet");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "anchorView");
        v96 = (void *)objc_claimAutoreleasedReturnValue();

        v97 = objc_msgSend(v135, "layoutDirection");
        v98 = (int)fmin((double)((int)v93 / v134), 2.0);
        v99 = v98 - 1;
        if (v97)
          v100 = -(v91 * (double)v99);
        else
          v100 = v91 * (double)v99;
        +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 0.88, (double)v98 * -0.186666667 + 0.56);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v145[0] = MEMORY[0x1E0C809B0];
        v145[1] = 3221225472;
        v145[2] = __27___UIBarCustomizer__reflow__block_invoke_5;
        v145[3] = &unk_1E16B4E70;
        v146 = v96;
        v147 = v132 + v130 * 0.5 + v100;
        v148 = v133 + v131 * 0.5;
        v102 = v96;
        +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v101, 0, v145, 0);

        ++v93;
      }
      while (objc_msgSend(v56, "count") > v92 + v93);
    }
    v103 = v135;
    +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleBody"), 3);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "configurationWithTraitCollection:", v103);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("ellipsis.circle"), v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "_outlinePath");
    v107 = (void *)objc_claimAutoreleasedReturnValue();

    v108 = objc_retainAutorelease(v107);
    v109 = CGPathCreateSeparateComponents((CGPathRef)objc_msgSend(v108, "CGPath"), 0);
    v110 = CFArrayGetCount(v109);
    v111 = 0.0;
    if (v110 >= 1)
    {
      v112 = 0;
      while (1)
      {
        v113 = (const CGPath *)CFArrayGetValueAtIndex(v109, v112);
        v189 = CGPathGetPathBoundingBox(v113);
        v114 = v189.origin.x;
        v115 = v189.origin.y;
        v116 = v189.size.width;
        v117 = v189.size.height;
        v118 = CGRectGetWidth(v189);
        objc_msgSend(v108, "bounds");
        if (v118 < CGRectGetWidth(v190) * 0.5)
          break;
        if (v110 == ++v112)
          goto LABEL_60;
      }
      v191.origin.x = v114;
      v191.origin.y = v115;
      v191.size.width = v116;
      v191.size.height = v117;
      v111 = CGRectGetWidth(v191);
    }
LABEL_60:

    -[_UIBarCustomizer ellipsisDotViews](self, "ellipsisDotViews");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = objc_msgSend(v119, "count") == 0;

    if (!v120)
    {
      v121 = 0;
      do
      {
        -[_UIBarCustomizer ellipsisDotViews](self, "ellipsisDotViews");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "objectAtIndexedSubscript:", v121);
        v123 = (void *)objc_claimAutoreleasedReturnValue();

        v124 = objc_msgSend(v103, "layoutDirection");
        v125 = -(v91 * (double)((int)v121 - 1));
        if (!v124)
          v125 = v91 * (double)((int)v121 - 1);
        v140[0] = MEMORY[0x1E0C809B0];
        v126 = v132 + v130 * 0.5 + v125;
        v140[1] = 3221225472;
        v140[2] = __27___UIBarCustomizer__reflow__block_invoke_6;
        v140[3] = &unk_1E16B1E18;
        v127 = v123;
        v141 = v127;
        v142 = v111;
        v143 = v126;
        v144 = v133 + v131 * 0.5;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v140);
        if ((uint64_t)v121 >= v136)
          objc_msgSend(v127, "setAlpha:", 1.0);

        -[_UIBarCustomizer ellipsisDotViews](self, "ellipsisDotViews");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        v129 = objc_msgSend(v128, "count");

        ++v121;
      }
      while (v129 > v121);
    }

  }
}

- (void)_reflowAnimatedWithAlongsideActions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56___UIBarCustomizer__reflowAnimatedWithAlongsideActions___block_invoke;
  v7[3] = &unk_1E16B1D18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v5, 0, v7, 0);

}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;

  v5 = a4;
  -[_UIBarCustomizer containerView](self, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  -[_UIBarCustomizer _dragItemsAtLocation:](self, "_dragItemsAtLocation:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)dragInteraction:(id)a3 sessionIsRestrictedToDraggingApplication:(id)a4
{
  return 1;
}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  return 1;
}

- (id)_dragItemsAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  id v7;
  UIDragItem *v8;
  void *v9;
  _QWORD v11[2];

  y = a3.y;
  x = a3.x;
  v11[1] = *MEMORY[0x1E0C80C00];
  -[_UIBarCustomizer containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hitTest:withEvent:", 0, x, y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
    v8 = -[UIDragItem initWithItemProvider:]([UIDragItem alloc], "initWithItemProvider:", v7);
    -[UIDragItem setLocalObject:](v8, "setLocalObject:", v6);
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a4, "items", a3);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "_chiclet");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "anchorView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "setState:", 1);
        +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v7;
        v14[1] = 3221225472;
        v14[2] = __53___UIBarCustomizer_dragInteraction_sessionWillBegin___block_invoke;
        v14[3] = &unk_1E16B1B28;
        v14[4] = v9;
        +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v12, 0, v14, 0);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
  if (!a5)
    -[_UIBarCustomizer set_dropIndex:](self, "set_dropIndex:", 0x7FFFFFFFFFFFFFFFLL, a4);
}

- (void)dragInteraction:(id)a3 session:(id)a4 willAddItems:(id)a5 forInteraction:(id)a6
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "_chiclet");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "anchorView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "setState:", 1);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UITargetedDragPreview *v10;
  void *v11;
  UITargetedDragPreview *v12;

  v5 = a4;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "_setPreviewMode:", 3);
  objc_msgSend(v6, "setHidesSourceViewDuringDropAnimation:", 1);
  objc_msgSend(v5, "_chiclet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_chiclet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bringSubviewToFront:", v9);

  v10 = [UITargetedDragPreview alloc];
  objc_msgSend(v5, "_chiclet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[UITargetedPreview initWithView:parameters:](v10, "initWithView:parameters:", v11, v6);
  return v12;
}

- (double)_dragInteraction:(id)a3 delayForLiftBeginningAtLocation:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v23;
  CGRect v24;

  y = a4.y;
  x = a4.x;
  objc_msgSend(a3, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarCustomizer containerView](self, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertPoint:toView:", v8, x, y);
  v10 = v9;
  v12 = v11;

  -[_UIBarCustomizer containerView](self, "containerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hitTest:withEvent:", 0, v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "_containingScrollView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v17 = 0.0;
  if (v15)
  {
    objc_msgSend(v15, "contentSize");
    v19 = v18;
    objc_msgSend(v16, "frame");
    if (v19 > CGRectGetWidth(v23)
      || (objc_msgSend(v16, "contentSize"), v21 = v20, objc_msgSend(v16, "frame"), v21 > CGRectGetHeight(v24)))
    {
      v17 = 0.15;
    }
  }

  return v17;
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  UIDragPreviewTarget *v12;
  void *v13;
  UIDragPreviewTarget *v14;
  void *v15;

  v7 = a5;
  objc_msgSend(a4, "_chiclet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIBarCustomizer isActive](self, "isActive")
    || (-[_UIBarCustomizer _visibleItems](self, "_visibleItems"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "representedItem"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v9, "containsObject:", v10),
        v10,
        v9,
        v11))
  {
    v12 = [UIDragPreviewTarget alloc];
    objc_msgSend(v8, "superview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "center");
    v14 = -[UIPreviewTarget initWithContainer:center:](v12, "initWithContainer:center:", v13);

    objc_msgSend(v7, "retargetedPreviewWithTarget:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  -[_UIBarCustomizer _animateDropOrCancelForItem:animator:isCancel:](self, "_animateDropOrCancelForItem:animator:isCancel:", a4, a5, 1);
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t i;
  void *v10;
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
  objc_msgSend(a4, "items", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    v8 = 1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "localObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v8 &= objc_opt_isKindOfClass();

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8 & 1;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  uint64_t v27;
  double MidX;
  UIDropProposal *v29;
  _UIBarCustomizer *v31;
  void *v32;
  id v33;
  _QWORD v34[5];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;
  CGPoint v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[_UIBarCustomizer _visibleItems](self, "_visibleItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarCustomizer containerView](self, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v7);
  v9 = v8;
  v11 = v10;
  -[_UIBarCustomizer setLastDragLocation:](self, "setLastDragLocation:");
  objc_msgSend(v7, "bounds");
  v43.size.width = CGRectGetWidth(v42);
  v43.size.height = 150.0;
  v43.origin.x = 0.0;
  v43.origin.y = 0.0;
  v41.x = v9;
  v41.y = v11;
  if (CGRectContainsPoint(v43, v41))
  {
    v33 = v5;
    v31 = self;
    -[_UIBarCustomizer visibleItemScrollView](self, "visibleItemScrollView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "convertPoint:toView:", v12, v9, v11);
    v14 = v13;

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v32 = v6;
    v15 = v6;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v36;
      while (2)
      {
        v20 = 0;
        v21 = v17 + v18;
        do
        {
          if (*(_QWORD *)v36 != v19)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v20), "_chiclet");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "anchorView");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v23, "state") != 1)
          {
            objc_msgSend(v23, "chiclet");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "fixed");

            if ((v25 & 1) == 0)
            {
              objc_msgSend(v7, "traitCollection");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "layoutDirection");

              objc_msgSend(v23, "frame");
              MidX = CGRectGetMidX(v44);
              if (v27)
              {
                if (v14 >= MidX)
                  goto LABEL_17;
              }
              else if (v14 <= MidX)
              {
LABEL_17:

                v21 = v18 + v20;
                goto LABEL_19;
              }
            }
          }

          ++v20;
        }
        while (v17 != v20);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        v18 = v21;
        if (v17)
          continue;
        break;
      }
    }
    else
    {
      v21 = 0;
    }
LABEL_19:

    v6 = v32;
    v5 = v33;
    self = v31;
  }
  else
  {
    v21 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[_UIBarCustomizer set_dropIndex:](self, "set_dropIndex:", v21);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __53___UIBarCustomizer_dropInteraction_sessionDidUpdate___block_invoke;
  v34[3] = &unk_1E16B1B28;
  v34[4] = self;
  -[_UIBarCustomizer _reflowAnimatedWithAlongsideActions:](self, "_reflowAnimatedWithAlongsideActions:", v34);
  v29 = -[UIDropProposal initWithDropOperation:]([UIDropProposal alloc], "initWithDropOperation:", 3);

  return v29;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  unint64_t v34;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  unint64_t v42;
  void *v43;
  void *v44;
  id obj;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;
  CGRect v55;
  CGRect v56;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v47 = -[_UIBarCustomizer _dropIndex](self, "_dropIndex");
  -[_UIBarCustomizer set_dropIndex:](self, "set_dropIndex:", 0x7FFFFFFFFFFFFFFFLL);
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v44 = v5;
  objc_msgSend(v5, "items");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v48)
  {
    v46 = *(_QWORD *)v50;
    v6 = v47;
    do
    {
      for (i = 0; i != v48; ++i)
      {
        if (*(_QWORD *)v50 != v46)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v8, "_chiclet");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "representedItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v47 == 0x7FFFFFFFFFFFFFFFLL && (objc_msgSend(v10, "removable") & 1) != 0)
        {
          -[_UIBarCustomizer _visibleItems](self, "_visibleItems");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "containsObject:", v11);

          if (v13)
          {
            -[_UIBarCustomizer reservoir](self, "reservoir");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addItem:", v11);

            -[_UIBarCustomizer _visibleItems](self, "_visibleItems");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "removeObject:", v11);

            objc_msgSend(v9, "anchorView");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "removeFromSuperview");

            objc_msgSend(v9, "setAnchorView:", 0);
          }
        }
        else
        {
          objc_msgSend(v8, "_chiclet");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "anchorView");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            v18 = (void *)objc_opt_new();
            -[_UIBarCustomizer visibleItemScrollView](self, "visibleItemScrollView");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addSubview:", v18);

            objc_msgSend(v8, "_chiclet");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setChiclet:", v20);

            objc_msgSend(v18, "layoutIfNeeded");
            -[_UIBarCustomizer _visibleItems](self, "_visibleItems");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "count");

            if (v22)
            {
              -[_UIBarCustomizer _visibleItems](self, "_visibleItems");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = v23;
              if (v6 == v22)
              {
                objc_msgSend(v23, "objectAtIndexedSubscript:", v6 - 1);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "_chiclet");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "anchorView");
                v27 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v27, "frame");
                v28 = CGRectGetMaxX(v55) + 20.0;
              }
              else
              {
                objc_msgSend(v23, "objectAtIndexedSubscript:", v6);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "_chiclet");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "anchorView");
                v27 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v27, "frame");
                v28 = CGRectGetMinX(v56) + -20.0;
              }
              objc_msgSend(v27, "center");
              v32 = v31;

              objc_msgSend(v18, "setCenter:", v28, v32);
            }
          }
          -[_UIBarCustomizer _visibleItems](self, "_visibleItems");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "indexOfObject:", v11);

          v36 = v34 != 0x7FFFFFFFFFFFFFFFLL && v6 > v34;
          v6 -= v36;
          -[_UIBarCustomizer _visibleItems](self, "_visibleItems");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "removeObject:", v11);

          -[_UIBarCustomizer reservoir](self, "reservoir");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "removeItem:", v11);

          -[_UIBarCustomizer _visibleItems](self, "_visibleItems");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIBarCustomizer _visibleItems](self, "_visibleItems");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "count");

          if (v6 >= v41)
            v42 = v41;
          else
            v42 = v6;
          objc_msgSend(v39, "insertObject:atIndex:", v11, v42);

          objc_msgSend(v18, "superview");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "bringSubviewToFront:", v18);

        }
      }
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v48);
  }

}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v6;
  id v7;
  UIDragPreviewTarget *v8;
  void *v9;
  void *v10;
  void *v11;
  UIDragPreviewTarget *v12;
  void *v13;

  v6 = a5;
  v7 = a4;
  v8 = [UIDragPreviewTarget alloc];
  objc_msgSend(v7, "_chiclet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_chiclet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "center");
  v12 = -[UIPreviewTarget initWithContainer:center:](v8, "initWithContainer:center:", v10);

  objc_msgSend(v6, "retargetedPreviewWithTarget:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  -[_UIBarCustomizer _animateDropOrCancelForItem:animator:isCancel:](self, "_animateDropOrCancelForItem:animator:isCancel:", a4, a5, 0);
}

- (void)_animateDropOrCancelForItem:(id)a3 animator:(id)a4 isCancel:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  BOOL v38;
  id location;
  _QWORD v40[4];
  id v41;
  id v42;
  char v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v34 = v8;
  objc_msgSend(v8, "_chiclet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "anchorView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setState:", 0);
  v12 = 0;
  if (!a5)
  {
    v13 = (void *)objc_opt_new();
    -[_UIBarCustomizer lastDragLocation](self, "lastDragLocation");
    v15 = v14;
    v17 = v16;
    objc_msgSend(v10, "superview");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "center");
    v20 = v19;
    v22 = v21;
    -[_UIBarCustomizer containerView](self, "containerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "convertPoint:toView:", v23, v20, v22);
    objc_msgSend(v13, "setValue:", sqrt((v24 - v15) * (v24 - v15) + (v25 - v17) * (v25 - v17)));

    v47[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __66___UIBarCustomizer__animateDropOrCancelForItem_animator_isCancel___block_invoke;
    v44[3] = &unk_1E16B1B50;
    v45 = v11;
    v12 = v13;
    v46 = v12;
    +[UIView _createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:](UIView, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v26, v44);

  }
  objc_msgSend(v10, "representedItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarCustomizer _visibleItems](self, "_visibleItems");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "containsObject:", v27);

  +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __66___UIBarCustomizer__animateDropOrCancelForItem_animator_isCancel___block_invoke_2;
  v40[3] = &unk_1E16B4008;
  v31 = v27;
  v41 = v31;
  v43 = v29;
  v32 = v10;
  v42 = v32;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v30, 0, v40, 0);

  objc_initWeak(&location, self);
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __66___UIBarCustomizer__animateDropOrCancelForItem_animator_isCancel___block_invoke_3;
  v35[3] = &unk_1E16C2F48;
  objc_copyWeak(&v37, &location);
  v38 = a5;
  v33 = v12;
  v36 = v33;
  objc_msgSend(v9, "addAnimations:", v35);

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);

}

- (int)_overflowItemBucketSize
{
  int v2;

  v2 = (int)((double)-[_UIBarCustomizer overflowItemCount](self, "overflowItemCount") / 3.0);
  if (v2 <= 1)
    return 1;
  else
    return v2;
}

- (void)_updateDebugUI
{
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  double v11;
  id v12;
  void (**v13)(_QWORD);
  double v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  _UIBarCustomizer *v19;
  id v20;
  uint64_t v21;
  _QWORD block[5];

  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v3 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    v4 = _UIInternalPreference_BarCustomizationDebugEnabled;
    if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_BarCustomizationDebugEnabled)
    {
      while (v3 >= v4)
      {
        _UIInternalPreferenceSync(v3, &_UIInternalPreference_BarCustomizationDebugEnabled, (uint64_t)CFSTR("BarCustomizationDebugEnabled"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        v4 = _UIInternalPreference_BarCustomizationDebugEnabled;
        if (v3 == _UIInternalPreference_BarCustomizationDebugEnabled)
          return;
      }
      if (byte_1EDDA7DE4)
      {
        v5 = MEMORY[0x1E0C809B0];
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __34___UIBarCustomizer__updateDebugUI__block_invoke;
        block[3] = &unk_1E16B1B28;
        block[4] = self;
        if (_MergedGlobals_1045 != -1)
          dispatch_once(&_MergedGlobals_1045, block);
        if (!qword_1ECD7DBE8)
        {
          v6 = objc_opt_new();
          v7 = (void *)qword_1ECD7DBE8;
          qword_1ECD7DBE8 = v6;

          +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 0.0, 0.0, 0.2);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)qword_1ECD7DBE8, "setBackgroundColor:", v8);

          -[_UIBarCustomizer visibleItemScrollView](self, "visibleItemScrollView");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addSubview:", qword_1ECD7DBE8);

        }
        v10 = -[_UIBarCustomizer _dropIndex](self, "_dropIndex");
        v11 = 0.0;
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[_UIBarCustomizer _visibleItems](self, "_visibleItems");
          v15 = v5;
          v16 = 3221225472;
          v17 = __34___UIBarCustomizer__updateDebugUI__block_invoke_2;
          v18 = &unk_1E16B1C28;
          v19 = self;
          v12 = (id)objc_claimAutoreleasedReturnValue();
          v20 = v12;
          v21 = 0x4044000000000000;
          v13 = (void (**)(_QWORD))_Block_copy(&v15);
          objc_msgSend((id)qword_1ECD7DBE8, "frame", v15, v16, v17, v18, v19);
          if (fabs(v14) >= 2.22044605e-16)
            v13[2](v13);
          else
            +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v13);

          v11 = 40.0;
        }
        objc_msgSend((id)qword_1ECD7DBE8, "setBounds:", 0.0, 0.0, v11, 100.0);
      }
    }
  }
}

- (_UIBarCustomizerDelegate)delegate
{
  return (_UIBarCustomizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (NSMutableArray)_visibleItems
{
  return self->__visibleItems;
}

- (void)set_visibleItems:(id)a3
{
  objc_storeStrong((id *)&self->__visibleItems, a3);
}

- (_UIBarCustomizationSession)_activeSession
{
  return self->__activeSession;
}

- (void)set_activeSession:(id)a3
{
  objc_storeStrong((id *)&self->__activeSession, a3);
}

- (id)keyboardSuppressionAssertion
{
  return self->_keyboardSuppressionAssertion;
}

- (void)setKeyboardSuppressionAssertion:(id)a3
{
  objc_storeStrong(&self->_keyboardSuppressionAssertion, a3);
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (void)setDragInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_dragInteraction, a3);
}

- (_UIBarCustomizationContainerView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingView, a3);
}

- (UIScrollView)visibleItemScrollView
{
  return self->_visibleItemScrollView;
}

- (void)setVisibleItemScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_visibleItemScrollView, a3);
}

- (_UIBarCustomizationItemReservoirView)reservoir
{
  return self->_reservoir;
}

- (void)setReservoir:(id)a3
{
  objc_storeStrong((id *)&self->_reservoir, a3);
}

- (unint64_t)_dropIndex
{
  return self->__dropIndex;
}

- (void)set_dropIndex:(unint64_t)a3
{
  self->__dropIndex = a3;
}

- (CGRect)initialSourceFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_initialSourceFrame.origin.x;
  y = self->_initialSourceFrame.origin.y;
  width = self->_initialSourceFrame.size.width;
  height = self->_initialSourceFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInitialSourceFrame:(CGRect)a3
{
  self->_initialSourceFrame = a3;
}

- (CGPoint)lastDragLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastDragLocation.x;
  y = self->_lastDragLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastDragLocation:(CGPoint)a3
{
  self->_lastDragLocation = a3;
}

- (BOOL)wasReset
{
  return self->_wasReset;
}

- (void)setWasReset:(BOOL)a3
{
  self->_wasReset = a3;
}

- (NSMutableArray)ellipsisDotViews
{
  return self->_ellipsisDotViews;
}

- (void)setEllipsisDotViews:(id)a3
{
  objc_storeStrong((id *)&self->_ellipsisDotViews, a3);
}

- (unint64_t)overflowItemCount
{
  return self->_overflowItemCount;
}

- (void)setOverflowItemCount:(unint64_t)a3
{
  self->_overflowItemCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ellipsisDotViews, 0);
  objc_storeStrong((id *)&self->_reservoir, 0);
  objc_storeStrong((id *)&self->_visibleItemScrollView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong(&self->_keyboardSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->__activeSession, 0);
  objc_storeStrong((id *)&self->__visibleItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
