@implementation SHSheetContext

- (SHSheetContext)initWithActivityViewController:(id)a3 activityItems:(id)a4
{
  id v6;
  id v7;
  SHSheetContext *v8;
  SHSheetContext *v9;
  uint64_t v10;
  NSArray *activityItems;
  uint64_t v12;
  NSArray *activityTypesToCreateInShareService;
  int v14;
  BOOL v15;
  int IsAppleApp;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SHSheetContext;
  v8 = -[SHSheetContext init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_activityViewController, v6);
    v10 = objc_msgSend(v7, "copy");
    activityItems = v9->_activityItems;
    v9->_activityItems = (NSArray *)v10;

    v19[0] = CFSTR("com.apple.UIKit.activity.RemoteExtension");
    v19[1] = CFSTR("com.apple.UIKit.activity.RemoteOpenInApplication");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v12 = objc_claimAutoreleasedReturnValue();
    activityTypesToCreateInShareService = v9->_activityTypesToCreateInShareService;
    v9->_activityTypesToCreateInShareService = (NSArray *)v12;

    v14 = _os_feature_enabled_impl();
    v15 = v14;
    if (v14 && _ShareSheetHostCanRenderInProcess())
    {
      IsAppleApp = _ShareSheetIsAppleApp();
      if (IsAppleApp)
        LOBYTE(IsAppleApp) = _ShareSheetCanAccessContactsInCurrentProcess();
      v9->_instantShareSheet = IsAppleApp;
    }
    else
    {
      v9->_useRemoteUIService = v15;
    }
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  void *v17;
  void *v18;
  int64_t v19;
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
  void *v31;
  void *v32;
  objc_super v33;

  v20 = (void *)MEMORY[0x1E0CB3940];
  v33.receiver = self;
  v33.super_class = (Class)SHSheetContext;
  -[SHSheetContext description](&v33, sel_description);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext activityViewController](self, "activityViewController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext activityItems](self, "activityItems");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext applicationActivities](self, "applicationActivities");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext activityTypesToCreateInShareService](self, "activityTypesToCreateInShareService");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SHSheetContext sharingStyle](self, "sharingStyle");
  -[SHSheetContext activityTypeOrder](self, "activityTypeOrder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext excludedActivityTypes](self, "excludedActivityTypes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext includedActivityTypes](self, "includedActivityTypes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SHSheetContext excludedActivityCategories](self, "excludedActivityCategories");
  -[SHSheetContext allowsEmbedding](self, "allowsEmbedding");
  NSStringFromBOOL();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext configureForCloudSharing](self, "configureForCloudSharing");
  NSStringFromBOOL();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext configureForPhotosEdit](self, "configureForPhotosEdit");
  NSStringFromBOOL();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext hideHeaderView](self, "hideHeaderView");
  NSStringFromBOOL();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext hideSuggestions](self, "hideSuggestions");
  NSStringFromBOOL();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext isContentManaged](self, "isContentManaged");
  NSStringFromBOOL();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext shouldSuggestFamilyMembers](self, "shouldSuggestFamilyMembers");
  NSStringFromBOOL();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext showKeyboardAutomatically](self, "showKeyboardAutomatically");
  NSStringFromBOOL();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext whitelistActionActivitiesOnly](self, "whitelistActionActivitiesOnly");
  NSStringFromBOOL();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext photosHeaderMetadata](self, "photosHeaderMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext objectManipulationDelegate](self, "objectManipulationDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext instantShareSheet](self, "instantShareSheet");
  NSStringFromBOOL();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext useRemoteUIService](self, "useRemoteUIService");
  NSStringFromBOOL();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext peopleSuggestionBundleIds](self, "peopleSuggestionBundleIds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext collaborationModeRestriction](self, "collaborationModeRestriction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext managedFileURL](self, "managedFileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetContext showCustomScene](self, "showCustomScene");
  NSStringFromBOOL();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@ activityViewController:%@ activityItems:%@ applicationActivities:%@ activityTypesToCreateInShareService:%@ sharingStyle:%ld activityTypeOrder:%@ excludedActivityTypes:%@ includedActivityTypes:%@ excludedActivityCategories:%ld allowsEmbedding:%@ configureForCloudSharing:%@ configureForPhotosEdit:%@ hideHeaderView:%@ hideSuggestions:%@ isContentManaged:%@ shouldSuggestFamilyMembers:%@ showKeyboardAutomatically:%@ whitelistActionActivitiesOnly:%@ photosHeaderMetadata:%@ objectManipulationDelegate:%@ instantShareSheet:%@ useRemoteUIService:%@ peopleSuggestionBundleIds:%@ collaborationModeRestriction:%@ managedFileURL:%@ showCustomScene:%@ xrRenderingMode:%lu>"), v32, v29, v31, v28, v30, v19, v18, v27, v17, v16, v26, v15, v25, v14, v24, v23,
    v22,
    v13,
    v11,
    v10,
    v12,
    v9,
    v3,
    v4,
    v5,
    v6,
    v7,
    -[SHSheetContext xrRenderingMode](self, "xrRenderingMode"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (UIActivityViewController)activityViewController
{
  return (UIActivityViewController *)objc_loadWeakRetained((id *)&self->_activityViewController);
}

- (NSArray)activityItems
{
  return self->_activityItems;
}

- (NSArray)activityTypesToCreateInShareService
{
  return self->_activityTypesToCreateInShareService;
}

- (int64_t)sharingStyle
{
  return self->_sharingStyle;
}

- (void)setSharingStyle:(int64_t)a3
{
  self->_sharingStyle = a3;
}

- (NSArray)applicationActivities
{
  return self->_applicationActivities;
}

- (void)setApplicationActivities:(id)a3
{
  objc_storeStrong((id *)&self->_applicationActivities, a3);
}

- (NSArray)activityTypeOrder
{
  return self->_activityTypeOrder;
}

- (void)setActivityTypeOrder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)excludedActivityTypes
{
  return self->_excludedActivityTypes;
}

- (void)setExcludedActivityTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)includedActivityTypes
{
  return self->_includedActivityTypes;
}

