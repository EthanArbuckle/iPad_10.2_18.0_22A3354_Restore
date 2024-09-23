@implementation _UIContextMenuPresentationAnimation

- (_UIContextMenuPresentationAnimation)initWithUIController:(id)a3 asDismissal:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _UIContextMenuPresentationAnimation *v7;
  _UIContextMenuPresentationAnimation *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  id v19;
  id location;
  objc_super v21;

  v4 = a4;
  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_UIContextMenuPresentationAnimation;
  v7 = -[_UIContextMenuPresentationAnimation init](&v21, sel_init);
  v8 = v7;
  if (v7)
  {
    -[_UIContextMenuPresentationAnimation setUiController:](v7, "setUiController:", v6);
    -[_UIContextMenuPresentationAnimation setIsDismissTransition:](v8, "setIsDismissTransition:", v4);
    -[_UIContextMenuPresentationAnimation uiController](v8, "uiController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "flocker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPresentationAnimation setIsSingleItemMenu:](v8, "setIsSingleItemMenu:", v10 == 0);

    if (v4)
    {
      objc_initWeak(&location, v8);
      v18 = MEMORY[0x1E0C809B0];
      objc_copyWeak(&v19, &location);
      -[_UIContextMenuPresentationAnimation uiController](v8, "uiController", v18, 3221225472, __72___UIContextMenuPresentationAnimation_initWithUIController_asDismissal___block_invoke, &unk_1E16D9A78);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "flocker");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setUnflockPreviewProvider:", &v18);

      v13 = (void *)objc_opt_new();
      -[_UIContextMenuPresentationAnimation setGroupCompletion:](v8, "setGroupCompletion:", v13);

      -[_UIContextMenuPresentationAnimation groupCompletion](v8, "groupCompletion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContextMenuPresentationAnimation uiController](v8, "uiController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "flocker");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setGroupCompletion:", v14);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }

  return v8;
}

- (void)prepareTransitionToView:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  UITargetedPreview *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  double *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  UITargetedPreview *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  BOOL v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _OWORD v82[2];
  uint64_t v83;
  _OWORD v84[8];
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;

  v4 = a3;
  v5 = -[_UIContextMenuPresentationAnimation isDismissTransition](self, "isDismissTransition");
  -[_UIContextMenuPresentationAnimation _containerView](self, "_containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuPresentationAnimation _platterTransitionView](self, "_platterTransitionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuPresentationAnimation _platterView](self, "_platterView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuPresentationAnimation _menuView](self, "_menuView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_UIContextMenuPresentationAnimation uiController](self, "uiController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuPresentationAnimation setExpandedLayout:](self, "setExpandedLayout:", v11);

    objc_msgSend(v8, "freezeExpandedPreview");
  }
  else
  {
    -[_UIContextMenuPresentationAnimation _backgroundView](self, "_backgroundView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAutoresizingMask:", 18);
    objc_msgSend(v6, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[_UIContextMenuPresentationAnimation uiController](self, "uiController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "menuStyle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "preferredBackgroundInsets");
    objc_msgSend(v12, "setFrame:", v14 + v26, v16 + v23, v18 - (v26 + v24), v20 - (v23 + v25));

    _UIClickPresentationBackgroundColor(0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v27);

    objc_msgSend(v6, "addSubview:", v12);
    objc_msgSend(v6, "bounds");
    objc_msgSend(v7, "setFrame:");
    objc_msgSend(v7, "setAutoresizingMask:", 18);
    objc_msgSend(v6, "addSubview:", v7);
    objc_msgSend(v7, "addSubview:", v8);
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    -[_UIContextMenuPresentationAnimation sourcePreview](self, "sourcePreview");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    _itemLayoutFromPreview((uint64_t)&v93, v28, v7, 1);

    -[_UIContextMenuPresentationAnimation sourcePreview](self, "sourcePreview");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCollapsedPreview:", v29);

    -[_UIContextMenuPresentationAnimation sourcePreview](self, "sourcePreview");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_transferAnimationsToView:", v8);

    if (!objc_msgSend(v8, "alwaysCompact")
      || (objc_msgSend(v8, "collapsedPreview"),
          v31 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v31, "parameters"),
          v32 = (void *)objc_claimAutoreleasedReturnValue(),
          v33 = objc_msgSend(v32, "copy"),
          v32,
          v31,
          !v33))
    {
      _DefaultParametersForView(v4);
      v33 = objc_claimAutoreleasedReturnValue();
      if ((_UIApplicationProcessIsSpringBoard() & 1) == 0)
      {
        objc_msgSend(v6, "traitCollection");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "userInterfaceIdiom");

        if (v35 != 6)
        {
          -[_UIContextMenuPresentationAnimation sourcePreview](self, "sourcePreview");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "parameters");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "backgroundColor");
          v73 = v12;
          v38 = v4;
          v39 = (void *)v33;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setBackgroundColor:", v40);

          v33 = (uint64_t)v39;
          v4 = v38;
          v12 = v73;

        }
      }
    }
    v72 = (void *)v33;
    v41 = -[UITargetedPreview initWithView:parameters:]([UITargetedPreview alloc], "initWithView:parameters:", v4, v33);
    objc_msgSend(v8, "setExpandedPreview:", v41);

    if (v9)
    {
      if (v8)
      {
        -[_UIContextMenuPresentationAnimation uiController](self, "uiController");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "menuStyle");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "previewOverlapsMenu");

        if (v44)
          objc_msgSend(v7, "insertSubview:belowSubview:", v9, v8);
        else
          objc_msgSend(v7, "insertSubview:aboveSubview:", v9, v8);
      }
      else
      {
        objc_msgSend(v7, "addSubview:", v9);
      }
      -[_UIContextMenuPresentationAnimation uiController](self, "uiController");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "currentLayout");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContextMenuPresentationAnimation setExpandedLayout:](self, "setExpandedLayout:", v50);

      v89 = v97;
      v90 = v98;
      v91 = v99;
      v92 = v100;
      v85 = v93;
      v86 = v94;
      v87 = v95;
      v88 = v96;
      _UIContextMenuItemLayoutApply((double *)&v85, v8, 0);
      v91 = 0u;
      v92 = 0u;
      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      -[_UIContextMenuPresentationAnimation expandedLayout](self, "expandedLayout");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v51;
      if (v51)
        objc_msgSend(v51, "menu");
      else
        memset(v84, 0, sizeof(v84));
      -[_UIContextMenuPresentationAnimation expandedLayout](self, "expandedLayout");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v53;
      if (v53)
      {
        objc_msgSend(v53, "anchor");
      }
      else
      {
        v83 = 0;
        memset(v82, 0, sizeof(v82));
      }
      v78 = v97;
      v79 = v98;
      v80 = v99;
      v81 = v100;
      v74 = v93;
      v75 = v94;
      v76 = v95;
      v77 = v96;
      -[_UIContextMenuPresentationAnimation _dismissedMenuLayoutForPresentedLayout:previewLayout:anchor:](self, "_dismissedMenuLayoutForPresentedLayout:previewLayout:anchor:", v84, &v74, v82);

      v78 = v89;
      v79 = v90;
      v80 = v91;
      v81 = v92;
      v74 = v85;
      v75 = v86;
      v76 = v87;
      v77 = v88;
      v47 = (double *)&v74;
      v48 = v9;
    }
    else
    {
      -[_UIContextMenuPresentationAnimation uiController](self, "uiController");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "currentLayout");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContextMenuPresentationAnimation setExpandedLayout:](self, "setExpandedLayout:", v46);

      v89 = v97;
      v90 = v98;
      v91 = v99;
      v92 = v100;
      v85 = v93;
      v86 = v94;
      v87 = v95;
      v88 = v96;
      v47 = (double *)&v85;
      v48 = v8;
    }
    _UIContextMenuItemLayoutApply(v47, v48, 0);
    objc_msgSend(v8, "layoutIfNeeded");
    objc_msgSend(v9, "layoutIfNeeded");
    if (!-[_UIContextMenuPresentationAnimation isSingleItemMenu](self, "isSingleItemMenu"))
    {
      -[_UIContextMenuPresentationAnimation uiController](self, "uiController");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "flocker");
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      v57 = -[UITargetedPreview initWithView:]([UITargetedPreview alloc], "initWithView:", v8);
      objc_msgSend(v56, "setPrimaryPlatterPreview:", v57);

      -[_UIContextMenuPresentationAnimation _secondarySourcePreviews](self, "_secondarySourcePreviews");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setSecondaryPlatterViews:", v58);

      -[_UIContextMenuPresentationAnimation expandedLayout](self, "expandedLayout");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "type");

      if (v60 == 3)
        objc_msgSend(v56, "setSettings:", 3);
      objc_msgSend(v56, "install");

    }
    -[_UIContextMenuPresentationAnimation expandedLayout](self, "expandedLayout");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "type");

    v63 = v62 == 3;
    v64 = v62 == 3;
    if (!v63)
      -[_UIContextMenuPresentationAnimation _installAccessories](self, "_installAccessories");
    objc_msgSend(v6, "traitCollection");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    _UIContextMenuGetPlatformMetrics(objc_msgSend(v65, "userInterfaceIdiom"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v66, "previewShadowSettings");
    v67 = objc_claimAutoreleasedReturnValue();
    if (v67)
    {
      v68 = (void *)v67;
      objc_msgSend(v66, "previewShadowSettings");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "opacity");
      v71 = v70;

      if (v71 > 0.0)
        v64 = objc_msgSend(v66, "enableShadowsForStandardSizeMenus");
    }
    objc_msgSend(v9, "setShowsShadow:", v64);

  }
}

