@implementation SBSwitcherShelfViewController

- (SBSwitcherShelfViewController)initWithShelf:(id)a3 dataSource:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBSwitcherShelfViewController *v12;
  SBSwitcherShelfViewController *v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  SBShelfRootSwitcherModifier *v17;
  SBShelfRootSwitcherModifier *rootModifier;
  SBShelfLiveContentOverlayCoordinator *v19;
  SBShelfLiveContentOverlayCoordinator *liveContentOverlayCoordinator;
  SBFluidSwitcherViewController *v21;
  SBFluidSwitcherViewController *contentViewController;
  void *v23;
  id v24;
  SBAttentionAwarenessClient *v25;
  SBAttentionAwarenessClient *idleTouchAwarenessClient;
  objc_super v28;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)SBSwitcherShelfViewController;
  v12 = -[SBSwitcherShelfViewController initWithNibName:bundle:](&v28, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_shelf, a3);
    objc_storeWeak((id *)&v13->_dataSource, v10);
    objc_storeWeak((id *)&v13->_delegate, v11);
    SBAppLayoutGenericAppLayoutWithConfiguration(3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "switcherShelfViewController:frameForItemWithRole:inMainAppLayout:interfaceOrientation:", v13, 1, v14, 3);
    v13->_halfHalfSize.width = v15;
    v13->_halfHalfSize.height = v16;

    v17 = objc_alloc_init(SBShelfRootSwitcherModifier);
    rootModifier = v13->_rootModifier;
    v13->_rootModifier = v17;

    -[SBShelfRootSwitcherModifier setDisplayMode:](v13->_rootModifier, "setDisplayMode:", -[SBSwitcherShelf displayMode](v13->_shelf, "displayMode"));
    v19 = -[SBShelfLiveContentOverlayCoordinator initWithShelfDelegate:]([SBShelfLiveContentOverlayCoordinator alloc], "initWithShelfDelegate:", v13);
    liveContentOverlayCoordinator = v13->_liveContentOverlayCoordinator;
    v13->_liveContentOverlayCoordinator = v19;

    v21 = -[SBFluidSwitcherViewController initWithRootModifier:liveContentOverlayCoordinator:dataSource:delegate:debugName:]([SBFluidSwitcherViewController alloc], "initWithRootModifier:liveContentOverlayCoordinator:dataSource:delegate:debugName:", v13->_rootModifier, v13->_liveContentOverlayCoordinator, v13, v13, CFSTR("Shelf"));
    contentViewController = v13->_contentViewController;
    v13->_contentViewController = v21;

    +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:", v13);

    v24 = objc_alloc_init(MEMORY[0x1E0CFEC08]);
    objc_msgSend(v24, "setIdentifier:", CFSTR("com.apple.SpringBoard.SwitcherShelfViewController"));
    objc_msgSend(v24, "setEventMask:", 4);
    objc_msgSend(v24, "setAttentionLostTimeout:", 0.0);
    v25 = objc_alloc_init(SBAttentionAwarenessClient);
    idleTouchAwarenessClient = v13->_idleTouchAwarenessClient;
    v13->_idleTouchAwarenessClient = v25;

    -[SBAttentionAwarenessClient setConfiguration:](v13->_idleTouchAwarenessClient, "setConfiguration:", v24);
    -[SBAttentionAwarenessClient setDelegate:](v13->_idleTouchAwarenessClient, "setDelegate:", v13);

  }
  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[SBAttentionAwarenessClient setEnabled:](self->_idleTouchAwarenessClient, "setEnabled:", 0);
  -[SBAttentionAwarenessClient setDelegate:](self->_idleTouchAwarenessClient, "setDelegate:", 0);
  -[SBAttentionAwarenessClient invalidate](self->_idleTouchAwarenessClient, "invalidate");
  -[SBFluidSwitcherViewController invalidate](self->_contentViewController, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)SBSwitcherShelfViewController;
  -[SBSwitcherShelfViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  SBSwitcherShelfView *v3;
  SBSwitcherShelfView *v4;

  v3 = [SBSwitcherShelfView alloc];
  v4 = -[SBSwitcherShelfView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[SBSwitcherShelfViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBSwitcherShelfViewController;
  -[SBSwitcherShelfViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[SBSwitcherShelfViewController bs_addChildViewController:](self, "bs_addChildViewController:", self->_contentViewController);
  -[SBSwitcherShelfViewController _rebuildCachedAppLayouts](self, "_rebuildCachedAppLayouts");
  if (!self->_activePresentationAndDismissalAnimations && !self->_presented)
  {
    -[SBFluidSwitcherViewController view](self->_contentViewController, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 1);

  }
}

- (void)viewWillLayoutSubviews
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
  double v14;
  double v15;
  void *v16;
  void *v17;
  SBPortalView *homeAffordancePortalView;
  void *v19;
  void *v20;
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
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)SBSwitcherShelfViewController;
  -[SBSwitcherShelfViewController viewWillLayoutSubviews](&v39, sel_viewWillLayoutSubviews);
  -[SBSwitcherShelfViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  UIRectGetCenter();
  v13 = v12;
  v15 = v14;
  -[SBFluidSwitcherViewController view](self->_contentViewController, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBounds:", v5, v7, v9, v11);

  -[SBFluidSwitcherViewController view](self->_contentViewController, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCenter:", v13, v15);

  homeAffordancePortalView = self->_homeAffordancePortalView;
  if (homeAffordancePortalView)
  {
    -[SBPortalView sourceView](homeAffordancePortalView, "sourceView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "bounds");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;
      objc_msgSend(v20, "center");
      v30 = v29;
      v32 = v31;
      -[SBSwitcherShelfViewController view](self, "view");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "convertPoint:toView:", v33, v30, v32);
      v35 = v34;
      v37 = v36;

      -[SBPortalView setBounds:](self->_homeAffordancePortalView, "setBounds:", v22, v24, v26, v28);
      -[SBPortalView setCenter:](self->_homeAffordancePortalView, "setCenter:", v35, v37);
    }
    -[SBSwitcherShelfViewController view](self, "view");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "bringSubviewToFront:", self->_homeAffordancePortalView);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  objc_super v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)SBSwitcherShelfViewController;
  -[SBSwitcherShelfViewController viewDidLayoutSubviews](&v9, sel_viewDidLayoutSubviews);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("SBSwitcherShelfHeight");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[SBSwitcherShelfViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "numberWithDouble:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("SBSwitcherShelfHeightDidChangeNotification"), self, v8);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSwitcherShelfViewController;
  -[SBSwitcherShelfViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[SBSwitcherShelfViewController _windowScene](self, "_windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transientUIInteractionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "registerParticipantForTapToDismiss:", self);
  objc_msgSend(v5, "registerParticipantForIndirectPanToDismiss:", self);
  -[SBAttentionAwarenessClient setEnabled:](self->_idleTouchAwarenessClient, "setEnabled:", 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__dockHeightWillChange_, CFSTR("SBFloatingDockControllerHeightWillChangeNotification"), 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)SBSwitcherShelfViewController;
  -[SBSwitcherShelfViewController viewWillDisappear:](&v9, sel_viewWillDisappear_, a3);
  -[SBSwitcherShelfViewController _windowScene](self, "_windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transientUIInteractionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "unregisterParticipantForTapToDismiss:", self);
  objc_msgSend(v5, "unregisterParticipantForIndirectPanToDismiss:", self);
  -[SBAttentionAwarenessClient setEnabled:](self->_idleTouchAwarenessClient, "setEnabled:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("SBSwitcherShelfHeight");
  v11[0] = &unk_1E91D22A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("SBSwitcherShelfHeightDidChangeNotification"), self, v7);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", self);

}

- (BOOL)isPresentingOrDismissing
{
  return self->_activePresentationAndDismissalAnimations != 0;
}

- (void)setContentOptions:(unint64_t)a3
{
  if (self->_contentOptions != a3)
  {
    self->_contentOptions = a3;
    -[SBSwitcherShelfViewController _rebuildCachedAppLayouts](self, "_rebuildCachedAppLayouts");
  }
}

- (void)setIgnoredDisplayItems:(id)a3
{
  NSSet *v4;
  NSSet *ignoredDisplayItems;
  id v6;

  v6 = a3;
  if ((BSEqualSets() & 1) == 0)
  {
    v4 = (NSSet *)objc_msgSend(v6, "copy");
    ignoredDisplayItems = self->_ignoredDisplayItems;
    self->_ignoredDisplayItems = v4;

    -[SBSwitcherShelfViewController _rebuildCachedAppLayouts](self, "_rebuildCachedAppLayouts");
  }

}

- (void)setContentOrientation:(int64_t)a3
{
  int64_t v3;
  id v5;

  v3 = a3;
  if ((unint64_t)(a3 - 1) <= 1 && -[SBSwitcherShelf displayMode](self->_shelf, "displayMode") == 1)
    v3 = 3;
  if (v3 != self->_contentOrientation)
  {
    self->_contentOrientation = v3;
    -[SBFluidSwitcherViewController setContentOrientation:](self->_contentViewController, "setContentOrientation:", v3);
    -[SBSwitcherShelfViewController view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");

  }
}

- (NSSet)focusedDisplayItems
{
  return (NSSet *)-[SBFluidSwitcherViewController shelfFocusedDisplayItems](self->_contentViewController, "shelfFocusedDisplayItems");
}

- (void)setFocusedDisplayItems:(id)a3
{
  -[SBFluidSwitcherViewController setShelfFocusedDisplayItems:](self->_contentViewController, "setShelfFocusedDisplayItems:", a3);
}

- (void)_rebuildCachedAppLayouts
{
  SBSwitcherShelfViewController *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t contentOptions;
  void *j;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  unint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t ii;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t n;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t jj;
  void *v65;
  SBDisplayItem *v66;
  void *v67;
  SBDisplayItem *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  SBAppLayout *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  SBAppLayout *v77;
  void *v78;
  void *v79;
  id v80;
  id obj;
  id obja;
  uint64_t v83;
  uint64_t v84;
  id v85;
  id v86;
  id v87;
  void *v88;
  uint64_t v89;
  id v90;
  SBSwitcherShelfViewController *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
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
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  void *v124;
  SBDisplayItem *v125;
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  uint64_t v134;

  v134 = *MEMORY[0x1E0C80C00];
  if (!self->_shelf)
    return;
  v2 = self;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[SBSwitcherShelfViewController _appLayouts](v2, "_appLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v120, v133, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v121;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v121 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * i);
        if ((objc_msgSend(v11, "containsAnyItemFromSet:", v5) & 1) == 0)
        {
          objc_msgSend(v3, "addObject:", v11);
          objc_msgSend(v11, "allItems");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v120, v133, 16);
    }
    while (v8);
  }

  v90 = (id)objc_opt_new();
  v13 = -[SBSwitcherShelf displayMode](v2->_shelf, "displayMode");
  v91 = v2;
  if (v13)
  {
    if (v13 == 1)
    {
      contentOptions = v2->_contentOptions;
      v87 = v6;
      v79 = v5;
      v80 = v3;
      if ((contentOptions & 2) != 0)
      {
        v106 = 0u;
        v107 = 0u;
        v104 = 0u;
        v105 = 0u;
        obj = v3;
        v85 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v129, 16);
        if (v85)
        {
          v83 = *(_QWORD *)v105;
          do
          {
            for (j = 0; j != v85; j = (char *)j + 1)
            {
              if (*(_QWORD *)v105 != v83)
                objc_enumerationMutation(obj);
              v16 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * (_QWORD)j);
              if (objc_msgSend(v16, "environment") == 1 || objc_msgSend(v16, "environment") == 2)
              {
                v88 = j;
                v102 = 0u;
                v103 = 0u;
                v100 = 0u;
                v101 = 0u;
                objc_msgSend(v16, "leafAppLayouts");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v100, v128, 16);
                if (v18)
                {
                  v19 = v18;
                  v20 = *(_QWORD *)v101;
                  do
                  {
                    for (k = 0; k != v19; ++k)
                    {
                      if (*(_QWORD *)v101 != v20)
                        objc_enumerationMutation(v17);
                      v22 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * k);
                      objc_msgSend(v22, "allItems");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v23, "firstObject");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v24, "bundleIdentifier");
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SBSwitcherShelf bundleIdentifier](v2->_shelf, "bundleIdentifier");
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      v27 = objc_msgSend(v25, "isEqual:", v26);

                      v2 = v91;
                      if (v27 && (objc_msgSend(v22, "containsAnyItemFromSet:", v91->_ignoredDisplayItems) & 1) == 0)
                        objc_msgSend(v90, "addObject:", v22);
                    }
                    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v100, v128, 16);
                  }
                  while (v19);
                }

                v6 = v87;
                j = v88;
              }
            }
            v85 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v129, 16);
          }
          while (v85);
        }

        v3 = v80;
        contentOptions = v2->_contentOptions;
        v5 = v79;
      }
      if ((contentOptions & 1) != 0)
      {
        v98 = 0u;
        v99 = 0u;
        v96 = 0u;
        v97 = 0u;
        v86 = v3;
        v28 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v96, v127, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(id *)v97;
          obja = *(id *)v97;
          do
          {
            v31 = 0;
            v84 = v29;
            do
            {
              if (*(id *)v97 != v30)
                objc_enumerationMutation(v86);
              v32 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v31);
              if (objc_msgSend(v32, "environment") == 3)
              {
                v89 = v31;
                v94 = 0u;
                v95 = 0u;
                v92 = 0u;
                v93 = 0u;
                objc_msgSend(v32, "leafAppLayouts");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v92, v126, 16);
                if (v34)
                {
                  v35 = v34;
                  v36 = *(_QWORD *)v93;
                  do
                  {
                    for (m = 0; m != v35; ++m)
                    {
                      if (*(_QWORD *)v93 != v36)
                        objc_enumerationMutation(v33);
                      v38 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * m);
                      objc_msgSend(v38, "allItems");
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v39, "firstObject");
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v40, "bundleIdentifier");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SBSwitcherShelf bundleIdentifier](v2->_shelf, "bundleIdentifier");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      v43 = objc_msgSend(v41, "isEqual:", v42);

                      if (v43 && (objc_msgSend(v38, "containsAnyItemFromSet:", v91->_ignoredDisplayItems) & 1) == 0)
                        objc_msgSend(v90, "addObject:", v38);
                      v2 = v91;
                    }
                    v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v92, v126, 16);
                  }
                  while (v35);
                }

                v6 = v87;
                v31 = v89;
                v30 = obja;
                v29 = v84;
              }
              ++v31;
            }
            while (v31 != v29);
            v29 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v96, v127, 16);
          }
          while (v29);
        }

        v5 = v79;
        v3 = v80;
      }
    }
    goto LABEL_94;
  }
  v44 = v2->_contentOptions;
  if ((v44 & 2) == 0)
  {
    if ((v44 & 1) == 0)
      goto LABEL_58;
LABEL_72:
    v52 = v5;
    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    v53 = v3;
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v112, v131, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v113;
      do
      {
        for (n = 0; n != v55; ++n)
        {
          if (*(_QWORD *)v113 != v56)
            objc_enumerationMutation(v53);
          v58 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * n);
          if (objc_msgSend(v58, "environment") == 3
            && (objc_msgSend(v58, "containsAnyItemFromSet:", v91->_ignoredDisplayItems) & 1) == 0)
          {
            objc_msgSend(v90, "addObject:", v58);
          }
        }
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v112, v131, 16);
      }
      while (v55);
    }

    v2 = v91;
    v5 = v52;
    if ((v91->_contentOptions & 2) == 0)
      goto LABEL_94;
    goto LABEL_83;
  }
  v45 = v5;
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v46 = v3;
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v116, v132, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v117;
    do
    {
      for (ii = 0; ii != v48; ++ii)
      {
        if (*(_QWORD *)v117 != v49)
          objc_enumerationMutation(v46);
        v51 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * ii);
        if (objc_msgSend(v51, "environment") == 1
          && (objc_msgSend(v51, "containsAnyItemFromSet:", v91->_ignoredDisplayItems) & 1) == 0)
        {
          objc_msgSend(v90, "addObject:", v51);
        }
      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v116, v132, 16);
    }
    while (v48);
  }

  v2 = v91;
  v44 = v91->_contentOptions;
  v5 = v45;
  if ((v44 & 1) != 0)
    goto LABEL_72;
