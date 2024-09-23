@implementation UIActivityContentViewController

- (UIActivityContentViewController)init
{
  UIActivityContentViewController *v2;
  UIActivityContentViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIActivityContentViewController;
  v2 = -[UIActivityContentViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, 0, 0);
  v3 = v2;
  if (v2)
    -[UIActivityContentViewController _configureWithContext:](v2, "_configureWithContext:", 0);
  return v3;
}

- (UIActivityContentViewController)initWithContext:(id)a3
{
  id v4;
  UIActivityContentViewController *v5;
  UIActivityContentViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIActivityContentViewController;
  v5 = -[UIActivityContentViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
    -[UIActivityContentViewController _configureWithContext:](v5, "_configureWithContext:", v4);

  return v6;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  int *v11;
  char *v12;
  __int128 v13;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  char *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[UIActivityContentViewController sandboxExtensionHandles](self, "sandboxExtensionHandles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v16;
    *(_QWORD *)&v5 = 67109378;
    v13 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "integerValue", v13);
        if (sandbox_extension_release() == -1)
        {
          share_sheet_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            v10 = *__error();
            v11 = __error();
            v12 = strerror(*v11);
            *(_DWORD *)buf = v13;
            v20 = v10;
            v21 = 2080;
            v22 = v12;
            _os_log_error_impl(&dword_19E419000, v9, OS_LOG_TYPE_ERROR, "Failed to release sandbox extension with error %d (%s)", buf, 0x12u);
          }

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v6);
  }

  v14.receiver = self;
  v14.super_class = (Class)UIActivityContentViewController;
  -[UIActivityContentViewController dealloc](&v14, sel_dealloc);
}

- (void)setHostPresentationStyle:(id)a3
{
  id v5;
  NSNumber *hostPresentationStyle;
  NSNumber *v7;
  NSNumber *v8;
  NSNumber *v9;
  char v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  SHSheetContentLayoutSpec *v15;
  void *v16;
  void *v17;
  SHSheetContentLayoutSpec *v18;
  SHSheetContentLayoutSpec *layoutSpec;
  SHSheetContentLayoutSpec *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  __int16 v32;
  NSNumber *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  hostPresentationStyle = self->_hostPresentationStyle;
  v7 = (NSNumber *)v5;
  v8 = hostPresentationStyle;
  if (v8 == v7)
  {

  }
  else
  {
    v9 = v8;
    if ((v7 == 0) != (v8 != 0))
    {
      v10 = -[NSNumber isEqual:](v7, "isEqual:", v8);

      if ((v10 & 1) != 0)
        goto LABEL_12;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_hostPresentationStyle, a3);
    share_sheet_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 138412546;
      v31 = objc_opt_class();
      v32 = 2112;
      v33 = v7;
      _os_log_impl(&dword_19E419000, v11, OS_LOG_TYPE_DEFAULT, "%@: setHostPresentationStyle:%@", (uint8_t *)&v30, 0x16u);
    }

    v12 = _ShareSheetCurrentDeviceClassFromPresentationStyle(-[UIActivityContentViewController isPresentedInPopover](self, "isPresentedInPopover"));
    -[UIActivityContentViewController layoutSpec](self, "layoutSpec");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "deviceClass");

    if (v14 != v12)
    {
      v15 = [SHSheetContentLayoutSpec alloc];
      -[UIActivityContentViewController traitCollection](self, "traitCollection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityContentViewController tintColor](self, "tintColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[SHSheetContentLayoutSpec initWithTraitCollection:tintColor:deviceClass:](v15, "initWithTraitCollection:tintColor:deviceClass:", v16, v17, v12);
      layoutSpec = self->_layoutSpec;
      self->_layoutSpec = v18;

      v20 = self->_layoutSpec;
      -[UIActivityContentViewController layoutProvider](self, "layoutProvider");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setLayoutSpec:", v20);

      -[UIActivityContentViewController peopleSuggestionImageProvider](self, "peopleSuggestionImageProvider");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSheetContentLayoutSpec peopleIconWidth](self->_layoutSpec, "peopleIconWidth");
      v24 = v23;
      -[SHSheetContentLayoutSpec peopleIconWidth](self->_layoutSpec, "peopleIconWidth");
      objc_msgSend(v22, "updateTargetSize:", v24, v25);

      -[UIActivityContentViewController activityCollectionView](self, "activityCollectionView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "reloadData");

    }
    v27 = -[UIActivityContentViewController isPresentedInPopover](self, "isPresentedInPopover") ^ 1;
    -[UIActivityContentViewController headerTitleView](self, "headerTitleView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setHasCloseButton:", v27);

    -[UIActivityContentViewController view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setNeedsLayout");

  }
LABEL_12:

}