- ($0B15E5176FD367B837238C983E599B83)_dismissedMenuLayoutForPresentedLayout:(SEL)a3 previewLayout:(id *)a4 anchor:(id *)a5
{
  double y;
  double x;
  double z;
  CGFloat v13;
  CGFloat v14;
  CGFloat width;
  CGFloat height;
  double v17;
  CGFloat v18;
  void *v19;
  uint64_t v20;
  $0B15E5176FD367B837238C983E599B83 *result;
  __int128 v22;
  __int128 v23;
  CGSize size;
  __int128 v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double MinX;
  double MinY;
  __int128 v32;
  double v33;
  CGRect v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  CGAffineTransform v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  x = a4->var1.x;
  y = a4->var1.y;
  z = a4->var1.z;
  memset(&v41, 0, sizeof(v41));
  CGAffineTransformMakeScale(&v41, 0.2, 0.2);
  v13 = a4->var0.origin.x;
  v14 = a4->var0.origin.y;
  width = a4->var0.size.width;
  height = a4->var0.size.height;
  v42.origin.x = a4->var0.origin.x;
  v42.origin.y = v14;
  v42.size.width = width;
  v42.size.height = height;
  v17 = CGRectGetHeight(v42);
  v43.origin.x = v13;
  v43.origin.y = v14;
  v43.size.width = width;
  v43.size.height = height;
  v18 = CGRectGetWidth(v43);
  -[_UIContextMenuPresentationAnimation expandedLayout](self, "expandedLayout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "type");

  if (v20 != 3)
  {
    v22 = *(_OWORD *)&a5->var3.b;
    v37 = *(_OWORD *)&a5->var2.y;
    v38 = v22;
    v23 = *(_OWORD *)&a5->var3.ty;
    v39 = *(_OWORD *)&a5->var3.d;
    v40 = v23;
    size = a5->var0.size;
    v34.origin = a5->var0.origin;
    v34.size = size;
    v25 = *(_OWORD *)&a5->var1.z;
    v35 = *(_OWORD *)&a5->var1.x;
    v36 = v25;
    v44.origin.x = _UIContextMenuItemFrameFromLayout(&v34);
    v26 = v44.origin.x;
    v27 = v44.origin.y;
    v28 = v44.size.width;
    v29 = v44.size.height;
    MinX = CGRectGetMinX(v44);
    v45.origin.x = v26;
    v45.origin.y = v27;
    v45.size.width = v28;
    v45.size.height = v29;
    v33 = fmax(MinX, fmin(a4->var1.x, CGRectGetMaxX(v45)));
    v46.origin.x = v26;
    v46.origin.y = v27;
    v46.size.width = v28;
    v46.size.height = v29;
    MinY = CGRectGetMinY(v46);
    v47.origin.x = v26;
    v47.origin.y = v27;
    v47.size.width = v28;
    v47.size.height = v29;
    x = v33;
    y = fmax(MinY, fmin(a4->var1.y, CGRectGetMaxY(v47)));
    z = a4->var1.z;
  }
  retstr->var0.origin.x = 0.0;
  retstr->var0.origin.y = 0.0;
  retstr->var0.size.width = v18;
  retstr->var0.size.height = fmin(v17, 110.0);
  retstr->var1.x = x;
  retstr->var1.y = y;
  retstr->var1.z = z;
  retstr->var2 = a4->var2;
  v32 = *(_OWORD *)&v41.c;
  *(_OWORD *)&retstr->var3.a = *(_OWORD *)&v41.a;
  *(_OWORD *)&retstr->var3.c = v32;
  *(_OWORD *)&retstr->var3.tx = *(_OWORD *)&v41.tx;
  retstr->var4 = 0.0;
  return result;
}

- (void)_anchorTransitionViewToTargetedPreview:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[_UIContextMenuPresentationAnimation _isDismissingToDrag](self, "_isDismissingToDrag")
    || (objc_msgSend(v4, "view"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        -[_UIContextMenuPresentationAnimation _platterView](self, "_platterView"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v5 == v6))
  {
    if (objc_msgSend(v4, "_sourceViewIsInViewHierarchy"))
    {
      objc_msgSend(v4, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "target");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "container");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[_UIContextMenuPresentationAnimation _platterTransitionView](self, "_platterTransitionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAnimationForKey:", CFSTR("PlatterAnchorViewMatchMoveAnimation"));

    objc_msgSend(v7, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "setSourceLayer:", v11);
    objc_msgSend(v12, "setKeyPath:", CFSTR("position"));
    objc_msgSend(v12, "setDuration:", INFINITY);
    objc_msgSend(v9, "center");
    v14 = v13;
    v16 = v15;
    objc_msgSend(v9, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = _UIContextMenuConvertPointBetweenViews(v17, v7, v14, v16);
    v20 = v19;

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSourcePoints:", v22);

    objc_msgSend(v9, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addAnimation:forKey:", v12, CFSTR("PlatterAnchorViewMatchMoveAnimation"));

  }
}

- (void)_actuallyPerformTransition
{
  _BOOL4 v3;
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
  _BOOL4 v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _BOOL4 v20;
  uint64_t v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  BOOL v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  id v47;
  _OWORD v48[8];
  _OWORD v49[8];
  _OWORD v50[2];
  uint64_t v51;
  _QWORD v52[4];
  id v53;
  _UIContextMenuPresentationAnimation *v54;
  id v55;
  uint64_t *v56;
  id location[2];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[6];
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v3 = -[_UIContextMenuPresentationAnimation isDismissTransition](self, "isDismissTransition");
  -[_UIContextMenuPresentationAnimation _prepareAnimatablePropertyBasedAnimations](self, "_prepareAnimatablePropertyBasedAnimations");
  -[_UIContextMenuPresentationAnimation _platterTransitionView](self, "_platterTransitionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v5, "userInterfaceIdiom"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIContextMenuPresentationAnimation _platterView](self, "_platterView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuPresentationAnimation _menuView](self, "_menuView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuPresentationAnimation animationProgress](self, "animationProgress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:", 1.0);

  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  -[_UIContextMenuPresentationAnimation expandedLayout](self, "expandedLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "preview");
  }
  else
  {
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
  }

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  -[_UIContextMenuPresentationAnimation expandedLayout](self, "expandedLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "menu");
  }
  else
  {
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
  }

  if (v3)
  {
    v66 = 0;
    v67 = &v66;
    v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__144;
    v70 = __Block_byref_object_dispose__144;
    v71 = 0;
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __65___UIContextMenuPresentationAnimation__actuallyPerformTransition__block_invoke;
    v65[3] = &unk_1E16BACE0;
    v65[5] = &v66;
    v65[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v65);
    _itemLayoutFromPreview((uint64_t)location, (void *)v67[5], v4, -[_UIContextMenuPresentationAnimation dismissalStyle](self, "dismissalStyle") != 1);
    v84 = v61;
    v85 = v62;
    v86 = v63;
    v87 = v64;
    v80 = *(_OWORD *)location;
    v81 = v58;
    v82 = v59;
    v83 = v60;
    if (objc_msgSend((id)v67[5], "_previewMode") != 4)
    {
      if (-[_UIContextMenuPresentationAnimation _isDismissingToDrag](self, "_isDismissingToDrag"))
      {
        -[_UIContextMenuPresentationAnimation uiController](self, "uiController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "flocker");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14 == 0;

        if (v15)
          *((_QWORD *)&v87 + 1) = 0x3FE999999999999ALL;
      }
    }
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __65___UIContextMenuPresentationAnimation__actuallyPerformTransition__block_invoke_2;
    v52[3] = &unk_1E16C1A30;
    v56 = &v66;
    v16 = v4;
    v53 = v16;
    v54 = self;
    v17 = v6;
    v55 = v17;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v52);
    objc_msgSend((id)v67[5], "target");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "container");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v19 == v16;

    if (v20)
      objc_msgSend(v16, "setAlpha:", 0.0);
    if (-[_UIContextMenuPresentationAnimation _isDismissingToDrag](self, "_isDismissingToDrag"))
    {
      v21 = 1;
    }
    else
    {
      objc_msgSend(v17, "setHideChromeWhenCollapsed:", 1);
      v21 = 0;
    }
    objc_msgSend(v17, "setCollapsedShadowStyle:", v21);
    -[_UIContextMenuPresentationAnimation expandedLayout](self, "expandedLayout");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      objc_msgSend(v24, "anchor");
    }
    else
    {
      v51 = 0;
      memset(v50, 0, sizeof(v50));
    }
    v49[4] = v76;
    v49[5] = v77;
    v49[6] = v78;
    v49[7] = v79;
    v49[0] = v72;
    v49[1] = v73;
    v49[2] = v74;
    v49[3] = v75;
    v48[4] = v84;
    v48[5] = v85;
    v48[6] = v86;
    v48[7] = v87;
    v48[0] = v80;
    v48[1] = v81;
    v48[2] = v82;
    v48[3] = v83;
    -[_UIContextMenuPresentationAnimation _dismissedMenuLayoutForPresentedLayout:previewLayout:anchor:](self, "_dismissedMenuLayoutForPresentedLayout:previewLayout:anchor:", v49, v48, v50);
    v76 = v61;
    v77 = v62;
    v78 = v63;
    v79 = v64;
    v72 = *(_OWORD *)location;
    v73 = v58;
    v74 = v59;
    v75 = v60;

    _Block_object_dispose(&v66, 8);
    v23 = 0.0;
  }
  else
  {
    objc_msgSend(v38, "baseMenuOffset");
    v23 = v22;
  }
  if (-[_UIContextMenuPresentationAnimation _hasVisibleBackground](self, "_hasVisibleBackground"))
  {
    if (-[_UIContextMenuPresentationAnimation _shouldAnimateBackgroundEffects](self, "_shouldAnimateBackgroundEffects"))
    {
      if (v3)
        v26 = 0.0;
      else
        v26 = 1.0;
      -[_UIContextMenuPresentationAnimation uiController](self, "uiController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "backgroundViewAnimationProgress");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setValue:", v26);

    }
    else
    {
      -[_UIContextMenuPresentationAnimation _setBackgroundVisible:](self, "_setBackgroundVisible:", !v3);
    }
  }
  if (!v3
    || -[_UIContextMenuPresentationAnimation _isDismissingToDrag](self, "_isDismissingToDrag")
    || -[_UIContextMenuPresentationAnimation isSingleItemMenu](self, "isSingleItemMenu"))
  {
    v61 = v84;
    v62 = v85;
    v63 = v86;
    v64 = v87;
    *(_OWORD *)location = v80;
    v58 = v81;
    v59 = v82;
    v60 = v83;
    _UIContextMenuItemLayoutApply((double *)location, v6, 0);
  }
  else
  {
    objc_msgSend(v6, "setAlpha:", *((double *)&v87 + 1));
  }
  objc_msgSend(v6, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setZPosition:", v23);

  objc_msgSend(v6, "setExpanded:", !v3);
  objc_msgSend(v6, "layoutIfNeeded");
  v61 = v76;
  v62 = v77;
  v63 = v78;
  v64 = v79;
  *(_OWORD *)location = v72;
  v58 = v73;
  v59 = v74;
  v60 = v75;
  _UIContextMenuItemLayoutApply((double *)location, v7, 0);
  objc_msgSend(v7, "layoutIfNeeded");
  if (!v3)
  {
    -[_UIContextMenuPresentationAnimation expandedLayout](self, "expandedLayout");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "type") == 3;

    if (v31)
    {
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __65___UIContextMenuPresentationAnimation__actuallyPerformTransition__block_invoke_3;
      v46[3] = &unk_1E16B1B28;
      v47 = v7;
      +[UIView _performWithoutRetargetingAnimations:](UIView, "_performWithoutRetargetingAnimations:", v46);

    }
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[_UIContextMenuPresentationAnimation _accessoryViews](self, "_accessoryViews");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v42, v88, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v43 != v34)
          objc_enumerationMutation(v32);
        -[_UIContextMenuPresentationAnimation _updateAccessoryAttachment:](self, "_updateAccessoryAttachment:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
      }
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v42, v88, 16);
    }
    while (v33);
  }

  objc_initWeak(location, self);
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __65___UIContextMenuPresentationAnimation__actuallyPerformTransition__block_invoke_4;
  v39[3] = &unk_1E16D9AA0;
  v41 = !v3;
  objc_copyWeak(&v40, location);
  -[_UIContextMenuPresentationAnimation setAccessoryAnimationBlock:](self, "setAccessoryAnimationBlock:", v39);
  -[_UIContextMenuPresentationAnimation uiController](self, "uiController");
  if (v3)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "flocker");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "unflockToDrag:animated:", -[_UIContextMenuPresentationAnimation _isDismissingToDrag](self, "_isDismissingToDrag"), 1);
  }
  else
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "flocker");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "flock");
  }

  objc_destroyWeak(&v40);
  objc_destroyWeak(location);

}

