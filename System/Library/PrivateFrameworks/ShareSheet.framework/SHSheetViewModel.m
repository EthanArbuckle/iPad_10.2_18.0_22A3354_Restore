@implementation SHSheetViewModel

- (SHSheetViewModel)initWithSession:(id)a3
{
  id v5;
  SHSheetViewModel *v6;
  SHSheetViewModel *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSArray *peopleSuggestions;
  uint64_t v21;
  NSArray *activities;
  void *v23;
  uint64_t v24;
  NSArray *metadataValues;
  void *v26;
  uint64_t v27;
  NSArray *urlRequests;
  NSArray *urlSandboxExtensions;
  uint64_t v30;
  NSString *customOptionsTitle;
  uint64_t v32;
  NSAttributedString *customHeaderButtonTitle;
  uint64_t v34;
  UIColor *customHeaderButtonColor;
  void *v36;
  uint64_t v37;
  UIViewController *customViewController;
  void *v39;
  uint64_t v40;
  NSNumber *customViewControllerVerticalInsetWrapper;
  void *v42;
  uint64_t v43;
  NSNumber *customViewControllerSectionHeightWrapper;
  void *v45;
  uint64_t v46;
  NSArray *peopleSuggestionProxies;
  void *v48;
  uint64_t v49;
  NSArray *shareProxies;
  void *v51;
  uint64_t v52;
  NSArray *actionProxies;
  void *v54;
  uint64_t v55;
  NSDictionary *activitiesByUUID;
  void *v57;
  uint64_t v58;
  NSArray *applicationActivityTypes;
  void *v60;
  uint64_t v61;
  NSNumber *nearbyCountSlotID;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  NSString *collaborationModeTitle;
  void *v73;
  uint64_t v74;
  SLCollaborationFooterViewModel *collaborationFooterViewModel;
  objc_super v77;

  v5 = a3;
  v77.receiver = self;
  v77.super_class = (Class)SHSheetViewModel;
  v6 = -[SHSheetViewModel init](&v77, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    objc_msgSend(v5, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "peopleSuggestions");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = (void *)MEMORY[0x1E0C9AA60];
    if (v9)
      v12 = (void *)v9;
    else
      v12 = (void *)MEMORY[0x1E0C9AA60];
    v13 = v12;

    objc_msgSend(v5, "activitiesManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "orderedActivities");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (void *)v15;
    else
      v17 = v11;
    v18 = v17;

    v19 = objc_msgSend(v13, "copy");
    peopleSuggestions = v7->_peopleSuggestions;
    v7->_peopleSuggestions = (NSArray *)v19;

    v21 = objc_msgSend(v18, "copy");
    activities = v7->_activities;
    v7->_activities = (NSArray *)v21;

    objc_msgSend(v5, "metadataCollection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "metadatas");
    v24 = objc_claimAutoreleasedReturnValue();
    metadataValues = v7->_metadataValues;
    v7->_metadataValues = (NSArray *)v24;

    objc_msgSend(v5, "activityItemsManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "urlRequests");
    v27 = objc_claimAutoreleasedReturnValue();
    urlRequests = v7->_urlRequests;
    v7->_urlRequests = (NSArray *)v27;

    urlSandboxExtensions = v7->_urlSandboxExtensions;
    v7->_urlSandboxExtensions = 0;

    v7->_showOptions = objc_msgSend(v5, "showOptions");
    objc_msgSend(v5, "customOptionsTitle");
    v30 = objc_claimAutoreleasedReturnValue();
    customOptionsTitle = v7->_customOptionsTitle;
    v7->_customOptionsTitle = (NSString *)v30;

    v7->_showCustomHeaderButton = objc_msgSend(v5, "showSharePlayProminently");
    v7->_showHeaderSpecialization = objc_msgSend(v5, "showHeaderSpecialization");
    SHSheetCustomHeaderButtonTitle(objc_msgSend(v5, "showSharePlayProminently"));
    v32 = objc_claimAutoreleasedReturnValue();
    customHeaderButtonTitle = v7->_customHeaderButtonTitle;
    v7->_customHeaderButtonTitle = (NSAttributedString *)v32;

    SHSheetCustomHeaderButtonColor(objc_msgSend(v5, "showSharePlayProminently"));
    v34 = objc_claimAutoreleasedReturnValue();
    customHeaderButtonColor = v7->_customHeaderButtonColor;
    v7->_customHeaderButtonColor = (UIColor *)v34;

    objc_msgSend(v5, "activityViewController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "customViewController");
    v37 = objc_claimAutoreleasedReturnValue();
    customViewController = v7->_customViewController;
    v7->_customViewController = (UIViewController *)v37;

    objc_msgSend(v5, "activityViewController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "customViewControllerVerticalInsetWrapper");
    v40 = objc_claimAutoreleasedReturnValue();
    customViewControllerVerticalInsetWrapper = v7->_customViewControllerVerticalInsetWrapper;
    v7->_customViewControllerVerticalInsetWrapper = (NSNumber *)v40;

    objc_msgSend(v5, "activityViewController");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "customViewControllerSectionHeightWrapper");
    v43 = objc_claimAutoreleasedReturnValue();
    customViewControllerSectionHeightWrapper = v7->_customViewControllerSectionHeightWrapper;
    v7->_customViewControllerSectionHeightWrapper = (NSNumber *)v43;

    v7->_isModeSwitchDisabled = objc_msgSend(v5, "isModeSwitchDisabled");
    objc_msgSend(v5, "configuration");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "peopleProxies");
    v46 = objc_claimAutoreleasedReturnValue();
    peopleSuggestionProxies = v7->_peopleSuggestionProxies;
    v7->_peopleSuggestionProxies = (NSArray *)v46;

    objc_msgSend(v5, "configuration");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "shareProxies");
    v49 = objc_claimAutoreleasedReturnValue();
    shareProxies = v7->_shareProxies;
    v7->_shareProxies = (NSArray *)v49;

    objc_msgSend(v5, "configuration");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "actionProxies");
    v52 = objc_claimAutoreleasedReturnValue();
    actionProxies = v7->_actionProxies;
    v7->_actionProxies = (NSArray *)v52;

    objc_msgSend(v5, "activitiesManager");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "activitiesByUUID");
    v55 = objc_claimAutoreleasedReturnValue();
    activitiesByUUID = v7->_activitiesByUUID;
    v7->_activitiesByUUID = (NSDictionary *)v55;

    objc_msgSend(v5, "activitiesManager");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "applicationActivityTypes");
    v58 = objc_claimAutoreleasedReturnValue();
    applicationActivityTypes = v7->_applicationActivityTypes;
    v7->_applicationActivityTypes = (NSArray *)v58;

    objc_msgSend(v5, "configuration");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "nearbyCountSlotID");
    v61 = objc_claimAutoreleasedReturnValue();
    nearbyCountSlotID = v7->_nearbyCountSlotID;
    v7->_nearbyCountSlotID = (NSNumber *)v61;

    objc_msgSend(v5, "configuration");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_reloadData = objc_msgSend(v63, "reloadData");

    objc_msgSend(v5, "configuration");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_updateProxiesWithAnimation = objc_msgSend(v64, "wantsAnimation");

    v7->_isSharingExpanded = objc_msgSend(v5, "isExpanded");
    objc_msgSend(v5, "configuration");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "restrictedActivityTypes");
    v66 = objc_claimAutoreleasedReturnValue();
    v67 = (void *)v66;
    if (v66)
      v68 = (void *)v66;
    else
      v68 = v11;
    objc_storeStrong((id *)&v7->_restrictedActivityTypes, v68);

    v7->_supportsCollaboration = objc_msgSend(v5, "supportsCollaboration");
    v7->_supportsSendCopy = objc_msgSend(v5, "supportsSendCopy");
    v7->_isCollaborative = objc_msgSend(v5, "isCollaborative");
    objc_msgSend(v5, "collaborationItem");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "canAddPeople");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    SHSheetCollaborationModeTitle(v70);
    v71 = objc_claimAutoreleasedReturnValue();
    collaborationModeTitle = v7->_collaborationModeTitle;
    v7->_collaborationModeTitle = (NSString *)v71;

    objc_msgSend(v5, "collaborationItem");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "createCollaborationFooterViewModel");
    v74 = objc_claimAutoreleasedReturnValue();
    collaborationFooterViewModel = v7->_collaborationFooterViewModel;
    v7->_collaborationFooterViewModel = (SLCollaborationFooterViewModel *)v74;

  }
  return v7;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SHSheetViewModel peopleSuggestions](self, "peopleSuggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetViewModel peopleSuggestionProxies](self, "peopleSuggestionProxies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetViewModel activities](self, "activities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetViewModel shareProxies](self, "shareProxies");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetViewModel actionProxies](self, "actionProxies");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetViewModel metadataValues](self, "metadataValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetViewModel showOptions](self, "showOptions");
  NSStringFromBOOL();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetViewModel restrictedActivityTypes](self, "restrictedActivityTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ peopleSuggestions:%@ peopleSuggestionProxies:%@ activities:%@ shareProxies:%@ actionProxies:%@ metadataValues:%@ showOptions:%@ restrictedActivityTypes:%@>"), v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (SHSheetSession)session
{
  return self->_session;
}

