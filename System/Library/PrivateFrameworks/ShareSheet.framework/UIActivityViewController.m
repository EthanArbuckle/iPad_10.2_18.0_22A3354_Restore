@implementation UIActivityViewController

- (UIActivityViewController)initWithActivityItemsConfiguration:(id)activityItemsConfiguration
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIActivityViewController *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = activityItemsConfiguration;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v4, "_activityItems"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = (void *)MEMORY[0x1E0DC3440];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __101__UIActivityViewController_UIActivityItemsConfiguration_Private__initWithActivityItemsConfiguration___block_invoke;
    v11[3] = &unk_1E40024A8;
    v12 = v4;
    objc_msgSend(v6, "_itemsForSystemSharingFromActivityItemsConfiguration:wrapperBlock:", v12, v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "applicationActivitiesForActivityItemsConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = -[UIActivityViewController initWithActivityItems:applicationActivities:](self, "initWithActivityItems:applicationActivities:", v5, v7);
  if (v8)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "_excludedActivityTypes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityViewController setExcludedActivityTypes:](v8, "setExcludedActivityTypes:", v9);

    }
    -[UIActivityViewController setCachedActivityItemsConfiguration:](v8, "setCachedActivityItemsConfiguration:", v4);
  }

  return v8;
}

_UIActivityItemsConfigurationActivityItemProvider *__101__UIActivityViewController_UIActivityItemsConfiguration_Private__initWithActivityItemsConfiguration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[_UIActivityItemsConfigurationActivityItemProvider initWithActivityItemsConfiguration:itemAtSourceIndex:]([_UIActivityItemsConfigurationActivityItemProvider alloc], "initWithActivityItemsConfiguration:itemAtSourceIndex:", *(_QWORD *)(a1 + 32), a3);
}

- (UIActivityViewController)init
{
  return -[UIActivityViewController initWithActivityItems:applicationActivities:](self, "initWithActivityItems:applicationActivities:", MEMORY[0x1E0C9AA60], 0);
}

- (UIActivityViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  return -[UIActivityViewController initWithActivityItems:applicationActivities:](self, "initWithActivityItems:applicationActivities:", MEMORY[0x1E0C9AA60], 0);
}

- (UIActivityViewController)initWithCoder:(NSCoder *)coder
{
  return -[UIActivityViewController initWithActivityItems:applicationActivities:](self, "initWithActivityItems:applicationActivities:", MEMORY[0x1E0C9AA60], 0);
}

- (UIActivityViewController)initWithAssetIdentifiers:(id)a3 activityItems:(id)a4 applicationActivities:(id)a5
{
  id v9;
  UIActivityViewController *v10;
  UIActivityViewController *v11;

  v9 = a3;
  v10 = -[UIActivityViewController initWithActivityItems:applicationActivities:](self, "initWithActivityItems:applicationActivities:", a4, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_selectedAssetIdentifiers, a3);

  return v11;
}

- (UIActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4 shouldSuggestFamilyMembers:(BOOL)a5
{
  UIActivityViewController *result;

  result = -[UIActivityViewController initWithActivityItems:applicationActivities:](self, "initWithActivityItems:applicationActivities:", a3, a4);
  if (result)
    result->_shouldSuggestFamilyMembers = a5;
  return result;
}

- (UIActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4 peopleSuggestionBundleIds:(id)a5
{
  id v8;
  UIActivityViewController *v9;
  uint64_t v10;
  NSArray *peopleSuggestionBundleIds;

  v8 = a5;
  v9 = -[UIActivityViewController initWithActivityItems:applicationActivities:](self, "initWithActivityItems:applicationActivities:", a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    peopleSuggestionBundleIds = v9->_peopleSuggestionBundleIds;
    v9->_peopleSuggestionBundleIds = (NSArray *)v10;

  }
  return v9;
}

- (UIActivityViewController)initWithUserDefaults:(id)a3 userDefaultsIdentifier:(id)a4 applicationActivities:(id)a5
{
  id v9;
  id v10;
  UIActivityViewController *v11;
  UIActivityViewController *v12;
  uint64_t v13;
  NSString *userDefaultsIdentifier;

  v9 = a3;
  v10 = a4;
  v11 = -[UIActivityViewController initWithActivityItems:applicationActivities:](self, "initWithActivityItems:applicationActivities:", MEMORY[0x1E0C9AA60], a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_userDefaults, a3);
    v13 = objc_msgSend(v10, "copy");
    userDefaultsIdentifier = v12->_userDefaultsIdentifier;
    v12->_userDefaultsIdentifier = (NSString *)v13;

  }
  return v12;
}

- (UIActivityViewController)initWithActivityItems:(NSArray *)activityItems applicationActivities:(NSArray *)applicationActivities
{
  void *v4;
  void *v5;
  NSArray *v8;
  NSArray *v9;
  UIActivityViewController *v10;
  NSObject *v11;
  objc_class *v12;
  id v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  NSArray *v17;
  uint64_t v18;
  NSArray *v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  _QWORD block[4];
  UIActivityViewController *v25;
  objc_super v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  NSArray *v30;
  __int16 v31;
  __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = activityItems;
  v9 = applicationActivities;
  v26.receiver = self;
  v26.super_class = (Class)UIActivityViewController;
  v10 = -[UIActivityViewController initWithNibName:bundle:](&v26, sel_initWithNibName_bundle_, 0, 0);
  if (v10)
  {
    share_sheet_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        -[NSArray valueForKeyPath:](v9, "valueForKeyPath:", CFSTR("activityType"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR(", applicationActivities (%@)"), v5);
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = &stru_1E4004990;
      }
      *(_DWORD *)buf = 138412802;
      v28 = v13;
      v29 = 2112;
      v30 = v8;
      v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_19E419000, v11, OS_LOG_TYPE_DEFAULT, "%@: initialized with activityItems (%@)%@", buf, 0x20u);
      if (v9)
      {

      }
    }

    v10->_creationTimestamp = mach_continuous_time();
    v16 = -[NSArray copy](v8, "copy");
    v17 = v10->_activityItems;
    v10->_activityItems = (NSArray *)v16;

    v18 = -[NSArray copy](v9, "copy");
    v19 = v10->_applicationActivities;
    v10->_applicationActivities = (NSArray *)v18;

    v10->_allowsProminentActivity = 1;
    v10->_collaborationMode = 6;
    share_sheet_log();
    v20 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_signpost_id_make_with_pointer(v21, v10);

    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v22, "InitializeUIAVC", " enableTelemetry=YES ", buf, 2u);
    }

    -[UIActivityViewController setModalPresentationStyle:](v10, "setModalPresentationStyle:", +[UIActivityViewController _defaultPlatformPresentationStyle](UIActivityViewController, "_defaultPlatformPresentationStyle"));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__UIActivityViewController_initWithActivityItems_applicationActivities___block_invoke;
    block[3] = &unk_1E4001608;
    v25 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  return v10;
}