- (void)performTransition
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56___UIContextMenuPresentationAnimation_performTransition__block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = self;
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[_UIContextMenuPresentationAnimation _platterView](self, "_platterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIContextMenuPresentationAnimation _isDismissingToDrag](self, "_isDismissingToDrag")
    || !_AXSReduceMotionEnabled())
  {
    objc_msgSend(v4, "setShouldMorphContents:", 1);
    v3[2](v3);
  }
  else
  {
    objc_msgSend(v4, "setShouldMorphContents:", 0);
    if (-[_UIContextMenuPresentationAnimation isDismissTransition](self, "isDismissTransition"))
    {
      -[_UIContextMenuPresentationAnimation _performReduceMotionDisappearanceTransition](self, "_performReduceMotionDisappearanceTransition");
    }
    else
    {
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3);
      -[_UIContextMenuPresentationAnimation _performReduceMotionAppearanceTransition](self, "_performReduceMotionAppearanceTransition");
    }
  }
  -[_UIContextMenuPresentationAnimation alongsideAnimator](self, "alongsideAnimator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performAllAnimations");

  -[_UIContextMenuPresentationAnimation _prepareOverallAnimationCompletion](self, "_prepareOverallAnimationCompletion");
}

- (void)_performReduceMotionAppearanceTransition
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  -[_UIContextMenuPresentationAnimation _containerView](self, "_containerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79___UIContextMenuPresentationAnimation__performReduceMotionAppearanceTransition__block_invoke;
  v4[3] = &unk_1E16B1B28;
  v5 = v2;
  v3 = v2;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v4);
  objc_msgSend(v3, "setAlpha:", 1.0);

}