- (int64_t)effectivePresentationStyle
{
  void *v3;
  void *v4;
  int64_t v5;

  -[UIActivityContentViewController hostPresentationStyle](self, "hostPresentationStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return SHSheetPresentationControllerPresentationStyle(self);
  -[UIActivityContentViewController hostPresentationStyle](self, "hostPresentationStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (BOOL)isPresentedInPopover
{
  return -[UIActivityContentViewController effectivePresentationStyle](self, "effectivePresentationStyle") == 7;
}

- (void)_configureWithContext:(id)a3
{
  id v4;
  BSAuditToken *v5;
  BSAuditToken *hostAuditToken;
  NSString *v7;
  NSString *topContentSectionText;
  NSArray *v9;
  NSArray *applicationActivityTypes;
  NSArray *v11;
  NSArray *heroActionActivityTypes;
  UIColor *v13;
  UIColor *tintColor;
  uint64_t v15;
  SHSheetContentLayoutSpec *v16;
  void *v17;
  void *v18;
  SHSheetContentLayoutSpec *v19;
  SHSheetContentLayoutSpec *layoutSpec;
  SHSheetContentLayoutProvider *v21;
  SHSheetContentLayoutProvider *layoutProvider;
  _UIActivityCollectionViewCompositionalLayout *v23;
  _UIActivityCollectionViewCompositionalLayout *v24;
  _UIActivityCollectionViewCompositionalLayout *activityCollectionViewLayout;
  SFUIActivityImageProvider *v26;
  SFUIActivityImageProvider *activityImageProvider;
  NSMutableDictionary *v28;
  NSMutableDictionary *identifiersToActivityImageRequestID;
  NSMutableDictionary *v30;
  NSMutableDictionary *identifiersToPeopleSuggestionImageRequestIDs;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  void *v37;
  SFUIPeopleSuggestionImageProvider *v38;
  SFUIPeopleSuggestionImageProvider *peopleSuggestionImageProvider;
  NSMutableSet *v40;
  NSMutableSet *sandboxExtensionHandles;
  double v42;
  uint64_t v43;
  uint64_t v44;
  id (*v45)(uint64_t, uint64_t, void *);
  void *v46;
  id v47;
  id location;

  v4 = a3;
  self->_isRemote = objc_msgSend(v4, "isRemote");
  objc_msgSend(v4, "hostAuditToken");
  v5 = (BSAuditToken *)objc_claimAutoreleasedReturnValue();
  hostAuditToken = self->_hostAuditToken;
  self->_hostAuditToken = v5;

  self->_canRenderPeople = objc_msgSend(v4, "canRenderPeople");
  self->_configureForCloudSharing = objc_msgSend(v4, "configureForCloudSharing");
  self->_configureForPhotosEdit = objc_msgSend(v4, "configureForPhotosEdit");
  self->_hideHeaderView = objc_msgSend(v4, "hideHeaderView");
  self->_hideNavigationBar = objc_msgSend(v4, "hideNavigationBar");
  self->_sharingExpanded = objc_msgSend(v4, "sharingExpanded");
  objc_msgSend(v4, "topContentSectionText");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  topContentSectionText = self->_topContentSectionText;
  self->_topContentSectionText = v7;

  objc_msgSend(v4, "applicationActivityTypes");
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  applicationActivityTypes = self->_applicationActivityTypes;
  self->_applicationActivityTypes = v9;

  objc_msgSend(v4, "heroActionActivityTypes");
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  heroActionActivityTypes = self->_heroActionActivityTypes;
  self->_heroActionActivityTypes = v11;

  self->_showHeroActionsHorizontally = objc_msgSend(v4, "showHeroActionsHorizontally");
  objc_msgSend(v4, "tintColor");
  v13 = (UIColor *)objc_claimAutoreleasedReturnValue();
  tintColor = self->_tintColor;
  self->_tintColor = v13;

  v15 = _ShareSheetCurrentDeviceClassFromPresentationStyle(-[UIActivityContentViewController isPresentedInPopover](self, "isPresentedInPopover"));
  v16 = [SHSheetContentLayoutSpec alloc];
  -[UIActivityContentViewController traitCollection](self, "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityContentViewController tintColor](self, "tintColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SHSheetContentLayoutSpec initWithTraitCollection:tintColor:deviceClass:](v16, "initWithTraitCollection:tintColor:deviceClass:", v17, v18, v15);
  layoutSpec = self->_layoutSpec;
  self->_layoutSpec = v19;

  v21 = -[SHSheetContentLayoutProvider initWithLayoutSpec:]([SHSheetContentLayoutProvider alloc], "initWithLayoutSpec:", self->_layoutSpec);
  layoutProvider = self->_layoutProvider;
  self->_layoutProvider = v21;

  -[SHSheetContentLayoutProvider setDelegate:](self->_layoutProvider, "setDelegate:", self);
  location = 0;
  objc_initWeak(&location, self);
  v23 = [_UIActivityCollectionViewCompositionalLayout alloc];
  v43 = MEMORY[0x1E0C809B0];
  v44 = 3221225472;
  v45 = __57__UIActivityContentViewController__configureWithContext___block_invoke;
  v46 = &unk_1E4002228;
  objc_copyWeak(&v47, &location);
  v24 = -[_UIActivityCollectionViewCompositionalLayout initWithSectionProvider:](v23, "initWithSectionProvider:", &v43);
  activityCollectionViewLayout = self->_activityCollectionViewLayout;
  self->_activityCollectionViewLayout = v24;

  v26 = (SFUIActivityImageProvider *)objc_alloc_init(getSFUIActivityImageProviderClass());
  activityImageProvider = self->_activityImageProvider;
  self->_activityImageProvider = v26;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v43, v44, v45, v46);
  v28 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  identifiersToActivityImageRequestID = self->_identifiersToActivityImageRequestID;
  self->_identifiersToActivityImageRequestID = v28;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v30 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  identifiersToPeopleSuggestionImageRequestIDs = self->_identifiersToPeopleSuggestionImageRequestIDs;
  self->_identifiersToPeopleSuggestionImageRequestIDs = v30;

  if (self->_canRenderPeople)
  {
    -[SHSheetContentLayoutSpec peopleIconWidth](self->_layoutSpec, "peopleIconWidth");
    v33 = v32;
    -[SHSheetContentLayoutSpec peopleIconWidth](self->_layoutSpec, "peopleIconWidth");
    v35 = v34;
    v36 = objc_alloc(getSFUIPeopleSuggestionImageProviderClass());
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (SFUIPeopleSuggestionImageProvider *)objc_msgSend(v36, "initWithTargetSize:layoutDirection:", objc_msgSend(v37, "userInterfaceLayoutDirection"), v33, v35);
    peopleSuggestionImageProvider = self->_peopleSuggestionImageProvider;
    self->_peopleSuggestionImageProvider = v38;

  }
  self->_headerLinkActionsNeedsUpdate = 1;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v40 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  sandboxExtensionHandles = self->_sandboxExtensionHandles;
  self->_sandboxExtensionHandles = v40;

  if (-[UIActivityContentViewController isRemote](self, "isRemote"))
  {
    if (_ShareSheetPlatformPrefersPopover())
    {
      if (-[UIActivityContentViewController modalPresentationStyle](self, "modalPresentationStyle") == 2)
        v42 = _ShareSheetFormSheetSize();
      else
        v42 = _ShareSheetPopoverSize();
    }
    else
    {
      v42 = _ShareSheetDefaultSheetSize();
    }
    -[UIActivityContentViewController setPreferredContentSize:](self, "setPreferredContentSize:", v42);
  }
  objc_destroyWeak(&v47);
  objc_destroyWeak(&location);

}

id __57__UIActivityContentViewController__configureWithContext___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;
  void *v7;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_provideLayoutForSection:environment:", a2, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (UIViewController)customViewController
{
  void *v2;
  void *v3;

  -[UIActivityContentViewController viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "customViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v3;
}

- (NSDiffableDataSourceSnapshot)currentSnapshot
{
  void *v2;
  void *v3;
  void *v4;

  -[UIActivityContentViewController dataSourceManager](self, "dataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "diffableSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDiffableDataSourceSnapshot *)v4;
}

- (SHSheetContentDataSource)dataSource
{
  void *v2;
  void *v3;

  -[UIActivityContentViewController dataSourceManager](self, "dataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SHSheetContentDataSource *)v3;
}

- (int64_t)currentSectionTypesToExclude
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  _BOOL4 v7;
  _BOOL4 v8;
  int64_t v9;
  int64_t v10;
  BOOL v11;

  -[UIActivityContentViewController customViewController](self, "customViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[UIActivityContentViewController configureForCloudSharing](self, "configureForCloudSharing");
  else
    v4 = 1;

  if (-[UIActivityContentViewController photosLandscapeMode](self, "photosLandscapeMode"))
  {
    -[UIActivityContentViewController customViewController](self, "customViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = 1;
LABEL_9:
      v7 = 1;
      goto LABEL_11;
    }
  }
  if (-[UIActivityContentViewController configureForPhotosEdit](self, "configureForPhotosEdit"))
  {
    v6 = 0;
    goto LABEL_9;
  }
  v7 = -[UIActivityContentViewController configureForCloudSharing](self, "configureForCloudSharing");
  v6 = 0;
LABEL_11:
  if (-[UIActivityContentViewController sharingExpanded](self, "sharingExpanded"))
  {
    v8 = -[UIActivityContentViewController showHeroActionsHorizontally](self, "showHeroActionsHorizontally");
    v9 = v4 | 2;
    if (!v7)
      v9 = v4;
    if (v6)
      v9 |= 0xCuLL;
    v10 = v9 | 0x10;
    v11 = !v8;
  }
  else
  {
    v9 = v4 | 2;
    if (!v7)
      v9 = v4;
    v10 = v9 | 0xC;
    v11 = v6 == 0;
  }
  if (v11)
    return v9;
  else
    return v10;
}

- (id)_provideLayoutForSection:(int64_t)a3 environment:(id)a4
{
  id v6;
  void *v7;
  SHSheetContentLayoutContext *v8;
  void *v9;
  SHSheetContentLayoutContext *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  -[UIActivityContentViewController _sectionIdentifierForIndex:](self, "_sectionIdentifierForIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [SHSheetContentLayoutContext alloc];
  -[UIActivityContentViewController currentSnapshot](self, "currentSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SHSheetContentLayoutContext initWithSectionIdentifier:dataSourceSnapshot:environment:](v8, "initWithSectionIdentifier:dataSourceSnapshot:environment:", v7, v9, v6);

  -[UIActivityContentViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "directionalLayoutMargins");
  -[SHSheetContentLayoutContext setViewDirectionalLayoutMargins:](v10, "setViewDirectionalLayoutMargins:");

  -[UIActivityContentViewController topContentSectionText](self, "topContentSectionText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContentLayoutContext setEnableTopContentSectionText:](v10, "setEnableTopContentSectionText:", v12 != 0);

  if (-[UIActivityContentViewController showHeroActionsHorizontally](self, "showHeroActionsHorizontally"))
  {
    -[UIActivityContentViewController layoutSpec](self, "layoutSpec");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetContentLayoutContext setEnableHeroActions:](v10, "setEnableHeroActions:", objc_msgSend(v13, "isAccessibilityContentSize") ^ 1);

  }
  else
  {
    -[SHSheetContentLayoutContext setEnableHeroActions:](v10, "setEnableHeroActions:", 0);
  }
  -[UIActivityContentViewController layoutProvider](self, "layoutProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutSectionForContext:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIActivityContentViewController;
  -[UIActivityContentViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[UIActivityContentViewController _configureHeaderViewIfNeeded](self, "_configureHeaderViewIfNeeded");
  -[UIActivityContentViewController _configureCollectionViewIfNeeded](self, "_configureCollectionViewIfNeeded");
  -[UIActivityContentViewController _updateCustomViewContent](self, "_updateCustomViewContent");
  -[UIActivityContentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", 0);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD);
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIActivityContentViewController;
  -[UIActivityContentViewController viewDidLayoutSubviews](&v9, sel_viewDidLayoutSubviews);
  if (_ShareSheetPlatformPrefersPopover())
  {
    if (-[UIActivityContentViewController isPresentedInPopover](self, "isPresentedInPopover"))
    {
      v3 = 0;
    }
    else
    {
      -[UIActivityContentViewController closeButton](self, "closeButton");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v4 = -[UIActivityContentViewController isCloseButtonOnLeadingEdge](self, "isCloseButtonOnLeadingEdge");
    -[UIActivityContentViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
      objc_msgSend(v5, "setLeftBarButtonItem:", v3);
    else
      objc_msgSend(v5, "setRightBarButtonItem:", v3);

  }
  if (_ShareSheetPlatformPrefersPopover()
    && -[UIActivityContentViewController configureForCloudSharing](self, "configureForCloudSharing"))
  {
    -[UIActivityContentViewController activityCollectionView](self, "activityCollectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadData");

  }
  self->_didLayout = 1;
  -[UIActivityContentViewController pendingUpdate](self, "pendingUpdate");
  v8 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  -[UIActivityContentViewController setPendingUpdate:](self, "setPendingUpdate:", 0);
  if (v8)
    v8[2](v8);

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
  v9.super_class = (Class)UIActivityContentViewController;
  v7 = a4;
  -[UIActivityContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__UIActivityContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E4002250;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

uint64_t __86__UIActivityContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCustomViewContent");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  int IsAccessibilityCategory;
  void *v12;
  NSString *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  objc_super v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)UIActivityContentViewController;
  -[UIActivityContentViewController traitCollectionDidChange:](&v26, sel_traitCollectionDidChange_, v4);
  -[UIActivityContentViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityContentViewController layoutSpec](self, "layoutSpec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTraitCollection:", v5);

  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityContentViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredContentSizeCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v9)
  {
    v18 = 0;
  }
  else
  {
    -[UIActivityContentViewController _updateHeaderSize](self, "_updateHeaderSize");
    objc_msgSend(v4, "preferredContentSizeCategory");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);
    -[UIActivityContentViewController traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferredContentSizeCategory");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = UIContentSizeCategoryIsAccessibilityCategory(v13);

    -[UIActivityContentViewController currentSnapshot](self, "currentSnapshot");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sectionIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", CFSTR("SHSheetContentHeroActionsSectionIdentifier"));

    v18 = 0;
    if (IsAccessibilityCategory != v14 && v17)
    {
      -[UIActivityContentViewController currentSnapshot](self, "currentSnapshot");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = CFSTR("SHSheetContentHeroActionsSectionIdentifier");
      v18 = 1;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "reloadSectionsWithIdentifiers:", v20);

    }
  }
  v21 = objc_msgSend(v4, "userInterfaceStyle");
  -[UIActivityContentViewController traitCollection](self, "traitCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "userInterfaceStyle");

  if (v21 == v23)
  {
    if (v18)
    {
      -[UIActivityContentViewController diffableDataSource](self, "diffableDataSource");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityContentViewController currentSnapshot](self, "currentSnapshot");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "applySnapshot:animatingDifferences:", v25, 0);

    }
  }
  else
  {
    -[UIActivityContentViewController reloadContent](self, "reloadContent");
  }

}

- (void)_updateHeaderMetadataValues
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[UIActivityContentViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadataValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIActivityContentViewController headerLinkView](self, "headerLinkView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v4, "count"))
  {
    share_sheet_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_19E419000, v6, OS_LOG_TYPE_DEFAULT, "update link view metadata values:%@", (uint8_t *)&v11, 0xCu);
    }

    -[UIActivityContentViewController headerLinkView](self, "headerLinkView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setMultipleMetadata:", v4);

    -[UIActivityContentViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[UIActivityContentViewController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "activityContentViewControllerDidUpdateHeaderMetadata:", self);

    }
  }

}

- (void)linkView:(id)a3 didFetchMetadata:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  share_sheet_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_19E419000, v6, OS_LOG_TYPE_DEFAULT, "link view did fetch metadata:%@", (uint8_t *)&v10, 0xCu);
  }

  -[UIActivityContentViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[UIActivityContentViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activityContentViewControllerDidUpdateHeaderMetadata:", self);

  }
}

- (id)_createLinkView
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
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

  -[UIActivityContentViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadataValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count")
    || (-[UIActivityContentViewController viewModel](self, "viewModel"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isLoadingMetadata"),
        v5,
        v6))
  {
    v7 = (void *)objc_msgSend(objc_alloc(getLPLinkViewClass()), "_initWithMultipleMetadata:", v4);
  }
  else
  {
    -[UIActivityContentViewController viewModel](self, "viewModel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "urlRequests");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(getLPLinkViewClass()), "_initWithMetadataLoadedFromRequests:", v19);
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  objc_msgSend(v7, "setPreservesSuperviewLayoutMargins:", 1);
  objc_msgSend(v7, "_setDisableTapGesture:", 1);
  objc_msgSend(v7, "_setDisableAnimations:", 1);
  objc_msgSend(v7, "setMaskView:", 0);
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v4, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sourceApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sourceApplication");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setSourceBundleIdentifier:", v14);

LABEL_11:
    goto LABEL_12;
  }
  -[UIActivityContentViewController hostAuditToken](self, "hostAuditToken");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[UIActivityContentViewController hostAuditToken](self, "hostAuditToken", 0, 0, 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      objc_msgSend(v16, "realToken");

    _ShareSheetBundleIDFromAuditToken();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setSourceBundleIdentifier:", v12);
    goto LABEL_11;
  }
LABEL_12:

  return v7;
}

- (void)_configureHeaderViewIfNeeded
{
  _UIActivityContentTitleView *v3;
  void *v4;
  uint64_t v5;
  _UIActivityContentTitleView *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _UIActivityContentTitleView *v35;

  -[UIActivityContentViewController viewModel](self, "viewModel");
  v3 = (_UIActivityContentTitleView *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v35 = v3;
    if (!-[UIActivityContentViewController configureForCloudSharing](self, "configureForCloudSharing"))
    {
      -[UIActivityContentViewController headerLinkView](self, "headerLinkView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
        return;
      v5 = -[UIActivityContentViewController hideHeaderView](self, "hideHeaderView");
      v6 = [_UIActivityContentTitleView alloc];
      v35 = -[_UINavigationBarTitleView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[_UIActivityContentTitleView setPreservesSuperviewLayoutMargins:](v35, "setPreservesSuperviewLayoutMargins:", 1);
      -[_UINavigationBarTitleView setTranslatesAutoresizingMaskIntoConstraints:](v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIActivityContentViewController customViewController](self, "customViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v7
         && (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
             v8 = (void *)objc_claimAutoreleasedReturnValue(),
             v9 = objc_msgSend(v8, "userInterfaceIdiom"),
             v8,
             (v9 & 0xFFFFFFFFFFFFFFFBLL) != 1)
         && (unint64_t)(objc_msgSend((id)*MEMORY[0x1E0DC4730], "activeInterfaceOrientation") - 3) < 0xFFFFFFFFFFFFFFFELL;
      -[_UIActivityContentTitleView setPhotosCarouselMode:](v35, "setPhotosCarouselMode:", v10);

      -[UIActivityContentViewController viewModel](self, "viewModel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIActivityContentTitleView setCustomButtonMode:](v35, "setCustomButtonMode:", objc_msgSend(v11, "showCustomHeaderButton"));

      -[_UIActivityContentTitleView setHasCloseButton:](v35, "setHasCloseButton:", -[UIActivityContentViewController isPresentedInPopover](self, "isPresentedInPopover") ^ 1);
      -[_UIActivityContentTitleView setIsCloseButtonOnLeadingEdge:](v35, "setIsCloseButtonOnLeadingEdge:", -[UIActivityContentViewController isCloseButtonOnLeadingEdge](self, "isCloseButtonOnLeadingEdge"));
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIActivityContentTitleView setBackgroundColor:](v35, "setBackgroundColor:", v12);

      if ((v5 & 1) == 0)
      {
        -[UIActivityContentViewController _createLinkView](self, "_createLinkView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIActivityContentViewController setHeaderTitleView:](self, "setHeaderTitleView:", v35);
        objc_msgSend(v13, "metadata");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIActivityContentViewController navigationItem](self, "navigationItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setTitle:", v15);

        -[UIActivityContentViewController navigationItem](self, "navigationItem");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setTitleView:", v35);

        -[UIActivityContentViewController setHeaderLinkView:](self, "setHeaderLinkView:", v13);
        -[UIActivityContentViewController headerTitleView](self, "headerTitleView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setLinkView:", v13);

        -[UIActivityContentViewController _updateHeaderLinkViewSizeClass](self, "_updateHeaderLinkViewSizeClass");
        -[UIActivityContentViewController _updateHeaderMetadataValues](self, "_updateHeaderMetadataValues");

      }
      v19 = objc_alloc(MEMORY[0x1E0DC34F0]);
      -[UIActivityContentViewController presenter](self, "presenter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v19, "initWithBarButtonSystemItem:target:action:", 24, v20, sel_handleClose);
      -[UIActivityContentViewController setCloseButton:](self, "setCloseButton:", v21);

      v22 = -[UIActivityContentViewController isCloseButtonOnLeadingEdge](self, "isCloseButtonOnLeadingEdge");
      -[UIActivityContentViewController closeButton](self, "closeButton");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityContentViewController navigationItem](self, "navigationItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v22)
        objc_msgSend(v24, "setLeftBarButtonItem:", v23);
      else
        objc_msgSend(v24, "setRightBarButtonItem:", v23);

      -[UIActivityContentViewController navigationItem](self, "navigationItem");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "_setManualScrollEdgeAppearanceEnabled:", 1);

      if ((v5 & 1) != 0)
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
      objc_msgSend(v28, "configureWithTransparentBackground");
      objc_msgSend(v28, "setShadowColor:", v27);
      -[UIActivityContentViewController navigationItem](self, "navigationItem");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setScrollEdgeAppearance:", v28);

      if ((v5 & 1) != 0)
      {
        -[UIActivityContentViewController navigationItem](self, "navigationItem");
        v30 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setStandardAppearance:", v28);
      }
      else
      {
        v30 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
        objc_msgSend(v30, "configureWithDefaultBackground");
        objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setShadowColor:", v31);

        -[UIActivityContentViewController navigationItem](self, "navigationItem");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setStandardAppearance:", v30);

      }
      -[UIActivityContentViewController navigationItem](self, "navigationItem");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "_setManualScrollEdgeAppearanceProgress:", 0.0);

      if (-[UIActivityContentViewController hideNavigationBar](self, "hideNavigationBar"))
      {
        -[UIActivityContentViewController navigationController](self, "navigationController");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setNavigationBarHidden:", 1);

      }
    }
    v3 = v35;
  }

}

- (void)linkViewNeedsResize:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[UIActivityContentViewController headerTitleView](self, "headerTitleView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsUpdateConstraints");

  -[UIActivityContentViewController headerTitleView](self, "headerTitleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

  -[UIActivityContentViewController activityCollectionView](self, "activityCollectionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsUpdateConstraints");

}

- (void)_configureCollectionViewIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _UIActivityContentCollectionView *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  _UIActivityContentCollectionView *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
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
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;
  id location;

  -[UIActivityContentViewController activityCollectionView](self, "activityCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else if ((-[UIActivityContentViewController isViewLoaded](self, "isViewLoaded") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityContentViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

    -[UIActivityContentViewController traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if (v7 <= 1 && !-[UIActivityContentViewController configureForCloudSharing](self, "configureForCloudSharing"))
    {
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v8);
      -[UIActivityContentViewController setBackgroundView:](self, "setBackgroundView:", v9);
      -[UIActivityContentViewController backgroundView](self, "backgroundView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[UIActivityContentViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityContentViewController backgroundView](self, "backgroundView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", v12);

    }
    v13 = [_UIActivityContentCollectionView alloc];
    -[UIActivityContentViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[UIActivityContentViewController activityCollectionViewLayout](self, "activityCollectionViewLayout");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[_UIActivityContentCollectionView initWithFrame:collectionViewLayout:](v13, "initWithFrame:collectionViewLayout:", v23, v16, v18, v20, v22);

    -[UIActivityContentViewController setActivityCollectionView:](self, "setActivityCollectionView:", v24);
    -[_UIActivityContentCollectionView setDelegate:](v24, "setDelegate:", self);
    -[_UIActivityContentCollectionView setPrefetchDataSource:](v24, "setPrefetchDataSource:", self);
    -[_UIActivityContentCollectionView setDelaysContentTouches:](v24, "setDelaysContentTouches:", 0);
    -[_UIActivityContentCollectionView setTranslatesAutoresizingMaskIntoConstraints:](v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UIActivityContentCollectionView registerClass:forCellWithReuseIdentifier:](v24, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("UIActivityContentCustomViewCellIdentifier"));
    -[_UIActivityContentCollectionView registerClass:forCellWithReuseIdentifier:](v24, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("UIActivityContentShareCellIdentifier"));
    -[_UIActivityContentCollectionView registerClass:forCellWithReuseIdentifier:](v24, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("UIActivityContentMagicHeadCellIdentifier"));
    -[_UIActivityContentCollectionView registerClass:forCellWithReuseIdentifier:](v24, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("UIActivityContentAirDropCellIdentifier"));
    -[_UIActivityContentCollectionView registerClass:forCellWithReuseIdentifier:](v24, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("UIActivityContentHeroActionCellIdentifier"));
    -[_UIActivityContentCollectionView registerClass:forCellWithReuseIdentifier:](v24, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("UIActivityContentActionCellIdentifier"));
    -[_UIActivityContentCollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v24, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("UIActivityContentHeaderSectionKind"), CFSTR("UIActivityContentHeaderViewIdentifier"));
    -[_UIActivityContentCollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v24, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("UIActivityContentFooterSectionKind"), CFSTR("UIActivityContentEditViewIdentifier"));
    -[_UIActivityContentCollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v24, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("UIActivityContentFooterSectionKind"), CFSTR("UIActivityContentFooterViewIdentifier"));
    -[_UIActivityContentCollectionView registerClass:forSupplementaryViewOfKind:withReuseIdentifier:](v24, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), CFSTR("UIActivityContentFooterSectionKind"), CFSTR("UIActivityContentInformationalActionFooterViewIdentifier"));
    -[_UIActivityContentCollectionView setBackgroundColor:](v24, "setBackgroundColor:", 0);
    -[_UIActivityContentCollectionView setAlwaysBounceVertical:](v24, "setAlwaysBounceVertical:", 1);
    -[_UIActivityContentCollectionView setShowsVerticalScrollIndicator:](v24, "setShowsVerticalScrollIndicator:", 0);
    -[_UIActivityContentCollectionView setShowsHorizontalScrollIndicator:](v24, "setShowsHorizontalScrollIndicator:", 0);
    -[_UIActivityContentCollectionView setContentInsetAdjustmentBehavior:](v24, "setContentInsetAdjustmentBehavior:", 1);
    -[_UIActivityContentCollectionView _setVisibleRectEdgeInsets:](v24, "_setVisibleRectEdgeInsets:", 0.0, 0.0, -400.0, 0.0);
    if ((dyld_program_sdk_at_least() & 1) == 0)
      -[_UIActivityContentCollectionView setContentInset:](v24, "setContentInset:", 72.0, 0.0, 0.0, 0.0);
    -[UIActivityContentViewController view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v24);

    location = 0;
    objc_initWeak(&location, self);
    v26 = objc_alloc(MEMORY[0x1E0DC35E8]);
    -[UIActivityContentViewController activityCollectionView](self, "activityCollectionView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = MEMORY[0x1E0C809B0];
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __67__UIActivityContentViewController__configureCollectionViewIfNeeded__block_invoke;
    v71[3] = &unk_1E4002278;
    objc_copyWeak(&v72, &location);
    v29 = (void *)objc_msgSend(v26, "initWithCollectionView:cellProvider:", v27, v71);
    -[UIActivityContentViewController setDiffableDataSource:](self, "setDiffableDataSource:", v29);

    v69[0] = v28;
    v69[1] = 3221225472;
    v69[2] = __67__UIActivityContentViewController__configureCollectionViewIfNeeded__block_invoke_2;
    v69[3] = &unk_1E40022A0;
    objc_copyWeak(&v70, &location);
    -[UIActivityContentViewController diffableDataSource](self, "diffableDataSource");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setSupplementaryViewProvider:", v69);

    v31 = (void *)objc_opt_new();
    -[UIActivityContentViewController backgroundView](self, "backgroundView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      -[UIActivityContentViewController backgroundView](self, "backgroundView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "leadingAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityContentViewController view](self, "view");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "leadingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToAnchor:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObject:", v37);

      -[UIActivityContentViewController backgroundView](self, "backgroundView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "trailingAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityContentViewController view](self, "view");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "trailingAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "constraintEqualToAnchor:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObject:", v42);

      -[UIActivityContentViewController backgroundView](self, "backgroundView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "topAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityContentViewController view](self, "view");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "topAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "constraintEqualToAnchor:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObject:", v47);

      -[UIActivityContentViewController backgroundView](self, "backgroundView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "bottomAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityContentViewController view](self, "view");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "bottomAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "constraintEqualToAnchor:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObject:", v52);

    }
    -[_UIActivityContentCollectionView leadingAnchor](v24, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityContentViewController view](self, "view");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "leadingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObject:", v56);

    -[_UIActivityContentCollectionView trailingAnchor](v24, "trailingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityContentViewController view](self, "view");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "trailingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObject:", v60);

    -[_UIActivityContentCollectionView topAnchor](v24, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityContentViewController view](self, "view");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "topAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObject:", v64);

    -[_UIActivityContentCollectionView bottomAnchor](v24, "bottomAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityContentViewController view](self, "view");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "bottomAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:", v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObject:", v68);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v31);
    objc_destroyWeak(&v70);
    objc_destroyWeak(&v72);
    objc_destroyWeak(&location);

  }
}

id __67__UIActivityContentViewController__configureCollectionViewIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_provideCellForCollectionView:indexPath:itemIdentifier:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __67__UIActivityContentViewController__configureCollectionViewIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_provideSupplementaryViewForCollectionView:kind:indexPath:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_configureMagicHeadCell:(id)a3 withProxy:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityContentViewController _configurePeopleCell:itemIdentifier:](self, "_configurePeopleCell:itemIdentifier:", v6, v7);

  share_sheet_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subtitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v9;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_19E419000, v8, OS_LOG_TYPE_DEFAULT, "_configureMagicHeadCell: displayName:%@ subtitle:%@", (uint8_t *)&v11, 0x16u);

  }
}

- (void)_configureAirDropCell:(id)a3 withChange:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "displayName");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "status");
  v8 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412290;
    v21 = v6;
    _os_log_impl(&dword_19E419000, v9, OS_LOG_TYPE_DEFAULT, "configure AirDrop cell with change:%@", (uint8_t *)&v20, 0xCu);
  }

  if (v7 | v8)
  {
    v10 = objc_msgSend(v6, "state");
    objc_msgSend(v6, "progress");
    objc_msgSend(v5, "setProgress:animated:", v10 != 5, v11 / 100.0);
    v12 = objc_msgSend((id)v7, "slotIdentifier");
    v13 = objc_msgSend((id)v8, "slotIdentifier");
    objc_msgSend((id)v7, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisplayName:", v14);

    objc_msgSend(v5, "setTextSlotID:", v12);
    objc_msgSend((id)v8, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSubtitle:", v15);

    objc_msgSend(v5, "setSubtitleSlotID:", v13);
    if ((unint64_t)(v10 - 5) > 1)
    {
      if (v10 == 4)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setSubtitleTextColor:", v16);
        goto LABEL_13;
      }
      v16 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "setSubtitleTextColor:", v16);
    if ((unint64_t)(v10 - 1) <= 1)
    {
      objc_msgSend(v5, "startPulsing");
LABEL_14:
      share_sheet_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "displayName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "subtitle");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412546;
        v21 = v18;
        v22 = 2112;
        v23 = v19;
        _os_log_impl(&dword_19E419000, v17, OS_LOG_TYPE_DEFAULT, "did update airdrop cell with displayName:%@ subtitle:%@", (uint8_t *)&v20, 0x16u);

      }
      goto LABEL_17;
    }
LABEL_13:
    objc_msgSend(v5, "stopPulsing");
    goto LABEL_14;
  }
  objc_msgSend(v5, "stopPulsing");
  share_sheet_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    -[UIActivityContentViewController _configureAirDropCell:withChange:].cold.1();
