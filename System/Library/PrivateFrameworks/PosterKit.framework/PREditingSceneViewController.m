@implementation PREditingSceneViewController

- (PREditingSceneViewController)initWithProvider:(id)a3 contents:(id)a4 configurableOptions:(id)a5 configuredProperties:(id)a6 additionalInfo:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  PREditingSessionModifications *v18;
  PREditingSessionModifications *modifications;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  int64_t v24;
  void *v25;
  NSString *v26;
  NSString *posterRole;
  NSString *v28;
  PREditingSceneViewController *v29;
  objc_super v31;

  v13 = a4;
  self->_usesEditingLayout = 1;
  objc_storeStrong((id *)&self->_path, a4);
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a3;
  v18 = objc_alloc_init(PREditingSessionModifications);
  modifications = self->_modifications;
  self->_modifications = v18;

  objc_msgSend(v13, "serverIdentity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "type");

  if ((unint64_t)(v21 - 3) > 0xFFFFFFFFFFFFFFFDLL
    || (objc_msgSend(v13, "serverIdentity"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v23 = objc_msgSend(v22, "isIncomingConfiguration"),
        v22,
        v23))
  {
    v24 = 1;
    self->_acceptButtonType = 1;
  }
  else
  {
    v24 = 2;
  }
  self->_destination = v24;
  objc_msgSend(v13, "serverIdentity");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "role");
  v26 = (NSString *)objc_claimAutoreleasedReturnValue();

  posterRole = self->_posterRole;
  self->_posterRole = v26;
  v28 = v26;

  -[PREditingSceneViewController _setUpDateOverriding](self, "_setUpDateOverriding");
  +[PRPosterPathModelObjectCache invalidateModelObjectCacheForPath:](PRPosterPathModelObjectCache, "invalidateModelObjectCacheForPath:", v13);
  v31.receiver = self;
  v31.super_class = (Class)PREditingSceneViewController;
  v29 = -[PRSceneViewController initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:](&v31, sel_initWithProvider_contents_configurableOptions_configuredProperties_additionalInfo_, v17, v13, v16, v15, v14);

  return v29;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  -[CHSWidgetExtensionProvider unregisterObserver:](self->_widgetExtensionProvider, "unregisterObserver:", self);
  -[CHSWidgetExtensionProvider invalidate](self->_widgetExtensionProvider, "invalidate");
  -[CHSWidgetExtensionProvider invalidate](self->_controlExtensionProvider, "invalidate");
  WeakRetained = objc_loadWeakRetained((id *)&self->_appProtectionSubjectMonitorSubscription);
  objc_msgSend(WeakRetained, "invalidate");

  -[PREditingSceneViewController _finalize](self, "_finalize");
  v4.receiver = self;
  v4.super_class = (Class)PREditingSceneViewController;
  -[PRSceneViewController dealloc](&v4, sel_dealloc);
}

- (void)_teardown
{
  NSObject *v3;
  BSInvalidatable *localKeyboardFocusAssertion;
  objc_super v5;
  uint8_t buf[16];

  PRLogEditing();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B634000, v3, OS_LOG_TYPE_DEFAULT, "editing tear down", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)PREditingSceneViewController;
  -[PRSceneViewController _teardown](&v5, sel__teardown);
  -[BSInvalidatable invalidate](self->_localKeyboardFocusAssertion, "invalidate");
  localKeyboardFocusAssertion = self->_localKeyboardFocusAssertion;
  self->_localKeyboardFocusAssertion = 0;

  -[PREditingSceneViewController setTornDown:](self, "setTornDown:", 1);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  SBHIconModel *v8;
  SBHIconModel *iconModel;
  PRIconListLayoutProvider *v10;
  PRIconListLayoutProvider *listLayoutProvider;
  PRWidgetIconViewProvider *v12;
  PRWidgetIconViewProvider *iconViewProvider;
  CHSWidgetExtensionProvider *v14;
  CHSWidgetExtensionProvider *widgetExtensionProvider;
  PRComplicationDescriptor *v16;
  void *v17;
  void *v18;
  PRComplicationDescriptor *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PREditingSessionModifications *modifications;
  void *v25;
  void *v26;
  NSHashTable *v27;
  NSHashTable *complicationContainerViewControllers;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  UIView *v35;
  UIView *sidebarComplicationGallerySourceView;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  double v42;
  PREditingSessionModifications *v43;
  void *v44;
  id v45;
  void *v46;
  CHSWidgetExtensionProvider *v47;
  CHSWidgetExtensionProvider *controlExtensionProvider;
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)PREditingSceneViewController;
  -[PRSceneViewController viewDidLoad](&v49, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CF96A8], "subjectMonitorRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addMonitor:subjectMask:subscriptionOptions:", self, 1, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_appProtectionSubjectMonitorSubscription, v4);

  -[PRSceneViewController configuredProperties](self, "configuredProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleStyleConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAlternateDateEnabled");

  -[PREditingSceneViewController setAlternateDateEnabled:](self, "setAlternateDateEnabled:", v7);
  if (!-[PREditingSceneViewController _areComplicationsDisallowed](self, "_areComplicationsDisallowed"))
  {
    v8 = (SBHIconModel *)objc_alloc_init(MEMORY[0x1E0DAA4B0]);
    iconModel = self->_iconModel;
    self->_iconModel = v8;

    -[SBHIconModel reloadIcons](self->_iconModel, "reloadIcons");
    v10 = -[PRIconListLayoutProvider initWithGridSize:]([PRIconListLayoutProvider alloc], "initWithGridSize:", 65540);
    listLayoutProvider = self->_listLayoutProvider;
    self->_listLayoutProvider = v10;

    v12 = -[PRWidgetIconViewProvider initWithRecycledViewsContainerProvider:widgetInteractionDisabled:useMaterialBackground:]([PRWidgetIconViewProvider alloc], "initWithRecycledViewsContainerProvider:widgetInteractionDisabled:useMaterialBackground:", self, 1, 0);
    iconViewProvider = self->_iconViewProvider;
    self->_iconViewProvider = v12;

    v14 = (CHSWidgetExtensionProvider *)objc_alloc_init(MEMORY[0x1E0D101B0]);
    widgetExtensionProvider = self->_widgetExtensionProvider;
    self->_widgetExtensionProvider = v14;

    -[CHSWidgetExtensionProvider registerObserver:](self->_widgetExtensionProvider, "registerObserver:", self);
    v16 = [PRComplicationDescriptor alloc];
    objc_msgSend(v5, "complicationLayout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "inlineComplication");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[PRComplicationDescriptor initWithPRSWidget:](v16, "initWithPRSWidget:", v18);

    objc_msgSend(v5, "suggestionMetadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "suggestedComplicationsByIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[PRComplicationDescriptor uniqueIdentifier](v19, "uniqueIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationDescriptor setSuggestedComplication:](v19, "setSuggestedComplication:", v23);

    -[PREditingSceneViewController setSelectedInlineComplication:](self, "setSelectedInlineComplication:", v19);
    -[PREditingSceneViewController _validateInlineComplication](self, "_validateInlineComplication");
    -[PREditingSceneViewController setGraphicComplicationSuggestionSets:](self, "setGraphicComplicationSuggestionSets:", MEMORY[0x1E0C9AA60]);
    -[PREditingSceneViewController _prefetchComplicationSuggestions](self, "_prefetchComplicationSuggestions");
    modifications = self->_modifications;
    if (v19)
    {
      -[PREditingSessionModifications setContainedWidgetsBeforeEdit:](self->_modifications, "setContainedWidgetsBeforeEdit:", 1);
    }
    else
    {
      objc_msgSend(v5, "complicationLayout");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "complications");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditingSessionModifications setContainedWidgetsBeforeEdit:](modifications, "setContainedWidgetsBeforeEdit:", objc_msgSend(v26, "count") != 0);

    }
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v27 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    complicationContainerViewControllers = self->_complicationContainerViewControllers;
    self->_complicationContainerViewControllers = v27;

    -[PREditingSceneViewController addComplicationGestureViewForElement:tapAction:initiallyAllowed:](self, "addComplicationGestureViewForElement:tapAction:initiallyAllowed:", 8, sel_addComplicationTapped_, -[PREditingSceneViewController _shouldAllowAddComplicationsTapGestureForLocation:](self, "_shouldAllowAddComplicationsTapGestureForLocation:", 0));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingSceneViewController setComplicationsAddGestureView:](self, "setComplicationsAddGestureView:", v29);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "userInterfaceIdiom");

    if ((v31 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      -[PREditingSceneViewController addComplicationGestureViewForElement:tapAction:initiallyAllowed:](self, "addComplicationGestureViewForElement:tapAction:initiallyAllowed:", 16, sel_addSidebarComplicationTapped_, -[PREditingSceneViewController _shouldAllowAddComplicationsTapGestureForLocation:](self, "_shouldAllowAddComplicationsTapGestureForLocation:", 1));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditingSceneViewController setSidebarComplicationAddGestureView:](self, "setSidebarComplicationAddGestureView:", v32);

    }
    -[PREditingSceneViewController addComplicationGestureViewForElement:tapAction:initiallyAllowed:](self, "addComplicationGestureViewForElement:tapAction:initiallyAllowed:", 4, sel_inlineComplicationGestureViewTapped_, -[PREditingSceneViewController _shouldAllowInlineComplicationTapGesture](self, "_shouldAllowInlineComplicationTapGesture"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingSceneViewController setInlineComplicationGestureView:](self, "setInlineComplicationGestureView:", v33);
    v34 = (void *)objc_opt_new();
    -[PREditingSceneViewController setEngagementCountsForViewedSuggestedComplications:](self, "setEngagementCountsForViewedSuggestedComplications:", v34);

    v35 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    sidebarComplicationGallerySourceView = self->_sidebarComplicationGallerySourceView;
    self->_sidebarComplicationGallerySourceView = v35;

    -[UIView setHidden:](self->_sidebarComplicationGallerySourceView, "setHidden:", 1);
    -[PREditingSceneViewController view](self, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addSubview:", self->_sidebarComplicationGallerySourceView);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObserver:selector:name:object:", self, sel__complicationsSceneCreated_, CFSTR("PRBComplicationsSceneCreatedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObserver:selector:name:object:", self, sel__quickActionsSceneCreated_, CFSTR("PRBQuickActionsSceneCreatedNotification"), 0);

  }
  -[PREditingSceneViewController view](self, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[PREditingSceneViewController isContentHidden](self, "isContentHidden");
  v42 = 1.0;
  if (v41)
    v42 = 0.0;
  objc_msgSend(v40, "setAlpha:", v42);

  v43 = self->_modifications;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingSessionModifications setStartDate:](v43, "setStartDate:", v44);

  v45 = objc_alloc(MEMORY[0x1E0D101B0]);
  objc_msgSend(MEMORY[0x1E0D101C0], "controls");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (CHSWidgetExtensionProvider *)objc_msgSend(v45, "initWithOptions:", v46);
  controlExtensionProvider = self->_controlExtensionProvider;
  self->_controlExtensionProvider = v47;

}

- (void)viewWillAppear:(BOOL)a3
{
  NSObject *v3;
  uint8_t v4[16];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PREditingSceneViewController;
  -[PRSceneViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  PRLogEditing();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18B634000, v3, OS_LOG_TYPE_DEFAULT, "PREditingSceneViewController will appear", v4, 2u);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PREditingSceneViewController;
  -[PRSceneViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  PRLogEditing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18B634000, v4, OS_LOG_TYPE_DEFAULT, "PREditingSceneViewController did appear", v5, 2u);
  }

  -[PREditingSceneViewController _presentWidgetEducationAlertIfNeeded](self, "_presentWidgetEducationAlertIfNeeded");
  -[PREditingSceneViewController _performWidgetDescriptorDiscovery](self, "_performWidgetDescriptorDiscovery");
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v3;
  uint8_t v4[16];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PREditingSceneViewController;
  -[PRSceneViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  PRLogEditing();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18B634000, v3, OS_LOG_TYPE_DEFAULT, "PREditingSceneViewController will disappear", v4, 2u);
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  NSObject *v3;
  uint8_t v4[16];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PREditingSceneViewController;
  -[PRSceneViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  PRLogEditing();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18B634000, v3, OS_LOG_TYPE_DEFAULT, "PREditingSceneViewController did disappear", v4, 2u);
  }

}

- (void)viewDidLayoutSubviews
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
  PREditorElementLayoutController *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double MinX;
  double MaxX;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)PREditingSceneViewController;
  -[PREditingSceneViewController viewDidLayoutSubviews](&v28, sel_viewDidLayoutSubviews);
  -[PREditingSceneViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = -[PREditorElementLayoutController initWithTraitEnvironment:]([PREditorElementLayoutController alloc], "initWithTraitEnvironment:", self);
  -[PREditorElementLayoutController frameForElements:variant:withBoundingRect:](v12, "frameForElements:variant:withBoundingRect:", 16, 2, v5, v7, v9, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");
  v22 = v14;
  v23 = v16;
  v24 = v18;
  v25 = v20;
  if (v21 == 1)
  {
    MinX = CGRectGetMinX(*(CGRect *)&v22);
    MaxX = 0.0;
  }
  else
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v22);
    MinX = v9 - MaxX;
  }
  -[UIView setFrame:](self->_sidebarComplicationGallerySourceView, "setFrame:", MaxX, 0.0, MinX, v11);

}

- (id)addComplicationGestureViewForElement:(unint64_t)a3 tapAction:(SEL)a4 initiallyAllowed:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
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
  PREditorElementLayoutController *v21;
  void *v22;

  v5 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHitTestsAsOpaque:", 1);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, a4);
  objc_msgSend(v11, "setDelegate:", self);
  objc_msgSend(v9, "addGestureRecognizer:", v11);
  -[PREditingSceneViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = -[PREditorElementLayoutController initWithTraitEnvironment:]([PREditorElementLayoutController alloc], "initWithTraitEnvironment:", self);
  -[PREditorElementLayoutController frameForElements:variant:withBoundingRect:](v21, "frameForElements:variant:withBoundingRect:", a3, 2, v14, v16, v18, v20);
  objc_msgSend(v9, "setFrame:");
  objc_msgSend(v9, "setHidden:", !v5);
  -[PREditingSceneViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", v9);

  return v9;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;

  -[PREditingSceneViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
    return 30;
  else
    return 2;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  FBScene *scene;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PREditingSceneViewController;
  v4 = a3;
  -[PREditingSceneViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[PREditingSceneViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
  {
    scene = self->super._scene;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__PREditingSceneViewController_traitCollectionDidChange___block_invoke;
    v9[3] = &__block_descriptor_40_e33_v16__0__FBSMutableSceneSettings_8l;
    v9[4] = v6;
    -[FBScene updateSettingsWithBlock:](scene, "updateSettingsWithBlock:", v9);
  }

}

uint64_t __57__PREditingSceneViewController_traitCollectionDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pui_setUserInterfaceStyle:", *(_QWORD *)(a1 + 32));
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)PREditingSceneViewController;
  v7 = a4;
  -[PRSceneViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[PREditingSceneViewController dismissAnyPresentedComplicationGalleryAnimated:](self, "dismissAnyPresentedComplicationGalleryAnimated:", 1);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__PREditingSceneViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E2184798;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

}

uint64_t __83__PREditingSceneViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateComplicationContainerVisibility");
  return objc_msgSend(*(id *)(a1 + 32), "_updateSceneSettingsForDepthEffectDisallowed");
}

- (void)_validateInlineComplication
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PRComplicationDescriptor widgetDescriptor](self->_selectedInlineComplication, "widgetDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerBundleIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CF9688], "applicationWithBundleIdentifier:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isLocked") & 1) != 0 || objc_msgSend(v5, "isHidden"))
    -[PREditingSceneViewController setSelectedInlineComplication:](self, "setSelectedInlineComplication:", 0);
  if (!-[PRComplicationDescriptor hasMatchingDescriptor](self->_selectedInlineComplication, "hasMatchingDescriptor"))
    -[PREditingSceneViewController setSelectedInlineComplication:](self, "setSelectedInlineComplication:", 0);

}

- (void)setSelectedInlineComplication:(id)a3
{
  PRComplicationDescriptor *v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  FBScene *scene;
  BOOL v11;
  _QWORD v12[4];
  BOOL v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (PRComplicationDescriptor *)a3;
  if (!-[PRComplicationDescriptor hasMatchingDescriptor](v4, "hasMatchingDescriptor"))
  {

    v4 = 0;
  }
  if (v4 != self->_selectedInlineComplication)
  {
    objc_storeStrong((id *)&self->_selectedInlineComplication, v4);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = self->_complicationContainerViewControllers;
    v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "setInlineComplicationDescriptor:", v4);
        }
        v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    scene = self->super._scene;
    v11 = self->_selectedInlineComplication != 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__PREditingSceneViewController_setSelectedInlineComplication___block_invoke;
    v12[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
    v13 = v11;
    -[FBScene updateSettingsWithBlock:](scene, "updateSettingsWithBlock:", v12);
  }

}

uint64_t __62__PREditingSceneViewController_setSelectedInlineComplication___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pui_setInlineComplicationConfigured:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setAlternateDateEnabled:(BOOL)a3
{
  FBScene *scene;
  _QWORD v4[4];
  BOOL v5;

  if (self->_alternateDateEnabled != a3)
  {
    self->_alternateDateEnabled = a3;
    scene = self->super._scene;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __56__PREditingSceneViewController_setAlternateDateEnabled___block_invoke;
    v4[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
    v5 = a3;
    -[FBScene updateSettingsWithBlock:](scene, "updateSettingsWithBlock:", v4);
  }
}

uint64_t __56__PREditingSceneViewController_setAlternateDateEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setAlternateDateEnabled:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setControlsHidden:(BOOL)a3
{
  -[PREditingSceneViewController setControlsHidden:animationSettings:](self, "setControlsHidden:animationSettings:", a3, 0);
}

- (void)setControlsHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  id v7;

  v4 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.25);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = (id)v6;
  -[PREditingSceneViewController setControlsHidden:animationSettings:](self, "setControlsHidden:animationSettings:", v4, v6);

}

- (void)setControlsHidden:(BOOL)a3 animationSettings:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  FBScene *scene;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v4 = a3;
  v6 = a4;
  if (self->_controlsHidden != v4)
  {
    self->_controlsHidden = v4;
    v12 = v6;
    -[PREditingSceneViewController _updateAddComplicationsTapGestureAllowed](self, "_updateAddComplicationsTapGestureAllowed");
    -[PREditingSceneViewController _updateLocalControlsHiddenWithAnimationSettings:](self, "_updateLocalControlsHiddenWithAnimationSettings:", v12);
    -[PREditingSceneViewController viewIfLoaded](self, "viewIfLoaded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    scene = self->super._scene;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __68__PREditingSceneViewController_setControlsHidden_animationSettings___block_invoke;
    v13[3] = &unk_1E21857E0;
    v16 = v4;
    v13[4] = self;
    v14 = v12;
    v15 = v9;
    v11 = v9;
    -[FBScene updateSettingsWithTransitionBlock:](scene, "updateSettingsWithTransitionBlock:", v13);

    v6 = v12;
  }

}

id __68__PREditingSceneViewController_setControlsHidden_animationSettings___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "pr_setControlsHidden:", *(unsigned __int8 *)(a1 + 56));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "isActive") && *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0DC3490], "transitionContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "_synchronizeDrawing");
    objc_msgSend(*(id *)(a1 + 48), "_synchronizedDrawingFence");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAnimationFence:", v4);

    objc_msgSend(v3, "setAnimationSettings:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setUsesEditingLayout:(BOOL)a3
{
  -[PREditingSceneViewController setUsesEditingLayout:animationSettings:](self, "setUsesEditingLayout:animationSettings:", a3, 0);
}

- (void)setUsesEditingLayout:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  id v7;

  v4 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.25);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = (id)v6;
  -[PREditingSceneViewController setUsesEditingLayout:animationSettings:](self, "setUsesEditingLayout:animationSettings:", v4, v6);

}

- (void)setUsesEditingLayout:(BOOL)a3 animationSettings:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  FBScene *scene;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v4 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_usesEditingLayout != v4)
  {
    self->_usesEditingLayout = v4;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = self->_complicationContainerViewControllers;
    v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11++), "setUsesEditingLayout:animationSettings:", v4, v6);
        }
        while (v9 != v11);
        v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    -[PREditingSceneViewController viewIfLoaded](self, "viewIfLoaded");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "windowScene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    scene = self->super._scene;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __71__PREditingSceneViewController_setUsesEditingLayout_animationSettings___block_invoke;
    v17[3] = &unk_1E21857E0;
    v20 = v4;
    v17[4] = self;
    v18 = v6;
    v19 = v14;
    v16 = v14;
    -[FBScene updateSettingsWithTransitionBlock:](scene, "updateSettingsWithTransitionBlock:", v17);

  }
}

id __71__PREditingSceneViewController_setUsesEditingLayout_animationSettings___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "pr_setUsesEditingLayout:", *(unsigned __int8 *)(a1 + 56));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "isActive") && *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0DC3490], "transitionContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "_synchronizeDrawing");
    objc_msgSend(*(id *)(a1 + 48), "_synchronizedDrawingFence");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAnimationFence:", v4);

    objc_msgSend(v3, "setAnimationSettings:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setShowsContentWhenReady:(BOOL)a3
{
  _BOOL4 v3;

  if (self->_showsContentWhenReady != a3)
  {
    v3 = a3;
    self->_showsContentWhenReady = a3;
    -[PRSceneViewController _updatePresentationBackgroundColor](self, "_updatePresentationBackgroundColor");
    if (v3)
      -[PREditingSceneViewController setContentHidden:animated:completion:](self, "setContentHidden:animated:completion:", -[PRSceneViewController isSceneContentReady](self, "isSceneContentReady") ^ 1, 0, 0);
  }
}

- (void)setAllowsTransparentContent:(BOOL)a3
{
  if (self->_allowsTransparentContent != a3)
  {
    self->_allowsTransparentContent = a3;
    -[PRSceneViewController _updatePresentationBackgroundColor](self, "_updatePresentationBackgroundColor");
  }
}

- (void)setContentHidden:(BOOL)a3
{
  -[PREditingSceneViewController setContentHidden:animationSettings:completion:](self, "setContentHidden:animationSettings:completion:", a3, 0, 0);
}

- (void)setContentHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  v9 = a5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.25);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  -[PREditingSceneViewController setContentHidden:animationSettings:completion:](self, "setContentHidden:animationSettings:completion:", v6, v8, v9);

}