- (void)_performReduceMotionDisappearanceTransition
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[5];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82___UIContextMenuPresentationAnimation__performReduceMotionDisappearanceTransition__block_invoke;
  v15[3] = &unk_1E16B1B28;
  v15[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v15);
  -[_UIContextMenuPresentationAnimation _containerView](self, "_containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[_UIContextMenuPresentationAnimation _accessoryViews](self, "_accessoryViews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "setVisible:animated:", 0, 1);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v6);
  }

  -[_UIContextMenuPresentationAnimation uiController](self, "uiController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "flocker");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unflockToDrag:animated:", 0, 0);

}

- (id)_targetedPreviewForDismissalAnimation
{
  void *v3;
  void *v4;
  UITargetedPreview *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  UITargetedPreview *v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  UIPreviewTarget *v31;
  UIPreviewTarget *v32;
  void *v33;
  void *v35;
  UIPreviewTarget *v36;
  void *v37;
  void *v38;
  void *v39;
  UIPreviewTarget *v40;
  uint64_t v41;
  CGAffineTransform v42;
  CATransform3D v43;
  char v44;
  CGAffineTransform buf;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v44 = 0;
  -[_UIContextMenuPresentationAnimation uiController](self, "uiController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissalPreviewForStyle:clientReturnedPreview:", -[_UIContextMenuPresentationAnimation dismissalStyle](self, "dismissalStyle"), &v44);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 || v44)
  {
    v15 = v4;
    if (!v4)
    {
LABEL_18:
      -[_UIContextMenuPresentationAnimation _platterView](self, "_platterView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        -[_UIContextMenuPresentationAnimation _platterView](self, "_platterView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setHidesCollapsedSourceView:", 0);
      }
      else
      {
        -[_UIContextMenuPresentationAnimation _menuView](self, "_menuView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[_UIContextMenuPresentationAnimation _platterTransitionView](self, "_platterTransitionView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "frame");
      v26 = v25 + v24 * 0.5;
      v29 = v28 + v27 * 0.5;
      memset(&buf, 0, sizeof(buf));
      CGAffineTransformMakeScale(&buf, 0.35, 0.35);
      _DefaultParametersForView(v22);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = [UIPreviewTarget alloc];
      v42 = buf;
      v32 = -[UIPreviewTarget initWithContainer:center:transform:](v31, "initWithContainer:center:transform:", v23, &v42, v26, v29);
      v5 = -[UITargetedPreview initWithView:parameters:target:]([UITargetedPreview alloc], "initWithView:parameters:target:", v22, v30, v32);

      goto LABEL_22;
    }
    v5 = v15;
    if (-[UITargetedPreview _isVisible](v15, "_isVisible"))
      goto LABEL_22;
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        goto LABEL_16;
      -[UITargetedPreview view](v5, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITargetedPreview target](v5, "target");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "container");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.a) = 138412546;
      *(_QWORD *)((char *)&buf.a + 4) = v18;
      WORD2(buf.b) = 2112;
      *(_QWORD *)((char *)&buf.b + 6) = v20;
      _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "Dismissal preview with view %@ and container %@ is invalid. Its container must be in the view hierarchy, and both the container and view must not be hidden.", (uint8_t *)&buf, 0x16u);
    }
    else
    {
      v16 = _targetedPreviewForDismissalAnimation___s_category;
      if (!_targetedPreviewForDismissalAnimation___s_category)
      {
        v16 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v16, (unint64_t *)&_targetedPreviewForDismissalAnimation___s_category);
      }
      v17 = *(NSObject **)(v16 + 8);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      v6 = v17;
      -[UITargetedPreview view](v5, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITargetedPreview target](v5, "target");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "container");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.a) = 138412546;
      *(_QWORD *)((char *)&buf.a + 4) = v18;
      WORD2(buf.b) = 2112;
      *(_QWORD *)((char *)&buf.b + 6) = v20;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Dismissal preview with view %@ and container %@ is invalid. Its container must be in the view hierarchy, and both the container and view must not be hidden.", (uint8_t *)&buf, 0x16u);
    }

