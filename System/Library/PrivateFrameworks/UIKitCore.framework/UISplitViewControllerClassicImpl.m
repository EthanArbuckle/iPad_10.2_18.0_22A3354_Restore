@implementation UISplitViewControllerClassicImpl

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  return 0;
}

- (void)_marginInfoForChild:(id)a3 leftMargin:(double *)a4 rightMargin:(double *)a5
{
  unint64_t v8;
  id v9;

  v9 = a3;
  if (-[UISplitViewControllerClassicImpl _shouldUseRelativeInsets](self, "_shouldUseRelativeInsets"))
    -[UISplitViewControllerClassicImpl _contentMarginForChildViewController:](self, "_contentMarginForChildViewController:", v9);
  else
    v8 = 0xFFEFFFFFFFFFFFFFLL;
  *(_QWORD *)a4 = v8;
  *(_QWORD *)a5 = v8;

}

- (int64_t)style
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  v5 = -[UISplitViewControllerClassicImpl _isMasterViewShown](self, "_isMasterViewShown");
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v7 = WeakRetained;
  if (v5)
  {
    objc_msgSend(WeakRetained, "masterViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "__viewWillAppear:", v3);

  }
  else
  {
    v9 = objc_msgSend(WeakRetained, "displayMode");

    if (v9 != 2)
    {
      v10 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v10, "masterViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISplitViewControllerClassicImpl _viewControllerHiding:](self, "_viewControllerHiding:", v11);

      self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFFF1FLL | 0x80);
    }
  }
  -[UISplitViewControllerClassicImpl _addOrRemovePopoverPresentationGestureRecognizer](self, "_addOrRemovePopoverPresentationGestureRecognizer");
  v13 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v13, "detailViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "__viewWillAppear:", v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v3 = a3;
  if (-[UISplitViewControllerClassicImpl _isMasterViewShown](self, "_isMasterViewShown"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "masterViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "__viewDidAppear:", v3);

  }
  v7 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v7, "detailViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "__viewDidAppear:", v3);

  v9 = objc_loadWeakRetained((id *)&self->_svc);
  self->_lastPresentedOrientation = objc_msgSend(v9, "interfaceOrientation");

}

- (unint64_t)preferredScreenEdgesDeferringSystemGestures
{
  id WeakRetained;
  unint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v3 = objc_msgSend(WeakRetained, "_super_preferredScreenEdgesDeferringSystemGestures");

  return v3;
}

- (BOOL)_disableAutomaticKeyboardBehavior
{
  id WeakRetained;
  char v4;

  if (self->_postTransitionResponder)
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v4 = objc_msgSend(WeakRetained, "_super_disableAutomaticKeyboardBehavior");

  return v4;
}

- (void)_didChangeToFirstResponder:(id)a3
{
  UIResponder *postTransitionResponder;
  BOOL v4;
  uint64_t v5;

  postTransitionResponder = self->_postTransitionResponder;
  if (postTransitionResponder)
    v4 = postTransitionResponder == a3;
  else
    v4 = 1;
  if (!v4)
  {
    v5 = 0x100000000;
    if (!a3)
      v5 = 0x200000000;
    *(_QWORD *)&self->_splitViewControllerFlags |= v5;
  }
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  id v40;
  int v41;
  id v42;
  int v43;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained(&self->_delegate);

  v5 = obj;
  if (!obj || WeakRetained != obj)
  {
    objc_storeWeak(&self->_delegate, obj);
    v6 = objc_opt_respondsToSelector();
    v7 = 512;
    if ((v6 & 1) == 0)
      v7 = 0;
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFFDFFLL | v7);
    v8 = objc_opt_respondsToSelector();
    v9 = 1024;
    if ((v8 & 1) == 0)
      v9 = 0;
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFFBFFLL | v9);
    v10 = objc_opt_respondsToSelector();
    v11 = 2048;
    if ((v10 & 1) == 0)
      v11 = 0;
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFF7FFLL | v11);
    v12 = objc_opt_respondsToSelector();
    v13 = 16;
    if ((v12 & 1) == 0)
      v13 = 0;
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFFFEFLL | v13);
    v14 = objc_opt_respondsToSelector();
    v15 = 0x4000;
    if ((v14 & 1) == 0)
      v15 = 0;
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFBFFFLL | v15);
    v16 = objc_opt_respondsToSelector();
    v17 = 0x8000;
    if ((v16 & 1) == 0)
      v17 = 0;
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFF7FFFLL | v17);
    v18 = objc_opt_respondsToSelector();
    v19 = 0x10000;
    if ((v18 & 1) == 0)
      v19 = 0;
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFEFFFFLL | v19);
    v20 = objc_opt_respondsToSelector();
    v21 = 0x20000;
    if ((v20 & 1) == 0)
      v21 = 0;
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFDFFFFLL | v21);
    v22 = objc_opt_respondsToSelector();
    v23 = 0x40000;
    if ((v22 & 1) == 0)
      v23 = 0;
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFBFFFFLL | v23);
    v24 = objc_opt_respondsToSelector();
    v25 = 0x80000;
    if ((v24 & 1) == 0)
      v25 = 0;
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFF7FFFFLL | v25);
    v26 = objc_opt_respondsToSelector();
    v27 = 0x1000000000;
    if ((v26 & 1) == 0)
      v27 = 0;
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFEFFFFFFFFFLL | v27);
    v28 = objc_opt_respondsToSelector();
    v29 = 0x2000000000;
    if ((v28 & 1) == 0)
      v29 = 0;
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFDFFFFFFFFFLL | v29);
    v30 = objc_opt_respondsToSelector();
    v31 = 4096;
    if ((v30 & 1) == 0)
      v31 = 0;
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFEFFFLL | v31);
    v32 = objc_opt_respondsToSelector();
    v33 = 0x2000;
    if ((v32 & 1) == 0)
      v33 = 0;
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFDFFFLL | v33);
    v34 = objc_opt_respondsToSelector();
    v35 = 0x4000000;
    if ((v34 & 1) == 0)
      v35 = 0;
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFFFFBFFFFFFLL | v35);
    v36 = objc_opt_respondsToSelector();
    v37 = 0x8000000;
    if ((v36 & 1) == 0)
      v37 = 0;
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFFFF7FFFFFFLL | v37);
    v38 = objc_opt_respondsToSelector();
    v39 = 0x10000000;
    if ((v38 & 1) == 0)
      v39 = 0;
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFFFEFFFFFFFLL | v39);
    -[UISplitViewControllerClassicImpl _invalidateHidesMasterViewForAspectRatio:](self, "_invalidateHidesMasterViewForAspectRatio:", 1);
    -[UISplitViewControllerClassicImpl _invalidateHidesMasterViewForAspectRatio:](self, "_invalidateHidesMasterViewForAspectRatio:", 0);
    if (!-[UISplitViewControllerClassicImpl _defersUpdateDelegateHiddenMasterAspectRatios](self, "_defersUpdateDelegateHiddenMasterAspectRatios"))-[UISplitViewControllerClassicImpl _updateDelegateHiddenMasterAspectRatios](self, "_updateDelegateHiddenMasterAspectRatios");
    v40 = objc_loadWeakRetained((id *)&self->_svc);
    v41 = objc_msgSend(v40, "_hasAppeared");

    if (v41)
      -[UISplitViewControllerClassicImpl _addOrRemovePopoverPresentationGestureRecognizer](self, "_addOrRemovePopoverPresentationGestureRecognizer");
    v42 = objc_loadWeakRetained((id *)&self->_svc);
    v43 = objc_msgSend(v42, "isViewLoaded");

    if (v43)
      -[UISplitViewControllerClassicImpl _updateTargetDisplayMode](self, "_updateTargetDisplayMode");
    else
      *(_QWORD *)&self->_splitViewControllerFlags |= 0x40000000uLL;
    v5 = obj;
  }

}

- (void)_invalidateHidesMasterViewForAspectRatio:(int64_t)a3
{
  self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFFFFCLL | ((1 << a3) | *(_QWORD *)&self->_splitViewControllerFlags) & 3);
}

- (void)_displayModeDidChange
{
  int64_t pendingDisplayModeChangeCount;
  BOOL v4;
  int64_t v5;

  -[UISplitViewControllerClassicImpl _updateTargetDisplayMode](self, "_updateTargetDisplayMode");
  pendingDisplayModeChangeCount = self->_pendingDisplayModeChangeCount;
  v4 = pendingDisplayModeChangeCount < 1;
  v5 = pendingDisplayModeChangeCount - 1;
  if (!v4)
    self->_pendingDisplayModeChangeCount = v5;
}

- (void)_updateTargetDisplayMode
{
  -[UISplitViewControllerClassicImpl _cacheEffectiveTargetDisplayMode](self, "_cacheEffectiveTargetDisplayMode");
  -[UISplitViewControllerClassicImpl _updateDisplayModeButtonItem](self, "_updateDisplayModeButtonItem");
  -[UISplitViewControllerClassicImpl _addOrRemovePopoverPresentationGestureRecognizer](self, "_addOrRemovePopoverPresentationGestureRecognizer");
}

- (void)_updateDisplayModeButtonItem
{
  int64_t v3;
  uint64_t v4;
  _BOOL8 v5;
  __CFString *v6;
  void *v7;
  id WeakRetained;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;

  if (!self->_displayModeButtonItem)
    return;
  v3 = -[UISplitViewControllerClassicImpl _effectiveTargetDisplayMode](self, "_effectiveTargetDisplayMode");
  if ((unint64_t)(v3 - 2) >= 2)
  {
    if (v3 != 1)
    {
      v4 = 0;
      v5 = v3 == 0;
      v6 = 0;
      v7 = 0;
      goto LABEL_14;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    v9 = objc_msgSend(WeakRetained, "displayMode");

    if (v9 != 3)
    {
      _UIImageWithName(CFSTR("UISplitViewControllerFullScreen.png"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "imageFlippedForRightToLeftLayoutDirection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = 0;
      v5 = 0;
      v6 = 0;
      goto LABEL_14;
    }
  }
  v10 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v10, "_displayModeButtonItemTitle");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v6 = v15;
  if (!v15)
  {
    if (!-[UISplitViewControllerClassicImpl _hasMasterViewController](self, "_hasMasterViewController"))
    {
      v5 = 0;
      v6 = 0;
      goto LABEL_13;
    }
    v11 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v11, "masterViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "title");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v6 = v16;
  }
  v5 = 0;
LABEL_13:
  v7 = 0;
  v4 = 1;
LABEL_14:
  v17 = v6;
  if (!-[__CFString length](v6, "length") && !v7)
  {

    v17 = CFSTR(" ");
  }
  -[UIBarButtonItem setImage:](self->_displayModeButtonItem, "setImage:", v7);
  -[UIBarButtonItem setTitle:](self->_displayModeButtonItem, "setTitle:", v17);
  -[UIBarButtonItem _setShowsBackButtonIndicator:](self->_displayModeButtonItem, "_setShowsBackButtonIndicator:", v4);
  if ((_DWORD)v4)
    v14 = +[UIDragInteraction isEnabledByDefault](UIDragInteraction, "isEnabledByDefault");
  else
    v14 = 0;
  -[UIBarButtonItem setSpringLoaded:](self->_displayModeButtonItem, "setSpringLoaded:", v14);
  -[UIBarButtonItem setHidden:](self->_displayModeButtonItem, "setHidden:", v5);

}

- (void)_cacheEffectiveTargetDisplayMode
{
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  int64_t v7;
  id v8;
  id v9;

  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "horizontalSizeClass");

  if (v6 == 1)
  {
    v7 = 0;
  }
  else if ((*((_BYTE *)&self->_splitViewControllerFlags + 3) & 8) == 0
         || (v8 = objc_loadWeakRetained(&self->_delegate),
             v9 = objc_loadWeakRetained((id *)p_svc),
             v7 = objc_msgSend(v8, "targetDisplayModeForActionInSplitViewController:", v9),
             v9,
             v8,
             !v7))
  {
    v7 = -[UISplitViewControllerClassicImpl _defaultTargetDisplayMode](self, "_defaultTargetDisplayMode");
  }
  self->_effectiveTargetDisplayMode = v7;
}

- (UISplitViewControllerClassicImpl)initWithSplitViewController:(id)a3
{
  id v4;
  UISplitViewControllerClassicImpl *v5;
  UISplitViewControllerClassicImpl *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UISplitViewControllerClassicImpl;
  v5 = -[UISplitViewControllerClassicImpl init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_svc, v4);

  return v6;
}

- (void)_commonInit
{
  void *v3;
  uint64_t v4;
  _QWORD *WeakRetained;
  int v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;

  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    if (!v4)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("UISplitViewController is only supported when running under UIUserInterfaceIdiomPad"));
  }
  self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFFFF3 | 8);
  self->_gutterWidth = -3.4028e38;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  WeakRetained[46] &= ~0x100000uLL;

  self->_presentsWithGesture = 1;
  *(int64x2_t *)&self->_preferredPrimaryColumnWidthFraction = vdupq_n_s64(0xC7EFFFFFE0000000);
  self->_maximumPrimaryColumnWidth = -3.40282347e38;
  self->_primaryEdge = 0;
  v6 = dyld_program_sdk_at_least();
  v7 = 0x8000000000;
  if (!v6)
    v7 = 0;
  self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFF7FFFFFFFFFLL | v7);
  v8 = +[UISplitViewController _devicePrefersOverlayInRegularWidth](UISplitViewController, "_devicePrefersOverlayInRegularWidth");
  v9 = 0x10000000000;
  if (!v8)
    v9 = 0;
  self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFEFFFFFFFFFFLL | v9);
  self->_lastFocusedChildViewControllerIndex = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_updateChildContentMargins
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
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
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "viewControllers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[UISplitViewControllerClassicImpl _contentMarginForChildViewController:](self, "_contentMarginForChildViewController:", v9);
        objc_msgSend(v9, "_setContentMargin:");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (NSArray)viewControllers
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "childViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)__viewWillLayoutSubviews
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  id v10;
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
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  BOOL v26;
  id v27;
  uint64_t v28;
  int64_t lastPresentedOrientation;
  int v30;
  UISplitViewController **p_svc;
  id v32;
  void *v33;
  void *v34;
  id v35;
  int v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  id v49;
  int v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  uint64_t v57;
  void (**v58)(_QWORD);
  uint64_t v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  id v68;
  void *v69;
  void *v70;
  _QWORD *v71;
  _QWORD *v72;
  id v73;
  id v74;
  _QWORD aBlock[5];

  if (!self->_lastNotifiedDisplayMode)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    self->_lastNotifiedDisplayMode = objc_msgSend(WeakRetained, "displayMode");

  }
  -[UISplitViewControllerClassicImpl _setupUnderBarSeparatorView](self, "_setupUnderBarSeparatorView");
  if (self->_useChangingBoundsLayout)
  {
    v4 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v4, "detailViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_referenceBounds");
      v8 = ceil(v7 * 0.666);

      v9 = ceil(v8 * 0.6);
      v10 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v10, "detailViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;

      if (v18 >= v9 || (*(_QWORD *)&self->_splitViewControllerFlags & 0x300000) != 0x100000)
      {
        -[UISplitViewControllerClassicImpl _detailViewFrame](self, "_detailViewFrame");
        v14 = v21;
        v16 = v22;
        v9 = v23;
        v20 = v24;
      }
      -[UISplitViewControllerClassicImpl _setDetailViewFrame:](self, "_setDetailViewFrame:", v14, v16, v9, v20);
    }
    else if (self->_useChangingBoundsLayout)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __60__UISplitViewControllerClassicImpl___viewWillLayoutSubviews__block_invoke;
      aBlock[3] = &unk_1E16B1B28;
      aBlock[4] = self;
      v58 = (void (**)(_QWORD))_Block_copy(aBlock);
      if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
      {
        +[UIView inheritedAnimationDuration](UIView, "inheritedAnimationDuration");
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v58, 0);
      }
      else
      {
        v58[2](v58);
      }
      if ((*(_QWORD *)&self->_splitViewControllerFlags & 0x300000) == 0x100000)
      {
        -[UISplitViewControllerClassicImpl _setCollapsedState:](self, "_setCollapsedState:", 2);
        self->_useChangingBoundsLayout = 0;
      }

      return;
    }
  }
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "userInterfaceIdiom"))
  {

  }
  else
  {
    v26 = -[UISplitViewControllerClassicImpl _iPhoneShouldUseOverlayIfRegularWidth](self, "_iPhoneShouldUseOverlayIfRegularWidth");

    if (!v26)
    {
      v59 = *(_QWORD *)&self->_splitViewControllerFlags & 0x300000;
      -[UISplitViewControllerClassicImpl _masterViewFrame](self, "_masterViewFrame");
      v61 = v60;
      v63 = v62;
      v65 = v64;
      v67 = v66;
      v68 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v68, "masterViewController");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "view");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setFrame:", v61, v63, v65, v67);

      if (self->_collapsingMasterSnapshotView && !self->_collapsingDetailSnapshotView)
      {
        -[UISplitViewControllerClassicImpl _detailViewFrame](self, "_detailViewFrame");
        -[UISnapshotView setFrame:](self->_collapsingMasterSnapshotView, "setFrame:");
      }
      if (v59 != 0x200000)
      {
        -[UISplitViewControllerClassicImpl _detailViewFrame](self, "_detailViewFrame");
        -[UISplitViewControllerClassicImpl _setDetailViewFrame:](self, "_setDetailViewFrame:");
      }
      return;
    }
  }
  if (!self->_lastPresentedOrientation
    || self->_rotatingFromOrientation
    || (v27 = objc_loadWeakRetained((id *)&self->_svc),
        v28 = objc_msgSend(v27, "interfaceOrientation"),
        lastPresentedOrientation = self->_lastPresentedOrientation,
        v27,
        v28 == lastPresentedOrientation))
  {
    v30 = 0;
  }
  else
  {
    self->_rotatingFromOrientation = self->_lastPresentedOrientation;
    v71 = objc_loadWeakRetained((id *)&self->_svc);
    -[UISplitViewControllerClassicImpl willRotateToInterfaceOrientation:duration:](self, "willRotateToInterfaceOrientation:duration:", v71[32], 0.0);

    v72 = objc_loadWeakRetained((id *)&self->_svc);
    -[UISplitViewControllerClassicImpl willAnimateRotationToInterfaceOrientation:duration:](self, "willAnimateRotationToInterfaceOrientation:duration:", v72[32], 0.0);

    v30 = 1;
  }
  p_svc = &self->_svc;
  v32 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v32, "masterViewController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_popoverController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v34, "isPopoverVisible") & 1) == 0)
  {

    if (!v30)
      goto LABEL_23;
LABEL_21:
    if ((*(_QWORD *)&self->_splitViewControllerFlags & 0x2E0) == 0x220)
    {
      v37 = objc_loadWeakRetained(&self->_delegate);
      v38 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v38, "masterViewController");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "splitViewController:willShowViewController:invalidatingBarButtonItem:", v38, v39, self->_barButtonItem);

    }
    goto LABEL_23;
  }
  v35 = objc_loadWeakRetained((id *)&self->_svc);
  v36 = objc_msgSend(v35, "_isRotating");

  if (!v36)
    goto LABEL_24;
  if (v30)
    goto LABEL_21;
LABEL_23:
  -[UISplitViewControllerClassicImpl _updateMasterViewControllerFrame](self, "_updateMasterViewControllerFrame");
LABEL_24:
  if (v30)
  {
    -[UISplitViewControllerClassicImpl didRotateFromInterfaceOrientation:](self, "didRotateFromInterfaceOrientation:", self->_lastPresentedOrientation);
    self->_rotatingFromOrientation = 0;
    v40 = objc_loadWeakRetained((id *)&self->_svc);
    self->_lastPresentedOrientation = objc_msgSend(v40, "interfaceOrientation");

  }
  -[UISplitViewControllerClassicImpl _detailViewFrame](self, "_detailViewFrame");
  v45 = v41;
  v46 = v42;
  v47 = v43;
  v48 = v44;
  if (!self->_useChangingBoundsLayout)
    -[UISplitViewControllerClassicImpl _setDetailViewFrame:](self, "_setDetailViewFrame:", v41, v42, v43, v44);
  v49 = objc_loadWeakRetained((id *)&self->_svc);
  v50 = objc_msgSend(v49, "_isRotating");

  if (v50)
  {
    v51 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v51, "detailViewController");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "childModalViewController");
    v73 = (id)objc_claimAutoreleasedReturnValue();

    v53 = v73;
    if (v73)
    {
      while (1)
      {
        objc_msgSend(v53, "presentationController", v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v54, "shouldPresentInFullscreen");

        if ((v55 & 1) != 0)
          break;
        objc_msgSend(v74, "view");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setFrame:", v45, v46, v47, v48);

        objc_msgSend(v74, "presentedViewController");
        v57 = objc_claimAutoreleasedReturnValue();

        v53 = (void *)v57;
        if (!v57)
          goto LABEL_42;
      }
      v53 = v74;
LABEL_42:

    }
  }
}

void *__60__UISplitViewControllerClassicImpl___viewWillLayoutSubviews__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  void *result;
  double v14;
  double v15;
  double v16;
  double v17;
  double MaxX;
  double v19;
  _QWORD *v20;
  uint64_t v21;
  int v22;
  unint64_t v23;
  double v24;
  CGRect v25;
  CGRect v26;

  objc_msgSend(*(id *)(a1 + 32), "_masterViewFrame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "masterViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_updateControlledViewsToFrame:", v3, v5, v7, v9);

  v12 = *(_QWORD *)(a1 + 32);
  result = *(void **)(v12 + 72);
  if (result && *(_QWORD *)(v12 + 80))
  {
    objc_msgSend(result, "frame");
    v15 = v14;
    v17 = v16;
    if (objc_msgSend(*(id *)(a1 + 32), "_layoutPrimaryOnRight"))
    {
      v25.origin.x = v3;
      v25.origin.y = v5;
      v25.size.width = v7;
      v25.size.height = v9;
      MaxX = CGRectGetMaxX(v25);
    }
    else
    {
      MaxX = v3 - v15;
    }
    v19 = v17 + 50.0;
    v20 = *(_QWORD **)(a1 + 32);
    v21 = v20[42];
    v22 = objc_msgSend(v20, "_layoutPrimaryOnRight");
    v23 = (unint64_t)(v21 & 0x80000000) >> 31;
    if (v22)
      LODWORD(v23) = (int)v21 >= 0;
    v24 = v5;
    if ((_DWORD)v23 == 1)
    {
      v26.origin.x = v3;
      v26.origin.y = v5;
      v26.size.width = v7;
      v26.size.height = v9;
      v24 = CGRectGetMaxY(v26) - v19;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setFrame:", MaxX, v24, v15, v19);
    return (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setFrame:", v3, v5, v7, v9);
  }
  return result;
}

- (CGRect)_masterViewFrame
{
  id WeakRetained;
  void *v4;
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
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[UISplitViewControllerClassicImpl _masterViewFrame:](self, "_masterViewFrame:");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_masterViewFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  _BOOL4 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UISplitViewControllerClassicImpl _primaryColumnWidthForSize:](self, "_primaryColumnWidthForSize:", a3.size.width, a3.size.height);
  v9 = v8;
  if (-[UISplitViewControllerClassicImpl _isMasterViewShown](self, "_isMasterViewShown"))
    v10 = 0.0;
  else
    v10 = -v9;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v11 = CGRectGetHeight(v20);
  if (-[UISplitViewControllerClassicImpl _layoutPrimaryOnRight](self, "_layoutPrimaryOnRight"))
  {
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v12 = CGRectGetWidth(v21);
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      -[UISplitViewControllerClassicImpl _screenSizeInMainScene:](self, "_screenSizeInMainScene:", 1);
      v12 = v13;
    }
    v14 = -[UISplitViewControllerClassicImpl _isMasterViewShown](self, "_isMasterViewShown");
    v15 = 0.0;
    if (v14)
      v15 = v9;
    v10 = v12 - v15;
  }
  v16 = 0.0;
  v17 = v10;
  v18 = v9;
  v19 = v11;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v16;
  result.origin.x = v17;
  return result;
}

- (double)_primaryColumnWidthForSize:(CGSize)a3 isCompact:(BOOL)a4
{
  double width;
  double height;
  UISplitViewController **p_svc;
  id WeakRetained;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  double v28;
  id v29;
  double v30;
  id v31;
  double v32;
  id v33;
  double v34;
  id v35;
  double v36;
  id v38;
  double v39;

  width = a3.width;
  if (a4)
    return width;
  height = a3.height;
  if (!dyld_program_sdk_at_least())
    return 320.0;
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "preferredPrimaryColumnWidthFraction");
  v10 = v9;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  if ((v12 & 0xFFFFFFFFFFFFFFFBLL) != 1 || !dyld_program_sdk_at_least())
  {
    if (-[UISplitViewControllerClassicImpl _currentInterfaceIdiom](self, "_currentInterfaceIdiom")
      || !dyld_program_sdk_at_least()
      || v10 != -3.40282347e38)
    {
      if (height <= 1210.0 && width <= 1210.0)
        v14 = 320.0;
      else
        v14 = 375.0;
      if (v10 == -3.40282347e38)
      {
        v17 = 0.4;
      }
      else
      {
        v27 = objc_loadWeakRetained((id *)&self->_svc);
        objc_msgSend(v27, "preferredPrimaryColumnWidthFraction");
        v17 = v28;

      }
      v15 = ceil(width * v17);
      goto LABEL_29;
    }
    v18 = objc_loadWeakRetained((id *)&self->_svc);
    v19 = objc_msgSend(v18, "displayMode");

    if (v19 == 2)
      v14 = 320.0;
    else
      v14 = 375.0;
    goto LABEL_23;
  }
  -[UISplitViewControllerClassicImpl _defaultMaximumPrimaryColumnWidthForSize:](self, "_defaultMaximumPrimaryColumnWidthForSize:", width, height);
  v14 = v13;
  if (v10 == -3.40282347e38)
  {
    v15 = v13;
    if (!dyld_program_sdk_at_least())
      goto LABEL_29;
LABEL_23:
    v20 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v20, "viewIfLoaded");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "safeAreaInsets");
    v23 = v22;
    v25 = v24;

    if (-[UISplitViewControllerClassicImpl _layoutPrimaryOnRight](self, "_layoutPrimaryOnRight"))
      v26 = v25;
    else
      v26 = v23;
    v15 = v14 + v26;
    v14 = v14 + v26;
    goto LABEL_29;
  }
  v38 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v38, "preferredPrimaryColumnWidthFraction");
  v15 = ceil(width * v39);

LABEL_29:
  v29 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v29, "minimumPrimaryColumnWidth");
  if (v30 == -3.40282347e38)
  {
    width = 0.0;
  }
  else
  {
    v31 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v31, "minimumPrimaryColumnWidth");
    width = v32;

  }
  if (width < v15)
    width = v15;
  v33 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v33, "maximumPrimaryColumnWidth");
  if (v34 != -3.40282347e38)
  {
    v35 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v35, "maximumPrimaryColumnWidth");
    v14 = v36;

  }
  if (v14 < width)
    return v14;
  return width;
}

- (BOOL)_iPhoneShouldUseOverlayIfRegularWidth
{
  return !-[UISplitViewControllerClassicImpl _isBasicallyHorizontallyCompact](self, "_isBasicallyHorizontallyCompact")
      && -[UISplitViewControllerClassicImpl _iPhoneShouldUseOverlayInCurrentEnvironment](self, "_iPhoneShouldUseOverlayInCurrentEnvironment");
}