LABEL_17:

}

- (void)_configurePeopleCell:(id)a3 itemIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
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
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setStateBeingRestored:", 1);
  -[UIActivityContentViewController dataSourceManager](self, "dataSourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "peopleProxyForIdentifier:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v9, "airDropProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  share_sheet_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v10;
    _os_log_impl(&dword_19E419000, v11, OS_LOG_TYPE_DEFAULT, "configure people cell for proxy:%@", buf, 0xCu);
  }

  objc_msgSend(v10, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNode:", v10);
  -[UIActivityContentViewController activeAirDropTransferChange](self, "activeAirDropTransferChange");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "proxyIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "isEqual:", v14);

  if (v15)
  {
    -[UIActivityContentViewController _configureAirDropCell:withChange:](self, "_configureAirDropCell:withChange:", v6, v13);
  }
  else
  {
    v16 = objc_msgSend(v10, "isPlaceholder");
    objc_msgSend(v6, "setIdentifier:", v12);
    objc_msgSend(v6, "setImageSlotID:", objc_msgSend(v10, "avatarImageSlotID"));
    objc_msgSend(v6, "setTransportSlotID:", objc_msgSend(v10, "transportImageSlotID"));
    objc_msgSend(v10, "displayName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextSlotID:", objc_msgSend(v17, "slotIdentifier"));

    objc_msgSend(v10, "subtitle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSubtitleSlotID:", objc_msgSend(v18, "slotIdentifier"));

    objc_msgSend(v10, "displayName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "text");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDisplayName:", v20);

    objc_msgSend(v10, "subtitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "text");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSubtitle:", v22);

    objc_msgSend(v6, "setDisabled:", objc_msgSend(v10, "isDisabled"));
    objc_msgSend(v6, "setLongPressable:", 1);
    objc_msgSend(v10, "peopleSuggestion");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIsGroup:", objc_msgSend(v23, "isGroup"));
    if (!v23 || (v16 & 1) != 0)
    {
      objc_msgSend(v6, "setImage:", 0);
      objc_msgSend(v6, "setTransportImage:", 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "isTapToRadar"))
      {
        v24 = (void *)MEMORY[0x1E0DC3870];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "imageNamed:inBundle:", CFSTR("FramedBugIcon"), v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "setImage:", v26);
        v27 = v37;
      }
      else
      {
        -[UIActivityContentViewController peopleSuggestionImageProvider](self, "peopleSuggestionImageProvider");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __71__UIActivityContentViewController__configurePeopleCell_itemIdentifier___block_invoke;
        v41[3] = &unk_1E4001480;
        v36 = v6;
        v42 = v36;
        v35 = v12;
        v43 = v35;
        v29 = objc_msgSend(v28, "requestAvatarImageForPeopleSuggestion:resultHandler:", v23, v41);

        if ((_DWORD)v29)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addObject:", v30);

        }
        -[UIActivityContentViewController peopleSuggestionImageProvider](self, "peopleSuggestionImageProvider");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __71__UIActivityContentViewController__configurePeopleCell_itemIdentifier___block_invoke_2;
        v38[3] = &unk_1E4001480;
        v39 = v36;
        v40 = v35;
        v32 = objc_msgSend(v31, "requestTransportImageForPeopleSuggestion:resultHandler:", v23, v38);

        v27 = v37;
        if ((_DWORD)v32)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addObject:", v33);

        }
        v26 = v42;
      }

      -[UIActivityContentViewController identifiersToPeopleSuggestionImageRequestIDs](self, "identifiersToPeopleSuggestionImageRequestIDs");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v27, v7);

    }
  }
  objc_msgSend(v6, "setStateBeingRestored:", 0);

}

void __71__UIActivityContentViewController__configurePeopleCell_itemIdentifier___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  v7 = a4;
  if (v10)
  {
    if ((a3 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 40));

      if (v9)
        objc_msgSend(*(id *)(a1 + 32), "setImage:", v10);
    }
  }

}

void __71__UIActivityContentViewController__configurePeopleCell_itemIdentifier___block_invoke_2(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  v7 = a4;
  if (v10)
  {
    if ((a3 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 40));

      if (v9)
        objc_msgSend(*(id *)(a1 + 32), "setTransportImage:", v10);
    }
  }

}

- (void)_configureSharingAppCell:(id)a3 itemIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[UIActivityContentViewController dataSourceManager](self, "dataSourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "activityForIdentifier:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v9;
  objc_msgSend(v9, "shareProxyForIdentifier:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v49 = v10;
    v50 = 2112;
    v51 = v11;
    _os_log_impl(&dword_19E419000, v12, OS_LOG_TYPE_DEFAULT, "configure sharing cell for activity:%@ proxy:%@", buf, 0x16u);
  }

  objc_msgSend(v10, "activityType");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "activityTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "text");
  v15 = objc_claimAutoreleasedReturnValue();

  if (v10 && !v15)
  {
    -[UIActivityContentViewController presenter](self, "presenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activityType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "customTitleForActivityType:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = v18;
    }
    else
    {
      objc_msgSend(v10, "activityTitle");
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = (uint64_t)v20;

  }
  if ((objc_msgSend(v11, "isUserDefaultsActivity") & 1) != 0)
    v21 = 0;
  else
    v21 = objc_msgSend(v11, "isDisabled") ^ 1;
  objc_msgSend(v6, "setIdentifier:", v7);
  objc_msgSend(v6, "setActivityProxy:", v11);
  objc_msgSend(v6, "setTitle:", v15);
  objc_msgSend(v6, "setImageSlotID:", objc_msgSend(v11, "iconImageSlotID"));
  objc_msgSend(v11, "activityTitle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitleSlotID:", objc_msgSend(v22, "slotIdentifier"));

  if (v13 == CFSTR("com.apple.UIKit.activity.AirDrop"))
    v23 = objc_msgSend(v41, "nearbyCountSlotID");
  else
    v23 = 0;
  objc_msgSend(v6, "setBadgeSlotID:", v23);
  objc_msgSend(v6, "setLongPressable:", v21);
  objc_msgSend(v6, "setDisabled:", objc_msgSend(v11, "isDisabled"));
  -[UIActivityContentViewController layoutSpec](self, "layoutSpec");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "traitCollection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "preferredContentSizeCategory");
  v26 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "applicationBundleIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v15;
  if (objc_msgSend(v11, "iconImageSlotID"))
  {
    v28 = (void *)v26;
    objc_msgSend(v6, "setImage:", 0, v39);
LABEL_17:
    v29 = 0;
    goto LABEL_23;
  }
  if (v27)
  {
    -[UIActivityContentViewController activityImageProvider](self, "activityImageProvider", v15);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __75__UIActivityContentViewController__configureSharingAppCell_itemIdentifier___block_invoke;
    v45[3] = &unk_1E4001480;
    v46 = v6;
    v47 = v7;
    v28 = (void *)v26;
    v29 = objc_msgSend(v30, "requestImageForBundleIdentifier:activityCategory:contentSizeCategory:iconFormat:synchronous:resultHandler:", v27, 1, v26, 10, 0, v45);

    v31 = v46;
  }
  else
  {
    if (!v10)
    {
      objc_msgSend(v6, "setImage:", 0, v15);
      share_sheet_log();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        -[UIActivityContentViewController _configureSharingAppCell:itemIdentifier:].cold.1();
      v28 = (void *)v26;

      goto LABEL_17;
    }
    -[UIActivityContentViewController activityImageProvider](self, "activityImageProvider", v15);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __75__UIActivityContentViewController__configureSharingAppCell_itemIdentifier___block_invoke_2;
    v42[3] = &unk_1E4001480;
    v43 = v6;
    v44 = v7;
    v28 = (void *)v26;
    v29 = objc_msgSend(v32, "requestImageForActivity:contentSizeCategory:imageSymbolConfiguration:synchronous:resultHandler:", v10, v26, 0, 0, v42);

    v31 = v43;
  }

LABEL_23:
  -[UIActivityContentViewController pulsingActivityIdentifier](self, "pulsingActivityIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "isEqual:", v7);

  if (v34)
  {
    -[UIActivityContentViewController pulsingLocalizedTitle](self, "pulsingLocalizedTitle");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v35);

    objc_msgSend(v6, "startPulsing");
  }
  if ((_DWORD)v29)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v29);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityContentViewController identifiersToActivityImageRequestID](self, "identifiersToActivityImageRequestID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v36, v7);

  }
}

void __75__UIActivityContentViewController__configureSharingAppCell_itemIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "setImage:", v5);

}

void __75__UIActivityContentViewController__configureSharingAppCell_itemIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "setImage:", v5);

}

- (void)_configureHeroActionCell:(id)a3 itemIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[UIActivityContentViewController dataSourceManager](self, "dataSourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "activityForIdentifier:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDisabled:", objc_msgSend(v10, "_isDisabled"));
  -[UIActivityContentViewController _activityTitleForHeroActionActivity:](self, "_activityTitleForHeroActionActivity:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  share_sheet_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412290;
    v23 = v10;
    _os_log_impl(&dword_19E419000, v13, OS_LOG_TYPE_DEFAULT, "configure hero action cell for activity:%@", (uint8_t *)&v22, 0xCu);
  }

  objc_msgSend(v10, "_systemImageName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v10, "_systemImageName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_systemImageNamed:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityContentViewController layoutSpec](self, "layoutSpec");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activityImageSymbolConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "imageByApplyingSymbolConfiguration:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v10, "_actionImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "imageWithRenderingMode:", 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v6, "activityImageView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setImage:", v20);

}