uint64_t __72__UIActivityViewController_initWithActivityItems_applicationActivities___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createMainPresenterIfNeeded");
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating UIAVC", buf, 2u);
  }

  +[_UIActivityItemMapping _clearActivityItems:](_UIActivityItemMapping, "_clearActivityItems:", self);
  v4.receiver = self;
  v4.super_class = (Class)UIActivityViewController;
  -[UIActivityViewController dealloc](&v4, sel_dealloc);
}

- (void)_createMainPresenterIfNeeded
{
  SHSheetPresenter *v3;
  SHSheetPresenter *mainPresenter;
  id v5;

  if (!self->_mainPresenter)
  {
    -[UIActivityViewController _createContextFromCurrentState](self, "_createContextFromCurrentState");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    +[SHSheetFactory createMainPresenterWithContext:](SHSheetFactory, "createMainPresenterWithContext:", v5);
    v3 = (SHSheetPresenter *)objc_claimAutoreleasedReturnValue();
    mainPresenter = self->_mainPresenter;
    self->_mainPresenter = v3;

    -[SHSheetPresenter setDelegate:](self->_mainPresenter, "setDelegate:", self);
  }
}

- (id)_createContextFromCurrentState
{
  SHSheetContext *v3;
  void *v4;
  SHSheetContext *v5;
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
  NSObject *v19;
  int v21;
  SHSheetContext *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = [SHSheetContext alloc];
  -[UIActivityViewController activityItems](self, "activityItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SHSheetContext initWithActivityViewController:activityItems:](v3, "initWithActivityViewController:activityItems:", self, v4);

  -[UIActivityViewController applicationActivities](self, "applicationActivities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext setApplicationActivities:](v5, "setApplicationActivities:", v6);

  -[UIActivityViewController excludedActivityTypes](self, "excludedActivityTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext setExcludedActivityTypes:](v5, "setExcludedActivityTypes:", v7);

  -[UIActivityViewController includedActivityTypes](self, "includedActivityTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext setIncludedActivityTypes:](v5, "setIncludedActivityTypes:", v8);

  -[SHSheetContext setExcludedActivityCategories:](v5, "setExcludedActivityCategories:", -[UIActivityViewController excludedActivityCategories](self, "excludedActivityCategories"));
  -[UIActivityViewController activityTypeOrder](self, "activityTypeOrder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext setActivityTypeOrder:](v5, "setActivityTypeOrder:", v9);

  -[SHSheetContext setShowKeyboardAutomatically:](v5, "setShowKeyboardAutomatically:", -[UIActivityViewController showKeyboardAutomatically](self, "showKeyboardAutomatically"));
  -[SHSheetContext setWhitelistActionActivitiesOnly:](v5, "setWhitelistActionActivitiesOnly:", -[UIActivityViewController whitelistActionActivitiesOnly](self, "whitelistActionActivitiesOnly"));
  -[SHSheetContext setSharingStyle:](v5, "setSharingStyle:", -[UIActivityViewController sharingStyle](self, "sharingStyle"));
  -[UIActivityViewController heroActionActivityTypes](self, "heroActionActivityTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext setHeroActionActivityTypes:](v5, "setHeroActionActivityTypes:", v10);

  -[SHSheetContext setShowHeroActionsHorizontally:](v5, "setShowHeroActionsHorizontally:", -[UIActivityViewController showHeroActionsHorizontally](self, "showHeroActionsHorizontally"));
  -[SHSheetContext setIsContentManaged:](v5, "setIsContentManaged:", -[UIActivityViewController isContentManaged](self, "isContentManaged"));
  -[SHSheetContext setAllowsEmbedding:](v5, "setAllowsEmbedding:", -[UIActivityViewController allowsEmbedding](self, "allowsEmbedding"));
  -[UIActivityViewController objectManipulationDelegate](self, "objectManipulationDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext setObjectManipulationDelegate:](v5, "setObjectManipulationDelegate:", v11);

  -[SHSheetContext setShouldSuggestFamilyMembers:](v5, "setShouldSuggestFamilyMembers:", -[UIActivityViewController shouldSuggestFamilyMembers](self, "shouldSuggestFamilyMembers"));
  -[SHSheetContext setAllowsProminentActivity:](v5, "setAllowsProminentActivity:", -[UIActivityViewController allowsProminentActivity](self, "allowsProminentActivity"));
  -[UIActivityViewController photosHeaderMetadata](self, "photosHeaderMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext setPhotosHeaderMetadata:](v5, "setPhotosHeaderMetadata:", v12);

  -[SHSheetContext setConfigureForCloudSharing:](v5, "setConfigureForCloudSharing:", -[UIActivityViewController configureForCloudSharing](self, "configureForCloudSharing"));
  -[SHSheetContext setConfigureForPhotosEdit:](v5, "setConfigureForPhotosEdit:", -[UIActivityViewController configureForPhotosEdit](self, "configureForPhotosEdit"));
  -[SHSheetContext setHideHeaderView:](v5, "setHideHeaderView:", -[UIActivityViewController hideHeaderView](self, "hideHeaderView"));
  -[SHSheetContext setHideNavigationBar:](v5, "setHideNavigationBar:", -[UIActivityViewController hideNavigationBar](self, "hideNavigationBar"));
  -[SHSheetContext setHideSuggestions:](v5, "setHideSuggestions:", -[UIActivityViewController hideSuggestions](self, "hideSuggestions"));
  -[UIActivityViewController topContentSectionText](self, "topContentSectionText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext setTopContentSectionText:](v5, "setTopContentSectionText:", v13);

  -[UIActivityViewController _selectedAssetIdentifiers](self, "_selectedAssetIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext setSelectedAssetIdentifiers:](v5, "setSelectedAssetIdentifiers:", v14);

  -[UIActivityViewController peopleSuggestionBundleIds](self, "peopleSuggestionBundleIds");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext setPeopleSuggestionBundleIds:](v5, "setPeopleSuggestionBundleIds:", v15);

  -[UIActivityViewController cachedActivityItemsConfiguration](self, "cachedActivityItemsConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIActivityViewController collaborationModeRestrictionFromActivityItemsConfiguration:collaborationMode:](UIActivityViewController, "collaborationModeRestrictionFromActivityItemsConfiguration:collaborationMode:", v16, -[UIActivityViewController collaborationMode](self, "collaborationMode"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext setCollaborationModeRestriction:](v5, "setCollaborationModeRestriction:", v17);

  -[UIActivityViewController managedFileURL](self, "managedFileURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext setManagedFileURL:](v5, "setManagedFileURL:", v18);

  -[SHSheetContext setShowCustomScene:](v5, "setShowCustomScene:", -[UIActivityViewController showCustomScene](self, "showCustomScene"));
  share_sheet_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412290;
    v22 = v5;
    _os_log_impl(&dword_19E419000, v19, OS_LOG_TYPE_DEFAULT, "UIAVC: create context:%@", (uint8_t *)&v21, 0xCu);
  }

  return v5;
}

- (_UIRemoteSheet)_remoteSheet
{
  void *v2;
  void *v3;

  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteSheet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIRemoteSheet *)v3;
}

- (UIActivity)activity
{
  void *v2;
  void *v3;

  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIActivity *)v3;
}

- (void)setAllowsEmbedding:(BOOL)a3
{
  if (self->_allowsEmbedding != a3)
    self->_allowsEmbedding = a3;
}

- (void)setCustomViewControllerVerticalInset:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityViewController setCustomViewControllerVerticalInsetWrapper:](self, "setCustomViewControllerVerticalInsetWrapper:", v4);

  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateCustomView");

}

- (double)customViewControllerVerticalInset
{
  void *v2;
  float v3;
  double v4;

  -[UIActivityViewController customViewControllerVerticalInsetWrapper](self, "customViewControllerVerticalInsetWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (void)setCustomViewControllerSectionHeight:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityViewController setCustomViewControllerSectionHeightWrapper:](self, "setCustomViewControllerSectionHeightWrapper:", v4);

  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateCustomView");

}

- (double)customViewControllerSectionHeight
{
  void *v2;
  float v3;
  double v4;

  -[UIActivityViewController customViewControllerSectionHeightWrapper](self, "customViewControllerSectionHeightWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (void)setPhotosCarouselViewController:(id)a3
{
  UIViewController *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];

  v5 = (UIViewController *)a3;
  if (!_ShareSheetCanUseCustomViewController())
  {
    share_sheet_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[UIActivityViewController setPhotosCarouselViewController:].cold.1((uint64_t)v5, v10);
    goto LABEL_9;
  }
  if (self->_photosCarouselViewController != v5)
  {
    objc_storeStrong((id *)&self->_photosCarouselViewController, a3);
    -[UIActivityViewController presentationController](self, "presentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[UIActivityViewController presentationController](self, "presentationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityViewController _updateSheetPresentationController:](self, "_updateSheetPresentationController:", v8);
      -[UIActivityViewController mainPresenter](self, "mainPresenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __60__UIActivityViewController_setPhotosCarouselViewController___block_invoke;
        v11[3] = &unk_1E4001608;
        v11[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v11, 0.5);
        goto LABEL_10;
      }
    }
    -[UIActivityViewController mainPresenter](self, "mainPresenter");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject updateCustomView](v10, "updateCustomView");
LABEL_9:

  }
LABEL_10:

}

void __60__UIActivityViewController_setPhotosCarouselViewController___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "mainPresenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateCustomView");

}

+ (int64_t)_defaultPlatformPresentationStyle
{
  if (_ShareSheetPlatformPrefersPopover())
    return 7;
  if ((dyld_program_sdk_at_least() & 1) != 0 || objc_msgSend(a1, "isMemberOfClass:", objc_opt_class()))
    return 2;
  return 5;
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  double v5;
  objc_super v6;

  if (!-[UIActivityViewController allowsEmbedding](self, "allowsEmbedding")
    && !-[UIActivityViewController allowsCustomPresentationStyle](self, "allowsCustomPresentationStyle"))
  {
    a3 = +[UIActivityViewController _defaultPlatformPresentationStyle](UIActivityViewController, "_defaultPlatformPresentationStyle");
  }
  if (_ShareSheetPlatformPrefersPopover())
  {
    if (a3 == 2)
      v5 = _ShareSheetFormSheetSize();
    else
      v5 = _ShareSheetPopoverSize();
  }
  else
  {
    v5 = _ShareSheetDefaultSheetSize();
  }
  -[UIActivityViewController setPreferredContentSize:](self, "setPreferredContentSize:", v5);
  v6.receiver = self;
  v6.super_class = (Class)UIActivityViewController;
  -[UIActivityViewController setModalPresentationStyle:](&v6, sel_setModalPresentationStyle_, a3);
}

- (void)setIsContentManaged:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_isContentManaged != a3)
  {
    v3 = a3;
    self->_isContentManaged = a3;
    -[UIActivityViewController mainPresenter](self, "mainPresenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsContentManaged:", v3);

  }
}

- (void)setAllowsProminentActivity:(BOOL)allowsProminentActivity
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_allowsProminentActivity != allowsProminentActivity)
  {
    v3 = allowsProminentActivity;
    share_sheet_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "no";
      if (v3)
        v6 = "yes";
      v7 = 136315138;
      v8 = v6;
      _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "SharePlay: Setting allowsProminentActivity to %s", (uint8_t *)&v7, 0xCu);
    }

    self->_allowsProminentActivity = v3;
  }
}