- (UIViewController)customViewController
{
  return self->_customViewController;
}

- (void)setCustomViewController:(id)a3
{
  objc_storeStrong((id *)&self->_customViewController, a3);
}

- (BOOL)isSharingExpanded
{
  return self->_isSharingExpanded;
}

- (void)setIsSharingExpanded:(BOOL)a3
{
  self->_isSharingExpanded = a3;
}

- (NSArray)metadataValues
{
  return self->_metadataValues;
}

- (void)setMetadataValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isLoadingMetadata
{
  return self->_isLoadingMetadata;
}

- (void)setIsLoadingMetadata:(BOOL)a3
{
  self->_isLoadingMetadata = a3;
}

- (NSArray)urlRequests
{
  return self->_urlRequests;
}

- (void)setUrlRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)urlSandboxExtensions
{
  return self->_urlSandboxExtensions;
}

- (void)setUrlSandboxExtensions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)showOptions
{
  return self->_showOptions;
}

- (void)setShowOptions:(BOOL)a3
{
  self->_showOptions = a3;
}

- (NSString)customOptionsTitle
{
  return self->_customOptionsTitle;
}

- (void)setCustomOptionsTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)showCustomHeaderButton
{
  return self->_showCustomHeaderButton;
}

- (void)setShowCustomHeaderButton:(BOOL)a3
{
  self->_showCustomHeaderButton = a3;
}