- (void)_configureActionCell:(id)a3 itemIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id *v40;
  id *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  unint64_t v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  UIActivityContentViewController *v69;
  _QWORD v70[4];
  id v71;
  id v72;
  _QWORD v73[4];
  id v74;
  id v75;
  uint8_t buf[4];
  uint64_t v77;
  __int16 v78;
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v69 = self;
  -[UIActivityContentViewController dataSourceManager](self, "dataSourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "activityForIdentifier:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v9;
  objc_msgSend(v9, "actionProxyForIdentifier:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v77 = (uint64_t)v10;
    v78 = 2112;
    v79 = v11;
    _os_log_impl(&dword_19E419000, v12, OS_LOG_TYPE_DEFAULT, "configure action cell for activity:%@ proxy:%@", buf, 0x16u);
  }

  v13 = objc_msgSend((id)objc_opt_class(), "_activityStyle");
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0DC3E88];
  -[UIActivityContentViewController traitCollection](v69, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "traitCollectionWithUserInterfaceStyle:", objc_msgSend(v16, "userInterfaceStyle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resolvedColorWithTraitCollection:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = v18;
  }
  v20 = v18;
  v65 = v19;
  objc_msgSend(v6, "setIdentifier:", v7);
  objc_msgSend(v6, "setActivityProxy:", v11);
  objc_msgSend(v11, "activityTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "slotTextHeight");
  objc_msgSend(v6, "setPlatterTextHeight:");

  objc_msgSend(v11, "activityTitle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "text");
  v23 = objc_claimAutoreleasedReturnValue();

  if (v10 && !v23)
  {
    -[UIActivityContentViewController heroActionActivityTypes](v69, "heroActionActivityTypes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activityType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "containsObject:", v25);

    if (v26)
    {
      -[UIActivityContentViewController _activityTitleForHeroActionActivity:](v69, "_activityTitleForHeroActionActivity:", v10);
      v27 = objc_claimAutoreleasedReturnValue();
      share_sheet_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v27;
        v77 = v27;
        _os_log_impl(&dword_19E419000, v28, OS_LOG_TYPE_DEFAULT, "hero action title:%@", buf, 0xCu);
      }
      else
      {
        v29 = v27;
      }
    }
    else
    {
      -[UIActivityContentViewController presenter](v69, "presenter");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "activityType");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "customTitleForActivityType:", v31);
      v28 = objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        v28 = v28;
        share_sheet_log();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v77 = (uint64_t)v28;
          _os_log_impl(&dword_19E419000, v32, OS_LOG_TYPE_DEFAULT, "custom action title:%@", buf, 0xCu);
        }

        v29 = (uint64_t)v28;
      }
      else
      {
        objc_msgSend(v10, "activityTitle");
        v29 = objc_claimAutoreleasedReturnValue();
      }
    }

    v23 = v29;
  }
  v66 = (void *)v23;
  objc_msgSend(v6, "setTitle:", v23);
  -[UIActivityContentViewController layoutSpec](v69, "layoutSpec");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "traitCollection");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "preferredContentSizeCategory");
  v35 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "applicationBundleIdentifier");
  v36 = objc_claimAutoreleasedReturnValue();
  v68 = v7;
  v63 = (void *)v36;
  v64 = (void *)v35;
  if (v36)
  {
    v37 = v36;
    v62 = v18;
    -[UIActivityContentViewController activityImageProvider](v69, "activityImageProvider");
    v38 = v35;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __71__UIActivityContentViewController__configureActionCell_itemIdentifier___block_invoke;
    v73[3] = &unk_1E4001480;
    v40 = &v74;
    v74 = v6;
    v41 = &v75;
    v75 = v7;
    v42 = objc_msgSend(v39, "requestImageForBundleIdentifier:activityCategory:contentSizeCategory:iconFormat:synchronous:resultHandler:", v37, 0, v38, 10, 0, v73);
  }
  else
  {
    if (!v10)
    {
      objc_msgSend(v6, "setImage:", 0);
      goto LABEL_25;
    }
    v62 = v18;
    -[UIActivityContentViewController activityImageProvider](v69, "activityImageProvider");
    v43 = v35;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityContentViewController layoutSpec](v69, "layoutSpec");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "activityImageSymbolConfiguration");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __71__UIActivityContentViewController__configureActionCell_itemIdentifier___block_invoke_2;
    v70[3] = &unk_1E4001480;
    v40 = &v71;
    v71 = v6;
    v41 = &v72;
    v72 = v68;
    v42 = objc_msgSend(v39, "requestImageForActivity:contentSizeCategory:imageSymbolConfiguration:synchronous:resultHandler:", v10, v43, v45, 0, v70);

    v7 = v68;
  }

  v20 = v62;
  if ((_DWORD)v42)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v42);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityContentViewController identifiersToActivityImageRequestID](v69, "identifiersToActivityImageRequestID");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKeyedSubscript:", v46, v7);

  }
LABEL_25:
  objc_msgSend(v6, "setContentTintColor:", v65);
  if ((objc_msgSend(v10, "_isDisabled") & 1) != 0)
    v48 = 1;
  else
    v48 = objc_msgSend(v11, "isDisabled");
  objc_msgSend(v6, "setDisabled:", v48);
  objc_msgSend(v10, "_activitySubtitle");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSubtitle:", v49);

  objc_msgSend(v10, "_activityStatusImage");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStatusImage:", v50);

  objc_msgSend(v6, "setImageSlotID:", objc_msgSend(v11, "iconImageSlotID"));
  objc_msgSend(v11, "activityTitle");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitleSlotID:", objc_msgSend(v51, "slotIdentifier"));

  objc_msgSend(v10, "_activityStatusTintColor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStatusImageTintColor:", v52);

  objc_msgSend(v10, "_activityBadgeText");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_activityBadgeTextColor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54;
  if (v54)
  {
    v56 = v54;
    v57 = 0x1E0DC3000;
  }
  else
  {
    v57 = 0x1E0DC3000uLL;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v56 = (id)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v10, "_activityBadgeColor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v58;
  if (v58)
  {
    v60 = v58;
  }
  else
  {
    objc_msgSend(*(id *)(v57 + 1624), "systemRedColor");
    v60 = (id)objc_claimAutoreleasedReturnValue();
  }
  v61 = v60;

  objc_msgSend(v6, "setBadgeText:textColor:backgroundColor:", v53, v56, v61);
}

void __71__UIActivityContentViewController__configureActionCell_itemIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "setImage:", v5);

}

void __71__UIActivityContentViewController__configureActionCell_itemIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "setImage:", v5);

}

- (id)_provideCellForCollectionView:(id)a3 indexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UIActivityContentViewController currentSnapshot](self, "currentSnapshot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionIdentifierForSectionContainingItemIdentifier:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIActivityContentViewController dataSourceManager](self, "dataSourceManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIActivityContentViewController layoutSpec](self, "layoutSpec");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (objc_msgSend(v15, "isAccessibilityContentSize") & 1) == 0
     && -[UIActivityContentViewController showHeroActionsHorizontally](self, "showHeroActionsHorizontally");

  share_sheet_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[UIActivityContentViewController _provideCellForCollectionView:indexPath:itemIdentifier:].cold.1();

  if (objc_msgSend(v12, "isEqualToString:", CFSTR("SHSheetContentCustomViewSectionIdentifier")))
  {
    objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("UIActivityContentCustomViewCellIdentifier"), v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v12, "isEqualToString:", CFSTR("SHSheetContentPeopleSectionIdentifier")))
  {
    objc_msgSend(v14, "airDropProxy");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v10, "isEqual:", v20);

    if (v21)
    {
      objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("UIActivityContentMagicHeadCellIdentifier"), v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityContentViewController layoutSpec](self, "layoutSpec");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "configureLayoutIfNeeded:", v22);

      objc_msgSend(v19, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setIdentifier:", v23);

      objc_msgSend(v18, "setNode:", v19);
    }
    else
    {
      objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("UIActivityContentAirDropCellIdentifier"), v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityContentViewController layoutSpec](self, "layoutSpec");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "configureLayoutIfNeeded:", v25);

      -[UIActivityContentViewController _configurePeopleCell:itemIdentifier:](self, "_configurePeopleCell:itemIdentifier:", v18, v10);
    }

  }
  else if (objc_msgSend(v12, "isEqualToString:", CFSTR("SHSheetContentAppsSectionIdentifier")))
  {
    objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("UIActivityContentShareCellIdentifier"), v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityContentViewController layoutSpec](self, "layoutSpec");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "configureLayoutIfNeeded:", v24);

    -[UIActivityContentViewController _configureSharingAppCell:itemIdentifier:](self, "_configureSharingAppCell:itemIdentifier:", v18, v10);
  }
  else if (v16
         && objc_msgSend(v12, "isEqualToString:", CFSTR("SHSheetContentHeroActionsSectionIdentifier")))
  {
    objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("UIActivityContentHeroActionCellIdentifier"), v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityContentViewController _configureHeroActionCell:itemIdentifier:](self, "_configureHeroActionCell:itemIdentifier:", v18, v10);
  }
  else
  {
    objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("UIActivityContentActionCellIdentifier"), v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityContentViewController _configureActionCell:itemIdentifier:](self, "_configureActionCell:itemIdentifier:", v18, v10);
  }

  return v18;
}

- (id)_provideSupplementaryViewForCollectionView:(id)a3 kind:(id)a4 indexPath:(id)a5
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  _QWORD v36[4];

  v36[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UIActivityContentViewController currentSnapshot](self, "currentSnapshot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIActivityContentViewController _sectionIdentifierForIndex:](self, "_sectionIdentifierForIndex:", objc_msgSend(v10, "section"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = CFSTR("SHSheetContentCustomViewSectionIdentifier");
  v36[1] = CFSTR("SHSheetContentAppsSectionIdentifier");
  v36[2] = CFSTR("SHSheetContentPeopleSectionIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v13, "isEqualToString:", CFSTR("SHSheetContentPeopleSectionIdentifier")) & 1) != 0
     || objc_msgSend(v13, "isEqualToString:", CFSTR("SHSheetContentAppsSectionIdentifier")))
    && objc_msgSend(v9, "isEqualToString:", CFSTR("UIActivityContentHeaderSectionKind")))
  {
    objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, CFSTR("UIActivityContentHeaderViewIdentifier"), v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityContentViewController topContentSectionText](self, "topContentSectionText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "titleLabel");
    v17 = v12;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v16);

    v12 = v17;
    -[UIActivityContentViewController layoutSpec](self, "layoutSpec");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topContentSectionHeaderInsets");
    objc_msgSend(v15, "setDirectionalLayoutMargins:");
LABEL_18:

    goto LABEL_19;
  }
  if (objc_msgSend(v13, "hasPrefix:", CFSTR("SHSheetContentInformationalActionsSectionIdentifier_"))
    && objc_msgSend(v9, "isEqualToString:", CFSTR("UIActivityContentFooterSectionKind")))
  {
    objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, CFSTR("UIActivityContentInformationalActionFooterViewIdentifier"), v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityContentViewController _footerTextForInformationalSectionIdentifier:](self, "_footerTextForInformationalSectionIdentifier:", v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "footerTextView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAttributedText:", v19);

    goto LABEL_18;
  }
  objc_msgSend(v12, "lastObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", v21))
  {
    v22 = objc_msgSend(v14, "containsObject:", v13);

    if ((v22 & 1) == 0)
    {
      v35 = v12;
      objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, CFSTR("UIActivityContentEditViewIdentifier"), v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "userInterfaceIdiom");

      if (v24 == 6)
      {
        v25 = CFSTR("SHARE_SHEET_EDIT_ACTIONS_BUTTON_TITLE");
      }
      else
      {
        objc_msgSend(v15, "editButton");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIActivityContentViewController layoutSpec](self, "layoutSpec");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "editTintColor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setTitleColor:forState:", v29, 0);

        v25 = CFSTR("SHARE_SHEET_EDIT_ACTIONS_BUTTON_TITLE_WITH_ELLIPSIS");
      }
      objc_msgSend(v15, "editButton");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      _ShareSheetBundle();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringForKey:value:table:", v25, &stru_1E4004990, CFSTR("Localizable"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setTitle:forState:", v32, 0);

      objc_msgSend(v15, "editButton");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityContentViewController presenter](self, "presenter");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addTarget:action:forEvents:", v33, sel_handleActionsEdit, 64);

      v12 = v35;
      goto LABEL_18;
    }
  }
  else
  {

  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("UIActivityContentFooterSectionKind")))
  {
    objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, CFSTR("UIActivityContentFooterViewIdentifier"), v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityContentViewController layoutSpec](self, "layoutSpec");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "footerBackgroundColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v26);

    goto LABEL_18;
  }
  v15 = 0;
LABEL_19:

  return v15;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  -[UIActivityContentViewController _sectionIdentifierForIndex:](self, "_sectionIdentifierForIndex:", objc_msgSend(a5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("SHSheetContentCustomViewSectionIdentifier")))
  {
    -[UIActivityContentViewController customViewController](self, "customViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "contentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      objc_msgSend(v10, "setFrame:");
      objc_msgSend(v10, "setAutoresizingMask:", 18);
      getPUCarouselSharingViewControllerClass();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setBackgroundColor:", 0);

        objc_msgSend(v9, "mainCollectionView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setBackgroundColor:", 0);

      }
      objc_msgSend(v11, "subviews");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "makeObjectsPerformSelector:", sel_removeFromSuperview);

      objc_msgSend(v9, "willMoveToParentViewController:", self);
      -[UIActivityContentViewController addChildViewController:](self, "addChildViewController:", v9);
      objc_msgSend(v11, "addSubview:", v10);
      objc_msgSend(v9, "didMoveToParentViewController:", self);

    }
  }

}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
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
  v5 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v9);
        -[UIActivityContentViewController diffableDataSource](self, "diffableDataSource");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "itemIdentifierForIndexPath:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIActivityContentViewController dataSource](self, "dataSource");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "peopleProxyForIdentifier:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "peopleSuggestion");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          -[UIActivityContentViewController peopleSuggestionImageProvider](self, "peopleSuggestionImageProvider");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "requestAvatarImageForPeopleSuggestion:resultHandler:", v15, 0);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

}

- (void)collectionView:(id)a3 cancelPrefetchingForItemsAtIndexPaths:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id obj;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = a4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v5)
  {
    v6 = v5;
    v27 = *(_QWORD *)v33;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v33 != v27)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v7);
        -[UIActivityContentViewController diffableDataSource](self, "diffableDataSource");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "itemIdentifierForIndexPath:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIActivityContentViewController identifiersToPeopleSuggestionImageRequestIDs](self, "identifiersToPeopleSuggestionImageRequestIDs");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v29;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v29 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v17);
              -[UIActivityContentViewController peopleSuggestionImageProvider](self, "peopleSuggestionImageProvider");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "cancelImageRequest:", objc_msgSend(v18, "intValue"));

              ++v17;
            }
            while (v15 != v17);
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          }
          while (v15);
        }

        -[UIActivityContentViewController identifiersToActivityImageRequestID](self, "identifiersToActivityImageRequestID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v10);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          -[UIActivityContentViewController identifiersToActivityImageRequestID](self, "identifiersToActivityImageRequestID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", v10);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "intValue");

          -[UIActivityContentViewController activityImageProvider](self, "activityImageProvider");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "cancelImageRequest:", v24);

        }
        ++v7;
      }
      while (v7 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v6);
  }

}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  UIActivityContentViewController *v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[5];
  _QWORD v39[5];
  id v40;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "deselectItemAtIndexPath:animated:", v7, 0);
  objc_msgSend(v8, "cellForItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIActivityContentViewController currentSnapshot](self, "currentSnapshot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityContentViewController diffableDataSource](self, "diffableDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "itemIdentifierForIndexPath:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionIdentifierForSectionContainingItemIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "isEqualToString:", CFSTR("SHSheetContentPeopleSectionIdentifier")))
  {
    v14 = v9;
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityContentViewController dataSource](self, "dataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "airDropProxy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = v15;
    v20 = v19;
    if (v18 == v19)
    {

    }
    else
    {
      if ((v19 != 0) == (v18 == 0))
      {

      }
      else
      {
        v21 = objc_msgSend(v18, "isEqual:", v19);

        if ((v21 & 1) != 0)
          goto LABEL_14;
      }
      if (objc_msgSend(v14, "isLongPressable"))
      {
        v30 = (void *)MEMORY[0x1E0DC36B8];
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_2;
        v39[3] = &unk_1E4002310;
        v39[4] = self;
        v20 = v20;
        v40 = v20;
        objc_msgSend(v30, "configurationWithIdentifier:previewProvider:actionProvider:", v7, &__block_literal_global_12, v39);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      }
    }
    goto LABEL_14;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("SHSheetContentAppsSectionIdentifier")))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v9;
    if (objc_msgSend(v20, "isLongPressable"))
    {
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_5;
      v38[3] = &unk_1E4002338;
      v38[4] = self;
      v22 = (void *)MEMORY[0x1A1AE9514](v38);
      -[UIActivityContentViewController dataSource](self, "dataSource");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "shareProxyForIdentifier:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = (void *)MEMORY[0x1E0DC36B8];
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_7;
      v32[3] = &unk_1E40023D0;
      v33 = v25;
      v34 = self;
      v35 = v7;
      v37 = v22;
      v14 = v14;
      v36 = v14;
      v27 = v22;
      v28 = v25;
      objc_msgSend(v26, "configurationWithIdentifier:previewProvider:actionProvider:", v35, &__block_literal_global_117, v32);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
      goto LABEL_16;
    }
