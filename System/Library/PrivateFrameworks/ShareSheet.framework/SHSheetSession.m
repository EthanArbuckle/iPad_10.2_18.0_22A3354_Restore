@implementation SHSheetSession

- (SHSheetSession)initWithContext:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  SHSheetSession *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *identifier;
  NSObject *v13;
  const char *v14;
  int v15;
  __objc2_class **v16;
  uint64_t v17;
  _SHSheetScene *remoteScene;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SHSheetSession;
  v8 = -[SHSheetSession init](&v20, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "substringWithRange:", 24, 12);
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v11;

    v8->_canPerformSharePlay = +[UISharePlayActivity _canPerform](UISharePlayActivity, "_canPerform");
    share_sheet_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (v8->_canPerformSharePlay)
        v14 = "yes";
      else
        v14 = "no";
      *(_DWORD *)buf = 136315138;
      v22 = v14;
      _os_log_impl(&dword_19E419000, v13, OS_LOG_TYPE_DEFAULT, "SharePlay: App supports SharePlay: %s", buf, 0xCu);
    }

    objc_storeWeak((id *)&v8->_delegate, v7);
    -[SHSheetSession updateWithContext:](v8, "updateWithContext:", v6);
    if (-[SHSheetSession useRemoteUIService](v8, "useRemoteUIService"))
    {
      v15 = _ShareSheetPrefersModernRemoteScene();
      v16 = off_1E3FFFA68;
      if (!v15)
        v16 = off_1E3FFFAA0;
      v17 = objc_msgSend(objc_alloc(*v16), "initWithSession:", v8);
      remoteScene = v8->_remoteScene;
      v8->_remoteScene = (_SHSheetScene *)v17;

    }
  }

  return v8;
}