- (void)setContentHidden:(BOOL)a3 animationSettings:(id)a4 completion:(id)a5
{
  _QWORD v5[5];
  BOOL v6;

  if (self->_contentHidden != a3)
  {
    self->_contentHidden = a3;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __78__PREditingSceneViewController_setContentHidden_animationSettings_completion___block_invoke;
    v5[3] = &unk_1E2184468;
    v5[4] = self;
    v6 = a3;
    objc_msgSend(MEMORY[0x1E0D01908], "animateWithSettings:actions:completion:", a4, v5, a5);
  }
}

void __78__PREditingSceneViewController_setContentHidden_animationSettings_completion___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "viewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v3 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v3 = 1.0;
  objc_msgSend(v2, "setAlpha:", v3);

}

- (void)setSelectedQuickActionPosition:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  FBScene *scene;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;
  BOOL v17;

  if (self->_selectedQuickActionPosition != a3)
  {
    self->_selectedQuickActionPosition = a3;
    -[PREditingSceneViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PREditingSceneViewController _shouldDepthEffectBeDisallowed](self, "_shouldDepthEffectBeDisallowed");
    scene = self->super._scene;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __63__PREditingSceneViewController_setSelectedQuickActionPosition___block_invoke;
    v13[3] = &unk_1E2185808;
    v17 = v9;
    v13[4] = self;
    v14 = v8;
    v15 = v7;
    v16 = a3;
    v11 = v7;
    v12 = v8;
    -[FBScene updateSettingsWithTransitionBlock:](scene, "updateSettingsWithTransitionBlock:", v13);

  }
}

id __63__PREditingSceneViewController_setSelectedQuickActionPosition___block_invoke(uint64_t a1, void *a2)
{
  _BOOL8 v3;
  id v4;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 56) != 0;
  v4 = a2;
  objc_msgSend(v4, "pr_setControlsHidden:", v3);
  objc_msgSend(v4, "pr_setFocusedQuickActionElementPosition:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "pr_setDepthEffectDisallowed:", *(unsigned __int8 *)(a1 + 64));

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "isActive") && *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0DC3490], "transitionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "_synchronizeDrawing");
    objc_msgSend(*(id *)(a1 + 48), "_synchronizedDrawingFence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAnimationFence:", v6);

    objc_msgSend(v5, "setAnimationSettings:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)setAcceptButtonType:(int64_t)a3
{
  FBScene *scene;
  _QWORD v4[5];

  if (self->_acceptButtonType != a3)
  {
    self->_acceptButtonType = a3;
    scene = self->super._scene;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __52__PREditingSceneViewController_setAcceptButtonType___block_invoke;
    v4[3] = &__block_descriptor_40_e33_v16__0__FBSMutableSceneSettings_8l;
    v4[4] = a3;
    -[FBScene updateSettingsWithBlock:](scene, "updateSettingsWithBlock:", v4);
  }
}

uint64_t __52__PREditingSceneViewController_setAcceptButtonType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setEditingAcceptButtonType:", *(_QWORD *)(a1 + 32));
}

- (void)setVariant:(int64_t)a3
{
  FBScene *scene;
  _QWORD v4[5];

  if (self->_variant != a3)
  {
    self->_variant = a3;
    scene = self->super._scene;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __43__PREditingSceneViewController_setVariant___block_invoke;
    v4[3] = &__block_descriptor_40_e33_v16__0__FBSMutableSceneSettings_8l;
    v4[4] = a3;
    -[FBScene updateSettingsWithBlock:](scene, "updateSettingsWithBlock:", v4);
  }
}

uint64_t __43__PREditingSceneViewController_setVariant___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setEditingVariant:", *(_QWORD *)(a1 + 32));
}

- (void)setLeadingTopButtonFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_leadingTopButtonFrame;
  FBScene *scene;
  _QWORD v10[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_leadingTopButtonFrame = &self->_leadingTopButtonFrame;
  if (!CGRectEqualToRect(a3, self->_leadingTopButtonFrame))
  {
    p_leadingTopButtonFrame->origin.x = x;
    p_leadingTopButtonFrame->origin.y = y;
    p_leadingTopButtonFrame->size.width = width;
    p_leadingTopButtonFrame->size.height = height;
    scene = self->super._scene;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__PREditingSceneViewController_setLeadingTopButtonFrame___block_invoke;
    v10[3] = &unk_1E2184D90;
    v10[4] = self;
    -[FBScene performUpdate:](scene, "performUpdate:", v10);
  }
}

uint64_t __57__PREditingSceneViewController_setLeadingTopButtonFrame___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSceneSettings:transitionContext:", a2, a3);
}

- (void)setTrailingTopButtonFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_trailingTopButtonFrame;
  FBScene *scene;
  _QWORD v10[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_trailingTopButtonFrame = &self->_trailingTopButtonFrame;
  if (!CGRectEqualToRect(a3, self->_trailingTopButtonFrame))
  {
    p_trailingTopButtonFrame->origin.x = x;
    p_trailingTopButtonFrame->origin.y = y;
    p_trailingTopButtonFrame->size.width = width;
    p_trailingTopButtonFrame->size.height = height;
    scene = self->super._scene;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__PREditingSceneViewController_setTrailingTopButtonFrame___block_invoke;
    v10[3] = &unk_1E2184D90;
    v10[4] = self;
    -[FBScene performUpdate:](scene, "performUpdate:", v10);
  }
}

uint64_t __58__PREditingSceneViewController_setTrailingTopButtonFrame___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSceneSettings:transitionContext:", a2, a3);
}

- (void)setHorizontalTitleBoundingRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_horizontalTitleBoundingRect;
  int v9;
  FBScene *scene;
  _QWORD v11[8];
  _QWORD v12[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_horizontalTitleBoundingRect = &self->_horizontalTitleBoundingRect;
  if (!CGRectEqualToRect(a3, self->_horizontalTitleBoundingRect))
  {
    p_horizontalTitleBoundingRect->origin.x = x;
    p_horizontalTitleBoundingRect->origin.y = y;
    p_horizontalTitleBoundingRect->size.width = width;
    p_horizontalTitleBoundingRect->size.height = height;
    v9 = -[FBScene isActive](self->super._scene, "isActive");
    scene = self->super._scene;
    if (v9)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __63__PREditingSceneViewController_setHorizontalTitleBoundingRect___block_invoke;
      v12[3] = &unk_1E2184D90;
      v12[4] = self;
      -[FBScene performUpdate:](scene, "performUpdate:", v12);
    }
    else
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __63__PREditingSceneViewController_setHorizontalTitleBoundingRect___block_invoke_2;
      v11[3] = &__block_descriptor_64_e33_v16__0__FBSMutableSceneSettings_8l;
      *(CGFloat *)&v11[4] = x;
      *(CGFloat *)&v11[5] = y;
      *(CGFloat *)&v11[6] = width;
      *(CGFloat *)&v11[7] = height;
      -[FBScene updateSettingsWithBlock:](scene, "updateSettingsWithBlock:", v11);
    }
  }
}

uint64_t __63__PREditingSceneViewController_setHorizontalTitleBoundingRect___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSceneSettings:transitionContext:", a2, a3);
}

uint64_t __63__PREditingSceneViewController_setHorizontalTitleBoundingRect___block_invoke_2(double *a1, void *a2)
{
  return objc_msgSend(a2, "pr_setHorizontalTitleBoundingRect:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)setVerticalTitleBoundingRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_verticalTitleBoundingRect;
  int v9;
  FBScene *scene;
  _QWORD v11[8];
  _QWORD v12[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_verticalTitleBoundingRect = &self->_verticalTitleBoundingRect;
  if (!CGRectEqualToRect(a3, self->_verticalTitleBoundingRect))
  {
    p_verticalTitleBoundingRect->origin.x = x;
    p_verticalTitleBoundingRect->origin.y = y;
    p_verticalTitleBoundingRect->size.width = width;
    p_verticalTitleBoundingRect->size.height = height;
    v9 = -[FBScene isActive](self->super._scene, "isActive");
    scene = self->super._scene;
    if (v9)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __61__PREditingSceneViewController_setVerticalTitleBoundingRect___block_invoke;
      v12[3] = &unk_1E2184D90;
      v12[4] = self;
      -[FBScene performUpdate:](scene, "performUpdate:", v12);
    }
    else
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __61__PREditingSceneViewController_setVerticalTitleBoundingRect___block_invoke_2;
      v11[3] = &__block_descriptor_64_e33_v16__0__FBSMutableSceneSettings_8l;
      *(CGFloat *)&v11[4] = x;
      *(CGFloat *)&v11[5] = y;
      *(CGFloat *)&v11[6] = width;
      *(CGFloat *)&v11[7] = height;
      -[FBScene updateSettingsWithBlock:](scene, "updateSettingsWithBlock:", v11);
    }
  }
}

uint64_t __61__PREditingSceneViewController_setVerticalTitleBoundingRect___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSceneSettings:transitionContext:", a2, a3);
}

uint64_t __61__PREditingSceneViewController_setVerticalTitleBoundingRect___block_invoke_2(double *a1, void *a2)
{
  return objc_msgSend(a2, "pr_setVerticalTitleBoundingRect:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)setTitleString:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *titleString;
  int v7;
  FBScene *scene;
  NSString *v9;
  _QWORD v10[4];
  NSString *v11;
  _QWORD v12[5];

  v4 = (NSString *)a3;
  if (self->_titleString != v4)
  {
    v9 = v4;
    v5 = (NSString *)-[NSString copy](v4, "copy");
    titleString = self->_titleString;
    self->_titleString = v5;

    v7 = -[FBScene isActive](self->super._scene, "isActive");
    scene = self->super._scene;
    if (v7)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __47__PREditingSceneViewController_setTitleString___block_invoke;
      v12[3] = &unk_1E2184D90;
      v12[4] = self;
      -[FBScene performUpdate:](scene, "performUpdate:", v12);
    }
    else
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __47__PREditingSceneViewController_setTitleString___block_invoke_2;
      v10[3] = &unk_1E2184F48;
      v11 = v9;
      -[FBScene updateSettingsWithBlock:](scene, "updateSettingsWithBlock:", v10);

    }
    v4 = v9;
  }

}

uint64_t __47__PREditingSceneViewController_setTitleString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSceneSettings:transitionContext:", a2, a3);
}

uint64_t __47__PREditingSceneViewController_setTitleString___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setTitleString:", *(_QWORD *)(a1 + 32));
}

- (void)setOverrideDate:(id)a3
{
  NSDate *v4;
  NSDate *v5;
  NSDate *overrideDate;
  int v7;
  FBScene *scene;
  NSDate *v9;
  _QWORD v10[4];
  NSDate *v11;
  _QWORD v12[5];

  v4 = (NSDate *)a3;
  if (self->_overrideDate != v4)
  {
    v9 = v4;
    v5 = (NSDate *)-[NSDate copy](v4, "copy");
    overrideDate = self->_overrideDate;
    self->_overrideDate = v5;

    v7 = -[FBScene isActive](self->super._scene, "isActive");
    scene = self->super._scene;
    if (v7)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __48__PREditingSceneViewController_setOverrideDate___block_invoke;
      v12[3] = &unk_1E2184D90;
      v12[4] = self;
      -[FBScene performUpdate:](scene, "performUpdate:", v12);
    }
    else
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __48__PREditingSceneViewController_setOverrideDate___block_invoke_2;
      v10[3] = &unk_1E2184F48;
      v11 = v9;
      -[FBScene updateSettingsWithBlock:](scene, "updateSettingsWithBlock:", v10);

    }
    v4 = v9;
  }

}

uint64_t __48__PREditingSceneViewController_setOverrideDate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSceneSettings:transitionContext:", a2, a3);
}

uint64_t __48__PREditingSceneViewController_setOverrideDate___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setOverrideDate:", *(_QWORD *)(a1 + 32));
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)addLongSaveOperationIndicator
{
  void *v2;
  id v3;
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
  void *v15;
  void *v16;
  void *v17;
  UIView *v18;
  UIView *saveIndicatorContainerView;
  UIView *v20;
  void *v21;
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
  void *v32;
  void *v33;
  _QWORD v35[4];
  UIView *v36;
  _QWORD v37[8];

  v37[6] = *MEMORY[0x1E0C80C00];
  if (!self->_saveIndicatorContainerView)
  {
    -[PREditingSceneViewController view](self, "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v4);

    objc_msgSend(v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCompositingFilter:", *MEMORY[0x1E0CD2EC0]);

    objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setColor:", v7);

    objc_msgSend(v6, "startAnimating");
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v3, "addSubview:", v6);
    objc_msgSend(v3, "setAlpha:", 0.0);
    v8 = v2;
    objc_msgSend(v2, "addSubview:", v3);
    v24 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v6, "centerXAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "centerXAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v31;
    objc_msgSend(v6, "centerYAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "centerYAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v27;
    objc_msgSend(v3, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v23;
    objc_msgSend(v3, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v9;
    objc_msgSend(v3, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v2;
    objc_msgSend(v2, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v37[4] = v12;
    objc_msgSend(v3, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37[5] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v16);

    v17 = (void *)MEMORY[0x1E0DC3F10];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __61__PREditingSceneViewController_addLongSaveOperationIndicator__block_invoke;
    v35[3] = &unk_1E2184010;
    v18 = (UIView *)v3;
    v36 = v18;
    objc_msgSend(v17, "animateWithDuration:animations:", v35, 0.2);
    saveIndicatorContainerView = self->_saveIndicatorContainerView;
    self->_saveIndicatorContainerView = v18;
    v20 = v18;

  }
}

uint64_t __61__PREditingSceneViewController_addLongSaveOperationIndicator__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)removeLongSaveOperationIndicator
{
  UIView *saveIndicatorContainerView;
  UIView *v4;

  saveIndicatorContainerView = self->_saveIndicatorContainerView;
  if (saveIndicatorContainerView)
  {
    -[UIView removeFromSuperview](saveIndicatorContainerView, "removeFromSuperview");
    v4 = self->_saveIndicatorContainerView;
    self->_saveIndicatorContainerView = 0;

  }
}

- (void)setPresentedSidebarComplicationsGallery:(id)a3
{
  id *p_presentedSidebarComplicationsGallery;
  BSInvalidatable *localKeyboardFocusAssertion;
  BSInvalidatable *v7;
  BSInvalidatable *v8;
  id v9;

  p_presentedSidebarComplicationsGallery = (id *)&self->_presentedSidebarComplicationsGallery;
  v9 = a3;
  if ((objc_msgSend(*p_presentedSidebarComplicationsGallery, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_presentedSidebarComplicationsGallery, a3);
    localKeyboardFocusAssertion = self->_localKeyboardFocusAssertion;
    if (*p_presentedSidebarComplicationsGallery)
    {
      if (!localKeyboardFocusAssertion)
      {
        -[PRSceneViewController _acquireLocalKeyboardFocusAssertion](self, "_acquireLocalKeyboardFocusAssertion");
        v7 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
LABEL_7:
        v8 = self->_localKeyboardFocusAssertion;
        self->_localKeyboardFocusAssertion = v7;

      }
    }
    else if (localKeyboardFocusAssertion)
    {
      -[BSInvalidatable invalidate](localKeyboardFocusAssertion, "invalidate");
      v7 = 0;
      goto LABEL_7;
    }
  }

}

+ (id)role
{
  return (id)*MEMORY[0x1E0D7FD90];
}

- (void)_updateSceneSettings:(id)a3 transitionContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PREditingSceneViewController;
  v6 = a3;
  -[PRSceneViewController _updateSceneSettings:transitionContext:](&v13, sel__updateSceneSettings_transitionContext_, v6, a4);
  objc_msgSend(v6, "pr_setCoveredByModalPresentation:", -[PREditingSceneViewController _isPosterCoveredByModalPresentation](self, "_isPosterCoveredByModalPresentation"));
  objc_msgSend(v6, "pr_setEditingVariant:", -[PREditingSceneViewController variant](self, "variant"));
  objc_msgSend(v6, "pr_setEditingAcceptButtonType:", -[PREditingSceneViewController acceptButtonType](self, "acceptButtonType"));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[PREditingSceneViewController _topButtonLayout](self, "_topButtonLayout");
  objc_msgSend(v6, "pr_setLeadingTopButtonFrame:", v9, v10);
  objc_msgSend(v6, "pr_setTrailingTopButtonFrame:", v11, v12);
  -[PREditingSceneViewController horizontalTitleBoundingRect](self, "horizontalTitleBoundingRect");
  objc_msgSend(v6, "pr_setHorizontalTitleBoundingRect:");
  -[PREditingSceneViewController verticalTitleBoundingRect](self, "verticalTitleBoundingRect");
  objc_msgSend(v6, "pr_setVerticalTitleBoundingRect:");
  -[PREditingSceneViewController titleString](self, "titleString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pr_setTitleString:", v7);
  -[PREditingSceneViewController overrideDate](self, "overrideDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pr_setOverrideDate:", v8);

}

- (id)_presentationBackgroundColor
{
  _BOOL4 v3;
  void *v4;
  objc_super v6;

  v3 = -[PRSceneViewController isSceneContentReady](self, "isSceneContentReady");
  if (-[PREditingSceneViewController showsContentWhenReady](self, "showsContentWhenReady") && !v3
    || -[PREditingSceneViewController allowsTransparentContent](self, "allowsTransparentContent") && v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PREditingSceneViewController;
    -[PRSceneViewController _presentationBackgroundColor](&v6, sel__presentationBackgroundColor);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (PREditingSceneViewControllerTopButtonLayout)_topButtonLayout
{
  CGRect *p_trailingTopButtonFrame;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  PREditingSceneViewControllerTopButtonLayout *result;
  void *v23;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGPoint v28;
  CGSize v29;
  CGSize v30;
  CGSize v31;
  CGPoint v32;
  CGSize v33;
  CGPoint origin;
  CGSize size;
  CGPoint v36;
  CGSize v37;
  CGPoint v38;
  CGSize v39;
  CGPoint v40;
  CGSize v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  retstr->trailingTopButtonFrame.size = 0u;
  retstr->leadingTopButtonFrame.origin = 0u;
  retstr->leadingTopButtonFrame.size = 0u;
  retstr->trailingTopButtonFrame.origin = 0u;
  p_trailingTopButtonFrame = &retstr->trailingTopButtonFrame;
  -[PREditingSceneViewController leadingTopButtonFrame](self, "leadingTopButtonFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  retstr->leadingTopButtonFrame.origin.x = v6;
  retstr->leadingTopButtonFrame.origin.y = v8;
  retstr->leadingTopButtonFrame.size.width = v10;
  retstr->leadingTopButtonFrame.size.height = v12;
  -[PREditingSceneViewController trailingTopButtonFrame](self, "trailingTopButtonFrame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  p_trailingTopButtonFrame->origin.x = v14;
  retstr->trailingTopButtonFrame.origin.y = v16;
  retstr->trailingTopButtonFrame.size.width = v18;
  retstr->trailingTopButtonFrame.size.height = v20;
  v43.origin.x = v7;
  v43.origin.y = v9;
  v43.size.width = v11;
  v43.size.height = v13;
  if (CGRectIsEmpty(v43)
    || (v44.origin.x = v15,
        v44.origin.y = v17,
        v44.size.width = v19,
        v44.size.height = v21,
        result = (PREditingSceneViewControllerTopButtonLayout *)CGRectIsEmpty(v44),
        (_DWORD)result))
  {
    -[PREditingSceneViewController delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      memset(&v42, 0, sizeof(v42));
      v40 = (CGPoint)0;
      v41 = (CGSize)0;
      if (v23)
      {
        objc_msgSend(v23, "topButtonLayoutForEditingSceneViewController:", self);
        y = v40.y;
        x = v40.x;
        height = v41.height;
        width = v41.width;
      }
      else
      {
        height = 0.0;
        width = 0.0;
        y = 0.0;
        x = 0.0;
      }
      if (CGRectIsEmpty(*(CGRect *)&x) || CGRectIsEmpty(v42))
      {
        -[PREditingSceneViewController lastValidDelegateTopButtonLayout](self, "lastValidDelegateTopButtonLayout");
        v30 = v37;
        retstr->leadingTopButtonFrame.origin = v36;
        retstr->leadingTopButtonFrame.size = v30;
        v31 = v39;
        retstr->trailingTopButtonFrame.origin = v38;
        retstr->trailingTopButtonFrame.size = v31;
      }
      else
      {
        v32 = v40;
        v33 = v41;
        retstr->leadingTopButtonFrame.origin = v40;
        retstr->leadingTopButtonFrame.size = v33;
        origin = v42.origin;
        size = v42.size;
        retstr->trailingTopButtonFrame.origin = v42.origin;
        retstr->trailingTopButtonFrame.size = size;
        v36 = v32;
        v37 = v33;
        v38 = origin;
        v39 = size;
        -[PREditingSceneViewController setLastValidDelegateTopButtonLayout:](self, "setLastValidDelegateTopButtonLayout:", &v36);
      }
    }
    else
    {
      v28 = (CGPoint)*MEMORY[0x1E0C9D648];
      v29 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
      p_trailingTopButtonFrame->origin = (CGPoint)*MEMORY[0x1E0C9D648];
      p_trailingTopButtonFrame->size = v29;
      retstr->leadingTopButtonFrame.origin = v28;
      retstr->leadingTopButtonFrame.size = v29;
    }

  }
  return result;
}

- (void)_complicationsSceneCreated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PRComplicationContainerViewController *v20;
  void *v21;
  void *v22;
  PRComplicationContainerViewController *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;

  v4 = a3;
  -[PREditingSceneViewController dismissAnyPresentedComplicationGalleryAnimated:](self, "dismissAnyPresentedComplicationGalleryAnimated:", 1);
  -[PRSceneViewController configuredProperties](self, "configuredProperties");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "suggestionMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suggestedComplicationsByIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "complicationLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "complications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __59__PREditingSceneViewController__complicationsSceneCreated___block_invoke;
  v30[3] = &unk_1E2185850;
  v10 = v6;
  v31 = v10;
  objc_msgSend(v8, "bs_map:", v30);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "complicationLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sidebarComplications");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v9;
  v28[1] = 3221225472;
  v28[2] = __59__PREditingSceneViewController__complicationsSceneCreated___block_invoke_2;
  v28[3] = &unk_1E2185850;
  v29 = v10;
  v14 = v10;
  objc_msgSend(v13, "bs_map:", v28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "complicationLayout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "complicationIconLayout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "complicationLayout");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sidebarComplicationIconLayout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = [PRComplicationContainerViewController alloc];
  if (v11)
    v21 = v11;
  else
    v21 = (void *)MEMORY[0x1E0C9AA60];
  if (v15)
    v22 = v15;
  else
    v22 = (void *)MEMORY[0x1E0C9AA60];
  v23 = -[PRComplicationContainerViewController initWithInlineComplicationDescriptor:graphicComplicationDescriptors:graphicComplicationIconLayout:sidebarComplicationDescriptors:sidebarIconLayout:](v20, "initWithInlineComplicationDescriptor:graphicComplicationDescriptors:graphicComplicationIconLayout:sidebarComplicationDescriptors:sidebarIconLayout:", self->_selectedInlineComplication, v21, v17, v22, v19);
  -[PRComplicationContainerViewController setDelegate:](v23, "setDelegate:", self);
  -[PRComplicationContainerViewController setUsesEditingLayout:](v23, "setUsesEditingLayout:", -[PREditingSceneViewController usesEditingLayout](self, "usesEditingLayout"));
  -[PREditingSceneViewController vibrancyConfiguration](self, "vibrancyConfiguration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRComplicationContainerViewController setVibrancyConfiguration:](v23, "setVibrancyConfiguration:", v24);

  -[NSHashTable addObject:](self->_complicationContainerViewControllers, "addObject:", v23);
  objc_msgSend(v4, "userInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[PREditingSceneViewController _windowFromUserInfo:](self, "_windowFromUserInfo:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "setRootViewController:", v23);
  objc_msgSend(v26, "makeKeyAndVisible");
  -[PREditingSceneViewController _updateAddComplicationsTapGestureAllowed](self, "_updateAddComplicationsTapGestureAllowed");
  -[PREditingSceneViewController _updateComplicationContainerVisibility](self, "_updateComplicationContainerVisibility");

}

PRComplicationDescriptor *__59__PREditingSceneViewController__complicationsSceneCreated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PRComplicationDescriptor *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = -[PRComplicationDescriptor initWithPRSWidget:]([PRComplicationDescriptor alloc], "initWithPRSWidget:", v3);

  v5 = *(void **)(a1 + 32);
  -[PRComplicationDescriptor uniqueIdentifier](v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRComplicationDescriptor setSuggestedComplication:](v4, "setSuggestedComplication:", v7);

  return v4;
}

PRComplicationDescriptor *__59__PREditingSceneViewController__complicationsSceneCreated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  PRComplicationDescriptor *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = -[PRComplicationDescriptor initWithPRSWidget:]([PRComplicationDescriptor alloc], "initWithPRSWidget:", v3);

  v5 = *(void **)(a1 + 32);
  -[PRComplicationDescriptor uniqueIdentifier](v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRComplicationDescriptor setSuggestedComplication:](v4, "setSuggestedComplication:", v7);

  return v4;
}

- (void)_quickActionsSceneCreated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PRPosterQuickActionsConfiguration *v7;
  PRQuickActionEditingViewController *v8;
  void *v9;
  _BOOL4 v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[PRSceneViewController configuredProperties](self, "configuredProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v5, "mutableCopy");

  -[PRSceneViewController configuredProperties](self, "configuredProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "quickActionsConfiguration");
  v7 = (PRPosterQuickActionsConfiguration *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = -[PRPosterQuickActionsConfiguration initWithLeadingControl:trailingControl:]([PRPosterQuickActionsConfiguration alloc], "initWithLeadingControl:trailingControl:", 0, 0);
    objc_msgSend(v14, "setQuickActionsConfiguration:", v7);
    -[PRSceneViewController setConfiguredProperties:](self, "setConfiguredProperties:", v14);
  }
  v8 = -[PRQuickActionEditingViewController initWithQuickActionsConfiguration:]([PRQuickActionEditingViewController alloc], "initWithQuickActionsConfiguration:", v7);
  -[PRQuickActionEditingViewController view](v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PREditingSceneViewController areControlsHidden](self, "areControlsHidden");
  v11 = 1.0;
  if (v10)
    v11 = 0.0;
  objc_msgSend(v9, "setAlpha:", v11);

  -[PRQuickActionEditingViewController setDelegate:](v8, "setDelegate:", self);
  -[PREditingSceneViewController setQuickActionEditingViewController:](self, "setQuickActionEditingViewController:", v8);
  objc_msgSend(v4, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PREditingSceneViewController _windowFromUserInfo:](self, "_windowFromUserInfo:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setRootViewController:", v8);
  objc_msgSend(v13, "makeKeyAndVisible");
  -[PRQuickActionEditingViewController validateControls](v8, "validateControls");

}

- (id)_windowFromUserInfo:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (void)_unregisterComplicationContainerViewControllerDelegates
{
  NSHashTable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_complicationContainerViewControllers;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setDelegate:", 0, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_prefetchComplicationSuggestions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  v3 = objc_alloc(MEMORY[0x1E0CF8E10]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01710], "colorWithRed:green:blue:alpha:", 1.0, 0.0, 0.0, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithIdentifier:descriptorIdentifier:extensionBundleIdentifier:localizedDisplayName:modeSemanticType:titleFontName:titleColor:subtitleComplication:layoutType:complications:landscapeComplications:", v5, v7, &stru_1E2186E08, &stru_1E2186E08, 0, &stru_1E2186E08, v8, 0, 2, 0, 0);

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CF8E20], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke;
  v18[3] = &unk_1E21858A0;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v10, "fetchComplicationSetsForFaceGalleryItem:completion:", v9, v18);

  objc_msgSend(MEMORY[0x1E0CF8E20], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_170;
  v16[3] = &unk_1E21858C8;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v12, "fetchInlineComplicationSetForFaceGalleryItem:completion:", v9, v16);

  objc_msgSend(MEMORY[0x1E0CF8E20], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_173;
  v14[3] = &unk_1E21858F0;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v13, "fetchLandscapeComplicationSetsForFaceGalleryItem:completion:", v9, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_2;
  block[3] = &unk_1E2185878;
  v10 = v6;
  v7 = v6;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v11 = v5;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  id *WeakRetained;
  id *v4;

  if (*(_QWORD *)(a1 + 32))
  {
    PRLogEditing();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_2_cold_1();

  }
  else
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      v4 = WeakRetained;
      objc_storeStrong(WeakRetained + 154, *(id *)(a1 + 40));
      WeakRetained = v4;
    }

  }
}

void __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_170(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_2_171;
  block[3] = &unk_1E2185878;
  v10 = v6;
  v7 = v6;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v11 = v5;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_2_171(uint64_t a1)
{
  NSObject *v1;
  id *WeakRetained;
  id *v4;

  if (*(_QWORD *)(a1 + 32))
  {
    PRLogEditing();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_2_171_cold_1();

  }
  else
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      v4 = WeakRetained;
      objc_storeStrong(WeakRetained + 153, *(id *)(a1 + 40));
      WeakRetained = v4;
    }

  }
}

void __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_173(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_2_174;
  block[3] = &unk_1E2185878;
  v10 = v6;
  v7 = v6;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v11 = v5;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_2_174(uint64_t a1)
{
  NSObject *v1;
  id *WeakRetained;
  id *v4;

  if (*(_QWORD *)(a1 + 32))
  {
    PRLogEditing();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_2_174_cold_1();

  }
  else
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      v4 = WeakRetained;
      objc_storeStrong(WeakRetained + 155, *(id *)(a1 + 40));
      WeakRetained = v4;
    }

  }
}

- (void)_presentWidgetEducationAlertIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PRComplicationDefaultsDomain *v9;
  char v10;
  PRComplicationDefaultsDomain *v11;
  PRWidgetEducationViewController *v12;
  PRComplicationDefaultsDomain *v13;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[PREditingSceneViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "interfaceOrientation");

    v9 = objc_alloc_init(PRComplicationDefaultsDomain);
    v13 = v9;
    if ((unint64_t)(v8 - 3) > 1)
      v10 = -[PRComplicationDefaultsDomain hasShownPortraitEducation](v9, "hasShownPortraitEducation");
    else
      v10 = -[PRComplicationDefaultsDomain hasShownLandscapeEducation](v9, "hasShownLandscapeEducation");
    v11 = v13;
    if ((v10 & 1) == 0)
    {
      v12 = objc_alloc_init(PRWidgetEducationViewController);
      -[PRWidgetEducationViewController loadViewIfNeeded](v12, "loadViewIfNeeded");
      -[PREditingSceneViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
      if ((unint64_t)(v8 - 3) > 1)
        -[PRComplicationDefaultsDomain setHasShownPortraitEducation:](v13, "setHasShownPortraitEducation:", 1);
      else
        -[PRComplicationDefaultsDomain setHasShownLandscapeEducation:](v13, "setHasShownLandscapeEducation:", 1);

      v11 = v13;
    }

  }
}