- (void)_layoutContainerViewDidMoveToWindow:(id)a3
{
  void *v4;
  void (**v5)(void);
  uint64_t v6;
  _UIViewControllerNullAnimationTransitionCoordinator *v7;
  UITraitCollection *traitCollectionWhenRemovedFromWindow;

  if (a3)
  {
    -[UISplitViewControllerClassicImpl _updateTargetDisplayMode](self, "_updateTargetDisplayMode");
    if (-[UISplitViewControllerClassicImpl _isBasicallyHorizontallyCompact](self, "_isBasicallyHorizontallyCompact"))
    {
      if ((*(_QWORD *)&self->_splitViewControllerFlags & 0x300000) == 0x100000)
        -[UISplitViewControllerClassicImpl _prepareForCompactLayout](self, "_prepareForCompactLayout");
    }
    else if (self->_traitCollectionWhenRemovedFromWindow)
    {
      v6 = (*(_QWORD *)&self->_splitViewControllerFlags >> 20) & 3;
      if (v6)
      {
        if (v6 != 3 && dyld_program_sdk_at_least())
        {
          v7 = objc_alloc_init(_UIViewControllerNullAnimationTransitionCoordinator);
          -[UISplitViewControllerClassicImpl _animateTransitionFromTraitCollection:withTransitionCoordinator:](self, "_animateTransitionFromTraitCollection:withTransitionCoordinator:", self->_traitCollectionWhenRemovedFromWindow, v7);
          -[_UIViewControllerNullAnimationTransitionCoordinator _runAlongsideAnimations](v7, "_runAlongsideAnimations");
          -[_UIViewControllerNullAnimationTransitionCoordinator _runAlongsideCompletionsAfterCommit](v7, "_runAlongsideCompletionsAfterCommit");

        }
      }
    }
    if ((*((_BYTE *)&self->_splitViewControllerFlags + 3) & 0x20) != 0)
      -[UISplitViewControllerClassicImpl _presentMasterViewController:](self, "_presentMasterViewController:", 0);
    traitCollectionWhenRemovedFromWindow = self->_traitCollectionWhenRemovedFromWindow;
    self->_traitCollectionWhenRemovedFromWindow = 0;

  }
  else
  {
    -[UISplitViewControllerClassicImpl _clearPreventRotationHook](self, "_clearPreventRotationHook");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[UISplitViewControllerClassicImpl _clearPreventRotationHook](self, "_clearPreventRotationHook");
      v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v5[2]();

      -[UISplitViewControllerClassicImpl _setClearPreventRotationHook:](self, "_setClearPreventRotationHook:", 0);
    }
  }
}

- (void)_prepareForCompactLayout
{
  UISplitViewController **p_svc;
  id WeakRetained;
  id v5;
  _DWORD *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  unsigned int v16;
  _DWORD *v17;
  _QWORD v18[5];
  id v19;
  id v20;

  self->_useChangingBoundsLayout = 1;
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "masterViewController");
  v17 = (_DWORD *)objc_claimAutoreleasedReturnValue();

  v5 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v5, "detailViewController");
  v6 = (_DWORD *)objc_claimAutoreleasedReturnValue();

  -[UISplitViewControllerClassicImpl _primaryViewControllerForCollapsing](self, "_primaryViewControllerForCollapsing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISplitViewControllerClassicImpl _secondaryViewControllerForCollapsing](self, "_secondaryViewControllerForCollapsing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[UISplitViewControllerClassicImpl _setPreservedDetailController:](self, "_setPreservedDetailController:", v8);
    v9 = objc_loadWeakRetained((id *)p_svc);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __60__UISplitViewControllerClassicImpl__prepareForCompactLayout__block_invoke;
    v18[3] = &unk_1E16B47A8;
    v18[4] = self;
    v19 = v7;
    v20 = v8;
    +[UIViewController _withDisabledAppearanceTransitionsForVisibleDescendantsOf:perform:](UIViewController, "_withDisabledAppearanceTransitionsForVisibleDescendantsOf:perform:", v9, v18);

    if (dyld_program_sdk_at_least())
    {
      if (v17)
      {
        objc_msgSend(v17, "_existingView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "window");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {

        }
        else
        {
          v13 = ((v17[92] >> 1) & 3) - 1;

          if (v13 <= 1)
          {
            -[UIViewController __viewWillDisappear:]((uint64_t)v17, 0);
            -[UIViewController __viewDidDisappear:]((uint64_t)v17, 0);
          }
        }
      }
      if (v6)
      {
        objc_msgSend(v6, "_existingView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "window");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {

        }
        else
        {
          v16 = ((v6[92] >> 1) & 3) - 1;

          if (v16 <= 1)
          {
            -[UIViewController __viewWillDisappear:]((uint64_t)v6, 0);
            -[UIViewController __viewDidDisappear:]((uint64_t)v6, 0);
          }
        }
      }
    }

  }
  else
  {
    -[UISplitViewControllerClassicImpl _preservedDetailController](self, "_preservedDetailController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      -[UISplitViewControllerClassicImpl _setPreservedDetailController:](self, "_setPreservedDetailController:", 0);
  }

}

- (void)_setPreservedDetailController:(id)a3
{
  objc_storeStrong((id *)&self->__preservedDetailController, a3);
}

- (id)_secondaryViewControllerForCollapsing
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "detailViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_primaryViewControllerForCollapsing
{
  id v3;
  id v4;
  void *v5;
  id WeakRetained;

  if ((*((_BYTE *)&self->_splitViewControllerFlags + 2) & 4) == 0
    || (v3 = objc_loadWeakRetained(&self->_delegate),
        v4 = objc_loadWeakRetained((id *)&self->_svc),
        objc_msgSend(v3, "primaryViewControllerForCollapsingSplitViewController:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v5))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "masterViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (UIViewController)_preservedDetailController
{
  return self->__preservedDetailController;
}

- (void)_layoutContainerViewWillMoveToWindow:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _DWORD *v13;
  unsigned int v14;
  id WeakRetained;
  UITraitCollection *v16;
  UITraitCollection *traitCollectionWhenRemovedFromWindow;
  id v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;

  v4 = a3;
  if (-[UISplitViewControllerClassicImpl _isBasicallyHorizontallyCompact](self, "_isBasicallyHorizontallyCompact")
    && ((*(_QWORD *)&self->_splitViewControllerFlags >> 20) & 3uLL) - 1 >= 2)
  {
    -[UISplitViewControllerClassicImpl _setCollapsedState:](self, "_setCollapsedState:", 1);
  }
  if (!v4)
  {
    if (-[UISplitViewControllerClassicImpl _isMasterPopoverVisible](self, "_isMasterPopoverVisible"))
      *(_QWORD *)&self->_splitViewControllerFlags |= 0x20000000uLL;
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "traitCollection");
    v16 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
    traitCollectionWhenRemovedFromWindow = self->_traitCollectionWhenRemovedFromWindow;
    self->_traitCollectionWhenRemovedFromWindow = v16;

    v18 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v18, "_window");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __73__UISplitViewControllerClassicImpl__layoutContainerViewWillMoveToWindow___block_invoke;
    v21[3] = &unk_1E16B1B28;
    v5 = v19;
    v22 = v5;
    -[UISplitViewControllerClassicImpl _setClearPreventRotationHook:](self, "_setClearPreventRotationHook:", v21);
    if (dyld_program_sdk_at_least()
      && -[UISplitViewControllerClassicImpl _isMasterPopoverVisible](self, "_isMasterPopoverVisible"))
    {
      -[UISplitViewControllerClassicImpl _dismissMasterViewController:](self, "_dismissMasterViewController:", 0);
    }

    goto LABEL_18;
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __73__UISplitViewControllerClassicImpl__layoutContainerViewWillMoveToWindow___block_invoke_2;
  v20[3] = &unk_1E16B2268;
  v20[4] = self;
  objc_msgSend(v4, "_setShouldPreventRotationHook:", v20);
  v5 = objc_loadWeakRetained((id *)&self->_svc);
  if (objc_msgSend(v5, "displayMode") != 2)
  {
LABEL_18:

    goto LABEL_19;
  }
  v6 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v6, "masterViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v10, "view");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v9 == (void *)v11)
  {

LABEL_17:
    goto LABEL_18;
  }
  v12 = (void *)v11;
  v13 = objc_loadWeakRetained((id *)&self->_svc);
  if (!v13)
  {

    goto LABEL_17;
  }
  v14 = ((v13[92] >> 1) & 3) - 1;

  if (v14 <= 1)
    -[UISplitViewControllerClassicImpl _showMasterViewAnimated:](self, "_showMasterViewAnimated:", 0);
LABEL_19:

}

- (double)_primaryColumnWidthForSize:(CGSize)a3
{
  double result;

  -[UISplitViewControllerClassicImpl _primaryColumnWidthForSize:isCompact:](self, "_primaryColumnWidthForSize:isCompact:", -[UISplitViewControllerClassicImpl _isBasicallyHorizontallyCompact](self, "_isBasicallyHorizontallyCompact"), a3.width, a3.height);
  return result;
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  id WeakRetained;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  v6 = a3;
  v7 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  if (!-[UISplitViewControllerClassicImpl _shouldUseRelativeInsets](self, "_shouldUseRelativeInsets"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "_contentOverlayInsets");
    v9 = v11;
    v7 = v12;

    -[UISplitViewControllerClassicImpl _contentMarginForChildViewController:](self, "_contentMarginForChildViewController:", v6);
    v8 = v13;
    *a4 = 1;
  }

  v14 = v9;
  v15 = v8;
  v16 = v7;
  v17 = v8;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (double)_contentMarginForChildViewController:(id)a3
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a3, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIViewController _horizontalContentMarginForView:](UIViewController, "_horizontalContentMarginForView:", v3);
  v5 = v4;

  return v5;
}

- (BOOL)_shouldUseRelativeInsets
{
  UISplitViewController **p_svc;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  char v8;

  if (+[UIDevice _hasHomeButton](UIDevice, "_hasHomeButton")
    || !-[UISplitViewControllerClassicImpl _isBasicallyHorizontallyCompact](self, "_isBasicallyHorizontallyCompact"))
  {
    return 0;
  }
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  if (objc_msgSend(WeakRetained, "isViewLoaded"))
  {
    v5 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "_isHostedInAnotherProcess");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_isBasicallyHorizontallyCompact
{
  id WeakRetained;
  BOOL v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  if (objc_msgSend(WeakRetained, "_horizontalSizeClass") == 1)
  {
    v3 = 1;
  }
  else
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "userInterfaceIdiom") == 4;

  }
  return v3;
}

- (void)_changeToDisplayMode:(int64_t)a3 forCurrentOrientationOnly:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  void *v11;
  char v12;
  void *v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL8 v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  _DWORD *v24;
  unsigned int v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  _QWORD v30[5];

  v4 = a4;
  v7 = -[UISplitViewControllerClassicImpl _isMasterViewShown](self, "_isMasterViewShown");
  v8 = 1;
  switch(a3)
  {
    case 0:
      -[UISplitViewControllerClassicImpl _defaultDisplayModes](self, "_defaultDisplayModes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
      a3 = objc_msgSend(WeakRetained, "displayMode");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "containsObject:", v11);

      if ((v12 & 1) == 0)
      {
        objc_msgSend(v9, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        a3 = objc_msgSend(v13, "integerValue");

      }
      goto LABEL_5;
    case 1:
    case 3:
      break;
    case 2:
      v8 = 2;
      a3 = 2;
      break;
    default:
LABEL_5:
      v8 = 0;
      break;
  }
  -[UISplitViewControllerClassicImpl _displayModeWillChangeTo:](self, "_displayModeWillChangeTo:", a3);
  if (v4)
  {
    -[UISplitViewControllerClassicImpl _setPrimaryHidingStateForCurrentOrientation:](self, "_setPrimaryHidingStateForCurrentOrientation:", v8);
  }
  else
  {
    -[UISplitViewControllerClassicImpl _setPrimaryHidingStateForCurrentOrientation:](self, "_setPrimaryHidingStateForCurrentOrientation:", 0);
    -[UISplitViewControllerClassicImpl _setPrimaryHidingState:](self, "_setPrimaryHidingState:", v8);
  }
  v14 = -[UISplitViewControllerClassicImpl _isMasterPopoverVisible](self, "_isMasterPopoverVisible");
  if (a3 == 3)
  {
    if (!v14)
    {
      if (v7)
      {
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __83__UISplitViewControllerClassicImpl__changeToDisplayMode_forCurrentOrientationOnly___block_invoke;
        v30[3] = &unk_1E16B1B28;
        v30[4] = self;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v30);
      }
      else
      {
        -[UISplitViewControllerClassicImpl _presentMasterViewController:](self, "_presentMasterViewController:", +[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"));
      }
    }
    goto LABEL_27;
  }
  if (v14)
  {
    v15 = +[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock");
    v16 = a3 == 1 && v15;
    -[UISplitViewControllerClassicImpl _dismissMasterViewController:](self, "_dismissMasterViewController:", v16);
  }
  if (a3 == 2)
  {
    v17 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v17, "masterViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "superview");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v21, "view");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v20 == (void *)v22)
    {

    }
    else
    {
      v23 = (void *)v22;
      v24 = objc_loadWeakRetained((id *)&self->_svc);
      if (v24)
      {
        v25 = ((v24[92] >> 1) & 3) - 1;

        if (v25 <= 1)
          -[UISplitViewControllerClassicImpl _showMasterViewAnimated:](self, "_showMasterViewAnimated:", +[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"));
        goto LABEL_27;
      }

    }
  }
LABEL_27:
  v26 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v26, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setNeedsLayout");

  if (+[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"))
  {
    v28 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v28, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "layoutBelowIfNeeded");

  }
  -[UISplitViewControllerClassicImpl _displayModeDidChange](self, "_displayModeDidChange");
}

- (void)_setupUnderBarSeparatorView
{
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v5;
  void *v6;
  UIView *underBarSeparatorView;
  UIView *v8;
  id v9;
  void *v10;
  UIView *v11;
  UIView *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIView *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;

  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  underBarSeparatorView = self->_underBarSeparatorView;
  if (v6)
  {
    if (!underBarSeparatorView)
    {
      v8 = [UIView alloc];
      v9 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v9, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "frame");
      v11 = -[UIView initWithFrame:](v8, "initWithFrame:", 0.0, 0.0);
      v12 = self->_underBarSeparatorView;
      self->_underBarSeparatorView = v11;

      v13 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v13, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSubview:", self->_underBarSeparatorView);

    }
    v15 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sendSubviewToBack:", self->_underBarSeparatorView);

    if (dyld_program_sdk_at_least())
    {
      v17 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v17, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "backgroundColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_underBarSeparatorView, "setBackgroundColor:", v19);

    }
    else
    {
      v35 = 0.0;
      v36 = 0.0;
      v34 = 0.0;
      v21 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v21, "view", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "backgroundColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "getRed:green:blue:alpha:", &v36, &v35, &v34, &v33);

      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v36 + (1.0 - v36) * 0.400000006, v35 + (1.0 - v35) * 0.400000006, v34 + (1.0 - v34) * 0.400000006, 1.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_underBarSeparatorView, "setBackgroundColor:", v17);
    }

    v24 = objc_loadWeakRetained((id *)p_svc);
    if (objc_msgSend(v24, "isCollapsed"))
    {

    }
    else
    {
      v25 = objc_loadWeakRetained((id *)p_svc);
      v26 = objc_msgSend(v25, "displayMode");

      if (v26 == 2)
      {
        v27 = objc_loadWeakRetained((id *)p_svc);
        objc_msgSend(v27, "masterViewController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "_topBarHeight");

        v29 = objc_loadWeakRetained((id *)p_svc);
        objc_msgSend(v29, "detailViewController");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "_topBarHeight");

      }
    }
    v31 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v31, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bounds");
    -[UIView setFrame:](self->_underBarSeparatorView, "setFrame:", 0.0, 0.0);

  }
  else if (underBarSeparatorView)
  {
    -[UIView removeFromSuperview](underBarSeparatorView, "removeFromSuperview");
    v20 = self->_underBarSeparatorView;
    self->_underBarSeparatorView = 0;

  }
}

- (id)detailViewController
{
  UISplitViewController **p_svc;
  id WeakRetained;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v4 = objc_msgSend(WeakRetained, "childViewControllersCount");

  if (v4 < 2)
  {
    v7 = 0;
  }
  else
  {
    v5 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v5, "mutableChildViewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (int64_t)displayMode
{
  if (!-[UISplitViewControllerClassicImpl _isMasterViewShown](self, "_isMasterViewShown"))
    return 1;
  if (-[UISplitViewControllerClassicImpl _isMasterPopoverVisible](self, "_isMasterPopoverVisible")
    && !-[UIPopoverController _isDismissing](self->_hiddenPopoverController, "_isDismissing"))
  {
    return 3;
  }
  return 2;
}

- (BOOL)_isMasterViewShown
{
  int64_t v3;
  int64_t v4;
  _BOOL4 v5;

  if (((*(_QWORD *)&self->_splitViewControllerFlags >> 20) & 3uLL) - 1 >= 2
    && (v3 = -[UISplitViewControllerClassicImpl _effectivePrimaryHidingState](self, "_effectivePrimaryHidingState"),
        v3 != 2)
    && (v3
     || ((v4 = -[UISplitViewControllerClassicImpl _currentInterfaceIdiom](self, "_currentInterfaceIdiom"), v4 == 1)
      || !v4
      && -[UISplitViewControllerClassicImpl _iPhoneShouldUseOverlayIfRegularWidth](self, "_iPhoneShouldUseOverlayIfRegularWidth"))&& -[UISplitViewControllerClassicImpl _hidesMasterViewInCurrentOrientation](self, "_hidesMasterViewInCurrentOrientation")))
  {
    v5 = -[UISplitViewControllerClassicImpl _isMasterPopoverVisible](self, "_isMasterPopoverVisible");
    if (v5)
      LOBYTE(v5) = !-[UIPopoverController _isDismissing](self->_hiddenPopoverController, "_isDismissing");
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)_isMasterPopoverVisible
{
  return (*((_BYTE *)&self->_splitViewControllerFlags + 3) & 0x20) != 0
      || -[UIPopoverController isPopoverVisible](self->_hiddenPopoverController, "isPopoverVisible");
}

- (int64_t)_primaryHidingState
{
  return (*(_QWORD *)&self->_splitViewControllerFlags >> 22) & 3;
}

- (int64_t)_effectivePrimaryHidingState
{
  int64_t result;

  result = -[UISplitViewControllerClassicImpl _primaryHidingStateForCurrentOrientation](self, "_primaryHidingStateForCurrentOrientation");
  if (!result)
    return -[UISplitViewControllerClassicImpl _primaryHidingState](self, "_primaryHidingState");
  return result;
}

- (int64_t)_primaryHidingStateForCurrentOrientation
{
  return (*(_QWORD *)&self->_splitViewControllerFlags >> 24) & 3;
}

- (void)_setCollapsedState:(int64_t)a3
{
  char v3;
  UISplitViewControllerClassicImpl *v4;
  UISplitViewController **p_svc;
  id WeakRetained;
  int v7;
  id v8;
  id v9;
  id v10;

  v3 = a3;
  v4 = self;
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v7 = objc_msgSend(WeakRetained, "isCollapsed");

  v4->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&v4->_splitViewControllerFlags & 0xFFFFFFFFFFCFFFFFLL | ((unint64_t)(v3 & 3) << 20));
  v8 = objc_loadWeakRetained((id *)p_svc);
  LODWORD(v4) = objc_msgSend(v8, "isCollapsed");

  if (v7 != (_DWORD)v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("UIViewControllerShowDetailTargetDidChangeNotification"), v9);

  }
}

- (BOOL)isCollapsed
{
  return (*(_QWORD *)&self->_splitViewControllerFlags & 0x300000) == 0x200000;
}

- (int64_t)_currentInterfaceIdiom
{
  id WeakRetained;
  void *v3;
  int64_t v4;
  void *v6;
  int64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 != -1)
    return v4;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  return v7;
}

- (void)setViewControllers:(id)a3
{
  unint64_t v4;
  NSObject *v5;
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  _QWORD *v24;
  id v25;
  int v26;
  _DWORD *v27;
  _BOOL4 v28;
  void *v29;
  _DWORD *v30;
  _BOOL4 v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  id v38;
  id v39;
  int v40;
  _DWORD *v41;
  BOOL v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  UISplitViewControllerClassicImpl *v47;
  UIBarButtonItem *barButtonItem;
  void *v49;
  int v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  NSString *buttonTitle;
  id v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  _BOOL4 v64;
  NSObject *v65;
  _BOOL4 v66;
  UISplitViewControllerClassicImpl *v67;
  id v68;
  void *v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[4];
  id v76;
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
  uint8_t v87[128];
  uint8_t buf[4];
  id v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v70 = a3;
  v67 = self;
  if ((unint64_t)objc_msgSend(v70, "count") >= 2
    && -[UISplitViewControllerClassicImpl _isCollapsed](self, "_isCollapsed"))
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v89 = v70;
        _os_log_fault_impl(&dword_185066000, v65, OS_LOG_TYPE_FAULT, "Too many view controllers assigned to collapsed split view controller: %@", buf, 0xCu);
      }

    }
    else
    {
      v4 = setViewControllers____s_category;
      if (!setViewControllers____s_category)
      {
        v4 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v4, (unint64_t *)&setViewControllers____s_category);
      }
      v5 = *(NSObject **)(v4 + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v89 = v70;
        _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "Too many view controllers assigned to collapsed split view controller: %@", buf, 0xCu);
      }
    }
  }
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(WeakRetained, "_existingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v9
     && !v67->_useChangingBoundsLayout
     && -[UISplitViewControllerClassicImpl _isBasicallyHorizontallyCompact](v67, "_isBasicallyHorizontallyCompact");

  -[UISplitViewControllerClassicImpl _setMasterOverrideTraitCollectionActive:](v67, "_setMasterOverrideTraitCollectionActive:", 0);
  v10 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v10, "mutableChildViewControllers");
  v68 = (id)objc_claimAutoreleasedReturnValue();

  v11 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v11, "childViewControllers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68 == v70)
  {
    -[UISplitViewControllerClassicImpl _setMasterOverrideTraitCollectionActive:](v67, "_setMasterOverrideTraitCollectionActive:", 1);
  }
  else
  {
    v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v12);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v70);
    objc_msgSend(v13, "intersectSet:", v69);
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v82;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v82 != v16)
            objc_enumerationMutation(v14);
          v18 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * i);
          v19 = objc_msgSend(v12, "indexOfObject:", v18);
          if (v19 == objc_msgSend(v70, "indexOfObject:", v18))
            objc_msgSend(v69, "removeObject:", v18);
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
      }
      while (v15);
    }

    objc_msgSend(v14, "minusSet:", v69);
    objc_msgSend(v68, "removeAllObjects");
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v20 = v12;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v78;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v78 != v22)
            objc_enumerationMutation(v20);
          v24 = *(_QWORD **)(*((_QWORD *)&v77 + 1) + 8 * j);
          if ((objc_msgSend(v14, "containsObject:", v24) & 1) == 0)
          {
            objc_msgSend(v24, "willMoveToParentViewController:", 0);
            objc_msgSend(v24, "removeFromParentViewController");
            v25 = objc_loadWeakRetained((id *)p_svc);
            v26 = objc_msgSend(v25, "isViewLoaded");

            if (v26)
            {
              if ((objc_msgSend(v24, "appearanceTransitionsAreDisabled") & 1) == 0)
              {
                v27 = objc_loadWeakRetained((id *)p_svc);
                if (v27)
                {
                  v28 = ((v27[92] >> 1) & 3u) - 1 < 2;

                  if (v28)
                    -[UIViewController __viewWillDisappear:]((uint64_t)v24, 0);
                }
              }
              objc_msgSend(v24, "view");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "removeFromSuperview");

              if ((objc_msgSend(v24, "appearanceTransitionsAreDisabled") & 1) == 0
                && (v30 = objc_loadWeakRetained((id *)p_svc)) != 0
                && (v31 = ((v30[92] >> 1) & 3u) - 1 < 2, v30, v31))
              {
                objc_initWeak((id *)buf, v24);
                v75[0] = MEMORY[0x1E0C809B0];
                v75[1] = 3221225472;
                v75[2] = __55__UISplitViewControllerClassicImpl_setViewControllers___block_invoke;
                v75[3] = &unk_1E16B3F40;
                objc_copyWeak(&v76, (id *)buf);
                objc_msgSend(v24, "setAfterAppearanceBlock:", v75);
                objc_msgSend((id)UIApp, "_addAfterCACommitBlockForViewController:", v24);
                objc_destroyWeak(&v76);
                objc_destroyWeak((id *)buf);
              }
              else if ((objc_msgSend(v24, "appearanceTransitionsAreDisabled") & 1) == 0)
              {
                v24[46] &= 0xFFFFFFFFFFFFFFF9;
              }
              objc_msgSend(v24, "view");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "_setSpeedBumpEdges:", 0);

            }
          }
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
      }
      while (v21);
    }

    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v33 = v70;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v72;
      do
      {
        for (k = 0; k != v34; ++k)
        {
          if (*(_QWORD *)v72 != v35)
            objc_enumerationMutation(v33);
          v37 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * k);
          if ((objc_msgSend(v14, "containsObject:", v37) & 1) != 0)
          {
            objc_msgSend(v68, "addObject:", v37);
          }
          else
          {
            v38 = objc_loadWeakRetained((id *)p_svc);
            objc_msgSend(v38, "addChildViewController:", v37);

            objc_msgSend(v37, "setDefinesPresentationContext:", 1);
            objc_msgSend(v37, "setNeedsDidMoveCleanup:", 1);
          }
        }
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
      }
      while (v34);
    }

    v39 = objc_loadWeakRetained((id *)p_svc);
    v40 = objc_msgSend(v39, "isViewLoaded");

    if (v40)
    {
      if (objc_msgSend(v33, "count") == 1)
      {
        objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
        v41 = (_DWORD *)objc_claimAutoreleasedReturnValue();
        if (!v41 || (v42 = ((v41[92] >> 1) & 3u) - 1 < 2, v41, !v42))
        {
          objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "removeObject:", v43);

        }
      }
      -[UISplitViewControllerClassicImpl _loadNewSubviews:](v67, "_loadNewSubviews:", v14);
      v44 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v44, "view");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setNeedsLayout");

    }
    v46 = objc_msgSend(v33, "count");
    v47 = v67;
    if (v46)
    {
      barButtonItem = v67->_barButtonItem;
      if (barButtonItem)
      {
        -[UIBarButtonItem title](barButtonItem, "title");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "isEqualToString:", v67->_buttonTitle);

        v47 = v67;
        if (v50)
        {
          v51 = objc_loadWeakRetained((id *)p_svc);
          objc_msgSend(v51, "masterViewController");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "title");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIBarButtonItem setTitle:](v67->_barButtonItem, "setTitle:", v53);

          -[UIBarButtonItem title](v67->_barButtonItem, "title");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v54, "copy");
          buttonTitle = v67->_buttonTitle;
          v67->_buttonTitle = (NSString *)v55;

          v47 = v67;
        }
      }
    }
    -[UISplitViewControllerClassicImpl _updateDisplayModeButtonItem](v47, "_updateDisplayModeButtonItem");
    if (!-[UISplitViewControllerClassicImpl _defersUpdateDelegateHiddenMasterAspectRatios](v67, "_defersUpdateDelegateHiddenMasterAspectRatios"))-[UISplitViewControllerClassicImpl _updateDelegateHiddenMasterAspectRatios](v67, "_updateDelegateHiddenMasterAspectRatios");
    if (objc_msgSend(v33, "count"))
    {
      v57 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v57, "masterViewController");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "view");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "_setSpeedBumpEdges:", 8);

    }
    v60 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v60, "_didChangeDeepestActionResponder");

    -[UISplitViewControllerClassicImpl _setMasterOverrideTraitCollectionActive:](v67, "_setMasterOverrideTraitCollectionActive:", 1);
    if (v66)
    {
      -[UISplitViewControllerClassicImpl _prepareForCompactLayout](v67, "_prepareForCompactLayout");
      goto LABEL_72;
    }
  }
  v61 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v61, "_existingView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "window");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v63 == 0;

  if (v64)
    -[UISplitViewControllerClassicImpl _setCollapsedState:](v67, "_setCollapsedState:", 0);
LABEL_72:

}

- (void)_setMasterOverrideTraitCollectionActive:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v3 = a3;
  if (-[UISplitViewControllerClassicImpl _hasMasterViewController](self, "_hasMasterViewController"))
  {
    if (v3)
    {
      +[UITraitCollection traitCollectionWithHorizontalSizeClass:](UITraitCollection, "traitCollectionWithHorizontalSizeClass:", 1);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    v8 = (id)v5;
    v6 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v6, "masterViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOverrideTraitCollection:forChildViewController:", v8, v7);

  }
}