- (NSString)sessionIdentifier
{
  void *v2;
  void *v3;

  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)activityItemsConfiguration
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCollaborationSelected");

  if (v4)
  {
    -[UIActivityViewController clientActivityItemsConfigurationSource](self, "clientActivityItemsConfigurationSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activityItemsConfiguration");
  }
  else
  {
    -[UIActivityViewController mainPresenter](self, "mainPresenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createActivityItemsConfiguration");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)collaborationModeRestrictionFromActivityItemsConfiguration:(id)a3 collaborationMode:(int64_t)a4
{
  id v5;
  UIActivityCollaborationModeRestriction *v6;
  void *v7;
  uint64_t v8;

  v5 = a3;
  v6 = 0;
  if (a4 != 6)
  {
    if (a4 != 4)
    {
      if (a4 != 2)
        goto LABEL_8;

    }
    v6 = -[UIActivityCollaborationModeRestriction initWithDisabledMode:]([UIActivityCollaborationModeRestriction alloc], "initWithDisabledMode:", 0);
  }
  if (v5)
  {
    +[_UIActivityItemsConfigurationActivityItemProvider metadataForKey:expectedClass:activityItemsConfiguration:itemAtSourceIndex:](_UIActivityItemsConfigurationActivityItemProvider, "metadataForKey:expectedClass:activityItemsConfiguration:itemAtSourceIndex:", CFSTR("collaborationModeRestrictions"), objc_opt_class(), v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (UIActivityCollaborationModeRestriction *)v8;
  }
LABEL_8:

  return v6;
}

- (void)setExcludedActivitySectionTypes:(unint64_t)a3
{
  -[UIActivityViewController setHideSuggestions:](self, "setHideSuggestions:", a3 & 1);
}

- (unint64_t)excludedActivitySectionTypes
{
  return -[UIActivityViewController hideSuggestions](self, "hideSuggestions");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIActivityViewController;
  -[UIActivityViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[UIActivityViewController _createMainPresenterIfNeeded](self, "_createMainPresenterIfNeeded");
  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareViewIfNeeded");

  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateCustomView");

  -[UIActivityViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintAdjustmentMode:", 1);

  if (-[UIActivityViewController allowsEmbedding](self, "allowsEmbedding"))
    -[UIActivityViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", -1);
}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIActivityViewController;
  -[UIActivityViewController viewIsAppearing:](&v7, sel_viewIsAppearing_, a3);
  -[UIActivityViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIActivityViewController mainPresenter](self, "mainPresenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "present");

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIActivityViewController;
  -[UIActivityViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityViewControllerSizeWillChange:", self);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIActivityViewController;
  v4 = a3;
  -[UIActivityViewController traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, v4);
  -[UIActivityViewController mainPresenter](self, "mainPresenter", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityViewController:traitCollectionDidChange:", self, v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  objc_super v13;
  uint8_t buf[8];
  _QWORD v15[3];
  _QWORD v16[4];

  v3 = a3;
  v16[3] = *MEMORY[0x1E0C80C00];
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "UIAVC: view will appear", buf, 2u);
  }

  v15[0] = CFSTR("Process-ID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", getpid());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v16[1] = &unk_1E403FC60;
  v15[1] = CFSTR("Status");
  v15[2] = CFSTR("Timestamp");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  softLinkPLLogRegisteredEvent(23, (uint64_t)CFSTR("UIKit-Activity"), (uint64_t)v8, 0);
  if (!-[UIActivityViewController viewWillAppearTimestamp](self, "viewWillAppearTimestamp"))
    -[UIActivityViewController setViewWillAppearTimestamp:](self, "setViewWillAppearTimestamp:", mach_continuous_time());
  -[UIActivityViewController presentationController](self, "presentationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    v11 = 1;
    objc_msgSend(v10, "_setIgnoresKeyboardNotifications:", 1);
    objc_msgSend(v10, "_setBackgroundBlurDisabled:", 1);
    if ((objc_msgSend(v10, "_centersPopoverIfSourceViewNotSet") & 1) == 0)
      v11 = dyld_program_sdk_at_least() ^ 1;
    objc_msgSend(v10, "_setCentersPopoverIfSourceViewNotSet:", v11);

  }
  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activityViewControllerWillAppear:", self);

  v13.receiver = self;
  v13.super_class = (Class)UIActivityViewController;
  -[UIActivityViewController viewWillAppear:](&v13, sel_viewWillAppear_, v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIActivityViewController;
  -[UIActivityViewController viewDidAppear:](&v11, sel_viewDidAppear_, a3);
  share_sheet_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_19E419000, v4, OS_LOG_TYPE_DEFAULT, "UIAVC: view did appear", v10, 2u);
  }

  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityViewControllerDidAppear:", self);

  -[UIActivityViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "activityItemsConfigurationSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityViewController setClientActivityItemsConfigurationSource:](self, "setClientActivityItemsConfigurationSource:", v9);

  objc_msgSend(v8, "setActivityItemsConfigurationSource:", self);
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[8];
  objc_super v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)UIActivityViewController;
  -[UIActivityViewController viewWillDisappear:](&v14, sel_viewWillDisappear_, a3);
  share_sheet_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_19E419000, v4, OS_LOG_TYPE_DEFAULT, "UIAVC: view will disappear", v13, 2u);
  }

  v15[0] = CFSTR("Process-ID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", getpid());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  v16[1] = &unk_1E403FC78;
  v15[1] = CFSTR("Status");
  v15[2] = CFSTR("Timestamp");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  softLinkPLLogRegisteredEvent(23, (uint64_t)CFSTR("UIKit-Activity"), (uint64_t)v7, 0);
  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activityViewControllerWillDisappear:", self);

  -[UIActivityViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "windowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIActivityViewController clientActivityItemsConfigurationSource](self, "clientActivityItemsConfigurationSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActivityItemsConfigurationSource:", v12);

}

- (void)viewDidDisappear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIActivityViewController;
  -[UIActivityViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  share_sheet_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19E419000, v4, OS_LOG_TYPE_DEFAULT, "UIAVC: view did disappear", v6, 2u);
  }

  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityViewControllerDidDisappear:", self);

  -[UIActivityViewController setDidStartDelayingPresentation:](self, "setDidStartDelayingPresentation:", 0);
  -[UIActivityViewController setDidEndDelayingPresentation:](self, "setDidEndDelayingPresentation:", 0);
  -[UIActivityViewController setClientAttemptedInitialPresentationOrEmbeddingTimestamp:](self, "setClientAttemptedInitialPresentationOrEmbeddingTimestamp:", 0);
  -[UIActivityViewController setViewWillAppearTimestamp:](self, "setViewWillAppearTimestamp:", 0);
}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIActivityViewController;
  -[UIActivityViewController viewSafeAreaInsetsDidChange](&v4, sel_viewSafeAreaInsetsDidChange);
  -[UIActivityViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)_viewControllerPresentationDidInitiate
{
  NSObject *v3;
  void *v4;
  int v5;
  uint8_t v6[16];

  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "UIAVC: viewControllerPresnetationDidInitiate", v6, 2u);
  }

  -[UIActivityViewController _createMainPresenterIfNeeded](self, "_createMainPresenterIfNeeded");
  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "useRemoteUIService");

  if (v5)
    -[UIActivityViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[UIActivityViewController _delayPresentationIfNeeded](self, "_delayPresentationIfNeeded");
}