- (SFCollaborationItem)collaborationItem
{
  void *v3;
  void *v4;
  void *v5;

  if (-[SHSheetSession isCollaborationRestricted](self, "isCollaborationRestricted"))
  {
    v3 = 0;
  }
  else
  {
    -[SHSheetSession collaborationItemsProvider](self, "collaborationItemsProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collaborationItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (SFCollaborationItem *)v3;
}

- (BOOL)supportsCollaboration
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (-[SHSheetSession isCollaborationRestricted](self, "isCollaborationRestricted"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    -[SHSheetSession collaborationItemsProvider](self, "collaborationItemsProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v3) = objc_msgSend(v4, "supportsCollaboration");

    -[SHSheetSession collaborationItemsProvider](self, "collaborationItemsProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "supportsSendCopy");

    -[SHSheetSession collaborationModeRestriction](self, "collaborationModeRestriction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[SHSheetSession collaborationModeRestriction](self, "collaborationModeRestriction");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "disabledMode") == 1)
      {
        -[SHSheetSession collaborationModeRestriction](self, "collaborationModeRestriction");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "alertTitle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 != 0;

      }
      else
      {
        v11 = 1;
      }

      if (((v3 ^ 1 | v11 | v6) & 1) != 0)
      {
        LOBYTE(v3) = v3 & v11;
      }
      else
      {
        share_sheet_log();
        v3 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
          -[SHSheetSession supportsCollaboration].cold.1(v3, v12, v13, v14, v15, v16, v17, v18);

        LOBYTE(v3) = 1;
      }
    }
    else
    {

    }
  }
  return v3;
}

- (BOOL)isCollaborationRestricted
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[SHSheetSession collaborationItemsProvider](self, "collaborationItemsProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collaborationItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "type") == 2)
  {
    -[SHSheetSession configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "restrictedActivityTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", CFSTR("com.apple.Collaboration.Internal"));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)supportsSendCopy
{
  int v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  -[SHSheetSession collaborationItemsProvider](self, "collaborationItemsProvider");
  v5 = objc_claimAutoreleasedReturnValue();
  v3 = -[NSObject supportsCollaboration](v5, "supportsCollaboration");

  -[SHSheetSession collaborationItemsProvider](self, "collaborationItemsProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v4, "supportsSendCopy");

  -[SHSheetSession collaborationModeRestriction](self, "collaborationModeRestriction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SHSheetSession collaborationModeRestriction](self, "collaborationModeRestriction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "disabledMode"))
    {
      v8 = 1;
    }
    else
    {
      -[SHSheetSession collaborationModeRestriction](self, "collaborationModeRestriction");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "alertTitle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v10 != 0;

    }
    if (((v5 ^ 1 | v8 | v3) & 1) != 0)
    {
      LOBYTE(v5) = v5 & v8;
    }
    else
    {
      share_sheet_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[SHSheetSession supportsSendCopy].cold.1(v5, v11, v12, v13, v14, v15, v16, v17);

      LOBYTE(v5) = 1;
    }
  }
  else
  {

  }
  return (char)v5;
}

- (void)setIsCollaborative:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_isCollaborative != a3)
  {
    self->_isCollaborative = a3;
    -[SHSheetSession activityItemsManager](self, "activityItemsManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidateCache");

    -[SHSheetSession delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "isCollaborativeDidChangeForSession:", self);

  }
}

- (id)_collaborationService
{
  void *v3;
  void *v4;

  -[SHSheetSession delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collaborationServiceForSession:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)collaborationItemsProvider:(id)a3 resolveActivityItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SHSheetSession activityViewController](self, "activityViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SHSheetActivityItemsManager placeholderActivityItemValuesForActivityItem:activityViewController:](SHSheetActivityItemsManager, "placeholderActivityItemValuesForActivityItem:activityViewController:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)updateWithContext:(id)a3
{
  void *v4;
  id v5;

  -[SHSheetSession _configureWithContext:](self, "_configureWithContext:", a3);
  -[SHSheetSession _updateObjectManipulationSupport](self, "_updateObjectManipulationSupport");
  -[SHSheetSession _createActivityMatchingContext](self, "_createActivityMatchingContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SHSheetSession activitiesManager](self, "activitiesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateActivitiesWithContext:", v5);

}

- (void)_configureWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIActivityCollaborationModeRestriction *v7;
  UIActivityCollaborationModeRestriction *collaborationModeRestriction;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id WeakRetained;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  SHSheetActivityItemsManager *activityItemsManager;
  void *v35;
  char v36;
  SHSheetActivityItemsManager *v37;
  id v38;
  SHSheetSession *v39;
  SHSheetActivityItemsManager *v40;
  SHSheetActivityItemsManager *v41;
  void *v42;
  void *v43;
  char v44;
  SHSheetActivitiesManager *v45;
  NSString *identifier;
  void *v47;
  SHSheetActivitiesManager *v48;
  SHSheetActivitiesManager *activitiesManager;
  NSArray *v50;
  NSArray *activityTypesToCreateInShareService;
  NSArray *v52;
  NSArray *includedActivityTypes;
  NSArray *v54;
  NSArray *excludedActivityTypes;
  NSArray *v56;
  NSArray *activityTypeOrder;
  NSArray *v58;
  NSArray *heroActionActivityTypes;
  BOOL canPerformSharePlay;
  NSObject *v61;
  void *v62;
  void *v63;
  LPLinkMetadata *v64;
  LPLinkMetadata *photosHeaderMetadata;
  void *v66;
  NSString *v67;
  NSString *topContentSectionText;
  NSArray *v69;
  NSArray *selectedAssetIdentifiers;
  void *v71;
  NSArray *v72;
  NSArray *peopleSuggestionBundleIds;
  id v74;
  void *v75;
  SFUILoadedMetadataCollection *v76;
  SFUILoadedMetadataCollection *metadataCollection;
  const char *v78;
  const char *v79;
  const char *v80;
  const char *v81;
  uint64_t v82;
  unsigned int v83;
  char v84;
  _QWORD v85[5];
  _BYTE buf[24];
  uint64_t (*v87)(uint64_t, uint64_t);
  __int128 v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "activityViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_activityViewController, v5);

  objc_msgSend(v4, "activityItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collaborationModeRestriction");
  v7 = (UIActivityCollaborationModeRestriction *)objc_claimAutoreleasedReturnValue();
  collaborationModeRestriction = self->_collaborationModeRestriction;
  self->_collaborationModeRestriction = v7;

  if (dyld_program_sdk_at_least())
  {
    -[SHSheetSession collaborationItemsProvider](self, "collaborationItemsProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_4;
    -[SHSheetSession collaborationItemsProvider](self, "collaborationItemsProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activityItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activityItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToArray:", v12);

    if ((v13 & 1) == 0)
    {
LABEL_4:
      -[SHSheetSession setCollaborationURLRequests:](self, "setCollaborationURLRequests:", 0);
      WeakRetained = objc_loadWeakRetained((id *)&self->_activityViewController);
      objc_msgSend(WeakRetained, "collaborationDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_alloc(MEMORY[0x1E0D97410]);
      objc_msgSend(v4, "activityItems");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "managedFileURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithActivityItems:delegate:managedFileURL:isURLProviderSupported:", v17, self, v18, v15 != 0);

      -[SHSheetSession setCollaborationItemsProvider:](self, "setCollaborationItemsProvider:", v19);
      if (-[SHSheetSession supportsCollaboration](self, "supportsCollaboration"))
      {
        -[SHSheetSession collaborationItem](self, "collaborationItem");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "registerChangeObserver:", self);

        v21 = -[SHSheetSession supportsSendCopy](self, "supportsSendCopy");
        -[SHSheetSession collaborationModeRestriction](self, "collaborationModeRestriction");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "alertTitle");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          if (v21)
          {
            -[SHSheetSession collaborationModeRestriction](self, "collaborationModeRestriction");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[SHSheetSession setIsCollaborative:](self, "setIsCollaborative:", objc_msgSend(v24, "disabledMode") == 0);

          }
          else
          {
            -[SHSheetSession setIsCollaborative:](self, "setIsCollaborative:", 1);
          }
        }
        else
        {
          -[SHSheetSession collaborationItem](self, "collaborationItem");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v82) = objc_msgSend(v25, "defaultCollaboration");

          -[SHSheetSession collaborationItem](self, "collaborationItem");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "type");

          if (v27)
          {
            HIDWORD(v82) = 0;
          }
          else
          {
            -[SHSheetSession collaborationItem](self, "collaborationItem");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            HIDWORD(v82) = objc_msgSend(v28, "isiCloudDrive") ^ 1;

          }
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v87 = __Block_byref_object_copy__5;
          *(_QWORD *)&v88 = __Block_byref_object_dispose__5;
          *((_QWORD *)&v88 + 1) = 0;
          -[SHSheetSession _collaborationService](self, "_collaborationService", v82);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[SHSheetSession collaborationItem](self, "collaborationItem");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "contentIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v85[0] = MEMORY[0x1E0C809B0];
          v85[1] = 3221225472;
          v85[2] = __40__SHSheetSession__configureWithContext___block_invoke;
          v85[3] = &unk_1E4003938;
          v85[4] = buf;
          objc_msgSend(v29, "requestCollaborativeModeForContentIdentifier:completionHandler:", v31, v85);

          if ((v84 & 1) != 0)
          {
            v32 = 0;
          }
          else
          {
            v33 = *(void **)(*(_QWORD *)&buf[8] + 40);
            if (v33)
              v32 = objc_msgSend(v33, "BOOLValue");
            else
              v32 = v83;
          }
          -[SHSheetSession setIsCollaborative:](self, "setIsCollaborative:", !v21 | v32);
          _Block_object_dispose(buf, 8);

        }
      }

    }
  }
  activityItemsManager = self->_activityItemsManager;
  if (!activityItemsManager
    || (-[SHSheetActivityItemsManager activityItems](activityItemsManager, "activityItems"),
        v35 = (void *)objc_claimAutoreleasedReturnValue(),
        v36 = objc_msgSend(v6, "isEqualToArray:", v35),
        v35,
        (v36 & 1) == 0))
  {
    -[SHSheetSession setCollaborationURLRequests:](self, "setCollaborationURLRequests:", 0);
    v37 = [SHSheetActivityItemsManager alloc];
    v38 = objc_loadWeakRetained((id *)&self->_activityViewController);
    if (-[SHSheetSession supportsCollaboration](self, "supportsCollaboration"))
      v39 = self;
    else
      v39 = 0;
    v40 = -[SHSheetActivityItemsManager initWithActivityItems:activityViewController:delegate:collaborationDelegate:](v37, "initWithActivityItems:activityViewController:delegate:collaborationDelegate:", v6, v38, self, v39);

    v41 = self->_activityItemsManager;
    self->_activityItemsManager = v40;

  }
  if (!self->_activitiesManager
    || (objc_msgSend(v4, "applicationActivities"),
        v42 = (void *)objc_claimAutoreleasedReturnValue(),
        -[SHSheetActivitiesManager applicationActivities](self->_activitiesManager, "applicationActivities"),
        v43 = (void *)objc_claimAutoreleasedReturnValue(),
        v44 = objc_msgSend(v42, "isEqualToArray:", v43),
        v43,
        v42,
        (v44 & 1) == 0))
  {
    v45 = [SHSheetActivitiesManager alloc];
    identifier = self->_identifier;
    objc_msgSend(v4, "applicationActivities");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[SHSheetActivitiesManager initWithSessionIdentifier:applicationActivities:](v45, "initWithSessionIdentifier:applicationActivities:", identifier, v47);
    activitiesManager = self->_activitiesManager;
    self->_activitiesManager = v48;

    -[SHSheetActivitiesManager setDelegate:](self->_activitiesManager, "setDelegate:", self);
  }
  objc_msgSend(v4, "activityTypesToCreateInShareService");
  v50 = (NSArray *)objc_claimAutoreleasedReturnValue();
  activityTypesToCreateInShareService = self->_activityTypesToCreateInShareService;
  self->_activityTypesToCreateInShareService = v50;

  objc_msgSend(v4, "includedActivityTypes");
  v52 = (NSArray *)objc_claimAutoreleasedReturnValue();
  includedActivityTypes = self->_includedActivityTypes;
  self->_includedActivityTypes = v52;

  objc_msgSend(v4, "excludedActivityTypes");
  v54 = (NSArray *)objc_claimAutoreleasedReturnValue();
  excludedActivityTypes = self->_excludedActivityTypes;
  self->_excludedActivityTypes = v54;

  objc_msgSend(v4, "activityTypeOrder");
  v56 = (NSArray *)objc_claimAutoreleasedReturnValue();
  activityTypeOrder = self->_activityTypeOrder;
  self->_activityTypeOrder = v56;

  objc_msgSend(v4, "heroActionActivityTypes");
  v58 = (NSArray *)objc_claimAutoreleasedReturnValue();
  heroActionActivityTypes = self->_heroActionActivityTypes;
  self->_heroActionActivityTypes = v58;

  self->_showHeroActionsHorizontally = objc_msgSend(v4, "showHeroActionsHorizontally");
  self->_excludedActivityCategories = objc_msgSend(v4, "excludedActivityCategories");
  self->_allowsEmbedding = objc_msgSend(v4, "allowsEmbedding");
  self->_shouldSuggestFamilyMembers = objc_msgSend(v4, "shouldSuggestFamilyMembers");
  canPerformSharePlay = self->_canPerformSharePlay;
  if (canPerformSharePlay)
  {
    if (objc_msgSend(v4, "allowsProminentActivity"))
      canPerformSharePlay = !-[NSArray containsObject:](self->_excludedActivityTypes, "containsObject:", CFSTR("com.apple.UIKit.activity.SharePlay"));
    else
      canPerformSharePlay = 0;
  }
  self->_showSharePlayProminently = canPerformSharePlay;
  share_sheet_log();
  v61 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
  {
    if (self->_showSharePlayProminently)
      v78 = "yes";
    else
      v78 = "no";
    if (self->_canPerformSharePlay)
      v79 = "yes";
    else
      v79 = "no";
    if (objc_msgSend(v4, "allowsProminentActivity"))
      v80 = "yes";
    else
      v80 = "no";
    if (-[NSArray containsObject:](self->_excludedActivityTypes, "containsObject:", CFSTR("com.apple.UIKit.activity.SharePlay")))
    {
      v81 = "no";
    }
    else
    {
      v81 = "yes";
    }
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = v78;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v79;
    *(_WORD *)&buf[22] = 2080;
    v87 = (uint64_t (*)(uint64_t, uint64_t))v80;
    LOWORD(v88) = 2080;
    *(_QWORD *)((char *)&v88 + 2) = v81;
    _os_log_debug_impl(&dword_19E419000, v61, OS_LOG_TYPE_DEBUG, "SharePlay: Setting showSharePlayProminently to %s: canPerformSharePlay (%s) && allowsProminentActivity (%s) && excludedActivityTypes does not contain SharePlay (%s)", buf, 0x2Au);
  }

  self->_showKeyboardAutomatically = objc_msgSend(v4, "showKeyboardAutomatically");
  self->_whitelistActionActivitiesOnly = objc_msgSend(v4, "whitelistActionActivitiesOnly");
  self->_isContentManaged = objc_msgSend(v4, "isContentManaged");
  self->_sharingStyle = objc_msgSend(v4, "sharingStyle");
  objc_msgSend(v4, "includedActivityTypes");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v62, "containsObject:", CFSTR("com.apple.UIKit.activity.AirDrop")) & 1) != 0)
  {
    objc_msgSend(v4, "includedActivityTypes");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isAirdropOnly = objc_msgSend(v63, "count") == 1;

  }
  else
  {
    self->_isAirdropOnly = 0;
  }

  objc_msgSend(v4, "photosHeaderMetadata");
  v64 = (LPLinkMetadata *)objc_claimAutoreleasedReturnValue();
  photosHeaderMetadata = self->_photosHeaderMetadata;
  self->_photosHeaderMetadata = v64;

  objc_msgSend(v4, "objectManipulationDelegate");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_objectManipulationDelegate, v66);

  self->_configureForCloudSharing = objc_msgSend(v4, "configureForCloudSharing");
  self->_configureForPhotosEdit = objc_msgSend(v4, "configureForPhotosEdit");
  self->_hideHeaderView = objc_msgSend(v4, "hideHeaderView");
  self->_hideNavigationBar = objc_msgSend(v4, "hideNavigationBar");
  self->_hideSuggestions = objc_msgSend(v4, "hideSuggestions");
  objc_msgSend(v4, "topContentSectionText");
  v67 = (NSString *)objc_claimAutoreleasedReturnValue();
  topContentSectionText = self->_topContentSectionText;
  self->_topContentSectionText = v67;

  self->_instantShareSheet = objc_msgSend(v4, "instantShareSheet");
  objc_msgSend(v4, "selectedAssetIdentifiers");
  v69 = (NSArray *)objc_claimAutoreleasedReturnValue();
  selectedAssetIdentifiers = self->_selectedAssetIdentifiers;
  self->_selectedAssetIdentifiers = v69;

  self->_useRemoteUIService = objc_msgSend(v4, "useRemoteUIService");
  self->_showCustomScene = objc_msgSend(v4, "showCustomScene");
  objc_msgSend(v4, "peopleSuggestionBundleIds");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (NSArray *)objc_msgSend(v71, "copy");
  peopleSuggestionBundleIds = self->_peopleSuggestionBundleIds;
  self->_peopleSuggestionBundleIds = v72;

  v74 = objc_alloc(getSFUILoadedMetadataCollectionClass());
  -[SHSheetSession _metadataValues](self, "_metadataValues");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = (SFUILoadedMetadataCollection *)objc_msgSend(v74, "initWithMetadatas:", v75);
  metadataCollection = self->_metadataCollection;
  self->_metadataCollection = v76;

  -[SFUILoadedMetadataCollection setDelegate:](self->_metadataCollection, "setDelegate:", self);
  self->_xrRenderingMode = objc_msgSend(v4, "xrRenderingMode");

}