- (void)_addOrRemovePopoverPresentationGestureRecognizer
{
  id WeakRetained;
  void *v4;
  UIGestureRecognizer *v5;
  UIGestureRecognizer *popoverPresentationGestureRecognizer;
  id v7;
  void *v8;
  int64_t v9;
  _BOOL8 v10;
  id v11;
  void *v12;
  UIGestureRecognizer *v13;
  id v14;

  if (-[UISplitViewControllerClassicImpl _effectivePresentsWithGesture](self, "_effectivePresentsWithGesture"))
  {
    if (-[UISplitViewControllerClassicImpl _hasMasterViewController](self, "_hasMasterViewController"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(WeakRetained, "masterViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISplitViewControllerClassicImpl _setupHiddenPopoverControllerWithViewController:](self, "_setupHiddenPopoverControllerWithViewController:", v4);

    }
    if (self->_popoverPresentationGestureRecognizer
      || (-[UIPopoverController _gestureRecognizerForPresentationFromEdge:](self->_hiddenPopoverController, "_gestureRecognizerForPresentationFromEdge:", -[UISplitViewControllerClassicImpl _targetEdgeForPopover](self, "_targetEdgeForPopover")), v5 = (UIGestureRecognizer *)objc_claimAutoreleasedReturnValue(), popoverPresentationGestureRecognizer = self->_popoverPresentationGestureRecognizer, self->_popoverPresentationGestureRecognizer = v5, popoverPresentationGestureRecognizer, self->_popoverPresentationGestureRecognizer))
    {
      v7 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v7, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addGestureRecognizer:", self->_popoverPresentationGestureRecognizer);

      v9 = -[UISplitViewControllerClassicImpl _effectiveTargetDisplayMode](self, "_effectiveTargetDisplayMode");
      if (v9 == 1)
      {
        v7 = objc_loadWeakRetained((id *)&self->_svc);
        if (objc_msgSend(v7, "displayMode") == 3)
        {
          v10 = 1;
LABEL_18:

          goto LABEL_19;
        }
        if (-[UISplitViewControllerClassicImpl _effectiveTargetDisplayMode](self, "_effectiveTargetDisplayMode") != 3)
        {
          v10 = 0;
          goto LABEL_18;
        }
      }
      else if (-[UISplitViewControllerClassicImpl _effectiveTargetDisplayMode](self, "_effectiveTargetDisplayMode") != 3)
      {
        v10 = 0;
LABEL_19:
        -[UIPopoverController _setGesturesEnabled:](self->_hiddenPopoverController, "_setGesturesEnabled:", v10);
        return;
      }
      v14 = objc_loadWeakRetained((id *)&self->_svc);
      v10 = objc_msgSend(v14, "displayMode") == 1;

      if (v9 != 1)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else if (self->_popoverPresentationGestureRecognizer)
  {
    v11 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeGestureRecognizer:", self->_popoverPresentationGestureRecognizer);

    v13 = self->_popoverPresentationGestureRecognizer;
    self->_popoverPresentationGestureRecognizer = 0;

  }
}

- (BOOL)_hasMasterViewController
{
  UISplitViewController **p_svc;
  id WeakRetained;
  id v4;
  void *v5;
  BOOL v6;

  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  if (objc_msgSend(WeakRetained, "childViewControllersCount"))
  {
    v4 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v4, "masterViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)masterViewController
{
  UISplitViewController **p_svc;
  id WeakRetained;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD block[5];

  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v5 = objc_msgSend(WeakRetained, "childViewControllersCount");

  if (v5 < 1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__UISplitViewControllerClassicImpl_masterViewController__block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    if (masterViewController_once == -1)
    {
      return 0;
    }
    else
    {
      dispatch_once(&masterViewController_once, block);
      return 0;
    }
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v6, "mutableChildViewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
}

- (BOOL)_effectivePresentsWithGesture
{
  UISplitViewController **p_svc;
  id WeakRetained;
  BOOL v5;
  id v6;
  id v7;

  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  if (objc_msgSend(WeakRetained, "presentsWithGesture")
    && ((*(_QWORD *)&self->_splitViewControllerFlags >> 20) & 3uLL) - 1 >= 2)
  {
    v6 = objc_loadWeakRetained((id *)p_svc);
    if (((objc_msgSend(v6, "hidesMasterViewInPortrait") & 1) != 0
       || -[UISplitViewControllerClassicImpl hidesMasterViewInLandscape](self, "hidesMasterViewInLandscape"))
      && ((*((_BYTE *)&self->_splitViewControllerFlags + 1) & 4) != 0 || (dyld_program_sdk_at_least() & 1) != 0))
    {
      v5 = 1;
    }
    else
    {
      v7 = objc_loadWeakRetained((id *)p_svc);
      v5 = objc_msgSend(v7, "preferredDisplayMode") != 0;

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)presentsWithGesture
{
  return self->_presentsWithGesture;
}

- (BOOL)hidesMasterViewInPortrait
{
  if (-[UISplitViewControllerClassicImpl _isHidesMasterInPortraitInvalid](self, "_isHidesMasterInPortraitInvalid"))
    -[UISplitViewControllerClassicImpl _updateDelegateHiddenMasterAspectRatios](self, "_updateDelegateHiddenMasterAspectRatios");
  return (*(_BYTE *)&self->_splitViewControllerFlags >> 3) & 1;
}

- (BOOL)_isHidesMasterInPortraitInvalid
{
  return (*(_BYTE *)&self->_splitViewControllerFlags >> 1) & 1;
}

- (unint64_t)_targetEdgeForPopover
{
  if (-[UISplitViewControllerClassicImpl _layoutPrimaryOnRight](self, "_layoutPrimaryOnRight"))
    return 8;
  else
    return 2;
}

- (BOOL)_layoutPrimaryOnRight
{
  id WeakRetained;
  void *v3;
  int64_t primaryEdge;
  int v6;
  id v7;
  void *v8;

  primaryEdge = self->_primaryEdge;
  if (!primaryEdge)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "_shouldReverseLayoutDirection") & 1) != 0)
    {
      LOBYTE(v6) = 1;
      goto LABEL_10;
    }
    if (self->_primaryEdge != 1)
    {
      LOBYTE(v6) = 0;
      goto LABEL_10;
    }
LABEL_7:
    v7 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "_shouldReverseLayoutDirection") ^ 1;

    if (primaryEdge)
      return v6;
LABEL_10:

    return v6;
  }
  if (primaryEdge == 1)
    goto LABEL_7;
  LOBYTE(v6) = 0;
  return v6;
}

- (void)_setupHiddenPopoverControllerWithViewController:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  UIPopoverController *v7;
  UIPopoverController *hiddenPopoverController;
  UIPopoverController *v9;
  id WeakRetained;
  void *v11;
  void *v12;

  v4 = a3;
  if (!self->_hiddenPopoverController)
  {
    v12 = v4;
    if (!dyld_program_sdk_at_least()
      || (v5 = objc_loadWeakRetained((id *)&self->_svc),
          v6 = objc_msgSend(v5, "childViewControllersCount"),
          v5,
          v4 = v12,
          v6 >= 2))
    {
      v7 = -[UIPopoverController _initWithContentViewController:popoverControllerStyle:]([UIPopoverController alloc], "_initWithContentViewController:popoverControllerStyle:", v12, 1);
      hiddenPopoverController = self->_hiddenPopoverController;
      self->_hiddenPopoverController = v7;

      v9 = self->_hiddenPopoverController;
      WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
      -[UIPopoverController _setManagingSplitViewController:](v9, "_setManagingSplitViewController:", WeakRetained);

      objc_msgSend(v12, "_setPopoverController:", 0);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_popoverWillAppear_, CFSTR("_UIAlertWillAppearNotification"), self->_hiddenPopoverController);

      -[UIPopoverController setPopoverBackgroundViewClass:](self->_hiddenPopoverController, "setPopoverBackgroundViewClass:", objc_opt_class());
      -[UISplitViewControllerClassicImpl _addOrRemovePopoverPresentationGestureRecognizer](self, "_addOrRemovePopoverPresentationGestureRecognizer");
      v4 = v12;
    }
  }

}

- (void)_setDelegateHidesMaster:(BOOL)a3 inAspectRatio:(int64_t)a4
{
  unint64_t v4;
  int v5;

  if (a3)
  {
    v4 = *(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFFFF3 | ((4 << a4) | *(_QWORD *)&self->_splitViewControllerFlags) & 0xC;
    v5 = 1 << a4;
  }
  else
  {
    v5 = 1 << a4;
    v4 = *(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFFFF3 | *(_QWORD *)&self->_splitViewControllerFlags & (4 * ~(1 << a4)) & 0xC;
  }
  self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(v4 & 0xFFFFFFFFFFFFFFFCLL | v4 & ~(_BYTE)v5 & 3);
}

- (BOOL)_defersUpdateDelegateHiddenMasterAspectRatios
{
  if ((*(_BYTE *)&self->_splitViewControllerFlags & 0x10) != 0)
    return 0;
  else
    return dyld_program_sdk_at_least();
}

- (void)_updateDelegateHiddenMasterAspectRatios
{
  _BOOL8 v3;
  id WeakRetained;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;

  if ((*(_BYTE *)&self->_splitViewControllerFlags & 0x10) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "masterViewController");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (-[UISplitViewControllerClassicImpl _isHidesMasterInPortraitInvalid](self, "_isHidesMasterInPortraitInvalid"))
    {
      v5 = objc_loadWeakRetained(&self->_delegate);
      v6 = objc_loadWeakRetained((id *)&self->_svc);
      v7 = 1;
      if ((objc_msgSend(v5, "splitViewController:shouldHideViewController:inOrientation:", v6, v15, 1) & 1) == 0)
      {
        v8 = objc_loadWeakRetained(&self->_delegate);
        v9 = objc_loadWeakRetained((id *)&self->_svc);
        v7 = objc_msgSend(v8, "splitViewController:shouldHideViewController:inOrientation:", v9, v15, 2);

      }
      -[UISplitViewControllerClassicImpl _setDelegateHidesMaster:inAspectRatio:](self, "_setDelegateHidesMaster:inAspectRatio:", v7, 1);
    }
    if (-[UISplitViewControllerClassicImpl _isHidesMasterInLandscapeInvalid](self, "_isHidesMasterInLandscapeInvalid"))
    {
      v10 = objc_loadWeakRetained(&self->_delegate);
      v11 = objc_loadWeakRetained((id *)&self->_svc);
      if ((objc_msgSend(v10, "splitViewController:shouldHideViewController:inOrientation:", v11, v15, 4) & 1) != 0)
      {
        v12 = 1;
      }
      else
      {
        v13 = objc_loadWeakRetained(&self->_delegate);
        v14 = objc_loadWeakRetained((id *)&self->_svc);
        v12 = objc_msgSend(v13, "splitViewController:shouldHideViewController:inOrientation:", v14, v15, 3);

      }
      -[UISplitViewControllerClassicImpl _setDelegateHidesMaster:inAspectRatio:](self, "_setDelegateHidesMaster:inAspectRatio:", v12, 0);
    }

  }
  else
  {
    if (-[UISplitViewControllerClassicImpl _isHidesMasterInPortraitInvalid](self, "_isHidesMasterInPortraitInvalid"))
      -[UISplitViewControllerClassicImpl _setDelegateHidesMaster:inAspectRatio:](self, "_setDelegateHidesMaster:inAspectRatio:", 1, 1);
    if (-[UISplitViewControllerClassicImpl _isHidesMasterInLandscapeInvalid](self, "_isHidesMasterInLandscapeInvalid"))
    {
      if (-[UISplitViewControllerClassicImpl _currentInterfaceIdiom](self, "_currentInterfaceIdiom"))
        v3 = 0;
      else
        v3 = -[UISplitViewControllerClassicImpl _iPhoneShouldUseOverlayInCurrentEnvironment](self, "_iPhoneShouldUseOverlayInCurrentEnvironment");
      -[UISplitViewControllerClassicImpl _setDelegateHidesMaster:inAspectRatio:](self, "_setDelegateHidesMaster:inAspectRatio:", v3, 0);
    }
  }
}

- (void)_setPrimaryHidingStateForCurrentOrientation:(int64_t)a3
{
  self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFFFFCFFFFFFLL | ((unint64_t)(a3 & 3) << 24));
}

- (void)_setPrimaryHidingState:(int64_t)a3
{
  self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFFFFF3FFFFFLL | ((unint64_t)(a3 & 3) << 22));
}

- (BOOL)_isHidesMasterInLandscapeInvalid
{
  return *(_DWORD *)&self->_splitViewControllerFlags & 1;
}

- (BOOL)_iPhoneShouldUseOverlayInCurrentEnvironment
{
  BOOL v3;
  id WeakRetained;
  BOOL v5;

  v3 = -[UISplitViewControllerClassicImpl usesDeviceOverlayPreferences](self, "usesDeviceOverlayPreferences")
    && -[UISplitViewControllerClassicImpl prefersOverlayInRegularWidthPhone](self, "prefersOverlayInRegularWidthPhone")
    || +[UISplitViewController _automaticDisplayModeOnPhoneUsesOverlayInLandscapeDefaultValue](UISplitViewController, "_automaticDisplayModeOnPhoneUsesOverlayInLandscapeDefaultValue");
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v5 = (objc_msgSend(WeakRetained, "presentsWithGesture") & 1) != 0
    || -[UISplitViewControllerDisplayModeBarButtonItem _hasBeenUsed](self->_displayModeButtonItem, "_hasBeenUsed");

  return v3 && v5;
}

- (BOOL)usesDeviceOverlayPreferences
{
  return *((unsigned __int8 *)&self->_splitViewControllerFlags + 4) >> 7;
}

- (BOOL)prefersOverlayInRegularWidthPhone
{
  return *((_BYTE *)&self->_splitViewControllerFlags + 5) & 1;
}

- (void)_displayModeWillChangeTo:(int64_t)a3
{
  int64_t pendingDisplayModeChangeCount;
  id WeakRetained;
  id v7;

  pendingDisplayModeChangeCount = self->_pendingDisplayModeChangeCount;
  if (!pendingDisplayModeChangeCount)
  {
    if (self->_lastNotifiedDisplayMode == a3)
    {
      pendingDisplayModeChangeCount = 0;
    }
    else
    {
      if ((*((_BYTE *)&self->_splitViewControllerFlags + 3) & 4) != 0)
      {
        WeakRetained = objc_loadWeakRetained(&self->_delegate);
        v7 = objc_loadWeakRetained((id *)&self->_svc);
        objc_msgSend(WeakRetained, "splitViewController:willChangeToDisplayMode:", v7, a3);

        pendingDisplayModeChangeCount = self->_pendingDisplayModeChangeCount;
      }
      else
      {
        pendingDisplayModeChangeCount = 0;
      }
      self->_lastNotifiedDisplayMode = a3;
    }
  }
  self->_pendingDisplayModeChangeCount = pendingDisplayModeChangeCount + 1;
}

- (void)loadView
{
  UISplitViewController **p_svc;
  id WeakRetained;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  UILayoutContainerView *v15;

  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_defaultInitialViewFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v15 = -[UILayoutContainerView initWithFrame:]([UILayoutContainerView alloc], "initWithFrame:", v6, v8, v10, v12);
  if (dyld_program_sdk_at_least())
    +[UIColor _splitViewBorderColor](UIColor, "_splitViewBorderColor");
  else
    +[UIColor systemGrayColor](UIColor, "systemGrayColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutContainerView setBackgroundColor:](v15, "setBackgroundColor:", v13);

  -[UIView setAutoresizingMask:](v15, "setAutoresizingMask:", 18);
  -[UILayoutContainerView setDelegate:](v15, "setDelegate:", self);
  v14 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v14, "setView:", v15);

  -[UISplitViewControllerClassicImpl _loadNewSubviews:](self, "_loadNewSubviews:", 0);
  if ((*((_BYTE *)&self->_splitViewControllerFlags + 3) & 0x40) != 0)
  {
    -[UISplitViewControllerClassicImpl _updateTargetDisplayMode](self, "_updateTargetDisplayMode");
    *(_QWORD *)&self->_splitViewControllerFlags &= ~0x40000000uLL;
  }
  -[UISplitViewControllerClassicImpl _setUpFocusContainerGuides](self, "_setUpFocusContainerGuides");

}

- (void)_loadNewSubviews:(id)a3
{
  id v4;
  UISplitViewController **p_svc;
  id WeakRetained;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  _DWORD *v15;
  _BOOL4 v16;
  id v17;
  void *v18;
  _DWORD *v19;
  uint64_t v20;
  id obj;
  void *v22;
  _QWORD v23[4];
  id v24;
  id location;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "masterViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v7, "mutableChildViewControllers");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v27;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v10);
        if (!v4 || (objc_msgSend(v4, "containsObject:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v10)) & 1) == 0)
        {
          objc_msgSend(v11, "view");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22 == v11)
          {
            v14 = objc_loadWeakRetained((id *)p_svc);
            v13 = objc_msgSend(v14, "displayMode") == 2;

          }
          else
          {
            v13 = 1;
          }
          objc_msgSend(v12, "setAutoresizingMask:", 0);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v12, "setClipsToBounds:", 1);
          if ((objc_msgSend(v11, "appearanceTransitionsAreDisabled") & 1) == 0)
          {
            v15 = objc_loadWeakRetained((id *)p_svc);
            if (v15)
            {
              v16 = ((v15[92] >> 1) & 3u) - 1 < 2 && v13;

              if (v16)
                objc_msgSend(v11, "__viewWillAppear:", 0);
            }
          }
          v17 = objc_loadWeakRetained((id *)p_svc);
          objc_msgSend(v17, "view");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "insertSubview:atIndex:", v12, 0);

          objc_initWeak(&location, v11);
          if ((objc_msgSend(v11, "appearanceTransitionsAreDisabled") & 1) == 0)
          {
            v19 = objc_loadWeakRetained((id *)p_svc);
            if (v19)
            {
              if (((v19[92] >> 1) & 3u) - 1 >= 2)
                v13 = 0;

              if (v13)
              {
                v23[0] = MEMORY[0x1E0C809B0];
                v23[1] = 3221225472;
                v23[2] = __53__UISplitViewControllerClassicImpl__loadNewSubviews___block_invoke;
                v23[3] = &unk_1E16B3F40;
                objc_copyWeak(&v24, &location);
                objc_msgSend(v11, "setAfterAppearanceBlock:", v23);
                objc_msgSend((id)UIApp, "_addAfterCACommitBlockForViewController:", v11);
                objc_destroyWeak(&v24);
              }
            }
          }
          objc_destroyWeak(&location);

        }
        ++v10;
      }
      while (v8 != v10);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      v8 = v20;
    }
    while (v20);
  }

}

- (BOOL)lockedForDelegateCallback
{
  return 0;
}

- (void)setPreferredDisplayMode:(int64_t)a3
{
  if (self->_preferredDisplayMode | a3)
  {
    self->_preferredDisplayMode = a3;
    -[UISplitViewControllerClassicImpl _changeToDisplayMode:forCurrentOrientationOnly:](self, "_changeToDisplayMode:forCurrentOrientationOnly:");
  }
}

- (void)_setUsesExtraWidePrimaryColumn:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UISplitViewControllerClassicImpl _masterFocusContainerGuide](self, "_masterFocusContainerGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UISplitViewControllerClassicImpl _masterFocusContainerGuide](self, "_masterFocusContainerGuide");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISplitViewControllerClassicImpl _masterViewFrame](self, "_masterViewFrame");
    objc_msgSend(v4, "_setManualLayoutFrame:");

  }
  -[UISplitViewControllerClassicImpl _detailFocusContainerGuide](self, "_detailFocusContainerGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UISplitViewControllerClassicImpl _detailFocusContainerGuide](self, "_detailFocusContainerGuide");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UISplitViewControllerClassicImpl _detailViewFrame](self, "_detailViewFrame");
    objc_msgSend(v6, "_setManualLayoutFrame:");

  }
}

- (UIFocusContainerGuide)_masterFocusContainerGuide
{
  return self->_masterFocusContainerGuide;
}

- (UIFocusContainerGuide)_detailFocusContainerGuide
{
  return self->_detailFocusContainerGuide;
}

- (CGRect)_frameForChildContentContainer:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
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
  CGRect result;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v8 != 1)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    v9 = 0;
  }
  v10 = 0;
LABEL_6:
  if (v9 == v4)
  {
    -[UISplitViewControllerClassicImpl _masterViewFrame](self, "_masterViewFrame");
LABEL_11:
    v14 = v21;
    v16 = v22;
    v18 = v23;
    v20 = v24;
    goto LABEL_12;
  }
  if (v10 == v4)
  {
    -[UISplitViewControllerClassicImpl _detailViewFrame](self, "_detailViewFrame");
    goto LABEL_11;
  }
  v11 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

LABEL_12:
  v25 = v14;
  v26 = v16;
  v27 = v18;
  v28 = v20;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (void)_initWithCoder:(id)a3
{
  double v4;
  double v5;
  double v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "containsValueForKey:", CFSTR("UISplitViewControllerPreferredPrimaryColumnWidthFraction")))
  {
    objc_msgSend(v11, "decodeDoubleForKey:", CFSTR("UISplitViewControllerPreferredPrimaryColumnWidthFraction"));
    self->_preferredPrimaryColumnWidthFraction = v4;
  }
  if (objc_msgSend(v11, "containsValueForKey:", CFSTR("UISplitViewControllerMaximumPrimaryColumnWidth")))
  {
    objc_msgSend(v11, "decodeDoubleForKey:", CFSTR("UISplitViewControllerMaximumPrimaryColumnWidth"));
    self->_maximumPrimaryColumnWidth = v5;
  }
  if (objc_msgSend(v11, "containsValueForKey:", CFSTR("UISplitViewControllerMinimumPrimaryColumnWidth")))
  {
    objc_msgSend(v11, "decodeDoubleForKey:", CFSTR("UISplitViewControllerMinimumPrimaryColumnWidth"));
    self->_minimumPrimaryColumnWidth = v6;
  }
  if (objc_msgSend(v11, "containsValueForKey:", CFSTR("UISplitViewControllerPrimaryEdge")))
    self->_primaryEdge = objc_msgSend(v11, "decodeIntegerForKey:", CFSTR("UISplitViewControllerPrimaryEdge"));
  if (objc_msgSend(v11, "containsValueForKey:", CFSTR("UISplitViewControllerPresentsWithGesture")))
    self->_presentsWithGesture = objc_msgSend(v11, "decodeBoolForKey:", CFSTR("UISplitViewControllerPresentsWithGesture"));
  if (objc_msgSend(v11, "containsValueForKey:", CFSTR("UISplitViewControllerUsesDeviceOverlayPreferences")))
  {
    v7 = objc_msgSend(v11, "decodeBoolForKey:", CFSTR("UISplitViewControllerUsesDeviceOverlayPreferences"));
    v8 = 0x8000000000;
    if (!v7)
      v8 = 0;
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFF7FFFFFFFFFLL | v8);
  }
  if (objc_msgSend(v11, "containsValueForKey:", CFSTR("UISplitViewControllerUsesExtraWidePrimaryColumn")))
  {
    v9 = objc_msgSend(v11, "decodeBoolForKey:", CFSTR("UISplitViewControllerUsesExtraWidePrimaryColumn"));
    v10 = 0x4000000000;
    if (!v9)
      v10 = 0;
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFBFFFFFFFFFLL | v10);
  }

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_preferredPrimaryColumnWidthFraction != -3.40282347e38)
  {
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("UISplitViewControllerPreferredPrimaryColumnWidthFraction"));
    v4 = v5;
  }
  if (self->_maximumPrimaryColumnWidth != -3.40282347e38)
  {
    objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("UISplitViewControllerMaximumPrimaryColumnWidth"));
    v4 = v5;
  }
  if (self->_minimumPrimaryColumnWidth != -3.40282347e38)
  {
    objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("UISplitViewControllerMinimumPrimaryColumnWidth"));
    v4 = v5;
  }
  objc_msgSend(v4, "encodeInteger:forKey:", self->_primaryEdge, CFSTR("UISplitViewControllerPrimaryEdge"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_presentsWithGesture, CFSTR("UISplitViewControllerPresentsWithGesture"));
  objc_msgSend(v5, "encodeBool:forKey:", (*(_QWORD *)&self->_splitViewControllerFlags >> 39) & 1, CFSTR("UISplitViewControllerUsesDeviceOverlayPreferences"));
  objc_msgSend(v5, "encodeBool:forKey:", (*(_QWORD *)&self->_splitViewControllerFlags >> 38) & 1, CFSTR("UISplitViewControllerUsesExtraWidePrimaryColumn"));

}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  id *v7;
  UIGestureRecognizer *popoverPresentationGestureRecognizer;
  UIResponder *postTransitionResponder;
  UIView *rotationSnapshotView;
  void *v11;
  objc_super v12;

  -[UISplitViewControllerClassicImpl _removeCollapsingSnapshotViews](self, "_removeCollapsingSnapshotViews");
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v5 = objc_loadWeakRetained((id *)&self->_svc);
    v6 = v5[4];

    if (v6)
    {
      v7 = (id *)objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v7[4], "removeGestureRecognizer:", self->_popoverPresentationGestureRecognizer);

    }
  }
  popoverPresentationGestureRecognizer = self->_popoverPresentationGestureRecognizer;
  self->_popoverPresentationGestureRecognizer = 0;

  postTransitionResponder = self->_postTransitionResponder;
  self->_postTransitionResponder = 0;

  -[UIView removeFromSuperview](self->_rotationSnapshotView, "removeFromSuperview");
  rotationSnapshotView = self->_rotationSnapshotView;
  self->_rotationSnapshotView = 0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObserver:name:object:", self, CFSTR("_UIAlertWillAppearNotification"), 0);

  v12.receiver = self;
  v12.super_class = (Class)UISplitViewControllerClassicImpl;
  -[UISplitViewControllerClassicImpl dealloc](&v12, sel_dealloc);
}

- (UISplitViewController)splitViewController
{
  return (UISplitViewController *)objc_loadWeakRetained((id *)&self->_svc);
}

void __53__UISplitViewControllerClassicImpl__loadNewSubviews___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "__viewDidAppear:", 0);

}

- (BOOL)_shouldPersistViewWhenCoding
{
  return 0;
}

- (void)unloadViewForced:(BOOL)a3
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "mutableChildViewControllers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "unloadViewIfReloadable");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)setPrefersOverlayInRegularWidthPhone:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (void)setUsesDeviceOverlayPreferences:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (id)_primaryDimmingView
{
  return -[UIPopoverController _dimmingView](self->_hiddenPopoverController, "_dimmingView");
}

- (CGRect)_detailViewFrame:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  double x;
  UISplitViewController **p_svc;
  id WeakRetained;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  id v14;
  float v15;
  float v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  if (objc_msgSend(WeakRetained, "displayMode") != 2
    || (v10 = (*(_QWORD *)&self->_splitViewControllerFlags >> 20) & 3, v10 == 1))
  {
LABEL_7:

    goto LABEL_8;
  }

  if (v10 != 2)
  {
    -[UISplitViewControllerClassicImpl _primaryColumnWidthForSize:](self, "_primaryColumnWidthForSize:", width, height);
    v12 = v11;
    v13 = 0.0;
    if (!-[UISplitViewControllerClassicImpl _layoutPrimaryOnRight](self, "_layoutPrimaryOnRight"))
    {
      v14 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v14, "gutterWidth");
      v13 = x + v12 + v15;

    }
    WeakRetained = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(WeakRetained, "gutterWidth");
    width = width - (v12 + v16);
    x = v13;
    goto LABEL_7;
  }