- (void)_presentControlsGalleryWithSelectedControl:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  -[PREditingSceneViewController presentedControlsGallery](self, "presentedControlsGallery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setSelectedControl:", v14);
  }
  else
  {
    -[PREditingSceneViewController _controlsGalleryConfiguration](self, "_controlsGalleryConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D14838]), "initWithConfiguration:", v6);
    objc_msgSend(v7, "setDelegate:", self);
    objc_msgSend(v7, "setSelectedControl:", v14);
    objc_msgSend(v7, "presentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_class();
    v10 = v8;
    if (v9)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    v12 = v11;

    objc_msgSend(v12, "setDelegate:", self);
    -[PREditingSceneViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
    -[PREditingSceneViewController setPresentedControlsGallery:](self, "setPresentedControlsGallery:", v7);
    -[PREditingSceneViewController _updateSceneSettingsForPosterCoveredByModalPresentation](self, "_updateSceneSettingsForPosterCoveredByModalPresentation");
    -[PREditingSceneViewController _updatePresentationDismissalGestureView](self, "_updatePresentationDismissalGestureView");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_presentedViewControllerDismissalDidEnd_, *MEMORY[0x1E0DC5218], v7);
    objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_presentedViewControllerPresentationDidBegin_, *MEMORY[0x1E0DC5230], v7);

  }
}

- (id)_controlsGalleryConfiguration
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D14830]);
  objc_msgSend(v3, "setAllowedControlSizes:", &unk_1E21DD170);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10038]), "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", CFSTR("com.apple.GAXApp.GAXAppWidget"), CFSTR("com.apple.GAXApp"), 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10000]), "initWithExtensionIdentity:kind:intent:", v4, CFSTR("com.apple.accessibility.GuidedAccess.button"), 0);
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisallowedControlIdentities:", v6);

  -[PREditingSceneViewController _controlsGallerySuggestedControls](self, "_controlsGallerySuggestedControls");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSuggestedControls:", v7);

  return v3;
}

- (id)_controlsGallerySuggestedControls
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PREditingSceneViewController _suggestedControlIdentities](self, "_suggestedControlIdentities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D14828]), "initWithIdentity:type:size:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), 0, 0);
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_suggestedControlIdentities
{
  if (_suggestedControlIdentities_onceToken != -1)
    dispatch_once(&_suggestedControlIdentities_onceToken, &__block_literal_global_35);
  return (id)_suggestedControlIdentities_controlIdentities;
}

void __59__PREditingSceneViewController__suggestedControlIdentities__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10038]), "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", CFSTR("com.apple.Translate.TranslationWidgets"), CFSTR("com.apple.Translate"), 0);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10000]), "initWithExtensionIdentity:kind:intent:", v27, CFSTR("com.apple.Translate.ToggleSpeechTranslationIntent"), 0);
  objc_msgSend(v0, "addObject:", v26);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10038]), "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", CFSTR("com.apple.Home.HomeWidget.Interactive"), CFSTR("com.apple.Home"), 0);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10000]), "initWithExtensionIdentity:kind:intent:", v25, CFSTR("com.apple.Home.LaunchHomeAppControl"), 0);
  objc_msgSend(v0, "addObject:", v24);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10038]), "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", CFSTR("com.apple.calculator.CalculatorWidget"), CFSTR("com.apple.calculator"), 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10000]), "initWithExtensionIdentity:kind:intent:", v23, CFSTR("com.apple.calculator.CalculatorWidget.control"), 0);
  objc_msgSend(v0, "addObject:", v22);
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0D10038]), "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", CFSTR("com.apple.mobiletimer.WorldClockWidget"), CFSTR("com.apple.mobiletimer"), 0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10000]), "initWithExtensionIdentity:kind:intent:", v1, CFSTR("com.apple.mobiletimer.control.alarm"), 0);
  objc_msgSend(v0, "addObject:", v21);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10038]), "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", CFSTR("com.apple.ControlCenter.ControlCenterControlsExtension"), CFSTR("com.apple.springboard"), 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10000]), "initWithExtensionIdentity:kind:intent:", v2, CFSTR("com.apple.ControlCenter.ControlCenterControlsExtension.appearance"), 0);
  objc_msgSend(v0, "addObject:", v20);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10038]), "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", CFSTR("com.apple.shortcuts.ShortcutsWidget"), CFSTR("com.apple.shortcuts"), 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10000]), "initWithExtensionIdentity:kind:intent:", v14, CFSTR("ShortcutsControl"), 0);
  objc_msgSend(v0, "addObject:", v19);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10038]), "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", CFSTR("com.apple.Magnifier.MagnifierWidgetExtension"), CFSTR("com.apple.Magnifier"), 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10000]), "initWithExtensionIdentity:kind:intent:", v18, CFSTR("com.apple.accessibility.Magnifier.button"), 0);
  objc_msgSend(v0, "addObject:", v17);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10038]), "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", CFSTR("com.apple.musicrecognition.MusicRecognitionControls"), CFSTR("com.apple.musicrecognition"), 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10000]), "initWithExtensionIdentity:kind:intent:", v16, CFSTR("com.apple.musicrecognition.MusicRecognitionControls.toggle"), 0);
  objc_msgSend(v0, "addObject:", v15);
  v3 = v1;
  v13 = (void *)v1;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10000]), "initWithExtensionIdentity:kind:intent:", v1, CFSTR("com.apple.mobiletimer.control.timer"), 0);
  objc_msgSend(v0, "addObject:", v4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10000]), "initWithExtensionIdentity:kind:intent:", v14, CFSTR("OpenAppControl"), 0);
  objc_msgSend(v0, "addObject:", v5);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10000]), "initWithExtensionIdentity:kind:intent:", v3, CFSTR("com.apple.mobiletimer.control.stopwatch"), 0);
  objc_msgSend(v0, "addObject:", v6);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10038]), "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", CFSTR("com.apple.BarcodeScanner.BarcodeScannerWidgetExtension"), CFSTR("com.apple.BarcodeScanner"), 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10000]), "initWithExtensionIdentity:kind:intent:", v7, CFSTR("com.apple.BarcodeScanner.button"), 0);
  objc_msgSend(v0, "addObject:", v8);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10000]), "initWithExtensionIdentity:kind:intent:", v2, CFSTR("com.apple.ControlCenter.ControlCenterControlsExtension.flashlight"), 0);
  objc_msgSend(v0, "addObject:", v9);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10038]), "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", CFSTR("com.apple.camera.LauncherControlExtension"), CFSTR("com.apple.camera"), 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10000]), "initWithExtensionIdentity:kind:intent:", v10, CFSTR("com.apple.camera.deeplink.button"), 0);
  objc_msgSend(v0, "addObject:", v11);
  v12 = (void *)_suggestedControlIdentities_controlIdentities;
  _suggestedControlIdentities_controlIdentities = (uint64_t)v0;

}

- (void)_presentComplicationGallery
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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
  PRComplicationGalleryViewController *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  PRComplicationGalleryViewController *v30;
  NSArray *graphicComplicationSuggestionSets;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  NSArray *obj;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  uint8_t buf[8];
  _BYTE v69[128];
  _BYTE v70[128];
  _QWORD v71[3];

  v71[1] = *MEMORY[0x1E0C80C00];
  -[PREditingSceneViewController presentedComplicationsGallery](self, "presentedComplicationsGallery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    PRLogEditing();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B634000, v4, OS_LOG_TYPE_DEFAULT, "Complication gallery is already displayed, not showing another one", buf, 2u);
    }
  }
  else
  {
    -[PREditingSceneViewController _performWidgetDescriptorDiscovery](self, "_performWidgetDescriptorDiscovery");
    -[PREditingSceneViewController addWidgetSheetConfigurationManager](self, "addWidgetSheetConfigurationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowedWidgetFamilies:", 3072);

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0DAA438]);
      objc_msgSend(v8, "layoutForIconLocation:", *MEMORY[0x1E0DAA9E8]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "iconImageInfo");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;

      v18 = (PRComplicationGalleryViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA498]), "initWithName:iconImageInfo:", CFSTR("iconImages"), v11, v13, v15, v17);
      v19 = objc_alloc(MEMORY[0x1E0DAA4F8]);
      -[PREditingSceneViewController listLayoutProvider](self, "listLayoutProvider");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditingSceneViewController iconViewProvider](self, "iconViewProvider");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v19, "initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:", v20, v21, 3072, 0, v18, 1);

      -[NSObject setPresenter:](v22, "setPresenter:", self);
      -[NSObject setDelegate:](v22, "setDelegate:", self);
      -[NSObject setAddWidgetSheetLocation:](v22, "setAddWidgetSheetLocation:", 1);
      -[NSObject setWantsBottomAttachedPresentation:](v22, "setWantsBottomAttachedPresentation:", 0);
      -[NSObject setWantsCloseButton:](v22, "setWantsCloseButton:", 1);
      -[NSObject setWantsSeparator:](v22, "setWantsSeparator:", 1);
      -[NSObject presentationController](v22, "presentationController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
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
      v34 = v26;

      objc_msgSend(MEMORY[0x1E0DC3C78], "customDetentWithIdentifier:resolver:", CFSTR("ComplicationGalleryDodge"), &__block_literal_global_273);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = v35;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setDetents:", v36);

      objc_msgSend(v34, "setLargestUndimmedDetentIdentifier:", CFSTR("ComplicationGalleryDodge"));
      objc_msgSend(v34, "dimmingView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "layer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setHitTestsAsOpaque:", 0);

      objc_msgSend(v34, "_confinedDimmingView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "layer");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setHitTestsAsOpaque:", 0);

      objc_msgSend(MEMORY[0x1E0DC4340], "appearancePreferringDimmingVisible:", 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "_setStandardAppearance:", v41);

      objc_msgSend(v34, "setDelegate:", self);
      -[NSObject loadViewIfNeeded](v22, "loadViewIfNeeded");
      -[PREditingSceneViewController addWidgetSheetConfigurationManager](self, "addWidgetSheetConfigurationManager");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "updatePresentedWidgetEditingViewController:", v22);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "addObserver:selector:name:object:", self, sel_presentedViewControllerDismissalWillBegin_, *MEMORY[0x1E0DC5220], v22);
      objc_msgSend(v43, "addObserver:selector:name:object:", self, sel_presentedViewControllerDismissalDidEnd_, *MEMORY[0x1E0DC5218], v22);

    }
    else
    {
      PRIconGridSizeClassSetForWidgetFamilyMask(3072);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditingSceneViewController addWidgetSheetConfigurationManager](self, "addWidgetSheetConfigurationManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v27;
      objc_msgSend(v28, "applicationWidgetCollectionsForEditingViewController:withAllowedSizeClasses:allowingNonStackableItems:", self, &v67, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v29 = v67;

      v30 = [PRComplicationGalleryViewController alloc];
      graphicComplicationSuggestionSets = self->_graphicComplicationSuggestionSets;
      -[PREditingSceneViewController listLayoutProvider](self, "listLayoutProvider");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditingSceneViewController iconViewProvider](self, "iconViewProvider");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[PRComplicationGalleryViewController initWithSuggestionSets:applicationWidgetCollections:listLayoutProvider:iconViewProvider:](v30, "initWithSuggestionSets:applicationWidgetCollections:listLayoutProvider:iconViewProvider:", graphicComplicationSuggestionSets, v8, v32, v33);

      -[PRComplicationGalleryViewController setDelegate:](v18, "setDelegate:", self);
      -[PREditingSceneViewController _configureNavigationControllerForGalleryViewController:](self, "_configureNavigationControllerForGalleryViewController:", v18);
      v22 = objc_claimAutoreleasedReturnValue();
    }

    -[PREditingSceneViewController setPresentedComplicationsGallery:](self, "setPresentedComplicationsGallery:", v22);
    v55 = v22;
    -[PREditingSceneViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v22, 1, 0);
    -[PREditingSceneViewController setFocusedElement:](self, "setFocusedElement:", 2);
    -[PREditingSceneViewController _updateSceneSettingsForPosterCoveredByModalPresentation](self, "_updateSceneSettingsForPosterCoveredByModalPresentation");
    -[PREditingSceneViewController _updatePresentationDismissalGestureView](self, "_updatePresentationDismissalGestureView");
    -[PREditingSceneViewController _updateAddComplicationsTapGestureAllowed](self, "_updateAddComplicationsTapGestureAllowed");
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    obj = self->_graphicComplicationSuggestionSets;
    v58 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
    if (v58)
    {
      v57 = *(_QWORD *)v64;
      do
      {
        v44 = 0;
        do
        {
          if (*(_QWORD *)v64 != v57)
            objc_enumerationMutation(obj);
          v45 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v44);
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          objc_msgSend(v45, "complications");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
          if (v47)
          {
            v48 = v47;
            v49 = *(_QWORD *)v60;
            do
            {
              v50 = 0;
              do
              {
                if (*(_QWORD *)v60 != v49)
                  objc_enumerationMutation(v46);
                v51 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v50);
                -[PREditingSceneViewController engagementCountsForViewedSuggestedComplications](self, "engagementCountsForViewedSuggestedComplications");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "objectForKey:", v51);
                v53 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v53)
                {
                  -[PREditingSceneViewController engagementCountsForViewedSuggestedComplications](self, "engagementCountsForViewedSuggestedComplications");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "setObject:forKey:", &unk_1E21DCE00, v51);

                }
                ++v50;
              }
              while (v48 != v50);
              v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
            }
            while (v48);
          }

          ++v44;
        }
        while (v44 != v58);
        v58 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
      }
      while (v58);
    }

    v4 = v55;
  }

}