LABEL_14:
    v29 = 0;
    goto LABEL_15;
  }
  v29 = 0;
LABEL_16:

  return v29;
}

uint64_t __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke()
{
  return 0;
}

id __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
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
  uint64_t v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  _ShareSheetBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SHARE_SHEET_REMOVE_PERSON_TITLE"), &stru_1E4004990, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("hand.thumbsdown"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_3;
  v21[3] = &unk_1E40022E8;
  v6 = *(void **)(a1 + 40);
  v21[4] = *(_QWORD *)(a1 + 32);
  v22 = v6;
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v3, v5, 0, v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAttributes:", 2);
  v24[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (IsAppleInternalBuild())
  {
    _ShareSheetBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SHARE_SHEET_SUGGESTION_INFO_TITLE"), &stru_1E4004990, CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("info.circle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_4;
    v19[3] = &unk_1E40022E8;
    v13 = *(void **)(a1 + 40);
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = v13;
    objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", v10, v12, 0, v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayByAddingObject:", v7);
    v16 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v16;
  }
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E4004990, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peopleProxyForIdentifier:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "presenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removePeopleSuggestionProxy:", v5);

  objc_msgSend(*(id *)(a1 + 32), "dataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestLessPeopleProxyForIdentifier:", *(_QWORD *)(a1 + 40));

}

void __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peopleProxyForIdentifier:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "suggestionReason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "presenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleInfoSuggestionPress:", v3);

}

void __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = *(void **)(a1 + 32);
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shareProxyForIdentifier:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "presenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "performShareActivityProxy:activityIdentifier:", v11, v7);

}

uint64_t __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_6()
{
  return 0;
}

id __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_7(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
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
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  uint64_t v38;
  id v39;
  id v40;

  objc_msgSend(*(id *)(a1 + 32), "activityIdentifierShare");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  if (v2)
  {

LABEL_3:
    _ShareSheetBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SHARE_EXTENSION_TITLE"), &stru_1E4004990, CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.up"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v3;
    v36[1] = 3221225472;
    v36[2] = __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_8;
    v36[3] = &unk_1E4002380;
    v8 = *(id *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(void **)(a1 + 48);
    v37 = v8;
    v38 = v9;
    v39 = v10;
    v40 = *(id *)(a1 + 64);
    objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v5, v7, 0, v36);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v11);
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "activityIdentifierOpen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "activityIdentifierCopy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_3;
  }
LABEL_7:
  objc_msgSend(*(id *)(a1 + 32), "activityIdentifierOpen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    _ShareSheetBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("OPEN_IN_ACTIVITY_TITLE"), &stru_1E4004990, CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.forward.app"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v3;
    v33[1] = 3221225472;
    v33[2] = __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_9;
    v33[3] = &unk_1E40023A8;
    v35 = *(id *)(a1 + 64);
    v34 = *(id *)(a1 + 32);
    objc_msgSend(v17, "actionWithTitle:image:identifier:handler:", v16, v18, 0, v33);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v19);
  }
  objc_msgSend(*(id *)(a1 + 32), "activityIdentifierCopy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    _ShareSheetBundle();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("COPY_TO_ACTIVITY_TITLE"), &stru_1E4004990, CFSTR("Localizable"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v3;
    v28 = 3221225472;
    v29 = __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_10;
    v30 = &unk_1E40023A8;
    v32 = *(id *)(a1 + 64);
    v31 = *(id *)(a1 + 32);
    objc_msgSend(v23, "actionWithTitle:image:identifier:handler:", v22, v24, 0, &v27);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v25, v27, v28, v29, v30);
  }
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E4004990, *(_QWORD *)(a1 + 56));
  return (id)objc_claimAutoreleasedReturnValue();
}

void __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "activityIdentifierShare");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v10 = v5;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "diffableDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemIdentifierForIndexPath:", *(_QWORD *)(a1 + 48));
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  v8 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, id))(v8 + 16))(v8, v4, v9, v10);

}

void __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activityIdentifierOpen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, void *))(v3 + 16))(v3, v5, v7, v6);

}

void __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activityIdentifierCopy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, void *))(v3 + 16))(v3, v5, v7, v6);

}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  objc_msgSend(a4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityContentViewController currentSnapshot](self, "currentSnapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityContentViewController diffableDataSource](self, "diffableDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemIdentifierForIndexPath:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionIdentifierForSectionContainingItemIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cellForItemAtIndexPath:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("SHSheetContentPeopleSectionIdentifier")))
    objc_msgSend(v12, "setTransportIconHidden:animated:useDelay:", 1, 1, 0);
  -[UIActivityContentViewController _contextMenuPreviewForCollectionView:collectionViewCell:](self, "_contextMenuPreviewForCollectionView:collectionViewCell:", v6, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(a4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForItemAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityContentViewController _contextMenuPreviewForCollectionView:collectionViewCell:](self, "_contextMenuPreviewForCollectionView:collectionViewCell:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;

  v7 = a3;
  objc_msgSend(a4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityContentViewController diffableDataSource](self, "diffableDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemIdentifierForIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIActivityContentViewController currentSnapshot](self, "currentSnapshot");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sectionIdentifierForSectionContainingItemIdentifier:", v10);
    v12 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject isEqualToString:](v12, "isEqualToString:", CFSTR("SHSheetContentPeopleSectionIdentifier")))
    {
      objc_msgSend(v7, "cellForItemAtIndexPath:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTransportIconHidden:animated:useDelay:", 0, 1, 1);

    }
  }
  else
  {
    share_sheet_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[UIActivityContentViewController collectionView:willEndContextMenuInteractionWithConfiguration:animator:].cold.1();
  }

}

- (id)_contextMenuPreviewForCollectionView:(id)a3 collectionViewCell:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v6 = a4;
  objc_msgSend(a3, "indexPathForCell:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityContentViewController diffableDataSource](self, "diffableDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemIdentifierForIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[UIActivityContentViewController currentSnapshot](self, "currentSnapshot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sectionIdentifierForSectionContainingItemIdentifier:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("SHSheetContentPeopleSectionIdentifier")) & 1) != 0
      || objc_msgSend(v11, "isEqualToString:", CFSTR("SHSheetContentAppsSectionIdentifier")))
    {
      objc_msgSend(v6, "createTargetedPreview");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    share_sheet_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[UIActivityContentViewController _contextMenuPreviewForCollectionView:collectionViewCell:].cold.1();

    v12 = 0;
  }

  return v12;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  void *v4;
  int v5;

  objc_msgSend(a3, "cellForItemAtIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "isDisabled") ^ 1;
  else
    LOBYTE(v5) = 1;

  return v5;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  int v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  int v25;
  void *v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "deselectItemAtIndexPath:animated:", v6, 0);
  -[UIActivityContentViewController currentSnapshot](self, "currentSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityContentViewController diffableDataSource](self, "diffableDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemIdentifierForIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionIdentifierForSectionContainingItemIdentifier:", v9);
  v10 = objc_claimAutoreleasedReturnValue();

  -[UIActivityContentViewController diffableDataSource](self, "diffableDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "itemIdentifierForIndexPath:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  share_sheet_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 138412290;
    v29 = v10;
    _os_log_impl(&dword_19E419000, v13, OS_LOG_TYPE_DEFAULT, "User selected node in section %@", (uint8_t *)&v28, 0xCu);
  }

  if (-[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("SHSheetContentPeopleSectionIdentifier")))
  {
    if (-[UIActivityContentViewController ignorePersonTap](self, "ignorePersonTap"))
    {
      share_sheet_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v28) = 0;
        v15 = "Ignore person tap currently enabled. Ignore selection.";
        v16 = v14;
        v17 = 2;
LABEL_23:
        _os_log_impl(&dword_19E419000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v28, v17);
        goto LABEL_24;
      }
      goto LABEL_24;
    }
    -[UIActivityContentViewController dataSource](self, "dataSource");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "peopleProxyForIdentifier:", v12);
    v14 = objc_claimAutoreleasedReturnValue();

    share_sheet_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 138412290;
      v29 = v14;
      _os_log_impl(&dword_19E419000, v24, OS_LOG_TYPE_DEFAULT, "People proxy selected:%@", (uint8_t *)&v28, 0xCu);
    }

    if (-[NSObject isTapToRadar](v14, "isTapToRadar"))
    {
      -[objc_class reporterForPeopleSuggestions](getSFUITTRReporterClass(), "reporterForPeopleSuggestions");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "report");
    }
    else
    {
      -[UIActivityContentViewController presenter](self, "presenter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "performPeopleSuggestionProxy:", v14);
    }
LABEL_20:

    goto LABEL_24;
  }
  v18 = -[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("SHSheetContentAppsSectionIdentifier"));
  -[UIActivityContentViewController dataSource](self, "dataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18)
  {
    objc_msgSend(v19, "shareProxyForIdentifier:", v12);
    v14 = objc_claimAutoreleasedReturnValue();

    share_sheet_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 138412290;
      v29 = v14;
      _os_log_impl(&dword_19E419000, v21, OS_LOG_TYPE_DEFAULT, "Share proxy selected:%@", (uint8_t *)&v28, 0xCu);
    }

    -[UIActivityContentViewController presenter](self, "presenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "performShareActivityProxy:activityIdentifier:", v14, 0);
    goto LABEL_20;
  }
  v25 = objc_msgSend(v19, "containsSectionForIdentifier:", v10);

  if (v25)
  {
    -[UIActivityContentViewController dataSource](self, "dataSource");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "actionProxyForIdentifier:", v12);
    v14 = objc_claimAutoreleasedReturnValue();

    share_sheet_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 138412290;
      v29 = v14;
      _os_log_impl(&dword_19E419000, v27, OS_LOG_TYPE_DEFAULT, "Action proxy selected:%@", (uint8_t *)&v28, 0xCu);
    }

    -[UIActivityContentViewController presenter](self, "presenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "performActionActivityProxy:", v14);
    goto LABEL_20;
  }
  share_sheet_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 138412290;
    v29 = v10;
    v15 = "Unexpected path: section %@ is not supported. Ignore selection.";
    v16 = v14;
    v17 = 12;
    goto LABEL_23;
  }
LABEL_24:

}

- (UIBarButtonItem)cancelButton
{
  UIBarButtonItem *cancelButton;
  id v4;
  void *v5;
  UIBarButtonItem *v6;
  UIBarButtonItem *v7;

  cancelButton = self->_cancelButton;
  if (!cancelButton)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC34F0]);
    -[UIActivityContentViewController presenter](self, "presenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIBarButtonItem *)objc_msgSend(v4, "initWithBarButtonSystemItem:target:action:", 1, v5, sel_handleClose);
    v7 = self->_cancelButton;
    self->_cancelButton = v6;

    cancelButton = self->_cancelButton;
  }
  return cancelButton;
}

- (UIBarButtonItem)nextButton
{
  UIBarButtonItem *nextButton;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *v9;

  nextButton = self->_nextButton;
  if (!nextButton)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC34F0]);
    _ShareSheetBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SHARE_SHEET_NEXT_BUTTON_TITLE"), CFSTR("Next"), CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityContentViewController presenter](self, "presenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UIBarButtonItem *)objc_msgSend(v4, "initWithTitle:style:target:action:", v6, 0, v7, sel_handleNext);
    v9 = self->_nextButton;
    self->_nextButton = v8;

    nextButton = self->_nextButton;
  }
  return nextButton;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  id v15;

  v15 = a3;
  -[UIActivityContentViewController activityCollectionView](self, "activityCollectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v15;
  if (v4 == v15)
  {
    -[UIActivityContentViewController headerLinkView](self, "headerLinkView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "size");
    if (v7 == 0.0)
      v8 = 72.0;
    else
      v8 = v7;

    objc_msgSend(v15, "contentOffset");
    if (v9 <= -v8)
    {
      -[UIActivityContentViewController navigationItem](self, "navigationItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = 0.0;
    }
    else
    {
      objc_msgSend(v15, "contentOffset");
      v11 = fmin((v8 + v10) * 10.0, 100.0) / 100.0;
      -[UIActivityContentViewController navigationItem](self, "navigationItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = v11;
    }
    objc_msgSend(v12, "_setManualScrollEdgeAppearanceProgress:", v14);

    v5 = v15;
  }

}

- (void)didUpdateAirDropTransferWithChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412290;
    v21 = v4;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "did update airdrop transfer with change:%@", (uint8_t *)&v20, 0xCu);
  }

  -[UIActivityContentViewController setActiveAirDropTransferChange:](self, "setActiveAirDropTransferChange:", v4);
  objc_msgSend(v4, "proxyIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityContentViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "airDropProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = v6;
  v12 = v11;

  -[UIActivityContentViewController diffableDataSource](self, "diffableDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "indexPathForItemIdentifier:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIActivityContentViewController activityCollectionView](self, "activityCollectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cellForItemAtIndexPath:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqual:", v6);

  if (v18)
  {
    -[UIActivityContentViewController _configureAirDropCell:withChange:](self, "_configureAirDropCell:withChange:", v16, v4);
  }
  else
  {
    share_sheet_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[UIActivityContentViewController didUpdateAirDropTransferWithChange:].cold.1(v16, (uint64_t)v6, v19);

  }
}

- (void)startPulsingActivity:(id)a3 localizedTitle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[UIActivityContentViewController pulsingActivity](self, "pulsingActivity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIActivityContentViewController pulsingActivity](self, "pulsingActivity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityContentViewController stopPulsingActivity:](self, "stopPulsingActivity:", v9);

  }
  share_sheet_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v6;
    _os_log_impl(&dword_19E419000, v10, OS_LOG_TYPE_DEFAULT, "start pulsing activity:%@", (uint8_t *)&v17, 0xCu);
  }

  -[UIActivityContentViewController dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifierForActivity:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIActivityContentViewController setPulsingActivityIdentifier:](self, "setPulsingActivityIdentifier:", v12);
  -[UIActivityContentViewController setPulsingActivity:](self, "setPulsingActivity:", v6);
  -[UIActivityContentViewController setPulsingLocalizedTitle:](self, "setPulsingLocalizedTitle:", v7);
  -[UIActivityContentViewController diffableDataSource](self, "diffableDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "indexPathForItemIdentifier:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIActivityContentViewController activityCollectionView](self, "activityCollectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cellForItemAtIndexPath:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setTitle:", v7);
  objc_msgSend(v16, "startPulsing");

}