LABEL_8:
  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)_detailViewFrame
{
  id WeakRetained;
  void *v4;
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
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[UISplitViewControllerClassicImpl _detailViewFrame:](self, "_detailViewFrame:");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)_viewControllerHiding:(id)a3
{
  $C946B5D877B827A51B09546B3F197234 splitViewControllerFlags;
  UIBarButtonItem *v5;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *barButtonItem;
  void *v9;
  NSString *v10;
  NSString *buttonTitle;
  id WeakRetained;
  id v13;
  id v14;

  v14 = a3;
  splitViewControllerFlags = self->_splitViewControllerFlags;
  if ((*(_WORD *)&splitViewControllerFlags & 0x400) == 0)
  {
    if (!dyld_program_sdk_at_least())
      goto LABEL_9;
    splitViewControllerFlags = self->_splitViewControllerFlags;
  }
  if ((*(_BYTE *)&splitViewControllerFlags & 0xE0) != 0x80)
  {
    if (!self->_barButtonItem)
    {
      v5 = [UIBarButtonItem alloc];
      objc_msgSend(v14, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[UIBarButtonItem initWithTitle:style:target:action:](v5, "initWithTitle:style:target:action:", v6, 1, self, sel_toggleMasterVisible_);
      barButtonItem = self->_barButtonItem;
      self->_barButtonItem = v7;

      objc_msgSend(v14, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (NSString *)objc_msgSend(v9, "copy");
      buttonTitle = self->_buttonTitle;
      self->_buttonTitle = v10;

    }
    -[UISplitViewControllerClassicImpl _setupHiddenPopoverControllerWithViewController:](self, "_setupHiddenPopoverControllerWithViewController:", v14);
    if ((*((_BYTE *)&self->_splitViewControllerFlags + 1) & 4) != 0)
    {
      WeakRetained = objc_loadWeakRetained(&self->_delegate);
      v13 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(WeakRetained, "splitViewController:willHideViewController:withBarButtonItem:forPopoverController:", v13, v14, self->_barButtonItem, self->_hiddenPopoverController);

    }
  }
LABEL_9:

}

- (double)primaryColumnWidth
{
  id WeakRetained;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  -[UISplitViewControllerClassicImpl _primaryColumnWidthForSize:](self, "_primaryColumnWidthForSize:", v6, v8);
  return result;
}

- (CGSize)_screenSizeInMainScene:(BOOL)a3
{
  _BOOL4 v3;
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v3 = a3;
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v7, "_screen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v6;
LABEL_5:
    objc_msgSend(v9, "bounds");
    goto LABEL_6;
  }
  v9 = v8;
  if (!v3)
    goto LABEL_5;
  objc_msgSend(v8, "_interfaceOrientedMainSceneBounds");
LABEL_6:
  v12 = v10;
  v13 = v11;

  v14 = v12;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (BOOL)_usesExtraWidePrimaryColumn
{
  return (*((unsigned __int8 *)&self->_splitViewControllerFlags + 4) >> 6) & 1;
}

- (CGSize)_preferredContentSize
{
  id WeakRetained;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_super_preferredContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (double)_defaultMaximumPrimaryColumnWidthForSize:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  UISplitViewController **p_svc;
  id WeakRetained;
  unint64_t v10;
  _BOOL4 v11;
  _BOOL4 v12;
  double v13;
  id v14;
  int v15;
  double v16;
  id v17;
  uint64_t v18;
  double v19;
  id v20;
  id v21;
  uint64_t v22;

  width = a3.width;
  -[UISplitViewControllerClassicImpl _screenSizeInMainScene:](self, "_screenSizeInMainScene:", 0, a3.width, a3.height);
  if (v5 >= v6)
    v7 = v5;
  else
    v7 = v6;
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)p_svc);
  v10 = objc_msgSend(WeakRetained, "interfaceOrientation") - 3;
  v11 = v10 < 2;

  v12 = v7 <= 1112.0;
  if (v7 > 1210.0)
    v12 = 1;
  if (v12)
    v11 = v7 > 1210.0;
  if (v11)
    v13 = 375.0;
  else
    v13 = 320.0;
  if (dyld_program_sdk_at_least())
  {
    if (v10 <= 1)
    {
      if (width <= v7 * 0.5)
      {
        v21 = objc_loadWeakRetained((id *)p_svc);
        v22 = objc_msgSend(v21, "displayMode");

        if (v22 == 2)
          return 320.0;
        else
          return 375.0;
      }
      else if (width <= v7 - v13)
      {
        if (v7 <= 1210.0)
          return 320.0;
        else
          return 375.0;
      }
      else
      {
        v14 = objc_loadWeakRetained((id *)p_svc);
        v15 = objc_msgSend(v14, "_usesExtraWidePrimaryColumn");

        v16 = 414.0;
        if (!v11)
          v16 = 375.0;
        if (v15)
          return v16;
      }
    }
  }
  else
  {
    v17 = objc_loadWeakRetained((id *)p_svc);
    v18 = objc_msgSend(v17, "preferredDisplayMode");

    if (v18 == 2)
    {
      v19 = round(width * 0.38);
      if (width > v7 * 0.5)
      {
        v20 = objc_loadWeakRetained((id *)p_svc);
        if ((unint64_t)(objc_msgSend(v20, "interfaceOrientation") - 1) < 2)
        {

          return v13;
        }

        if (width <= v7 - v13)
          return v13;
      }
      return v19;
    }
  }
  return v13;
}

- (BOOL)_isExpanding
{
  return (~*(_DWORD *)&self->_splitViewControllerFlags & 0x300000) == 0;
}

- (BOOL)_isCollapsed
{
  return ((*(_QWORD *)&self->_splitViewControllerFlags >> 20) & 3uLL) - 1 < 2;
}

- (id)_primaryViewControllerForExpanding
{
  id v3;
  id v4;
  void *v5;
  id WeakRetained;

  if ((*((_BYTE *)&self->_splitViewControllerFlags + 2) & 8) == 0
    || (v3 = objc_loadWeakRetained(&self->_delegate),
        v4 = objc_loadWeakRetained((id *)&self->_svc),
        objc_msgSend(v3, "primaryViewControllerForExpandingSplitViewController:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v5))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "masterViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)_collapseSecondaryViewController:(id)a3 ontoPrimaryViewController:(id)a4
{
  id v6;
  id v7;
  $C946B5D877B827A51B09546B3F197234 splitViewControllerFlags;
  id v9;
  $C946B5D877B827A51B09546B3F197234 v10;
  id v11;
  id v12;
  char v13;
  id WeakRetained;
  id v15;
  char v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;

  v23 = a3;
  v6 = a4;
  objc_msgSend(v6, "_setAllowNestedNavigationControllers:", 1);
  if ((unint64_t)(self->_suspendedState - 3) > 1)
  {
    if ((*((_BYTE *)&self->_splitViewControllerFlags + 2) & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained(&self->_delegate);
      v15 = objc_loadWeakRetained((id *)&self->_svc);
      v16 = objc_msgSend(WeakRetained, "splitViewController:collapseSecondaryViewController:ontoPrimaryViewController:", v15, v23, v6);

      if ((v16 & 1) != 0)
        goto LABEL_16;
    }
    goto LABEL_13;
  }
  v7 = objc_loadWeakRetained(&self->_delegate);
  if (v7)
  {
    splitViewControllerFlags = self->_splitViewControllerFlags;

    if ((*(_QWORD *)&splitViewControllerFlags & 0x2000000000) != 0)
    {
      v17 = self->_suspendedState == 3;
      v18 = objc_loadWeakRetained(&self->_delegate);
      v19 = objc_loadWeakRetained((id *)&self->_svc);
      LOBYTE(v17) = objc_msgSend(v18, "_splitViewController:collapseSecondaryViewController:ontoPrimaryViewController:forRestorationOfCollapsedWhileSuspendedWithPrimaryVisible:", v19, v23, v6, v17);

      if ((v17 & 1) != 0)
        goto LABEL_16;
      goto LABEL_13;
    }
  }
  v9 = objc_loadWeakRetained(&self->_delegate);
  if (!v9
    || (v10 = self->_splitViewControllerFlags, v9, (*(_DWORD *)&v10 & 0x10000) == 0)
    || (v11 = objc_loadWeakRetained(&self->_delegate),
        v12 = objc_loadWeakRetained((id *)&self->_svc),
        v13 = objc_msgSend(v11, "splitViewController:collapseSecondaryViewController:ontoPrimaryViewController:", v12, v23, v6), v12, v11, (v13 & 1) == 0))
  {
    if (self->_suspendedState != 3)
    {
LABEL_13:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_msgSend(v23, "childViewControllers"),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            v21 = objc_msgSend(v20, "count"),
            v20,
            !v21))
      {
        NSLog(CFSTR("%s: When collapsing for size class adaptation, secondary (detail) view controller has a navigation controller without any children, so ignoring it and not collapsing secondary on top of primary. SplitViewController is %@, primary is %@, secondary is %@"), "-[UISplitViewControllerClassicImpl _collapseSecondaryViewController:ontoPrimaryViewController:]", self, v6, v23);
      }
      else
      {
        v22 = objc_loadWeakRetained((id *)&self->_svc);
        objc_msgSend(v6, "collapseSecondaryViewController:forSplitViewController:", v23, v22);

      }
    }
  }
LABEL_16:

}

- (id)_separateSecondaryViewControllerFromPrimaryViewController:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  int v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  _BOOL4 v20;
  BOOL v21;
  int64_t v22;
  void *v23;
  void (**v24)(void *, id, const __CFString *);
  _QWORD aBlock[5];
  id v27;
  BOOL v28;

  v4 = a3;
  if (qword_1ECD7D4B8 != -1)
    dispatch_once(&qword_1ECD7D4B8, &__block_literal_global_139);
  if (_MergedGlobals_1005)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "_existingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rootViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_printHierarchy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  v10 = objc_loadWeakRetained(&self->_delegate);
  v11 = v10;
  v12 = 0;
  v13 = 0;
  if (self->_suspendedState == 2 && v10)
  {
    if ((*((_BYTE *)&self->_splitViewControllerFlags + 4) & 0x10) != 0)
    {
      v14 = objc_loadWeakRetained((id *)&self->_svc);
      v12 = objc_msgSend(v11, "_splitViewControllerIsPrimaryVisible:", v14);

      v13 = 1;
    }
    else
    {
      v12 = 0;
      v13 = 0;
    }
  }
  if ((*((_BYTE *)&self->_splitViewControllerFlags + 2) & 2) == 0)
  {
    v15 = 0;
LABEL_15:
    v19 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v4, "separateSecondaryViewControllerForSplitViewController:", v19);
    v18 = objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  v16 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v11, "splitViewController:separateSecondaryViewControllerFromPrimaryViewController:", v16, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    goto LABEL_15;
  objc_msgSend(v15, "parentViewController");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v18 = (uint64_t)v15;
  if (v17 == v4)
    goto LABEL_15;
LABEL_16:
  if (self->_suspendedState == 2)
  {
    v20 = v18 == 0;
    if (v13)
      v20 = v12;
    v21 = !v20;
    v22 = 3;
    if (v21)
      v22 = 4;
    self->_suspendedState = v22;
  }
  v23 = (void *)v18;
  if (!v18)
  {
    -[UISplitViewControllerClassicImpl _preservedDetailController](self, "_preservedDetailController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (_MergedGlobals_1005)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __94__UISplitViewControllerClassicImpl__separateSecondaryViewControllerFromPrimaryViewController___block_invoke_2;
    aBlock[3] = &unk_1E16C19A0;
    aBlock[4] = self;
    v28 = v18 == 0;
    v27 = v9;
    v24 = (void (**)(void *, id, const __CFString *))_Block_copy(aBlock);
    v24[2](v24, v4, CFSTR("primary"));
    v24[2](v24, v23, CFSTR("secondary"));

  }
  return v23;
}

void __94__UISplitViewControllerClassicImpl__separateSecondaryViewControllerFromPrimaryViewController___block_invoke()
{
  id v0;

  if ((os_variant_has_internal_diagnostics() & 1) != 0)
  {
    _UIMainBundleIdentifier();
    v0 = (id)objc_claimAutoreleasedReturnValue();
    _MergedGlobals_1005 = objc_msgSend(CFSTR("com.apple.MobileSMS"), "isEqualToString:", v0);

  }
  else
  {
    _MergedGlobals_1005 = 0;
  }
}

void __94__UISplitViewControllerClassicImpl__separateSecondaryViewControllerFromPrimaryViewController___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id WeakRetained;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
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
  uint8_t v63[128];
  uint8_t buf[4];
  id v65;
  __int16 v66;
  id v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  id v71;
  __int16 v72;
  int v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "parentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(v5, "_existingView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v8, "superview");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_viewControllerForAncestor");
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));

          if (WeakRetained != v11)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              v13 = *(unsigned __int8 *)(a1 + 48);
              *(_DWORD *)buf = 138413314;
              v65 = v6;
              v66 = 2112;
              v67 = v5;
              v68 = 2112;
              v69 = v8;
              v70 = 2112;
              v71 = v11;
              v72 = 1024;
              v73 = v13;
              _os_log_impl(&dword_185066000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Separation error: '%@' %@ has view %@ in the wrong VC: %@. Fell back:%d", buf, 0x30u);
            }
            v45 = v11;
            v46 = v8;
            v59 = 0u;
            v60 = 0u;
            v57 = 0u;
            v58 = 0u;
            v47 = a1;
            objc_msgSend(*(id *)(a1 + 40), "componentsSeparatedByString:", CFSTR("\n"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
            if (v15)
            {
              v16 = v15;
              v17 = MEMORY[0x1E0C81028];
              v18 = *(_QWORD *)v58;
              do
              {
                for (i = 0; i != v16; ++i)
                {
                  if (*(_QWORD *)v58 != v18)
                    objc_enumerationMutation(v14);
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                  {
                    v20 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
                    *(_DWORD *)buf = 138412290;
                    v65 = v20;
                    _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_INFO, "VCs before: %@", buf, 0xCu);
                  }
                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
              }
              while (v16);
            }

            v21 = objc_loadWeakRetained((id *)(*(_QWORD *)(v47 + 32) + 8));
            objc_msgSend(v21, "_existingView");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "window");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "rootViewController");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "_printHierarchy");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            v55 = 0u;
            v56 = 0u;
            v53 = 0u;
            v54 = 0u;
            v44 = v25;
            objc_msgSend(v25, "componentsSeparatedByString:", CFSTR("\n"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
            if (v27)
            {
              v28 = v27;
              v29 = MEMORY[0x1E0C81028];
              v30 = *(_QWORD *)v54;
              do
              {
                for (j = 0; j != v28; ++j)
                {
                  if (*(_QWORD *)v54 != v30)
                    objc_enumerationMutation(v26);
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                  {
                    v32 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
                    *(_DWORD *)buf = 138412290;
                    v65 = v32;
                    _os_log_impl(&dword_185066000, v29, OS_LOG_TYPE_INFO, "VCs after: %@", buf, 0xCu);
                  }
                }
                v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
              }
              while (v28);
            }

            v33 = objc_loadWeakRetained((id *)(*(_QWORD *)(v47 + 32) + 8));
            objc_msgSend(v33, "_existingView");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "window");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "recursiveDescription");
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            v51 = 0u;
            v52 = 0u;
            v49 = 0u;
            v50 = 0u;
            v48 = v36;
            objc_msgSend(v36, "componentsSeparatedByString:", CFSTR("\n"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
            if (v38)
            {
              v39 = v38;
              v40 = MEMORY[0x1E0C81028];
              v41 = *(_QWORD *)v50;
              do
              {
                for (k = 0; k != v39; ++k)
                {
                  if (*(_QWORD *)v50 != v41)
                    objc_enumerationMutation(v37);
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                  {
                    v43 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * k);
                    *(_DWORD *)buf = 138412290;
                    v65 = v43;
                    _os_log_impl(&dword_185066000, v40, OS_LOG_TYPE_INFO, "Views after: %@", buf, 0xCu);
                  }
                }
                v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
              }
              while (v39);
            }

            v11 = v45;
            v8 = v46;
          }
        }

      }
    }
  }

}

- (BOOL)_canDisplayHostedMaster
{
  if ((dyld_program_sdk_at_least() & 1) != 0)
    return 1;
  if ((*((_BYTE *)&self->_splitViewControllerFlags + 1) & 4) != 0)
    return -[UISplitViewControllerClassicImpl _hidesMasterViewInCurrentOrientation](self, "_hidesMasterViewInCurrentOrientation");
  return 0;
}

- (BOOL)inCollapsingToProposedTopColumnCallback
{
  return 0;
}

- (BOOL)inExpandingToProposedDisplayModeCallback
{
  return 0;
}

void __55__UISplitViewControllerClassicImpl_setViewControllers___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[UIViewController __viewDidDisappear:]((uint64_t)WeakRetained, 0);

}

- (id)_childContainingSender:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v12;
  int v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  int v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_11;
  }
  -[UISplitViewControllerClassicImpl _preservedDetailController](self, "_preservedDetailController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        -[UISplitViewControllerClassicImpl _preservedDetailController](self, "_preservedDetailController"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v4, "_isMemberOfViewControllerHierarchy:", v7),
        v7,
        v6,
        !v8))
  {
    p_svc = &self->_svc;
    WeakRetained = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(WeakRetained, "masterViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v4, "_isMemberOfViewControllerHierarchy:", v12);

    v14 = objc_loadWeakRetained((id *)p_svc);
    v15 = v14;
    if (v13)
    {
      objc_msgSend(v14, "masterViewController");
      v16 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v9 = (void *)v16;

      goto LABEL_12;
    }
    objc_msgSend(v14, "detailViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v4, "_isMemberOfViewControllerHierarchy:", v17);

    if (v18)
    {
      v15 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v15, "detailViewController");
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  -[UISplitViewControllerClassicImpl _preservedDetailController](self, "_preservedDetailController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v9;
}

- (id)_primaryContentResponder
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "detailViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)showViewController:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  char v12;
  UISplitViewController **p_svc;
  id WeakRetained;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[UISplitViewControllerClassicImpl _childContainingSender:](self, "_childContainingSender:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6)
  {
    if ((id)v8 != v6)
    {
      if ((*((_BYTE *)&self->_splitViewControllerFlags + 1) & 0x40) == 0
        || (v10 = objc_loadWeakRetained(&self->_delegate),
            v11 = objc_loadWeakRetained((id *)&self->_svc),
            v12 = objc_msgSend(v10, "splitViewController:showViewController:sender:", v11, v6, v7),
            v11,
            v10,
            (v12 & 1) == 0))
      {
        p_svc = &self->_svc;
        WeakRetained = objc_loadWeakRetained((id *)p_svc);
        v15 = objc_msgSend(WeakRetained, "_horizontalSizeClass");

        v16 = objc_loadWeakRetained((id *)p_svc);
        v17 = v16;
        if (v15 == 2)
        {
          objc_msgSend(v16, "masterViewController");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = objc_loadWeakRetained((id *)p_svc);
          if (v18 == v9)
          {
            v27[0] = v6;
            v20 = v19;
            objc_msgSend(v20, "viewControllers");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectAtIndex:", 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v27[1] = v22;
            v23 = (void *)MEMORY[0x1E0C99D20];
            v24 = v27;
          }
          else
          {
            v20 = v19;
            objc_msgSend(v20, "viewControllers");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectAtIndex:", 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v26[0] = v22;
            v26[1] = v6;
            v23 = (void *)MEMORY[0x1E0C99D20];
            v24 = v26;
          }
          objc_msgSend(v23, "arrayWithObjects:count:", v24, 2);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setViewControllers:", v25);

        }
        else
        {
          objc_msgSend(v16, "presentViewController:animated:completion:", v6, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), 0);

        }
      }
    }
  }

}

- (void)showDetailViewController:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  _BOOL4 v18;
  id v19;
  id v20;
  char v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void **v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "detailViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    -[UISplitViewControllerClassicImpl _preservedDetailController](self, "_preservedDetailController");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  objc_msgSend(v13, "_existingView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "window");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
  {

LABEL_8:
    v14 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v14, "masterViewController");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v13;
    goto LABEL_9;
  }
  v16 = (void *)v15;
  if (v13 == v6)
  {
    v24 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v24, "traitCollection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "userInterfaceIdiom");

    v17 = v6;
    if (v26)
      goto LABEL_23;
    goto LABEL_8;
  }
  v17 = v13;
LABEL_9:

  if (v6)
  {
    if (v17 != v6)
    {
      v18 = -[UISplitViewControllerClassicImpl _isBasicallyHorizontallyCompact](self, "_isBasicallyHorizontallyCompact");
      if ((*((_BYTE *)&self->_splitViewControllerFlags + 1) & 0x80) == 0
        || (v19 = objc_loadWeakRetained(&self->_delegate),
            v20 = objc_loadWeakRetained((id *)p_svc),
            v21 = objc_msgSend(v19, "splitViewController:showDetailViewController:sender:", v20, v6, v7),
            v20,
            v19,
            (v21 & 1) == 0))
      {
        v22 = objc_loadWeakRetained((id *)p_svc);
        v23 = v22;
        if (v18)
        {
          objc_msgSend(v22, "_willShowCollapsedDetailViewController:inTargetController:", v6, v17);

          if (objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel_showViewController_sender_))
          {
            objc_msgSend(v17, "showViewController:sender:", v6, v7);
          }
          else
          {
            v32 = objc_loadWeakRetained((id *)p_svc);
            objc_msgSend(v32, "presentViewController:animated:completion:", v6, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"), 0);

          }
        }
        else
        {
          objc_msgSend(v22, "masterViewController");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = objc_loadWeakRetained((id *)p_svc);
          if (v27)
          {
            v35 = v27;
            v36 = v6;
            v29 = (void *)MEMORY[0x1E0C99D20];
            v30 = &v35;
            v31 = 2;
          }
          else
          {
            v34 = v6;
            v29 = (void *)MEMORY[0x1E0C99D20];
            v30 = &v34;
            v31 = 1;
          }
          objc_msgSend(v29, "arrayWithObjects:count:", v30, v31, v34, v35, v36, v37);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setViewControllers:", v33);

        }
      }
    }
  }
LABEL_23:

}

- (void)_willShowCollapsedDetailViewController:(id)a3 inTargetController:(id)a4
{
  id v6;
  id v7;

  v7 = a4;
  v6 = a3;
  -[UISplitViewControllerClassicImpl _setPreservedDetailController:](self, "_setPreservedDetailController:", v6);
  objc_opt_class();
  LOBYTE(self) = objc_opt_isKindOfClass();

  if ((self & 1) != 0
    && objc_msgSend((id)objc_opt_class(), "doesOverrideViewControllerMethod:", sel_showViewController_sender_))
  {
    objc_msgSend(v7, "_setAllowNestedNavigationControllers:", 1);
  }

}

void __60__UISplitViewControllerClassicImpl__prepareForCompactLayout__block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  void *v6;
  uint64_t v7;
  id v8;

  v3 = MEMORY[0x1E0C809B0];
  v5 = __60__UISplitViewControllerClassicImpl__prepareForCompactLayout__block_invoke_2;
  v6 = &unk_1E16B1B50;
  v2 = (void *)a1[5];
  v7 = a1[4];
  v4 = 3221225472;
  v8 = v2;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", &v3);
  objc_msgSend((id)a1[4], "_collapseSecondaryViewController:ontoPrimaryViewController:", a1[6], a1[5], v3, v4, v5, v6, v7);

}

void __60__UISplitViewControllerClassicImpl__prepareForCompactLayout__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v4[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setViewControllers:", v3);

}

- (void)_animateTransitionFromTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  uint64_t v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a4;
  v6 = objc_msgSend(a3, "horizontalSizeClass");
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "horizontalSizeClass");

  if (v6 == 1 && v9 == 2)
  {
    -[UISplitViewControllerClassicImpl _separateMasterAndDetailWithTransitionCoordinator:](self, "_separateMasterAndDetailWithTransitionCoordinator:", v10);
    self->_useChangingBoundsLayout = 1;
  }
  else
  {
    self->_useChangingBoundsLayout = 1;
    if (v6 == 2 && v9 == 1)
      -[UISplitViewControllerClassicImpl _collapseMasterAndDetailWithTransitionCoordinator:](self, "_collapseMasterAndDetailWithTransitionCoordinator:", v10);
  }
  -[UISplitViewControllerClassicImpl _updateTargetDisplayMode](self, "_updateTargetDisplayMode");

}

- (void)_separateMasterAndDetailWithTransitionCoordinator:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __86__UISplitViewControllerClassicImpl__separateMasterAndDetailWithTransitionCoordinator___block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v4);
  -[UIView setAlpha:](self->_collapsingMasterSnapshotView, "setAlpha:", 0.0);
}

void __86__UISplitViewControllerClassicImpl__separateMasterAndDetailWithTransitionCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UISnapshotView *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _DWORD *v24;
  _BOOL8 v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  _DWORD *v30;
  id v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(_QWORD *);
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t *v54;
  _QWORD v55[5];
  id v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "masterViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(*(id *)(a1 + 32), "_removeCollapsingSnapshotViews");
  v13 = -[UISnapshotView initWithFrame:]([UISnapshotView alloc], "initWithFrame:", v6, v8, v10, v12);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 72);
  *(_QWORD *)(v14 + 72) = v13;

  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 72);
  v18 = objc_loadWeakRetained((id *)(v16 + 8));
  objc_msgSend(v18, "masterViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "captureSnapshotOfView:withSnapshotType:", v20, 1);

  v21 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v21, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));

  objc_msgSend(*(id *)(a1 + 32), "_setCollapsedState:", 3);
  objc_msgSend(*(id *)(a1 + 32), "_primaryViewControllerForExpanding");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_preservedDetailController");
  v24 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    objc_msgSend(*(id *)(a1 + 32), "_secondaryViewControllerForCollapsing");
    v24 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_setPreservedDetailController:", v24);
  }
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__58;
  v62 = __Block_byref_object_dispose__58;
  v63 = 0;
  if (v24)
    v25 = ((v24[92] >> 1) & 3u) - 1 < 2;
  else
    v25 = 0;
  v26 = MEMORY[0x1E0C809B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __86__UISplitViewControllerClassicImpl__separateMasterAndDetailWithTransitionCoordinator___block_invoke_87;
  v55[3] = &unk_1E16B9698;
  v27 = *(_QWORD *)(a1 + 32);
  v57 = &v58;
  v55[4] = v27;
  v28 = v23;
  v56 = v28;
  +[UIViewController _withDisabledAppearanceTransitions:forDescendantsOf:visibleOnly:perform:](UIViewController, "_withDisabledAppearanceTransitions:forDescendantsOf:visibleOnly:perform:", v25, v24, 1, v55);
  objc_msgSend(*(id *)(a1 + 32), "_setPreservedDetailController:", v59[5]);
  v29 = objc_msgSend((id)v59[5], "_hasAppeared");
  v30 = (_DWORD *)v59[5];
  v48 = v26;
  v49 = 3221225472;
  v50 = __86__UISplitViewControllerClassicImpl__separateMasterAndDetailWithTransitionCoordinator___block_invoke_3;
  v51 = &unk_1E16B9698;
  v54 = &v58;
  v31 = v28;
  v32 = *(_QWORD *)(a1 + 32);
  v52 = v31;
  v53 = v32;
  +[UIViewController _withDisabledAppearanceTransitions:forDescendantsOf:visibleOnly:perform:](UIViewController, "_withDisabledAppearanceTransitions:forDescendantsOf:visibleOnly:perform:", v29, v30, v30 != v24, &v48);
  objc_msgSend(v31, "view", v48, v49, v50, v51);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "frame");
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;

  LODWORD(v29) = objc_msgSend(*(id *)(a1 + 32), "_layoutPrimaryOnRight");
  objc_msgSend(v31, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  v44 = -v39;
  if ((_DWORD)v29)
    v44 = v39;
  objc_msgSend(v42, "setFrame:", v35 + v44, v37, v39, v41);

  objc_msgSend((id)v59[5], "view");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setFrame:", v6, v8, v10, v12);

  v46 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v46, "view");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bringSubviewToFront:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));

  _Block_object_dispose(&v58, 8);
}

void __86__UISplitViewControllerClassicImpl__separateMasterAndDetailWithTransitionCoordinator___block_invoke_87(uint64_t a1)
{
  id v1;
  __int128 v2;
  _QWORD v3[5];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __86__UISplitViewControllerClassicImpl__separateMasterAndDetailWithTransitionCoordinator___block_invoke_2;
  v3[3] = &unk_1E16B9698;
  v3[4] = *(_QWORD *)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 40);
  v1 = (id)v2;
  v4 = v2;
  +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v3);

}

void __86__UISplitViewControllerClassicImpl__separateMasterAndDetailWithTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_separateSecondaryViewControllerFromPrimaryViewController:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __86__UISplitViewControllerClassicImpl__separateMasterAndDetailWithTransitionCoordinator___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  if (v2)
  {
    v9 = a1[4];
    v10 = v2;
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = &v9;
    v5 = 2;
  }
  else
  {
    v8 = a1[4];
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = &v8;
    v5 = 1;
  }
  objc_msgSend(v3, "arrayWithObjects:count:", v4, v5, v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 8));
  objc_msgSend(WeakRetained, "setViewControllers:", v6);

}