void __40__SHSheetSession__configureWithContext___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)_updateObjectManipulationSupport
{
  _BOOL4 showOptions;
  UIActivityViewControllerObjectManipulationDelegate **p_objectManipulationDelegate;
  id WeakRetained;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  showOptions = self->_showOptions;
  p_objectManipulationDelegate = &self->_objectManipulationDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_objectManipulationDelegate);
  self->_objectManipulationDelegateFlags.respondsToCustomizationAvailable = objc_opt_respondsToSelector() & 1;

  v6 = objc_loadWeakRetained((id *)p_objectManipulationDelegate);
  self->_objectManipulationDelegateFlags.respondsToCustomLocalizedActionTitle = objc_opt_respondsToSelector() & 1;

  v7 = objc_loadWeakRetained((id *)p_objectManipulationDelegate);
  self->_objectManipulationDelegateFlags.respondsToCustomActionViewController = objc_opt_respondsToSelector() & 1;

  if (self->_objectManipulationDelegateFlags.respondsToCustomizationAvailable)
  {
    -[SHSheetSession objectManipulationDelegate](self, "objectManipulationDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_loadWeakRetained((id *)&self->_activityViewController);
    self->_showOptions = objc_msgSend(v8, "_customizationAvailableForActivityViewController:", v9);

  }
  else
  {
    v10 = objc_loadWeakRetained((id *)p_objectManipulationDelegate);

    if (!v10)
      goto LABEL_6;
    -[SHSheetSession customizationGroups](self, "customizationGroups");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_showOptions = objc_msgSend(v8, "count") != 0;
  }

LABEL_6:
  if (showOptions != self->_showOptions)
  {
    -[SHSheetSession delegate](self, "delegate");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "showOptionsDidChangeForSession:", self);

  }
}

- (id)createDiscoveryContext
{
  void *v2;
  void *v3;
  void *v4;
  _UIActivityDiscoveryContext *v5;
  void *v6;

  -[SHSheetSession activityItemsManager](self, "activityItemsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityItemValuesForActivity:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _NSExtensionItemsFromActivityItemValues(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(_UIActivityDiscoveryContext);
  +[_UIActivityApplicationExtensionDiscovery extensionMatchingDictionariesForExtensionItems:](_UIActivityApplicationExtensionDiscovery, "extensionMatchingDictionariesForExtensionItems:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityDiscoveryContext setActivityItemValueExtensionMatchingDictionaries:](v5, "setActivityItemValueExtensionMatchingDictionaries:", v6);

  return v5;
}

- (id)_createActivityMatchingContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  _UIActivityMatchingContext *v20;
  void *v21;
  void *v22;
  _UIActivityMatchingContext *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[SHSheetSession activityItemsManager](self, "activityItemsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityItemValuesForActivity:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SHSheetSession isCollaborative](self, "isCollaborative"))
  {
    -[SHSheetSession collaborationItemsProvider](self, "collaborationItemsProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collaborationItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  -[SHSheetSession excludedActivityTypes](self, "excludedActivityTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SHSheetSession supportsCollaboration](self, "supportsCollaboration")
    && !-[SHSheetSession supportsSendCopy](self, "supportsSendCopy"))
  {
    share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E419000, v8, OS_LOG_TYPE_DEFAULT, "Excluding AirDrop for collaboration only mode", buf, 2u);
    }

    if (v7)
    {
      v9 = objc_msgSend(v7, "mutableCopy");

      v7 = (void *)v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "addObject:", CFSTR("com.apple.UIKit.activity.AirDrop"));
  }
  if (objc_msgSend(v7, "count"))
  {
    share_sheet_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v11;
      _os_log_impl(&dword_19E419000, v10, OS_LOG_TYPE_DEFAULT, "Excluded activity types (%@)", buf, 0xCu);

    }
  }
  -[SHSheetSession includedActivityTypes](self, "includedActivityTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SHSheetSession excludedActivityCategories](self, "excludedActivityCategories");
  if (-[SHSheetSession _isHeroCollaborationOnly](self, "_isHeroCollaborationOnly"))
  {
    v28 = CFSTR("com.apple.UIKit.activity.Message");
    v13 = 1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v14;
  }
  -[SHSheetSession collaborationModeRestriction](self, "collaborationModeRestriction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[SHSheetSession collaborationModeRestriction](self, "collaborationModeRestriction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "disabledMode") == 1)
    {
      -[SHSheetSession collaborationModeRestriction](self, "collaborationModeRestriction");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "alertTitle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18 == 0;

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  v20 = [_UIActivityMatchingContext alloc];
  -[SHSheetSession activityItemsManager](self, "activityItemsManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activityItems");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[_UIActivityMatchingContext initWithActivityItems:itemValues:collaborationItems:](v20, "initWithActivityItems:itemValues:collaborationItems:", v22, v4, v6);

  -[_UIActivityMatchingContext setIsContentManaged:](v23, "setIsContentManaged:", -[SHSheetSession isContentManaged](self, "isContentManaged"));
  -[_UIActivityMatchingContext setIsCollaborative:](v23, "setIsCollaborative:", -[SHSheetSession isCollaborative](self, "isCollaborative"));
  -[_UIActivityMatchingContext setShouldMatchOnlyUserElectedExtensions:](v23, "setShouldMatchOnlyUserElectedExtensions:", 1);
  -[_UIActivityMatchingContext setWhitelistActionActivitiesOnly:](v23, "setWhitelistActionActivitiesOnly:", -[SHSheetSession whitelistActionActivitiesOnly](self, "whitelistActionActivitiesOnly"));
  -[SHSheetSession activitiesManager](self, "activitiesManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applicationActivities");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityMatchingContext setApplicationActivities:](v23, "setApplicationActivities:", v25);

  -[SHSheetSession activityTypeOrder](self, "activityTypeOrder");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityMatchingContext setActivityTypeOrder:](v23, "setActivityTypeOrder:", v26);

  -[_UIActivityMatchingContext setIncludedActivityTypes:](v23, "setIncludedActivityTypes:", v12);
  -[_UIActivityMatchingContext setExcludedActivityTypes:](v23, "setExcludedActivityTypes:", v7);
  -[_UIActivityMatchingContext setExcludedActivityCategories:](v23, "setExcludedActivityCategories:", v13);
  -[_UIActivityMatchingContext setSharingStyle:](v23, "setSharingStyle:", -[SHSheetSession sharingStyle](self, "sharingStyle"));
  -[_UIActivityMatchingContext setShowSharePlayProminently:](v23, "setShowSharePlayProminently:", -[SHSheetSession showSharePlayProminently](self, "showSharePlayProminently"));
  -[_UIActivityMatchingContext setShouldExcludeiCloudSharingActivity:](v23, "setShouldExcludeiCloudSharingActivity:", -[SHSheetSession supportsCollaboration](self, "supportsCollaboration") | v19);

  return v23;
}