- (BOOL)showHeaderSpecialization
{
  return self->_showHeaderSpecialization;
}

- (void)setShowHeaderSpecialization:(BOOL)a3
{
  self->_showHeaderSpecialization = a3;
}

- (NSAttributedString)customHeaderButtonTitle
{
  return self->_customHeaderButtonTitle;
}

- (void)setCustomHeaderButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (UIColor)customHeaderButtonColor
{
  return self->_customHeaderButtonColor;
}

- (void)setCustomHeaderButtonColor:(id)a3
{
  objc_storeStrong((id *)&self->_customHeaderButtonColor, a3);
}

- (BOOL)isModeSwitchDisabled
{
  return self->_isModeSwitchDisabled;
}

- (void)setIsModeSwitchDisabled:(BOOL)a3
{
  self->_isModeSwitchDisabled = a3;
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

- (NSArray)peopleSuggestions
{
  return self->_peopleSuggestions;
}

- (void)setPeopleSuggestions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)activities
{
  return self->_activities;
}

- (void)setActivities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)peopleSuggestionProxies
{
  return self->_peopleSuggestionProxies;
}

- (void)setPeopleSuggestionProxies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSArray)shareProxies
{
  return self->_shareProxies;
}

- (void)setShareProxies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSArray)actionProxies
{
  return self->_actionProxies;
}

- (void)setActionProxies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSDictionary)activitiesByUUID
{
  return self->_activitiesByUUID;
}

- (void)setActivitiesByUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSArray)applicationActivityTypes
{
  return self->_applicationActivityTypes;
}

- (void)setApplicationActivityTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSNumber)nearbyCountSlotID
{
  return self->_nearbyCountSlotID;
}

- (void)setNearbyCountSlotID:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyCountSlotID, a3);
}

- (BOOL)reloadData
{
  return self->_reloadData;
}

- (void)setReloadData:(BOOL)a3
{
  self->_reloadData = a3;
}

- (BOOL)updateProxiesWithAnimation
{
  return self->_updateProxiesWithAnimation;
}

- (void)setUpdateProxiesWithAnimation:(BOOL)a3
{
  self->_updateProxiesWithAnimation = a3;
}

- (NSArray)restrictedActivityTypes
{
  return self->_restrictedActivityTypes;
}

- (void)setRestrictedActivityTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (BOOL)supportsCollaboration
{
  return self->_supportsCollaboration;
}

- (void)setSupportsCollaboration:(BOOL)a3
{
  self->_supportsCollaboration = a3;
}

- (BOOL)supportsSendCopy
{
  return self->_supportsSendCopy;
}

- (void)setSupportsSendCopy:(BOOL)a3
{
  self->_supportsSendCopy = a3;
}

- (BOOL)isCollaborative
{
  return self->_isCollaborative;
}

- (void)setIsCollaborative:(BOOL)a3
{
  self->_isCollaborative = a3;
}

- (NSString)collaborationModeTitle
{
  return self->_collaborationModeTitle;
}

- (void)setCollaborationModeTitle:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationModeTitle, a3);
}

- (SLCollaborationFooterViewModel)collaborationFooterViewModel
{
  return self->_collaborationFooterViewModel;
}

- (void)setCollaborationFooterViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationFooterViewModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationFooterViewModel, 0);
  objc_storeStrong((id *)&self->_collaborationModeTitle, 0);
  objc_storeStrong((id *)&self->_restrictedActivityTypes, 0);
  objc_storeStrong((id *)&self->_nearbyCountSlotID, 0);
  objc_storeStrong((id *)&self->_applicationActivityTypes, 0);
  objc_storeStrong((id *)&self->_activitiesByUUID, 0);
  objc_storeStrong((id *)&self->_actionProxies, 0);
  objc_storeStrong((id *)&self->_shareProxies, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionProxies, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_peopleSuggestions, 0);
  objc_storeStrong((id *)&self->_customViewControllerSectionHeightWrapper, 0);
  objc_storeStrong((id *)&self->_customViewControllerVerticalInsetWrapper, 0);
  objc_storeStrong((id *)&self->_customHeaderButtonColor, 0);
  objc_storeStrong((id *)&self->_customHeaderButtonTitle, 0);
  objc_storeStrong((id *)&self->_customOptionsTitle, 0);
  objc_storeStrong((id *)&self->_urlSandboxExtensions, 0);
  objc_storeStrong((id *)&self->_urlRequests, 0);
  objc_storeStrong((id *)&self->_metadataValues, 0);
  objc_storeStrong((id *)&self->_customViewController, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