double __59__PREditingSceneViewController__presentComplicationGallery__block_invoke(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "maximumDetentValue");
  return v2 * 0.6;
}

- (SBHAddWidgetSheetConfigurationManager)addWidgetSheetConfigurationManager
{
  SBHAddWidgetSheetConfigurationManager *addWidgetSheetConfigurationManager;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SBHAddWidgetSheetConfigurationManager *v8;

  addWidgetSheetConfigurationManager = self->_addWidgetSheetConfigurationManager;
  if (!addWidgetSheetConfigurationManager)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA3F0]), "initWithWidgetExtensionProvider:", self->_widgetExtensionProvider);
    -[PREditingSceneViewController iconModel](self, "iconModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIconModel:", v5);

    -[PREditingSceneViewController listLayoutProvider](self, "listLayoutProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setListLayoutProvider:", v6);

    objc_msgSend(v4, "setAddWidgetSheetStyle:", 1);
    objc_msgSend(v4, "setAllowedWidgetFamilies:", 3074);
    objc_msgSend(v4, "setAllowsFakeWidgets:", 0);
    objc_msgSend(v4, "setConfigurationManagerDelegate:", self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DAA480], "pr_widgetDomain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setGridSizeClassDomain:", v7);

    }
    v8 = self->_addWidgetSheetConfigurationManager;
    self->_addWidgetSheetConfigurationManager = (SBHAddWidgetSheetConfigurationManager *)v4;

    addWidgetSheetConfigurationManager = self->_addWidgetSheetConfigurationManager;
  }
  return addWidgetSheetConfigurationManager;
}

- (void)_presentSidebarComplicationGallery
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  PRPadAddSheetViewController *v22;
  void *v23;
  void *v24;
  PRPadAddSheetViewController *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  PRPadAddSheetViewController *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  NSArray *obj;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[16];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  -[PREditingSceneViewController presentedSidebarComplicationsGallery](self, "presentedSidebarComplicationsGallery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    PRLogEditing();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B634000, v4, OS_LOG_TYPE_DEFAULT, "Sidebar complication gallery is already displayed, not showing another one", buf, 2u);
    }
  }
  else
  {
    -[PREditingSceneViewController _performWidgetDescriptorDiscovery](self, "_performWidgetDescriptorDiscovery");
    v5 = objc_alloc_init(MEMORY[0x1E0DAA438]);
    -[NSObject layoutForIconLocation:](v5, "layoutForIconLocation:", *MEMORY[0x1E0DAA9E8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "iconImageInfo");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAA498]), "initWithName:iconImageInfo:", CFSTR("iconImages"), v8, v10, v12, v14);
    -[PREditingSceneViewController addWidgetSheetConfigurationManager](self, "addWidgetSheetConfigurationManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAllowedWidgetFamilies:", 3074);

    -[PREditingSceneViewController complicationContainerViewControllers](self, "complicationContainerViewControllers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "anyObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sidebarWidgetGridViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dragManager");
    v20 = objc_claimAutoreleasedReturnValue();

    -[PREditingSceneViewController iconViewProvider](self, "iconViewProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)v20;
    objc_msgSend(v21, "setDragManager:", v20);

    v22 = [PRPadAddSheetViewController alloc];
    -[PREditingSceneViewController listLayoutProvider](self, "listLayoutProvider");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingSceneViewController iconViewProvider](self, "iconViewProvider");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)v15;
    v25 = -[SBHAddWidgetSheetViewControllerBase initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:](v22, "initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:", v23, v24, 3074, 256, v15, 1);

    -[PRPadAddSheetViewController setModalPresentationStyle:](v25, "setModalPresentationStyle:", 2);
    -[SBHPadAddSheetViewController setPresenter:](v25, "setPresenter:", self);
    -[SBHAddWidgetSheetViewControllerBase setDelegate:](v25, "setDelegate:", self);
    -[SBHPadAddSheetViewController setAddWidgetSheetLocation:](v25, "setAddWidgetSheetLocation:", 1);
    -[SBHPadAddSheetViewController setWantsBottomAttachedPresentation:](v25, "setWantsBottomAttachedPresentation:", 0);
    -[SBHPadAddSheetViewController setWantsCloseButton:](v25, "setWantsCloseButton:", 1);
    -[SBHPadAddSheetViewController setWantsSeparator:](v25, "setWantsSeparator:", 1);
    -[PRPadAddSheetViewController presentationController](v25, "presentationController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_opt_class();
    v28 = v26;
    if (v27)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v29 = v28;
      else
        v29 = 0;
    }
    else
    {
      v29 = 0;
    }
    v53 = v5;
    v30 = v29;

    objc_msgSend(v30, "dimmingView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setHitTestsAsOpaque:", 0);

    objc_msgSend(v30, "_confinedDimmingView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setHitTestsAsOpaque:", 0);

    objc_msgSend(MEMORY[0x1E0DC4340], "appearancePreferringDimmingVisible:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_setStandardAppearance:", v35);

    objc_msgSend(v30, "setSourceView:", self->_sidebarComplicationGallerySourceView);
    v49 = v30;
    objc_msgSend(v30, "setDelegate:", self);
    -[PREditingSceneViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v25, 1, 0);
    -[PREditingSceneViewController setPresentedSidebarComplicationsGallery:](self, "setPresentedSidebarComplicationsGallery:", v25);
    -[PREditingSceneViewController setFocusedElement:](self, "setFocusedElement:", 3);
    -[PREditingSceneViewController _updateSceneSettingsForPosterCoveredByModalPresentation](self, "_updateSceneSettingsForPosterCoveredByModalPresentation");
    -[PREditingSceneViewController _updatePresentationDismissalGestureView](self, "_updatePresentationDismissalGestureView");
    -[PREditingSceneViewController _updateAddComplicationsTapGestureAllowed](self, "_updateAddComplicationsTapGestureAllowed");
    -[PREditingSceneViewController addWidgetSheetConfigurationManager](self, "addWidgetSheetConfigurationManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v25;
    objc_msgSend(v36, "updatePresentedWidgetEditingViewController:", v25);

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    obj = self->_graphicComplicationSuggestionSets;
    v56 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
    if (v56)
    {
      v55 = *(_QWORD *)v62;
      do
      {
        v37 = 0;
        do
        {
          if (*(_QWORD *)v62 != v55)
            objc_enumerationMutation(obj);
          v38 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v37);
          v57 = 0u;
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          objc_msgSend(v38, "complications");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
          if (v40)
          {
            v41 = v40;
            v42 = *(_QWORD *)v58;
            do
            {
              v43 = 0;
              do
              {
                if (*(_QWORD *)v58 != v42)
                  objc_enumerationMutation(v39);
                v44 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v43);
                -[PREditingSceneViewController engagementCountsForViewedSuggestedComplications](self, "engagementCountsForViewedSuggestedComplications");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "objectForKey:", v44);
                v46 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v46)
                {
                  -[PREditingSceneViewController engagementCountsForViewedSuggestedComplications](self, "engagementCountsForViewedSuggestedComplications");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "setObject:forKey:", &unk_1E21DCE00, v44);

                }
                ++v43;
              }
              while (v41 != v43);
              v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
            }
            while (v41);
          }

          ++v37;
        }
        while (v37 != v56);
        v56 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
      }
      while (v56);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addObserver:selector:name:object:", self, sel_presentedViewControllerDismissalWillBegin_, *MEMORY[0x1E0DC5220], v50);
    objc_msgSend(v48, "addObserver:selector:name:object:", self, sel_presentedViewControllerDismissalDidEnd_, *MEMORY[0x1E0DC5218], v50);

    v4 = v53;
  }

}

- (void)_presentInlineComplicationGallery
{
  PRInlineComplicationGalleryViewController *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  PRInlineComplicationGalleryViewController *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PREditingSceneViewController _performWidgetDescriptorDiscovery](self, "_performWidgetDescriptorDiscovery");
  v3 = -[PRInlineComplicationGalleryViewController initWithSuggestionSet:selectedComplication:alternateDateEnabled:]([PRInlineComplicationGalleryViewController alloc], "initWithSuggestionSet:selectedComplication:alternateDateEnabled:", self->_inlineComplicationSuggestionSet, self->_selectedInlineComplication, self->_alternateDateEnabled);
  -[PRInlineComplicationGalleryViewController setDelegate:](v3, "setDelegate:", self);
  v14 = v3;
  -[PREditingSceneViewController _configureNavigationControllerForGalleryViewController:](self, "_configureNavigationControllerForGalleryViewController:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingSceneViewController setPresentedInlineComplicationsGallery:](self, "setPresentedInlineComplicationsGallery:", v4);
  -[PREditingSceneViewController _updateSceneSettingsForPosterCoveredByModalPresentation](self, "_updateSceneSettingsForPosterCoveredByModalPresentation");
  -[PREditingSceneViewController _updatePresentationDismissalGestureView](self, "_updatePresentationDismissalGestureView");
  -[PREditingSceneViewController _updateAddComplicationsTapGestureAllowed](self, "_updateAddComplicationsTapGestureAllowed");
  -[PREditingSceneViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);
  -[PREditingSceneViewController setFocusedElement:](self, "setFocusedElement:", 1);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ATXComplicationSet complications](self->_inlineComplicationSuggestionSet, "complications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        -[PREditingSceneViewController engagementCountsForViewedSuggestedComplications](self, "engagementCountsForViewedSuggestedComplications");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          -[PREditingSceneViewController engagementCountsForViewedSuggestedComplications](self, "engagementCountsForViewedSuggestedComplications");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKey:", &unk_1E21DCE00, v10);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (void)_performWidgetDescriptorDiscovery
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0D10078]);
  objc_msgSend(v2, "userEnteredAddGalleryForHost:", CFSTR("Complications"));

}

- (void)_updateComplicationContainerVisibility
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[PREditingSceneViewController complicationContainerViewControllers](self, "complicationContainerViewControllers", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
          -[PREditingSceneViewController view](self, "view");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "window");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "windowScene");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "interfaceOrientation");

          objc_msgSend(v10, "widgetGridViewController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "view");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "setHidden:", (unint64_t)(v14 - 3) < 2);
          objc_msgSend(v10, "sidebarWidgetGridViewController");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "view");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "setHidden:", (unint64_t)(v14 - 1) < 2);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v7);
    }

  }
}

- (BOOL)_shouldAllowGalleryPresentationForLocation:(int64_t)a3
{
  return !-[PREditingSceneViewController _areComplicationsDisallowed](self, "_areComplicationsDisallowed", a3)
      && !-[PREditingSceneViewController isClientPresentingModalViewController](self, "isClientPresentingModalViewController")&& !-[PREditingSceneViewController areControlsHidden](self, "areControlsHidden")&& !-[PREditingSceneViewController _isPosterCoveredByModalPresentation](self, "_isPosterCoveredByModalPresentation")&& -[PREditingSceneViewController variant](self, "variant") != 1;
}

- (BOOL)_shouldAllowAddComplicationsTapGestureForLocation:(int64_t)a3
{
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  BOOL v11;
  unint64_t v12;
  BOOL v13;
  BOOL v14;

  v5 = -[PREditingSceneViewController _shouldAllowGalleryPresentationForLocation:](self, "_shouldAllowGalleryPresentationForLocation:");
  -[PREditingSceneViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "interfaceOrientation");

  if (a3 == 1)
  {
    v10 = -[PREditingSceneViewController _hasSidebarComplications](self, "_hasSidebarComplications");
    v11 = !v5;
    v12 = v9 - 3;
  }
  else
  {
    if (a3)
      return v5;
    v10 = -[PREditingSceneViewController _hasGraphicComplications](self, "_hasGraphicComplications");
    v11 = !v5;
    v12 = v9 - 1;
  }
  v13 = v12 < 2;
  v14 = !v11 && v13;
  return !v10 && v14;
}

- (BOOL)_shouldAllowInlineComplicationTapGesture
{
  void *v4;

  if (-[PREditingSceneViewController _areComplicationsDisallowed](self, "_areComplicationsDisallowed")
    || -[PREditingSceneViewController isClientPresentingModalViewController](self, "isClientPresentingModalViewController")|| -[PREditingSceneViewController areControlsHidden](self, "areControlsHidden"))
  {
    return 0;
  }
  -[PREditingSceneViewController presentedInlineComplicationsGallery](self, "presentedInlineComplicationsGallery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 1;
  if (-[PREditingSceneViewController _isPosterCoveredByModalPresentation](self, "_isPosterCoveredByModalPresentation"))
    return 0;
  return -[PREditingSceneViewController variant](self, "variant") != 1;
}

- (void)_updateAddComplicationsTapGestureAllowed
{
  void *v3;
  void *v4;
  id v5;

  -[PREditingSceneViewController complicationsAddGestureView](self, "complicationsAddGestureView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", -[PREditingSceneViewController _shouldAllowAddComplicationsTapGestureForLocation:](self, "_shouldAllowAddComplicationsTapGestureForLocation:", 0) ^ 1);

  -[PREditingSceneViewController sidebarComplicationAddGestureView](self, "sidebarComplicationAddGestureView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", -[PREditingSceneViewController _shouldAllowAddComplicationsTapGestureForLocation:](self, "_shouldAllowAddComplicationsTapGestureForLocation:", 1) ^ 1);

  LODWORD(v4) = -[PREditingSceneViewController _shouldAllowInlineComplicationTapGesture](self, "_shouldAllowInlineComplicationTapGesture");
  -[PREditingSceneViewController inlineComplicationGestureView](self, "inlineComplicationGestureView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4 ^ 1);

}

- (void)_updateLocalControlsHiddenWithAnimationSettings:(id)a3
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  double v11;

  v8 = a3;
  if (-[PREditingSceneViewController areControlsHidden](self, "areControlsHidden"))
    v4 = 0.0;
  else
    v4 = 1.0;
  -[PREditingSceneViewController quickActionEditingViewController](self, "quickActionEditingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v7 = (void *)MEMORY[0x1E0D01908];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __80__PREditingSceneViewController__updateLocalControlsHiddenWithAnimationSettings___block_invoke;
    v9[3] = &unk_1E21847C0;
    v10 = v6;
    v11 = v4;
    objc_msgSend(v7, "animateWithSettings:actions:", v8, v9);

  }
  else
  {
    objc_msgSend(v6, "setAlpha:", v4);
  }

}

uint64_t __80__PREditingSceneViewController__updateLocalControlsHiddenWithAnimationSettings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

- (void)inlineComplicationGestureViewTapped:(id)a3
{
  void *v4;
  id v5;

  -[PREditingSceneViewController selectedInlineComplication](self, "selectedInlineComplication", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5
    && (-[PREditingSceneViewController presentedInlineComplicationsGallery](self, "presentedInlineComplicationsGallery"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    -[PREditingSceneViewController _presentIntentConfigurationForComplicationDescriptorIfPossible:](self, "_presentIntentConfigurationForComplicationDescriptorIfPossible:", v5);
  }
  else
  {
    -[PREditingSceneViewController _presentInlineComplicationGallery](self, "_presentInlineComplicationGallery");
  }

}

- (void)setDraggingComplication:(BOOL)a3
{
  if (self->_draggingComplication != a3)
  {
    self->_draggingComplication = a3;
    -[PREditingSceneViewController _updateSceneSettingsForDepthEffectDisallowed](self, "_updateSceneSettingsForDepthEffectDisallowed");
    -[PREditingSceneViewController _updateAddComplicationsTapGestureAllowed](self, "_updateAddComplicationsTapGestureAllowed");
  }
}

- (void)setClientPresentingModalViewController:(BOOL)a3
{
  if (self->_clientPresentingModalViewController != a3)
  {
    self->_clientPresentingModalViewController = a3;
    -[PREditingSceneViewController _updateAddComplicationsTapGestureAllowed](self, "_updateAddComplicationsTapGestureAllowed");
  }
}

- (void)dismissAnyPresentedComplicationGalleryAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  BOOL v6;
  void *v7;
  char v8;
  void *v9;
  PRComplicationDescriptor *widgetBeingAdded;
  void *v11;

  v3 = a3;
  -[PREditingSceneViewController presentedComplicationsGallery](self, "presentedComplicationsGallery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || (-[PREditingSceneViewController presentedSidebarComplicationsGallery](self, "presentedSidebarComplicationsGallery"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = 0;
  }
  else
  {
    -[PREditingSceneViewController presentedInlineComplicationsGallery](self, "presentedInlineComplicationsGallery");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v6 = 0;
      goto LABEL_5;
    }
    -[PREditingSceneViewController presentedControlsGallery](self, "presentedControlsGallery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == 0;
  }

LABEL_5:
  -[PREditingSceneViewController presentedViewController](self, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isBeingDismissed");

  if (!v6 && (v8 & 1) == 0)
    -[PREditingSceneViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v3, 0);
  -[PREditingSceneViewController setPresentedComplicationsGallery:](self, "setPresentedComplicationsGallery:", 0);
  -[PREditingSceneViewController setPresentedSidebarComplicationsGallery:](self, "setPresentedSidebarComplicationsGallery:", 0);
  -[PREditingSceneViewController setPresentedInlineComplicationsGallery:](self, "setPresentedInlineComplicationsGallery:", 0);
  -[PREditingSceneViewController setPresentedControlsGallery:](self, "setPresentedControlsGallery:", 0);
  -[PREditingSceneViewController setSelectedQuickActionPosition:](self, "setSelectedQuickActionPosition:", 0);
  -[PREditingSceneViewController quickActionEditingViewController](self, "quickActionEditingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGalleryPresented:", 0);

  -[PREditingSceneViewController _updateSceneSettingsForPosterCoveredByModalPresentation](self, "_updateSceneSettingsForPosterCoveredByModalPresentation");
  -[PREditingSceneViewController _updatePresentationDismissalGestureView](self, "_updatePresentationDismissalGestureView");
  -[PREditingSceneViewController _updateAddComplicationsTapGestureAllowed](self, "_updateAddComplicationsTapGestureAllowed");
  widgetBeingAdded = self->_widgetBeingAdded;
  self->_widgetBeingAdded = 0;

}

- (void)presentedViewControllerPresentationDidBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PREditingSceneViewController presentedControlsGallery](self, "presentedControlsGallery");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v7 == v4)
  {
    -[PREditingSceneViewController quickActionEditingViewController](self, "quickActionEditingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGalleryPresented:", 1);

    v5 = v7;
  }

}

- (void)presentedViewControllerDismissalWillBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PREditingSceneViewController presentedViewController](self, "presentedViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
    -[PREditingSceneViewController setFocusedElement:](self, "setFocusedElement:", 0);
  -[PREditingSceneViewController iconViewProvider](self, "iconViewProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dragManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancelAllDrags");

}

- (void)presentedViewControllerDismissalDidEnd:(id)a3
{
  UINavigationController *v4;
  UINavigationController *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  PREditingSceneViewController *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "object");
  v4 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
  -[PREditingSceneViewController presentedViewController](self, "presentedViewController");
  v5 = (UINavigationController *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    objc_msgSend(v12, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DC5210]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if (!v8)
    {
      if (v4 == (UINavigationController *)self->_presentedComplicationsGallery)
      {
        v10 = self;
        v11 = 2;
      }
      else if (v4 == (UINavigationController *)self->_presentedSidebarComplicationsGallery)
      {
        v10 = self;
        v11 = 3;
      }
      else
      {
        if (v4 != self->_presentedInlineComplicationsGallery)
          goto LABEL_11;
        v10 = self;
        v11 = 1;
      }
      -[PREditingSceneViewController setFocusedElement:](v10, "setFocusedElement:", v11);
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5220], v4);
    objc_msgSend(v9, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5218], v4);

  }
LABEL_11:

}

- (void)setFocusedElement:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  FBScene *scene;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;
  BOOL v17;

  self->_focusedElement = a3;
  -[PREditingSceneViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:", 0.3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PREditingSceneViewController _shouldDepthEffectBeDisallowed](self, "_shouldDepthEffectBeDisallowed");
  scene = self->super._scene;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__PREditingSceneViewController_setFocusedElement___block_invoke;
  v13[3] = &unk_1E2185808;
  v17 = v9;
  v13[4] = self;
  v14 = v8;
  v15 = v7;
  v16 = a3;
  v11 = v7;
  v12 = v8;
  -[FBScene updateSettingsWithTransitionBlock:](scene, "updateSettingsWithTransitionBlock:", v13);

}

id __50__PREditingSceneViewController_setFocusedElement___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "pr_setControlsHidden:", *(_QWORD *)(a1 + 56) != 0);
  objc_msgSend(v3, "pr_setFocusedComplicationElement:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v3, "pr_setDepthEffectDisallowed:", *(unsigned __int8 *)(a1 + 64));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "isActive") && *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0DC3490], "transitionContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "_synchronizeDrawing");
    objc_msgSend(*(id *)(a1 + 48), "_synchronizedDrawingFence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAnimationFence:", v5);

    objc_msgSend(v4, "setAnimationSettings:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v4 = 0;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 1200);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "setFocusedElement:animationSettings:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), (_QWORD)v12);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  return v4;
}

- (id)_configureNavigationControllerForGalleryViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v4);
  v6 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    objc_msgSend(v6, "configureWithOpaqueBackground");
  }
  else
  {
    objc_msgSend(v6, "configureWithDefaultBackground");
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithBlurRadius:", 16.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundEffects:", v8);

  }
  objc_msgSend(v5, "navigationBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setStandardAppearance:", v6);

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  if ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1 && (isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "setModalPresentationStyle:", 7);
    objc_msgSend(v5, "popoverPresentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingSceneViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSourceView:", v14);

    +[PREditorElementLayoutController frameForElements:variant:](PREditorElementLayoutController, "frameForElements:variant:", 4, 3);
    objc_msgSend(v13, "setSourceRect:");
    objc_msgSend(v13, "setPermittedArrowDirections:", 1);
    -[PREditingSceneViewController inlineComplicationGestureView](self, "inlineComplicationGestureView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPassthroughViews:", v16);

    objc_msgSend(v13, "setDelegate:", self);
  }
  else
  {
    objc_msgSend(v5, "presentationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_class();
    v19 = v17;
    if (v18)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
    }
    else
    {
      v20 = 0;
    }
    v21 = v20;

    objc_msgSend(MEMORY[0x1E0DC3C78], "customDetentWithIdentifier:resolver:", CFSTR("ComplicationGalleryDodge"), &__block_literal_global_291);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDetents:", v22);

    objc_msgSend(v21, "setLargestUndimmedDetentIdentifier:", CFSTR("ComplicationGalleryDodge"));
    objc_msgSend(v21, "setPreferredCornerRadius:", PRSheetCornerRadius());
    objc_msgSend(v21, "dimmingView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHitTestsAsOpaque:", 0);

    objc_msgSend(v21, "_confinedDimmingView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setHitTestsAsOpaque:", 0);

    objc_msgSend(v21, "setDelegate:", self);
    objc_msgSend(v21, "_setShouldScaleDownBehindDescendantSheets:", 1);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_presentedViewControllerDismissalWillBegin_, *MEMORY[0x1E0DC5220], v5);
  objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_presentedViewControllerDismissalDidEnd_, *MEMORY[0x1E0DC5218], v5);

  return v5;
}

double __87__PREditingSceneViewController__configureNavigationControllerForGalleryViewController___block_invoke(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "maximumDetentValue");
  return v2 * 0.6;
}

- (void)_dismissWithAction:(int64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  FBScene *scene;
  void *v43;
  FBScene *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  PREditingSceneViewController *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67[2];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t v76[16];
  _BYTE v77[128];
  uint8_t v78[128];
  uint8_t buf[4];
  int64_t v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  if (!-[PREditingSceneViewController isDismissing](self, "isDismissing"))
  {
    PRLogEditing();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v80 = a3;
      _os_log_impl(&dword_18B634000, v5, OS_LOG_TYPE_DEFAULT, "Dismiss with action %li", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    -[PREditingSceneViewController setDismissing:](self, "setDismissing:", 1);
    -[PREditingSceneViewController _unregisterComplicationContainerViewControllerDelegates](self, "_unregisterComplicationContainerViewControllerDelegates");
    -[PREditingSceneViewController delegate](self, "delegate");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 == 1 && !v55)
    {
      PRLogEditing();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v76 = 0;
        _os_log_impl(&dword_18B634000, v6, OS_LOG_TYPE_DEFAULT, "Discarding updated configuration because no delegate is set", v76, 2u);
      }

      a3 = 0;
    }
    -[PREditingSceneViewController presentedViewController](self, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 == 0;

    if (!v8)
      -[PREditingSceneViewController dismissAnyPresentedComplicationGalleryAnimated:](self, "dismissAnyPresentedComplicationGalleryAnimated:", 1);
    if (a3 == 1)
    {
      -[PRComplicationDescriptor PRSWidget](self->_selectedInlineComplication, "PRSWidget");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSHashTable anyObject](self->_complicationContainerViewControllers, "anyObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "widgetGridViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "model");
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v54, "complicationDescriptors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bs_map:", &__block_literal_global_293);
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "saveIconStateIfNeeded");
      objc_msgSend(v54, "iconLayout");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (void *)v12;
      -[NSHashTable anyObject](self->_complicationContainerViewControllers, "anyObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sidebarWidgetGridViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "model");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v53, "complicationDescriptors");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bs_map:", &__block_literal_global_294);
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "saveIconStateIfNeeded");
      objc_msgSend(v53, "iconLayout");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)v16;
      v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[PRComplicationDescriptor suggestedComplication](self->_selectedInlineComplication, "suggestedComplication");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[PRComplicationDescriptor suggestedComplication](self->_selectedInlineComplication, "suggestedComplication");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRComplicationDescriptor uniqueIdentifier](self->_selectedInlineComplication, "uniqueIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v19, v20);

      }
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v21 = v11;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v73;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v73 != v23)
              objc_enumerationMutation(v21);
            v25 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
            objc_msgSend(v25, "suggestedComplication");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26)
            {
              objc_msgSend(v25, "suggestedComplication");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "uniqueIdentifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setObject:forKey:", v27, v28);

            }
          }
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
        }
        while (v22);
      }

      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v29 = v15;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
      if (v30)
      {
        v31 = *(_QWORD *)v69;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v69 != v31)
              objc_enumerationMutation(v29);
            v33 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
            objc_msgSend(v33, "suggestedComplication");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (v34)
            {
              objc_msgSend(v33, "suggestedComplication");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "uniqueIdentifier");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setObject:forKey:", v35, v36);

            }
          }
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
        }
        while (v30);
      }

      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __51__PREditingSceneViewController__dismissWithAction___block_invoke_3;
      v58[3] = &unk_1E2185A68;
      v59 = v55;
      v60 = self;
      objc_copyWeak(v67, (id *)buf);
      v37 = v51;
      v61 = v37;
      v38 = v46;
      v62 = v38;
      v52 = v47;
      v63 = v52;
      v39 = v48;
      v64 = v39;
      v50 = v49;
      v65 = v50;
      v40 = v17;
      v66 = v40;
      v67[1] = (id)1;
      +[PREditingDidDismissAction acceptChangesWithCompletion:](PREditingDidDismissAction, "acceptChangesWithCompletion:", v58);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      scene = self->super._scene;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBScene sendActions:](scene, "sendActions:", v43);

      objc_destroyWeak(v67);
    }
    else
    {
      +[PREditingDidDismissAction cancelAction](PREditingDidDismissAction, "cancelAction");
      v37 = (id)objc_claimAutoreleasedReturnValue();
      v44 = self->super._scene;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v37);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBScene sendActions:](v44, "sendActions:", v45);

      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __51__PREditingSceneViewController__dismissWithAction___block_invoke_312;
      v56[3] = &unk_1E2185A90;
      objc_copyWeak(&v57, (id *)buf);
      objc_msgSend(v55, "editingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:", self, a3, 0, 0, v56);
      objc_destroyWeak(&v57);
    }

    objc_destroyWeak((id *)buf);
  }
}

uint64_t __51__PREditingSceneViewController__dismissWithAction___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "PRSWidget");
}

uint64_t __51__PREditingSceneViewController__dismissWithAction___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "PRSWidget");
}

void __51__PREditingSceneViewController__dismissWithAction___block_invoke_3(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20[2];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v7;
  v11 = v8;
  v12 = a1[4];
  objc_copyWeak(v20, a1 + 12);
  v13 = a1[6];
  v14 = a1[7];
  v15 = a1[8];
  v16 = a1[9];
  v17 = a1[10];
  v18 = a1[11];
  v20[1] = a1[13];
  v19 = v9;
  BSDispatchMain();

  objc_destroyWeak(v20);
}

void __51__PREditingSceneViewController__dismissWithAction___block_invoke_4(uint64_t a1)
{
  void *WeakRetained;
  void *v3;
  PRPosterComplicationLayout *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  PRPosterSuggestionMetadata *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PRPosterTitleStyleConfiguration *v32;
  void *v33;
  PRPosterTitleStyleConfiguration *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
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
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  PRPosterComplicationLayout *v73;
  uint8_t buf[16];
  _QWORD v75[4];
  id v76;
  id v77;
  id v78;
  id v79;

  if (*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 56), "configuredProperties");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    v4 = -[PRPosterComplicationLayout initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:]([PRPosterComplicationLayout alloc], "initWithInlineComplication:sidebarComplicationIconLayout:sidebarComplications:complicationIconLayout:complications:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96));
    objc_msgSend(v3, "setComplicationLayout:", v4);
    objc_msgSend(WeakRetained, "focusConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFocusConfiguration:", v5);

    objc_msgSend(WeakRetained, "renderingConfiguration");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRenderingConfiguration:");
    objc_msgSend(*(id *)(a1 + 32), "role");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", CFSTR("PRPosterRoleLockScreen"));

    v73 = v4;
    if (v7)
    {
      objc_msgSend(WeakRetained, "homeScreenConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "homeScreenConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v8, "configurationApplyingColorPickerConfigurationsFromConfiguration:", v9);
        v10 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v10;
      }
      if (!v9)
      {
        objc_msgSend(*(id *)(a1 + 56), "path");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "provider");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "role");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[PRPosterHomeScreenConfiguration defaultHomeScreenConfigurationForProvider:role:](PRPosterHomeScreenConfiguration, "defaultHomeScreenConfigurationForProvider:role:", v13, v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(*(id *)(a1 + 56), "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[PRPosterPathUtilities loadHomeScreenConfigurationForPath:error:](PRPosterPathUtilities, "loadHomeScreenConfigurationForPath:error:", v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "customizationConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = (void *)objc_msgSend(v9, "mutableCopy");
        objc_msgSend(v18, "setCustomizationConfiguration:", v17);
        v19 = objc_msgSend(v18, "copy");

        v9 = (void *)v19;
      }
      objc_msgSend(v3, "setHomeScreenConfiguration:", v9);

      v4 = v73;
    }
    objc_msgSend(WeakRetained, "quickActionsConfiguration");
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setQuickActionsConfiguration:", v20);
    objc_msgSend(WeakRetained, "suggestionMetadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = [PRPosterSuggestionMetadata alloc];
    objc_msgSend(v21, "suggestedGalleryItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(a1 + 104);
    v70 = v21;
    objc_msgSend(v21, "lastModifiedDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[PRPosterSuggestionMetadata initWithSuggestedGalleryItem:suggestedComplicationsByIdentifier:lastModifiedDate:](v22, "initWithSuggestedGalleryItem:suggestedComplicationsByIdentifier:lastModifiedDate:", v23, v24, v25);

    objc_msgSend(v3, "setSuggestionMetadata:", v26);
    objc_msgSend(*(id *)(a1 + 32), "displayNameLocalizationKey");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "otherMetadata");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    v71 = (void *)v20;
    v69 = (void *)v26;
    if (v27)
    {
      v30 = (void *)objc_msgSend(v28, "mutableCopy");

      objc_msgSend(*(id *)(a1 + 32), "displayNameLocalizationKey");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setDisplayNameLocalizationKey:", v31);

      v29 = v30;
    }
    objc_msgSend(v3, "setOtherMetadata:", v29);

    objc_msgSend(WeakRetained, "titleStyleConfiguration");
    v32 = (PRPosterTitleStyleConfiguration *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      +[PRPosterTimeFontConfiguration defaultConfiguration](PRPosterTimeFontConfiguration, "defaultConfiguration");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = [PRPosterTitleStyleConfiguration alloc];
      +[PRPosterTitleStyleConfiguration defaultTitleColor](PRPosterTitleStyleConfiguration, "defaultTitleColor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[PRPosterTitleStyleConfiguration defaultTimeNumberingSystem](PRPosterTitleStyleConfiguration, "defaultTimeNumberingSystem");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[PRPosterTitleStyleConfiguration initWithTimeFontConfiguration:titleColor:timeNumberingSystem:](v34, "initWithTimeFontConfiguration:titleColor:timeNumberingSystem:", v33, v35, v36);

    }
    v37 = *(void **)(*(_QWORD *)(a1 + 56) + 1152);
    -[PRPosterTitleStyleConfiguration effectiveTitleColor](v32, "effectiveTitleColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "titleStyleConfiguration");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "effectiveTitleColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setColorModified:", objc_msgSend(v38, "isEqual:", v40) ^ 1);

    v41 = *(void **)(*(_QWORD *)(a1 + 56) + 1152);
    -[PRPosterTitleStyleConfiguration timeFontConfiguration](v32, "timeFontConfiguration");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "titleStyleConfiguration");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "timeFontConfiguration");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setFontModified:", objc_msgSend(v42, "isEqual:", v44) ^ 1);

    v45 = *(void **)(*(_QWORD *)(a1 + 56) + 1152);
    -[PRPosterTitleStyleConfiguration effectiveTimeNumberingSystem](v32, "effectiveTimeNumberingSystem");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "titleStyleConfiguration");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "effectiveTimeNumberingSystem");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setNumberingSystemModified:", objc_msgSend(v46, "isEqualToString:", v48) ^ 1);

    v49 = *(void **)(*(_QWORD *)(a1 + 56) + 1152);
    objc_msgSend(WeakRetained, "complicationLayout");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setWidgetsModified:", objc_msgSend(v50, "isEqualToComplicationLayout:", v4) ^ 1);

    objc_msgSend(*(id *)(a1 + 32), "role");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v50) = objc_msgSend(v51, "isEqual:", CFSTR("PRPosterRoleAmbient"));

    v52 = v3;
    if ((_DWORD)v50)
    {
      objc_msgSend(WeakRetained, "ambientConfiguration");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setAmbientConfiguration:", v53);

      objc_msgSend(WeakRetained, "ambientWidgetLayout");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setAmbientWidgetLayout:", v54);

    }
    objc_msgSend(*(id *)(a1 + 56), "path");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "loadUserInfoWithError:", 0);
    v56 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "loadUserInfoWithError:", 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = (void *)v56;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 1152), "setPosterContentModified:", objc_msgSend(*(id *)(a1 + 56), "_posterUserInfo:containsUserChangesFromPrevious:", v57, v56));
    objc_msgSend(*(id *)(a1 + 56), "setConfiguredProperties:", v3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v58 = *(void **)(a1 + 48);
      v59 = *(_QWORD *)(a1 + 56);
      v60 = *(_QWORD *)(a1 + 128);
      v61 = *(void **)(a1 + 32);
      v75[0] = MEMORY[0x1E0C809B0];
      v75[1] = 3221225472;
      v75[2] = __51__PREditingSceneViewController__dismissWithAction___block_invoke_2_307;
      v75[3] = &unk_1E21859F8;
      v76 = v61;
      v77 = v3;
      v78 = *(id *)(a1 + 112);
      objc_copyWeak(&v79, (id *)(a1 + 120));
      objc_msgSend(v58, "editingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:", v59, v60, v76, v77, v75);
      objc_destroyWeak(&v79);

      v4 = v73;
      v52 = v3;
      v63 = v70;
      v62 = v71;
    }
    else
    {
      PRLogEditing();
      v65 = objc_claimAutoreleasedReturnValue();
      v63 = v70;
      v62 = v71;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18B634000, v65, OS_LOG_TYPE_DEFAULT, "dismissing editing scene view controller without saving because the delegate doesn't want to", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 112), "invalidate");
      objc_msgSend(*(id *)(a1 + 56), "_finalize");
    }
    objc_msgSend(MEMORY[0x1E0CF8E20], "sharedInstance");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "engagementCountsForViewedSuggestedComplications");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "logComplicationsSeenInGalleryWithEngagements:completion:", v67, &__block_literal_global_309);

  }
  else
  {
    PRLogEditing();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      __51__PREditingSceneViewController__dismissWithAction___block_invoke_4_cold_1(v64);

    objc_msgSend(*(id *)(a1 + 48), "editingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:", *(_QWORD *)(a1 + 56), 0, 0, 0, &__block_literal_global_298);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    objc_msgSend(WeakRetained, "_finalize");
  }

}

void __51__PREditingSceneViewController__dismissWithAction___block_invoke_2_307(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  BSDispatchQueueAssertMain();
  if (v3)
  {
    PRLogEditing();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__PREditingSceneViewController__dismissWithAction___block_invoke_2_307_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 48), "invalidate");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_finalize");

}

void __51__PREditingSceneViewController__dismissWithAction___block_invoke_308(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2)
  {
    PRLogEditing();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __51__PREditingSceneViewController__dismissWithAction___block_invoke_308_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

void __51__PREditingSceneViewController__dismissWithAction___block_invoke_312(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_finalize");

}

- (BOOL)_posterUserInfo:(id)a3 containsUserChangesFromPrevious:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v5, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "intersectSet:", v12);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v5, "valueForKey:", v17, (_QWORD)v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "valueForKey:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = BSEqualObjects();

        if (!v20)
        {
          LOBYTE(v14) = 1;
          goto LABEL_11;
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_11:

  return v14;
}

- (BOOL)_isPosterCoveredByModalPresentation
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v8;

  -[PREditingSceneViewController presentedComplicationsGallery](self, "presentedComplicationsGallery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 1;
  -[PREditingSceneViewController presentedSidebarComplicationsGallery](self, "presentedSidebarComplicationsGallery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 1;
  -[PREditingSceneViewController presentedInlineComplicationsGallery](self, "presentedInlineComplicationsGallery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    return 1;
  -[PREditingSceneViewController presentedControlsGallery](self, "presentedControlsGallery");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8 != 0;

  return v6;
}

- (BOOL)_areComplicationsDisallowed
{
  void *v2;
  char v3;

  -[PREditingSceneViewController posterRole](self, "posterRole");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", CFSTR("PRPosterRoleIncomingCall"));

  return v3;
}

- (void)_configureUsingPath:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PREditingSceneViewController;
  v4 = a3;
  -[PRSceneViewController _configureUsingPath:](&v6, sel__configureUsingPath_, v4);
  +[PRPosterPathUtilities loadProactiveGalleryOptions:error:](PRPosterPathUtilities, "loadProactiveGalleryOptions:error:", v4, 0, v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PREditingSceneViewController setHero:](self, "setHero:", objc_msgSend(v5, "isHero"));
}

- (void)_configureInitialSceneSettings:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PREditingSceneViewController;
  v4 = a3;
  -[PRSceneViewController _configureInitialSceneSettings:](&v9, sel__configureInitialSceneSettings_, v4);
  -[PRSceneViewController contentsIdentity](self, "contentsIdentity", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");
  if (-[PREditingSceneViewController isHero](self, "isHero"))
    v7 = 2;
  else
    v7 = (unint64_t)(v6 - 1) < 2;
  objc_msgSend(v4, "pr_setEditingContext:", v7);
  objc_msgSend(v4, "pr_setEditingVariant:", -[PREditingSceneViewController variant](self, "variant"));
  objc_msgSend(v4, "pr_setEditingAcceptButtonType:", -[PREditingSceneViewController acceptButtonType](self, "acceptButtonType"));
  objc_msgSend(v4, "pr_setControlsHidden:", -[PREditingSceneViewController areControlsHidden](self, "areControlsHidden"));
  objc_msgSend(v4, "pr_setUsesEditingLayout:", -[PREditingSceneViewController usesEditingLayout](self, "usesEditingLayout"));
  objc_msgSend(v4, "pr_setComplicationsDisallowed:", -[PREditingSceneViewController _areComplicationsDisallowed](self, "_areComplicationsDisallowed"));
  -[PREditingSceneViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pui_setUserInterfaceStyle:", objc_msgSend(v8, "userInterfaceStyle"));

}

- (void)_updateSceneSettingsForPosterCoveredByModalPresentation
{
  BOOL v3;
  FBScene *scene;
  _QWORD v5[4];
  BOOL v6;

  v3 = -[PREditingSceneViewController _isPosterCoveredByModalPresentation](self, "_isPosterCoveredByModalPresentation");
  scene = self->super._scene;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87__PREditingSceneViewController__updateSceneSettingsForPosterCoveredByModalPresentation__block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
  v6 = v3;
  -[FBScene updateSettingsWithBlock:](scene, "updateSettingsWithBlock:", v5);
}

uint64_t __87__PREditingSceneViewController__updateSceneSettingsForPosterCoveredByModalPresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setCoveredByModalPresentation:", *(unsigned __int8 *)(a1 + 32));
}

- (void)_updateSceneSettingsForConfiguredWidgets
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  FBScene *scene;
  id v12;
  _QWORD v13[4];
  BOOL v14;
  char v15;

  -[NSHashTable anyObject](self->_complicationContainerViewControllers, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widgetGridViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "model");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "complicationDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") != 0;

  -[NSHashTable anyObject](self->_complicationContainerViewControllers, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sidebarWidgetGridViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "complicationDescriptors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v10, "count") != 0;

  scene = self->super._scene;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__PREditingSceneViewController__updateSceneSettingsForConfiguredWidgets__block_invoke;
  v13[3] = &__block_descriptor_34_e33_v16__0__FBSMutableSceneSettings_8l;
  v14 = v6;
  v15 = (char)v8;
  -[FBScene updateSettingsWithBlock:](scene, "updateSettingsWithBlock:", v13);

}

void __72__PREditingSceneViewController__updateSceneSettingsForConfiguredWidgets__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "pui_setComplicationRowConfigured:", v3);
  objc_msgSend(v4, "pui_setComplicationSidebarConfigured:", *(unsigned __int8 *)(a1 + 33));

}