- (void)_collapseMasterAndDetailWithTransitionCoordinator:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id WeakRetained;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[UISplitViewControllerClassicImpl _isCollapsed](self, "_isCollapsed"))
  {
    -[UISplitViewControllerClassicImpl viewControllers](self, "viewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (unint64_t)objc_msgSend(v5, "count") > 1;

  }
  else
  {
    v6 = 0;
  }
  -[UISplitViewControllerClassicImpl _setCollapsedState:](self, "_setCollapsedState:", 1);
  -[UISplitViewControllerClassicImpl _secondaryViewControllerForCollapsing](self, "_secondaryViewControllerForCollapsing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISplitViewControllerClassicImpl _primaryViewControllerForCollapsing](self, "_primaryViewControllerForCollapsing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v7, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_outermostNavigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", v8);

    if (v11)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          goto LABEL_12;
        WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
        v16 = 138412290;
        v17 = WeakRetained;
        _os_log_fault_impl(&dword_185066000, v14, OS_LOG_TYPE_FAULT, "Avoid pushing detail twice while collapsing an already collapsed UISVC. UISplitViewController may be in inconsistent state. %@", (uint8_t *)&v16, 0xCu);
      }
      else
      {
        v12 = _collapseMasterAndDetailWithTransitionCoordinator____s_category;
        if (!_collapseMasterAndDetailWithTransitionCoordinator____s_category)
        {
          v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v12, (unint64_t *)&_collapseMasterAndDetailWithTransitionCoordinator____s_category);
        }
        v13 = *(NSObject **)(v12 + 8);
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          goto LABEL_13;
        v14 = v13;
        WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
        v16 = 138412290;
        v17 = WeakRetained;
        _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "Avoid pushing detail twice while collapsing an already collapsed UISVC. UISplitViewController may be in inconsistent state. %@", (uint8_t *)&v16, 0xCu);
      }

LABEL_12:
LABEL_13:

      v7 = 0;
LABEL_17:
      -[UISplitViewControllerClassicImpl _setCollapsedState:](self, "_setCollapsedState:", 2);
      goto LABEL_18;
    }
  }
  if (!v8 || !v7)
    goto LABEL_17;
  -[UISplitViewControllerClassicImpl _setPreservedDetailController:](self, "_setPreservedDetailController:", v7);
  -[UISplitViewControllerClassicImpl _collapseMaster:andDetail:withTransitionCoordinator:](self, "_collapseMaster:andDetail:withTransitionCoordinator:", v8, v7, v4);
LABEL_18:

}

- (void)_collapseMaster:(id)a3 andDetail:(id)a4 withTransitionCoordinator:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  int v13;
  id v14;
  id WeakRetained;
  void *v16;
  void *v17;
  void *v18;
  _DWORD *v19;
  _QWORD v20[4];
  id v21;
  UISplitViewControllerClassicImpl *v22;
  id v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __88__UISplitViewControllerClassicImpl__collapseMaster_andDetail_withTransitionCoordinator___block_invoke;
  v20[3] = &unk_1E16B51E8;
  v21 = v8;
  v22 = self;
  v23 = v10;
  v19 = v9;
  v24 = v19;
  v11 = v10;
  v12 = v8;
  +[UIViewController _withDisabledAppearanceTransitionsForVisibleDescendantsOf:perform:](UIViewController, "_withDisabledAppearanceTransitionsForVisibleDescendantsOf:perform:", v19, v20);
  v13 = dyld_program_sdk_at_least();
  if (v19 && v13 && ((v19[92] >> 1) & 3u) - 1 <= 1)
  {
    objc_msgSend(v19, "splitViewController");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    if (v14 == WeakRetained)
    {

    }
    else
    {
      v16 = WeakRetained;
      objc_msgSend(v19, "_existingView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "window");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        -[UIViewController __viewWillDisappear:]((uint64_t)v19, 0);
        -[UIViewController __viewDidDisappear:]((uint64_t)v19, 0);
      }
    }
  }

}

void __88__UISplitViewControllerClassicImpl__collapseMaster_andDetail_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_appearState") == 3;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __88__UISplitViewControllerClassicImpl__collapseMaster_andDetail_withTransitionCoordinator___block_invoke_2;
  v4[3] = &unk_1E16B51E8;
  v3 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 56);
  +[UIViewController _withDisabledAppearanceTransitions:forDescendantsOf:visibleOnly:perform:](UIViewController, "_withDisabledAppearanceTransitions:forDescendantsOf:visibleOnly:perform:", v2, v3, 1, v4);

}

void __88__UISplitViewControllerClassicImpl__collapseMaster_andDetail_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;

  v3 = MEMORY[0x1E0C809B0];
  v5 = __88__UISplitViewControllerClassicImpl__collapseMaster_andDetail_withTransitionCoordinator___block_invoke_3;
  v6 = &unk_1E16B51E8;
  v2 = *(void **)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v4 = 3221225472;
  v8 = v2;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", &v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setAlpha:", 0.0, v3, v4, v5, v6, v7);

}

void __88__UISplitViewControllerClassicImpl__collapseMaster_andDetail_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  UISnapshotView *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  UISnapshotView *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  unint64_t v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  double *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  _QWORD v46[5];
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 72))
  {
    v3 = [UISnapshotView alloc];
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(WeakRetained, "masterViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v7 = -[UISnapshotView initWithFrame:](v3, "initWithFrame:");
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 72);
    *(_QWORD *)(v8 + 72) = v7;

    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 72);
    v12 = objc_loadWeakRetained((id *)(v10 + 8));
    objc_msgSend(v12, "masterViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "captureSnapshotOfView:withSnapshotType:", v14, 1);

    v2 = *(_QWORD *)(a1 + 32);
  }
  v15 = objc_loadWeakRetained((id *)(v2 + 8));
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));

  v17 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v17 + 80))
  {
    v18 = [UISnapshotView alloc];
    v19 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v19, "detailViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    v22 = -[UISnapshotView initWithFrame:](v18, "initWithFrame:");
    v23 = *(_QWORD *)(a1 + 32);
    v24 = *(void **)(v23 + 80);
    *(_QWORD *)(v23 + 80) = v22;

    v25 = *(_QWORD *)(a1 + 32);
    v26 = *(void **)(v25 + 80);
    v27 = objc_loadWeakRetained((id *)(v25 + 8));
    objc_msgSend(v27, "detailViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "captureSnapshotOfView:withSnapshotType:", v29, 1);

    v17 = *(_QWORD *)(a1 + 32);
  }
  v30 = objc_loadWeakRetained((id *)(v17 + 8));
  objc_msgSend(v30, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));

  v32 = *(void **)(a1 + 40);
  if (v32)
  {
    objc_msgSend(v32, "targetTransform");
    v33 = (unint64_t)(*(double *)&v50 < 0.0) << 31;
  }
  else
  {
    v33 = 0;
    v50 = 0u;
    v51 = 0u;
    v49 = 0u;
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336) & 0xFFFFFFFF7FFFFFFFLL | v33;
  v34 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v52[0] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setViewControllers:", v35);

  v36 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v36, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bringSubviewToFront:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));

  v38 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v38, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bringSubviewToFront:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));

  v40 = *(double **)(a1 + 32);
  v41 = v40[36];
  v42 = v40[37];
  v43 = v40[38];
  v44 = v40[39];
  objc_msgSend(*(id *)(a1 + 48), "view");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setFrame:", v41, v42, v43, v44);

  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __88__UISplitViewControllerClassicImpl__collapseMaster_andDetail_withTransitionCoordinator___block_invoke_4;
  v46[3] = &unk_1E16B47A8;
  v46[4] = *(_QWORD *)(a1 + 32);
  v47 = *(id *)(a1 + 56);
  v48 = *(id *)(a1 + 48);
  +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v46);

}

uint64_t __88__UISplitViewControllerClassicImpl__collapseMaster_andDetail_withTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_collapseSecondaryViewController:ontoPrimaryViewController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_didTransitionTraitCollection
{
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  UIResponder *postTransitionResponder;
  id v8;
  char v9;
  id v10;
  void *v11;
  UIResponder *v12;
  UIResponder *v13;
  id v14;
  void *v15;
  id v16;

  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "masterViewController");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[UISplitViewControllerClassicImpl _preservedDetailController](self, "_preservedDetailController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (*(_QWORD *)&self->_splitViewControllerFlags >> 20) & 3;
  if (v16 && v5)
  {
    if (v6 == 1)
    {
      v6 = 2;
    }
    else if (v6 == 3)
    {
      -[UISplitViewControllerClassicImpl _setPreservedDetailController:](self, "_setPreservedDetailController:", 0);
      v6 = 0;
    }
  }
  self->_useChangingBoundsLayout = 0;
  -[UISplitViewControllerClassicImpl _setCollapsedState:](self, "_setCollapsedState:", v6);
  -[UISplitViewControllerClassicImpl _removeCollapsingSnapshotViews](self, "_removeCollapsingSnapshotViews");
  postTransitionResponder = self->_postTransitionResponder;
  if (postTransitionResponder)
  {
    if ((*((_BYTE *)&self->_splitViewControllerFlags + 4) & 1) == 0)
    {
      v8 = objc_loadWeakRetained((id *)p_svc);
      v9 = objc_msgSend(v8, "_containsResponder:", self->_postTransitionResponder);

      if ((v9 & 1) != 0)
      {
        if ((*((_BYTE *)&self->_splitViewControllerFlags + 4) & 2) != 0)
        {
          -[UIResponder becomeFirstResponder](self->_postTransitionResponder, "becomeFirstResponder");
        }
        else
        {
          v10 = objc_loadWeakRetained((id *)p_svc);
          objc_msgSend(v10, "_window");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "_setFirstResponder:", self->_postTransitionResponder);

        }
        v12 = 0;
LABEL_16:
        v13 = self->_postTransitionResponder;
        self->_postTransitionResponder = 0;

        *(_QWORD *)&self->_splitViewControllerFlags &= 0xFFFFFFFCFFFFFFFFLL;
        if (v12)
          -[UIResponder _finishResignFirstResponder](v12, "_finishResignFirstResponder");
        v14 = objc_loadWeakRetained((id *)p_svc);
        objc_msgSend(v14, "_window");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_setIsSettingFirstResponder:", 0);

        goto LABEL_19;
      }
      postTransitionResponder = self->_postTransitionResponder;
    }
    v12 = postTransitionResponder;
    goto LABEL_16;
  }
LABEL_19:

}

- (id)_deepestUnambiguousResponder
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_super_deepestActionResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_removeCollapsingSnapshotViews
{
  UISnapshotView *collapsingMasterSnapshotView;
  UISnapshotView *collapsingDetailSnapshotView;

  -[UIView removeFromSuperview](self->_collapsingMasterSnapshotView, "removeFromSuperview");
  collapsingMasterSnapshotView = self->_collapsingMasterSnapshotView;
  self->_collapsingMasterSnapshotView = 0;

  -[UIView removeFromSuperview](self->_collapsingDetailSnapshotView, "removeFromSuperview");
  collapsingDetailSnapshotView = self->_collapsingDetailSnapshotView;
  self->_collapsingDetailSnapshotView = 0;

}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  id WeakRetained;
  char v9;
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  id v24;
  float v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  if ((*((_BYTE *)&self->_splitViewControllerFlags + 4) & 8) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    v9 = objc_msgSend(WeakRetained, "isCollapsed");

    if ((v9 & 1) == 0)
    {
      if (-[UISplitViewControllerClassicImpl _hasMasterViewController](self, "_hasMasterViewController"))
      {
        v10 = objc_loadWeakRetained((id *)&self->_svc);
        objc_msgSend(v10, "masterViewController");
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v7)
        {
          -[UISplitViewControllerClassicImpl _masterViewFrame:](self, "_masterViewFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, height);
          goto LABEL_23;
        }
      }
      v12 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v12, "detailViewController");
      v13 = (id)objc_claimAutoreleasedReturnValue();

      if (v13 == v7)
      {
        -[UISplitViewControllerClassicImpl _detailViewFrame:](self, "_detailViewFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, height);
LABEL_23:
        width = v14;
        height = v15;
        goto LABEL_20;
      }
    }
    goto LABEL_18;
  }
  if (!self->_transitioningToInternalMode)
    goto LABEL_18;
  if (-[UISplitViewControllerClassicImpl _hasMasterViewController](self, "_hasMasterViewController"))
  {
    v16 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v16, "masterViewController");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    if (v17 == v7)
    {
      -[UISplitViewControllerClassicImpl _primaryColumnWidthForSize:isCompact:](self, "_primaryColumnWidthForSize:isCompact:", 0, width, height);
      width = v30;
      goto LABEL_20;
    }
  }
  v18 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v18, "detailViewController");
  v19 = objc_claimAutoreleasedReturnValue();
  if ((id)v19 == v7)
  {

    goto LABEL_15;
  }
  v20 = (void *)v19;
  if (!-[UISplitViewControllerClassicImpl _isTransitioningFromCollapsedToSeparated](self, "_isTransitioningFromCollapsedToSeparated"))
  {

    goto LABEL_18;
  }
  -[UISplitViewControllerClassicImpl _preservedDetailController](self, "_preservedDetailController");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  if (v21 != v7)
  {
LABEL_18:
    v24 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v24, "_super_sizeForChildContentContainer:withParentContainerSize:", v7, width, height);
    width = v26;
    height = v27;
    goto LABEL_19;
  }
LABEL_15:
  if (self->_transitioningToInternalMode == 1)
  {
    -[UISplitViewControllerClassicImpl _primaryColumnWidthForSize:isCompact:](self, "_primaryColumnWidthForSize:isCompact:", 0, width, height);
    v23 = v22;
    v24 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v24, "gutterWidth");
    width = width - (v23 + v25);
LABEL_19:

  }
LABEL_20:

  v28 = width;
  v29 = height;
  result.height = v29;
  result.width = v28;
  return result;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v7;
  id v8;
  id WeakRetained;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  _BOOL4 v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  int v36;
  id v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  UISnapshotView *v59;
  id v60;
  void *v61;
  void *v62;
  UISnapshotView *v63;
  UISnapshotView *collapsingMasterSnapshotView;
  UISnapshotView *v65;
  void *v66;
  _QWORD *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  UISnapshotView *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  UISnapshotView *v82;
  UISnapshotView *collapsingDetailSnapshotView;
  UISnapshotView *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  UISnapshotView *v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  UISnapshotView *v98;
  UISnapshotView *v99;
  UISnapshotView *v100;
  void *v101;
  void *v102;
  _QWORD v103[5];
  _QWORD v104[5];
  _QWORD v105[5];
  _QWORD v106[5];
  _QWORD v107[5];
  _QWORD v108[5];
  id v109;
  id v110;

  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_existingView");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {

    goto LABEL_6;
  }
  v11 = (void *)v10;
  v12 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v12, "traitCollection");
  v102 = v8;
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "horizontalSizeClass");
  v15 = objc_msgSend(v7, "horizontalSizeClass");

  v8 = v102;
  if (v14 == v15)
  {
LABEL_6:
    v23 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v23, "_super_willTransitionToTraitCollection:withTransitionCoordinator:", v7, v8);

    goto LABEL_7;
  }
  objc_storeStrong((id *)&self->_transitioningToTraitCollection, a3);
  if (objc_msgSend(v7, "horizontalSizeClass") == 1)
  {
    self->_useChangingBoundsLayout = 1;
    v16 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v16, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    self->_viewBoundsBeforeCollapse.origin.x = v18;
    self->_viewBoundsBeforeCollapse.origin.y = v19;
    self->_viewBoundsBeforeCollapse.size.width = v20;
    self->_viewBoundsBeforeCollapse.size.height = v21;

    v22 = 0;
  }
  else
  {
    v22 = objc_msgSend(v7, "horizontalSizeClass") == 2;
  }
  v24 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v24, "traitCollection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v26, "_window");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "firstResponder");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v29, "detailViewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
    v32 = v30;
  else
    v32 = objc_loadWeakRetained((id *)&self->_svc);
  v33 = v32;

  if (objc_msgSend(v33, "_containsResponder:", v28))
  {
    if ((*((_BYTE *)&self->_splitViewControllerFlags + 3) & 0x10) == 0
      || (v34 = objc_loadWeakRetained(&self->_delegate),
          v35 = objc_loadWeakRetained((id *)&self->_svc),
          v36 = objc_msgSend(v34, "_splitViewControllerShouldRestoreResponderAfterTraitCollectionTransition:", v35),
          v35,
          v34,
          v36))
    {
      objc_storeStrong((id *)&self->_postTransitionResponder, v28);
      *(_QWORD *)&self->_splitViewControllerFlags &= 0xFFFFFFFCFFFFFFFFLL;
      v37 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v37, "_window");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "_setIsSettingFirstResponder:", 1);

    }
  }
  v39 = MEMORY[0x1E0C809B0];
  v108[0] = MEMORY[0x1E0C809B0];
  v108[1] = 3221225472;
  v108[2] = __94__UISplitViewControllerClassicImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v108[3] = &unk_1E16BF9D0;
  v108[4] = self;
  v109 = v25;
  v8 = v102;
  v40 = v102;
  v110 = v40;
  v107[0] = v39;
  v107[1] = 3221225472;
  v107[2] = __94__UISplitViewControllerClassicImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_2;
  v107[3] = &unk_1E16B2150;
  v107[4] = self;
  v41 = v25;
  objc_msgSend(v40, "animateAlongsideTransition:completion:", v108, v107);

  v42 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v42, "_super_willTransitionToTraitCollection:withTransitionCoordinator:", v7, v40);

  if (v22)
  {
    v43 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v43, "masterViewController");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    -[UISplitViewControllerClassicImpl _preservedDetailController](self, "_preservedDetailController");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      v46 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v46, "overrideTraitCollectionForChildViewController:", v44);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v47)
      {
        if (v45)
        {
          v48 = objc_loadWeakRetained((id *)&self->_svc);
          objc_msgSend(v48, "overrideTraitCollectionForChildViewController:", v45);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          v50 = objc_loadWeakRetained((id *)&self->_svc);
          objc_msgSend((id)objc_opt_class(), "_traitCollectionWithParentTraitCollection:overrideTraitCollection:", v7, v49);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v45, "_unsafeParentWillTransitionToTraitCollection:withTransitionCoordinator:", v51, v40);
          v8 = v102;

        }
      }
    }

  }
  -[UISplitViewControllerClassicImpl _removeCollapsingSnapshotViews](self, "_removeCollapsingSnapshotViews");
  if (-[UISplitViewControllerClassicImpl _isMasterViewShown](self, "_isMasterViewShown"))
  {
    v52 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v52, "masterViewController");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "childModalViewController");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      v55 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v55, "masterViewController");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "_presentationController");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "_firstCurrentContextChildInWindow");
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      if (v58)
      {
        v59 = [UISnapshotView alloc];
        v60 = objc_loadWeakRetained((id *)&self->_svc);
        objc_msgSend(v60, "masterViewController");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "view");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "frame");
        v63 = -[UISnapshotView initWithFrame:](v59, "initWithFrame:");
        collapsingMasterSnapshotView = self->_collapsingMasterSnapshotView;
        self->_collapsingMasterSnapshotView = v63;

        v65 = self->_collapsingMasterSnapshotView;
        objc_msgSend(v58, "view");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISnapshotView captureSnapshotOfView:withSnapshotType:](v65, "captureSnapshotOfView:withSnapshotType:", v66, 1);

        v106[0] = MEMORY[0x1E0C809B0];
        v106[1] = 3221225472;
        v106[2] = __94__UISplitViewControllerClassicImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_3;
        v106[3] = &unk_1E16B1B28;
        v106[4] = self;
        v67 = v106;
      }
      else
      {
        if (!-[UIPopoverController isPopoverVisible](self->_hiddenPopoverController, "isPopoverVisible")
          || objc_msgSend(v7, "horizontalSizeClass") != 1)
        {
          goto LABEL_27;
        }
        v105[0] = MEMORY[0x1E0C809B0];
        v105[1] = 3221225472;
        v105[2] = __94__UISplitViewControllerClassicImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_4;
        v105[3] = &unk_1E16B1B28;
        v105[4] = self;
        v67 = v105;
      }
      +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v67);
LABEL_27:

    }
  }
  v68 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v68, "detailViewController");
  v69 = objc_claimAutoreleasedReturnValue();
  if (!v69)
  {
LABEL_32:

    goto LABEL_33;
  }
  v70 = (void *)v69;
  v71 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v71, "detailViewController");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "childModalViewController");
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (v73)
  {
    v74 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v74, "detailViewController");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "_presentationController");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "_firstCurrentContextChildInWindow");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (v68)
    {
      v77 = [UISnapshotView alloc];
      v78 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v78, "detailViewController");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "childModalViewController");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "view");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "frame");
      v82 = -[UISnapshotView initWithFrame:](v77, "initWithFrame:");
      collapsingDetailSnapshotView = self->_collapsingDetailSnapshotView;
      self->_collapsingDetailSnapshotView = v82;

      v8 = v102;
      v84 = self->_collapsingDetailSnapshotView;
      objc_msgSend(v68, "view");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISnapshotView captureSnapshotOfView:withSnapshotType:](v84, "captureSnapshotOfView:withSnapshotType:", v85, 1);

      v104[0] = MEMORY[0x1E0C809B0];
      v104[1] = 3221225472;
      v104[2] = __94__UISplitViewControllerClassicImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_5;
      v104[3] = &unk_1E16B1B28;
      v104[4] = self;
      +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v104);
    }
    goto LABEL_32;
  }
LABEL_33:
  -[UISplitViewControllerClassicImpl _preservedDetailController](self, "_preservedDetailController");
  v86 = objc_claimAutoreleasedReturnValue();
  if (v86)
  {
    v87 = (void *)v86;
    -[UISplitViewControllerClassicImpl _preservedDetailController](self, "_preservedDetailController");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "childModalViewController");
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    if (v89)
    {
      -[UISplitViewControllerClassicImpl _preservedDetailController](self, "_preservedDetailController");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "_presentationController");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "_firstCurrentContextChildInWindow");
      v92 = (void *)objc_claimAutoreleasedReturnValue();

      if (v92)
      {
        v93 = [UISnapshotView alloc];
        v94 = objc_loadWeakRetained((id *)&self->_svc);
        objc_msgSend(v94, "detailViewController");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "childModalViewController");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "view");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "frame");
        v98 = -[UISnapshotView initWithFrame:](v93, "initWithFrame:");
        v99 = self->_collapsingMasterSnapshotView;
        self->_collapsingMasterSnapshotView = v98;

        v100 = self->_collapsingMasterSnapshotView;
        objc_msgSend(v92, "view");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISnapshotView captureSnapshotOfView:withSnapshotType:](v100, "captureSnapshotOfView:withSnapshotType:", v101, 1);

      }
      v103[0] = MEMORY[0x1E0C809B0];
      v103[1] = 3221225472;
      v103[2] = __94__UISplitViewControllerClassicImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_6;
      v103[3] = &unk_1E16B1B28;
      v103[4] = self;
      +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v103);

    }
  }
LABEL_7:

}

uint64_t __94__UISplitViewControllerClassicImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_animateTransitionFromTraitCollection:withTransitionCoordinator:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __94__UISplitViewControllerClassicImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_didTransitionTraitCollection");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 264);
  *(_QWORD *)(v2 + 264) = 0;

}

void __94__UISplitViewControllerClassicImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "masterViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 0, 0);

}

void __94__UISplitViewControllerClassicImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "masterViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 0, 0);

}

void __94__UISplitViewControllerClassicImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_5(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "detailViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 0, 0);

}

void __94__UISplitViewControllerClassicImpl_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_6(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_preservedDetailController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 0, 0);

}

- (void)traitCollectionDidChange:(id)a3
{
  UISplitViewController **p_svc;
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  p_svc = &self->_svc;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(WeakRetained, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "horizontalSizeClass");
  v9 = objc_msgSend(v5, "horizontalSizeClass");

  if (v8 != v9)
    -[UISplitViewControllerClassicImpl _setMasterOverrideTraitCollectionActive:](self, "_setMasterOverrideTraitCollectionActive:", 1);
}

void __56__UISplitViewControllerClassicImpl_masterViewController__block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = kUISVCUsesExtraWidePrimaryColumn_block_invoke___s_category;
  if (!kUISVCUsesExtraWidePrimaryColumn_block_invoke___s_category)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&kUISVCUsesExtraWidePrimaryColumn_block_invoke___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Splitview controller %@ is expected to have a view controller at index 0 before it's used!", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)hidesMasterViewInLandscape
{
  if (-[UISplitViewControllerClassicImpl _isHidesMasterInLandscapeInvalid](self, "_isHidesMasterInLandscapeInvalid"))
    -[UISplitViewControllerClassicImpl _updateDelegateHiddenMasterAspectRatios](self, "_updateDelegateHiddenMasterAspectRatios");
  return (*(_BYTE *)&self->_splitViewControllerFlags >> 2) & 1;
}

- (BOOL)_hidesMasterViewInCurrentOrientation
{
  UISplitViewControllerClassicImpl *v2;
  id WeakRetained;

  v2 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  LOBYTE(v2) = -[UISplitViewControllerClassicImpl _hidesMasterViewInOrientation:medusaState:](v2, "_hidesMasterViewInOrientation:medusaState:", objc_msgSend(WeakRetained, "interfaceOrientation"), -[UISplitViewControllerClassicImpl _medusaState](v2, "_medusaState"));

  return (char)v2;
}

- (BOOL)_hidesMasterViewInOrientation:(int64_t)a3 medusaState:(int64_t)a4
{
  _BOOL4 v4;
  id WeakRetained;
  char v6;

  if ((unint64_t)(a4 - 1) >= 3)
  {
    if ((unint64_t)(a3 - 1) > 1)
    {
      LOBYTE(v4) = -[UISplitViewControllerClassicImpl hidesMasterViewInLandscape](self, "hidesMasterViewInLandscape");
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
      v6 = objc_msgSend(WeakRetained, "hidesMasterViewInPortrait");

      LOBYTE(v4) = v6;
    }
  }
  else
  {
    return (3u >> ((a4 - 1) & 7)) & 1;
  }
  return v4;
}

- (void)setHidesMasterViewInPortrait:(BOOL)a3
{
  _BOOL8 v3;
  UISplitViewController **p_svc;
  id WeakRetained;
  int v7;
  id v8;
  _BOOL4 v9;
  _DWORD *v10;
  unsigned int v11;
  id v12;
  void *v13;
  _DWORD *v14;
  unsigned int v15;
  id v16;
  void *v17;
  id v18;

  if ((*(_BYTE *)&self->_splitViewControllerFlags & 0x10) == 0)
  {
    v3 = a3;
    p_svc = &self->_svc;
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    v7 = objc_msgSend(WeakRetained, "hidesMasterViewInPortrait");

    if (v7 != v3)
    {
      v8 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v8, "_window");
      v18 = (id)objc_claimAutoreleasedReturnValue();

      if (v18)
        v9 = (unint64_t)(objc_msgSend((id)UIApp, "_sceneInterfaceOrientationFromWindow:") - 3) < 2;
      else
        v9 = 0;
      -[UISplitViewControllerClassicImpl _setDelegateHidesMaster:inAspectRatio:](self, "_setDelegateHidesMaster:inAspectRatio:", v3, 1);
      if (!v9 && !v3)
      {
        v10 = objc_loadWeakRetained((id *)p_svc);
        if (v10)
        {
          v11 = ((v10[92] >> 1) & 3) - 1;

          if (v11 <= 1)
            -[UISplitViewControllerClassicImpl _showMasterViewAnimated:](self, "_showMasterViewAnimated:", 0);
        }
      }
      v12 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v12, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setNeedsLayout");

      if (v9 || !v3)
        goto LABEL_17;
      v14 = objc_loadWeakRetained((id *)p_svc);
      if (v14)
      {
        v15 = ((v14[92] >> 1) & 3) - 1;

        if (v15 > 1)
        {
LABEL_17:

          return;
        }
        v16 = objc_loadWeakRetained((id *)p_svc);
        objc_msgSend(v16, "masterViewController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewController __viewDidDisappear:]((uint64_t)v17, 0);

      }
      else
      {
        v16 = 0;
      }

      goto LABEL_17;
    }
  }
}

- (void)_showMasterViewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  v3 = a3;
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "masterViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "__viewWillAppear:", v3);

  v8 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v8, "masterViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 != v13)
  {
    v14 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v14, "masterViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISplitViewControllerClassicImpl _masterViewFrame](self, "_masterViewFrame");
    objc_msgSend(v16, "setFrame:");

    v21 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v21, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v18, "masterViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "insertSubview:atIndex:", v20, 0);

  }
}