- (void)_delayPresentationIfNeeded
{
  BOOL v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  id v8;
  _QWORD v9[5];
  uint8_t buf[16];

  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "useRemoteUIService")
    && !-[UIActivityViewController didStartDelayingPresentation](self, "didStartDelayingPresentation"))
  {
    v3 = -[UIActivityViewController didEndDelayingPresentation](self, "didEndDelayingPresentation");

    if (!v3)
    {
      -[UIActivityViewController setDidStartDelayingPresentation:](self, "setDidStartDelayingPresentation:", 1);
      share_sheet_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E419000, v4, OS_LOG_TYPE_DEFAULT, "Beginning presentation delay", buf, 2u);
      }

      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __54__UIActivityViewController__delayPresentationIfNeeded__block_invoke;
      v9[3] = &unk_1E40024D8;
      v9[4] = self;
      -[UIActivityViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", v9, 3.0);
      share_sheet_log();
      v5 = objc_claimAutoreleasedReturnValue();
      share_sheet_log();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = os_signpost_id_make_with_pointer(v6, self);

      if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19E419000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PresentShareSheetDelayed", " enableTelemetry=YES ", buf, 2u);
      }

    }
  }
  else
  {

  }
}

uint64_t __54__UIActivityViewController__delayPresentationIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  share_sheet_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_19E419000, v4, OS_LOG_TYPE_DEFAULT, "Presentation delay cancellation handler didTimeout: %@", (uint8_t *)&v10, 0xCu);

  }
  if ((_DWORD)a2)
  {
    share_sheet_log();
    v6 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_make_with_pointer(v7, *(const void **)(a1 + 32));

    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v6, OS_SIGNPOST_EVENT, v8, "ShareSheetDelayPresentationDidTimeout", (const char *)&unk_19E4D535F, (uint8_t *)&v10, 2u);
    }

  }
  return a2;
}

- (void)_readyToInteract
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "UIAVC: ready to interact", buf, 2u);
  }

  -[UIActivityViewController _shareSheetReadyToInteractHandler](self, "_shareSheetReadyToInteractHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityViewController _setShareSheetReadyToInteractHandler:](self, "_setShareSheetReadyToInteractHandler:", 0);
  v5 = (void *)*MEMORY[0x1E0DC4730];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__UIActivityViewController__readyToInteract__block_invoke;
  v7[3] = &unk_1E4002500;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "_performBlockAfterCATransactionCommits:", v7);

}