LABEL_58:
  if ((v44 & 2) != 0)
  {
LABEL_83:
    v59 = v5;
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    v60 = v3;
    v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v108, v130, 16);
    if (v61)
    {
      v62 = v61;
      v63 = *(_QWORD *)v109;
      do
      {
        for (jj = 0; jj != v62; ++jj)
        {
          if (*(_QWORD *)v109 != v63)
            objc_enumerationMutation(v60);
          v65 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * jj);
          if (objc_msgSend(v65, "environment") == 2
            && (objc_msgSend(v65, "containsAnyItemFromSet:", v91->_ignoredDisplayItems) & 1) == 0)
          {
            objc_msgSend(v90, "addObject:", v65);
          }
        }
        v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v108, v130, 16);
      }
      while (v62);
    }

    v2 = v91;
    v5 = v59;
  }
LABEL_94:
  if ((v2->_contentOptions & 4) != 0)
  {
    v66 = [SBDisplayItem alloc];
    -[SBSwitcherShelf bundleIdentifier](v2->_shelf, "bundleIdentifier");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = -[SBDisplayItem initWithType:bundleIdentifier:uniqueIdentifier:](v66, "initWithType:bundleIdentifier:uniqueIdentifier:", 6, v67, &stru_1E8EC7EC0);

    -[UIViewController _sbWindowScene](v2, "_sbWindowScene");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "layoutStateProvider");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "layoutState");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "displayOrdinal");

    v73 = [SBAppLayout alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = v74;
    v125 = v68;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v125, &v124, 1);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v72;
    v2 = v91;
    v77 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:](v73, "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v75, 1, 1, v76);

    objc_msgSend(v90, "insertObject:atIndex:", v77, 0);
  }
  objc_storeStrong((id *)&v2->_appLayouts, v90);
  -[SBFluidSwitcherViewController viewIfLoaded](v2->_contentViewController, "viewIfLoaded");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78)
    -[SBFluidSwitcherViewController noteAppLayoutsDidChange](v2->_contentViewController, "noteAppLayoutsDidChange");

}