- (double)_masterPresentationAnimationDuration
{
  return 0.2;
}

- (void)setMinimumPrimaryColumnWidth:(double)a3
{
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  if (self->_minimumPrimaryColumnWidth != a3)
  {
    self->_minimumPrimaryColumnWidth = a3;
    p_svc = &self->_svc;
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");

    if (+[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"))
    {
      v7 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v7, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "layoutBelowIfNeeded");

    }
  }
}

- (void)setMaximumPrimaryColumnWidth:(double)a3
{
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  if (self->_maximumPrimaryColumnWidth != a3)
  {
    self->_maximumPrimaryColumnWidth = a3;
    p_svc = &self->_svc;
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");

    if (+[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"))
    {
      v7 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v7, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "layoutBelowIfNeeded");

    }
  }
}

- (void)setPreferredPrimaryColumnWidthFraction:(double)a3
{
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  if (self->_preferredPrimaryColumnWidthFraction != a3)
  {
    self->_preferredPrimaryColumnWidthFraction = a3;
    p_svc = &self->_svc;
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");

    if (+[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"))
    {
      v7 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v7, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "layoutBelowIfNeeded");

    }
  }
}

+ (double)_defaultGutterWidthInView:(id)a3
{
  id v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  v3 = a3;
  v4 = 1.0;
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(v3, "_screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "_screen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "scale");
      v8 = 1.0 / v7;

      objc_msgSend(v3, "_window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "convertRect:fromWindow:", 0, 0.0, 0.0, v8, v8);
      objc_msgSend(v3, "convertRect:fromView:", 0);
      v4 = v10;
    }
    else
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "scale");
      v4 = 1.0 / v11;
    }

  }
  return v4;
}

- (float)gutterWidth
{
  float gutterWidth;
  void *v4;
  id WeakRetained;
  void *v6;
  double v7;

  gutterWidth = self->_gutterWidth;
  if (gutterWidth == -3.4028e38)
  {
    v4 = (void *)objc_opt_class();
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "_existingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_defaultGutterWidthInView:", v6);
    gutterWidth = v7;

  }
  return gutterWidth;
}

- (void)setGutterWidth:(float)a3
{
  void *v3;
  id WeakRetained;

  self->_gutterWidth = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_existingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)setPresentsWithGesture:(BOOL)a3
{
  if (self->_presentsWithGesture != a3)
  {
    self->_presentsWithGesture = a3;
    -[UISplitViewControllerClassicImpl _addOrRemovePopoverPresentationGestureRecognizer](self, "_addOrRemovePopoverPresentationGestureRecognizer");
  }
}

- (int64_t)primaryEdge
{
  return self->_primaryEdge;
}

- (void)setPrimaryEdge:(int64_t)a3
{
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (self->_primaryEdge != a3)
  {
    self->_primaryEdge = a3;
    p_svc = &self->_svc;
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");

    v6 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v6, "masterViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsLayout");

    v11 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v11, "detailViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNeedsLayout");

  }
}

- (int64_t)preferredDisplayMode
{
  return self->_preferredDisplayMode;
}

- (id)_defaultDisplayModes
{
  int64_t v3;
  _BOOL4 v4;
  void *v5;
  void *v6;

  v3 = -[UISplitViewControllerClassicImpl _currentInterfaceIdiom](self, "_currentInterfaceIdiom");
  if (v3)
  {
    if (v3 == 1)
    {
      v4 = -[UISplitViewControllerClassicImpl _hidesMasterViewInCurrentOrientation](self, "_hidesMasterViewInCurrentOrientation");
      v5 = &unk_1E1A93188;
      v6 = &unk_1E1A93170;
      goto LABEL_6;
    }
    return &unk_1E1A931D0;
  }
  if (!-[UISplitViewControllerClassicImpl _iPhoneShouldUseOverlayInCurrentEnvironment](self, "_iPhoneShouldUseOverlayInCurrentEnvironment"))return &unk_1E1A931D0;
  v4 = -[UISplitViewControllerClassicImpl _hidesMasterViewInCurrentOrientation](self, "_hidesMasterViewInCurrentOrientation");
  v5 = &unk_1E1A931B8;
  v6 = &unk_1E1A931A0;
LABEL_6:
  if (v4)
    return v6;
  else
    return v5;
}

- (int64_t)_defaultTargetDisplayMode
{
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  int64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  int64_t v16;

  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "horizontalSizeClass");

  if (v6 == 1)
    return 0;
  v8 = -[UISplitViewControllerClassicImpl _currentInterfaceIdiom](self, "_currentInterfaceIdiom");
  v9 = objc_loadWeakRetained((id *)p_svc);
  v10 = objc_msgSend(v9, "displayMode");

  v11 = objc_loadWeakRetained((id *)p_svc);
  v12 = objc_msgSend(v11, "preferredDisplayMode");

  if (!v12)
  {
    if (v8 == 1)
    {
      if (!-[UISplitViewControllerClassicImpl _hidesMasterViewInCurrentOrientation](self, "_hidesMasterViewInCurrentOrientation"))
      {
        if ((dyld_program_sdk_at_least() & (v10 == 1)) != 0)
          return 2;
        else
          return 0;
      }
    }
    else if (v8
           || !-[UISplitViewControllerClassicImpl _iPhoneShouldUseOverlayInCurrentEnvironment](self, "_iPhoneShouldUseOverlayInCurrentEnvironment"))
    {
      if (v10 == 1)
        return 2;
      else
        return 1;
    }
    if (v10 == 1)
      return 3;
    else
      return 1;
  }
  if (v10 != 1)
    return 1;
  v13 = objc_loadWeakRetained((id *)p_svc);
  v14 = objc_msgSend(v13, "preferredDisplayMode");

  if (v14 == 1)
  {
    if (v8 == 1
      || !v8
      && -[UISplitViewControllerClassicImpl _iPhoneShouldUseOverlayInCurrentEnvironment](self, "_iPhoneShouldUseOverlayInCurrentEnvironment"))
    {
      return 3;
    }
    else
    {
      return 2;
    }
  }
  else
  {
    v15 = objc_loadWeakRetained((id *)p_svc);
    v16 = objc_msgSend(v15, "preferredDisplayMode");

    return v16;
  }
}

uint64_t __83__UISplitViewControllerClassicImpl__changeToDisplayMode_forCurrentOrientationOnly___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentMasterViewController:", 0);
}

- (void)_popoverController:(id)a3 willChangeToVisible:(BOOL)a4
{
  uint64_t v5;
  id WeakRetained;

  if ((*((_BYTE *)&self->_splitViewControllerFlags + 4) & 4) == 0)
  {
    if (a4)
      v5 = 3;
    else
      v5 = 1;
    -[UISplitViewControllerClassicImpl _displayModeWillChangeTo:](self, "_displayModeWillChangeTo:", v5);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "setNeedsStatusBarAppearanceUpdate");

}

- (void)_popoverController:(id)a3 didChangeFromVisible:(BOOL)a4
{
  id WeakRetained;

  if ((*((_BYTE *)&self->_splitViewControllerFlags + 4) & 4) == 0)
    -[UISplitViewControllerClassicImpl _displayModeDidChange](self, "_displayModeDidChange", a3, a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "setNeedsStatusBarAppearanceUpdate");

}

- (int64_t)_effectiveTargetDisplayMode
{
  return self->_effectiveTargetDisplayMode;
}

- (void)_triggerDisplayModeAction:(id)a3
{
  int64_t v4;
  int64_t v5;
  _QWORD v6[6];

  v4 = -[UISplitViewControllerClassicImpl _effectiveTargetDisplayMode](self, "_effectiveTargetDisplayMode", a3);
  if (v4)
  {
    v5 = v4;
    -[UISplitViewControllerClassicImpl _masterPresentationAnimationDuration](self, "_masterPresentationAnimationDuration");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__UISplitViewControllerClassicImpl__triggerDisplayModeAction___block_invoke;
    v6[3] = &unk_1E16B1888;
    v6[4] = self;
    v6[5] = v5;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v6);
  }
}

uint64_t __62__UISplitViewControllerClassicImpl__triggerDisplayModeAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_changeToDisplayMode:forCurrentOrientationOnly:", *(_QWORD *)(a1 + 40), 1);
}

- (id)displayModeButtonItem
{
  UISplitViewControllerDisplayModeBarButtonItem *displayModeButtonItem;
  UISplitViewControllerDisplayModeBarButtonItem *v4;
  UISplitViewControllerDisplayModeBarButtonItem *v5;

  displayModeButtonItem = self->_displayModeButtonItem;
  if (!displayModeButtonItem)
  {
    v4 = -[UIBarButtonItem initWithImage:landscapeImagePhone:style:target:action:]([UISplitViewControllerDisplayModeBarButtonItem alloc], "initWithImage:landscapeImagePhone:style:target:action:", 0, 0, 0, self, sel__triggerDisplayModeAction_);
    v5 = self->_displayModeButtonItem;
    self->_displayModeButtonItem = v4;

    -[UISplitViewControllerDisplayModeBarButtonItem _setImpl:](self->_displayModeButtonItem, "_setImpl:", self);
    -[UISplitViewControllerClassicImpl _updateDisplayModeButtonItem](self, "_updateDisplayModeButtonItem");
    displayModeButtonItem = self->_displayModeButtonItem;
  }
  return displayModeButtonItem;
}

- (void)_displayModeBarButtonItemWasUsedForFirstTime:(id)a3
{
  id WeakRetained;
  int v5;
  id v6;
  void *v7;

  if (-[UISplitViewControllerClassicImpl _iPhoneShouldUseOverlayInCurrentEnvironment](self, "_iPhoneShouldUseOverlayInCurrentEnvironment", a3))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    v5 = objc_msgSend(WeakRetained, "isViewLoaded");

    if (v5)
    {
      v6 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v6, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setNeedsLayout");

      -[UISplitViewControllerClassicImpl _cacheEffectiveTargetDisplayMode](self, "_cacheEffectiveTargetDisplayMode");
    }
  }
}

- (void)_setDisplayModeButtonItemTitle:(id)a3
{
  NSString *v4;
  NSString *displayModeButtonItemTitle;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;

  v4 = (NSString *)a3;
  displayModeButtonItemTitle = self->_displayModeButtonItemTitle;
  if (displayModeButtonItemTitle != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqualToString:](displayModeButtonItemTitle, "isEqualToString:", v4);
    v4 = v9;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      v8 = self->_displayModeButtonItemTitle;
      self->_displayModeButtonItemTitle = v7;

      -[UISplitViewControllerClassicImpl _updateDisplayModeButtonItem](self, "_updateDisplayModeButtonItem");
      v4 = v9;
    }
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  if (-[UISplitViewControllerClassicImpl _isMasterViewShown](self, "_isMasterViewShown"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "masterViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController __viewWillDisappear:]((uint64_t)v6, v3);

  }
  v8 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v8, "detailViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController __viewWillDisappear:]((uint64_t)v7, v3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  if (-[UISplitViewControllerClassicImpl _isMasterViewShown](self, "_isMasterViewShown"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "masterViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController __viewDidDisappear:]((uint64_t)v6, v3);

  }
  v8 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v8, "detailViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController __viewDidDisappear:]((uint64_t)v7, v3);

}

- (BOOL)_optsOutOfPopoverControllerHierarchyCheck
{
  return 1;
}

- (BOOL)_shouldPreventAutorotation
{
  void *v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1
    || !-[UISplitViewControllerClassicImpl _isMasterViewShown](self, "_isMasterViewShown"))
  {
    return 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "masterViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "childModalViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 != 0;

  return v9;
}

uint64_t __73__UISplitViewControllerClassicImpl__layoutContainerViewWillMoveToWindow___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setShouldPreventRotationHook:", 0);
}

uint64_t __73__UISplitViewControllerClassicImpl__layoutContainerViewWillMoveToWindow___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shouldPreventAutorotation");
}

- (void)_willBeginSnapshotSession
{
  int v3;
  int64_t v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v3 = objc_msgSend(WeakRetained, "_isCollapsed");
  v4 = 1;
  if (v3)
    v4 = 2;
  self->_suspendedState = v4;

}

- (void)_didEndSnapshotSession
{
  self->_suspendedState = 0;
}

- (void)_presentMasterViewController:(BOOL)a3
{
  _BOOL8 v3;
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  UIPopoverController *hiddenPopoverController;
  unint64_t v12;
  void *v13;
  id v14;

  v3 = a3;
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_existingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (-[UISplitViewControllerClassicImpl _canDisplayHostedMaster](self, "_canDisplayHostedMaster"))
    {
      *(_QWORD *)&self->_splitViewControllerFlags &= ~0x20000000uLL;
      v9 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v9, "masterViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISplitViewControllerClassicImpl _setupHiddenPopoverControllerWithViewController:](self, "_setupHiddenPopoverControllerWithViewController:", v10);

      if (!-[UIPopoverController isPopoverVisible](self->_hiddenPopoverController, "isPopoverVisible"))
      {
        hiddenPopoverController = self->_hiddenPopoverController;
        v12 = -[UISplitViewControllerClassicImpl _targetEdgeForPopover](self, "_targetEdgeForPopover");
        v14 = objc_loadWeakRetained((id *)p_svc);
        objc_msgSend(v14, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPopoverController _presentPopoverFromEdge:ofView:animated:](hiddenPopoverController, "_presentPopoverFromEdge:ofView:animated:", v12, v13, v3);

      }
    }
  }
  else
  {
    *(_QWORD *)&self->_splitViewControllerFlags |= 0x20000000uLL;
  }
}

- (void)_dismissMasterViewController:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  *(_QWORD *)&self->_splitViewControllerFlags &= ~0x20000000uLL;
  if (-[UISplitViewControllerClassicImpl _canDisplayHostedMaster](self, "_canDisplayHostedMaster"))
  {
    if (-[UIPopoverController isPopoverVisible](self->_hiddenPopoverController, "isPopoverVisible"))
    {
      -[UISplitViewControllerClassicImpl _displayModeWillChangeTo:](self, "_displayModeWillChangeTo:", 1);
      -[UIPopoverController dismissPopoverAnimated:](self->_hiddenPopoverController, "dismissPopoverAnimated:", v3);
      -[UISplitViewControllerClassicImpl _displayModeDidChange](self, "_displayModeDidChange");
    }
  }
}

- (void)toggleMasterVisible:(id)a3
{
  if (-[UISplitViewControllerClassicImpl _canDisplayHostedMaster](self, "_canDisplayHostedMaster", a3))
  {
    if (-[UISplitViewControllerClassicImpl _isMasterPopoverVisible](self, "_isMasterPopoverVisible"))
      -[UISplitViewControllerClassicImpl _dismissMasterViewController:](self, "_dismissMasterViewController:", 1);
    else
      -[UISplitViewControllerClassicImpl _presentMasterViewController:](self, "_presentMasterViewController:", 1);
  }
}

- (void)_descendantWillPresentViewController:(id)a3 modalSourceViewController:(id)a4 presentationController:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id WeakRetained;
  id v13;
  id v14;
  id v15;
  BOOL v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;

  v6 = a6;
  v24 = a3;
  v10 = a4;
  v11 = a5;
  if (-[UISplitViewControllerClassicImpl _canDisplayHostedMaster](self, "_canDisplayHostedMaster")
    && -[UISplitViewControllerClassicImpl _isMasterPopoverVisible](self, "_isMasterPopoverVisible"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "masterViewController");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v14 = v10;
    if (!v14)
      goto LABEL_12;
    v15 = v14;
    v16 = 0;
    do
    {
      v17 = objc_loadWeakRetained((id *)&self->_svc);

      if (v15 == v17 || v16)
        break;
      v16 = v15 == v13;
      objc_msgSend(v15, "parentViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        v20 = v18;
      }
      else
      {
        objc_msgSend(v15, "parentModalViewController");
        v20 = (id)objc_claimAutoreleasedReturnValue();
      }
      v21 = v20;

      v15 = v21;
    }
    while (v21);

    if (!v16)
LABEL_12:
      -[UISplitViewControllerClassicImpl _dismissMasterViewController:](self, "_dismissMasterViewController:", v6);

  }
  v22 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v22, "splitViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_descendantWillPresentViewController:modalSourceViewController:presentationController:animated:", v24, v10, v11, v6);

}

- (CGSize)_contentSizeForChildViewController:(id)a3 inPopoverController:(id)a4
{
  UISplitViewController **p_svc;
  id WeakRetained;
  double v6;
  double v7;
  id v8;
  void *v9;
  CGFloat Height;
  double v11;
  double v12;
  CGSize result;
  CGRect v14;

  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "primaryColumnWidth");
  v7 = v6;
  v8 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  Height = CGRectGetHeight(v14);

  v11 = v7;
  v12 = Height;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)popoverWillAppear:(id)a3
{
  id v4;
  UIPopoverController *v5;
  UIPopoverController *hiddenPopoverController;
  id WeakRetained;
  id v8;
  UIPopoverController *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];

  v4 = a3;
  if (self->_hiddenPopoverController)
  {
    v12 = v4;
    objc_msgSend(v4, "object");
    v5 = (UIPopoverController *)objc_claimAutoreleasedReturnValue();
    hiddenPopoverController = self->_hiddenPopoverController;

    v4 = v12;
    if (v5 == hiddenPopoverController)
    {
      if ((*((_BYTE *)&self->_splitViewControllerFlags + 1) & 8) != 0)
      {
        WeakRetained = objc_loadWeakRetained(&self->_delegate);
        v8 = objc_loadWeakRetained((id *)&self->_svc);
        v9 = self->_hiddenPopoverController;
        v10 = v8;
        objc_msgSend(v10, "masterViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "splitViewController:popoverController:willPresentViewController:", v10, v9, v11);

      }
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __54__UISplitViewControllerClassicImpl_popoverWillAppear___block_invoke;
      v13[3] = &unk_1E16B1B28;
      v13[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v13);
      v4 = v12;
    }
  }

}

void __54__UISplitViewControllerClassicImpl_popoverWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "masterViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v7, "masterViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

}

- (unint64_t)_lastFocusedChildViewControllerIndex
{
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  unint64_t lastFocusedChildViewControllerIndex;
  id v8;
  void *v9;
  unint64_t v10;

  if (self->_lastFocusedChildViewControllerIndex == 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    return 0x7FFFFFFFFFFFFFFFLL;
  lastFocusedChildViewControllerIndex = self->_lastFocusedChildViewControllerIndex;
  v8 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v8, "viewControllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count") - 1;

  if (lastFocusedChildViewControllerIndex >= v10)
    return v10;
  else
    return lastFocusedChildViewControllerIndex;
}

- (id)_orderedPreferredFocusedViewControllers
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (dyld_program_sdk_at_least() && (unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayByAddingObject:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v3;
  }

  return v6;
}

- (id)preferredFocusedView
{
  unint64_t v3;
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v6;
  unint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = -[UISplitViewControllerClassicImpl _lastFocusedChildViewControllerIndex](self, "_lastFocusedChildViewControllerIndex");
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v3 >= v7)
  {
    v11 = 0;
    goto LABEL_6;
  }
  v8 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v8, "viewControllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", -[UISplitViewControllerClassicImpl _lastFocusedChildViewControllerIndex](self, "_lastFocusedChildViewControllerIndex"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredFocusedView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11 || (-[UIView _containsPreferredFocusableView](v11) & 1) == 0)
  {
LABEL_6:
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[UISplitViewControllerClassicImpl _orderedPreferredFocusedViewControllers](self, "_orderedPreferredFocusedViewControllers", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
LABEL_8:
      v16 = 0;
      v17 = v11;
      while (1)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "preferredFocusedView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          if ((-[UIView _containsPreferredFocusableView](v11) & 1) != 0)
            break;
        }
        ++v16;
        v17 = v11;
        if (v14 == v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v14)
            goto LABEL_8;
          goto LABEL_15;
        }
      }
    }
    else
    {
LABEL_15:

      if (v11)
        return v11;
      v12 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v12, "_super_preferredFocusedView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v11;
}

- (id)preferredFocusEnvironments
{
  id v3;
  unint64_t v4;
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v7;
  unint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = -[UISplitViewControllerClassicImpl _lastFocusedChildViewControllerIndex](self, "_lastFocusedChildViewControllerIndex");
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v4 < v8)
  {
    v9 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v9, "viewControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", -[UISplitViewControllerClassicImpl _lastFocusedChildViewControllerIndex](self, "_lastFocusedChildViewControllerIndex"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v3, "addObject:", v11);

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[UISplitViewControllerClassicImpl _orderedPreferredFocusedViewControllers](self, "_orderedPreferredFocusedViewControllers", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((objc_msgSend(v3, "containsObject:", v17) & 1) == 0)
          objc_msgSend(v3, "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }

  v18 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v18, "_super_preferredFocusEnvironments");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v19);

  v20 = objc_loadWeakRetained((id *)p_svc);
  _UIFocusEnvironmentCombinedPreferredFocusEnvironments(v20, v3, objc_msgSend(v20, "_subclassPreferredFocusedViewPrioritizationType"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)_overridingPreferredFocusEnvironment
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_super_overridingPreferredFocusEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4;
  void *WeakRetained;
  char v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (-[UISplitViewControllerClassicImpl _isMasterViewShown](self, "_isMasterViewShown"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    v6 = objc_msgSend(WeakRetained, "_super_shouldUpdateFocusInContext:", v4);
  }
  else
  {
    objc_msgSend(v4, "nextFocusedView");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v7, "masterViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(WeakRetained, "isDescendantOfView:", v9))
    {
      v10 = objc_loadWeakRetained((id *)&self->_svc);
      if (objc_msgSend(v10, "presentsWithGesture"))
        v6 = -[UISplitViewControllerClassicImpl _lastFocusedChildViewControllerIndex](self, "_lastFocusedChildViewControllerIndex") != 0;
      else
        v6 = 0;

    }
    else
    {
      v6 = 1;
    }

  }
  return v6;
}

- (void)_didUpdateFocusInContext:(id)a3
{
  id v4;
  UISplitViewController **p_svc;
  id WeakRetained;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  int v22;
  UISplitViewControllerClassicImpl *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = self;
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_super_didUpdateFocusInContext:", v4);

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v7, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v4, "nextFocusedView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isDescendantOfView:", v15);

        if (v16)
        {
          v17 = objc_loadWeakRetained((id *)p_svc);
          objc_msgSend(v17, "viewControllers");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v23->_lastFocusedChildViewControllerIndex = objc_msgSend(v18, "indexOfObject:", v13);

          v19 = objc_loadWeakRetained((id *)p_svc);
          objc_msgSend(v19, "masterViewController");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13 == v20 && !-[UISplitViewControllerClassicImpl _isMasterViewShown](v23, "_isMasterViewShown"))
          {
            v21 = objc_loadWeakRetained((id *)p_svc);
            v22 = objc_msgSend(v21, "presentsWithGesture");

            if (v22)
              -[UISplitViewControllerClassicImpl _triggerDisplayModeAction:](v23, "_triggerDisplayModeAction:", v23);
          }
          else
          {

          }
          goto LABEL_13;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_13:

}

- (id)_multitaskingDragExclusionRects
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_super_multitaskingDragExclusionRects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)_primaryOffscreenGestureMode
{
  return 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  BOOL v3;
  id WeakRetained;

  if (self->_menuGestureRecognizer != a3)
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v3 = objc_msgSend(WeakRetained, "displayMode") == 1;

  return v3;
}