- (id)createShareServiceUIConfiguration
{
  UISUIActivityViewControllerConfiguration *v3;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL8 v34;
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
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v65;
  uint8_t buf[16];

  v3 = objc_alloc_init(UISUIActivityViewControllerConfiguration);
  -[SHSheetSession identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISUIActivityViewControllerConfiguration setSessionID:](v3, "setSessionID:", v4);

  -[SHSheetSession activityItemsManager](self, "activityItemsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityItemValuesForActivity:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sh_allClassNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISUIActivityViewControllerConfiguration setActivityItemValueClassNames:](v3, "setActivityItemValueClassNames:", v7);

  -[SHSheetSession activityItemsManager](self, "activityItemsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activityItemURLValuesForActivity:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISUIActivityViewControllerConfiguration setUrlsBeingShared:](v3, "setUrlsBeingShared:", v9);

  -[SHSheetSession activityItemsManager](self, "activityItemsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "securityScopedURLsForActivity:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISUIActivityViewControllerConfiguration setSecurityScopedURLsForMatching:](v3, "setSecurityScopedURLsForMatching:", v11);

  -[SHSheetSession activityViewController](self, "activityViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "viewIfLoaded");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tintColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISUIActivityViewControllerConfiguration setHostTintColor:](v3, "setHostTintColor:", v15);

  -[SHSheetSession activitiesManager](self, "activitiesManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "orderedActivities");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetSession activityConfigurationsForActivities:forRemoteUIService:](self, "activityConfigurationsForActivities:forRemoteUIService:", v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISUIActivityViewControllerConfiguration setHostActivityConfigurations:](v3, "setHostActivityConfigurations:", v18);

  -[SHSheetSession activitiesManager](self, "activitiesManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hiddenActivities");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetSession activityConfigurationsForActivities:forRemoteUIService:](self, "activityConfigurationsForActivities:forRemoteUIService:", v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISUIActivityViewControllerConfiguration setHostHiddenActivityConfigurations:](v3, "setHostHiddenActivityConfigurations:", v21);

  -[SHSheetSession activityTypesToCreateInShareService](self, "activityTypesToCreateInShareService");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISUIActivityViewControllerConfiguration setActivityTypesToCreateInShareService:](v3, "setActivityTypesToCreateInShareService:", v22);

  -[SHSheetSession activityViewController](self, "activityViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "traitCollection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISUIActivityViewControllerConfiguration setHostTraitCollection:](v3, "setHostTraitCollection:", v24);

  -[SHSheetSession activityViewController](self, "activityViewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "viewIfLoaded");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "directionalLayoutMargins");
  -[UISUIActivityViewControllerConfiguration setHostLayoutMargins:](v3, "setHostLayoutMargins:");

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISUIActivityViewControllerConfiguration setHostLocale:](v3, "setHostLocale:", v27);

  -[SHSheetSession activityViewController](self, "activityViewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "preferredContentSize");
  -[UISUIActivityViewControllerConfiguration setPreferredWidth:](v3, "setPreferredWidth:");

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "preferredLocalizations");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISUIActivityViewControllerConfiguration setPreferredLocalizations:](v3, "setPreferredLocalizations:", v30);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISUIActivityViewControllerConfiguration setHostIdiom:](v3, "setHostIdiom:", objc_msgSend(v31, "userInterfaceIdiom"));

  -[UISUIActivityViewControllerConfiguration setNumberOfVisibleSharingActivities:](v3, "setNumberOfVisibleSharingActivities:", -[SHSheetSession numberOfVisibleSharingActivities](self, "numberOfVisibleSharingActivities"));
  -[UISUIActivityViewControllerConfiguration setNumberOfVisibleActionActivities:](v3, "setNumberOfVisibleActionActivities:", -[SHSheetSession numberOfVisibleActionActivities](self, "numberOfVisibleActionActivities"));
  _NSExtensionItemsFromActivityItemValues(v6);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIActivityApplicationExtensionDiscovery extensionMatchingDictionariesForExtensionItems:](_UIActivityApplicationExtensionDiscovery, "extensionMatchingDictionariesForExtensionItems:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISUIActivityViewControllerConfiguration setActivityItemValueExtensionMatchingDictionaries:](v3, "setActivityItemValueExtensionMatchingDictionaries:", v33);

  -[UISUIActivityViewControllerConfiguration setAllowsEmbedding:](v3, "setAllowsEmbedding:", -[SHSheetSession allowsEmbedding](self, "allowsEmbedding"));
  -[UISUIActivityViewControllerConfiguration setIsContentManaged:](v3, "setIsContentManaged:", -[SHSheetSession isContentManaged](self, "isContentManaged"));
  v34 = 1;
  -[UISUIActivityViewControllerConfiguration setShouldMatchOnlyUserElectedExtensions:](v3, "setShouldMatchOnlyUserElectedExtensions:", 1);
  -[UISUIActivityViewControllerConfiguration setWhitelistActionActivitiesOnly:](v3, "setWhitelistActionActivitiesOnly:", -[SHSheetSession whitelistActionActivitiesOnly](self, "whitelistActionActivitiesOnly"));
  -[UISUIActivityViewControllerConfiguration setLinkedBeforeYukon:](v3, "setLinkedBeforeYukon:", dyld_program_sdk_at_least() ^ 1);
  if (!-[SHSheetSession shouldSkipPeopleSuggestions](self, "shouldSkipPeopleSuggestions"))
    v34 = -[SHSheetSession hideSuggestions](self, "hideSuggestions");
  -[UISUIActivityViewControllerConfiguration setShouldSkipPeopleSuggestions:](v3, "setShouldSkipPeopleSuggestions:", v34);
  -[SHSheetSession activityItemsManager](self, "activityItemsManager");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "recipientsForActivity:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISUIActivityViewControllerConfiguration setRecipients:](v3, "setRecipients:", v36);

  -[SHSheetSession activityItemsManager](self, "activityItemsManager");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "activityItemURLValuesForActivity:", 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  -[UISUIActivityViewControllerConfiguration setShouldExcludeiCloudSharingActivity:](v3, "setShouldExcludeiCloudSharingActivity:", _UIActivityHelperActivityItemsIncludeICloudDriveURL(v38) ^ 1);
  -[SHSheetSession activitiesManager](self, "activitiesManager");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "excludedActivityTypes");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISUIActivityViewControllerConfiguration setExcludedActivityTypes:](v3, "setExcludedActivityTypes:", v40);

  -[SHSheetSession includedActivityTypes](self, "includedActivityTypes");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISUIActivityViewControllerConfiguration setIncludedActivityTypes:](v3, "setIncludedActivityTypes:", v41);

  -[SHSheetSession activityTypeOrder](self, "activityTypeOrder");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISUIActivityViewControllerConfiguration setActivityTypeOrder:](v3, "setActivityTypeOrder:", v42);

  -[UISUIActivityViewControllerConfiguration setExcludedActivityCategories:](v3, "setExcludedActivityCategories:", -[SHSheetSession excludedActivityCategories](self, "excludedActivityCategories"));
  -[UISUIActivityViewControllerConfiguration setCanExcludeExtensionActivities:](v3, "setCanExcludeExtensionActivities:", _UICanExcludeExtensionActivities());
  -[UISUIActivityViewControllerConfiguration setSharingStyle:](v3, "setSharingStyle:", -[SHSheetSession sharingStyle](self, "sharingStyle"));
  -[UISUIActivityViewControllerConfiguration setCanShowShareSheetPlugIns:](v3, "setCanShowShareSheetPlugIns:", 1);
  -[SHSheetSession selectedAssetIdentifiers](self, "selectedAssetIdentifiers");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetSession activityItemsManager](self, "activityItemsManager");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "suggestionAssetIdentifiers");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v45, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addObjectsFromArray:", v43);
    objc_msgSend(v46, "allObjects");
    v47 = objc_claimAutoreleasedReturnValue();

    v43 = (void *)v47;
  }
  -[UISUIActivityViewControllerConfiguration setInitialPhotosAssetDetails:](v3, "setInitialPhotosAssetDetails:", v43);
  -[SHSheetSession activityViewController](self, "activityViewController");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "traitCollection");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "preferredContentSizeCategory");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIActivity imageWidthForContentSizeCategory:](UIActivity, "imageWidthForContentSizeCategory:", v50);
  v52 = round(v51 * 0.75);
  -[UISUIActivityViewControllerConfiguration setIconSize:](v3, "setIconSize:", v52, v52);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "scale");
  -[UISUIActivityViewControllerConfiguration setIconScale:](v3, "setIconScale:");

  if (-[SHSheetSession supportsCollaboration](self, "supportsCollaboration")
    && !-[SHSheetSession supportsSendCopy](self, "supportsSendCopy"))
  {
    v65 = v32;
    share_sheet_log();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E419000, v54, OS_LOG_TYPE_DEFAULT, "Excluding AirDrop for collaboration only mode", buf, 2u);
    }
    v55 = v6;

    -[UISUIActivityViewControllerConfiguration excludedActivityTypes](v3, "excludedActivityTypes");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      -[UISUIActivityViewControllerConfiguration excludedActivityTypes](v3, "excludedActivityTypes");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = (void *)objc_msgSend(v57, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v58, "addObject:", CFSTR("com.apple.UIKit.activity.AirDrop"));
    v59 = (void *)objc_msgSend(v58, "copy");
    -[UISUIActivityViewControllerConfiguration setExcludedActivityTypes:](v3, "setExcludedActivityTypes:", v59);

    v6 = v55;
    v32 = v65;
  }
  if (-[SHSheetSession _isHeroCollaborationOnly](self, "_isHeroCollaborationOnly"))
  {
    -[UISUIActivityViewControllerConfiguration setIncludedActivityTypes:](v3, "setIncludedActivityTypes:", &unk_1E403F518);
    -[UISUIActivityViewControllerConfiguration setWhitelistActionActivitiesOnly:](v3, "setWhitelistActionActivitiesOnly:", 0);
  }
  -[UISUIActivityViewControllerConfiguration setIsCollaborative:](v3, "setIsCollaborative:", -[SHSheetSession isCollaborative](self, "isCollaborative"));
  if (-[SHSheetSession isCollaborative](self, "isCollaborative"))
  {
    -[SHSheetSession activityTypesToCreateInShareService](self, "activityTypesToCreateInShareService");
    v60 = v32;
    v61 = v6;
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)objc_msgSend(v62, "mutableCopy");

    v6 = v61;
    v32 = v60;
    objc_msgSend(v63, "removeObject:", CFSTR("com.apple.UIKit.activity.RemoteOpenInApplication"));
    -[UISUIActivityViewControllerConfiguration setActivityTypesToCreateInShareService:](v3, "setActivityTypesToCreateInShareService:", v63);

  }
  return v3;
}