- (void)setPresented:(BOOL)a3 withTargetFrame:(CGRect)a4 style:(unint64_t)a5 completion:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _BOOL4 v11;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  SBFluidSwitcherViewController *contentViewController;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void *v27;
  id v28;
  id v29;
  id location;
  const __CFString *v31;
  _QWORD v32[2];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v32[1] = *MEMORY[0x1E0C80C00];
  v13 = a6;
  v14 = v13;
  if (self->_presented == v11)
  {
    if (v13)
      (*((void (**)(id, uint64_t, _QWORD))v13 + 2))(v13, 1, 0);
  }
  else
  {
    self->_presented = v11;
    self->_presentationTargetFrame.origin.x = x;
    self->_presentationTargetFrame.origin.y = y;
    self->_presentationTargetFrame.size.width = width;
    self->_presentationTargetFrame.size.height = height;
    self->_animationStyle = a5;
    if (self->_presented)
    {
      -[SBFluidSwitcherViewController view](self->_contentViewController, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setHidden:", 0);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("SBSwitcherShelfHeight");
      v32[0] = &unk_1E91D22A0;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "postNotificationName:object:userInfo:", CFSTR("SBSwitcherShelfHeightDidChangeNotification"), self, v17);

    }
    if (v11)
      v18 = 1;
    else
      v18 = 2;
    -[SBShelfRootSwitcherModifier setAppearanceState:](self->_rootModifier, "setAppearanceState:", v18);
    -[SBShelfRootSwitcherModifier setTargetFrame:](self->_rootModifier, "setTargetFrame:", self->_presentationTargetFrame.origin.x, self->_presentationTargetFrame.origin.y, self->_presentationTargetFrame.size.width, self->_presentationTargetFrame.size.height);
    -[SBShelfRootSwitcherModifier setAnimationStyle:](self->_rootModifier, "setAnimationStyle:", self->_animationStyle);
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "createRequestWithOptions:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "finalize");
    ++self->_activePresentationAndDismissalAnimations;
    objc_initWeak(&location, self);
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __79__SBSwitcherShelfViewController_setPresented_withTargetFrame_style_completion___block_invoke;
    v27 = &unk_1E8EA10C8;
    objc_copyWeak(&v29, &location);
    v28 = v14;
    v21 = (void *)MEMORY[0x1D17E5550](&v24);
    contentViewController = self->_contentViewController;
    objc_msgSend(v20, "applicationContext", v24, v25, v26, v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherViewController performTransitionWithContext:animated:completion:](contentViewController, "performTransitionWithContext:animated:completion:", v23, 1, v21);

    -[SBShelfRootSwitcherModifier setAppearanceState:](self->_rootModifier, "setAppearanceState:", 0);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
}