- (void)stopPulsingActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIActivityContentViewController pulsingActivity](self, "pulsingActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v7;
  if (v8 == v9)
  {

LABEL_6:
    share_sheet_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v4;
      _os_log_impl(&dword_19E419000, v12, OS_LOG_TYPE_DEFAULT, "stop pulsing activity:%@", (uint8_t *)&v15, 0xCu);
    }

    -[UIActivityContentViewController pulsingActivityIdentifier](self, "pulsingActivityIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityContentViewController setPulsingActivityIdentifier:](self, "setPulsingActivityIdentifier:", 0);
    -[UIActivityContentViewController diffableDataSource](self, "diffableDataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "indexPathForItemIdentifier:", v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[UIActivityContentViewController activityCollectionView](self, "activityCollectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cellForItemAtIndexPath:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "stopPulsing");
      -[UIActivityContentViewController _configureSharingAppCell:itemIdentifier:](self, "_configureSharingAppCell:itemIdentifier:", v10, v5);
    }
    -[UIActivityContentViewController setPulsingActivity:](self, "setPulsingActivity:", 0);
    -[UIActivityContentViewController setPulsingLocalizedTitle:](self, "setPulsingLocalizedTitle:", 0);
    goto LABEL_12;
  }
  v10 = v9;
  if ((v8 == 0) != (v9 != 0))
  {
    v11 = objc_msgSend(v8, "isEqual:", v9);

    if ((v11 & 1) == 0)
      goto LABEL_13;
    goto LABEL_6;
  }

LABEL_12:
LABEL_13:

}

- (id)_activityTitleForHeroActionActivity:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "_heroActionTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(v4, "_heroActionTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIActivityContentViewController presenter](self, "presenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activityType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "customTitleForActivityType:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(v4, "activityTitle");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v12;

  }
  return v7;
}

- (void)setHeroActionActivityTypes:(id)a3
{
  NSArray *v4;
  NSArray *heroActionActivityTypes;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  if ((unint64_t)objc_msgSend(v10, "count") >= 6)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot set more than %d hero action types"), 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v9);
  }
  v4 = (NSArray *)objc_msgSend(v10, "copy");
  heroActionActivityTypes = self->_heroActionActivityTypes;
  self->_heroActionActivityTypes = v4;

}

- (void)dataSourceManager:(id)a3 didPublishDataSourceWithChangeDetails:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  os_signpost_id_t v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  os_signpost_id_t v43;
  unsigned int v44;
  void *v45;
  NSObject *v46;
  id v47;
  _QWORD v48[4];
  id v49;
  void *v50;
  _BYTE location[24];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "snapshotChanged") & 1) != 0
    || (objc_msgSend(v6, "airDropBadgeChanged") & 1) != 0
    || (objc_msgSend(v6, "modifiedIdentifiers"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v8))
  {
    objc_msgSend(v47, "dataSource");
    v46 = objc_claimAutoreleasedReturnValue();
    -[NSObject logCurrentState](v46, "logCurrentState");
    objc_msgSend(v47, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "diffableSnapshot");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "sectionsChanged") & 1) != 0 || objc_msgSend(v6, "peopleCountChanged"))
    {
      -[UIActivityContentViewController presentedViewController](self, "presentedViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10 == 0;

    }
    else
    {
      v11 = 0;
    }
    if ((objc_msgSend(v6, "forceReload") & 1) != 0)
    {
      v44 = 0;
    }
    else
    {
      -[UIActivityContentViewController diffableDataSource](self, "diffableDataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "snapshot");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        v44 = objc_msgSend(v6, "animateDifferences") | v11;
      else
        v44 = 0;

    }
    v14 = objc_msgSend(v6, "forceReload");
    if (objc_msgSend(v6, "peopleCountChanged"))
    {
      -[UIActivityContentViewController setIgnorePersonTap:](self, "setIgnorePersonTap:", 1);
      *(_QWORD *)location = 0;
      objc_initWeak((id *)location, self);
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __91__UIActivityContentViewController_dataSourceManager_didPublishDataSourceWithChangeDetails___block_invoke;
      v48[3] = &unk_1E40016A0;
      objc_copyWeak(&v49, (id *)location);
      v15 = (void *)MEMORY[0x1A1AE9514](v48);
      -[UIActivityContentViewController activeAirDropTransferChange](self, "activeAirDropTransferChange");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject airDropProxy](v46, "airDropProxy");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "proxyIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqual:", v19);

      if ((v20 & 1) == 0)
        -[UIActivityContentViewController setActiveAirDropTransferChange:](self, "setActiveAirDropTransferChange:", 0);

      objc_destroyWeak(&v49);
      objc_destroyWeak((id *)location);
    }
    else
    {
      v15 = 0;
    }
    share_sheet_log();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v22)
      {
        *(_WORD *)location = 0;
        _os_log_impl(&dword_19E419000, v21, OS_LOG_TYPE_DEFAULT, "apply new snapshot using reload data", location, 2u);
      }

      -[UIActivityContentViewController diffableDataSource](self, "diffableDataSource");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "applySnapshotUsingReloadData:completion:", v45, v15);
LABEL_35:

      goto LABEL_36;
    }
    if (v22)
    {
      NSStringFromBOOL();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138412290;
      *(_QWORD *)&location[4] = v24;
      _os_log_impl(&dword_19E419000, v21, OS_LOG_TYPE_DEFAULT, "apply new snapshot with animation:%@", location, 0xCu);

    }
    -[UIActivityContentViewController diffableDataSource](self, "diffableDataSource");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "applySnapshot:animatingDifferences:completion:", v45, v44, v15);

    objc_msgSend(v6, "modifiedIdentifiers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");

    if (objc_msgSend(v6, "airDropBadgeChanged"))
    {
      v28 = -[NSObject containsSectionForIdentifier:](v46, "containsSectionForIdentifier:", CFSTR("SHSheetContentAppsSectionIdentifier"));
      if (v27)
        goto LABEL_30;
    }
    else
    {
      v28 = 0;
      if (v27)
      {
LABEL_30:
        v29 = v27 != 0;
        v23 = (void *)objc_msgSend(v45, "copy");
        if (v29)
        {
          objc_msgSend(v6, "modifiedIdentifiers");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "reconfigureItemsWithIdentifiers:", v30);

        }
        if (v28)
        {
          -[NSObject shareProxies](v46, "shareProxies");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "firstObject");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "identifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v33;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "reconfigureItemsWithIdentifiers:", v34);

        }
        -[UIActivityContentViewController diffableDataSource](self, "diffableDataSource");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "applySnapshot:animatingDifferences:completion:", v23, v44, v15);

        goto LABEL_35;
      }
    }
    if (!v28)
    {
LABEL_36:
      -[UIActivityContentViewController delegate](self, "delegate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        share_sheet_log();
        v37 = objc_claimAutoreleasedReturnValue();
        share_sheet_log();
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = os_signpost_id_make_with_pointer(v38, self);

        if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
        {
          *(_WORD *)location = 0;
          _os_signpost_emit_with_name_impl(&dword_19E419000, v37, OS_SIGNPOST_INTERVAL_END, v39, "UpdateContentView", (const char *)&unk_19E4D535F, location, 2u);
        }

        objc_msgSend(v36, "activityContentViewControllerDidUpdateDataSource:", self);
      }
      -[UIActivityContentViewController _updateHeaderLinkViewAction](self, "_updateHeaderLinkViewAction");

      v40 = v46;
      goto LABEL_42;
    }
    goto LABEL_30;
  }
  share_sheet_log();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)location = 0;
    _os_log_impl(&dword_19E419000, v41, OS_LOG_TYPE_DEFAULT, "The new data source published don't require to update the current snapshot.", location, 2u);
  }

  share_sheet_log();
  v40 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = os_signpost_id_make_with_pointer(v42, self);

  if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    *(_WORD *)location = 0;
    _os_signpost_emit_with_name_impl(&dword_19E419000, v40, OS_SIGNPOST_INTERVAL_END, v43, "UpdateContentView", "update not needed", location, 2u);
  }
LABEL_42:

}

void __91__UIActivityContentViewController_dataSourceManager_didPublishDataSourceWithChangeDetails___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 200000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__UIActivityContentViewController_dataSourceManager_didPublishDataSourceWithChangeDetails___block_invoke_2;
  block[3] = &unk_1E40016A0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
}

void __91__UIActivityContentViewController_dataSourceManager_didPublishDataSourceWithChangeDetails___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIgnorePersonTap:", 0);

}

- (id)titleForItemIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[UIActivityContentViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIActivityContentViewController _activityTitleForHeroActionActivity:](self, "_activityTitleForHeroActionActivity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_sectionIdentifierForIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[UIActivityContentViewController currentSnapshot](self, "currentSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_footerTextForInformationalSectionIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("_"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v5);
    if (v6)
    {
      -[UIActivityContentViewController dataSource](self, "dataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "actionProxyForIdentifier:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "activityFooter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v9;
      }
      else
      {
        objc_msgSend(v8, "activity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_activityFooterText");
        v11 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)updateWithViewModel:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  int v49;
  void *v50;
  int v51;
  int v52;
  void *v53;
  int v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  int v62;
  int v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  int v71;
  int v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  float v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  float v83;
  double v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  char v104;
  char v105;
  char v106;
  uint8_t buf[16];

  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_make_with_pointer(v6, self);

  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19E419000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "UpdateContentView", " enableTelemetry=YES ", buf, 2u);
  }

  -[UIActivityContentViewController viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metadataValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadataValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  v12 = v10;
  v13 = v12;
  if (v11 == v12)
  {
    v106 = 1;
  }
  else if ((v11 == 0) == (v12 != 0))
  {
    v106 = 0;
  }
  else
  {
    v106 = objc_msgSend(v11, "isEqual:", v12);
  }

  -[UIActivityContentViewController viewModel](self, "viewModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "urlRequests");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "urlRequests");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15;
  v18 = v16;
  v19 = v18;
  if (v17 == v18)
  {
    v105 = 1;
  }
  else if ((v17 == 0) == (v18 != 0))
  {
    v105 = 0;
  }
  else
  {
    v105 = objc_msgSend(v17, "isEqual:", v18);
  }

  -[UIActivityContentViewController viewModel](self, "viewModel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "urlSandboxExtensions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "urlSandboxExtensions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v21;
  v24 = v22;
  v25 = v24;
  if (v23 == v24)
  {
    v26 = 1;
  }
  else if ((v23 == 0) == (v24 != 0))
  {
    v26 = 0;
  }
  else
  {
    v26 = objc_msgSend(v23, "isEqual:", v24);
  }

  -[UIActivityContentViewController viewModel](self, "viewModel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend(v27, "showOptions");
  v102 = objc_msgSend(v4, "showOptions");

  -[UIActivityContentViewController viewModel](self, "viewModel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "customOptionsTitle");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customOptionsTitle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v29;
  v32 = v30;
  v33 = v32;
  if (v31 == v32)
  {
    v103 = 0;
  }
  else
  {
    if ((v31 == 0) == (v32 != 0))
      v34 = 1;
    else
      v34 = objc_msgSend(v31, "isEqual:", v32) ^ 1;
    v103 = v34;
  }

  -[UIActivityContentViewController viewModel](self, "viewModel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = objc_msgSend(v35, "showCustomHeaderButton");
  v99 = objc_msgSend(v4, "showCustomHeaderButton");

  -[UIActivityContentViewController viewModel](self, "viewModel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "customHeaderButtonTitle");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customHeaderButtonTitle");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v37;
  v40 = v38;
  v41 = v40;
  if (v39 == v40)
  {
    v101 = 0;
  }
  else
  {
    if ((v39 == 0) == (v40 != 0))
      v42 = 1;
    else
      v42 = objc_msgSend(v39, "isEqual:", v40) ^ 1;
    v101 = v42;
  }

  -[UIActivityContentViewController viewModel](self, "viewModel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "customHeaderButtonColor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customHeaderButtonColor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v44;
  v47 = v45;
  v48 = v47;
  v104 = v26;
  if (v46 == v47)
  {
    v98 = 0;
  }
  else
  {
    if ((v46 == 0) == (v47 != 0))
      v49 = 1;
    else
      v49 = objc_msgSend(v46, "isEqual:", v47) ^ 1;
    v98 = v49;
  }

  -[UIActivityContentViewController viewModel](self, "viewModel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "showHeaderSpecialization");
  v52 = objc_msgSend(v4, "showHeaderSpecialization");

  -[UIActivityContentViewController viewModel](self, "viewModel");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "isCollaborative");
  v55 = objc_msgSend(v4, "isCollaborative");

  -[UIActivityContentViewController viewModel](self, "viewModel");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "collaborationModeTitle");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collaborationModeTitle");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v57;
  v60 = v58;
  v61 = v60;
  if (v59 == v60)
  {
    v62 = 1;
  }
  else if ((v59 == 0) == (v60 != 0))
  {
    v62 = 0;
  }
  else
  {
    v62 = objc_msgSend(v59, "isEqual:", v60);
  }

  HIDWORD(v96) = v62;
  if ((v62 & 1) == 0)
    -[UIActivityContentViewController setHeaderLinkActionsNeedsUpdate:](self, "setHeaderLinkActionsNeedsUpdate:", 1);
  v63 = v51 ^ v52;
  v64 = v54 ^ v55;
  -[UIActivityContentViewController viewModel](self, "viewModel");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "collaborationFooterViewModel");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collaborationFooterViewModel");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v66;
  v69 = v67;
  v70 = v69;
  if (v68 == v69)
  {
    v71 = 0;
  }
  else if ((v68 == 0) == (v69 != 0))
  {
    v71 = 1;
  }
  else
  {
    v71 = objc_msgSend(v68, "isEqual:", v69) ^ 1;
  }

  if (((v97 ^ v102 | v103 | v100 ^ v99 | v101 | v98 | v63 | v64) & 1) != 0)
    v72 = 1;
  else
    v72 = HIDWORD(v96) ^ 1 | v71;
  -[UIActivityContentViewController viewModel](self, "viewModel");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "customViewController");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customViewController");
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "customViewControllerVerticalInsetWrapper");
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    objc_msgSend(v4, "customViewControllerVerticalInsetWrapper");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "floatValue");
    v79 = v78;
    -[UIActivityContentViewController layoutSpec](self, "layoutSpec");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setCustomViewVerticalInset:", v79);

  }
  objc_msgSend(v4, "customViewControllerSectionHeightWrapper");
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  if (v81)
  {
    objc_msgSend(v4, "customViewControllerSectionHeightWrapper");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "floatValue");
    v84 = v83;
    -[UIActivityContentViewController layoutSpec](self, "layoutSpec");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setCustomViewSectionHeight:", v84);

  }
  -[UIActivityContentViewController setViewModel:](self, "setViewModel:", v4);
  if ((v104 & 1) == 0 && -[UIActivityContentViewController isRemote](self, "isRemote"))
  {
    objc_msgSend(v4, "urlSandboxExtensions");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "urlRequests");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityContentViewController _consumeURLSandboxExtensions:forURLRequests:](self, "_consumeURLSandboxExtensions:forURLRequests:", v86, v87);

  }
  if (v72)
    -[UIActivityContentViewController _updateHeaderLinkViewAction](self, "_updateHeaderLinkViewAction");
  if (((v106 & v105) & v104 & 1) == 0)
    -[UIActivityContentViewController _updateHeaderMetadataValues](self, "_updateHeaderMetadataValues");
  if (v74 != v75)
    -[UIActivityContentViewController _updateCustomViewContent](self, "_updateCustomViewContent");
  objc_msgSend(v4, "applicationActivityTypes");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityContentViewController dataSourceManager](self, "dataSourceManager");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setApplicationActivityTypes:", v88);

  objc_msgSend(v4, "peopleSuggestionProxies");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shareProxies");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionProxies");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activitiesByUUID");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nearbyCountSlotID");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v4, "updateProxiesWithAnimation");
  LOBYTE(v96) = objc_msgSend(v4, "reloadData");
  -[UIActivityContentViewController _updateContentWithPeopleProxies:shareProxies:actionProxies:activitiesByUUID:nearbyCountSlotID:animated:reloadData:](self, "_updateContentWithPeopleProxies:shareProxies:actionProxies:activitiesByUUID:nearbyCountSlotID:animated:reloadData:", v90, v91, v92, v93, v94, v95, v96);

}