- (NSArray)customizationGroups
{
  void *v3;
  void *v4;
  void *v5;

  -[SHSheetSession objectManipulationDelegate](self, "objectManipulationDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetSession activityViewController](self, "activityViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_customizationGroupsForActivityViewController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSString)customOptionsTitle
{
  void *v3;
  void *v4;
  void *v5;

  if (self->_objectManipulationDelegateFlags.respondsToCustomLocalizedActionTitle)
  {
    -[SHSheetSession objectManipulationDelegate](self, "objectManipulationDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetSession activityViewController](self, "activityViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "customLocalizedActionTitleForActivityViewController:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (UIViewController)customOptionsViewController
{
  void *v3;
  void *v4;
  void *v5;

  if (self->_objectManipulationDelegateFlags.respondsToCustomActionViewController)
  {
    -[SHSheetSession objectManipulationDelegate](self, "objectManipulationDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetSession activityViewController](self, "activityViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "customActionViewControllerForActivityViewController:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (UIViewController *)v5;
}

- (void)setSelectedAssetIdentifiers:(id)a3
{
  NSArray *v4;
  NSArray *selectedAssetIdentifiers;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "isEqualToArray:", self->_selectedAssetIdentifiers))
  {
    self->_shouldSkipPeopleSuggestions = 1;
  }
  else
  {
    self->_shouldSkipPeopleSuggestions = 0;
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    selectedAssetIdentifiers = self->_selectedAssetIdentifiers;
    self->_selectedAssetIdentifiers = v4;

  }
}

- (void)setIsContentManaged:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_isContentManaged != a3)
  {
    v3 = a3;
    self->_isContentManaged = a3;
    -[SHSheetSession activityItemsManager](self, "activityItemsManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsContentManaged:", v3);

  }
}

- (id)_metadataValues
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[SHSheetSession photosHeaderMetadata](self, "photosHeaderMetadata");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v14[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SHSheetSession activityItemsManager](self, "activityItemsManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "linkMetadataValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v5, "count"))
    {
      -[SHSheetSession collaborationItem](self, "collaborationItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "linkMetadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[SHSheetSession collaborationItem](self, "collaborationItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "linkMetadata");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
        v11 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v11;
      }
    }
  }

  return v5;
}

- (id)createClientContext
{
  return -[SHSheetUIServiceClientContext initWithSession:]([SHSheetUIServiceClientContext alloc], "initWithSession:", self);
}

- (BOOL)_isHeroCollaborationOnly
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;

  -[SHSheetSession collaborationItem](self, "collaborationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") == 1)
  {
    -[SHSheetSession collaborationItem](self, "collaborationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isServiceManatee");

  }
  else
  {
    v5 = 0;
  }

  -[SHSheetSession collaborationItem](self, "collaborationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "type") == 2)
  {
    -[SHSheetSession collaborationItem](self, "collaborationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isURLProviderSupported") ^ 1;

  }
  else
  {
    v8 = 0;
  }

  return (v5 | v8) == 1 && -[SHSheetSession isCollaborative](self, "isCollaborative");
}