void __79__SBSwitcherShelfViewController_setPresented_withTargetFrame_style_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  id *v5;
  uint64_t v6;
  int v7;
  void *v8;
  _BOOL8 v9;
  id v10;
  uint64_t v11;
  id *v12;
  id *v13;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (uint64_t)WeakRetained[128] - 1;
    WeakRetained[128] = (id)v6;
    if (!v6)
    {
      v7 = *((unsigned __int8 *)WeakRetained + 1032);
      v12 = WeakRetained;
      if (!*((_BYTE *)WeakRetained + 1032))
      {
        objc_msgSend(WeakRetained[121], "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setHidden:", 1);

        v5 = v12;
      }
      v9 = v7 != 0;
      v10 = objc_loadWeakRetained(v5 + 132);
      objc_msgSend(v10, "switcherShelfViewController:didFinishPresentation:", v12, v9);

      v5 = v12;
    }
  }
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
  {
    v13 = v5;
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v11 + 16))(v11, a2, 0);
    v5 = v13;
  }

}

- (void)performTransitionWithContext:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  unint64_t v15;
  SBFluidSwitcherViewController *contentViewController;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  SBFluidSwitcherViewController *v24;
  void *v25;
  void *v26;
  void *v27;
  SBFluidSwitcherViewController *v28;
  void *v29;
  void *v30;
  void *v31;
  SBFluidSwitcherViewController *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, uint64_t, _QWORD))a5;
  objc_msgSend(a3, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBSwitcherShelf displayMode](self->_shelf, "displayMode"))
  {
    if (-[SBSwitcherShelf displayMode](self->_shelf, "displayMode") != 1
      || -[SBSwitcherShelf layoutRole](self->_shelf, "layoutRole") != 3)
    {
      objc_msgSend(v10, "appLayout");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "leafAppLayoutForRole:", -[SBSwitcherShelf layoutRole](self->_shelf, "layoutRole"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        goto LABEL_10;
      goto LABEL_9;
    }
    objc_msgSend(v10, "floatingAppLayout");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v10, "appLayout");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v11;
  if (!v11)
  {
LABEL_10:
    if (v7)
      v7[2](v7, 1, 0);
    v14 = 0;
    goto LABEL_20;
  }
LABEL_9:
  if (-[NSArray containsObject:](self->_appLayouts, "containsObject:", v13))
    goto LABEL_10;
  v34 = v8;
  v14 = v13;
  v15 = (self->_contentOptions >> 2) & 1;
  contentViewController = self->_contentViewController;
  v42[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[SBFluidSwitcherViewController shouldAnimateInsertionOfAppLayouts:atIndexes:](contentViewController, "shouldAnimateInsertionOfAppLayouts:atIndexes:", v17, v19);

  if ((_DWORD)v20)
  {
    v32 = self->_contentViewController;
    v40 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherViewController prepareAnimatedInsertionOfAppLayouts:atIndexes:](v32, "prepareAnimatedInsertionOfAppLayouts:atIndexes:", v21, v23);

  }
  -[SBSwitcherShelfViewController _rebuildCachedAppLayouts](self, "_rebuildCachedAppLayouts");
  v24 = self->_contentViewController;
  v38 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherViewController noteModelDidMutateForInsertionOfAppLayouts:atIndexes:willAnimate:](v24, "noteModelDidMutateForInsertionOfAppLayouts:atIndexes:willAnimate:", v25, v27, v20);

  if ((_DWORD)v20)
  {
    v28 = self->_contentViewController;
    v36 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v33);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherViewController performAnimatedInsertionOfAppLayouts:atIndexes:completion:](v28, "performAnimatedInsertionOfAppLayouts:atIndexes:completion:", v29, v31, v7);

  }
  else if (v7)
  {
    v7[2](v7, 1, 0);
  }
  v8 = v34;