uint64_t __44__UIActivityViewController__readyToInteract__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t result;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setReadyToInteractTimestamp:", mach_continuous_time());
  if (objc_msgSend(*(id *)(a1 + 32), "clientAttemptedInitialPresentationOrEmbeddingTimestamp"))
  {
    share_sheet_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v2))
    {
      v3 = objc_msgSend(*(id *)(a1 + 32), "clientAttemptedInitialPresentationOrEmbeddingTimestamp");
      v7 = 134349056;
      v8 = v3;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ShareSheetLoad", "%{public, signpost.description:begin_time}llu", (uint8_t *)&v7, 0xCu);
    }

    share_sheet_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      LOWORD(v7) = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ShareSheetLoad", (const char *)&unk_19E4D535F, (uint8_t *)&v7, 2u);
    }

    share_sheet_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      LOWORD(v7) = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "InitialContentUpdate", (const char *)&unk_19E4D535F, (uint8_t *)&v7, 2u);
    }

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_endDelayingPresentation
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  objc_super v7;
  uint8_t buf[16];

  if (!-[UIActivityViewController didEndDelayingPresentation](self, "didEndDelayingPresentation"))
  {
    share_sheet_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "Ending presentation delay", buf, 2u);
    }

    -[UIActivityViewController setDidEndDelayingPresentation:](self, "setDidEndDelayingPresentation:", 1);
    share_sheet_log();
    v4 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);

    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v4, OS_SIGNPOST_INTERVAL_END, v6, "PresentShareSheetDelayed", " enableTelemetry=YES ", buf, 2u);
    }

    v7.receiver = self;
    v7.super_class = (Class)UIActivityViewController;
    -[UIActivityViewController _endDelayingPresentation](&v7, sel__endDelayingPresentation);
  }
}

- (void)__viewControllerWillBePresented:(BOOL)a3
{
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  void *v7;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIActivityViewController;
  -[UIActivityViewController __viewControllerWillBePresented:](&v9, sel___viewControllerWillBePresented_, a3);
  if (!-[UIActivityViewController clientAttemptedInitialPresentationOrEmbeddingTimestamp](self, "clientAttemptedInitialPresentationOrEmbeddingTimestamp"))
  {
    -[UIActivityViewController setClientAttemptedInitialPresentationOrEmbeddingTimestamp:](self, "setClientAttemptedInitialPresentationOrEmbeddingTimestamp:", mach_continuous_time());
    share_sheet_log();
    v4 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_make_with_pointer(v5, self);

    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      *(_WORD *)v8 = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PresentShareSheet", " enableTelemetry=YES ", v8, 2u);
    }

  }
  -[UIActivityViewController _createMainPresenterIfNeeded](self, "_createMainPresenterIfNeeded");
  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activityViewControllerWillBePresented:", self);

}

- (double)_displayHeight
{
  void *v3;
  double v4;

  if (!-[UIActivityViewController clientAttemptedInitialPresentationOrEmbeddingTimestamp](self, "clientAttemptedInitialPresentationOrEmbeddingTimestamp"))-[UIActivityViewController setClientAttemptedInitialPresentationOrEmbeddingTimestamp:](self, "setClientAttemptedInitialPresentationOrEmbeddingTimestamp:", mach_continuous_time());
  -[UIActivityViewController _createMainPresenterIfNeeded](self, "_createMainPresenterIfNeeded");
  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityViewControllerWillBeEmbedded:", self);

  -[UIActivityViewController preferredContentSize](self, "preferredContentSize");
  return v4;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  return a3 != 2 || (v5 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UIActivityViewController _updateSheetPresentationController:](self, "_updateSheetPresentationController:", v5);

}

- (id)_presentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;

  v7 = (objc_class *)MEMORY[0x1E0DC4188];
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend([v7 alloc], "initWithPresentedViewController:presentingViewController:", v9, v8);

  -[UIActivityViewController _updateSheetPresentationController:](self, "_updateSheetPresentationController:", v10);
  return v10;
}

- (void)_updateSheetPresentationController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "_setShouldDismissWhenTappedOutside:", 1);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_referenceBounds");
    v9 = v8;
    v11 = v10;

    -[UIActivityViewController customViewController](self, "customViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = 0;
    else
      v13 = v9 != 320.0 || v11 != 568.0;
    objc_msgSend(v4, "_setWantsBottomAttachedInCompactHeight:", v13);

    objc_msgSend(v4, "_setWidthFollowsPreferredContentSizeWhenBottomAttached:", 1);
    -[UIActivityViewController includedActivityTypes](self, "includedActivityTypes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "containsObject:", CFSTR("com.apple.UIKit.activity.AirDrop")))
    {
      -[UIActivityViewController includedActivityTypes](self, "includedActivityTypes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count") == 1;

    }
    else
    {
      v16 = 0;
    }

    -[UIActivityViewController traitCollection](self, "traitCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "preferredContentSizeCategory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v18))
    {

    }
    else
    {
      -[UIActivityViewController customViewController](self, "customViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        if (v16)
          goto LABEL_15;
        objc_msgSend(MEMORY[0x1E0DC4330], "_mediumDetent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC4330], "_largeDetent", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23[1] = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "_setDetents:", v22);

        goto LABEL_14;
      }
    }
    objc_msgSend(MEMORY[0x1E0DC4330], "_largeDetent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setDetents:", v21);
LABEL_14:

  }
LABEL_15:

}

- (void)_performActivity:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "activityType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "UIAVC: perform activity:%@", (uint8_t *)&v8, 0xCu);

  }
  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performActivity:", v4);

}

- (void)_executeActivity
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "UIAVC: execute activity", v5, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("_UIActivityViewControllerExecuteActivityNotification"), self, 0);

}

- (void)_primeExtensionDiscovery
{
  id v3;

  -[UIActivityViewController _createMainPresenterIfNeeded](self, "_createMainPresenterIfNeeded");
  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preheatExtensionDiscovery");

}

- (void)_setSelectedAssetIdentifiers:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToArray:", self->_selectedAssetIdentifiers) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedAssetIdentifiers, a3);
    -[UIActivityViewController mainPresenter](self, "mainPresenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSelectedAssetIdentifiers:", v6);

  }
}

- (void)_updateActivityItems:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIActivityViewController applicationActivities](self, "applicationActivities");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIActivityViewController _updateActivityItems:applicationActivities:](self, "_updateActivityItems:applicationActivities:", v4, v5);

}

- (void)_reloadActivity:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadActivity:", v4);

}