- (id)childViewControllerForStatusBarStyle
{
  UISplitViewController **p_svc;
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v5 = objc_msgSend(WeakRetained, "_shouldUseNewStatusBarBehavior");

  v6 = objc_loadWeakRetained((id *)p_svc);
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    if ((objc_msgSend(v6, "_shouldUseSeparateStatusBarStyles") & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      -[UISplitViewControllerClassicImpl viewControllers](self, "viewControllers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(v6, "_super_childViewControllerForStatusBarStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  return 0;
}

- (int64_t)preferredLeadingStatusBarStyle
{
  UISplitViewController **p_svc;
  id WeakRetained;
  int v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v5 = objc_msgSend(WeakRetained, "_shouldUseSeparateStatusBarStyles");

  if (!v5)
    return 4;
  v6 = objc_loadWeakRetained((id *)p_svc);
  v7 = objc_msgSend(v6, "displayMode");
  -[UISplitViewControllerClassicImpl viewControllers](self, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 == 1)
    objc_msgSend(v8, "lastObject");
  else
    objc_msgSend(v8, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "_effectiveStatusBarStyleViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "preferredStatusBarStyle");
  if (v13 == 1)
    v10 = 1;
  else
    v10 = 2 * (v13 == 3);

  return v10;
}

- (int64_t)preferredTrailingStatusBarStyle
{
  id WeakRetained;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v4 = objc_msgSend(WeakRetained, "_shouldUseSeparateStatusBarStyles");

  if (!v4)
    return 4;
  -[UISplitViewControllerClassicImpl viewControllers](self, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_effectiveStatusBarStyleViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "preferredStatusBarStyle");
  if (v8 == 1)
    v9 = 1;
  else
    v9 = 2 * (v8 == 3);

  return v9;
}

- (int64_t)preferredCenterStatusBarStyle
{
  id WeakRetained;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v4 = objc_msgSend(WeakRetained, "_shouldUseSeparateStatusBarStyles");

  if (!v4)
    return 4;
  -[UISplitViewControllerClassicImpl viewControllers](self, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_effectiveStatusBarStyleViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "preferredStatusBarStyle");
  if (v8 == 1)
    v9 = 1;
  else
    v9 = 2 * (v8 == 3);

  return v9;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t i;
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
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "mutableChildViewControllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    v9 = 1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v9 &= objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "shouldAutorotateToInterfaceOrientation:", a3);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (unint64_t)supportedInterfaceOrientations
{
  id WeakRetained;
  unint64_t v4;
  id v5;

  if (dyld_program_sdk_at_least() && (*((_BYTE *)&self->_splitViewControllerFlags + 1) & 0x10) != 0)
  {
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    v5 = objc_loadWeakRetained((id *)&self->_svc);
    v4 = objc_msgSend(WeakRetained, "splitViewControllerSupportedInterfaceOrientations:", v5);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    v4 = objc_msgSend(WeakRetained, "_super_supportedInterfaceOrientations");
  }

  return v4;
}

- (BOOL)_hasPreferredInterfaceOrientationForPresentation
{
  int v3;

  v3 = dyld_program_sdk_at_least();
  if (v3)
    return (*((unsigned __int8 *)&self->_splitViewControllerFlags + 1) >> 5) & 1;
  return v3;
}

- (BOOL)_handlesCounterRotationForPresentation
{
  return dyld_program_sdk_at_least();
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  id WeakRetained;
  int64_t v4;
  id v5;

  if ((*((_BYTE *)&self->_splitViewControllerFlags + 1) & 0x20) != 0)
  {
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    v5 = objc_loadWeakRetained((id *)&self->_svc);
    v4 = objc_msgSend(WeakRetained, "splitViewControllerPreferredInterfaceOrientationForPresentation:", v5);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    v4 = objc_msgSend(WeakRetained, "_super_preferredInterfaceOrientationForPresentation");
  }

  return v4;
}

- (BOOL)_isRotating
{
  return self->_rotatingFromOrientation != 0;
}

- (int64_t)_internalModeForTraitCollection:(id)a3 orientation:(int64_t)a4 viewSize:(CGSize)a5 medusaState:(int64_t)a6
{
  id v9;
  int64_t v10;
  id WeakRetained;
  uint64_t v12;
  _BOOL4 v13;
  int64_t v14;

  v9 = a3;
  if (objc_msgSend(v9, "horizontalSizeClass") == 1)
  {
    v10 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    v12 = objc_msgSend(WeakRetained, "preferredDisplayMode");

    if ((unint64_t)(v12 - 1) >= 3)
    {
      if (objc_msgSend(v9, "userInterfaceIdiom"))
      {
        if (objc_msgSend(v9, "userInterfaceIdiom") == 1)
        {
          if (-[UISplitViewControllerClassicImpl _hidesMasterViewInOrientation:medusaState:](self, "_hidesMasterViewInOrientation:medusaState:", a4, a6))
          {
            v10 = 4;
          }
          else
          {
            v10 = 1;
          }
        }
        else
        {
          v10 = 1;
        }
      }
      else
      {
        v13 = -[UISplitViewControllerClassicImpl _iPhoneShouldUseOverlayInCurrentEnvironment](self, "_iPhoneShouldUseOverlayInCurrentEnvironment");
        v14 = -[UISplitViewControllerClassicImpl _effectivePrimaryHidingState](self, "_effectivePrimaryHidingState");
        if (v13)
        {
          if (v14 == 1)
          {
            v10 = 4;
          }
          else if (-[UISplitViewControllerClassicImpl _hidesMasterViewInOrientation:medusaState:](self, "_hidesMasterViewInOrientation:medusaState:", a4, a6))
          {
            v10 = 4;
          }
          else
          {
            v10 = 3;
          }
        }
        else if (v14 == 1)
        {
          v10 = 2;
        }
        else
        {
          v10 = 1;
        }
      }
    }
    else
    {
      v10 = qword_18667A540[v12 - 1];
    }
  }

  return v10;
}

- (int64_t)_prepareToTransitionToViewSize:(CGSize)a3 fromOrientation:(int64_t)a4 toOrientation:(int64_t)a5 duration:(double)a6
{
  double height;
  double width;
  id WeakRetained;
  void *v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  unint64_t v23;
  int64_t v24;
  int64_t v25;
  UITraitCollection *transitioningToTraitCollection;
  UITraitCollection *v27;
  id v28;
  int64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  int64_t lastNotifiedDisplayMode;
  _BOOL4 v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  _DWORD *v40;
  uint64_t v41;
  int v42;
  int v43;
  BOOL v44;
  id v45;
  uint64_t v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  _DWORD *v62;
  unsigned int v63;
  void *v64;
  unint64_t splitViewControllerFlags;
  void *v67;
  BOOL v68;
  UITraitCollection *v69;
  _QWORD v70[5];
  id v71;

  height = a3.height;
  width = a3.width;
  if ((*(_BYTE *)&self->_splitViewControllerFlags & 0x10) != 0)
    -[UISplitViewControllerClassicImpl _invalidateHidesMasterViewForAspectRatio:](self, "_invalidateHidesMasterViewForAspectRatio:", (unint64_t)(a5 - 1) < 2);
  if (a6 > 0.0 || !self->_rotatingFromOrientation)
    self->_rotatingFromOrientation = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "masterViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[UISplitViewControllerClassicImpl _masterViewFrame](self, "_masterViewFrame");
  self->_rotatingFromMasterViewFrame.origin.x = v15;
  self->_rotatingFromMasterViewFrame.origin.y = v16;
  self->_rotatingFromMasterViewFrame.size.width = v17;
  self->_rotatingFromMasterViewFrame.size.height = v18;
  if (self->_transitioningToTraitCollection)
    goto LABEL_16;
  v19 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v19, "_existingView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  if (width != v22 || height != v21)
    goto LABEL_15;
  if ((unint64_t)(a4 - 1) <= 1)
  {
    v23 = a5 - 1;
    goto LABEL_13;
  }
  if ((unint64_t)(a4 - 3) >= 2)
  {
LABEL_15:

    goto LABEL_16;
  }
  v23 = a5 - 3;
LABEL_13:

  if (v23 < 2)
  {
    v24 = 0;
    goto LABEL_75;
  }
LABEL_16:
  v25 = -[UISplitViewControllerClassicImpl _medusaStateForOrientation:viewWidth:](self, "_medusaStateForOrientation:viewWidth:", a5, width);
  transitioningToTraitCollection = self->_transitioningToTraitCollection;
  if (transitioningToTraitCollection)
  {
    v27 = transitioningToTraitCollection;
  }
  else
  {
    v28 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v28, "traitCollection");
    v27 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();

  }
  v29 = -[UISplitViewControllerClassicImpl _internalModeForTraitCollection:orientation:viewSize:medusaState:](self, "_internalModeForTraitCollection:orientation:viewSize:medusaState:", v27, a5, v25, width, height);
  v30 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v30, "traitCollection");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "horizontalSizeClass");

  lastNotifiedDisplayMode = self->_lastNotifiedDisplayMode;
  v69 = v27;
  if ((unint64_t)(lastNotifiedDisplayMode - 2) >= 2)
  {
    if (lastNotifiedDisplayMode == 1)
    {
      v35 = v14;
      objc_msgSend(v14, "superview");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v37, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36 == v38)
      {
        v39 = objc_loadWeakRetained((id *)&self->_svc);
        objc_msgSend(v39, "masterViewController");
        v40 = (_DWORD *)objc_claimAutoreleasedReturnValue();
        if (v40)
          v34 = ((v40[92] >> 1) & 3u) - 1 < 2;
        else
          v34 = 0;

      }
      else
      {
        v34 = 0;
      }

      v14 = v35;
    }
    else
    {
      v34 = 0;
    }
  }
  else
  {
    v34 = 1;
  }
  if (v29 == 4)
  {
    v42 = 0;
    v43 = 0;
    v44 = v32 != 1 && v34;
    v68 = v44;
    if (v34 && v32 == 1)
      v41 = 3;
    else
      v41 = 0;
  }
  else if (v29 == 3)
  {
    v68 = 0;
    v41 = 0;
    v43 = 0;
    v42 = !v34;
  }
  else
  {
    if (v29 == 1)
    {
      v68 = 0;
      v41 = 0;
      v42 = !v34;
    }
    else
    {
      v42 = 0;
      v68 = 0;
      v41 = 0;
    }
    v43 = 1;
  }
  v45 = objc_loadWeakRetained((id *)&self->_svc);
  v46 = objc_msgSend(v45, "preferredDisplayMode");

  if (!v46)
  {
    v47 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v47, "traitCollection");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = objc_msgSend(v48, "userInterfaceIdiom");
    if ((v49 == 1
       || !v49
       && -[UISplitViewControllerClassicImpl _iPhoneShouldUseOverlayInCurrentEnvironment](self, "_iPhoneShouldUseOverlayInCurrentEnvironment"))&& objc_msgSend(v48, "horizontalSizeClass") != 1&& -[UITraitCollection horizontalSizeClass](v69, "horizontalSizeClass") != UIUserInterfaceSizeClassCompact)
    {
      -[UISplitViewControllerClassicImpl _setPrimaryHidingStateForCurrentOrientation:](self, "_setPrimaryHidingStateForCurrentOrientation:", 0);
    }

  }
  if ((unint64_t)(v29 - 2) > 2)
    v50 = 2;
  else
    v50 = qword_18667A558[v29 - 2];
  -[UISplitViewControllerClassicImpl _displayModeWillChangeTo:](self, "_displayModeWillChangeTo:", v50);
  if ((v42 | v43) == 1)
  {
    if ((*((_BYTE *)&self->_splitViewControllerFlags + 1) & 1) == 0)
    {
      objc_msgSend(v14, "superview");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v52, "view");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (v51 != v53)
      {

LABEL_58:
        if (-[UIPopoverController isPopoverVisible](self->_hiddenPopoverController, "isPopoverVisible"))
          -[UIPopoverController _dismissPopoverAnimated:stateOnly:notifyDelegate:](self->_hiddenPopoverController, "_dismissPopoverAnimated:stateOnly:notifyDelegate:", 0, 1, 1);
        v57 = objc_loadWeakRetained((id *)&self->_svc);
        objc_msgSend(v57, "masterViewController");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "_setPopoverController:", 0);

        v70[0] = MEMORY[0x1E0C809B0];
        v70[1] = 3221225472;
        v70[2] = __106__UISplitViewControllerClassicImpl__prepareToTransitionToViewSize_fromOrientation_toOrientation_duration___block_invoke;
        v70[3] = &unk_1E16B1B50;
        v70[4] = self;
        v71 = v14;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v70);

        goto LABEL_61;
      }
      v54 = objc_loadWeakRetained((id *)&self->_svc);
      objc_msgSend(v54, "masterViewController");
      v67 = v14;
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "_popoverController");
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v67;
      if (v56)
        goto LABEL_58;
    }
LABEL_61:
    -[UIPopoverController _setGesturesEnabled:](self->_hiddenPopoverController, "_setGesturesEnabled:", 0);
  }
  if (v42)
    self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFFF1FLL | 0x20);
  if (!v68)
  {
    splitViewControllerFlags = (unint64_t)self->_splitViewControllerFlags;
    goto LABEL_71;
  }
  v59 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v59, "masterViewController");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISplitViewControllerClassicImpl _viewControllerHiding:](self, "_viewControllerHiding:", v60);

  v61 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v61, "masterViewController");
  v62 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (!v62)
  {
    v64 = 0;
    goto LABEL_68;
  }
  v63 = ((v62[92] >> 1) & 3) - 1;

  if (v63 <= 1)
  {
    v61 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v61, "masterViewController");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController __viewWillDisappear:]((uint64_t)v64, 0);
LABEL_68:

  }
  splitViewControllerFlags = *(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFFF1FLL | 0x60;
  v41 = 2;
LABEL_71:
  self->_transitioningToInternalMode = v29;
  self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(splitViewControllerFlags | 0x800000000);
  if (v42)
    v24 = 1;
  else
    v24 = v41;

LABEL_75:
  return v24;
}

void __106__UISplitViewControllerClassicImpl__prepareToTransitionToViewSize_fromOrientation_toOrientation_duration___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _WORD *v18;
  _WORD *v19;
  __int16 v20;
  void *v21;
  id v22;

  objc_msgSend(*(id *)(a1 + 32), "_masterViewFrame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "masterViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v3, v5, v7, v9);

  v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v13, "masterViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAutoresizingMask:", 0);

  v16 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v17 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v17, "masterViewController");
  v18 = (_WORD *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = v18[188];
    v18[188] = v20 | 0x100;
    objc_msgSend(v18, "setParentViewController:", v16);
    v19[188] = v19[188] & 0xFEFF | v20 & 0x100;
  }

  v22 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v22, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "insertSubview:atIndex:", *(_QWORD *)(a1 + 40), 0);

}

- (void)_animateTransitionToOrientation:(int64_t)a3 duration:(double)a4 masterChange:(int64_t)a5
{
  UISplitViewController **p_svc;
  id WeakRetained;
  uint64_t v11;
  int64_t rotatingFromOrientation;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;

  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v11 = objc_msgSend(WeakRetained, "childViewControllersCount");

  if (a4 <= 0.0 || v11 != 2)
    goto LABEL_13;
  -[UISplitViewControllerClassicImpl snapshotForRotationFromInterfaceOrientation:toInterfaceOrientation:masterChange:](self, "snapshotForRotationFromInterfaceOrientation:toInterfaceOrientation:masterChange:", self->_rotatingFromOrientation, a3, a5);
  if (!self->_rotationSnapshotView)
    goto LABEL_13;
  rotatingFromOrientation = self->_rotatingFromOrientation;
  if ((unint64_t)(rotatingFromOrientation - 1) >= 2)
  {
    if (((rotatingFromOrientation - 3) | (unint64_t)(a3 - 3)) >= 2)
      goto LABEL_9;
LABEL_11:
    v17 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v17, "mutableChildViewControllers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "enumerateObjectsUsingBlock:", &__block_literal_global_115);
    goto LABEL_12;
  }
  if ((unint64_t)(a3 - 1) <= 1)
    goto LABEL_11;
LABEL_9:
  v14 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v14, "masterViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", 1);

LABEL_12:
LABEL_13:
  v18 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v18, "_existingView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "window");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v21, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setNeedsLayout");

    v24 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v24, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layoutIfNeeded");

  }
}

void __90__UISplitViewControllerClassicImpl__animateTransitionToOrientation_duration_masterChange___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);

}

- (void)_completeTransitionFromOrientation:(int64_t)a3 masterChange:(int64_t)a4
{
  UISplitViewController **p_svc;
  id WeakRetained;
  int64_t rotatingFromOrientation;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  UIPopoverController *hiddenPopoverController;
  unint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  UIView *rotationSnapshotView;
  id v41;
  void *v42;
  void *v43;
  _DWORD *v44;
  _BOOL4 v45;
  _QWORD *v46;
  void *v47;
  BOOL v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  uint64_t v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  uint64_t v61;
  BOOL v62;
  UIPopoverController *v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  _QWORD v85[4];
  id v86;
  _QWORD v87[4];
  id v88;
  id location;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "mutableChildViewControllers");
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  rotatingFromOrientation = self->_rotatingFromOrientation;
  self->_rotatingFromOrientation = 0;
  if (self->_rotationSnapshotView)
  {
    v10 = objc_loadWeakRetained((id *)p_svc);
    v11 = objc_msgSend(v10, "interfaceOrientation");
    if ((unint64_t)(rotatingFromOrientation - 1) < 2)
    {
      v12 = v11 - 1;

      if (v12 > 1)
        goto LABEL_18;
LABEL_7:
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      v14 = v84;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v90, v94, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v91;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v91 != v16)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * v17), "view");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setHidden:", 0);

            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v90, v94, 16);
        }
        while (v15);
      }

      hiddenPopoverController = self->_hiddenPopoverController;
      if (hiddenPopoverController && (*((_BYTE *)&self->_splitViewControllerFlags + 1) & 1) != 0)
      {
        v20 = -[UISplitViewControllerClassicImpl _targetEdgeForPopover](self, "_targetEdgeForPopover");
        v21 = objc_loadWeakRetained((id *)p_svc);
        objc_msgSend(v21, "view");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPopoverController _presentPopoverFromEdge:ofView:animated:](hiddenPopoverController, "_presentPopoverFromEdge:ofView:animated:", v20, v22, 0);

        *(_QWORD *)&self->_splitViewControllerFlags &= ~0x100uLL;
      }
      goto LABEL_19;
    }
    if ((unint64_t)(rotatingFromOrientation - 3) >= 2)
    {

    }
    else
    {
      v13 = v11 - 3;

      if (v13 < 2)
        goto LABEL_7;
    }
LABEL_18:
    v23 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v23, "masterViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setHidden:", 0);

    -[UISplitViewControllerClassicImpl _masterViewFrame](self, "_masterViewFrame");
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v34 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v34, "masterViewController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setFrame:", v27, v29, v31, v33);

LABEL_19:
    v37 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v37, "view");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "layer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setNeedsLayoutOnGeometryChange:", 0);

    -[UIView removeFromSuperview](self->_rotationSnapshotView, "removeFromSuperview");
    rotationSnapshotView = self->_rotationSnapshotView;
    self->_rotationSnapshotView = 0;

    v41 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v41, "view");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "layer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setNeedsLayoutOnGeometryChange:", 1);

  }
  v44 = objc_loadWeakRetained((id *)p_svc);
  if (v44)
  {
    v45 = ((v44[92] >> 1) & 3u) - 1 < 2;

    if (v45)
    {
      if (a4 == 1)
      {
        v46 = objc_loadWeakRetained((id *)p_svc);
        v47 = v46;
        if (v46[40] || (*((_BYTE *)&self->_splitViewControllerFlags + 1) & 1) != 0)
        {

        }
        else
        {
          v48 = -[UIPopoverController isPopoverVisible](self->_hiddenPopoverController, "isPopoverVisible");

          if (!v48)
          {
            v49 = objc_loadWeakRetained((id *)p_svc);
            objc_msgSend(v49, "masterViewController");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_initWeak(&location, v50);

            v87[0] = MEMORY[0x1E0C809B0];
            v87[1] = 3221225472;
            v87[2] = __84__UISplitViewControllerClassicImpl__completeTransitionFromOrientation_masterChange___block_invoke;
            v87[3] = &unk_1E16B3F40;
            objc_copyWeak(&v88, &location);
            v51 = objc_loadWeakRetained(&location);
            objc_msgSend(v51, "setAfterAppearanceBlock:", v87);

            v52 = (void *)UIApp;
            v53 = objc_loadWeakRetained(&location);
            objc_msgSend(v52, "_addAfterCACommitBlockForViewController:", v53);

            objc_destroyWeak(&v88);
            objc_destroyWeak(&location);
          }
        }
      }
      else if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        v54 = objc_loadWeakRetained((id *)p_svc);
        objc_msgSend(v54, "masterViewController");
        v55 = objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, (id)v55);

        v56 = objc_loadWeakRetained(&location);
        LOBYTE(v55) = objc_msgSend(v56, "_appearState") == 0;

        if ((v55 & 1) == 0)
        {
          v85[0] = MEMORY[0x1E0C809B0];
          v85[1] = 3221225472;
          v85[2] = __84__UISplitViewControllerClassicImpl__completeTransitionFromOrientation_masterChange___block_invoke_2;
          v85[3] = &unk_1E16B3F40;
          objc_copyWeak(&v86, &location);
          v57 = objc_loadWeakRetained(&location);
          objc_msgSend(v57, "setAfterAppearanceBlock:", v85);

          v58 = (void *)UIApp;
          v59 = objc_loadWeakRetained(&location);
          objc_msgSend(v58, "_addAfterCACommitBlockForViewController:", v59);

          objc_destroyWeak(&v86);
        }
        -[UIPopoverController _setGesturesEnabled:](self->_hiddenPopoverController, "_setGesturesEnabled:", 1);
        objc_destroyWeak(&location);
      }
    }
  }
  if ((*((_BYTE *)&self->_splitViewControllerFlags + 1) & 1) == 0
    && !-[UIPopoverController isPopoverVisible](self->_hiddenPopoverController, "isPopoverVisible"))
  {
    goto LABEL_45;
  }
  v60 = objc_loadWeakRetained((id *)p_svc);
  v61 = objc_msgSend(v60, "interfaceOrientation");
  if ((unint64_t)(a3 - 1) < 2)
  {
    v62 = (unint64_t)(v61 - 1) < 2;

    goto LABEL_38;
  }
  if ((unint64_t)(a3 - 3) < 2)
  {
    v62 = (unint64_t)(v61 - 3) < 2;

LABEL_38:
    if (v62)
      goto LABEL_48;
    goto LABEL_41;
  }

LABEL_41:
  v63 = self->_hiddenPopoverController;
  if (v63)
  {
    if (a4)
    {
      -[UIPopoverController popoverView](v63, "popoverView");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPopoverController _dismissPopoverAnimated:stateOnly:notifyDelegate:](self->_hiddenPopoverController, "_dismissPopoverAnimated:stateOnly:notifyDelegate:", 0, 1, 1);
      v64 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v64, "masterViewController");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "view");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "frame");
      objc_msgSend(v66, "setFrame:");

      v67 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v67, "view");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v69, "masterViewController");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "view");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v72, "detailViewController");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "view");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "insertSubview:belowSubview:", v71, v74);

      v75 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v75, "masterViewController");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "_setPopoverController:", 0);

    }
  }
  else
  {
    *(_QWORD *)&self->_splitViewControllerFlags &= ~0x100uLL;
  }
LABEL_45:
  v77 = objc_loadWeakRetained((id *)p_svc);
  v78 = objc_msgSend(v77, "displayMode");
  v79 = 128;
  if (v78 == 2)
    v79 = 64;
  self->_splitViewControllerFlags = ($C946B5D877B827A51B09546B3F197234)(*(_QWORD *)&self->_splitViewControllerFlags & 0xFFFFFFFFFFFFFF1FLL | v79);

LABEL_48:
  v80 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v80, "view");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setNeedsLayout");

  v82 = objc_loadWeakRetained((id *)p_svc);
  self->_lastPresentedOrientation = objc_msgSend(v82, "interfaceOrientation");

}

void __84__UISplitViewControllerClassicImpl__completeTransitionFromOrientation_masterChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "__viewDidAppear:", 0);

}

void __84__UISplitViewControllerClassicImpl__completeTransitionFromOrientation_masterChange___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[UIViewController __viewDidDisappear:]((uint64_t)WeakRetained, 0);

}

- (BOOL)_isTransitioningFromCollapsedToSeparated
{
  id WeakRetained;
  char v3;

  if ((*((_BYTE *)&self->_splitViewControllerFlags + 4) & 8) == 0 || !self->_transitioningToInternalMode)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v3 = objc_msgSend(WeakRetained, "_isCollapsed");

  return v3;
}

- (id)_childViewControllersToSendViewWillTransitionToSize
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *WeakRetained;

  if (!-[UISplitViewControllerClassicImpl _isTransitioningFromCollapsedToSeparated](self, "_isTransitioningFromCollapsedToSeparated"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "_super_childViewControllersToSendViewWillTransitionToSize");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

    return v3;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v4, "masterViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "addObject:", v5);
  v6 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v6, "detailViewController");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    WeakRetained = (void *)v7;

LABEL_8:
    objc_msgSend(v3, "addObject:", WeakRetained);
    goto LABEL_9;
  }
  -[UISplitViewControllerClassicImpl _preservedDetailController](self, "_preservedDetailController");
  WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

  if (WeakRetained)
    goto LABEL_8;
  return v3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  id WeakRetained;
  uint64_t v9;
  double v10;
  uint64_t v11;
  CGFloat v12;
  uint64_t v13;
  double v14;
  int64_t v15;
  id v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  _QWORD v20[7];
  _QWORD v21[7];
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform v27;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v9 = objc_msgSend(WeakRetained, "interfaceOrientation");

  switch(v9)
  {
    case 1:
      v10 = 0.0;
      break;
    case 3:
      v10 = 1.57079633;
      break;
    case 4:
      v10 = -1.57079633;
      break;
    default:
      v10 = 3.14159265;
      if (v9 != 2)
        v10 = 0.0;
      break;
  }
  CGAffineTransformMakeRotation(&t1, v10);
  if (v7)
    objc_msgSend(v7, "targetTransform");
  else
    memset(&t2, 0, sizeof(t2));
  CGAffineTransformConcat(&v24, &t1, &t2);
  v11 = 0;
  v18 = vrndaq_f64(*(float64x2_t *)&v24.c);
  v19 = vrndaq_f64(*(float64x2_t *)&v24.a);
  v17 = vrndaq_f64(*(float64x2_t *)&v24.tx);
  while (1)
  {
    *(float64x2_t *)&v27.a = v19;
    *(float64x2_t *)&v27.c = v18;
    v12 = 3.14159265;
    *(float64x2_t *)&v27.tx = v17;
    if (v11 <= 2)
      v12 = dbl_18667A570[v11];
    CGAffineTransformMakeRotation(&v25, v12);
    *(float64x2_t *)&v25.a = vrndaq_f64(*(float64x2_t *)&v25.a);
    *(float64x2_t *)&v25.c = vrndaq_f64(*(float64x2_t *)&v25.c);
    *(float64x2_t *)&v25.tx = vrndaq_f64(*(float64x2_t *)&v25.tx);
    v26 = v25;
    if (CGAffineTransformEqualToTransform(&v27, &v26))
      break;
    if ((_DWORD)++v11 == 4)
    {
      v13 = 0;
      goto LABEL_19;
    }
  }
  v13 = qword_18667A520[v11];
LABEL_19:
  *(_QWORD *)&self->_splitViewControllerFlags |= 0x400000000uLL;
  objc_msgSend(v7, "transitionDuration", *(_OWORD *)&v17, *(_OWORD *)&v18, *(_OWORD *)&v19);
  v15 = -[UISplitViewControllerClassicImpl _prepareToTransitionToViewSize:fromOrientation:toOrientation:duration:](self, "_prepareToTransitionToViewSize:fromOrientation:toOrientation:duration:", v9, v13, width, height, v14);
  self->_transitioningMasterChange = v15;
  *(_QWORD *)&self->_splitViewControllerFlags &= ~0x400000000uLL;
  v16 = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(v16, "_super_viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

  *(_QWORD *)&self->_splitViewControllerFlags &= ~0x800000000uLL;
  v20[6] = v15;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __87__UISplitViewControllerClassicImpl_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v21[3] = &unk_1E16C1A08;
  v21[4] = self;
  v21[5] = v15;
  v21[6] = v13;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __87__UISplitViewControllerClassicImpl_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v20[3] = &unk_1E16C1A08;
  v20[4] = self;
  v20[5] = v9;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v21, v20);

}

void __87__UISplitViewControllerClassicImpl_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(_QWORD *a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (a1[5] == 3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
    objc_msgSend(WeakRetained, "masterViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController __viewWillDisappear:]((uint64_t)v4, 0);

  }
  v5 = (void *)a1[4];
  v6 = a1[6];
  objc_msgSend(v7, "transitionDuration");
  objc_msgSend(v5, "_animateTransitionToOrientation:duration:masterChange:", v6, a1[5]);

}

uint64_t __87__UISplitViewControllerClassicImpl_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_completeTransitionFromOrientation:masterChange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  result = objc_msgSend(*(id *)(a1 + 32), "_displayModeDidChange");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256) = 0;
  return result;
}

- (void)snapshotMasterView
{
  UISplitViewController **p_svc;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  UISnapshotView *v30;
  UIView *rotationSnapshotView;
  UIView *v32;
  id v33;
  float v34;
  UIView *v35;
  id v36;
  void *v37;
  void *v38;
  UIView *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  id v48;

  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "detailViewController");
  v47 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v5, "detailViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "childModalViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    while (1)
    {
      objc_msgSend(v7, "presentationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "shouldPresentInFullscreen");

      if ((v9 & 1) != 0)
        break;
      v10 = v7;

      objc_msgSend(v10, "presentedViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = v10;
      if (!v7)
      {
        v11 = v10;
        goto LABEL_6;
      }
    }
  }
  v11 = v47;
LABEL_6:
  v48 = v11;
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_rotationSnapshotView)
  {
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
    v13 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v13, "masterViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "frame");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    objc_msgSend(v15, "setFrame:", self->_rotatingFromMasterViewFrame.origin.x, self->_rotatingFromMasterViewFrame.origin.y, self->_rotatingFromMasterViewFrame.size.width, self->_rotatingFromMasterViewFrame.size.height);
    objc_msgSend(v15, "layoutBelowIfNeeded");
    objc_msgSend(v15, "superview");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v25, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24 == v26)
    {
      v45 = v12;
      v27 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v27, "view");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "subviews");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v29, "indexOfObject:", v45) + 1;

      v12 = v45;
    }
    else
    {
      v46 = 0;
    }

    v30 = -[UISnapshotView initWithFrame:]([UISnapshotView alloc], "initWithFrame:", self->_rotatingFromMasterViewFrame.origin.x, self->_rotatingFromMasterViewFrame.origin.y, self->_rotatingFromMasterViewFrame.size.width, self->_rotatingFromMasterViewFrame.size.height);
    rotationSnapshotView = self->_rotationSnapshotView;
    self->_rotationSnapshotView = &v30->super;

    v32 = self->_rotationSnapshotView;
    v33 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v33, "gutterWidth");
    -[UIView setEdgePadding:](v32, "setEdgePadding:", 0.0, 0.0, 0.0, v34);

    v35 = self->_rotationSnapshotView;
    v36 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v36, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "backgroundColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setEdgePaddingColor:](v35, "setEdgePaddingColor:", v38);

    v39 = self->_rotationSnapshotView;
    v40 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v40, "masterViewController");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "view");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView captureSnapshotOfView:withSnapshotType:](v39, "captureSnapshotOfView:withSnapshotType:", v42, self->_transitioningMasterChange != 1);

    v43 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v43, "view");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "insertSubview:atIndex:", self->_rotationSnapshotView, v46);

    objc_msgSend(v15, "setFrame:", v17, v19, v21, v23);
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 1);
    -[UIView setFrame:](self->_rotationSnapshotView, "setFrame:", self->_rotatingToMasterViewFrame.origin.x, self->_rotatingToMasterViewFrame.origin.y, self->_rotatingToMasterViewFrame.size.width, self->_rotatingToMasterViewFrame.size.height);

  }
}

- (void)snapshotAllViews
{
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v5;
  UISnapshotView *v6;
  id v7;
  void *v8;
  UIView *v9;
  UIView *rotationSnapshotView;
  UIView *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  UIView *v16;
  void *v17;
  id v18;

  if (!self->_rotationSnapshotView)
  {
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
    p_svc = &self->_svc;
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutBelowIfNeeded");

    v6 = [UISnapshotView alloc];
    v7 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v9 = -[UISnapshotView initWithFrame:](v6, "initWithFrame:");
    rotationSnapshotView = self->_rotationSnapshotView;
    self->_rotationSnapshotView = v9;

    v11 = self->_rotationSnapshotView;
    v12 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView captureSnapshotOfView:withSnapshotType:](v11, "captureSnapshotOfView:withSnapshotType:", v13, 1);

    v14 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", self->_rotationSnapshotView);

    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 1);
    v16 = self->_rotationSnapshotView;
    v18 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v18, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    -[UIView setFrame:](v16, "setFrame:");

  }
}