LABEL_20:

}

- (void)performKeyboardShortcutAction:(int64_t)a3
{
  if (a3 == 3)
    -[SBSwitcherShelfViewController dismissShelfForShelfTransition](self, "dismissShelfForShelfTransition");
}

- (id)beginHidingAppLayout:(id)a3 forReason:(id)a4
{
  return -[SBFluidSwitcherViewController beginHidingAppLayout:forReason:](self->_contentViewController, "beginHidingAppLayout:forReason:", a3, a4);
}

- (CGRect)itemFrameForAppLayout:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[SBFluidSwitcherViewController completedTransitionFrameForAppLayout:](self->_contentViewController, "completedTransitionFrameForAppLayout:", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)itemScaleForAppLayout:(id)a3
{
  double result;

  -[SBFluidSwitcherViewController scaleForAppLayout:](self->_contentViewController, "scaleForAppLayout:", a3);
  return result;
}

- (double)itemCornerRadiusForAppLayout:(id)a3
{
  double result;

  -[SBFluidSwitcherViewController cornerRadiusForAppLayout:](self->_contentViewController, "cornerRadiusForAppLayout:", a3);
  return result;
}

- (void)setHomeAffordancePortalView:(id)a3
{
  SBPortalView *v5;
  id *p_homeAffordancePortalView;
  SBPortalView *homeAffordancePortalView;
  id v8;
  void *v9;
  void *v10;
  SBPortalView *v11;

  v5 = (SBPortalView *)a3;
  p_homeAffordancePortalView = (id *)&self->_homeAffordancePortalView;
  homeAffordancePortalView = self->_homeAffordancePortalView;
  v11 = v5;
  if (homeAffordancePortalView != v5)
  {
    if (homeAffordancePortalView)
    {
      -[SBPortalView removeFromSuperview](homeAffordancePortalView, "removeFromSuperview");
      v8 = *p_homeAffordancePortalView;
      *p_homeAffordancePortalView = 0;

    }
    objc_storeStrong((id *)&self->_homeAffordancePortalView, a3);
    if (*p_homeAffordancePortalView)
    {
      objc_msgSend(*p_homeAffordancePortalView, "setPassesTouchesThrough:", 1);
      -[SBSwitcherShelfViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", *p_homeAffordancePortalView);

      -[SBSwitcherShelfViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setNeedsLayout");

    }
  }

}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBFluidSwitcherViewController layoutStateTransitionCoordinator:transitionDidBeginWithTransitionContext:](self->_contentViewController, "layoutStateTransitionCoordinator:transitionDidBeginWithTransitionContext:", v7, v6);

}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionWillEndWithTransitionContext:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBFluidSwitcherViewController layoutStateTransitionCoordinator:transitionWillEndWithTransitionContext:](self->_contentViewController, "layoutStateTransitionCoordinator:transitionWillEndWithTransitionContext:", v7, v6);

}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBFluidSwitcherViewController layoutStateTransitionCoordinator:transitionDidEndWithTransitionContext:](self->_contentViewController, "layoutStateTransitionCoordinator:transitionDidEndWithTransitionContext:", v7, v6);

}

- (id)appLayoutsForSwitcherContentController:(id)a3
{
  return self->_appLayouts;
}

- (int64_t)nextDisplayItemInteractionTimeForSwitcherContentController:(id)a3
{
  void *v4;
  int64_t v5;

  -[SBSwitcherShelfViewController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "nextDisplayItemInteractionTimeForSwitcherShelfViewController:", self);

  return v5;
}

- (int64_t)switcherInterfaceOrientationForSwitcherContentController:(id)a3
{
  return self->_contentOrientation;
}

- (int64_t)activeInterfaceOrientationForSwitcherContentController:(id)a3
{
  return objc_msgSend((id)SBApp, "activeInterfaceOrientation", a3);
}

- (CGRect)switcherContentController:(id)a3 frameForItemWithRole:(int64_t)a4 inMainAppLayout:(id)a5 interfaceOrientation:(int64_t)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  id v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  v13 = a5;
  v14 = -[SBSwitcherShelf displayMode](self->_shelf, "displayMode");
  if (v14 == 1)
  {
    SBRectWithSize();
    goto LABEL_5;
  }
  if (!v14)
  {
    -[SBSwitcherShelfViewController _frameForItemWithRole:inMainAppLayout:interfaceOrientation:](self, "_frameForItemWithRole:inMainAppLayout:interfaceOrientation:", a4, v13, a6);
LABEL_5:
    v6 = v15;
    v7 = v16;
    v8 = v17;
    v9 = v18;
  }

  v19 = v6;
  v20 = v7;
  v21 = v8;
  v22 = v9;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (id)switcherContentController:(id)a3 transitionEventForContext:(id)a4 identifier:(id)a5 phase:(unint64_t)a6 animated:(BOOL)a7
{
  return -[SBSwitcherShelfViewController _transitionEventForContext:identifier:phase:animated:](self, "_transitionEventForContext:identifier:phase:animated:", a4, a5, a6, a7);
}