- (void)_updatePresentationDismissalGestureView
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  double v15;
  double x;
  double v17;
  double y;
  double v19;
  double width;
  double v21;
  double height;
  PRDismissalOverlayView *v23;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _QWORD v45[4];
  _QWORD v46[3];
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v46[1] = *MEMORY[0x1E0C80C00];
  -[PREditingSceneViewController presentationDismissalGestureViews](self, "presentationDismissalGestureViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PREditingSceneViewController _isPosterCoveredByModalPresentation](self, "_isPosterCoveredByModalPresentation");
  if (v4 && !v3)
  {
    -[PREditingSceneViewController presentedComplicationsGallery](self, "presentedComplicationsGallery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = 8;
    }
    else
    {
      -[PREditingSceneViewController presentedSidebarComplicationsGallery](self, "presentedSidebarComplicationsGallery");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v6 = 16;
      }
      else
      {
        -[PREditingSceneViewController presentedInlineComplicationsGallery](self, "presentedInlineComplicationsGallery");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          x = *MEMORY[0x1E0C9D648];
          y = *(double *)(MEMORY[0x1E0C9D648] + 8);
          width = *(double *)(MEMORY[0x1E0C9D648] + 16);
          height = *(double *)(MEMORY[0x1E0C9D648] + 24);
          goto LABEL_22;
        }
        v6 = 4;
      }
    }
    +[PREditorElementLayoutController frameForElements:variant:](PREditorElementLayoutController, "frameForElements:variant:", v6, 2);
    x = v15;
    y = v17;
    width = v19;
    height = v21;
LABEL_22:
    v47.origin.x = x;
    v47.origin.y = y;
    v47.size.width = width;
    v47.size.height = height;
    if (!CGRectIsEmpty(v47))
    {
      v48.origin.x = x;
      v48.origin.y = y;
      v48.size.width = width;
      v48.size.height = height;
      v49 = CGRectInset(v48, -20.0, -20.0);
      x = v49.origin.x;
      y = v49.origin.y;
      width = v49.size.width;
      height = v49.size.height;
    }
    v23 = objc_alloc_init(PRDismissalOverlayView);
    -[PRDismissalOverlayView setTouchPassthroughRect:](v23, "setTouchPassthroughRect:", x, y, width, height);
    -[PRDismissalOverlayView setDelegate:](v23, "setDelegate:", self);
    -[PRDismissalOverlayView setTranslatesAutoresizingMaskIntoConstraints:](v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v46[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingSceneViewController setPresentationDismissalGestureViews:](self, "setPresentationDismissalGestureViews:", v24);

    -[PREditingSceneViewController view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v23);
    v34 = (void *)MEMORY[0x1E0CB3718];
    -[PRDismissalOverlayView leadingAnchor](v23, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v37;
    -[PRDismissalOverlayView trailingAnchor](v23, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v26;
    -[PRDismissalOverlayView topAnchor](v23, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v29;
    -[PRDismissalOverlayView bottomAnchor](v23, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v45[3] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "activateConstraints:", v33);

    v3 = 0;
    goto LABEL_25;
  }
  if (v3)
    v7 = v4;
  else
    v7 = 1;
  if ((v7 & 1) == 0)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v8 = v3;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v41 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "removeFromSuperview");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v10);
    }

    -[PREditingSceneViewController setPresentationDismissalGestureViews:](self, "setPresentationDismissalGestureViews:", 0);
  }
LABEL_25:

}

- (BOOL)_hasGraphicComplications
{
  NSHashTable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  v2 = self->_complicationContainerViewControllers;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "widgetGridViewController", (_QWORD)v11);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "model");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "complicationDescriptors");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = objc_msgSend(v8, "count");
        if (v9)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_hasSidebarComplications
{
  NSHashTable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  v2 = self->_complicationContainerViewControllers;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "sidebarWidgetGridViewController", (_QWORD)v11);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "model");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "complicationDescriptors");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = objc_msgSend(v8, "count");
        if (v9)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_shouldDepthEffectBeDisallowed
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = -[PREditingSceneViewController variant](self, "variant");
  if (v3 != 1)
  {
    -[PREditingSceneViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "interfaceOrientation");

    LOBYTE(v3) = (unint64_t)(v7 - 1) <= 1
              && -[PREditingSceneViewController _hasGraphicComplications](self, "_hasGraphicComplications")
              || -[PREditingSceneViewController focusedElement](self, "focusedElement") == 2;
  }
  return v3;
}

- (void)_updateSceneSettingsForDepthEffectDisallowed
{
  BOOL v3;
  FBScene *scene;
  _QWORD v5[4];
  BOOL v6;

  v3 = -[PREditingSceneViewController _shouldDepthEffectBeDisallowed](self, "_shouldDepthEffectBeDisallowed");
  scene = self->super._scene;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__PREditingSceneViewController__updateSceneSettingsForDepthEffectDisallowed__block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
  v6 = v3;
  -[FBScene updateSettingsWithBlock:](scene, "updateSettingsWithBlock:", v5);
}

uint64_t __76__PREditingSceneViewController__updateSceneSettingsForDepthEffectDisallowed__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setDepthEffectDisallowed:", *(unsigned __int8 *)(a1 + 32));
}

- (void)_insertModularComplication:(id)a3 location:(int64_t)a4 animated:(BOOL)a5
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[PREditingSceneViewController _canAddComplicationDescriptor:forLocation:](self, "_canAddComplicationDescriptor:forLocation:"))
  {
    if (a4 == 1)
    {
      -[NSHashTable anyObject](self->_complicationContainerViewControllers, "anyObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sidebarWidgetGridViewController");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a4)
      {
        v9 = 0;
        goto LABEL_9;
      }
      -[NSHashTable anyObject](self->_complicationContainerViewControllers, "anyObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "widgetGridViewController");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v8;

LABEL_9:
    objc_msgSend(v9, "model");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addComplicationDescriptor:", v11);

    goto LABEL_10;
  }
  -[PREditingSceneViewController _presentFullAlertForComplication:](self, "_presentFullAlertForComplication:", v11);
LABEL_10:

}

- (void)_presentFullAlertForComplication:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v4 = a3;
  PRSharedWidgetDescriptorProvider();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "descriptorForPersonality:", v6);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  PRBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("COMPLICATION_GALLERY_FULL_MESSAGE"), &stru_1E2186E08, CFSTR("PosterKit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC3450];
  PRBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("COMPLICATION_GALLERY_FULL_TITLE"), &stru_1E2186E08, CFSTR("PosterKit"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "alertControllerWithTitle:message:preferredStyle:", v14, v11, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0DC3448];
  PRBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E2186E08, CFSTR("PosterKit"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "actionWithTitle:style:handler:", v18, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addAction:", v19);
  -[PREditingSceneViewController bs_topPresentedViewController](self, "bs_topPresentedViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "presentViewController:animated:completion:", v15, 1, 0);

}

- (BOOL)_canAddComplicationDescriptor:(id)a3 forLocation:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;

  v6 = a3;
  if (a4 == 1)
  {
    -[NSHashTable anyObject](self->_complicationContainerViewControllers, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sidebarWidgetGridViewController");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
    {
      v9 = 0;
      goto LABEL_7;
    }
    -[NSHashTable anyObject](self->_complicationContainerViewControllers, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "widgetGridViewController");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

LABEL_7:
  objc_msgSend(v9, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "canAddComplicationDescriptor:", v6);

  return v11;
}

- (void)setVibrancyConfiguration:(id)a3
{
  id v5;

  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_vibrancyConfiguration, a3);
    -[PREditingSceneViewController _updateComplicationsVibrancyConfiguration](self, "_updateComplicationsVibrancyConfiguration");
  }

}

- (void)_updateComplicationsVibrancyConfiguration
{
  void *v3;
  NSHashTable *v4;
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
  -[PREditingSceneViewController vibrancyConfiguration](self, "vibrancyConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_complicationContainerViewControllers;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setVibrancyConfiguration:", v3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)_presentIntentConfigurationForComplicationDescriptorIfPossible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  objc_msgSend(v4, "widget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intentReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && -[PREditingSceneViewController _intentHasConfigurableAttributes:](self, "_intentHasConfigurableAttributes:", v7))
  {
    -[PREditingSceneViewController _presentIntentConfigurationForComplicationDescriptor:](self, "_presentIntentConfigurationForComplicationDescriptor:", v4);
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_presentIntentConfigurationForComplicationDescriptor:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  WFWidgetConfigurationViewController *v13;
  WFWidgetConfigurationViewController *presentedComplicationWidgetConfigurationViewController;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "widget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PRSharedWidgetDescriptorProvider();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptorForPersonality:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_presentedComplicationWidgetConfigurationViewController)
  {
    objc_msgSend(v7, "intentType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v5, "intentReference");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "intent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v5, "family");
      -[PREditingSceneViewController bs_topPresentedViewController](self, "bs_topPresentedViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditingSceneViewController _presentIntentConfigurationViewControllerWithIntent:descriptor:family:fromViewController:](self, "_presentIntentConfigurationViewControllerWithIntent:descriptor:family:fromViewController:", v10, v7, v11, v12);
      v13 = (WFWidgetConfigurationViewController *)objc_claimAutoreleasedReturnValue();

      objc_storeStrong((id *)&self->_widgetBeingConfigured, a3);
      presentedComplicationWidgetConfigurationViewController = self->_presentedComplicationWidgetConfigurationViewController;
      self->_presentedComplicationWidgetConfigurationViewController = v13;

    }
  }

}

- (void)_presentIntentConfigurationForQuickActionControl:(id)a3 withPosition:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  WFWidgetConfigurationViewController *v15;
  WFWidgetConfigurationViewController *presentedControlWidgetConfigurationViewController;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intentReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && -[PREditingSceneViewController _intentHasConfigurableAttributes:](self, "_intentHasConfigurableAttributes:", v8))
  {
    -[PREditingSceneViewController setControlIntentBeingConfigured:](self, "setControlIntentBeingConfigured:", v17);
    -[PREditingSceneViewController setQuickActionIntentEditPosition:](self, "setQuickActionIntentEditPosition:", a4);
    objc_msgSend(v17, "identity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingSceneViewController _descriptorForControl:](self, "_descriptorForControl:", v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!self->_presentedControlWidgetConfigurationViewController)
    {
      objc_msgSend(v10, "intentType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v9, "intentReference");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "intent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PREditingSceneViewController _presentIntentConfigurationViewControllerWithIntent:descriptor:family:fromViewController:](self, "_presentIntentConfigurationViewControllerWithIntent:descriptor:family:fromViewController:", v14, v11, 0, self);
        v15 = (WFWidgetConfigurationViewController *)objc_claimAutoreleasedReturnValue();

        presentedControlWidgetConfigurationViewController = self->_presentedControlWidgetConfigurationViewController;
        self->_presentedControlWidgetConfigurationViewController = v15;

      }
    }

  }
}

- (id)_descriptorForControl:(id)a3
{
  void *v4;
  CHSWidgetExtensionProvider *controlExtensionProvider;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  objc_msgSend(a3, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  controlExtensionProvider = self->_controlExtensionProvider;
  objc_msgSend(v4, "extensionIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHSWidgetExtensionProvider widgetExtensionContainerForExtensionBundleIdentifier:](controlExtensionProvider, "widgetExtensionContainerForExtensionBundleIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "extensionIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extensionForExtensionIdentity:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "orderedControlDescriptors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__PREditingSceneViewController__descriptorForControl___block_invoke;
  v15[3] = &unk_1E2183F98;
  v16 = v4;
  v12 = v4;
  objc_msgSend(v11, "bs_firstObjectPassingTest:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __54__PREditingSceneViewController__descriptorForControl___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "kind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (id)_presentIntentConfigurationViewControllerWithIntent:(id)a3 descriptor:(id)a4 family:(int64_t)a5 fromViewController:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v10 = (objc_class *)MEMORY[0x1E0DDA0F8];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v10);
  objc_msgSend(v14, "setIntent:", v13);

  objc_msgSend(v12, "displayName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWidgetDisplayName:", v15);

  objc_msgSend(v12, "widgetDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWidgetDescription:", v16);

  v17 = objc_msgSend(v12, "pr_configurationType");
  objc_msgSend(v14, "setWidgetConfigurationType:", v17);
  objc_msgSend(v14, "setFamily:", a5);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "userInterfaceIdiom");

  if ((v19 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    objc_msgSend(v14, "setWidgetConfigurationStyle:", 1);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDA100]), "initWithOptions:", v14);
  objc_msgSend(v20, "setDelegate:", self);
  objc_msgSend(v20, "sheetPresentationController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDelegate:", self);

  objc_msgSend(v11, "presentViewController:animated:completion:", v20, 1, 0);
  return v20;
}

- (BOOL)_intentHasConfigurableAttributes:(id)a3
{
  id v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v3, "_codableDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_msgSend(v7, "bs_containsObjectPassingTest:", &__block_literal_global_336);
  }

  return v4;
}

uint64_t __65__PREditingSceneViewController__intentHasConfigurableAttributes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isConfigurable");
}

- (void)_sceneContentReadinessDidChange
{
  _BOOL8 v3;
  _QWORD v4[4];
  id v5;
  BOOL v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PREditingSceneViewController;
  -[PRSceneViewController _sceneContentReadinessDidChange](&v8, sel__sceneContentReadinessDidChange);
  if (-[PREditingSceneViewController showsContentWhenReady](self, "showsContentWhenReady"))
  {
    objc_initWeak(&location, self);
    v3 = -[PRSceneViewController isSceneContentReady](self, "isSceneContentReady");
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __63__PREditingSceneViewController__sceneContentReadinessDidChange__block_invoke;
    v4[3] = &unk_1E2185B18;
    objc_copyWeak(&v5, &location);
    v6 = v3;
    -[PREditingSceneViewController setContentHidden:animated:completion:](self, "setContentHidden:animated:completion:", v3 ^ 1, v3, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __63__PREditingSceneViewController__sceneContentReadinessDidChange__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
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
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained && *(_BYTE *)(a1 + 40))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = (void *)objc_msgSend(WeakRetained[133], "copy", 0);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "editingSceneViewControllerDidFinishShowingContent:", v3);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)_updateQuickActionsPosterConfigurationForPosition:(int64_t)a3 withControlConfiguration:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PRPosterMutableQuickActionsConfiguration *v10;
  id v11;

  v11 = a4;
  -[PRSceneViewController configuredProperties](self, "configuredProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  -[PRSceneViewController configuredProperties](self, "configuredProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "quickActionsConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (PRPosterMutableQuickActionsConfiguration *)objc_msgSend(v9, "mutableCopy");

  if (!v10)
    v10 = -[PRPosterQuickActionsConfiguration initWithLeadingControl:trailingControl:]([PRPosterMutableQuickActionsConfiguration alloc], "initWithLeadingControl:trailingControl:", 0, 0);
  if (a3 == 2)
  {
    -[PRPosterQuickActionsConfiguration setTrailingControl:](v10, "setTrailingControl:", v11);
  }
  else if (a3 == 1)
  {
    -[PRPosterQuickActionsConfiguration setLeadingControl:](v10, "setLeadingControl:", v11);
  }
  objc_msgSend(v7, "setQuickActionsConfiguration:", v10);
  -[PRSceneViewController setConfiguredProperties:](self, "setConfiguredProperties:", v7);

}

- (void)_addWidgetIconView:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PRComplicationDescriptor *v18;
  void *v19;
  void *v20;
  PRComplicationDescriptor *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  id v34;

  v4 = a3;
  v5 = -[PREditingSceneViewController focusedElement](self, "focusedElement") == 3;
  objc_msgSend(v4, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_opt_class();
  v8 = v6;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  objc_msgSend(v10, "activeWidget");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "gridSizeClass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = PRWidgetFamilyForIconGridSizeClass(v11);
  v13 = objc_alloc(MEMORY[0x1E0D10148]);
  objc_msgSend(v34, "extensionBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "containerBundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "kind");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v13, "initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:family:intent:", v14, v15, v16, v12, 0);

  v18 = [PRComplicationDescriptor alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "UUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PRComplicationDescriptor initWithUniqueIdentifier:widget:](v18, "initWithUniqueIdentifier:widget:", v20, v17);

  -[PREditingSceneViewController _insertModularComplication:location:animated:](self, "_insertModularComplication:location:animated:", v21, v5, 1);
  -[PRComplicationDescriptor suggestedComplication](v21, "suggestedComplication");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[PREditingSceneViewController engagementCountsForViewedSuggestedComplications](self, "engagementCountsForViewedSuggestedComplications");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationDescriptor suggestedComplication](v21, "suggestedComplication");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKey:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    v27 = &unk_1E21DCE00;
    if (v25)
      v27 = (void *)v25;
    v28 = v27;

    -[PREditingSceneViewController engagementCountsForViewedSuggestedComplications](self, "engagementCountsForViewedSuggestedComplications");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x1E0CB37E8];
    v31 = objc_msgSend(v28, "intValue");

    objc_msgSend(v30, "numberWithInt:", (v31 + 1));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationDescriptor suggestedComplication](v21, "suggestedComplication");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKey:", v32, v33);

  }
}

+ (id)_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides
{
  void *v2;
  void *v3;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__PREditingSceneViewController__startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides_onceToken != -1)
    dispatch_once(&_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides_onceToken, block);
  objc_msgSend((id)_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides_sOverrideDomain, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "customOverrides");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __100__PREditingSceneViewController__startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  _QWORD v5[5];

  v2 = objc_alloc_init(MEMORY[0x1E0DB0A18]);
  v3 = (void *)_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides_sOverrideDomain;
  _startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides_sOverrideDomain = (uint64_t)v2;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __100__PREditingSceneViewController__startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides__block_invoke_2;
  v5[3] = &__block_descriptor_40_e46_v16__0__STStatusBarOverridesStatusDomainData_8l;
  v5[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend((id)_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides_sOverrideDomain, "observeDataWithBlock:", v5);
}

void __100__PREditingSceneViewController__startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  objc_msgSend(a2, "customOverrides");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "dateFromEntriesIncludesTime"))
  {
    objc_msgSend(v3, "dateFromEntries");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "overrideObservingViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __100__PREditingSceneViewController__startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides__block_invoke_3;
  v9[3] = &unk_1E2183900;
  v10 = v6;
  v11 = v4;
  v7 = v4;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __100__PREditingSceneViewController__startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides__block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setOverrideDate:", *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

+ (NSHashTable)overrideObservingViewControllers
{
  if (overrideObservingViewControllers_onceToken[0] != -1)
    dispatch_once(overrideObservingViewControllers_onceToken, &__block_literal_global_350);
  return (NSHashTable *)(id)overrideObservingViewControllers_sOverrideObservingViewControllers;
}

void __64__PREditingSceneViewController_overrideObservingViewControllers__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)overrideObservingViewControllers_sOverrideObservingViewControllers;
  overrideObservingViewControllers_sOverrideObservingViewControllers = v0;

}

- (void)_setUpDateOverriding
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_opt_class();
  objc_msgSend(v3, "overrideObservingViewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", self);

  objc_msgSend(v3, "_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "dateFromEntriesIncludesTime"))
  {
    objc_msgSend(v6, "dateFromEntries");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[PREditingSceneViewController setOverrideDate:](self, "setOverrideDate:", v5);

}

- (void)_setUpRemotePresentationForContextId:(unsigned int)a3 layerRenderId:(unint64_t)a4 presentedScreenRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v10;
  void *v12;
  id v13;
  void *v14;
  PREditingRemotePresentationView *v15;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = *(_QWORD *)&a3;
  v15 = objc_alloc_init(PREditingRemotePresentationView);
  -[PREditingRemotePresentationView portalLayer](v15, "portalLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSourceContextId:", v10);
  objc_msgSend(v12, "setSourceLayerRenderId:", a4);
  v13 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
  objc_msgSend(v13, "setView:", v15);
  -[PREditingSceneViewController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v14, "editingSceneViewController:wantsRemotePresentationOfViewController:contentScreenRect:", self, v13, x, y, width, height);

}

- (void)_finalize
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_didFinalize)
  {
    self->_didFinalize = 1;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v8, "editingSceneViewControllerDidFinalize:", self);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
}

- (id)scene:(id)a3 handleActions:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char isKindOfClass;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v28.receiver = self;
  v28.super_class = (Class)PREditingSceneViewController;
  -[PRSceneViewController scene:handleActions:](&v28, sel_scene_handleActions_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v7;
  if (v7)
    v8 = (id)objc_msgSend(v7, "mutableCopy");
  else
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v9 = v8;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_opt_self();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v18 = objc_msgSend(v15, "sourceContextId");
          v19 = objc_msgSend(v15, "sourceLayerRenderId");
          objc_msgSend(v15, "presentedViewScreenRect");
          -[PREditingSceneViewController _setUpRemotePresentationForContextId:layerRenderId:presentedScreenRect:](self, "_setUpRemotePresentationForContextId:layerRenderId:presentedScreenRect:", v18, v19);
        }
        else
        {
          objc_opt_self();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_opt_isKindOfClass();

          if ((v21 & 1) == 0)
            continue;
          -[PREditingSceneViewController _dismissWithAction:](self, "_dismissWithAction:", objc_msgSend(v15, "userAcceptedChanges"));
        }
        objc_msgSend(v9, "addObject:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v12);
  }

  return v9;
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  PRPosterRenderingConfiguration *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "clientSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "pr_parallaxEnabledDidChange") & 1) != 0
    || objc_msgSend(v11, "pr_depthEffectDisabledDidChange"))
  {
    v15 = -[PRPosterRenderingConfiguration initWithDepthEffectDisabled:parallaxEnabled:]([PRPosterRenderingConfiguration alloc], "initWithDepthEffectDisabled:parallaxEnabled:", objc_msgSend(v14, "pr_isDepthEffectDisabled"), objc_msgSend(v14, "pr_isParallaxEnabled"));
    -[PRSceneViewController configuredProperties](self, "configuredProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    objc_msgSend(v17, "setRenderingConfiguration:", v15);
    -[PRSceneViewController setConfiguredProperties:](self, "setConfiguredProperties:", v17);

  }
  v23.receiver = self;
  v23.super_class = (Class)PREditingSceneViewController;
  -[PRSceneViewController scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:](&v23, sel_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext_, v10, v11, v12, v13);
  v21 = MEMORY[0x1E0C809B0];
  v22 = v10;
  v18 = v10;
  _UISceneSettingsDiffActionPerformChangesWithTransitionContext();

  objc_msgSend(v18, "clientSettings", v21, 3221225472, __106__PREditingSceneViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke, &unk_1E2185B80);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "pr_areContentsCoveredByModalPresentation");

  -[PREditingSceneViewController setClientPresentingModalViewController:](self, "setClientPresentingModalViewController:", v20);
}