- (void)_updateActivityItems:(id)a3 applicationActivities:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;
  int v11;
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  NSArray *v20;
  __int16 v21;
  NSArray *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self->_activityItems;
  v9 = (NSArray *)v6;
  v10 = v9;
  if (v8 == v9)
  {
    v11 = 0;
  }
  else if ((v9 != 0) == (v8 == 0))
  {
    v11 = 1;
  }
  else
  {
    v11 = -[NSArray isEqual:](v8, "isEqual:", v9) ^ 1;
  }

  v12 = self->_applicationActivities;
  v13 = (NSArray *)v7;
  v14 = v13;
  if (v12 == v13)
  {
    v15 = 0;
LABEL_10:

    if ((v11 | v15) != 1)
      goto LABEL_16;
    goto LABEL_13;
  }
  if ((v13 != 0) != (v12 == 0))
  {
    v15 = -[NSArray isEqual:](v12, "isEqual:", v13) ^ 1;
    goto LABEL_10;
  }

LABEL_13:
  share_sheet_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138478083;
    v20 = v10;
    v21 = 2112;
    v22 = v14;
    _os_log_impl(&dword_19E419000, v16, OS_LOG_TYPE_DEFAULT, "UIAVC: update activity items:%{private}@ applicationActivities:%@", (uint8_t *)&v19, 0x16u);
  }

  -[UIActivityViewController setActivityItems:](self, "setActivityItems:", v10);
  -[UIActivityViewController setApplicationActivities:](self, "setApplicationActivities:", v14);
  -[UIActivityViewController _createContextFromCurrentState](self, "_createContextFromCurrentState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "updateWithContext:", v17);

LABEL_16:
}

- (void)_cancel
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "UIAVC: cancel", v5, 2u);
  }

  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismiss");

}

- (id)_titleForActivity:(id)a3
{
  return 0;
}

- (void)_prepareActivity:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[UIActivityViewController _prepareActivity:](self, "_prepareActivity:", a3);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

- (BOOL)_shouldShowSystemActivityType:(id)a3
{
  return 1;
}

+ (double)_asyncPresentationTimeout
{
  return 0.5;
}

- (void)setCollaborationMode:(int64_t)a3
{
  void *v4;
  id v5;

  self->_collaborationMode = a3;
  -[UIActivityViewController _createContextFromCurrentState](self, "_createContextFromCurrentState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateWithContext:", v5);

}

- (void)performAddToAlbumExtensionWithCompletionHandler:(id)a3
{
  -[UIActivityViewController _performActivityWithType:completionHandler:](self, "_performActivityWithType:completionHandler:", CFSTR("com.apple.mobileslideshow.StreamShareService"), a3);
}

- (void)_performActivityWithType:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((_ShareSheetHostCanPerformActivitySkippingShareSheet() & 1) != 0)
  {
    v12 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityViewController setIncludedActivityTypes:](self, "setIncludedActivityTypes:", v8);

    -[UIActivityViewController _createMainPresenterIfNeeded](self, "_createMainPresenterIfNeeded");
    -[UIActivityViewController mainPresenter](self, "mainPresenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "prepareNonUIShareSheet");

    -[UIActivityViewController mainPresenter](self, "mainPresenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "performActivityWithType:completionHandler:", v6, v7);

    v7 = v10;
  }
  else
  {
    share_sheet_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_19E419000, v11, OS_LOG_TYPE_DEFAULT, "Not performing activity '%@' because entitlement is needed", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (void)_findSupportedActivitiesWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[UIActivityViewController _createMainPresenterIfNeeded](self, "_createMainPresenterIfNeeded");
  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareNonUIShareSheet");

  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_findSupportedActivitiesWithCompletionHandler:", v4);

}

- (void)_presentationControllerDidDismiss:(id)a3
{
  NSObject *v4;
  int v5;
  UIActivityViewController *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  share_sheet_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_19E419000, v4, OS_LOG_TYPE_DEFAULT, "UIAVC:%@ was dismissed manually.", (uint8_t *)&v5, 0xCu);
  }

  -[UIActivityViewController _cancel](self, "_cancel");
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIActivityViewController;
  -[UIActivityViewController preferredContentSizeDidChangeForChildContentContainer:](&v5, sel_preferredContentSizeDidChangeForChildContentContainer_, a3);
  -[UIActivityViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (BOOL)_allowsStylingSheetsAsCards
{
  return -[UIActivityViewController isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class());
}

- (BOOL)_requiresCustomPresentationController
{
  return -[UIActivityViewController modalPresentationStyle](self, "modalPresentationStyle") == 2;
}

- (void)_didResignContentViewControllerOfPopover:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityViewControllerDidResignContentViewControllerOfPopover:", self);

  v6.receiver = self;
  v6.super_class = (Class)UIActivityViewController;
  -[UIActivityViewController _didResignContentViewControllerOfPopover:](&v6, sel__didResignContentViewControllerOfPopover_, v4);

}

- (void)mainPresenterIsReadyToInteract:(id)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[UIActivityViewController _readyToInteract](self, "_readyToInteract");
}

- (void)mainPresenter:(id)a3 willCompleteActivity:(id)a4 withSuccess:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  NSObject *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v5 = a5;
  v16 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  share_sheet_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_19E419000, v8, OS_LOG_TYPE_DEFAULT, "UIAVC: will complete activity:%@ success:%@", (uint8_t *)&v12, 0x16u);

  }
  -[UIActivityViewController preCompletionHandler](self, "preCompletionHandler");
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v7, "activityType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _BOOL8))v10)[2](v10, v11, v5);

    -[UIActivityViewController setPreCompletionHandler:](self, "setPreCompletionHandler:", 0);
  }

}

- (void)mainPresenter:(id)a3 didCompleteActivity:(id)a4 withSuccess:(BOOL)a5 returnedItems:(id)a6 error:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  _BOOL4 v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  void *v23;
  void *v24;
  int v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v9 = a5;
  v35 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a6;
  v13 = a7;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v14 = 1;
  if (dyld_program_sdk_at_least()
    && !v9
    && (-[UIActivityViewController isBeingDismissed](self, "isBeingDismissed") & 1) == 0)
  {
    -[UIActivityViewController presentingViewController](self, "presentingViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15 == 0;

  }
  share_sheet_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activityType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138413314;
    v26 = v11;
    v27 = 2114;
    v28 = v17;
    v29 = 2114;
    v30 = v13;
    v31 = 2112;
    v32 = v18;
    v33 = 2112;
    v34 = v19;
    _os_log_impl(&dword_19E419000, v16, OS_LOG_TYPE_DEFAULT, "UIAVC: did complete activity:%@ (success=%{public}@, error=%{public}@) activityType:%@ shouldCallCompletionHandler:%@", (uint8_t *)&v25, 0x34u);

  }
  if (v14)
  {
    -[UIActivityViewController completionWithItemsHandler](self, "completionWithItemsHandler");
    v20 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[UIActivityViewController completionHandler](self, "completionHandler");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void (**)(_QWORD, _QWORD, _QWORD))v21;
    if (v20)
    {
      objc_msgSend(v11, "activityType");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _BOOL8, id, id))v20)[2](v20, v23, v9, v12, v13);

      -[UIActivityViewController setCompletionWithItemsHandler:](self, "setCompletionWithItemsHandler:", 0);
    }
    else if (v21)
    {
      objc_msgSend(v11, "activityType");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _BOOL8))v22)[2](v22, v24, v9);

      -[UIActivityViewController setCompletionHandler:](self, "setCompletionHandler:", 0);
    }

  }
}