- (CGRect)switcherContentController:(id)a3 frameForFloatingAppLayoutInInterfaceOrientation:(int64_t)a4 floatingConfiguration:(int64_t)a5
{
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  v8 = -[SBSwitcherShelf displayMode](self->_shelf, "displayMode", a3);
  if (v8 == 1)
  {
    SBRectWithSize();
  }
  else if (!v8)
  {
    -[SBSwitcherShelfViewController _frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:](self, "_frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:", a4, a5);
  }
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)switcherContentController:(id)a3 frameForCenterItemWithConfiguration:(int64_t)a4 interfaceOrientation:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[SBSwitcherShelfViewController _frameForCenterItemWithConfiguration:interfaceOrientation:](self, "_frameForCenterItemWithConfiguration:interfaceOrientation:", a4, a5);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)switcherContentController:(id)a3 supportsTitleItemsForAppLayout:(id)a4
{
  id v4;
  BOOL v5;

  v4 = a4;
  if (objc_msgSend(v4, "type"))
    v5 = objc_msgSend(v4, "type") == 5;
  else
    v5 = 1;

  return v5;
}

- (unint64_t)windowManagementStyleForSwitcherContentController:(id)a3
{
  return 1;
}

- (void)switcherContentController:(id)a3 performTransitionWithRequest:(id)a4 gestureInitiated:(BOOL)a5
{
  -[SBSwitcherShelfViewController _performSwitcherTransitionRequest:](self, "_performSwitcherTransitionRequest:", a4);
}

- (void)switcherContentController:(id)a3 deletedDisplayItem:(id)a4 inAppLayout:(id)a5 forReason:(int64_t)a6
{
  id v9;
  id v10;
  uint64_t v11;
  SBFluidSwitcherViewController *contentViewController;
  id v13;
  _QWORD v14[4];
  id v15;
  SBSwitcherShelfViewController *v16;
  int64_t v17;

  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v10, "layoutRoleForItem:", v9);
  contentViewController = self->_contentViewController;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __100__SBSwitcherShelfViewController_switcherContentController_deletedDisplayItem_inAppLayout_forReason___block_invoke;
  v14[3] = &unk_1E8EA0AF0;
  v16 = self;
  v17 = a6;
  v15 = v9;
  v13 = v9;
  -[SBFluidSwitcherViewController removeLayoutRole:inSpace:mutationBlock:reason:](contentViewController, "removeLayoutRole:inSpace:mutationBlock:reason:", v11, v10, v14, a6);

}

void __100__SBSwitcherShelfViewController_switcherContentController_deletedDisplayItem_inAppLayout_forReason___block_invoke(uint64_t a1)
{
  id v2;

  +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_removeDisplayItem:forReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "_rebuildCachedAppLayouts");

}

- (void)switcherContentController:(id)a3 setContentOrientation:(int64_t)a4
{
  -[SBSwitcherShelfViewController setContentOrientation:](self, "setContentOrientation:", a4);
}

- (void)switcherContentController:(id)a3 requestNewWindowForBundleIdentifier:(id)a4
{
  -[SBSwitcherShelfViewController _performNewWindowRequestForBundleIdentifier:](self, "_performNewWindowRequestForBundleIdentifier:", a4);
}

- (BOOL)switcherContentController:(id)a3 shouldSkipNonAnimatedLayoutPassAfterTransition:(id)a4
{
  return 1;
}

- (BOOL)_dismissShelfIfNeededWithLocation:(CGPoint)a3 window:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  int v13;
  void *v14;
  void *v15;
  int v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[SBSwitcherShelfViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "screen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fixedCoordinateSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "convertPoint:toCoordinateSpace:", v10, x, y);
  objc_msgSend(v8, "convertPoint:fromCoordinateSpace:", v10);
  objc_msgSend(v8, "hitTest:withEvent:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v13 = objc_msgSend(WeakRetained, "switcherShelfViewController:hitTestedToTopAffordance:window:", self, v7, x, y);

  if (v11)
  {
    -[SBSwitcherShelfViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == v14)
    {
      v16 = 1;
    }
    else
    {
      -[SBFluidSwitcherViewController view](self->_contentViewController, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v11, "isDescendantOfView:", v15) ^ 1;

    }
  }
  else
  {
    v16 = 1;
  }
  if ((v16 & (v13 ^ 1)) == 1 && self->_presented)
    -[SBSwitcherShelfViewController dismissShelfForShelfTransition](self, "dismissShelfForShelfTransition");

  return v16 & (v13 ^ 1);
}

- (BOOL)transientUIHandledTouch:(id)a3 withSystemGestureRecognizer:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  v5 = a3;
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  objc_msgSend(v5, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertPoint:fromView:", v12, v8, v10);
  v14 = v13;
  v16 = v15;

  objc_msgSend(v5, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[SBSwitcherShelfViewController _dismissShelfIfNeededWithLocation:window:](self, "_dismissShelfIfNeededWithLocation:window:", v17, v14, v16);
  return (char)self;
}

- (void)transientUI:(id)a3 wasIndirectPannedToDismissFromGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  objc_msgSend(v7, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "convertPoint:fromView:", v14, v10, v12);
  v16 = v15;
  v18 = v17;

  objc_msgSend(v7, "window");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  -[SBSwitcherShelfViewController _dismissShelfIfNeededWithLocation:window:](self, "_dismissShelfIfNeededWithLocation:window:", v19, v16, v18);
}

- (id)shelfLiveContentOverlayCoordinatorAppLayouts:(id)a3
{
  return self->_appLayouts;
}

- (id)shelfLiveContentOverlayCoordinatorSnapshotCache:(id)a3
{
  return -[SBFluidSwitcherViewController snapshotCache](self->_contentViewController, "snapshotCache", a3);
}

- (id)shelfLiveContentOverlayCoordinator:(id)a3 liveViewForAppLayout:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBSwitcherShelfViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "switcherShelfViewController:liveViewForAppLayout:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)assistantWillAppear:(id)a3 windowScene:(id)a4
{
  if (self->_presented)
    -[SBSwitcherShelfViewController dismissShelfForShelfTransition](self, "dismissShelfForShelfTransition", a3, a4);
}

- (void)clientDidResetForUserAttention:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  _BOOL4 presented;
  id v8;

  +[SBWorkspace mainWorkspace](SBMainWorkspace, "mainWorkspace", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyboardFocusController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "externalSceneWithFocus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    presented = self->_presented;

    if (presented)
      -[SBSwitcherShelfViewController dismissShelfForShelfTransition](self, "dismissShelfForShelfTransition");
  }
  else
  {

  }
}