LABEL_16:
    goto LABEL_17;
  }
  -[_UIContextMenuPresentationAnimation sourcePreview](self, "sourcePreview");
  v5 = (UITargetedPreview *)objc_claimAutoreleasedReturnValue();
  if (!-[UITargetedPreview _sourceViewIsInViewHierarchy](v5, "_sourceViewIsInViewHierarchy"))
  {
LABEL_17:

    goto LABEL_18;
  }
  -[UITargetedPreview view](v5, "view");
  v6 = objc_claimAutoreleasedReturnValue();
  -[NSObject _window](v6, "_window");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_16;
  v8 = (void *)v7;
  v9 = -[UITargetedPreview _isVisible](v5, "_isVisible");

  if (!v9)
    goto LABEL_17;
  -[UITargetedPreview view](v5, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentationLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    -[UITargetedPreview view](v5, "view");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "layer");
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  memset(&buf, 0, sizeof(buf));
  if (v14)
    objc_msgSend(v14, "transform");
  else
    memset(&v43, 0, sizeof(v43));
  CATransform3DGetAffineTransform(&buf, &v43);
  v36 = [UIPreviewTarget alloc];
  -[UITargetedPreview target](v5, "target");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "container");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITargetedPreview target](v5, "target");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "center");
  v42 = buf;
  v40 = -[UIPreviewTarget initWithContainer:center:transform:](v36, "initWithContainer:center:transform:", v38, &v42);

  -[UITargetedPreview retargetedPreviewWithTarget:](v5, "retargetedPreviewWithTarget:", v40);
  v41 = objc_claimAutoreleasedReturnValue();

  v5 = (UITargetedPreview *)v41;
  if (!v41)
    goto LABEL_18;
LABEL_22:
  -[UITargetedPreview view](v5, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_bringAncestorControlledCollectionSubviewToFrontAmongCoplanarPeers");

  -[_UIContextMenuPresentationAnimation setStashedDismissalPreview:](self, "setStashedDismissalPreview:", v5);
  return v5;
}