- (BOOL)isCollaborationSelected
{
  void *v2;
  char v3;

  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCollaborationSelected");

  return v3;
}

- (void)runScrollingTestWithName:(id)a3 type:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  -[UIActivityViewController mainPresenter](self, "mainPresenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__UIActivityViewController_runScrollingTestWithName_type_completionHandler___block_invoke;
  v13[3] = &unk_1E4002528;
  v15 = v9;
  v16 = a4;
  v14 = v8;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "runScrollingTestWithName:type:completionHandler:", v12, a4, v13);

}

uint64_t __76__UIActivityViewController_runScrollingTestWithName_type_completionHandler___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
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
    v4 = a1[6];
    v6 = 138412546;
    v7 = v3;
    v8 = 2048;
    v9 = v4;
    _os_log_impl(&dword_19E419000, v2, OS_LOG_TYPE_DEFAULT, "did complete scrolling test with name:%@ type:%ld", (uint8_t *)&v6, 0x16u);
  }

  result = a1[5];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (UIActivityViewControllerCompletionHandler)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(UIActivityViewControllerCompletionHandler)completionHandler
{
  objc_setProperty_nonatomic_copy(self, a2, completionHandler, 1000);
}

- (UIActivityViewControllerCompletionWithItemsHandler)completionWithItemsHandler
{
  return self->_completionWithItemsHandler;
}

- (void)setCompletionWithItemsHandler:(UIActivityViewControllerCompletionWithItemsHandler)completionWithItemsHandler
{
  objc_setProperty_nonatomic_copy(self, a2, completionWithItemsHandler, 1008);
}

- (NSArray)excludedActivityTypes
{
  return self->_excludedActivityTypes;
}

- (void)setExcludedActivityTypes:(NSArray *)excludedActivityTypes
{
  objc_setProperty_nonatomic_copy(self, a2, excludedActivityTypes, 1016);
}

- (BOOL)allowsProminentActivity
{
  return self->_allowsProminentActivity;
}

- (NSArray)activityItems
{
  return self->_activityItems;
}

- (void)setActivityItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (NSArray)applicationActivities
{
  return self->_applicationActivities;
}

- (void)setApplicationActivities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (NSString)userDefaultsIdentifier
{
  return self->_userDefaultsIdentifier;
}

- (void)setUserDefaultsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (BOOL)shouldSuggestFamilyMembers
{
  return self->_shouldSuggestFamilyMembers;
}

- (void)setShouldSuggestFamilyMembers:(BOOL)a3
{
  self->_shouldSuggestFamilyMembers = a3;
}

- (NSArray)peopleSuggestionBundleIds
{
  return self->_peopleSuggestionBundleIds;
}

- (void)setPeopleSuggestionBundleIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (UIActivityItemsConfigurationReading)cachedActivityItemsConfiguration
{
  return self->_cachedActivityItemsConfiguration;
}

- (void)setCachedActivityItemsConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_cachedActivityItemsConfiguration, a3);
}

- (UIActivityItemsConfigurationProviding)clientActivityItemsConfigurationSource
{
  return self->_clientActivityItemsConfigurationSource;
}

- (void)setClientActivityItemsConfigurationSource:(id)a3
{
  objc_storeStrong((id *)&self->_clientActivityItemsConfigurationSource, a3);
}

- (SHSheetPresenter)mainPresenter
{
  return self->_mainPresenter;
}

- (id)_activityPresentationCompletionHandler
{
  return self->_activityPresentationCompletionHandler;
}

- (void)_setActivityPresentationCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1088);
}

- (unint64_t)viewWillAppearTimestamp
{
  return self->_viewWillAppearTimestamp;
}

- (void)setViewWillAppearTimestamp:(unint64_t)a3
{
  self->_viewWillAppearTimestamp = a3;
}

- (unint64_t)readyToInteractTimestamp
{
  return self->_readyToInteractTimestamp;
}

- (void)setReadyToInteractTimestamp:(unint64_t)a3
{
  self->_readyToInteractTimestamp = a3;
}

- (unint64_t)creationTimestamp
{
  return self->_creationTimestamp;
}

- (void)setCreationTimestamp:(unint64_t)a3
{
  self->_creationTimestamp = a3;
}

- (unint64_t)clientAttemptedInitialPresentationOrEmbeddingTimestamp
{
  return self->_clientAttemptedInitialPresentationOrEmbeddingTimestamp;
}

- (void)setClientAttemptedInitialPresentationOrEmbeddingTimestamp:(unint64_t)a3
{
  self->_clientAttemptedInitialPresentationOrEmbeddingTimestamp = a3;
}

- (BOOL)didStartDelayingPresentation
{
  return self->_didStartDelayingPresentation;
}

- (void)setDidStartDelayingPresentation:(BOOL)a3
{
  self->_didStartDelayingPresentation = a3;
}

- (BOOL)didEndDelayingPresentation
{
  return self->_didEndDelayingPresentation;
}

- (void)setDidEndDelayingPresentation:(BOOL)a3
{
  self->_didEndDelayingPresentation = a3;
}

- (NSNumber)customViewControllerVerticalInsetWrapper
{
  return self->_customViewControllerVerticalInsetWrapper;
}

- (void)setCustomViewControllerVerticalInsetWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_customViewControllerVerticalInsetWrapper, a3);
}

- (NSNumber)customViewControllerSectionHeightWrapper
{
  return self->_customViewControllerSectionHeightWrapper;
}

- (void)setCustomViewControllerSectionHeightWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_customViewControllerSectionHeightWrapper, a3);
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1144);
}

- (id)_shareSheetReadyToInteractHandler
{
  return self->_shareSheetReadyToInteractHandler;
}

- (void)_setShareSheetReadyToInteractHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1152);
}

- (id)preCompletionHandler
{
  return self->_preCompletionHandler;
}

- (void)setPreCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1160);
}

- (NSArray)includedActivityTypes
{
  return self->_includedActivityTypes;
}

- (void)setIncludedActivityTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1168);
}

- (int64_t)excludedActivityCategories
{
  return self->_excludedActivityCategories;
}

- (void)setExcludedActivityCategories:(int64_t)a3
{
  self->_excludedActivityCategories = a3;
}

- (NSArray)activityTypeOrder
{
  return self->_activityTypeOrder;
}

- (void)setActivityTypeOrder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1184);
}

- (BOOL)allowsCustomPresentationStyle
{
  return self->_allowsCustomPresentationStyle;
}

- (void)setAllowsCustomPresentationStyle:(BOOL)a3
{
  self->_allowsCustomPresentationStyle = a3;
}

- (BOOL)allowsEmbedding
{
  return self->_allowsEmbedding;
}

- (BOOL)showKeyboardAutomatically
{
  return self->_showKeyboardAutomatically;
}