- (id)_windowScene
{
  void *v3;
  void *v4;

  -[SBSwitcherShelfViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowSceneForSwitcherShelfViewController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_appLayouts
{
  void *v3;
  void *v4;

  -[SBSwitcherShelfViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appLayoutsForSwitcherShelfViewController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGRect)_frameForItemWithRole:(int64_t)a3 inMainAppLayout:(id)a4 interfaceOrientation:(int64_t)a5
{
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  v8 = a4;
  -[SBSwitcherShelfViewController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "switcherShelfViewController:frameForItemWithRole:inMainAppLayout:interfaceOrientation:", self, a3, v8, a5);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)_frameForFloatingAppLayoutInInterfaceOrientation:(int64_t)a3 floatingConfiguration:(int64_t)a4
{
  void *v7;
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
  double v18;
  double v19;
  CGRect result;

  -[SBSwitcherShelfViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "switcherShelfViewController:frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:", self, a3, a4);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)_frameForCenterItemWithConfiguration:(int64_t)a3 interfaceOrientation:(int64_t)a4
{
  void *v7;
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
  double v18;
  double v19;
  CGRect result;

  -[SBSwitcherShelfViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "switcherShelfViewController:frameForCenterItemWithConfiguration:interfaceOrientation:", self, a3, a4);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)_transitionEventForContext:(id)a3 identifier:(id)a4 phase:(unint64_t)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v6 = a6;
  v10 = a4;
  v11 = a3;
  -[SBSwitcherShelfViewController dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "switcherShelfViewController:transitionEventForContext:identifier:phase:animated:", self, v11, v10, a5, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_performNewWindowRequestForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  SBSwitcherShelfViewController *v11;

  v4 = a3;
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationWithBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBWorkspace mainWorkspace](SBMainWorkspace, "mainWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__SBSwitcherShelfViewController__performNewWindowRequestForBundleIdentifier___block_invoke;
  v9[3] = &unk_1E8EA0260;
  v10 = v6;
  v11 = self;
  v8 = v6;
  objc_msgSend(v7, "requestTransitionWithBuilder:", v9);

}

void __77__SBSwitcherShelfViewController__performNewWindowRequestForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 35);
  objc_msgSend(v3, "setEventLabel:", CFSTR("NewWindowRequest"));
  v4 = +[SBDeviceApplicationSceneEntity newEntityWithApplicationForMainDisplay:](SBDeviceApplicationSceneEntity, "newEntityWithApplicationForMainDisplay:", *(_QWORD *)(a1 + 32));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__SBSwitcherShelfViewController__performNewWindowRequestForBundleIdentifier___block_invoke_2;
  v6[3] = &unk_1E8E9ECA8;
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v5 = v4;
  objc_msgSend(v3, "modifyApplicationContext:", v6);

}

void __77__SBSwitcherShelfViewController__performNewWindowRequestForBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v7 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "displayMode"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __77__SBSwitcherShelfViewController__performNewWindowRequestForBundleIdentifier___block_invoke_3;
    v8[3] = &unk_1E8EAC028;
    v8[4] = *(_QWORD *)(a1 + 32);
    v3 = v7;
    v9 = v3;
    v10 = *(id *)(a1 + 40);
    SBLayoutRoleEnumerateValidRoles(v8);
    objc_msgSend(v3, "previousLayoutState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRequestedWindowPickerRole:", objc_msgSend(v4, "windowPickerRole"));

  }
  else
  {
    objc_msgSend(v7, "setActivatingEntity:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v7, "previousLayoutState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIDShowingAppExpose");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRequestedAppExposeBundleID:", v6);

  }
}

void __77__SBSwitcherShelfViewController__performNewWindowRequestForBundleIdentifier___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = objc_msgSend(*(id *)(a1[4] + 1040), "layoutRole");
  v5 = (void *)a1[5];
  if (v4 == a2)
  {
    objc_msgSend(v5, "setEntity:forLayoutRole:", a1[6], objc_msgSend(*(id *)(a1[4] + 1040), "layoutRole"));
  }
  else
  {
    +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEntity:forLayoutRole:", v6, a2);

  }
}

- (void)_performSwitcherTransitionRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SBSwitcherShelfViewController *v9;

  v4 = a3;
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__SBSwitcherShelfViewController__performSwitcherTransitionRequest___block_invoke;
  v7[3] = &unk_1E8EAAC50;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "requestTransitionWithOptions:builder:validator:", 0, 0, v7);

}

uint64_t __67__SBSwitcherShelfViewController__performSwitcherTransitionRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 IsRight;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  id v26;

  v3 = a2;
  +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_configureRequest:forSwitcherTransitionRequest:withEventLabel:", v3, *(_QWORD *)(a1 + 32), CFSTR("ShelfTransition"));
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1040), "displayMode");
  objc_msgSend(*(id *)(a1 + 32), "appLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v5 == 1;
  else
    v8 = 0;
  if (v8)
  {
    if (objc_msgSend(v6, "environment") != 3)
    {
      v9 = objc_msgSend(v7, "environment");
      v10 = &SBLayoutRolePrimary;
      if (v9 != 1)
        v10 = &SBLayoutRoleFloating;
      v11 = *v10;
      objc_msgSend(v3, "applicationContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "entityForLayoutRole:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __67__SBSwitcherShelfViewController__performSwitcherTransitionRequest___block_invoke_2;
      v25[3] = &unk_1E8E9ECA8;
      v25[4] = *(_QWORD *)(a1 + 40);
      v26 = v13;
      v14 = v13;
      objc_msgSend(v3, "modifyApplicationContext:", v25);

    }
  }
  else if (v6 && !v5 && objc_msgSend(v6, "environment") != 3 && objc_msgSend(v7, "environment") != 2)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __67__SBSwitcherShelfViewController__performSwitcherTransitionRequest___block_invoke_4;
    v24[3] = &unk_1E8E9EE50;
    v24[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "modifyApplicationContext:", v24);
  }
  v15 = objc_msgSend(*(id *)(a1 + 32), "floatingConfiguration");
  objc_msgSend(*(id *)(a1 + 40), "_windowScene");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layoutStateProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layoutState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "floatingConfiguration");

  if (objc_msgSend(v7, "environment") == 3 && !SBFloatingConfigurationIsStashed(v19))
  {
    if (SBFloatingConfigurationIsLeft(v19))
    {
      v20 = 3;
    }
    else
    {
      IsRight = SBFloatingConfigurationIsRight(v19);
      v20 = 4;
      if (!IsRight)
        v20 = v15;
    }
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __67__SBSwitcherShelfViewController__performSwitcherTransitionRequest___block_invoke_5;
    v23[3] = &__block_descriptor_40_e54_v16__0__SBWorkspaceApplicationSceneTransitionContext_8l;
    v23[4] = v20;
    objc_msgSend(v3, "modifyApplicationContext:", v23);
  }
  objc_msgSend(v3, "setSource:", 52);

  return 1;
}