- (id)_dismissalPreviewForSecondaryItemPreview:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[_UIContextMenuPresentationAnimation uiController](self, "uiController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_internalIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dismissalPreviewForSecondaryItem:style:", v6, -[_UIContextMenuPresentationAnimation dismissalStyle](self, "dismissalStyle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)transitionDidEnd:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[_UIContextMenuPresentationAnimation groupCompletion](self, "groupCompletion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "complete");

  if (v3)
  {
    if (!-[_UIContextMenuPresentationAnimation isDismissTransition](self, "isDismissTransition"))
    {
      -[_UIContextMenuPresentationAnimation _menuView](self, "_menuView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "didCompleteMenuAppearanceAnimation");

    }
    -[_UIContextMenuPresentationAnimation alongsideAnimator](self, "alongsideAnimator");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performAllCompletions");

  }
}

- (void)_prepareOverallAnimationCompletion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  if (-[_UIContextMenuPresentationAnimation isDismissTransition](self, "isDismissTransition"))
  {
    if (!-[_UIContextMenuPresentationAnimation _isDismissingToDrag](self, "_isDismissingToDrag"))
    {
      -[_UIContextMenuPresentationAnimation _containerView](self, "_containerView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContextMenuPresentationAnimation reparentingPortalView](self, "reparentingPortalView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContextMenuPresentationAnimation reparentingContainerView](self, "reparentingContainerView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContextMenuPresentationAnimation _platterTransitionView](self, "_platterTransitionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContextMenuPresentationAnimation groupCompletion](self, "groupCompletion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __73___UIContextMenuPresentationAnimation__prepareOverallAnimationCompletion__block_invoke;
      v12[3] = &unk_1E16B51E8;
      v13 = v3;
      v14 = v4;
      v15 = v5;
      v16 = v6;
      v8 = v6;
      v9 = v5;
      v10 = v4;
      v11 = v3;
      objc_msgSend(v7, "addCompletion:", v12);

    }
  }
}

- (void)_prepareAnimatablePropertyBasedAnimations
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[_UIContextMenuPresentationAnimation setAnimationProgress:](self, "setAnimationProgress:", v3);

  objc_initWeak(&location, self);
  -[_UIContextMenuPresentationAnimation animationProgress](self, "animationProgress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80___UIContextMenuPresentationAnimation__prepareAnimatablePropertyBasedAnimations__block_invoke_2;
  v14[3] = &unk_1E16B3F40;
  objc_copyWeak(&v15, &location);
  +[UIView _createUnsafeTransformerWithInputAnimatableProperties:modelValueSetter:presentationValueSetter:](UIView, "_createUnsafeTransformerWithInputAnimatableProperties:modelValueSetter:presentationValueSetter:", v5, &__block_literal_global_402, v14);

  if (-[_UIContextMenuPresentationAnimation _hasVisibleBackground](self, "_hasVisibleBackground"))
  {
    -[_UIContextMenuPresentationAnimation uiController](self, "uiController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backgroundViewAnimationProgress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __80___UIContextMenuPresentationAnimation__prepareAnimatablePropertyBasedAnimations__block_invoke_3;
    v12[3] = &unk_1E16B3F40;
    objc_copyWeak(&v13, &location);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __80___UIContextMenuPresentationAnimation__prepareAnimatablePropertyBasedAnimations__block_invoke_4;
    v10[3] = &unk_1E16B3F40;
    objc_copyWeak(&v11, &location);
    +[UIView _createUnsafeTransformerWithInputAnimatableProperties:modelValueSetter:presentationValueSetter:](UIView, "_createUnsafeTransformerWithInputAnimatableProperties:modelValueSetter:presentationValueSetter:", v9, v12, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
  }
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_presentation_applyBackgroundEffectWithProgress:(double)a3
{
  _BOOL4 v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;

  v5 = -[_UIContextMenuPresentationAnimation isDismissTransition](self, "isDismissTransition");
  v6 = 0.3;
  if (!v5)
    v6 = 0.0;
  v7 = fmax(fmin((a3 - v6) / (1.0 - v6), 1.0), 0.0);
  -[_UIContextMenuPresentationAnimation _backgroundView](self, "_backgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_backgroundHost");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (1.0 - v7) * 0.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7 * 0.024 + v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setPresentationValue:forKey:", v12, CFSTR("zoom"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 - v7 + v7 * 0.5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setPresentationValue:forKey:", v13, CFSTR("scale"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7 * 10.0 + v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setPresentationValue:forKey:", v14, CFSTR("filters.gaussianBlur.inputRadius"));

  }
  objc_msgSend(v8, "backgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor clearColor](UIColor, "clearColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0.0;
  v27 = 0.0;
  v24 = 0.0;
  v25 = 0.0;
  v17 = v15;
  objc_msgSend(v16, "getRed:green:blue:alpha:", &v27, &v26, &v25, &v24);
  v22 = 0.0;
  v23 = 0.0;
  v20 = 0.0;
  v21 = 0.0;
  objc_msgSend(v17, "getRed:green:blue:alpha:", &v23, &v22, &v21, &v20);

  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", (1.0 - v7) * v27 + v7 * v23, (1.0 - v7) * v26 + v7 * v22, (1.0 - v7) * v25 + v7 * v21, (1.0 - v7) * v24 + v7 * v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_retainAutorelease(v18);
  objc_msgSend(v8, "_setPresentationValue:forKey:", objc_msgSend(v19, "CGColor"), CFSTR("backgroundColor"));

}

- (void)_prepareReparentingAnimationWithDismissalTarget:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  _UIContextMenuReparentingContainerView *v16;
  _UIContextMenuReparentingContainerView *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _UIPortalView *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _UIContextMenuReparentingContainerView *v47;
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  _UIContextMenuReparentingContainerView *v52;
  id v53;
  id v54;
  id v55;
  id location;
  _OWORD v57[3];
  _OWORD v58[3];
  _QWORD v59[4];

  v59[1] = *MEMORY[0x1E0C80C00];
  v50 = a3;
  -[_UIContextMenuPresentationAnimation _platterTransitionView](self, "_platterTransitionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "target");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "container");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [_UIContextMenuReparentingContainerView alloc];
  objc_msgSend(v4, "bounds");
  v17 = -[UIView initWithFrame:](v16, "initWithFrame:");
  -[UIView _setOverrideUserInterfaceRenderingMode:](v17, "_setOverrideUserInterfaceRenderingMode:", 1);
  objc_msgSend(v15, "window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _UIGetTransformBetweenViews(v18, v15, 1, (uint64_t)v58);
  v57[0] = v58[0];
  v57[1] = v58[1];
  v57[2] = v58[2];
  -[UIView setTransform:](v17, "setTransform:", v57);

  v19 = -[UIView _subviewsNeedAxisFlipping](v15);
  -[UIView layer](v17, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFlipsHorizontalAxis:", v19);

  -[UIView setUserInteractionEnabled:](v17, "setUserInteractionEnabled:", 0);
  v21 = -[UIView _center3D](v4);
  v23 = _UIContextMenuConvertPointBetweenViews(v13, v15, v21, v22);
  -[UIView _setCenter3D:](v17, v23, v24, 0.0);
  v25 = (void *)objc_opt_new();
  -[UIView bounds](v17, "bounds");
  objc_msgSend(v25, "setFrame:");
  -[UIView layer](v17, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSublayer:", v25);

  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E78]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](v17, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFilters:", v28);

  -[UIView layer](v17, "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setValue:forKeyPath:", &unk_1E1A95CA0, CFSTR("filters.opacityPair.inputAmount"));

  -[_UIContextMenuPresentationAnimation setReparentingContainerView:](self, "setReparentingContainerView:", v17);
  objc_msgSend(v50, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "insertSubview:aboveSubview:", v17, v31);

  v32 = -[_UIPortalView initWithFrame:]([_UIPortalView alloc], "initWithFrame:", v6, v8, v10, v12);
  -[_UIPortalView setSourceView:](v32, "setSourceView:", v4);
  -[_UIPortalView setAllowsBackdropGroups:](v32, "setAllowsBackdropGroups:", 1);
  -[_UIPortalView setMatchesTransform:](v32, "setMatchesTransform:", 1);
  -[_UIPortalView setMatchesPosition:](v32, "setMatchesPosition:", 1);
  -[UIView layer](v32, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setAllowsGroupOpacity:", 1);

  objc_msgSend(v13, "addSubview:", v32);
  -[_UIContextMenuPresentationAnimation setReparentingPortalView:](self, "setReparentingPortalView:", v32);

  -[UIView addSubview:](v17, "addSubview:", v4);
  -[UIView bounds](v17, "bounds");
  objc_msgSend(v4, "setCenter:", v35 + v34 * 0.5, v37 + v36 * 0.5);
  objc_msgSend(v15, "_window");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "windowScene");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_window");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "windowScene");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v39 == v41;

  if (!v42)
  {
    objc_msgSend(v15, "_window");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "windowScene");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "_synchronizeDrawing");

    objc_msgSend(v13, "_window");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "windowScene");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "_synchronizeDrawing");

  }
  objc_initWeak(&location, self);
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __87___UIContextMenuPresentationAnimation__prepareReparentingAnimationWithDismissalTarget___block_invoke;
  v51[3] = &unk_1E16D9AC8;
  objc_copyWeak(&v55, &location);
  v47 = v17;
  v52 = v47;
  v48 = v50;
  v53 = v48;
  v49 = v4;
  v54 = v49;
  -[_UIContextMenuPresentationAnimation setReparentingAnimationBlock:](self, "setReparentingAnimationBlock:", v51);

  objc_destroyWeak(&v55);
  objc_destroyWeak(&location);

}

- (void)_installAccessories
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  __int128 v14;
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
  -[_UIContextMenuPresentationAnimation _accessoryViews](self, "_accessoryViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (v8)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "anchor");
          v9 = v14 - 1;
          v10 = 0.5;
          v11 = 0.5;
          if ((unint64_t)(v14 - 1) <= 7)
          {
            v10 = dbl_186681D58[v9];
            v11 = dbl_186681D98[v9];
          }
        }
        else
        {
          v10 = 0.5;
          v11 = 0.5;
          v14 = 0u;
        }
        switch(*((_QWORD *)&v14 + 1))
        {
          case 1:
            v10 = 0.0;
            break;
          case 2:
            v11 = 0.0;
            break;
          case 4:
            v10 = 1.0;
            break;
          case 8:
            v11 = 1.0;
            break;
          default:
            break;
        }
        if (!objc_msgSend(v8, "location", (_QWORD)v14))
          v10 = 0.0;
        objc_msgSend(v8, "layer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setAnchorPoint:", v11, v10);

        -[_UIContextMenuPresentationAnimation _containerView](self, "_containerView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addSubview:", v8);

        objc_msgSend(v8, "setVisible:animated:", 0, 0);
        -[_UIContextMenuPresentationAnimation _updateAccessoryAttachment:](self, "_updateAccessoryAttachment:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

}

- (void)_updateAccessoryAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
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
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  double MinX;
  double v70;
  double MinY;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  __int128 v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;

  v4 = a3;
  -[_UIContextMenuPresentationAnimation _containerView](self, "_containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuPresentationAnimation uiController](self, "uiController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "menuConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sourcePreview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "target");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "container");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v4, "location");
  if (v12 == 2)
  {
    -[_UIContextMenuPresentationAnimation _menuView](self, "_menuView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v48 = v47;
    objc_msgSend(v47, "frame");
    v43 = v49;
    v44 = v50;
    v45 = v51;
    v46 = v52;

    goto LABEL_9;
  }
  if (v12 == 1)
  {
    -[_UIContextMenuPresentationAnimation _platterView](self, "_platterView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v12)
  {
    v43 = *MEMORY[0x1E0C9D648];
    v44 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v45 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v46 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    objc_msgSend(v11, "bounds");
    v17 = _UIContextMenuProjectFrameFromViewToView(v11, v5, v13, v14, v15, v16);
    v72 = v18;
    v73 = v17;
    v74 = v19;
    v75 = v20;
    objc_msgSend(v11, "safeAreaInsets");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    objc_msgSend(v11, "traitCollection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    _UIContextMenuGetPlatformMetrics(objc_msgSend(v29, "userInterfaceIdiom"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "minimumContainerInsets");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;

    v39 = fmax(v22, v32);
    v40 = fmax(v24, v34);
    v41 = fmax(v26, v36);
    v42 = fmax(v28, v38);
    v43 = v73 + v40;
    v44 = v72 + v39;
    v45 = v74 - (v40 + v42);
    v46 = v75 - (v39 + v41);
  }
LABEL_9:
  objc_msgSend(v5, "traitCollection");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v53, "userInterfaceIdiom"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v54, "baseMenuOffset");
  v56 = v55;
  v58 = v57;
  v60 = v59;
  if (v4)
  {
    objc_msgSend(v4, "anchor");
    v61 = v77 - 1;
    v62 = 0.5;
    v63 = 0.5;
    if ((unint64_t)(v77 - 1) <= 7)
    {
      v62 = dbl_186681DD8[v61];
      v63 = dbl_186681E18[v61];
    }
  }
  else
  {
    v77 = 0u;
    v62 = 0.5;
    v63 = 0.5;
  }
  switch(*((_QWORD *)&v77 + 1))
  {
    case 1:
      v62 = 0.0;
      break;
    case 2:
      v63 = 0.0;
      break;
    case 4:
      v62 = 1.0;
      break;
    case 8:
      v63 = 1.0;
      break;
    default:
      break;
  }
  v76 = v62;
  objc_msgSend(v4, "attachmentOffsetWithReferenceFrame:", _UIContextMenuProjectFrameFromViewToView(v5, v11, v43, v44, v45, v46));
  v65 = v56 + v64;
  v67 = v58 + v66;
  objc_msgSend(v4, "setOffset:", v65, v67);
  objc_msgSend(v4, "layer");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setZPosition:", v60);

  v78.origin.x = v43;
  v78.origin.y = v44;
  v78.size.width = v45;
  v78.size.height = v46;
  MinX = CGRectGetMinX(v78);
  v79.origin.x = v43;
  v79.origin.y = v44;
  v79.size.width = v45;
  v79.size.height = v46;
  v70 = v65 + MinX + v63 * CGRectGetWidth(v79);
  v80.origin.x = v43;
  v80.origin.y = v44;
  v80.size.width = v45;
  v80.size.height = v46;
  MinY = CGRectGetMinY(v80);
  v81.origin.x = v43;
  v81.origin.y = v44;
  v81.size.width = v45;
  v81.size.height = v46;
  objc_msgSend(v4, "setCenter:", v70, v67 + MinY + v76 * CGRectGetHeight(v81));

}

- (BOOL)_shouldAnimateBackgroundEffects
{
  void *v2;
  uint64_t v3;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return !v3 && !_AXSReduceMotionEnabled() && _AXSEnhanceBackgroundContrastEnabled() == 0;
}

- (BOOL)_isDismissingToDrag
{
  return -[_UIContextMenuPresentationAnimation dismissalStyle](self, "dismissalStyle") == 1;
}

- (id)_containerView
{
  void *v2;
  void *v3;

  -[_UIContextMenuPresentationAnimation uiController](self, "uiController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "platterContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_platterTransitionView
{
  void *v2;
  void *v3;

  -[_UIContextMenuPresentationAnimation uiController](self, "uiController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "platterTransitionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_backgroundView
{
  void *v2;
  void *v3;

  -[_UIContextMenuPresentationAnimation uiController](self, "uiController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundEffectView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_platterView
{
  void *v2;
  void *v3;

  -[_UIContextMenuPresentationAnimation uiController](self, "uiController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentPlatterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_menuView
{
  void *v2;
  void *v3;

  -[_UIContextMenuPresentationAnimation uiController](self, "uiController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menuView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessoryViews
{
  void *v2;
  void *v3;
  void *v4;

  -[_UIContextMenuPresentationAnimation uiController](self, "uiController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menuConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_secondarySourcePreviews
{
  void *v2;
  void *v3;
  void *v4;

  -[_UIContextMenuPresentationAnimation uiController](self, "uiController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menuConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secondarySourcePreviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_setBackgroundVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  id v15;

  v3 = a3;
  if (-[_UIContextMenuPresentationAnimation _hasVisibleBackground](self, "_hasVisibleBackground"))
  {
    -[_UIContextMenuPresentationAnimation _backgroundView](self, "_backgroundView");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[_UIContextMenuPresentationAnimation expandedLayout](self, "expandedLayout");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "type");

      -[_UIContextMenuPresentationAnimation uiController](self, "uiController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "menuStyle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "preferredBackgroundEffects");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 != 3 && !objc_msgSend(v9, "count"))
      {
        _UIClickPresentationBackgroundEffects(1);
        v10 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v10;
      }
      objc_msgSend(v15, "setBackgroundEffects:", v9);
      -[_UIContextMenuPresentationAnimation uiController](self, "uiController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "menuStyle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "preferredBackgroundColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 != 3 && !v13)
      {
        _UIClickPresentationBackgroundColor(1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v15, "setBackgroundColor:", v13);

    }
    if (!-[_UIContextMenuPresentationAnimation _shouldAnimateBackgroundEffects](self, "_shouldAnimateBackgroundEffects"))
    {
      v14 = 0.0;
      if (v3)
        v14 = 1.0;
      objc_msgSend(v15, "setAlpha:", v14);
    }

  }
}

- (BOOL)_hasVisibleBackground
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;

  -[_UIContextMenuPresentationAnimation uiController](self, "uiController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "menuStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "preferredBackgroundEffects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v4, "preferredBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v6 = 1;
      goto LABEL_6;
    }
    -[_UIContextMenuPresentationAnimation expandedLayout](self, "expandedLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "type") != 3;
  }

LABEL_6:
  return v6;
}

- (UITargetedPreview)sourcePreview
{
  return self->_sourcePreview;
}

- (void)setSourcePreview:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (_UIContextMenuUIController)uiController
{
  return (_UIContextMenuUIController *)objc_loadWeakRetained((id *)&self->_uiController);
}

- (void)setUiController:(id)a3
{
  objc_storeWeak((id *)&self->_uiController, a3);
}

- (_UIContextMenuAnimator)alongsideAnimator
{
  return self->_alongsideAnimator;
}

- (void)setAlongsideAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_alongsideAnimator, a3);
}

- (unint64_t)dismissalStyle
{
  return self->_dismissalStyle;
}

- (void)setDismissalStyle:(unint64_t)a3
{
  self->_dismissalStyle = a3;
}

- (BOOL)isDismissTransition
{
  return self->_isDismissTransition;
}

- (void)setIsDismissTransition:(BOOL)a3
{
  self->_isDismissTransition = a3;
}

- (BOOL)isSingleItemMenu
{
  return self->_isSingleItemMenu;
}

- (void)setIsSingleItemMenu:(BOOL)a3
{
  self->_isSingleItemMenu = a3;
}

- (_UIPortalView)reparentingPortalView
{
  return self->_reparentingPortalView;
}

- (void)setReparentingPortalView:(id)a3
{
  objc_storeStrong((id *)&self->_reparentingPortalView, a3);
}

- (_UIContextMenuReparentingContainerView)reparentingContainerView
{
  return self->_reparentingContainerView;
}

- (void)setReparentingContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_reparentingContainerView, a3);
}

- (UIViewFloatAnimatableProperty)animationProgress
{
  return self->_animationProgress;
}

- (void)setAnimationProgress:(id)a3
{
  objc_storeStrong((id *)&self->_animationProgress, a3);
}

- (id)reparentingAnimationBlock
{
  return self->_reparentingAnimationBlock;
}

- (void)setReparentingAnimationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)accessoryAnimationBlock
{
  return self->_accessoryAnimationBlock;
}

- (void)setAccessoryAnimationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (_UIContextMenuLayoutArbiterOutput)expandedLayout
{
  return self->_expandedLayout;
}

- (void)setExpandedLayout:(id)a3
{
  objc_storeStrong((id *)&self->_expandedLayout, a3);
}

- (_UIGroupCompletion)groupCompletion
{
  return self->_groupCompletion;
}

- (void)setGroupCompletion:(id)a3
{
  objc_storeStrong((id *)&self->_groupCompletion, a3);
}

- (UITargetedPreview)stashedDismissalPreview
{
  return self->_stashedDismissalPreview;
}

- (void)setStashedDismissalPreview:(id)a3
{
  objc_storeStrong((id *)&self->_stashedDismissalPreview, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stashedDismissalPreview, 0);
  objc_storeStrong((id *)&self->_groupCompletion, 0);
  objc_storeStrong((id *)&self->_expandedLayout, 0);
  objc_storeStrong(&self->_accessoryAnimationBlock, 0);
  objc_storeStrong(&self->_reparentingAnimationBlock, 0);
  objc_storeStrong((id *)&self->_animationProgress, 0);
  objc_storeStrong((id *)&self->_reparentingContainerView, 0);
  objc_storeStrong((id *)&self->_reparentingPortalView, 0);
  objc_storeStrong((id *)&self->_alongsideAnimator, 0);
  objc_destroyWeak((id *)&self->_uiController);
  objc_storeStrong((id *)&self->_sourcePreview, 0);
}

@end