- (id)createContentContext
{
  UIActivityContentContext *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(UIActivityContentContext);
  v4 = -[SHSheetSession instantShareSheet](self, "instantShareSheet")
    || -[SHSheetSession useRemoteUIService](self, "useRemoteUIService");
  -[UIActivityContentContext setCanRenderPeople:](v3, "setCanRenderPeople:", v4);
  -[UIActivityContentContext setConfigureForCloudSharing:](v3, "setConfigureForCloudSharing:", -[SHSheetSession configureForCloudSharing](self, "configureForCloudSharing"));
  -[UIActivityContentContext setConfigureForPhotosEdit:](v3, "setConfigureForPhotosEdit:", -[SHSheetSession configureForPhotosEdit](self, "configureForPhotosEdit"));
  -[UIActivityContentContext setHideHeaderView:](v3, "setHideHeaderView:", -[SHSheetSession hideHeaderView](self, "hideHeaderView"));
  -[UIActivityContentContext setHideNavigationBar:](v3, "setHideNavigationBar:", -[SHSheetSession hideNavigationBar](self, "hideNavigationBar"));
  -[SHSheetSession topContentSectionText](self, "topContentSectionText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityContentContext setTopContentSectionText:](v3, "setTopContentSectionText:", v5);

  -[UIActivityContentContext setSharingExpanded:](v3, "setSharingExpanded:", -[SHSheetSession isExpanded](self, "isExpanded"));
  -[SHSheetSession activitiesManager](self, "activitiesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationActivityTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityContentContext setApplicationActivityTypes:](v3, "setApplicationActivityTypes:", v7);

  -[SHSheetSession heroActionActivityTypes](self, "heroActionActivityTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityContentContext setHeroActionActivityTypes:](v3, "setHeroActionActivityTypes:", v8);

  -[UIActivityContentContext setShowHeroActionsHorizontally:](v3, "setShowHeroActionsHorizontally:", -[SHSheetSession showHeroActionsHorizontally](self, "showHeroActionsHorizontally"));
  return v3;
}

- (BOOL)isExpanded
{
  return !-[SHSheetSession sharingStyle](self, "sharingStyle") || -[SHSheetSession didExpand](self, "didExpand");
}

- (BOOL)showHeaderSpecialization
{
  void *v2;
  void *v3;
  void *v4;

  -[SHSheetSession activityItemsManager](self, "activityItemsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "linkMetadataValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = +[SHSheetActivityItemUtilities shouldShowHeaderSpecializationForMetadata:](SHSheetActivityItemUtilities, "shouldShowHeaderSpecializationForMetadata:", v4);
  return (char)v2;
}

- (BOOL)isModeSwitchDisabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  -[SHSheetSession collaborationModeRestriction](self, "collaborationModeRestriction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SHSheetSession collaborationModeRestriction](self, "collaborationModeRestriction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alertTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[SHSheetSession collaborationModeRestriction](self, "collaborationModeRestriction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "allowContinueToMode") ^ 1;

    }
    else
    {
      LOBYTE(v7) = 0;
    }

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)setConfiguration:(id)a3
{
  UISDShareSheetSessionConfiguration *v5;
  UISDShareSheetSessionConfiguration *configuration;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  BOOL v12;
  void *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v5 = (UISDShareSheetSessionConfiguration *)a3;
  configuration = self->_configuration;
  if (!configuration)
  {
    share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue();
    -[SHSheetSession activityViewController](self, "activityViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_id_make_with_pointer(v8, v9);

    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v7, OS_SIGNPOST_INTERVAL_END, v10, "SendInitialConfiguration", (const char *)&unk_19E4D535F, buf, 2u);
    }

    share_sheet_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "InitialContentUpdate", (const char *)&unk_19E4D535F, v14, 2u);
    }

    configuration = self->_configuration;
  }
  if (configuration != v5)
  {
    objc_storeStrong((id *)&self->_configuration, a3);
    if (-[SHSheetSession isCollaborationRestricted](self, "isCollaborationRestricted"))
      -[SHSheetSession setIsCollaborative:](self, "setIsCollaborative:", 0);
    goto LABEL_13;
  }
  v12 = -[SHSheetSession useRemoteUIService](self, "useRemoteUIService");
  if (!v5 && v12)
  {
LABEL_13:
    -[SHSheetSession delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sessionConfigurationDidChangeForSession:", self);

  }
}

- (id)activityConfigurationsForActivities:(id)a3 forRemoteUIService:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        -[SHSheetSession _configurationForActivity:forRemoteUIService:](self, "_configurationForActivity:forRemoteUIService:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), v4, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)_configurationForActivity:(id)a3 forRemoteUIService:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;

  v4 = a4;
  v6 = a3;
  +[UISUIActivityConfiguration configurationForActivity:forRemoteUIService:](UISUIActivityConfiguration, "configurationForActivity:forRemoteUIService:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetSession activityViewController](self, "activityViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activityType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_titleForActivity:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v6, "activityTitle");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  objc_msgSend(v7, "activityTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if ((v15 & 1) == 0)
    objc_msgSend(v7, "updateConfigurationWithOverrideTitle:", v13);

  return v7;
}

- (BOOL)activitiesManager:(id)a3 shouldShowSystemActivityType:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[SHSheetSession activityViewController](self, "activityViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_shouldShowSystemActivityType:", v5);

  return v7;
}

- (void)metadataCollectionDidFinishLoading:(id)a3
{
  id v4;

  -[SHSheetSession delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headerMetadataDidChangeForSession:", self);

}

- (void)metadataCollection:(id)a3 didChangeMetadata:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SHSheetSession delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "session:didChangeMetadata:", self, v5);

}

- (void)activityItemsManagerLinkMetadataValuesDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = objc_alloc(getSFUILoadedMetadataCollectionClass());
  -[SHSheetSession _metadataValues](self, "_metadataValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithMetadatas:", v5);
  -[SHSheetSession setMetadataCollection:](self, "setMetadataCollection:", v6);

  -[SHSheetSession delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "headerMetadataDidChangeForSession:", self);

}

- (id)urlRequestsForActivityItemsManager:(id)a3
{
  NSArray *collaborationURLRequests;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *v11;
  NSArray *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  collaborationURLRequests = self->_collaborationURLRequests;
  if (collaborationURLRequests)
    return collaborationURLRequests;
  -[SHSheetSession collaborationItem](self, "collaborationItem", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0D97420];
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "urlRequestsForCollaborationItems:", v9);
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v11 = self->_collaborationURLRequests;
    self->_collaborationURLRequests = v10;

  }
  v12 = self->_collaborationURLRequests;

  return v12;
}

- (BOOL)activityItemsManager:(id)a3 collaborationSupportsPromiseURLsForActivity:(id)a4
{
  id v4;
  char v5;

  v4 = a4;
  if (objc_msgSend((id)objc_opt_class(), "activityCategory"))
  {
    v5 = 1;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "_activitySupportsPromiseURLs");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)collaborationPlaceholderActivityItemsForActivityItemsManager:(id)a3
{
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[SHSheetSession collaborationItem](self, "collaborationItem", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    return 0;
  v5 = (void *)v4;
  v6 = -[SHSheetSession supportsCollaboration](self, "supportsCollaboration");

  if (!v6)
    return 0;
  -[SHSheetSession collaborationItem](self, "collaborationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "placeholderActivityItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[SHSheetSession collaborationItem](self, "collaborationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activityItem");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[SHSheetSession isCollaborative](self, "isCollaborative"))
  {
    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SHSheetSession collaborationItem](self, "collaborationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendCopyItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (id)activityItemsManager:(id)a3 collaborationActivityItemValuesForActivityItemValue:(id)a4 activity:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  BOOL v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  _QWORD v40[4];
  id v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint8_t buf[4];
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[SHSheetSession supportsCollaboration](self, "supportsCollaboration"))
  {
    v11 = 0;
    goto LABEL_33;
  }
  v11 = (void *)objc_msgSend(v9, "mutableCopy");
  -[SHSheetSession collaborationItem](self, "collaborationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = -1;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __100__SHSheetSession_activityItemsManager_collaborationActivityItemValuesForActivityItemValue_activity___block_invoke;
  v40[3] = &unk_1E4003960;
  v42 = &v44;
  v13 = v12;
  v41 = v13;
  v43 = &v48;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v40);
  if (*((_BYTE *)v45 + 24))
  {
    objc_msgSend(v11, "removeObjectAtIndex:", v49[3]);
    v49[3] = -1;
  }
  if (-[SHSheetSession isCollaborative](self, "isCollaborative"))
  {
    objc_msgSend(v10, "activityType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqual:", CFSTR("com.apple.UIKit.activity.Message"));

    if (v15)
    {
      objc_msgSend(v11, "removeAllObjects");
      goto LABEL_21;
    }
    objc_msgSend(v10, "activityType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqual:", CFSTR("com.apple.UIKit.activity.Mail"));

    if (v17)
    {
      objc_msgSend(v11, "removeAllObjects");
      -[SHSheetSession delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "collaborationSharingResultForActivity:", v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "mailResult");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "body");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
LABEL_20:

        goto LABEL_21;
      }
      objc_msgSend(v19, "mailResult");
      v22 = objc_claimAutoreleasedReturnValue();
      -[NSObject body](v22, "body");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v23);

    }
    else
    {
      if (objc_msgSend((id)objc_opt_class(), "activityCategory") != 1)
        goto LABEL_21;
      -[SHSheetSession delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "collaborationSharingResultForActivity:", v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v11, "removeAllObjects");
        objc_msgSend(v19, "sharingURL");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(v19, "sharingURL");
          v22 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v22);
        }
        else
        {
          share_sheet_log();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v19, "collaborationItemIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "error");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[SHSheetSession activityItemsManager:collaborationActivityItemValuesForActivityItemValue:activity:].cold.1(v27, v28, buf, v22);
          }
        }
      }
      else
      {
        share_sheet_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v10, "activityType");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v53 = v26;
          _os_log_impl(&dword_19E419000, v22, OS_LOG_TYPE_DEFAULT, "No sharingResult for activity type:%@", buf, 0xCu);

        }
      }
    }

    goto LABEL_20;
  }