void __67__SBSwitcherShelfViewController__performSwitcherTransitionRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__SBSwitcherShelfViewController__performSwitcherTransitionRequest___block_invoke_3;
  v6[3] = &unk_1E8EAC028;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  SBLayoutRoleEnumerateValidRoles(v6);
  objc_msgSend(v5, "setRequestedWindowPickerRole:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "layoutRole"));
  objc_msgSend(v5, "setActivatingEntity:", 0);

}

void __67__SBSwitcherShelfViewController__performSwitcherTransitionRequest___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = objc_msgSend(*(id *)(a1[4] + 1040), "layoutRole");
  v5 = (void *)a1[5];
  if (v4 == a2)
  {
    objc_msgSend(v5, "setEntity:forLayoutRole:", a1[6], objc_msgSend(*(id *)(a1[4] + 1040), "layoutRole"));
  }
  else
  {
    +[SBWorkspaceEntity entity](SBPreviousWorkspaceEntity, "entity");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEntity:forLayoutRole:", v6, a2);

  }
}

void __67__SBSwitcherShelfViewController__performSwitcherTransitionRequest___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1040);
  v3 = a2;
  objc_msgSend(v2, "bundleIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRequestedAppExposeBundleID:", v4);

}

uint64_t __67__SBSwitcherShelfViewController__performSwitcherTransitionRequest___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRequestedFloatingConfiguration:", *(_QWORD *)(a1 + 32));
}

- (void)dismissShelfForShelfTransition
{
  -[SBSwitcherShelfViewController dismissShelfWithTransitionSource:](self, "dismissShelfWithTransitionSource:", 56);
}

- (void)dismissShelfForAccessibilityTransition
{
  -[SBSwitcherShelfViewController dismissShelfWithTransitionSource:](self, "dismissShelfWithTransitionSource:", 18);
}

- (void)dismissShelfWithTransitionSource:(int64_t)a3
{
  void *v5;
  _QWORD v6[6];

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__SBSwitcherShelfViewController_dismissShelfWithTransitionSource___block_invoke;
  v6[3] = &unk_1E8EAAE78;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "requestTransitionWithOptions:builder:validator:", 0, v6, 0);

}

void __66__SBSwitcherShelfViewController_dismissShelfWithTransitionSource___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  _QWORD v5[5];

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setSource:", v3);
  objc_msgSend(v4, "setEventLabel:", CFSTR("DismissShelf"));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__SBSwitcherShelfViewController_dismissShelfWithTransitionSource___block_invoke_2;
  v5[3] = &unk_1E8E9EE50;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "modifyApplicationContext:", v5);

}

void __66__SBSwitcherShelfViewController_dismissShelfWithTransitionSource___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "displayMode");
  if (v3 == 1)
  {
    objc_msgSend(v4, "setRequestedAppExposeBundleID:", 0);
  }
  else if (!v3)
  {
    objc_msgSend(v4, "setRequestedWindowPickerRole:", 0);
  }

}

- (void)_dockHeightWillChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD v10[5];

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("SBFloatingDockControllerHeight"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("SBFloatingDockControllerHeightChangeInteractive"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if ((BSFloatIsZero() & 1) == 0 && (v9 & 1) == 0 && self->_presented)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__SBSwitcherShelfViewController__dockHeightWillChange___block_invoke;
    v10[3] = &unk_1E8E9DED8;
    v10[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v10);
  }
}

uint64_t __55__SBSwitcherShelfViewController__dockHeightWillChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissShelfForShelfTransition");
}

- (SBSwitcherShelf)shelf
{
  return self->_shelf;
}

- (SBSwitcherShelfViewControllerDataSource)dataSource
{
  return (SBSwitcherShelfViewControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (SBSwitcherShelfViewControllerDelegate)delegate
{
  return (SBSwitcherShelfViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSArray)appLayouts
{
  return self->_appLayouts;
}

- (unint64_t)contentOptions
{
  return self->_contentOptions;
}

- (NSSet)ignoredDisplayItems
{
  return self->_ignoredDisplayItems;
}

- (int64_t)contentOrientation
{
  return self->_contentOrientation;
}

- (SBPortalView)homeAffordancePortalView
{
  return self->_homeAffordancePortalView;
}

- (BOOL)presented
{
  return self->_presented;
}

- (CGRect)presentationTargetFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_presentationTargetFrame.origin.x;
  y = self->_presentationTargetFrame.origin.y;
  width = self->_presentationTargetFrame.size.width;
  height = self->_presentationTargetFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)animationStyle
{
  return self->_animationStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAffordancePortalView, 0);
  objc_storeStrong((id *)&self->_ignoredDisplayItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_shelf, 0);
  objc_storeStrong((id *)&self->_appLayouts, 0);
  objc_storeStrong((id *)&self->_idleTouchAwarenessClient, 0);
  objc_storeStrong((id *)&self->_rootModifier, 0);
  objc_storeStrong((id *)&self->_liveContentOverlayCoordinator, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