- (void)setIncludedActivityTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)heroActionActivityTypes
{
  return self->_heroActionActivityTypes;
}

- (void)setHeroActionActivityTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int64_t)excludedActivityCategories
{
  return self->_excludedActivityCategories;
}

- (void)setExcludedActivityCategories:(int64_t)a3
{
  self->_excludedActivityCategories = a3;
}

- (BOOL)allowsEmbedding
{
  return self->_allowsEmbedding;
}

- (void)setAllowsEmbedding:(BOOL)a3
{
  self->_allowsEmbedding = a3;
}

- (BOOL)configureForCloudSharing
{
  return self->_configureForCloudSharing;
}

- (void)setConfigureForCloudSharing:(BOOL)a3
{
  self->_configureForCloudSharing = a3;
}

- (BOOL)configureForPhotosEdit
{
  return self->_configureForPhotosEdit;
}

- (void)setConfigureForPhotosEdit:(BOOL)a3
{
  self->_configureForPhotosEdit = a3;
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

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (void)setIsContentManaged:(BOOL)a3
{
  self->_isContentManaged = a3;
}

- (BOOL)shouldSuggestFamilyMembers
{
  return self->_shouldSuggestFamilyMembers;
}

- (void)setShouldSuggestFamilyMembers:(BOOL)a3
{
  self->_shouldSuggestFamilyMembers = a3;
}

- (BOOL)allowsProminentActivity
{
  return self->_allowsProminentActivity;
}

- (void)setAllowsProminentActivity:(BOOL)a3
{
  self->_allowsProminentActivity = a3;
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

- (BOOL)instantShareSheet
{
  return self->_instantShareSheet;
}

- (void)setInstantShareSheet:(BOOL)a3
{
  self->_instantShareSheet = a3;
}

- (BOOL)useRemoteUIService
{
  return self->_useRemoteUIService;
}

- (void)setUseRemoteUIService:(BOOL)a3
{
  self->_useRemoteUIService = a3;
}

- (BOOL)showCustomScene
{
  return self->_showCustomScene;
}

- (void)setShowCustomScene:(BOOL)a3
{
  self->_showCustomScene = a3;
}

- (BOOL)showHeroActionsHorizontally
{
  return self->_showHeroActionsHorizontally;
}

- (void)setShowHeroActionsHorizontally:(BOOL)a3
{
  self->_showHeroActionsHorizontally = a3;
}

- (LPLinkMetadata)photosHeaderMetadata
{
  return self->_photosHeaderMetadata;
}

- (void)setPhotosHeaderMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_photosHeaderMetadata, a3);
}

- (NSArray)selectedAssetIdentifiers
{
  return self->_selectedAssetIdentifiers;
}

- (void)setSelectedAssetIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSArray)peopleSuggestionBundleIds
{
  return self->_peopleSuggestionBundleIds;
}

- (void)setPeopleSuggestionBundleIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (UIActivityCollaborationModeRestriction)collaborationModeRestriction
{
  return self->_collaborationModeRestriction;
}

- (void)setCollaborationModeRestriction:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationModeRestriction, a3);
}

- (NSURL)managedFileURL
{
  return self->_managedFileURL;
}

- (void)setManagedFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (unint64_t)xrRenderingMode
{
  return self->_xrRenderingMode;
}

- (void)setXrRenderingMode:(unint64_t)a3
{
  self->_xrRenderingMode = a3;
}

- (UIActivityViewControllerObjectManipulationDelegate)objectManipulationDelegate
{
  return (UIActivityViewControllerObjectManipulationDelegate *)objc_loadWeakRetained((id *)&self->_objectManipulationDelegate);
}

- (void)setObjectManipulationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_objectManipulationDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_objectManipulationDelegate);
  objc_storeStrong((id *)&self->_managedFileURL, 0);
  objc_storeStrong((id *)&self->_collaborationModeRestriction, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionBundleIds, 0);
  objc_storeStrong((id *)&self->_selectedAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_photosHeaderMetadata, 0);
  objc_storeStrong((id *)&self->_topContentSectionText, 0);
  objc_storeStrong((id *)&self->_heroActionActivityTypes, 0);
  objc_storeStrong((id *)&self->_includedActivityTypes, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_activityTypeOrder, 0);
  objc_storeStrong((id *)&self->_applicationActivities, 0);
  objc_storeStrong((id *)&self->_activityTypesToCreateInShareService, 0);
  objc_storeStrong((id *)&self->_activityItems, 0);
  objc_destroyWeak((id *)&self->_activityViewController);
}

@end