void __106__PREditingSceneViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "clientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pr_vibrancyConfiguration");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setVibrancyConfiguration:", v3);
}

- (void)complicationContainerViewController:(id)a3 didUpdateModelContentForLocation:(int64_t)a4
{
  -[PREditingSceneViewController _updateSceneSettingsForDepthEffectDisallowed](self, "_updateSceneSettingsForDepthEffectDisallowed", a3, a4);
  -[PREditingSceneViewController _updateSceneSettingsForConfiguredWidgets](self, "_updateSceneSettingsForConfiguredWidgets");
  -[PREditingSceneViewController _updateAddComplicationsTapGestureAllowed](self, "_updateAddComplicationsTapGestureAllowed");
}

- (void)complicationContainerViewControllerDidTapAdd:(id)a3 forLocation:(int64_t)a4
{
  NSObject *v6;
  uint8_t v7[16];

  if (-[PREditingSceneViewController _shouldAllowGalleryPresentationForLocation:](self, "_shouldAllowGalleryPresentationForLocation:", a4))
  {
    if (a4 == 1)
    {
      -[PREditingSceneViewController _presentSidebarComplicationGallery](self, "_presentSidebarComplicationGallery");
    }
    else if (!a4)
    {
      -[PREditingSceneViewController _presentComplicationGallery](self, "_presentComplicationGallery");
    }
  }
  else
  {
    PRLogEditing();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18B634000, v6, OS_LOG_TYPE_DEFAULT, "Gallery presentation disallowed, ignoring tap", v7, 2u);
    }

  }
}

- (void)complicationContainerViewController:(id)a3 didEditComplication:(id)a4
{
  -[PREditingSceneViewController _presentIntentConfigurationForComplicationDescriptorIfPossible:](self, "_presentIntentConfigurationForComplicationDescriptorIfPossible:", a4);
}

- (void)complicationContainerViewController:(id)a3 isAttemptingDragToAddComplication:(id)a4
{
  void *v5;
  PRComplicationDescriptor *widgetBeingAdded;
  PRComplicationDescriptor *v7;
  PRComplicationDescriptor *v8;

  v8 = (PRComplicationDescriptor *)a4;
  -[PRComplicationDescriptor widget](v8, "widget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  widgetBeingAdded = v8;
  if (!v5)
    widgetBeingAdded = self->_widgetBeingAdded;
  v7 = widgetBeingAdded;

  if (!-[PREditingSceneViewController _canAddComplicationDescriptor:forLocation:](self, "_canAddComplicationDescriptor:forLocation:", v7, -[PREditingSceneViewController focusedElement](self, "focusedElement") == 3))-[PREditingSceneViewController _presentFullAlertForComplication:](self, "_presentFullAlertForComplication:", v7);
}

- (void)complicationGalleryViewController:(id)a3 didSelectWidgetIconView:(id)a4
{
  -[PREditingSceneViewController _addWidgetIconView:](self, "_addWidgetIconView:", a4);
}

- (void)complicationGalleryViewControllerDidFinish:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingSceneViewController presentedComplicationsGallery](self, "presentedComplicationsGallery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    -[PREditingSceneViewController setPresentedComplicationsGallery:](self, "setPresentedComplicationsGallery:", 0);
    -[PREditingSceneViewController _updateSceneSettingsForPosterCoveredByModalPresentation](self, "_updateSceneSettingsForPosterCoveredByModalPresentation");
    -[PREditingSceneViewController _updatePresentationDismissalGestureView](self, "_updatePresentationDismissalGestureView");
    -[PREditingSceneViewController _updateAddComplicationsTapGestureAllowed](self, "_updateAddComplicationsTapGestureAllowed");
  }
}

- (void)complicationGalleryViewController:(id)a3 didBeginDraggingComplication:(id)a4
{
  PRComplicationDescriptor *v5;
  PRComplicationDescriptor *widgetBeingAdded;

  v5 = (PRComplicationDescriptor *)a4;
  -[PREditingSceneViewController setDraggingComplication:](self, "setDraggingComplication:", 1);
  widgetBeingAdded = self->_widgetBeingAdded;
  self->_widgetBeingAdded = v5;

}

- (void)complicationGalleryViewController:(id)a3 didEndDraggingComplication:(id)a4 withOperation:(unint64_t)a5
{
  -[PREditingSceneViewController setDraggingComplication:](self, "setDraggingComplication:", 0, a4, a5);
}

- (void)inlineComplicationGalleryViewController:(id)a3 didSelectComplication:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  -[PREditingSceneViewController setSelectedInlineComplication:](self, "setSelectedInlineComplication:", v17);
  objc_msgSend(v17, "suggestedComplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PREditingSceneViewController engagementCountsForViewedSuggestedComplications](self, "engagementCountsForViewedSuggestedComplications");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "suggestedComplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = &unk_1E21DCE00;
    if (v8)
      v10 = (void *)v8;
    v11 = v10;

    -[PREditingSceneViewController engagementCountsForViewedSuggestedComplications](self, "engagementCountsForViewedSuggestedComplications");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB37E8];
    v14 = objc_msgSend(v11, "intValue");

    objc_msgSend(v13, "numberWithInt:", (v14 + 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "suggestedComplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v15, v16);

  }
}

- (void)inlineComplicationGalleryViewController:(id)a3 didToggleAlternateDate:(BOOL)a4
{
  -[PREditingSceneViewController setAlternateDateEnabled:](self, "setAlternateDateEnabled:", a4);
}

- (void)inlineComplicationGalleryViewControllerDidFinish:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingSceneViewController presentedInlineComplicationsGallery](self, "presentedInlineComplicationsGallery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    -[PREditingSceneViewController setPresentedInlineComplicationsGallery:](self, "setPresentedInlineComplicationsGallery:", 0);
    -[PREditingSceneViewController _updateSceneSettingsForPosterCoveredByModalPresentation](self, "_updateSceneSettingsForPosterCoveredByModalPresentation");
    -[PREditingSceneViewController _updatePresentationDismissalGestureView](self, "_updatePresentationDismissalGestureView");
    -[PREditingSceneViewController _updateAddComplicationsTapGestureAllowed](self, "_updateAddComplicationsTapGestureAllowed");
  }
}

- (void)widgetConfigurationViewController:(id)a3 didFinishWithIntent:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  PRComplicationDescriptor *widgetBeingConfigured;
  WFWidgetConfigurationViewController *presentedComplicationWidgetConfigurationViewController;
  CCUISConfiguredControl *controlIntentBeingConfigured;
  WFWidgetConfigurationViewController *presentedControlWidgetConfigurationViewController;
  void *v33;
  void *v34;
  WFWidgetConfigurationViewController *v35;

  v35 = (WFWidgetConfigurationViewController *)a3;
  v6 = a4;
  if (self->_presentedComplicationWidgetConfigurationViewController == v35)
  {
    -[PRComplicationDescriptor widget](self->_widgetBeingConfigured, "widget");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "widgetByReplacingIntent:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)-[PRComplicationDescriptor copy](self->_widgetBeingConfigured, "copy");
    objc_msgSend(v14, "setWidget:", v8);
    if (self->_widgetBeingConfigured == self->_selectedInlineComplication)
    {
      -[PREditingSceneViewController setSelectedInlineComplication:](self, "setSelectedInlineComplication:", v14);
LABEL_14:
      widgetBeingConfigured = self->_widgetBeingConfigured;
      self->_widgetBeingConfigured = 0;

      presentedComplicationWidgetConfigurationViewController = self->_presentedComplicationWidgetConfigurationViewController;
      self->_presentedComplicationWidgetConfigurationViewController = 0;

      -[WFWidgetConfigurationViewController dismissViewControllerAnimated:completion:](v35, "dismissViewControllerAnimated:completion:", 1, 0);
LABEL_18:

      goto LABEL_19;
    }
    v33 = v14;
    -[NSHashTable anyObject](self->_complicationContainerViewControllers, "anyObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "widgetGridViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "model");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSHashTable anyObject](self->_complicationContainerViewControllers, "anyObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sidebarWidgetGridViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "model");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "complicationDescriptors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "complicationDescriptors");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "indexOfObject:", self->_widgetBeingConfigured);
    v27 = objc_msgSend(v25, "indexOfObject:", self->_widgetBeingConfigured);
    v34 = v20;
    if (v26 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = v33;
      if (v27 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_13:

        goto LABEL_14;
      }
      -[PRComplicationDescriptor uniqueIdentifier](self->_widgetBeingConfigured, "uniqueIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "updateIntent:forWidgetWithIdentifier:", v6, v28);
    }
    else
    {
      -[PRComplicationDescriptor uniqueIdentifier](self->_widgetBeingConfigured, "uniqueIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "updateIntent:forWidgetWithIdentifier:", v6, v28);
      v14 = v33;
    }

    goto LABEL_13;
  }
  if (self->_presentedControlWidgetConfigurationViewController == v35)
  {
    v7 = -[PREditingSceneViewController quickActionIntentEditPosition](self, "quickActionIntentEditPosition");
    -[PREditingSceneViewController controlIntentBeingConfigured](self, "controlIntentBeingConfigured");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x1E0D10000]);
    objc_msgSend(v8, "identity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "extensionIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "kind");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v9, "initWithExtensionIdentity:kind:intent:", v11, v13, v6);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D14828]), "initWithIdentity:type:size:", v14, objc_msgSend(v8, "type"), objc_msgSend(v8, "size"));
    if (v7 == 2)
    {
      -[PREditingSceneViewController quickActionEditingViewController](self, "quickActionEditingViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTrailingControl:", v15);
    }
    else
    {
      if (v7 != 1)
      {
LABEL_17:
        controlIntentBeingConfigured = self->_controlIntentBeingConfigured;
        self->_controlIntentBeingConfigured = 0;

        presentedControlWidgetConfigurationViewController = self->_presentedControlWidgetConfigurationViewController;
        self->_presentedControlWidgetConfigurationViewController = 0;

        self->_quickActionIntentEditPosition = 0;
        -[WFWidgetConfigurationViewController dismissViewControllerAnimated:completion:](v35, "dismissViewControllerAnimated:completion:", 1, 0);

        goto LABEL_18;
      }
      -[PREditingSceneViewController quickActionEditingViewController](self, "quickActionEditingViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setLeadingControl:", v15);
    }

    goto LABEL_17;
  }
LABEL_19:

}

- (void)quickActionEditingViewController:(id)a3 didTapAddForPosition:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = a3;
  v9 = v6;
  if (a4 == 2)
  {
    objc_msgSend(v6, "trailingControl");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v6, "leadingControl");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_7:
  -[PREditingSceneViewController setSelectedQuickActionPosition:](self, "setSelectedQuickActionPosition:", a4);
  -[PREditingSceneViewController _presentControlsGalleryWithSelectedControl:](self, "_presentControlsGalleryWithSelectedControl:", v8);

}

- (void)quickActionEditingViewController:(id)a3 didRequestIntentConfigurationForControl:(id)a4 withPosition:(int64_t)a5
{
  -[PREditingSceneViewController _presentIntentConfigurationForQuickActionControl:withPosition:](self, "_presentIntentConfigurationForQuickActionControl:withPosition:", a4, a5);
}

- (void)quickActionEditingViewController:(id)a3 didSetControl:(id)a4 forPosition:(int64_t)a5
{
  PRQuickActionControlConfiguration *v7;
  void *v8;
  PRQuickActionControlConfiguration *v9;
  id v10;

  v10 = a4;
  v7 = [PRQuickActionControlConfiguration alloc];
  if (v10)
  {
    objc_msgSend(v10, "identity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PRQuickActionControlConfiguration initWithControlIdentity:type:](v7, "initWithControlIdentity:type:", v8, objc_msgSend(v10, "type"));

  }
  else
  {
    v9 = -[PRQuickActionControlConfiguration initWithCategory:](v7, "initWithCategory:", 0);
  }
  -[PREditingSceneViewController _updateQuickActionsPosterConfigurationForPosition:withControlConfiguration:](self, "_updateQuickActionsPosterConfigurationForPosition:withControlConfiguration:", a5, v9);

}

- (void)controlsGalleryViewController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  NSObject *v18;
  int64_t v19;
  uint8_t v20[16];

  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "control");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    PRLogEditing();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PREditingSceneViewController controlsGalleryViewController:didFinishWithResult:error:].cold.1((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);

    goto LABEL_15;
  }
  v17 = -[PREditingSceneViewController selectedQuickActionPosition](self, "selectedQuickActionPosition");
  if (v17)
  {
    if (v17 == 2)
    {
      -[PREditingSceneViewController quickActionEditingViewController](self, "quickActionEditingViewController");
      v18 = objc_claimAutoreleasedReturnValue();
      -[NSObject setTrailingControl:](v18, "setTrailingControl:", v9);
    }
    else
    {
      if (v17 != 1)
        goto LABEL_13;
      -[PREditingSceneViewController quickActionEditingViewController](self, "quickActionEditingViewController");
      v18 = objc_claimAutoreleasedReturnValue();
      -[NSObject setLeadingControl:](v18, "setLeadingControl:", v9);
    }
  }
  else
  {
    PRLogEditing();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_18B634000, v18, OS_LOG_TYPE_DEFAULT, "Do nothing since we finished with control from no position. But how did we get here?", v20, 2u);
    }
  }

LABEL_13:
  v19 = -[PREditingSceneViewController selectedQuickActionPosition](self, "selectedQuickActionPosition");
  -[PREditingSceneViewController dismissAnyPresentedComplicationGalleryAnimated:](self, "dismissAnyPresentedComplicationGalleryAnimated:", 1);
  if (objc_msgSend(v7, "promptsForUserConfiguration"))
    -[PREditingSceneViewController _presentIntentConfigurationForQuickActionControl:withPosition:](self, "_presentIntentConfigurationForQuickActionControl:withPosition:", v9, v19);
LABEL_15:

}

- (void)forwardAppearanceNotificationName:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  PREditingForwardExtensionAppearanceNotificationAction *v9;
  FBScene *scene;
  void *v11;
  uint64_t v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PRLogEditing();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543362;
    v14 = v4;
    _os_log_impl(&dword_18B634000, v5, OS_LOG_TYPE_DEFAULT, "Forwarding appearance notification to extension: %{public}@", (uint8_t *)&v13, 0xCu);
  }

  v6 = -[FBScene isActive](self->super._scene, "isActive");
  PRLogEditing();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v8;
    _os_log_impl(&dword_18B634000, v7, OS_LOG_TYPE_DEFAULT, "Scene active: %{public}@", (uint8_t *)&v13, 0xCu);

  }
  if ((_DWORD)v6)
  {
    v9 = -[PREditingForwardExtensionAppearanceNotificationAction initWithNotificationName:]([PREditingForwardExtensionAppearanceNotificationAction alloc], "initWithNotificationName:", v4);
    scene = self->super._scene;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBScene sendActions:](scene, "sendActions:", v11);

  }
  v12 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB2A00]);
  if ((v12 & 1) != 0 || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB29E8]))
    -[PREditingSceneViewController setHostApplicationHasResignedActive:](self, "setHostApplicationHasResignedActive:", v12);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a3, "presentedViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingSceneViewController presentedComplicationsGallery](self, "presentedComplicationsGallery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v4)
  {
    -[PREditingSceneViewController setPresentedComplicationsGallery:](self, "setPresentedComplicationsGallery:", 0);
LABEL_10:
    -[PREditingSceneViewController _updateSceneSettingsForPosterCoveredByModalPresentation](self, "_updateSceneSettingsForPosterCoveredByModalPresentation");
    -[PREditingSceneViewController _updatePresentationDismissalGestureView](self, "_updatePresentationDismissalGestureView");
    -[PREditingSceneViewController _updateAddComplicationsTapGestureAllowed](self, "_updateAddComplicationsTapGestureAllowed");
    goto LABEL_11;
  }
  -[PREditingSceneViewController presentedSidebarComplicationsGallery](self, "presentedSidebarComplicationsGallery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v5)
  {
    -[PREditingSceneViewController setPresentedSidebarComplicationsGallery:](self, "setPresentedSidebarComplicationsGallery:", 0);
    goto LABEL_10;
  }
  -[PREditingSceneViewController presentedInlineComplicationsGallery](self, "presentedInlineComplicationsGallery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v6)
  {
    -[PREditingSceneViewController setPresentedInlineComplicationsGallery:](self, "setPresentedInlineComplicationsGallery:", 0);
    goto LABEL_10;
  }
  -[PREditingSceneViewController presentedControlsGallery](self, "presentedControlsGallery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v7)
  {
    -[PREditingSceneViewController setPresentedControlsGallery:](self, "setPresentedControlsGallery:", 0);
    -[PREditingSceneViewController _updateSceneSettingsForPosterCoveredByModalPresentation](self, "_updateSceneSettingsForPosterCoveredByModalPresentation");
    -[PREditingSceneViewController _updatePresentationDismissalGestureView](self, "_updatePresentationDismissalGestureView");
    -[PREditingSceneViewController _updateAddComplicationsTapGestureAllowed](self, "_updateAddComplicationsTapGestureAllowed");
    -[PREditingSceneViewController setSelectedQuickActionPosition:](self, "setSelectedQuickActionPosition:", 0);
    -[PREditingSceneViewController quickActionEditingViewController](self, "quickActionEditingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setGalleryPresented:", 0);

    goto LABEL_11;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v9 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v11, "finishWithCurrentConfiguration");
LABEL_11:
    v9 = v11;
  }

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  PREditingSceneViewController *v12;
  uint64_t v13;
  BOOL v14;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingSceneViewController complicationsAddGestureView](self, "complicationsAddGestureView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    v12 = self;
    v13 = 0;
LABEL_7:
    v14 = -[PREditingSceneViewController _shouldAllowAddComplicationsTapGestureForLocation:](v12, "_shouldAllowAddComplicationsTapGestureForLocation:", v13);
LABEL_9:
    v11 = v14;
    goto LABEL_10;
  }
  objc_msgSend(v4, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingSceneViewController sidebarComplicationAddGestureView](self, "sidebarComplicationAddGestureView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    v12 = self;
    v13 = 1;
    goto LABEL_7;
  }
  objc_msgSend(v4, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingSceneViewController inlineComplicationGestureView](self, "inlineComplicationGestureView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v10)
  {
    v14 = -[PREditingSceneViewController _shouldAllowInlineComplicationTapGesture](self, "_shouldAllowInlineComplicationTapGesture");
    goto LABEL_9;
  }
  v11 = 1;
LABEL_10:

  return v11;
}

- (void)extensionsDidChangeForExtensionProvider:(id)a3
{
  BSDispatchMain();
}

uint64_t __72__PREditingSceneViewController_extensionsDidChangeForExtensionProvider___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;

  objc_msgSend(*(id *)(a1 + 32), "presentedSidebarComplicationsGallery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "presentedSidebarComplicationsGallery");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "presentedComplicationsGallery");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_9;
    objc_msgSend(*(id *)(a1 + 32), "presentedComplicationsGallery");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "conformsToProtocol:", &unk_1EE0223B0);

    v10 = *(void **)(a1 + 32);
    if (!v9)
    {
      objc_msgSend(v10, "_updateApplicationWidgetCollectionsForPresentedComplicationGallery");
      goto LABEL_9;
    }
    objc_msgSend(v10, "presentedComplicationsGallery");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "addWidgetSheetConfigurationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updatePresentedWidgetEditingViewController:", v5);

  }
LABEL_9:
  objc_msgSend(*(id *)(a1 + 32), "quickActionEditingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "validateControls");

  return objc_msgSend(*(id *)(a1 + 32), "_validateInlineComplication");
}

- (void)_updateApplicationWidgetCollectionsForPresentedComplicationGallery
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  -[PREditingSceneViewController presentedComplicationsGallery](self, "presentedComplicationsGallery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  v11 = v9;
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  -[PREditingSceneViewController addWidgetSheetConfigurationManager](self, "addWidgetSheetConfigurationManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PRIconGridSizeClassSetForWidgetFamilyMask(objc_msgSend(v14, "allowedWidgetFamilies"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PREditingSceneViewController addWidgetSheetConfigurationManager](self, "addWidgetSheetConfigurationManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v15;
  objc_msgSend(v16, "applicationWidgetCollectionsForEditingViewController:withAllowedSizeClasses:allowingNonStackableItems:", self, &v19, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v19;

  objc_msgSend(v13, "setApplicationWidgetCollections:", v17);
}

- (unint64_t)presenterType
{
  return 3;
}

- (BOOL)isDisplayingEditingButtons
{
  return 0;
}

- (void)addWidgetSheetViewController:(id)a3 didSelectWidgetIconView:(id)a4
{
  -[PREditingSceneViewController _addWidgetIconView:](self, "_addWidgetIconView:", a4);
}

- (void)addWidgetSheetViewControllerDidCancel:(id)a3
{
  -[PREditingSceneViewController dismissAnyPresentedComplicationGalleryAnimated:](self, "dismissAnyPresentedComplicationGalleryAnimated:", 1);
}

- (id)addWidgetSheetViewController:(id)a3 detailViewControllerForWidgetCollection:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _BOOL8 v24;
  PRComplicationGalleryDetailViewController *v25;
  void *v26;
  void *v27;
  PRComplicationGalleryDetailViewController *v28;

  v6 = (objc_class *)MEMORY[0x1E0DAA438];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v9, "layoutForIconLocation:", *MEMORY[0x1E0DAA9E8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "iconImageInfo");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA498]), "initWithName:iconImageInfo:", CFSTR("iconImages"), v12, v14, v16, v18);
  -[PREditingSceneViewController presentedSidebarComplicationsGallery](self, "presentedSidebarComplicationsGallery");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (v20 == v8)
    v21 = 3074;
  else
    v21 = 3072;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "userInterfaceIdiom");

  v24 = (v23 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  v25 = [PRComplicationGalleryDetailViewController alloc];
  -[PREditingSceneViewController listLayoutProvider](self, "listLayoutProvider");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingSceneViewController iconViewProvider](self, "iconViewProvider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[SBHAddWidgetSheetViewControllerBase initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:](v25, "initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:", v26, v27, v21, 256, v19, v24);

  -[SBHAddWidgetSheetViewControllerBase setDelegate:](v28, "setDelegate:", self);
  -[PRComplicationGalleryDetailViewController setApplicationWidgetCollection:](v28, "setApplicationWidgetCollection:", v7);

  -[PRComplicationGalleryDetailViewController setShowsCloseButton:](v28, "setShowsCloseButton:", 0);
  -[PRComplicationGalleryDetailViewController setShowsBackgroundView:](v28, "setShowsBackgroundView:", 0);

  return v28;
}