- (void)_consumeURLSandboxExtensions:(id)a3 forURLRequests:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  int v16;
  int *v17;
  char *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  int v26;
  __int16 v27;
  char *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v11)), "bytes");
        v12 = sandbox_extension_consume();
        if (v12 == -1)
        {
          share_sheet_log();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v16 = *__error();
            v17 = __error();
            v18 = strerror(*v17);
            *(_DWORD *)buf = 138412802;
            v24 = v7;
            v25 = 1024;
            v26 = v16;
            v27 = 2080;
            v28 = v18;
            _os_log_error_impl(&dword_19E419000, v14, OS_LOG_TYPE_ERROR, "Failed to extend sandbox for one of the URL requests %@ with error %d (%s)", buf, 0x1Cu);
          }
        }
        else
        {
          v13 = v12;
          -[UIActivityContentViewController sandboxExtensionHandles](self, "sandboxExtensionHandles");
          v14 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v14, "addObject:", v15);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v9);
  }

}

- (void)reloadMetadata:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[UIActivityContentViewController _updateHeaderMetadataValues](self, "_updateHeaderMetadataValues");
  -[UIActivityContentViewController customViewController](self, "customViewController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      objc_msgSend(v10, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityContentViewController navigationItem](self, "navigationItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTitle:", v8);

    }
  }

}

- (void)reloadContent
{
  void *v3;
  id v4;

  -[UIActivityContentViewController currentSnapshot](self, "currentSnapshot");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UIActivityContentViewController diffableDataSource](self, "diffableDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "applySnapshotUsingReloadData:", v4);

  }
}

- (void)reloadActivity:(id)a3
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
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIActivityContentViewController diffableDataSource](self, "diffableDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForItemIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIActivityContentViewController currentSnapshot](self, "currentSnapshot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activityUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadItemsWithIdentifiers:", v10);

    -[UIActivityContentViewController diffableDataSource](self, "diffableDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityContentViewController currentSnapshot](self, "currentSnapshot");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "applySnapshotUsingReloadData:", v12);

  }
}

- (LPLinkMetadata)headerMetadata
{
  void *v2;
  void *v3;

  -[UIActivityContentViewController headerLinkView](self, "headerLinkView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (LPLinkMetadata *)v3;
}

- (void)_updateHeaderSize
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UIActivityContentViewController headerLinkView](self, "headerLinkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    -[UIActivityContentViewController headerLinkView](self, "headerLinkView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDelegate:", 0);

    -[UIActivityContentViewController setHeaderLinkView:](self, "setHeaderLinkView:", 0);
    -[UIActivityContentViewController headerTitleView](self, "headerTitleView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    -[UIActivityContentViewController setHeaderTitleView:](self, "setHeaderTitleView:", 0);
    -[UIActivityContentViewController _configureHeaderViewIfNeeded](self, "_configureHeaderViewIfNeeded");
    v3 = v6;
  }

}

- (void)_updateHeaderLinkViewAction
{
  void *v2;
  id *v4;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
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
  id v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  char v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  int v64;
  void *v65;
  char v66;
  void *v67;
  _BOOL4 v68;
  int v69;
  _QWORD *v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[4];
  id v74;
  _QWORD v75[4];
  id v76;
  _QWORD v77[4];
  id v78;
  _QWORD v79[4];
  id v80;
  id location;
  void *v82;
  uint8_t buf[4];
  const __CFString *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  location = 0;
  objc_initWeak(&location, self);
  v4 = (id *)-[UIActivityContentViewController _canShowOptions](self, "_canShowOptions");
  -[UIActivityContentViewController _configureHeaderViewIfNeeded](self, "_configureHeaderViewIfNeeded");
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if ((v4 & 1) != 0)
    {
      v6 = CFSTR("Options link");
    }
    else
    {
      -[UIActivityContentViewController viewModel](self, "viewModel");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v2, "showCustomHeaderButton");
      v6 = CFSTR("no button");
      if (v7)
        v6 = CFSTR("custom header button");
    }
    *(_DWORD *)buf = 138412290;
    v84 = v6;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "updating header action to %@", buf, 0xCu);
    if ((v4 & 1) == 0)

  }
  if ((v4 & 1) != 0
    || (-[UIActivityContentViewController viewModel](self, "viewModel"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "supportsCollaboration"),
        v8,
        v9))
  {
    -[UIActivityContentViewController _updateHeaderLinkViewSizeClass](self, "_updateHeaderLinkViewSizeClass");
    -[UIActivityContentViewController viewModel](self, "viewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "supportsCollaboration");

    if (v11)
    {
      if (-[UIActivityContentViewController headerLinkActionsNeedsUpdate](self, "headerLinkActionsNeedsUpdate"))
      {
        -[UIActivityContentViewController viewModel](self, "viewModel");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "supportsSendCopy");

        -[UIActivityContentViewController viewModel](self, "viewModel");
        if ((v13 & 1) != 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isCollaborative");
          -[UIActivityContentViewController viewModel](self, "viewModel");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "collaborationModeTitle");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = MEMORY[0x1E0C809B0];
          v79[0] = MEMORY[0x1E0C809B0];
          v79[1] = 3221225472;
          v79[2] = __62__UIActivityContentViewController__updateHeaderLinkViewAction__block_invoke;
          v79[3] = &unk_1E40016A0;
          objc_copyWeak(&v80, &location);
          UIActivityContentHelperCollaborationButtonAction(v15, v17, v79);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          -[UIActivityContentViewController viewModel](self, "viewModel");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v16) = objc_msgSend(v20, "isCollaborative");
          v77[0] = v18;
          v77[1] = 3221225472;
          v77[2] = __62__UIActivityContentViewController__updateHeaderLinkViewAction__block_invoke_2;
          v77[3] = &unk_1E40016A0;
          objc_copyWeak(&v78, &location);
          UIActivityContentHelperCopyButtonAction((int)v16, v77);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v19, v21, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIActivityContentViewController headerLinkView](self, "headerLinkView");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "_setButtonActions:", v22);

          -[UIActivityContentViewController headerLinkView](self, "headerLinkView");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "_setOverrideActionButtonColor:", 0);

          objc_destroyWeak(&v78);
          objc_destroyWeak(&v80);
        }
        else
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "collaborationModeTitle");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          UIActivityContentHelperCollaborationSubtitle(v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          -[UIActivityContentViewController headerLinkView](self, "headerLinkView");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "_setOverrideSubtitle:", v48);

        }
        -[UIActivityContentViewController setHeaderLinkActionsNeedsUpdate:](self, "setHeaderLinkActionsNeedsUpdate:", 0);
      }
      -[UIActivityContentViewController viewModel](self, "viewModel");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "isCollaborative");

      if (!v51)
      {
        -[UIActivityContentViewController headerLinkView](self, "headerLinkView");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_opt_respondsToSelector();

        if ((v66 & 1) != 0)
        {
          -[UIActivityContentViewController headerLinkView](self, "headerLinkView");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "_setCollaborationFooterViewModel:action:", 0, 0);
          -[UIActivityContentViewController setCollaborationFooterViewModel:](self, "setCollaborationFooterViewModel:", 0);

        }
        goto LABEL_15;
      }
      -[UIActivityContentViewController headerLinkView](self, "headerLinkView");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_opt_respondsToSelector();

      if ((v53 & 1) != 0)
      {
        -[UIActivityContentViewController headerLinkView](self, "headerLinkView");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIActivityContentViewController viewModel](self, "viewModel");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "collaborationFooterViewModel");
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIActivityContentViewController collaborationFooterViewModel](self, "collaborationFooterViewModel");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v56, "isEqual:", v57))
        {
LABEL_36:

          goto LABEL_37;
        }
        objc_msgSend(v56, "optionsSummary");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIActivityContentViewController collaborationFooterViewModel](self, "collaborationFooterViewModel");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "optionsSummary");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v58;
        v62 = v60;
        v63 = v62;
        if (v61 == v62)
        {

        }
        else
        {
          if ((v61 == 0) == (v62 != 0))
          {

LABEL_35:
            goto LABEL_36;
          }
          v64 = objc_msgSend(v61, "isEqual:", v62);

          if (!v64)
            goto LABEL_35;
        }
        v68 = -[UIActivityContentViewController canShowShareOptions](self, "canShowShareOptions");

        if (((v4 ^ v68) & 1) == 0)
        {
LABEL_45:

          goto LABEL_15;
        }