- (void)snapshotForRotationFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4 masterChange:(int64_t)a5
{
  UISplitViewController **p_svc;
  _BOOL4 v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  UISnapshotView *v15;
  UISnapshotView *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  UISnapshotView *v31;
  void *v32;
  void *v33;
  id WeakRetained;
  _QWORD v35[5];
  UISnapshotView *v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  if (!objc_msgSend(WeakRetained, "_isRotating"))
    goto LABEL_17;
  v10 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");

  if (v10)
  {
    v11 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNeedsLayoutOnGeometryChange:", 0);

    if (!a5
      || (*((_BYTE *)&self->_splitViewControllerFlags + 1) & 1) != 0
      || -[UIPopoverController isPopoverVisible](self->_hiddenPopoverController, "isPopoverVisible"))
    {
      if ((unint64_t)(a3 - 1) < 2)
      {
        if ((unint64_t)(a4 - 1) > 1)
          goto LABEL_16;
LABEL_11:
        -[UISplitViewControllerClassicImpl snapshotAllViews](self, "snapshotAllViews");
        if (-[UIPopoverController isPopoverVisible](self->_hiddenPopoverController, "isPopoverVisible"))
        {
          -[UIPopoverController popoverView](self->_hiddenPopoverController, "popoverView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = [UISnapshotView alloc];
          objc_msgSend(v14, "bounds");
          v16 = -[UISnapshotView initWithFrame:](v15, "initWithFrame:");
          objc_msgSend(v14, "bounds");
          v18 = v17;
          v20 = v19;
          -[UISplitViewControllerClassicImpl _masterViewFrame](self, "_masterViewFrame");
          v22 = v21;
          v24 = v23;
          v25 = -[UISplitViewControllerClassicImpl _layoutPrimaryOnRight](self, "_layoutPrimaryOnRight");
          v26 = objc_loadWeakRetained((id *)p_svc);
          objc_msgSend(v26, "primaryColumnWidth");
          v28 = v27;

          v29 = -v28;
          if (!v25)
            v29 = v28;
          v30 = v22 + v29;
          objc_msgSend(v14, "_snapshotBounds");
          -[UISnapshotView captureSnapshotRect:fromView:withSnapshotType:](v16, "captureSnapshotRect:fromView:withSnapshotType:", v14, 1);
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __116__UISplitViewControllerClassicImpl_snapshotForRotationFromInterfaceOrientation_toInterfaceOrientation_masterChange___block_invoke;
          v35[3] = &unk_1E16BE770;
          v35[4] = self;
          v36 = v16;
          v37 = v30;
          v38 = v24;
          v39 = v18;
          v40 = v20;
          v31 = v16;
          +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v35);
          *(_QWORD *)&self->_splitViewControllerFlags |= 0x100uLL;
          -[UIPopoverController _dismissPopoverAnimated:stateOnly:notifyDelegate:](self->_hiddenPopoverController, "_dismissPopoverAnimated:stateOnly:notifyDelegate:", 0, 1, 0);

        }
        goto LABEL_16;
      }
      if (((a4 - 3) | (unint64_t)(a3 - 3)) < 2)
        goto LABEL_11;
    }
    else
    {
      -[UISplitViewControllerClassicImpl snapshotMasterView](self, "snapshotMasterView");
    }
LABEL_16:
    WeakRetained = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(WeakRetained, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setNeedsLayoutOnGeometryChange:", 1);

LABEL_17:
  }
}

uint64_t __116__UISplitViewControllerClassicImpl_snapshotForRotationFromInterfaceOrientation_toInterfaceOrientation_masterChange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addSubview:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id WeakRetained;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!_UIAppUseModernRotationAndPresentationBehaviors())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "size");
    v10 = v9;
    v12 = v11;
    v13 = objc_loadWeakRetained((id *)&self->_svc);
    self->_rotatingMasterChange = -[UISplitViewControllerClassicImpl _prepareToTransitionToViewSize:fromOrientation:toOrientation:duration:](self, "_prepareToTransitionToViewSize:fromOrientation:toOrientation:duration:", objc_msgSend(v13, "interfaceOrientation"), a3, v10, v12, a4);

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v14 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v14, "childViewControllers", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v20, "willRotateToInterfaceOrientation:duration:", a3, a4);
          objc_msgSend(v20, "view");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "layoutBelowIfNeeded");

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v17);
    }

  }
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id WeakRetained;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[6];

  if (!_UIAppUseModernRotationAndPresentationBehaviors())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    v8 = objc_msgSend(WeakRetained, "childViewControllersCount");

    v9 = objc_loadWeakRetained((id *)&self->_svc);
    v10 = v9;
    if (v8 == 2)
    {
      objc_msgSend(v9, "mutableChildViewControllers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __87__UISplitViewControllerClassicImpl_willAnimateRotationToInterfaceOrientation_duration___block_invoke;
      v13[3] = &__block_descriptor_48_e15_v32__0_8Q16_B24l;
      v13[4] = a3;
      *(double *)&v13[5] = a4;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);
      v10 = v11;
    }
    else
    {
      objc_msgSend(v9, "masterViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "willAnimateRotationToInterfaceOrientation:duration:", a3, a4);

    }
    -[UISplitViewControllerClassicImpl _animateTransitionToOrientation:duration:masterChange:](self, "_animateTransitionToOrientation:duration:masterChange:", a3, self->_rotatingMasterChange, a4);
  }
}

uint64_t __87__UISplitViewControllerClassicImpl_willAnimateRotationToInterfaceOrientation_duration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "willAnimateRotationToInterfaceOrientation:duration:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  id WeakRetained;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!_UIAppUseModernRotationAndPresentationBehaviors())
  {
    -[UISplitViewControllerClassicImpl _completeTransitionFromOrientation:masterChange:](self, "_completeTransitionFromOrientation:masterChange:", a3, self->_rotatingMasterChange);
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "mutableChildViewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v12, "didRotateFromInterfaceOrientation:", a3, (_QWORD)v14);
          objc_msgSend(v12, "view");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setNeedsLayout");

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    -[UISplitViewControllerClassicImpl _displayModeDidChange](self, "_displayModeDidChange");
    self->_rotatingMasterChange = 0;

  }
}

- (void)_updateMasterViewControllerFrame
{
  int64_t transitioningMasterChange;
  int64_t rotatingFromOrientation;
  UISplitViewController **p_svc;
  id WeakRetained;
  int v7;
  CGFloat v8;
  CGFloat *p_height;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  id v13;
  _BOOL4 v14;
  int64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  int v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  BOOL v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  id v36;
  BOOL v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  id v46;
  void *v47;
  void *v48;
  char v49;
  double v50;
  double v51;
  id v52;
  void *v53;
  void *v54;
  int64_t v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  char v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  uint64_t v73;
  id v74;
  BOOL v75;
  UIPopoverController *hiddenPopoverController;
  unint64_t v77;
  id v78;
  void *v79;
  CGFloat v80;
  CGFloat width;
  CGFloat height;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  _QWORD v90[4];
  id v91;
  CGPoint v92;
  CGFloat v93;
  CGFloat v94;
  _QWORD v95[5];
  id v96;
  CGPoint v97;
  uint64_t v98;
  uint64_t v99;
  CGPoint origin;
  _QWORD v101[5];

  transitioningMasterChange = self->_transitioningMasterChange;
  rotatingFromOrientation = self->_rotatingFromOrientation;
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v7 = +[UIView _degreesToRotateFromInterfaceOrientation:toInterfaceOrientation:](UIView, "_degreesToRotateFromInterfaceOrientation:toInterfaceOrientation:", rotatingFromOrientation, objc_msgSend(WeakRetained, "interfaceOrientation"));

  -[UISplitViewControllerClassicImpl _masterViewFrame](self, "_masterViewFrame");
  self->_rotatingToMasterViewFrame.size.height = v8;
  p_height = &self->_rotatingToMasterViewFrame.size.height;
  self->_rotatingToMasterViewFrame.origin.x = v10;
  self->_rotatingToMasterViewFrame.origin.y = v11;
  self->_rotatingToMasterViewFrame.size.width = v12;
  v13 = objc_loadWeakRetained((id *)p_svc);
  if (!objc_msgSend(v13, "_isRotating"))
  {

    goto LABEL_7;
  }
  v14 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");

  if (v14)
  {
    if (-[UIPopoverController isPopoverVisible](self->_hiddenPopoverController, "isPopoverVisible"))
    {
      v15 = self->_rotatingFromOrientation;
      v16 = objc_loadWeakRetained((id *)p_svc);
      v17 = objc_msgSend(v16, "interfaceOrientation");
      if ((unint64_t)(v15 - 1) >= 2)
      {
        if ((unint64_t)(v15 - 3) >= 2)
        {

LABEL_51:
          v74 = objc_loadWeakRetained((id *)p_svc);
          if (objc_msgSend(v74, "preferredDisplayMode"))
          {

LABEL_54:
            hiddenPopoverController = self->_hiddenPopoverController;
            v77 = -[UISplitViewControllerClassicImpl _targetEdgeForPopover](self, "_targetEdgeForPopover");
            v78 = objc_loadWeakRetained((id *)p_svc);
            objc_msgSend(v78, "view");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIPopoverController _presentPopoverFromEdge:ofView:animated:](hiddenPopoverController, "_presentPopoverFromEdge:ofView:animated:", v77, v79, 1);

            goto LABEL_7;
          }
          v75 = -[UISplitViewControllerClassicImpl _hidesMasterViewInCurrentOrientation](self, "_hidesMasterViewInCurrentOrientation");

          if (v75)
            goto LABEL_54;
          origin = self->_rotatingToMasterViewFrame.origin;
          width = self->_rotatingToMasterViewFrame.size.width;
          height = self->_rotatingToMasterViewFrame.size.height;
          -[UIPopoverController popoverView](self->_hiddenPopoverController, "popoverView");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v83;
          if (v83)
          {
            v97 = origin;
            objc_msgSend(v83, "frame");
            v85 = v84;
            v87 = v86;
            v88 = MEMORY[0x1E0C809B0];
            v95[0] = MEMORY[0x1E0C809B0];
            v95[1] = 3221225472;
            v95[2] = __68__UISplitViewControllerClassicImpl__updateMasterViewControllerFrame__block_invoke_2;
            v95[3] = &unk_1E16BE770;
            v95[4] = self;
            v89 = v61;
            v96 = v89;
            v98 = v85;
            v99 = v87;
            +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v95);
            v90[0] = v88;
            v90[1] = 3221225472;
            v90[2] = __68__UISplitViewControllerClassicImpl__updateMasterViewControllerFrame__block_invoke_3;
            v90[3] = &unk_1E16B20D8;
            v91 = v89;
            v92 = origin;
            v93 = width;
            v94 = height;
            +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v90, 0, 0.2, 0.0);

          }
LABEL_63:

          goto LABEL_7;
        }
        v18 = v17 - 3;
      }
      else
      {
        v18 = v17 - 1;
      }

      if (v18 >= 2)
        goto LABEL_51;
      goto LABEL_7;
    }
    if ((unint64_t)(transitioningMasterChange - 1) > 1)
    {
      v56 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v56, "masterViewController");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "view");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setFrame:", self->_rotatingToMasterViewFrame.origin.x, self->_rotatingToMasterViewFrame.origin.y, self->_rotatingToMasterViewFrame.size.width, self->_rotatingToMasterViewFrame.size.height);

      v59 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v59, "masterViewController");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "childModalViewController");
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      if (v61)
      {
        do
        {
          objc_msgSend(v61, "presentationController");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend(v62, "shouldPresentInFullscreen");

          if ((v63 & 1) != 0)
            break;
          -[UISplitViewControllerClassicImpl _masterViewFrame](self, "_masterViewFrame");
          v65 = v64;
          v67 = v66;
          v69 = v68;
          v71 = v70;
          objc_msgSend(v61, "view");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setFrame:", v65, v67, v69, v71);

          objc_msgSend(v61, "presentedViewController");
          v73 = objc_claimAutoreleasedReturnValue();

          v61 = (void *)v73;
        }
        while (v73);
        goto LABEL_63;
      }
      goto LABEL_7;
    }
    if (transitioningMasterChange == 1 && v7 <= 0)
    {
      v55 = self->_rotatingFromOrientation;
      if ((unint64_t)(v55 - 3) >= 2)
        self->_rotatingFromMasterViewFrame.origin.y = self->_rotatingFromMasterViewFrame.origin.y
                                                    + self->_rotatingFromMasterViewFrame.size.height
                                                    - self->_rotatingToMasterViewFrame.size.height;
LABEL_57:
      self->_rotatingFromMasterViewFrame.size.width = self->_rotatingToMasterViewFrame.size.width;
      if ((unint64_t)(v55 - 1) <= 1 || (unint64_t)(v55 - 3) <= 1)
        goto LABEL_60;
      goto LABEL_59;
    }
    if (transitioningMasterChange == 2 && v7 >= 1)
    {
      if ((unint64_t)(self->_rotatingFromOrientation - 3) <= 1)
        self->_rotatingToMasterViewFrame.origin.y = self->_rotatingToMasterViewFrame.origin.y
                                                  + self->_rotatingToMasterViewFrame.size.height
                                                  - self->_rotatingFromMasterViewFrame.size.height;
    }
    else if (transitioningMasterChange == 1)
    {
      v55 = self->_rotatingFromOrientation;
      goto LABEL_57;
    }
LABEL_59:
    p_height = &self->_rotatingFromMasterViewFrame.size.height;
LABEL_60:
    v80 = *p_height;
    self->_rotatingToMasterViewFrame.size.height = *p_height;
    self->_rotatingFromMasterViewFrame.size.height = v80;
    v101[0] = MEMORY[0x1E0C809B0];
    v101[1] = 3221225472;
    v101[2] = __68__UISplitViewControllerClassicImpl__updateMasterViewControllerFrame__block_invoke;
    v101[3] = &unk_1E16B1B28;
    v101[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v101);
  }
LABEL_7:
  v19 = objc_loadWeakRetained((id *)p_svc);
  v20 = objc_msgSend(v19, "_isRotating");

  if (v20 && transitioningMasterChange == 1)
  {
    if ((*(_QWORD *)&self->_splitViewControllerFlags & 0x2E0) == 0x220)
    {
      v21 = objc_loadWeakRetained(&self->_delegate);
      v22 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v22, "masterViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "splitViewController:willShowViewController:invalidatingBarButtonItem:", v22, v23, self->_barButtonItem);

    }
    v24 = objc_loadWeakRetained((id *)p_svc);
    v25 = v24;
    if (v24
      && ((*((_DWORD *)v24 + 92) >> 1) & 3u) - 1 <= 1
      && (*((_BYTE *)&self->_splitViewControllerFlags + 1) & 1) == 0)
    {
      v26 = -[UIPopoverController isPopoverVisible](self->_hiddenPopoverController, "isPopoverVisible");

      if (v26)
        goto LABEL_17;
      v27 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v27, "masterViewController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setAfterAppearanceBlock:", 0);

      v25 = objc_loadWeakRetained((id *)p_svc);
      objc_msgSend(v25, "masterViewController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "__viewWillAppear:", 0);

    }
  }
LABEL_17:
  v30 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v30, "masterViewController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[UIPopoverController contentViewController](self->_hiddenPopoverController, "contentViewController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32 == v31)
    {
      objc_msgSend(v31, "view");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPopoverController popoverView](self->_hiddenPopoverController, "popoverView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v33, "isDescendantOfView:", v34);

      if ((v35 & 1) != 0)
        goto LABEL_26;
    }
    else
    {

    }
  }
  v36 = objc_loadWeakRetained((id *)p_svc);
  if ((objc_msgSend(v36, "_isRotating") & 1) != 0 || (*((_BYTE *)&self->_splitViewControllerFlags + 1) & 1) != 0)
    goto LABEL_25;
  v37 = -[UIPopoverController isPopoverVisible](self->_hiddenPopoverController, "isPopoverVisible");

  if (!v37)
  {
    v36 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v36, "masterViewController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setFrame:", self->_rotatingToMasterViewFrame.origin.x, self->_rotatingToMasterViewFrame.origin.y, self->_rotatingToMasterViewFrame.size.width, self->_rotatingToMasterViewFrame.size.height);

LABEL_25:
  }
LABEL_26:
  if ((dyld_program_sdk_at_least() & 1) == 0
    && -[UISplitViewControllerClassicImpl _layoutPrimaryOnRight](self, "_layoutPrimaryOnRight")
    && -[UISplitViewControllerClassicImpl _isMasterViewShown](self, "_isMasterViewShown"))
  {
    -[UISplitViewControllerClassicImpl _masterViewFrame](self, "_masterViewFrame");
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v46 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v46, "masterViewController");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "_popoverController");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "isPopoverVisible");

    v50 = 0.5;
    if ((v49 & 1) == 0)
    {
      -[UISplitViewControllerClassicImpl _screenSizeInMainScene:](self, "_screenSizeInMainScene:", 1);
      v50 = v51 - v43;
    }
    v52 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v52, "masterViewController");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "view");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setFrame:", v50, v41, v43, v45);

  }
}

void __68__UISplitViewControllerClassicImpl__updateMasterViewControllerFrame__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "masterViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFrame:", *(double *)(*(_QWORD *)(a1 + 32) + 112), *(double *)(*(_QWORD *)(a1 + 32) + 120), *(double *)(*(_QWORD *)(a1 + 32) + 128), *(double *)(*(_QWORD *)(a1 + 32) + 136));

  v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v7, "masterViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutBelowIfNeeded");

}

uint64_t __68__UISplitViewControllerClassicImpl__updateMasterViewControllerFrame__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v5, "detailViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertSubview:aboveSubview:", v4, v7);

  return objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __68__UISplitViewControllerClassicImpl__updateMasterViewControllerFrame__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_setDetailViewFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  void *v8;
  id WeakRetained;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "detailViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFrame:", x, y, width, height);

}

- (void)_getRotationContentSettings:(id *)a3
{
  void *v4;
  uint64_t v5;
  int v6;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5)
    v6 = 14;
  else
    v6 = 15;
  a3->var6 = v6;
}

- (int64_t)_medusaState
{
  UISplitViewController **p_svc;
  id WeakRetained;
  uint64_t v5;
  id v6;
  void *v7;
  double v8;
  int64_t v9;

  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  v5 = objc_msgSend(WeakRetained, "interfaceOrientation");
  v6 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = -[UISplitViewControllerClassicImpl _medusaStateForOrientation:viewWidth:](self, "_medusaStateForOrientation:viewWidth:", v5, v8);

  return v9;
}

- (int64_t)_medusaStateForOrientation:(int64_t)a3 viewWidth:(double)a4
{
  void *v7;
  uint64_t v8;
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  int64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v31;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == 1)
  {
    p_svc = &self->_svc;
    WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(WeakRetained, "_screen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v12, "_window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "_windowHostingScene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "_sceneSessionRoleIsCarPlayOrNonInteractiveExternal");

    if ((v15 & 1) != 0)
      goto LABEL_15;
    objc_msgSend(v11, "_boundsForInterfaceOrientation:", a3);
    v17 = v16;
    v19 = v18;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "bounds");
      v21 = v20;
      v23 = v22;
      v24 = objc_msgSend(v13, "interfaceOrientation");
      if (a3
        && v24
        && (unint64_t)a3 < 3 != (unint64_t)(objc_msgSend(v13, "interfaceOrientation") - 1) < 2)
      {
        v21 = v23;
      }
    }
    else
    {
      objc_msgSend(v13, "_windowHostingScene");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        objc_msgSend(v13, "_windowHostingScene");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "_boundsForInterfaceOrientation:", a3);
        v21 = v28;

      }
      else
      {
        objc_msgSend(v11, "_boundsForInterfaceOrientation:", a3);
        v21 = v29;
      }

    }
    if (v21 >= v17)
    {
LABEL_15:
      v25 = 0;
LABEL_16:

      return v25;
    }
    v31 = fmax(v17, v19);
    if (v31 > 1210.0)
    {
      if ((unint64_t)(a3 - 5) >= 0xFFFFFFFFFFFFFFFELL && v17 * 0.3 < a4 && v17 * 0.5 >= a4)
      {
        v25 = 1;
        goto LABEL_16;
      }
    }
    else if (v31 <= 1112.0 && (unint64_t)(a3 - 5) >= 0xFFFFFFFFFFFFFFFELL && v17 * 0.5 < a4)
    {
      v25 = 2;
      goto LABEL_16;
    }
    v25 = 3;
    goto LABEL_16;
  }
  return 0;
}

- (id)_allContainedViewControllers
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4;
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _UISaveReferencedChildViewControllers(v7, 0);
  v8 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v8, "_window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = objc_msgSend((id)UIApp, "_sceneInterfaceOrientationFromWindow:", v9);
  else
    v10 = 0;
  v11 = objc_loadWeakRetained((id *)p_svc);
  objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v11, "displayMode"), CFSTR("SplitViewControllerDisplayMode"));

  objc_msgSend(v4, "encodeInteger:forKey:", v10, CFSTR("SplitViewInterfaceOrientation"));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v17, "_restorationIdentifierPath");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          if (_UIStateRestorationDebugLogEnabled())
            NSLog(CFSTR("%s: View Controller in SplitViewController doesn't have restoration identifier, skipping: %@"), "-[UISplitViewControllerClassicImpl encodeRestorableStateWithCoder:]", v17, (_QWORD)v19);
          objc_msgSend((id)UIApp, "ignoreSnapshotOnNextApplicationLaunch");
          goto LABEL_16;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_16:

}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  int v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  int v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD block[6];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "_window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend((id)UIApp, "_sceneInterfaceOrientationFromWindow:", v6);
  else
    v7 = 0;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIApplicationStateRestorationUserInterfaceIdiom"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == (int)objc_msgSend(v10, "intValue"))
  {
    v11 = objc_loadWeakRetained((id *)&self->_svc);
    objc_msgSend(v11, "displayMode");

    if (v9 == 1)
      v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SplitViewControllerShowingMasterView"));
    else
      v12 = 0;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("SplitViewControllerDisplayMode"))
      && objc_msgSend(v4, "containsValueForKey:", CFSTR("SplitViewInterfaceOrientation")))
    {
      if (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SplitViewInterfaceOrientation")) != v7)
        goto LABEL_36;
      v18 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SplitViewControllerDisplayMode"));
    }
    else
    {
      if ((unint64_t)(v7 - 1) < 2)
        v19 = v12;
      else
        v19 = 0;
      if (v19 != 1)
        goto LABEL_36;
      v18 = 3;
    }
    v20 = objc_loadWeakRetained((id *)&self->_svc);
    v21 = objc_msgSend(v20, "displayMode");

    if (v18 != v21)
    {
      v22 = objc_loadWeakRetained((id *)&self->_svc);
      if ((objc_msgSend(v22, "isViewLoaded") & 1) != 0)
      {
        v23 = objc_loadWeakRetained((id *)&self->_svc);
        objc_msgSend(v23, "view");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "window");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          -[UISplitViewControllerClassicImpl _changeToDisplayMode:forCurrentOrientationOnly:](self, "_changeToDisplayMode:forCurrentOrientationOnly:", v18, 1);
          goto LABEL_36;
        }
      }
      else
      {

      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__UISplitViewControllerClassicImpl_decodeRestorableStateWithCoder___block_invoke;
      block[3] = &unk_1E16B1888;
      block[4] = self;
      block[5] = v18;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
  else
  {
    if (v9)
      v13 = CFSTR("Unspecified");
    else
      v13 = CFSTR("iPhone");
    if (v9 == 1)
      v13 = CFSTR("iPad");
    v14 = v13;
    v15 = objc_msgSend(v10, "integerValue");
    if (v15)
      v16 = CFSTR("Unspecified");
    else
      v16 = CFSTR("iPhone");
    if (v15 == 1)
      v16 = CFSTR("iPad");
    v17 = v16;
    if (_UIStateRestorationDebugLogEnabled())
      NSLog(CFSTR("%s: Skipping check to set UISplitViewController display mode, state restoration archive was saved using a different user interface idiom. Current idiom is %@, idiom from restoration archive is %@"), "-[UISplitViewControllerClassicImpl decodeRestorableStateWithCoder:]", v14, v17);

  }
LABEL_36:

}

void __67__UISplitViewControllerClassicImpl_decodeRestorableStateWithCoder___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  if ((objc_msgSend(WeakRetained, "isViewLoaded") & 1) != 0)
  {
    v2 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v2, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      objc_msgSend(*(id *)(a1 + 32), "_changeToDisplayMode:forCurrentOrientationOnly:", *(_QWORD *)(a1 + 40), 1);
  }
  else
  {

  }
}

- (id)_additionalViewControllersToCheckForUserActivity
{
  UISplitViewController **p_svc;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  p_svc = &self->_svc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_svc);
  objc_msgSend(WeakRetained, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "count");
  if (v5 == 2)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else if (v5 == 1)
  {
    v6 = v4;
  }
  else
  {
    v9 = objc_loadWeakRetained((id *)p_svc);
    objc_msgSend(v9, "viewControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: Warning: Checking Split View Controller viewControllers property, and array doesn't have either 1 or 2 elements: %@"), "-[UISplitViewControllerClassicImpl _additionalViewControllersToCheckForUserActivity]", v10);

    v6 = 0;
  }

  return v6;
}

- (id)_effectiveActivityItemsConfiguration
{
  void *v2;
  void *v3;
  void *v4;

  -[UISplitViewControllerClassicImpl viewControllers](self, "viewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_effectiveActivityItemsConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)primaryBackgroundStyle
{
  return 0;
}

- (BOOL)_shouldShowNSToolbarSidebarToggle
{
  return 1;
}

- (BOOL)_isAnimating
{
  return 0;
}

- (double)_primaryDividerPosition
{
  return 0.0;
}

- (double)_supplementaryDividerPosition
{
  return 0.0;
}

- (id)_deepestActionResponder
{
  void *v2;
  void *v3;

  -[UISplitViewControllerClassicImpl viewControllers](self, "viewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_nextVisibleViewControllerForResponderAfterChildViewController:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (!-[UISplitViewControllerClassicImpl isCollapsed](self, "isCollapsed")
    && (-[UISplitViewControllerClassicImpl detailViewController](self, "detailViewController"),
        v5 = (id)objc_claimAutoreleasedReturnValue(),
        v5,
        v5 == v4))
  {
    -[UISplitViewControllerClassicImpl masterViewController](self, "masterViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (UISplitViewControllerDelegate)delegate
{
  return (UISplitViewControllerDelegate *)objc_loadWeakRetained(&self->_delegate);
}

- (NSString)_displayModeButtonItemTitle
{
  return self->_displayModeButtonItemTitle;
}

- (double)preferredPrimaryColumnWidthFraction
{
  return self->_preferredPrimaryColumnWidthFraction;
}

- (double)minimumPrimaryColumnWidth
{
  return self->_minimumPrimaryColumnWidth;
}

- (double)maximumPrimaryColumnWidth
{
  return self->_maximumPrimaryColumnWidth;
}

- (id)_clearPreventRotationHook
{
  return self->__clearPreventRotationHook;
}

- (void)_setClearPreventRotationHook:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailFocusContainerGuide, 0);
  objc_storeStrong((id *)&self->_masterFocusContainerGuide, 0);
  objc_storeStrong(&self->__clearPreventRotationHook, 0);
  objc_storeStrong((id *)&self->__preservedDetailController, 0);
  objc_storeStrong((id *)&self->_displayModeButtonItemTitle, 0);
  objc_storeStrong((id *)&self->_transitioningToTraitCollection, 0);
  objc_storeStrong((id *)&self->_menuGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_popoverPresentationGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_traitCollectionWhenRemovedFromWindow, 0);
  objc_storeStrong((id *)&self->_underBarSeparatorView, 0);
  objc_storeStrong((id *)&self->_collapsingDetailSnapshotView, 0);
  objc_storeStrong((id *)&self->_collapsingMasterSnapshotView, 0);
  objc_storeStrong((id *)&self->_postTransitionResponder, 0);
  objc_storeStrong((id *)&self->_rotationSnapshotView, 0);
  objc_storeStrong((id *)&self->_hiddenPopoverController, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_displayModeButtonItem, 0);
  objc_storeStrong((id *)&self->_barButtonItem, 0);
  objc_destroyWeak(&self->_delegate);
  objc_destroyWeak((id *)&self->_svc);
}

@end