- (id)galleryViewControllerForAddWidgetSheetViewController:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PRWidgetSuggestionsViewController *v13;
  void *v14;
  void *v15;
  PRWidgetSuggestionsViewController *v16;

  -[PREditingSceneViewController presentedSidebarComplicationsGallery](self, "presentedSidebarComplicationsGallery", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[PREditingSceneViewController sidebarWidgetSuggestions](self, "sidebarWidgetSuggestions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CF89F8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bs_safeAddObject:", v7);

    -[PREditingSceneViewController sidebarWidgetSuggestions](self, "sidebarWidgetSuggestions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CF89E8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bs_safeAddObject:", v9);

    -[PREditingSceneViewController sidebarWidgetSuggestions](self, "sidebarWidgetSuggestions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CF89F0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bs_safeAddObject:", v11);

    v12 = (void *)objc_msgSend(v5, "copy");
  }
  else
  {
    -[PREditingSceneViewController graphicComplicationSuggestionSets](self, "graphicComplicationSuggestionSets");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = [PRWidgetSuggestionsViewController alloc];
  -[PREditingSceneViewController listLayoutProvider](self, "listLayoutProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingSceneViewController iconViewProvider](self, "iconViewProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PRWidgetSuggestionsViewController initWithSuggestionSets:listLayoutProvider:iconViewProvider:widgetDragHandler:usingSidebarLayout:](v13, "initWithSuggestionSets:listLayoutProvider:iconViewProvider:widgetDragHandler:usingSidebarLayout:", v12, v14, v15, self, v4 != 0);

  -[PRWidgetSuggestionsViewController setDelegate:](v16, "setDelegate:", self);
  return v16;
}

- (void)widgetSuggestionsViewController:(id)a3 didSelectWidgetIconView:(id)a4
{
  -[PREditingSceneViewController _addWidgetIconView:](self, "_addWidgetIconView:", a4);
}

- (id)widgetIconForGalleryItem:(id)a3 sizeClass:(int64_t)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = objc_opt_class();
  v8 = v6;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  if (v10)
  {
    -[PREditingSceneViewController widgetIconForDescriptor:sizeClass:](self, "widgetIconForDescriptor:sizeClass:", v10, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)widgetIconForDescriptor:(id)a3 sizeClass:(int64_t)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (objc_class *)MEMORY[0x1E0DAA678];
  v6 = a3;
  v7 = [v5 alloc];
  objc_msgSend(MEMORY[0x1E0DAA480], "pr_widgetDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithCHSWidgetDescriptor:inDomain:", v6, v8);

  PRIconGridSizeClassForWidgetFamily(a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGridSizeClass:", v10);

  return v9;
}

- (id)widgetIconForDescriptors:(id)a3 sizeClass:(int64_t)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (objc_class *)MEMORY[0x1E0DAA678];
  v6 = a3;
  v7 = [v5 alloc];
  objc_msgSend(MEMORY[0x1E0DAA480], "pr_widgetDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithCHSWidgetDescriptors:inDomain:", v6, v8);

  PRIconGridSizeClassForWidgetFamily(a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGridSizeClass:", v10);

  return v9;
}

- (UIView)recycledViewsContainer
{
  UIView *recycledViewsContainerView;
  UIView *v4;
  UIView *v5;
  void *v6;

  recycledViewsContainerView = self->_recycledViewsContainerView;
  if (!recycledViewsContainerView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v5 = self->_recycledViewsContainerView;
    self->_recycledViewsContainerView = v4;

    -[UIView setHidden:](self->_recycledViewsContainerView, "setHidden:", 1);
    -[UIView setAlpha:](self->_recycledViewsContainerView, "setAlpha:", 0.0);
    -[UIView setUserInteractionEnabled:](self->_recycledViewsContainerView, "setUserInteractionEnabled:", 0);
    -[PREditingSceneViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_recycledViewsContainerView);

    recycledViewsContainerView = self->_recycledViewsContainerView;
  }
  return recycledViewsContainerView;
}

- (id)addWidgetSheetViewControllerForAddWidgetSheetConfigurationManager:(id)a3
{
  return 0;
}

- (id)rootFolderForAddWidgetSheetConfigurationManager:(id)a3
{
  return 0;
}

- (id)addWidgetSheetConfigurationManager:(id)a3 vendorNameForAppWithBundleIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;

  v5 = a4;
  -[PREditingSceneViewController iconModel](self, "iconModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationIconForBundleIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "application");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "vendorName");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  if (!-[__CFString length](v9, "length")
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v8, "isAppleApplication"))
  {

    v9 = CFSTR("Apple");
  }

  return v9;
}

- (id)addWidgetSheetConfigurationManager:(id)a3 containerBundleIdentiferForDescriptor:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  objc_msgSend(v4, "extensionIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "extensionIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "extensionBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PRWidgetGridModel effectiveContainerBundleIdentifierForContainerBundleIdentifier:extensionBundleIdentifier:](PRWidgetGridModel, "effectiveContainerBundleIdentifierForContainerBundleIdentifier:extensionBundleIdentifier:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)dismissalOverlayViewDidDismiss:(id)a3
{
  -[PREditingSceneViewController dismissAnyPresentedComplicationGalleryAnimated:](self, "dismissAnyPresentedComplicationGalleryAnimated:", 1);
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PREditingSceneViewController *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__PREditingSceneViewController_appProtectionSubjectsChanged_forSubscription___block_invoke;
  v7[3] = &unk_1E2183900;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __77__PREditingSceneViewController_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;

  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1160));
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", WeakRetained);

  if ((_DWORD)v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "quickActionEditingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "validateControls");

    objc_msgSend(*(id *)(a1 + 40), "_validateInlineComplication");
  }
}

- (double)titledButtonsAlpha
{
  return self->_titledButtonsAlpha;
}

- (void)setTitledButtonsAlpha:(double)a3
{
  self->_titledButtonsAlpha = a3;
}

- (PREditingSceneViewControllerDelegate)delegate
{
  return (PREditingSceneViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)variant
{
  return self->_variant;
}

- (int64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(int64_t)a3
{
  self->_destination = a3;
}

- (int64_t)acceptButtonType
{
  return self->_acceptButtonType;
}

- (CGRect)leadingTopButtonFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_leadingTopButtonFrame.origin.x;
  y = self->_leadingTopButtonFrame.origin.y;
  width = self->_leadingTopButtonFrame.size.width;
  height = self->_leadingTopButtonFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)trailingTopButtonFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_trailingTopButtonFrame.origin.x;
  y = self->_trailingTopButtonFrame.origin.y;
  width = self->_trailingTopButtonFrame.size.width;
  height = self->_trailingTopButtonFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)horizontalTitleBoundingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_horizontalTitleBoundingRect.origin.x;
  y = self->_horizontalTitleBoundingRect.origin.y;
  width = self->_horizontalTitleBoundingRect.size.width;
  height = self->_horizontalTitleBoundingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)verticalTitleBoundingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_verticalTitleBoundingRect.origin.x;
  y = self->_verticalTitleBoundingRect.origin.y;
  width = self->_verticalTitleBoundingRect.size.width;
  height = self->_verticalTitleBoundingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSString)titleString
{
  return self->_titleString;
}

- (BOOL)areControlsHidden
{
  return self->_controlsHidden;
}

- (BOOL)usesEditingLayout
{
  return self->_usesEditingLayout;
}

- (BOOL)showsContentWhenReady
{
  return self->_showsContentWhenReady;
}

- (BOOL)allowsTransparentContent
{
  return self->_allowsTransparentContent;
}

- (BOOL)isContentHidden
{
  return self->_contentHidden;
}

- (PREditingSessionModifications)modifications
{
  return self->_modifications;
}

- (void)setModifications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1152);
}

- (APSubjectMonitorSubscription)appProtectionSubjectMonitorSubscription
{
  return (APSubjectMonitorSubscription *)objc_loadWeakRetained((id *)&self->_appProtectionSubjectMonitorSubscription);
}

- (void)setAppProtectionSubjectMonitorSubscription:(id)a3
{
  objc_storeWeak((id *)&self->_appProtectionSubjectMonitorSubscription, a3);
}

- (WFWidgetConfigurationViewController)presentedComplicationWidgetConfigurationViewController
{
  return self->_presentedComplicationWidgetConfigurationViewController;
}

- (void)setPresentedComplicationWidgetConfigurationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentedComplicationWidgetConfigurationViewController, a3);
}

- (PRComplicationDescriptor)widgetBeingConfigured
{
  return self->_widgetBeingConfigured;
}

- (void)setWidgetBeingConfigured:(id)a3
{
  objc_storeStrong((id *)&self->_widgetBeingConfigured, a3);
}

- (WFWidgetConfigurationViewController)presentedControlWidgetConfigurationViewController
{
  return self->_presentedControlWidgetConfigurationViewController;
}

- (void)setPresentedControlWidgetConfigurationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentedControlWidgetConfigurationViewController, a3);
}

- (PREditingSceneClientSettingsDiffInspector)sceneClientSettingsDiffInspector
{
  return self->_sceneClientSettingsDiffInspector;
}

- (void)setSceneClientSettingsDiffInspector:(id)a3
{
  objc_storeStrong((id *)&self->_sceneClientSettingsDiffInspector, a3);
}

- (NSHashTable)complicationContainerViewControllers
{
  return self->_complicationContainerViewControllers;
}

- (void)setComplicationContainerViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_complicationContainerViewControllers, a3);
}

- (BOOL)isAlternateDateEnabled
{
  return self->_alternateDateEnabled;
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (UIView)sidebarComplicationGallerySourceView
{
  return self->_sidebarComplicationGallerySourceView;
}

- (void)setSidebarComplicationGallerySourceView:(id)a3
{
  objc_storeStrong((id *)&self->_sidebarComplicationGallerySourceView, a3);
}

- (ATXComplicationSet)inlineComplicationSuggestionSet
{
  return self->_inlineComplicationSuggestionSet;
}

- (void)setInlineComplicationSuggestionSet:(id)a3
{
  objc_storeStrong((id *)&self->_inlineComplicationSuggestionSet, a3);
}

- (NSArray)graphicComplicationSuggestionSets
{
  return self->_graphicComplicationSuggestionSets;
}

- (void)setGraphicComplicationSuggestionSets:(id)a3
{
  objc_storeStrong((id *)&self->_graphicComplicationSuggestionSets, a3);
}

- (NSDictionary)sidebarWidgetSuggestions
{
  return self->_sidebarWidgetSuggestions;
}

- (void)setSidebarWidgetSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_sidebarWidgetSuggestions, a3);
}

- (PRComplicationDescriptor)selectedInlineComplication
{
  return self->_selectedInlineComplication;
}

- (UIViewController)presentedComplicationsGallery
{
  return self->_presentedComplicationsGallery;
}

- (void)setPresentedComplicationsGallery:(id)a3
{
  objc_storeStrong((id *)&self->_presentedComplicationsGallery, a3);
}

- (SBHPadAddSheetViewController)presentedSidebarComplicationsGallery
{
  return self->_presentedSidebarComplicationsGallery;
}

- (UINavigationController)presentedInlineComplicationsGallery
{
  return self->_presentedInlineComplicationsGallery;
}

- (void)setPresentedInlineComplicationsGallery:(id)a3
{
  objc_storeStrong((id *)&self->_presentedInlineComplicationsGallery, a3);
}

- (int64_t)selectedQuickActionPosition
{
  return self->_selectedQuickActionPosition;
}

- (int64_t)quickActionIntentEditPosition
{
  return self->_quickActionIntentEditPosition;
}

- (void)setQuickActionIntentEditPosition:(int64_t)a3
{
  self->_quickActionIntentEditPosition = a3;
}

- (CCUISControlsGalleryViewController)presentedControlsGallery
{
  return self->_presentedControlsGallery;
}

- (void)setPresentedControlsGallery:(id)a3
{
  objc_storeStrong((id *)&self->_presentedControlsGallery, a3);
}

- (CCUISConfiguredControl)controlIntentBeingConfigured
{
  return self->_controlIntentBeingConfigured;
}

- (void)setControlIntentBeingConfigured:(id)a3
{
  objc_storeStrong((id *)&self->_controlIntentBeingConfigured, a3);
}

- (CHSWidgetExtensionProvider)controlExtensionProvider
{
  return self->_controlExtensionProvider;
}

- (void)setControlExtensionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_controlExtensionProvider, a3);
}

- (PRQuickActionEditingViewController)quickActionEditingViewController
{
  return self->_quickActionEditingViewController;
}

- (void)setQuickActionEditingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_quickActionEditingViewController, a3);
}

- (PRIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (void)setListLayoutProvider:(id)a3
{
  objc_storeStrong((id *)&self->_listLayoutProvider, a3);
}

- (PRWidgetIconViewProvider)iconViewProvider
{
  return self->_iconViewProvider;
}

- (void)setIconViewProvider:(id)a3
{
  objc_storeStrong((id *)&self->_iconViewProvider, a3);
}

- (SBHIconModel)iconModel
{
  return self->_iconModel;
}

- (void)setIconModel:(id)a3
{
  objc_storeStrong((id *)&self->_iconModel, a3);
}

- (CHSWidgetExtensionProvider)widgetExtensionProvider
{
  return self->_widgetExtensionProvider;
}

- (void)setWidgetExtensionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_widgetExtensionProvider, a3);
}

- (void)setAddWidgetSheetConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_addWidgetSheetConfigurationManager, a3);
}

- (UIView)recycledViewsContainerView
{
  return self->_recycledViewsContainerView;
}

- (void)setRecycledViewsContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_recycledViewsContainerView, a3);
}

- (NSArray)presentationDismissalGestureViews
{
  return self->_presentationDismissalGestureViews;
}

- (void)setPresentationDismissalGestureViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1376);
}

- (PREditingSceneViewControllerTopButtonLayout)lastValidDelegateTopButtonLayout
{
  CGSize v3;
  CGSize v4;

  v3 = *(CGSize *)&self[25].leadingTopButtonFrame.origin.y;
  retstr->leadingTopButtonFrame.origin = *(CGPoint *)&self[24].trailingTopButtonFrame.size.height;
  retstr->leadingTopButtonFrame.size = v3;
  v4 = *(CGSize *)&self[25].trailingTopButtonFrame.origin.y;
  retstr->trailingTopButtonFrame.origin = *(CGPoint *)&self[25].leadingTopButtonFrame.size.height;
  retstr->trailingTopButtonFrame.size = v4;
  return self;
}

- (void)setLastValidDelegateTopButtonLayout:(PREditingSceneViewControllerTopButtonLayout *)a3
{
  CGSize size;
  CGSize v4;
  CGPoint origin;

  size = a3->trailingTopButtonFrame.size;
  origin = a3->leadingTopButtonFrame.origin;
  v4 = a3->leadingTopButtonFrame.size;
  self->_lastValidDelegateTopButtonLayout.trailingTopButtonFrame.origin = a3->trailingTopButtonFrame.origin;
  self->_lastValidDelegateTopButtonLayout.trailingTopButtonFrame.size = size;
  self->_lastValidDelegateTopButtonLayout.leadingTopButtonFrame.origin = origin;
  self->_lastValidDelegateTopButtonLayout.leadingTopButtonFrame.size = v4;
}

- (BOOL)isHero
{
  return self->_hero;
}

- (void)setHero:(BOOL)a3
{
  self->_hero = a3;
}

- (BOOL)isDismissing
{
  return self->_dismissing;
}

- (void)setDismissing:(BOOL)a3
{
  self->_dismissing = a3;
}

- (BOOL)isTornDown
{
  return self->_tornDown;
}

- (void)setTornDown:(BOOL)a3
{
  self->_tornDown = a3;
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return self->_vibrancyConfiguration;
}

- (UIView)inlineComplicationGestureView
{
  return self->_inlineComplicationGestureView;
}

- (void)setInlineComplicationGestureView:(id)a3
{
  objc_storeStrong((id *)&self->_inlineComplicationGestureView, a3);
}

- (UIView)complicationsAddGestureView
{
  return self->_complicationsAddGestureView;
}

- (void)setComplicationsAddGestureView:(id)a3
{
  objc_storeStrong((id *)&self->_complicationsAddGestureView, a3);
}

- (UIView)sidebarComplicationAddGestureView
{
  return self->_sidebarComplicationAddGestureView;
}

- (void)setSidebarComplicationAddGestureView:(id)a3
{
  objc_storeStrong((id *)&self->_sidebarComplicationAddGestureView, a3);
}

- (BOOL)isClientPresentingModalViewController
{
  return self->_clientPresentingModalViewController;
}

- (BOOL)isDraggingComplication
{
  return self->_draggingComplication;
}

- (int64_t)focusedElement
{
  return self->_focusedElement;
}

- (BSInvalidatable)localKeyboardFocusAssertion
{
  return self->_localKeyboardFocusAssertion;
}

- (void)setLocalKeyboardFocusAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_localKeyboardFocusAssertion, a3);
}

- (NSMutableDictionary)engagementCountsForViewedSuggestedComplications
{
  return self->_engagementCountsForViewedSuggestedComplications;
}

- (void)setEngagementCountsForViewedSuggestedComplications:(id)a3
{
  objc_storeStrong((id *)&self->_engagementCountsForViewedSuggestedComplications, a3);
}

- (PFServerPosterPath)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (NSString)posterRole
{
  return self->_posterRole;
}

- (void)setPosterRole:(id)a3
{
  objc_storeStrong((id *)&self->_posterRole, a3);
}

- (UIView)saveIndicatorContainerView
{
  return self->_saveIndicatorContainerView;
}

- (void)setSaveIndicatorContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_saveIndicatorContainerView, a3);
}

- (BOOL)hostApplicationHasResignedActive
{
  return self->_hostApplicationHasResignedActive;
}

- (void)setHostApplicationHasResignedActive:(BOOL)a3
{
  self->_hostApplicationHasResignedActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveIndicatorContainerView, 0);
  objc_storeStrong((id *)&self->_posterRole, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_engagementCountsForViewedSuggestedComplications, 0);
  objc_storeStrong((id *)&self->_localKeyboardFocusAssertion, 0);
  objc_storeStrong((id *)&self->_sidebarComplicationAddGestureView, 0);
  objc_storeStrong((id *)&self->_complicationsAddGestureView, 0);
  objc_storeStrong((id *)&self->_inlineComplicationGestureView, 0);
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_presentationDismissalGestureViews, 0);
  objc_storeStrong((id *)&self->_recycledViewsContainerView, 0);
  objc_storeStrong((id *)&self->_addWidgetSheetConfigurationManager, 0);
  objc_storeStrong((id *)&self->_widgetExtensionProvider, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_storeStrong((id *)&self->_iconViewProvider, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_quickActionEditingViewController, 0);
  objc_storeStrong((id *)&self->_controlExtensionProvider, 0);
  objc_storeStrong((id *)&self->_controlIntentBeingConfigured, 0);
  objc_storeStrong((id *)&self->_presentedControlsGallery, 0);
  objc_storeStrong((id *)&self->_presentedInlineComplicationsGallery, 0);
  objc_storeStrong((id *)&self->_presentedSidebarComplicationsGallery, 0);
  objc_storeStrong((id *)&self->_presentedComplicationsGallery, 0);
  objc_storeStrong((id *)&self->_selectedInlineComplication, 0);
  objc_storeStrong((id *)&self->_sidebarWidgetSuggestions, 0);
  objc_storeStrong((id *)&self->_graphicComplicationSuggestionSets, 0);
  objc_storeStrong((id *)&self->_inlineComplicationSuggestionSet, 0);
  objc_storeStrong((id *)&self->_sidebarComplicationGallerySourceView, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_complicationContainerViewControllers, 0);
  objc_storeStrong((id *)&self->_sceneClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_presentedControlWidgetConfigurationViewController, 0);
  objc_storeStrong((id *)&self->_widgetBeingConfigured, 0);
  objc_storeStrong((id *)&self->_presentedComplicationWidgetConfigurationViewController, 0);
  objc_destroyWeak((id *)&self->_appProtectionSubjectMonitorSubscription);
  objc_storeStrong((id *)&self->_modifications, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_widgetBeingAdded, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7_0(&dword_18B634000, v0, v1, "Error fetching complication suggestions: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_17();
}

void __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_2_171_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7_0(&dword_18B634000, v0, v1, "Error fetching inline complication suggestions: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_17();
}

void __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_2_174_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7_0(&dword_18B634000, v0, v1, "Error fetching sidebar complication suggestions: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_17();
}

void __51__PREditingSceneViewController__dismissWithAction___block_invoke_4_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18B634000, log, OS_LOG_TYPE_ERROR, "Error saving data from extension process: updatedConfiguration or updatedConfiguredProperties are nil!", v1, 2u);
}

void __51__PREditingSceneViewController__dismissWithAction___block_invoke_2_307_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  v4 = 2112;
  v5 = v0;
  v6 = 2112;
  v7 = v1;
  _os_log_error_impl(&dword_18B634000, v2, OS_LOG_TYPE_ERROR, "Error saving updated configuration %@ with properties %@: %@", v3, 0x20u);
}

void __51__PREditingSceneViewController__dismissWithAction___block_invoke_308_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_18B634000, a2, a3, "Error logging complications seen in gallery with engagements: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_17();
}

- (void)controlsGalleryViewController:(uint64_t)a3 didFinishWithResult:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_18B634000, a2, a3, "Error selecting control gallery item: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_17();
}

@end