LABEL_21:
  if (!-[SHSheetSession isCollaborative](self, "isCollaborative")
    || !objc_msgSend((id)objc_opt_class(), "activityCategory"))
  {
    objc_msgSend(v10, "activityType");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.InCallService.ShareExtension"));

    if ((v30 & 1) == 0 && (v49[3] & 0x8000000000000000) == 0)
    {
      -[SHSheetSession collaborationItem](self, "collaborationItem");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "type") == 0;

      if (!v32)
      {
        objc_msgSend(v13, "itemProvider");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "supportsShareSheetSendCopyRepresentation");

        if (v34)
        {
          objc_msgSend(v13, "sendCopyRepresentation");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v35;
          if (v35)
          {
            v37 = v35;
          }
          else
          {
            objc_msgSend(v13, "itemProvider");
            v37 = (id)objc_claimAutoreleasedReturnValue();
          }
          v38 = v37;

          objc_msgSend(v11, "replaceObjectAtIndex:withObject:", v49[3], v38);
        }
        else
        {
          objc_msgSend(v11, "removeObjectAtIndex:", v49[3]);
        }
      }
    }
  }

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

LABEL_33:
  return v11;
}

void __100__SHSheetSession_activityItemsManager_collaborationActivityItemValuesForActivityItemValue_activity___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v13 = a2;
  +[_UIActivityItemMapping _originalActivityItemForActivityItem:](_UIActivityItemMapping, "_originalActivityItemForActivityItem:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = v7;
  else
    v8 = v13;
  v9 = v8;

  objc_msgSend(*(id *)(a1 + 32), "placeholderActivityItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v10, "isEqual:", v9);

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
    || (objc_msgSend(*(id *)(a1 + 32), "activityItem"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isEqual:", v9),
        v11,
        v12))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
    *a4 = 1;
  }

}

- (id)activityItemsManager:(id)a3 subjectForActivity:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (-[SHSheetSession supportsCollaboration](self, "supportsCollaboration")
    && -[SHSheetSession isCollaborative](self, "isCollaborative")
    && (objc_msgSend(v5, "activityType"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqual:", CFSTR("com.apple.UIKit.activity.Mail")),
        v6,
        v7))
  {
    -[SHSheetSession delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collaborationSharingResultForActivity:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "mailResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    share_sheet_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v11;
      _os_log_impl(&dword_19E419000, v12, OS_LOG_TYPE_DEFAULT, "Collaboration Mail Subject:%@", (uint8_t *)&v14, 0xCu);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (int64_t)numberOfVisibleSharingActivities
{
  unint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char isKindOfClass;

  v3 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "activeInterfaceOrientation") - 5;
  -[SHSheetSession activityViewController](self, "activityViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v3 < 0xFFFFFFFFFFFFFFFELL || v5 == 0;
  if (!v6 || !-[SHSheetSession isExpanded](self, "isExpanded"))
    return 0;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == 1)
  {
    -[SHSheetSession activityViewController](self, "activityViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_existingPresentationControllerImmediate:effective:", 0, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      return 5;
    else
      return 7;
  }
  else if (v3 >= 0xFFFFFFFFFFFFFFFELL)
  {
    return 7;
  }
  else
  {
    return 5;
  }
}

- (int64_t)numberOfVisibleActionActivities
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  int64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  char isKindOfClass;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  int v26;
  id v27;
  void *v28;
  int v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  -[SHSheetSession activityViewController](self, "activityViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_existingPresentationControllerImmediate:effective:", 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "activeInterfaceOrientation") - 5;
  -[SHSheetSession activityViewController](self, "activityViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "customViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 < 0xFFFFFFFFFFFFFFFELL || v9 == 0)
  {
    if (-[SHSheetSession isExpanded](self, "isExpanded"))
    {
      if (v4 == 1)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = 7;
        else
          v11 = 4;
      }
      else
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v11 = 2;
        if (!v9 && (isKindOfClass & 1) != 0)
        {
          v18 = v6;
          objc_msgSend(v18, "selectedDetentIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v32 = 0u;
            v33 = 0u;
            v30 = 0u;
            v31 = 0u;
            objc_msgSend(v18, "detents", 0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
            if (v21)
            {
              v22 = *(_QWORD *)v31;
              while (2)
              {
                for (i = 0; i != v21; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v31 != v22)
                    objc_enumerationMutation(v20);
                  v24 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
                  objc_msgSend(v24, "_identifier");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = objc_msgSend(v25, "isEqualToString:", v19);

                  if (v26)
                  {
                    v27 = v24;
                    goto LABEL_33;
                  }
                }
                v21 = (void *)objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
                if (v21)
                  continue;
                break;
              }
            }
          }
          else
          {
            objc_msgSend(v18, "detents");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "firstObject");
            v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:
            v21 = v27;
          }

          objc_msgSend(MEMORY[0x1E0DC3C78], "largeDetent");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v21, "isEqual:", v28);

          if (v29)
            v11 = 10;
          else
            v11 = 3;

        }
      }
    }
    else
    {
      if (v4 == 1)
        v12 = 9;
      else
        v12 = 8;
      -[SHSheetSession activityViewController](self, "activityViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "heroActionActivityTypes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15)
        v11 = v12 - 2;
      else
        v11 = v12;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4
{
  char v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id location;

  v4 = a4;
  v6 = a3;
  if (!-[SHSheetSession isCollaborationRestricted](self, "isCollaborationRestricted"))
  {
    if ((v4 & 4) != 0)
    {
      objc_msgSend(v6, "options");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        location = 0;
        objc_initWeak(&location, self);
        v10 = (void *)MEMORY[0x1E0D97420];
        -[SHSheetSession collaborationItem](self, "collaborationItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SHSheetSession _collaborationService](self, "_collaborationService");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __39__SHSheetSession_observable_didChange___block_invoke;
        v14[3] = &unk_1E4001540;
        objc_copyWeak(&v15, &location);
        objc_msgSend(v10, "canShowShareOptionsForCollaborationItem:service:completionHandler:", v11, v12, v14);

        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
        goto LABEL_10;
      }
    }
    else if ((v4 & 2) == 0)
    {
      if ((v4 & 0x10) == 0)
        goto LABEL_10;
      objc_msgSend(v6, "canAddPeople");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "BOOLValue");

      if ((v8 & 1) != 0)
        goto LABEL_10;
    }
    -[SHSheetSession delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "collaborationFooterViewModelDidChangeForSession:", self);

  }
LABEL_10:

}

void __39__SHSheetSession_observable_didChange___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "isCollaborationRestricted") & 1) == 0)
  {
    share_sheet_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "no";
      if ((_DWORD)a2)
        v6 = "yes";
      v8 = 136315138;
      v9 = v6;
      _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "canShowShareOptions:%s", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(v4, "setShowOptions:", a2);
    objc_msgSend(v4, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collaborationFooterViewModelDidChangeForSession:", v4);

  }
}