- (void)setShowKeyboardAutomatically:(BOOL)a3
{
  self->_showKeyboardAutomatically = a3;
}

- (BOOL)whitelistActionActivitiesOnly
{
  return self->_whitelistActionActivitiesOnly;
}

- (void)setWhitelistActionActivitiesOnly:(BOOL)a3
{
  self->_whitelistActionActivitiesOnly = a3;
}

- (BOOL)hideHeaderView
{
  return self->_hideHeaderView;
}

- (void)setHideHeaderView:(BOOL)a3
{
  self->_hideHeaderView = a3;
}

- (BOOL)hideNavigationBar
{
  return self->_hideNavigationBar;
}

- (void)setHideNavigationBar:(BOOL)a3
{
  self->_hideNavigationBar = a3;
}

- (BOOL)hideSuggestions
{
  return self->_hideSuggestions;
}

- (void)setHideSuggestions:(BOOL)a3
{
  self->_hideSuggestions = a3;
}

- (NSString)topContentSectionText
{
  return self->_topContentSectionText;
}

- (void)setTopContentSectionText:(id)a3
{
  objc_storeStrong((id *)&self->_topContentSectionText, a3);
}

- (int64_t)sharingStyle
{
  return self->_sharingStyle;
}

- (void)setSharingStyle:(int64_t)a3
{
  self->_sharingStyle = a3;
}

- (NSArray)heroActionActivityTypes
{
  return self->_heroActionActivityTypes;
}

- (void)setHeroActionActivityTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1208);
}

- (BOOL)showHeroActionsHorizontally
{
  return self->_showHeroActionsHorizontally;
}

- (void)setShowHeroActionsHorizontally:(BOOL)a3
{
  self->_showHeroActionsHorizontally = a3;
}

- (BOOL)showCustomScene
{
  return self->_showCustomScene;
}

- (void)setShowCustomScene:(BOOL)a3
{
  self->_showCustomScene = a3;
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (UIViewController)activityViewController
{
  return self->_activityViewController;
}

- (void)setActivityViewController:(id)a3
{
  objc_storeStrong((id *)&self->_activityViewController, a3);
}

- (UIActivityViewControllerAirDropDelegate)airDropDelegate
{
  return (UIActivityViewControllerAirDropDelegate *)objc_loadWeakRetained((id *)&self->_airDropDelegate);
}

- (void)setAirDropDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_airDropDelegate, a3);
}

- (UIActivityViewControllerObjectManipulationDelegate)objectManipulationDelegate
{
  return (UIActivityViewControllerObjectManipulationDelegate *)objc_loadWeakRetained((id *)&self->_objectManipulationDelegate);
}

- (void)setObjectManipulationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_objectManipulationDelegate, a3);
}

- (UIActivityViewControllerCollaborationDelegate)collaborationDelegate
{
  return (UIActivityViewControllerCollaborationDelegate *)objc_loadWeakRetained((id *)&self->_collaborationDelegate);
}

- (void)setCollaborationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_collaborationDelegate, a3);
}

- (int64_t)collaborationMode
{
  return self->_collaborationMode;
}

- (UIViewController)photosCarouselViewController
{
  return self->_photosCarouselViewController;
}

- (LPLinkMetadata)photosHeaderMetadata
{
  return self->_photosHeaderMetadata;
}

- (void)setPhotosHeaderMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_photosHeaderMetadata, a3);
}

- (UIViewController)photosStackViewController
{
  return self->_photosStackViewController;
}

- (void)setPhotosStackViewController:(id)a3
{
  objc_storeStrong((id *)&self->_photosStackViewController, a3);
}

- (UIActivityViewControllerPhotosDelegate)photosDelegate
{
  return (UIActivityViewControllerPhotosDelegate *)objc_loadWeakRetained((id *)&self->_photosDelegate);
}

- (void)setPhotosDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_photosDelegate, a3);
}

- (BOOL)enableNewDesignInPhotos
{
  return self->_enableNewDesignInPhotos;
}

- (void)setEnableNewDesignInPhotos:(BOOL)a3
{
  self->_enableNewDesignInPhotos = a3;
}

- (NSDictionary)_initialPhotosAssetDetails
{
  return self->_initialPhotosAssetDetails;
}

- (void)_setInitialPhotosAssetDetails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1296);
}

- (NSArray)_selectedAssetIdentifiers
{
  return self->_selectedAssetIdentifiers;
}

- (NSSet)_photosAssetIdentifiers
{
  return self->_photosAssetIdentifiers;
}

- (void)_setPhotosAssetIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1312);
}

- (BOOL)configureForPhotosEdit
{
  return self->_configureForPhotosEdit;
}

- (void)setConfigureForPhotosEdit:(BOOL)a3
{
  self->_configureForPhotosEdit = a3;
}

- (BOOL)configureForCloudSharing
{
  return self->_configureForCloudSharing;
}

- (void)setConfigureForCloudSharing:(BOOL)a3
{
  self->_configureForCloudSharing = a3;
}

- (NSURL)managedFileURL
{
  return self->_managedFileURL;
}

- (void)setManagedFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1320);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedFileURL, 0);
  objc_storeStrong((id *)&self->_photosAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_selectedAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_initialPhotosAssetDetails, 0);
  objc_destroyWeak((id *)&self->_photosDelegate);
  objc_storeStrong((id *)&self->_photosStackViewController, 0);
  objc_storeStrong((id *)&self->_photosHeaderMetadata, 0);
  objc_storeStrong((id *)&self->_photosCarouselViewController, 0);
  objc_destroyWeak((id *)&self->_collaborationDelegate);
  objc_destroyWeak((id *)&self->_objectManipulationDelegate);
  objc_destroyWeak((id *)&self->_airDropDelegate);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_heroActionActivityTypes, 0);
  objc_storeStrong((id *)&self->_topContentSectionText, 0);
  objc_storeStrong((id *)&self->_activityTypeOrder, 0);
  objc_storeStrong((id *)&self->_includedActivityTypes, 0);
  objc_storeStrong(&self->_preCompletionHandler, 0);
  objc_storeStrong(&self->_shareSheetReadyToInteractHandler, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_customViewControllerSectionHeightWrapper, 0);
  objc_storeStrong((id *)&self->_customViewControllerVerticalInsetWrapper, 0);
  objc_storeStrong(&self->_activityPresentationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_mainPresenter, 0);
  objc_storeStrong((id *)&self->_clientActivityItemsConfigurationSource, 0);
  objc_storeStrong((id *)&self->_cachedActivityItemsConfiguration, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionBundleIds, 0);
  objc_storeStrong((id *)&self->_userDefaultsIdentifier, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_applicationActivities, 0);
  objc_storeStrong((id *)&self->_activityItems, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong(&self->_completionWithItemsHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_remoteSheet, 0);
}

- (void)setPhotosCarouselViewController:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_19E419000, a2, OS_LOG_TYPE_ERROR, "setting a customViewController:%@ requires the entitlement  \"com.apple.sharesheet.allow-custom-view\", (uint8_t *)&v5, 0xCu);

}

@end