LABEL_37:
        -[UIActivityContentViewController setCanShowShareOptions:](self, "setCanShowShareOptions:", v4);
        -[UIActivityContentViewController setCollaborationFooterViewModel:](self, "setCollaborationFooterViewModel:", v56);
        if (v56)
          v69 = (int)v4;
        else
          v69 = 0;
        if (v69 == 1)
        {
          v75[0] = MEMORY[0x1E0C809B0];
          v75[1] = 3221225472;
          v75[2] = __62__UIActivityContentViewController__updateHeaderLinkViewAction__block_invoke_3;
          v75[3] = &unk_1E40016A0;
          v4 = &v76;
          objc_copyWeak(&v76, &location);
          v70 = v75;
        }
        else
        {
          v70 = 0;
        }
        objc_msgSend(v54, "_setCollaborationFooterViewModel:action:", v56, v70);
        if (v69)
          objc_destroyWeak(v4);
        goto LABEL_45;
      }
    }
    else
    {
      -[UIActivityContentViewController viewModel](self, "viewModel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "customOptionsTitle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = __62__UIActivityContentViewController__updateHeaderLinkViewAction__block_invoke_4;
      v73[3] = &unk_1E40016A0;
      objc_copyWeak(&v74, &location);
      UIActivityContentHelperOptionsButtonAction((int)v4, v26, v73);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIActivityContentViewController headerLinkView](self, "headerLinkView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "_setButtonActions:", v29);

      -[UIActivityContentViewController headerLinkView](self, "headerLinkView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "_setAction:withText:", 0, &stru_1E4004990);

      objc_destroyWeak(&v74);
    }
LABEL_15:
    v31 = objc_alloc_init(getLPLinkRendererSizeClassParametersClass());
    objc_msgSend(v31, "setAlignButtonWithCaptionTextLeadingEdge:", 1);
    -[UIActivityContentViewController headerLinkView](self, "headerLinkView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_setSizeClassParameters:", v31);

    goto LABEL_16;
  }
  -[UIActivityContentViewController viewModel](self, "viewModel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "showCustomHeaderButton");

  if (v34)
  {
    -[UIActivityContentViewController headerLinkView](self, "headerLinkView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "_setPreferredSizeClass:", 12);

    -[UIActivityContentViewController headerLinkView](self, "headerLinkView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __62__UIActivityContentViewController__updateHeaderLinkViewAction__block_invoke_5;
    v71[3] = &unk_1E40016A0;
    objc_copyWeak(&v72, &location);
    -[UIActivityContentViewController viewModel](self, "viewModel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "customHeaderButtonTitle");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "_setAction:withAttributedText:buttonType:", v71, v38, 1);

    -[UIActivityContentViewController headerLinkView](self, "headerLinkView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityContentViewController viewModel](self, "viewModel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "customHeaderButtonColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "_setOverrideActionButtonColor:", v41);

    objc_destroyWeak(&v72);
  }
  else
  {
    v42 = -[UIActivityContentViewController _headingSizeClass](self, "_headingSizeClass");
    -[UIActivityContentViewController headerLinkView](self, "headerLinkView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "_setPreferredSizeClass:", v42);

    -[UIActivityContentViewController headerLinkView](self, "headerLinkView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "_setAction:withText:", 0, &stru_1E4004990);

    -[UIActivityContentViewController headerLinkView](self, "headerLinkView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "_setOverrideActionButtonColor:", 0);

  }
LABEL_16:
  objc_destroyWeak(&location);
}

void __62__UIActivityContentViewController__updateHeaderLinkViewAction__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  int v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didSelectCollaborativeAction");

  objc_msgSend(WeakRetained, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isModeSwitchDisabled");

  if (v3)
  {
    objc_msgSend(WeakRetained, "setHeaderLinkActionsNeedsUpdate:", 1);
    objc_msgSend(WeakRetained, "_updateHeaderLinkViewAction");
  }

}

void __62__UIActivityContentViewController__updateHeaderLinkViewAction__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  int v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didSelectSendCopyAction");

  objc_msgSend(WeakRetained, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isModeSwitchDisabled");

  if (v3)
  {
    objc_msgSend(WeakRetained, "setHeaderLinkActionsNeedsUpdate:", 1);
    objc_msgSend(WeakRetained, "_updateHeaderLinkViewAction");
  }

}

void __62__UIActivityContentViewController__updateHeaderLinkViewAction__block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleOptions");

}

void __62__UIActivityContentViewController__updateHeaderLinkViewAction__block_invoke_4(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleOptions");

}

void __62__UIActivityContentViewController__updateHeaderLinkViewAction__block_invoke_5(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleCustomHeaderButton");

}

- (unint64_t)_headingSizeClass
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v7;
  char v8;

  -[UIActivityContentViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "showCustomHeaderButton") & 1) != 0)
    goto LABEL_4;
  -[UIActivityContentViewController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "supportsCollaboration"))
  {

LABEL_4:
LABEL_5:
    v5 = 12;
    goto LABEL_6;
  }
  -[UIActivityContentViewController viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "showHeaderSpecialization");

  if ((v8 & 1) != 0)
    goto LABEL_5;
  v5 = 2;
LABEL_6:
  if (-[UIActivityContentViewController _canShowOptions](self, "_canShowOptions"))
    return 12;
  else
    return v5;
}

- (void)_updateHeaderLinkViewSizeClass
{
  unint64_t v3;
  id v4;

  v3 = -[UIActivityContentViewController _headingSizeClass](self, "_headingSizeClass");
  -[UIActivityContentViewController headerLinkView](self, "headerLinkView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setPreferredSizeClass:", v3);

}

- (void)_updateCustomViewContent
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  unint64_t v8;
  _BOOL8 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  -[UIActivityContentViewController customViewController](self, "customViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && v4 != 1)
  {
    -[UIActivityContentViewController presentingViewController](self, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = ~objc_msgSend(v6, "supportedInterfaceOrientations");

    v8 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "activeInterfaceOrientation") - 3;
    v10 = (v7 & 0x18) == 0 && v8 < 0xFFFFFFFFFFFFFFFELL;
    -[UIActivityContentViewController _configureHeaderViewIfNeeded](self, "_configureHeaderViewIfNeeded");
    -[UIActivityContentViewController _configureCollectionViewIfNeeded](self, "_configureCollectionViewIfNeeded");
    if (v10)
    {
      v11 = 1;
      -[UIActivityContentViewController setPhotosLandscapeMode:](self, "setPhotosLandscapeMode:", 1);
      -[UIActivityContentViewController headerTitleView](self, "headerTitleView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPhotosCarouselMode:", 1);

      -[UIActivityContentViewController cancelButton](self, "cancelButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityContentViewController navigationItem](self, "navigationItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setLeftBarButtonItem:", v13);

      -[UIActivityContentViewController nextButton](self, "nextButton");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityContentViewController navigationItem](self, "navigationItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setRightBarButtonItem:", v15);

    }
    else
    {
      -[UIActivityContentViewController setPhotosLandscapeMode:](self, "setPhotosLandscapeMode:", 0);
      -[UIActivityContentViewController headerTitleView](self, "headerTitleView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setPhotosCarouselMode:", 0);

      v18 = -[UIActivityContentViewController isCloseButtonOnLeadingEdge](self, "isCloseButtonOnLeadingEdge");
      if (v18)
      {
        v19 = 0;
      }
      else
      {
        -[UIActivityContentViewController closeButton](self, "closeButton");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[UIActivityContentViewController navigationItem](self, "navigationItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setRightBarButtonItem:", v19);

      if (!v18)
      v21 = -[UIActivityContentViewController isCloseButtonOnLeadingEdge](self, "isCloseButtonOnLeadingEdge");
      v22 = v21;
      if (v21)
      {
        -[UIActivityContentViewController closeButton](self, "closeButton");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }
      -[UIActivityContentViewController navigationItem](self, "navigationItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setLeftBarButtonItem:", v15);

      v11 = 2;
      if (!v22)
        goto LABEL_22;
    }

LABEL_22:
    objc_msgSend(MEMORY[0x1E0DC35D8], "defaultConfiguration");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setContentInsetsReference:", v11);
    -[UIActivityContentViewController activityCollectionView](self, "activityCollectionView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "collectionViewLayout");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setConfiguration:", v29);

    -[UIActivityContentViewController dataSource](self, "dataSource");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "createChangeRequestFromCurrentState");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "setAnimated:", v10);
    objc_msgSend(v27, "setExcludeSectionTypes:", -[UIActivityContentViewController currentSectionTypesToExclude](self, "currentSectionTypesToExclude"));
    -[UIActivityContentViewController dataSourceManager](self, "dataSourceManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "updateWithChangeRequest:", v27);

  }
}

- (void)_updateContentWithPeopleProxies:(id)a3 shareProxies:(id)a4 actionProxies:(id)a5 activitiesByUUID:(id)a6 nearbyCountSlotID:(id)a7 animated:(BOOL)a8 reloadData:(BOOL)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  SHSheetContentDataSourceManager *v22;
  void *v23;
  void *v24;
  SHSheetContentDataSourceManager *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  BOOL v35;
  BOOL v36;
  id location;

  v9 = a8;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  if (self->_didLayout)
  {
    -[UIActivityContentViewController _configureHeaderViewIfNeeded](self, "_configureHeaderViewIfNeeded");
    -[UIActivityContentViewController _configureCollectionViewIfNeeded](self, "_configureCollectionViewIfNeeded");
    +[SHSheetContentDataSourceChangeRequest changeRequestForPeopleProxies:shareProxies:actionProxies:nearbyCountSlotID:activitiesByUUID:](SHSheetContentDataSourceChangeRequest, "changeRequestForPeopleProxies:shareProxies:actionProxies:nearbyCountSlotID:activitiesByUUID:", v15, v16, v17, objc_msgSend(v19, "unsignedIntValue"), v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setExcludeSectionTypes:", -[UIActivityContentViewController currentSectionTypesToExclude](self, "currentSectionTypesToExclude"));
    objc_msgSend(v20, "setAnimated:", v9);
    objc_msgSend(v20, "setForceReload:", a9);
    -[UIActivityContentViewController dataSourceManager](self, "dataSourceManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      v22 = [SHSheetContentDataSourceManager alloc];
      -[UIActivityContentViewController applicationActivityTypes](self, "applicationActivityTypes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityContentViewController heroActionActivityTypes](self, "heroActionActivityTypes");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[SHSheetContentDataSourceManager initWithApplicationActivityTypes:heroActionActivityTypes:](v22, "initWithApplicationActivityTypes:heroActionActivityTypes:", v23, v24);
      -[UIActivityContentViewController setDataSourceManager:](self, "setDataSourceManager:", v25);

      -[UIActivityContentViewController dataSourceManager](self, "dataSourceManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setDelegate:", self);

    }
    -[UIActivityContentViewController dataSourceManager](self, "dataSourceManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "updateWithChangeRequest:", v20);

  }
  else
  {
    location = 0;
    objc_initWeak(&location, self);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __149__UIActivityContentViewController__updateContentWithPeopleProxies_shareProxies_actionProxies_activitiesByUUID_nearbyCountSlotID_animated_reloadData___block_invoke;
    v28[3] = &unk_1E40023F8;
    objc_copyWeak(&v34, &location);
    v29 = v15;
    v30 = v16;
    v31 = v17;
    v32 = v18;
    v33 = v19;
    v35 = v9;
    v36 = a9;
    -[UIActivityContentViewController setPendingUpdate:](self, "setPendingUpdate:", v28);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }

}

void __149__UIActivityContentViewController__updateContentWithPeopleProxies_shareProxies_actionProxies_activitiesByUUID_nearbyCountSlotID_animated_reloadData___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  LOBYTE(v2) = *(_BYTE *)(a1 + 81);
  objc_msgSend(WeakRetained, "_updateContentWithPeopleProxies:shareProxies:actionProxies:activitiesByUUID:nearbyCountSlotID:animated:reloadData:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 80), v2);

}

- (BOOL)_canShowOptions
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[UIActivityContentViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "showOptions"))
  {
    -[UIActivityContentViewController heroActionActivityTypes](self, "heroActionActivityTypes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      -[UIActivityContentViewController viewModel](self, "viewModel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isSharingExpanded");

    }
    else
    {
      v6 = 1;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)runScrollingTestWithName:(id)a3 type:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  void (**v19)(_QWORD);
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  if ((-[objc_class isRecapAvailable](getRPTTestRunnerClass(), "isRecapAvailable") & 1) != 0)
  {
    -[UIActivityContentViewController _scrollViewForScrollingType:](self, "_scrollViewForScrollingType:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v21 = v8;
        v22 = 2112;
        v23 = v10;
        _os_log_impl(&dword_19E419000, v12, OS_LOG_TYPE_DEFAULT, "run scrolling test with name:%@ scrollview:%@", buf, 0x16u);
      }

      v13 = objc_alloc(getRPTScrollViewTestParametersClass());
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __83__UIActivityContentViewController_runScrollingTestWithName_type_completionHandler___block_invoke;
      v16[3] = &unk_1E4001A88;
      v17 = v8;
      v18 = v10;
      v19 = v9;
      v14 = (void *)objc_msgSend(v13, "initWithTestName:scrollView:completionHandler:", v17, v18, v16);
      objc_msgSend(v14, "setPreventSheetDismissal:", 1);
      objc_msgSend(v14, "setShouldFlick:", 0);
      -[objc_class runTestWithParameters:](getRPTTestRunnerClass(), "runTestWithParameters:", v14);

    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[UIActivityContentViewController runScrollingTestWithName:type:completionHandler:].cold.1();

      v9[2](v9);
    }

  }
  else
  {
    share_sheet_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[UIActivityContentViewController runScrollingTestWithName:type:completionHandler:].cold.2();

    v9[2](v9);
  }

}

uint64_t __83__UIActivityContentViewController_runScrollingTestWithName_type_completionHandler___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  share_sheet_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_19E419000, v2, OS_LOG_TYPE_DEFAULT, "did complete scrolling test for name:%@ scrollview:%@", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (id)_scrollViewForScrollingType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  -[UIActivityContentViewController activityCollectionView](self, "activityCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
  {
    if (a3 == 3)
    {
      -[UIActivityContentViewController customViewController](self, "customViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      SHSheetContentHelperFindScrollView(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v8;
LABEL_6:
      objc_msgSend(v9, "firstObject");
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v12 = (void *)v11;
LABEL_11:

      v6 = v12;
      return v6;
    }
    SHSheetContentHelperFindScrollView(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10;
    if (a3 == 2)
    {
      if ((unint64_t)objc_msgSend(v10, "count") >= 2)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
    }
    else if (a3 == 1)
    {
      goto LABEL_6;
    }
    v12 = 0;
    goto LABEL_11;
  }
  return v6;
}

- (UIActivityContentViewControllerDelegate)delegate
{
  return (UIActivityContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SHSheetContentPresenter)presenter
{
  return (SHSheetContentPresenter *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (void)setPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_presenter, a3);
}

- (BOOL)canRenderPeople
{
  return self->_canRenderPeople;
}

- (BOOL)configureForCloudSharing
{
  return self->_configureForCloudSharing;
}

- (BOOL)configureForPhotosEdit
{
  return self->_configureForPhotosEdit;
}

- (BOOL)hideHeaderView
{
  return self->_hideHeaderView;
}

- (BOOL)hideNavigationBar
{
  return self->_hideNavigationBar;
}

- (BOOL)sharingExpanded
{
  return self->_sharingExpanded;
}

- (NSString)topContentSectionText
{
  return self->_topContentSectionText;
}

- (NSArray)applicationActivityTypes
{
  return self->_applicationActivityTypes;
}

- (NSArray)heroActionActivityTypes
{
  return self->_heroActionActivityTypes;
}

- (BOOL)showHeroActionsHorizontally
{
  return self->_showHeroActionsHorizontally;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (BOOL)isRemote
{
  return self->_isRemote;
}

- (void)setIsRemote:(BOOL)a3
{
  self->_isRemote = a3;
}

- (BSAuditToken)hostAuditToken
{
  return self->_hostAuditToken;
}

- (void)setHostAuditToken:(id)a3
{
  objc_storeStrong((id *)&self->_hostAuditToken, a3);
}

- (NSNumber)hostPresentationStyle
{
  return self->_hostPresentationStyle;
}

- (SHSheetContentViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (SHSheetContentLayoutSpec)layoutSpec
{
  return self->_layoutSpec;
}

- (SHSheetContentLayoutProvider)layoutProvider
{
  return self->_layoutProvider;
}

- (_UIActivityCollectionViewCompositionalLayout)activityCollectionViewLayout
{
  return self->_activityCollectionViewLayout;
}

- (SHSheetContentDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void)setDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceManager, a3);
}

- (void)setCurrentSectionTypesToExclude:(int64_t)a3
{
  self->_currentSectionTypesToExclude = a3;
}

- (_UIActivityContentCollectionView)activityCollectionView
{
  return self->_activityCollectionView;
}

- (void)setActivityCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_activityCollectionView, a3);
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (SFAirDropTransferChange)activeAirDropTransferChange
{
  return self->_activeAirDropTransferChange;
}

- (void)setActiveAirDropTransferChange:(id)a3
{
  objc_storeStrong((id *)&self->_activeAirDropTransferChange, a3);
}

- (LPLinkView)headerLinkView
{
  return self->_headerLinkView;
}

- (void)setHeaderLinkView:(id)a3
{
  objc_storeStrong((id *)&self->_headerLinkView, a3);
}

- (_UIActivityContentTitleView)headerTitleView
{
  return self->_headerTitleView;
}

- (void)setHeaderTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_headerTitleView, a3);
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (void)setNextButton:(id)a3
{
  objc_storeStrong((id *)&self->_nextButton, a3);
}

- (UIBarButtonItem)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (BOOL)isCloseButtonOnLeadingEdge
{
  return self->_isCloseButtonOnLeadingEdge;
}

- (void)setIsCloseButtonOnLeadingEdge:(BOOL)a3
{
  self->_isCloseButtonOnLeadingEdge = a3;
}

- (BOOL)headerLinkActionsNeedsUpdate
{
  return self->_headerLinkActionsNeedsUpdate;
}

- (void)setHeaderLinkActionsNeedsUpdate:(BOOL)a3
{
  self->_headerLinkActionsNeedsUpdate = a3;
}

- (SFUIPeopleSuggestionImageProvider)peopleSuggestionImageProvider
{
  return self->_peopleSuggestionImageProvider;
}

- (NSMutableDictionary)identifiersToPeopleSuggestionImageRequestIDs
{
  return self->_identifiersToPeopleSuggestionImageRequestIDs;
}

- (SFUIActivityImageProvider)activityImageProvider
{
  return self->_activityImageProvider;
}

- (NSMutableDictionary)identifiersToActivityImageRequestID
{
  return self->_identifiersToActivityImageRequestID;
}

- (BOOL)photosLandscapeMode
{
  return self->_photosLandscapeMode;
}

- (void)setPhotosLandscapeMode:(BOOL)a3
{
  self->_photosLandscapeMode = a3;
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (BOOL)ignorePersonTap
{
  return self->_ignorePersonTap;
}

- (void)setIgnorePersonTap:(BOOL)a3
{
  self->_ignorePersonTap = a3;
}

- (NSMutableSet)sandboxExtensionHandles
{
  return self->_sandboxExtensionHandles;
}

- (id)pendingUpdate
{
  return self->_pendingUpdate;
}

- (void)setPendingUpdate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1208);
}

- (UIActivity)pulsingActivity
{
  return self->_pulsingActivity;
}

- (void)setPulsingActivity:(id)a3
{
  objc_storeStrong((id *)&self->_pulsingActivity, a3);
}

- (NSString)pulsingLocalizedTitle
{
  return self->_pulsingLocalizedTitle;
}

- (void)setPulsingLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1224);
}

- (NSUUID)pulsingActivityIdentifier
{
  return self->_pulsingActivityIdentifier;
}

- (void)setPulsingActivityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1232);
}

- (SLCollaborationFooterViewModel)collaborationFooterViewModel
{
  return self->_collaborationFooterViewModel;
}

- (void)setCollaborationFooterViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationFooterViewModel, a3);
}

- (BOOL)canShowShareOptions
{
  return self->_canShowShareOptions;
}

- (void)setCanShowShareOptions:(BOOL)a3
{
  self->_canShowShareOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationFooterViewModel, 0);
  objc_storeStrong((id *)&self->_pulsingActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_pulsingLocalizedTitle, 0);
  objc_storeStrong((id *)&self->_pulsingActivity, 0);
  objc_storeStrong(&self->_pendingUpdate, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionHandles, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_identifiersToActivityImageRequestID, 0);
  objc_storeStrong((id *)&self->_activityImageProvider, 0);
  objc_storeStrong((id *)&self->_identifiersToPeopleSuggestionImageRequestIDs, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionImageProvider, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_headerTitleView, 0);
  objc_storeStrong((id *)&self->_headerLinkView, 0);
  objc_storeStrong((id *)&self->_activeAirDropTransferChange, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_activityCollectionView, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_activityCollectionViewLayout, 0);
  objc_storeStrong((id *)&self->_layoutProvider, 0);
  objc_storeStrong((id *)&self->_layoutSpec, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_hostPresentationStyle, 0);
  objc_storeStrong((id *)&self->_hostAuditToken, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_heroActionActivityTypes, 0);
  objc_storeStrong((id *)&self->_applicationActivityTypes, 0);
  objc_storeStrong((id *)&self->_topContentSectionText, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_configureAirDropCell:withChange:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19E419000, v0, v1, "update AirDrop progress for cell:%@ without top/bottom text.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_configureSharingAppCell:itemIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_19E419000, v0, v1, "No activity or bundle idenfifier for proxy:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_provideCellForCollectionView:indexPath:itemIdentifier:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  _os_log_debug_impl(&dword_19E419000, v0, OS_LOG_TYPE_DEBUG, "_provideCellForCollectionView at indexPath:%@ with itemIdentifier: %@", v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)collectionView:willEndContextMenuInteractionWithConfiguration:animator:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_19E419000, v0, v1, "No item identifier found at indexPath:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_contextMenuPreviewForCollectionView:collectionViewCell:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  _os_log_fault_impl(&dword_19E419000, v0, OS_LOG_TYPE_FAULT, "No item identifier found for cell:%@ at indexPath:%@", v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)didUpdateAirDropTransferWithChange:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_5_0(&dword_19E419000, a3, v6, "AirDrop cell identifier:%@ mismatches update proxy identifier:%@", (uint8_t *)&v7);

}

- (void)runScrollingTestWithName:type:completionHandler:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2048;
  v4 = v0;
  OUTLINED_FUNCTION_5_0(&dword_19E419000, v1, (uint64_t)v1, "run scrolling test with name:%@ failed to retrieve scrollview for type:%ld", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)runScrollingTestWithName:type:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_19E419000, v0, v1, "run scrolling test with name:%@ failed because recap framework is not available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