- (UISDShareSheetSessionConfiguration)configuration
{
  return self->_configuration;
}

- (SFPeopleSuggestion)currentPeopleSuggestion
{
  return self->_currentPeopleSuggestion;
}

- (void)setCurrentPeopleSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_currentPeopleSuggestion, a3);
}

- (SHSheetSessionDelegate)delegate
{
  return (SHSheetSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UIActivityViewController)activityViewController
{
  return (UIActivityViewController *)objc_loadWeakRetained((id *)&self->_activityViewController);
}

- (void)setActivityViewController:(id)a3
{
  objc_storeWeak((id *)&self->_activityViewController, a3);
}

- (SHSheetActivitiesManager)activitiesManager
{
  return self->_activitiesManager;
}

- (void)setActivitiesManager:(id)a3
{
  objc_storeStrong((id *)&self->_activitiesManager, a3);
}

- (SHSheetActivityItemsManager)activityItemsManager
{
  return self->_activityItemsManager;
}

- (void)setActivityItemsManager:(id)a3
{
  objc_storeStrong((id *)&self->_activityItemsManager, a3);
}

- (int64_t)sharingStyle
{
  return self->_sharingStyle;
}

- (void)setSharingStyle:(int64_t)a3
{
  self->_sharingStyle = a3;
}

- (BOOL)didExpand
{
  return self->_didExpand;
}

- (void)setDidExpand:(BOOL)a3
{
  self->_didExpand = a3;
}

- (NSArray)includedActivityTypes
{
  return self->_includedActivityTypes;
}

- (void)setIncludedActivityTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)excludedActivityTypes
{
  return self->_excludedActivityTypes;
}

- (void)setExcludedActivityTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)activityTypeOrder
{
  return self->_activityTypeOrder;
}

- (void)setActivityTypeOrder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)heroActionActivityTypes
{
  return self->_heroActionActivityTypes;
}

- (void)setHeroActionActivityTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
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

- (BOOL)shouldSuggestFamilyMembers
{
  return self->_shouldSuggestFamilyMembers;
}

- (void)setShouldSuggestFamilyMembers:(BOOL)a3
{
  self->_shouldSuggestFamilyMembers = a3;
}

- (BOOL)showSharePlayProminently
{
  return self->_showSharePlayProminently;
}

- (void)setShowSharePlayProminently:(BOOL)a3
{
  self->_showSharePlayProminently = a3;
}

- (BOOL)canPerformSharePlay
{
  return self->_canPerformSharePlay;
}

- (void)setCanPerformSharePlay:(BOOL)a3
{
  self->_canPerformSharePlay = a3;
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

- (BOOL)showOptions
{
  return self->_showOptions;
}

- (void)setShowOptions:(BOOL)a3
{
  self->_showOptions = a3;
}

- (BOOL)isAirdropOnly
{
  return self->_isAirdropOnly;
}

- (void)setIsAirdropOnly:(BOOL)a3
{
  self->_isAirdropOnly = a3;
}

- (BOOL)instantShareSheet
{
  return self->_instantShareSheet;
}

- (void)setInstantShareSheet:(BOOL)a3
{
  self->_instantShareSheet = a3;
}

- (BOOL)showHeroActionsHorizontally
{
  return self->_showHeroActionsHorizontally;
}

- (void)setShowHeroActionsHorizontally:(BOOL)a3
{
  self->_showHeroActionsHorizontally = a3;
}

- (NSArray)selectedAssetIdentifiers
{
  return self->_selectedAssetIdentifiers;
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (UIActivity)performingActivity
{
  return self->_performingActivity;
}

- (void)setPerformingActivity:(id)a3
{
  objc_storeStrong((id *)&self->_performingActivity, a3);
}

- (void)setCollaborationItem:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationItem, a3);
}

- (NSArray)collaborationURLRequests
{
  return self->_collaborationURLRequests;
}

- (void)setCollaborationURLRequests:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationURLRequests, a3);
}

- (BOOL)isCollaborative
{
  return self->_isCollaborative;
}

- (SFCollaborationItemsProvider)collaborationItemsProvider
{
  return self->_collaborationItemsProvider;
}

- (void)setCollaborationItemsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationItemsProvider, a3);
}

- (UIActivityCollaborationModeRestriction)collaborationModeRestriction
{
  return self->_collaborationModeRestriction;
}

- (void)setCollaborationModeRestriction:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationModeRestriction, a3);
}

- (void)setCustomizationGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (BOOL)shouldSkipPeopleSuggestions
{
  return self->_shouldSkipPeopleSuggestions;
}

- (void)setShouldSkipPeopleSuggestions:(BOOL)a3
{
  self->_shouldSkipPeopleSuggestions = a3;
}

- (LPLinkMetadata)photosHeaderMetadata
{
  return self->_photosHeaderMetadata;
}

- (void)setPhotosHeaderMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_photosHeaderMetadata, a3);
}

- (UIActivityViewControllerObjectManipulationDelegate)objectManipulationDelegate
{
  return (UIActivityViewControllerObjectManipulationDelegate *)objc_loadWeakRetained((id *)&self->_objectManipulationDelegate);
}

- (void)setObjectManipulationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_objectManipulationDelegate, a3);
}

- (NSArray)activityTypesToCreateInShareService
{
  return self->_activityTypesToCreateInShareService;
}

- (void)setActivityTypesToCreateInShareService:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
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

- (_SHSheetScene)remoteScene
{
  return self->_remoteScene;
}

- (void)setRemoteScene:(id)a3
{
  objc_storeStrong((id *)&self->_remoteScene, a3);
}

- (NSArray)peopleSuggestionBundleIds
{
  return self->_peopleSuggestionBundleIds;
}

- (void)setPeopleSuggestionBundleIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (SFUILoadedMetadataCollection)metadataCollection
{
  return self->_metadataCollection;
}

- (void)setMetadataCollection:(id)a3
{
  objc_storeStrong((id *)&self->_metadataCollection, a3);
}

- (unint64_t)xrRenderingMode
{
  return self->_xrRenderingMode;
}

- (void)setXrRenderingMode:(unint64_t)a3
{
  self->_xrRenderingMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataCollection, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionBundleIds, 0);
  objc_storeStrong((id *)&self->_remoteScene, 0);
  objc_storeStrong((id *)&self->_activityTypesToCreateInShareService, 0);
  objc_destroyWeak((id *)&self->_objectManipulationDelegate);
  objc_storeStrong((id *)&self->_photosHeaderMetadata, 0);
  objc_storeStrong((id *)&self->_customizationGroups, 0);
  objc_storeStrong((id *)&self->_collaborationModeRestriction, 0);
  objc_storeStrong((id *)&self->_collaborationItemsProvider, 0);
  objc_storeStrong((id *)&self->_collaborationURLRequests, 0);
  objc_storeStrong((id *)&self->_collaborationItem, 0);
  objc_storeStrong((id *)&self->_performingActivity, 0);
  objc_storeStrong((id *)&self->_selectedAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_topContentSectionText, 0);
  objc_storeStrong((id *)&self->_heroActionActivityTypes, 0);
  objc_storeStrong((id *)&self->_activityTypeOrder, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_includedActivityTypes, 0);
  objc_storeStrong((id *)&self->_activityItemsManager, 0);
  objc_storeStrong((id *)&self->_activitiesManager, 0);
  objc_destroyWeak((id *)&self->_activityViewController);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentPeopleSuggestion, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)supportsCollaboration
{
  OUTLINED_FUNCTION_0_1(&dword_19E419000, a1, a3, "Items support collaborate but client does not and items do not support send as copy, defaulting to collaborate.", a5, a6, a7, a8, 0);
}

- (void)supportsSendCopy
{
  OUTLINED_FUNCTION_0_1(&dword_19E419000, a1, a3, "Items support send as copy but client does not and items do not support collaborate, defaulting to send copy.", a5, a6, a7, a8, 0);
}

- (void)activityItemsManager:(uint8_t *)buf collaborationActivityItemValuesForActivityItemValue:(os_log_t)log activity:.cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_19E419000, log, OS_LOG_TYPE_ERROR, "No sharingURL for sharingResult:%@ error:%@", buf, 0x16u);

}

@end
