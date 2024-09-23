@implementation SHSheetServiceManager

- (SHSheetServiceManager)init
{
  SHSheetServiceManager *v2;
  SFShareSheetSlotManager *v3;
  SFShareSheetSlotManager *slotManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SHSheetServiceManager;
  v2 = -[SHSheetServiceManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SFShareSheetSlotManager);
    slotManager = v2->_slotManager;
    v2->_slotManager = v3;

    -[SFShareSheetSlotManager setDelegate:](v2->_slotManager, "setDelegate:", v2);
    -[SFShareSheetSlotManager activate](v2->_slotManager, "activate");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SHSheetServiceManager _invalidateSlotManagerIfNeeded](self, "_invalidateSlotManagerIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)SHSheetServiceManager;
  -[SHSheetServiceManager dealloc](&v3, sel_dealloc);
}

- (void)connectWithSession:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  SHSheetRemoteConnectionContext *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  os_signpost_id_t v45;
  NSObject *v46;
  NSObject *v47;
  os_signpost_id_t v48;
  SFShareSheetSlotManager *slotManager;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  _QWORD v57[4];
  id v58;
  uint8_t buf[8];

  v5 = a3;
  if (-[SHSheetServiceManager connectionState](self, "connectionState"))
  {
    share_sheet_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E419000, v6, OS_LOG_TYPE_DEFAULT, "Connection to sharingd already happened.", buf, 2u);
    }
  }
  else
  {
    -[SHSheetServiceManager setConnectionState:](self, "setConnectionState:", 1);
    share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E419000, v7, OS_LOG_TYPE_DEFAULT, "Connecting to sharingd", buf, 2u);
    }

    objc_storeStrong((id *)&self->_session, a3);
    -[SHSheetServiceManager session](self, "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();

    -[SHSheetServiceManager session](self, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createDiscoveryContext");
    v10 = objc_claimAutoreleasedReturnValue();

    -[SHSheetServiceManager session](self, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "selectedAssetIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[SHSheetServiceManager session](self, "session");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activityItemsManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "suggestionAssetIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObjectsFromArray:", v12);
      objc_msgSend(v16, "allObjects");
      v17 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v17;
    }
    -[SHSheetServiceManager session](self, "session");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "excludedActivityTypes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "containsObject:", CFSTR("com.apple.UIKit.activity.SharePlay")) & 1) != 0)
    {
      v20 = 0;
    }
    else
    {
      -[SHSheetServiceManager session](self, "session");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v21, "canPerformSharePlay");

    }
    -[SHSheetServiceManager session](self, "session");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activityItemsManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "suggestedImageDataFromActivityItem:", 0);
    v24 = objc_claimAutoreleasedReturnValue();

    v54 = v5;
    v55 = (void *)v24;
    v52 = v15;
    if (v24)
    {
      -[SHSheetServiceManager delegate](self, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "serviceManager:identificationResultsFromSuggestedImageData:", self, v24);
      v26 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v26 = 0;
    }
    -[SHSheetServiceManager session](self, "session");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activityItemsManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activityItemURLValuesForActivity:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    SFSandboxExtensionDataByFileURLPathForURLs();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = -[SHSheetRemoteConnectionContext initWithSessionIdentifier:]([SHSheetRemoteConnectionContext alloc], "initWithSessionIdentifier:", v6);
    v53 = (void *)v10;
    -[SHSheetRemoteConnectionContext setDiscoveryContext:](v31, "setDiscoveryContext:", v10);
    v56 = v12;
    -[SHSheetRemoteConnectionContext setAssetIdentifiers:](v31, "setAssetIdentifiers:", v12);
    -[SHSheetRemoteConnectionContext setUrlsBeingShared:](v31, "setUrlsBeingShared:", v29);
    v50 = (void *)v30;
    -[SHSheetRemoteConnectionContext setSandboxExtensionsByfileURLPath:](v31, "setSandboxExtensionsByfileURLPath:", v30);
    -[SHSheetServiceManager session](self, "session");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetRemoteConnectionContext setShouldSuggestFamilyMembers:](v31, "setShouldSuggestFamilyMembers:", objc_msgSend(v32, "shouldSuggestFamilyMembers"));

    -[SHSheetServiceManager session](self, "session");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetRemoteConnectionContext setInstantShareSheet:](v31, "setInstantShareSheet:", objc_msgSend(v33, "instantShareSheet"));

    -[SHSheetServiceManager session](self, "session");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetRemoteConnectionContext setRemoteShareSheet:](v31, "setRemoteShareSheet:", objc_msgSend(v34, "useRemoteUIService"));

    -[SHSheetRemoteConnectionContext setIsSharePlayAvailable:](v31, "setIsSharePlayAvailable:", v20);
    -[SHSheetServiceManager session](self, "session");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetRemoteConnectionContext setSupportsCollaboration:](v31, "setSupportsCollaboration:", objc_msgSend(v35, "supportsCollaboration"));

    -[SHSheetServiceManager session](self, "session");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetRemoteConnectionContext setHideSuggestions:](v31, "setHideSuggestions:", objc_msgSend(v36, "hideSuggestions"));

    -[SHSheetServiceManager session](self, "session");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "peopleSuggestionBundleIds");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetRemoteConnectionContext setPeopleSuggestionBundleIds:](v31, "setPeopleSuggestionBundleIds:", v38);

    v51 = (void *)v26;
    -[SHSheetRemoteConnectionContext setProcessedImageResultsData:](v31, "setProcessedImageResultsData:", v26);
    objc_msgSend(MEMORY[0x1E0DC3EE8], "defaultDurationForTransition:", 8);
    -[SHSheetRemoteConnectionContext setPeopleSuggestionsTimeout:](v31, "setPeopleSuggestionsTimeout:");
    -[SHSheetServiceManager session](self, "session");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetRemoteConnectionContext setXrRenderingMode:](v31, "setXrRenderingMode:", objc_msgSend(v39, "xrRenderingMode"));

    -[SHSheetRemoteConnectionContext createContextDictionary](v31, "createContextDictionary");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v41 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v42 = objc_claimAutoreleasedReturnValue();
    -[SHSheetServiceManager session](self, "session");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "activityViewController");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = os_signpost_id_make_with_pointer(v42, v44);

    if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v41, OS_SIGNPOST_INTERVAL_END, v45, "InitializeUIAVC", " enableTelemetry=YES ", buf, 2u);
    }

    share_sheet_log();
    v46 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = os_signpost_id_make_with_pointer(v47, self);

    if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v46, OS_SIGNPOST_INTERVAL_BEGIN, v48, "ConnectToDaemon", " enableTelemetry=YES ", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    slotManager = self->_slotManager;
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __44__SHSheetServiceManager_connectWithSession___block_invoke;
    v57[3] = &unk_1E40016A0;
    objc_copyWeak(&v58, (id *)buf);
    -[SFShareSheetSlotManager connectToDaemonWithContext:completionHandler:](slotManager, "connectToDaemonWithContext:completionHandler:", v40, v57);
    objc_destroyWeak(&v58);
    objc_destroyWeak((id *)buf);

    v5 = v54;
  }

}

void __44__SHSheetServiceManager_connectWithSession___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleConnectionCompletion");

}

- (void)update
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19E419000, log, OS_LOG_TYPE_DEBUG, "Update failure: Connection to sharingd is not established", v1, 2u);
}

uint64_t __31__SHSheetServiceManager_update__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendConfiguration:", *(_QWORD *)(a1 + 40));
}

- (void)reportActivityWithSessionID:(id)a3 presentationMs:(unint64_t)a4 totalShareTimeMs:(unint64_t)a5 activityType:(id)a6 success:(BOOL)a7
{
  -[SFShareSheetSlotManager activityViewControllerPerformedActivityWithSessionID:presentationMs:totalShareTimeMs:activityType:success:](self->_slotManager, "activityViewControllerPerformedActivityWithSessionID:presentationMs:totalShareTimeMs:activityType:success:", a3, a4, a5, a6, a7);
}

- (void)performShareActivityWithIdentifier:(id)a3
{
  SFShareSheetSlotManager *slotManager;
  id v5;
  void *v6;
  id v7;

  slotManager = self->_slotManager;
  v5 = a3;
  -[SHSheetServiceManager session](self, "session");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareSheetSlotManager activityViewControllerWithSessionID:selectedActivityWithIdentifier:](slotManager, "activityViewControllerWithSessionID:selectedActivityWithIdentifier:", v6, v5);

}

- (void)performActionActivityWithIdentifier:(id)a3
{
  SFShareSheetSlotManager *slotManager;
  id v5;
  void *v6;
  id v7;

  slotManager = self->_slotManager;
  v5 = a3;
  -[SHSheetServiceManager session](self, "session");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareSheetSlotManager activityViewControllerWithSessionID:selectedActionWithIdentifier:](slotManager, "activityViewControllerWithSessionID:selectedActionWithIdentifier:", v6, v5);

}

- (void)performEditAction
{
  SFShareSheetSlotManager *slotManager;
  void *v3;
  id v4;

  slotManager = self->_slotManager;
  -[SHSheetServiceManager session](self, "session");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareSheetSlotManager activityViewControllerPerformEditActionsWithSessionID:](slotManager, "activityViewControllerPerformEditActionsWithSessionID:", v3);

}

- (void)performPersonSuggestionWithIdentifier:(id)a3
{
  SFShareSheetSlotManager *slotManager;
  id v5;
  void *v6;
  id v7;

  slotManager = self->_slotManager;
  v5 = a3;
  -[SHSheetServiceManager session](self, "session");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareSheetSlotManager activityViewControllerWithSessionID:selectedPersonWithIdentifier:](slotManager, "activityViewControllerWithSessionID:selectedPersonWithIdentifier:", v6, v5);

}

- (void)removePersonSuggestionWithIdentifier:(id)a3
{
  SFShareSheetSlotManager *slotManager;
  id v5;
  void *v6;
  id v7;

  slotManager = self->_slotManager;
  v5 = a3;
  -[SHSheetServiceManager session](self, "session");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareSheetSlotManager activityViewControllerWithSessionID:removedPersonWithIdentifier:](slotManager, "activityViewControllerWithSessionID:removedPersonWithIdentifier:", v6, v5);

}

- (void)longPressShareActivityWithIdentifier:(id)a3
{
  SFShareSheetSlotManager *slotManager;
  id v5;
  void *v6;
  id v7;

  slotManager = self->_slotManager;
  v5 = a3;
  -[SHSheetServiceManager session](self, "session");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareSheetSlotManager activityViewControllerWithSessionID:didLongPressShareActivityWithIdentifier:](slotManager, "activityViewControllerWithSessionID:didLongPressShareActivityWithIdentifier:", v6, v5);

}

- (void)toggleUserDefaultsActivityWithIdentifier:(id)a3 activityCategory:(int64_t)a4
{
  SFShareSheetSlotManager *slotManager;
  id v7;
  void *v8;
  id v9;

  slotManager = self->_slotManager;
  v7 = a3;
  -[SHSheetServiceManager session](self, "session");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareSheetSlotManager activityViewControllerWithSessionID:toggledActivityWithIdentifier:activityCategory:](slotManager, "activityViewControllerWithSessionID:toggledActivityWithIdentifier:activityCategory:", v8, v7, a4);

}

- (void)favoriteUserDefaultsActivity:(BOOL)a3 withIdentifier:(id)a4 activityCategory:(int64_t)a5
{
  _BOOL8 v6;
  SFShareSheetSlotManager *slotManager;
  id v9;
  void *v10;
  id v11;

  v6 = a3;
  slotManager = self->_slotManager;
  v9 = a4;
  -[SHSheetServiceManager session](self, "session");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareSheetSlotManager activityViewControllerWithSessionID:favoritedActivity:withIdentifier:activityCategory:](slotManager, "activityViewControllerWithSessionID:favoritedActivity:withIdentifier:activityCategory:", v10, v6, v9, a5);

}

- (void)updateUserDefaultsFavorites:(id)a3 activityCategory:(int64_t)a4
{
  SFShareSheetSlotManager *slotManager;
  id v7;
  void *v8;
  id v9;

  slotManager = self->_slotManager;
  v7 = a3;
  -[SHSheetServiceManager session](self, "session");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareSheetSlotManager activityViewControllerWithSessionID:updatedFavoritesProxies:activityCategory:](slotManager, "activityViewControllerWithSessionID:updatedFavoritesProxies:activityCategory:", v8, v7, a4);

}

- (void)performUserDefaultsActivityWithIdentifier:(id)a3 activityCategory:(int64_t)a4
{
  SFShareSheetSlotManager *slotManager;
  id v7;
  void *v8;
  id v9;

  slotManager = self->_slotManager;
  v7 = a3;
  -[SHSheetServiceManager session](self, "session");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareSheetSlotManager activityViewControllerWithSessionID:selectedDefaultActivityWithIdentifier:activityCategory:](slotManager, "activityViewControllerWithSessionID:selectedDefaultActivityWithIdentifier:activityCategory:", v8, v7, a4);

}

- (void)provideFeedbackForPeopleSugestionIdentifier:(id)a3
{
  SFShareSheetSlotManager *slotManager;
  id v5;
  void *v6;
  id v7;

  slotManager = self->_slotManager;
  v5 = a3;
  -[SHSheetServiceManager session](self, "session");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareSheetSlotManager activityViewControllerWithSessionID:provideFeedbackForPeopleSuggestionWithIdentifier:](slotManager, "activityViewControllerWithSessionID:provideFeedbackForPeopleSuggestionWithIdentifier:", v6, v5);

}

- (void)performActivityWithType:(id)a3 completionHandler:(id)a4
{
  SFShareSheetSlotManager *slotManager;
  id v7;
  id v8;
  void *v9;
  id v10;

  slotManager = self->_slotManager;
  v7 = a4;
  v8 = a3;
  -[SHSheetServiceManager session](self, "session");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareSheetSlotManager activityViewControllerWithSessionID:performActivityWithType:completionHandler:](slotManager, "activityViewControllerWithSessionID:performActivityWithType:completionHandler:", v9, v8, v7);

}

- (void)findSupportedActivitiesWithCompletionHandler:(id)a3
{
  SFShareSheetSlotManager *slotManager;
  id v5;
  void *v6;
  id v7;

  slotManager = self->_slotManager;
  v5 = a3;
  -[SHSheetServiceManager session](self, "session");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareSheetSlotManager activityViewControllerWithSessionID:findSupportedActivitiesWithCompletionHandler:](slotManager, "activityViewControllerWithSessionID:findSupportedActivitiesWithCompletionHandler:", v6, v5);

}

- (void)setConnectionState:(int64_t)a3
{
  NSObject *v4;
  unint64_t connectionState;
  __CFString *v6;
  void *v7;
  int v8;
  __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_connectionState != a3)
  {
    self->_connectionState = a3;
    share_sheet_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      connectionState = self->_connectionState;
      if (connectionState > 2)
        v6 = 0;
      else
        v6 = off_1E4003160[connectionState];
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_19E419000, v4, OS_LOG_TYPE_DEFAULT, "Connection state changed:%@", (uint8_t *)&v8, 0xCu);
    }

    -[SHSheetServiceManager delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serviceManagerDidChangeConnectionState:", self);

  }
}

- (void)_handleConnectionCompletion
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];
  uint8_t buf[16];

  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "Connection to sharingd established", buf, 2u);
  }

  -[SHSheetServiceManager setConnectionState:](self, "setConnectionState:", 2);
  share_sheet_log();
  v4 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, self);

  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_19E419000, v4, OS_SIGNPOST_INTERVAL_END, v6, "ConnectToDaemon", " enableTelemetry=YES ", v7, 2u);
  }

  if (-[SHSheetServiceManager updateAfterConnection](self, "updateAfterConnection"))
  {
    -[SHSheetServiceManager setUpdateAfterConnection:](self, "setUpdateAfterConnection:", 0);
    -[SHSheetServiceManager update](self, "update");
  }
}

- (void)_sendConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  SFShareSheetSlotManager *slotManager;
  _QWORD v7[5];
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Sending configuration %@", buf, 0xCu);
  }

  slotManager = self->_slotManager;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SHSheetServiceManager__sendConfiguration___block_invoke;
  v7[3] = &unk_1E40030C8;
  v7[4] = self;
  -[SFShareSheetSlotManager sendConfiguration:completion:](slotManager, "sendConfiguration:completion:", v4, v7);

}

uint64_t __44__SHSheetServiceManager__sendConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "dataSourceUpdatedWithSessionConfiguration:", a2);
}

- (void)_invalidateSlotManagerIfNeeded
{
  NSObject *v3;
  SFShareSheetSlotManager *slotManager;
  uint8_t v5[16];

  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating slot manager", v5, 2u);
  }

  -[SFShareSheetSlotManager setDelegate:](self->_slotManager, "setDelegate:", 0);
  -[SFShareSheetSlotManager invalidate](self->_slotManager, "invalidate");
  slotManager = self->_slotManager;
  self->_slotManager = 0;

}

- (void)connectionInterrupted
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SHSheetServiceManager_connectionInterrupted__block_invoke;
  block[3] = &unk_1E4001608;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __46__SHSheetServiceManager_connectionInterrupted__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "setConnectionState:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_invalidateSlotManagerIfNeeded");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectWithSession:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "update");
}

- (void)dataSourceUpdatedWithSessionConfiguration:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__SHSheetServiceManager_dataSourceUpdatedWithSessionConfiguration___block_invoke;
  v6[3] = &unk_1E4001248;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  sh_dispatch_on_main_queue(v6);

}

void __67__SHSheetServiceManager_dataSourceUpdatedWithSessionConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setConfiguration:", v1);

}

- (void)performActivityInHostWithUUID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SHSheetServiceManager *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__SHSheetServiceManager_performActivityInHostWithUUID___block_invoke;
  v6[3] = &unk_1E4001248;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __55__SHSheetServiceManager_performActivityInHostWithUUID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  share_sheet_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_19E419000, v2, OS_LOG_TYPE_DEFAULT, "Performing in host %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activitiesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityForIdentifier:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serviceManager:performActivity:", *(_QWORD *)(a1 + 40), v6);

  }
}

- (void)performExtensionActivityInHostWithBundleID:(id)a3 request:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  SHSheetServiceManager *v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__SHSheetServiceManager_performExtensionActivityInHostWithBundleID_request___block_invoke;
  block[3] = &unk_1E4001730;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __76__SHSheetServiceManager_performExtensionActivityInHostWithBundleID_request___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  share_sheet_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_19E419000, v2, OS_LOG_TYPE_DEFAULT, "Performing in host %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", *(_QWORD *)(a1 + 32), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[_UIActivityApplicationExtensionDiscovery extensionBasedActivityForExtension:](_UIActivityApplicationExtensionDiscovery, "extensionBasedActivityForExtension:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExtensionItemDataRequest:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serviceManager:performActivity:", *(_QWORD *)(a1 + 48), v5);

  }
}

- (void)performAirDropActivityInHostWithNoContentView:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__SHSheetServiceManager_performAirDropActivityInHostWithNoContentView___block_invoke;
  v3[3] = &unk_1E4001A38;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

void __71__SHSheetServiceManager_performAirDropActivityInHostWithNoContentView___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceManager:performAirdropViewActivityWithNoContentView:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)performShortcutActivityInHostWithBundleID:(id)a3 singleUseToken:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  SHSheetServiceManager *v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__SHSheetServiceManager_performShortcutActivityInHostWithBundleID_singleUseToken___block_invoke;
  block[3] = &unk_1E4001730;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __82__SHSheetServiceManager_performShortcutActivityInHostWithBundleID_singleUseToken___block_invoke(uint64_t a1)
{
  UIShortcutActivity *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  UIShortcutActivity *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", *(_QWORD *)(a1 + 32), 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v2 = [UIShortcutActivity alloc];
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectedAssetIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UIShortcutActivity initWithApplicationExtension:singleUseToken:photosAssetIdentifiers:](v2, "initWithApplicationExtension:singleUseToken:photosAssetIdentifiers:", v8, v3, v5);

    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serviceManager:performActivity:", *(_QWORD *)(a1 + 48), v6);

  }
}

- (void)willPerformInServiceActivityWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__SHSheetServiceManager_willPerformInServiceActivityWithRequest_completion___block_invoke;
  block[3] = &unk_1E4001A88;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __76__SHSheetServiceManager_willPerformInServiceActivityWithRequest_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceManager:willPerformActivityInServiceForRequest:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)didPerformInServiceActivityWithIdentifier:(id)a3 completed:(BOOL)a4 items:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__SHSheetServiceManager_didPerformInServiceActivityWithIdentifier_completed_items_error___block_invoke;
  block[3] = &unk_1E40030F0;
  block[4] = self;
  v17 = v10;
  v20 = a4;
  v18 = v11;
  v19 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __89__SHSheetServiceManager_didPerformInServiceActivityWithIdentifier_completed_items_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceManager:didPerformInServiceActivityWithIdentifier:completed:items:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)performUserDefaultsWithFavoritesProxies:(id)a3 suggestionProxies:(id)a4 orderedUUIDs:(id)a5 activityCategory:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  int64_t v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __113__SHSheetServiceManager_performUserDefaultsWithFavoritesProxies_suggestionProxies_orderedUUIDs_activityCategory___block_invoke;
  block[3] = &unk_1E4003118;
  block[4] = self;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v20 = a6;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __113__SHSheetServiceManager_performUserDefaultsWithFavoritesProxies_suggestionProxies_orderedUUIDs_activityCategory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  SHSheetUserDefaultsContext *v15;
  SHSheetUserDefaultsContext *v16;

  v15 = [SHSheetUserDefaultsContext alloc];
  objc_msgSend(*(id *)(a1 + 32), "session");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activitiesManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "applicationActivityTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activitiesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activitiesByUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "heroActionActivityTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = 1;
  v16 = -[SHSheetUserDefaultsContext initWithApplicationActivityTypes:activitiesByUUID:favoritesProxies:suggestionProxies:orderedUUIDs:excludedActivityTypes:activityCategory:isPresentedModally:](v15, "initWithApplicationActivityTypes:activitiesByUUID:favoritesProxies:suggestionProxies:orderedUUIDs:excludedActivityTypes:activityCategory:isPresentedModally:", v2, v5, v8, v6, v7, v10, *(_QWORD *)(a1 + 64), v12);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serviceManager:performUserDefaultsActivityWithContext:", *(_QWORD *)(a1 + 32), v16);

}

- (void)didUpdateAirDropTransferWithChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__SHSheetServiceManager_didUpdateAirDropTransferWithChange___block_invoke;
  v6[3] = &unk_1E4001248;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __60__SHSheetServiceManager_didUpdateAirDropTransferWithChange___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceManager:didUpdateAirDropTransferWithChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)activityViewControllerDidAppear
{
  SFShareSheetSlotManager *slotManager;
  void *v3;
  id v4;

  slotManager = self->_slotManager;
  -[SHSheetServiceManager session](self, "session");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareSheetSlotManager activityViewControllerDidAppearWithSessionID:](slotManager, "activityViewControllerDidAppearWithSessionID:", v3);

}

- (void)activityViewControllerDidDisappear
{
  SFShareSheetSlotManager *slotManager;
  void *v3;
  id v4;

  slotManager = self->_slotManager;
  -[SHSheetServiceManager session](self, "session");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareSheetSlotManager activityViewControllerDidDisappearWithSessionID:](slotManager, "activityViewControllerDidDisappearWithSessionID:", v3);

}

- (void)applicationDidEnterBackground
{
  SFShareSheetSlotManager *slotManager;
  void *v3;
  id v4;

  slotManager = self->_slotManager;
  -[SHSheetServiceManager session](self, "session");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareSheetSlotManager activityViewControllerDidEnterBackgroundWithSessionID:](slotManager, "activityViewControllerDidEnterBackgroundWithSessionID:", v3);

}

- (void)applicationWillEnterForeground
{
  SFShareSheetSlotManager *slotManager;
  void *v3;
  id v4;

  slotManager = self->_slotManager;
  -[SHSheetServiceManager session](self, "session");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFShareSheetSlotManager activityViewControllerWillEnterForegroundWithSessionID:](slotManager, "activityViewControllerWillEnterForegroundWithSessionID:", v3);

}

- (void)requestDefaultShareModeCollaborationForURL:(id)a3 completionHandler:(id)a4
{
  -[SFShareSheetSlotManager requestDefaultShareModeCollaborationForURL:completionHandler:](self->_slotManager, "requestDefaultShareModeCollaborationForURL:completionHandler:", a3, a4);
}

- (void)requestSharedURLForFileOrFolderURL:(id)a3 completionHandler:(id)a4
{
  -[SFShareSheetSlotManager requestSharedURLForFileOrFolderURL:completionHandler:](self->_slotManager, "requestSharedURLForFileOrFolderURL:completionHandler:", a3, a4);
}

- (void)requestCollaborativeModeForContentIdentifier:(id)a3 completionHandler:(id)a4
{
  -[SFShareSheetSlotManager requestCollaborativeModeForContentIdentifier:completionHandler:](self->_slotManager, "requestCollaborativeModeForContentIdentifier:completionHandler:", a3, a4);
}

- (void)saveCollaborativeMode:(id)a3 forContentIdentifier:(id)a4
{
  -[SFShareSheetSlotManager saveCollaborativeMode:forContentIdentifier:](self->_slotManager, "saveCollaborativeMode:forContentIdentifier:", a3, a4);
}

- (void)deleteSharingURL:(id)a3 containerSetupInfo:(id)a4 completionHandler:(id)a5
{
  -[SFShareSheetSlotManager deleteSharingURL:containerSetupInfo:completionHandler:](self->_slotManager, "deleteSharingURL:containerSetupInfo:completionHandler:", a3, a4, a5);
}

- (void)requestAddParticipantsAllowedForURL:(id)a3 share:(id)a4 completionHandler:(id)a5
{
  -[SFShareSheetSlotManager requestAddParticipantsAllowedForURL:share:completionHandler:](self->_slotManager, "requestAddParticipantsAllowedForURL:share:completionHandler:", a3, a4, a5);
}

- (void)isShareOwnerForFileURL:(id)a3 share:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD))v10;
  if (v9)
  {
    v12 = (void *)MEMORY[0x1E0D97420];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __72__SHSheetServiceManager_isShareOwnerForFileURL_share_completionHandler___block_invoke;
    v17[3] = &unk_1E4003140;
    v18 = v10;
    objc_msgSend(v12, "isShareOwnerOrAdminForShare:completionHandler:", v9, v17);
    v13 = v18;
LABEL_5:

    goto LABEL_6;
  }
  if (v8)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __72__SHSheetServiceManager_isShareOwnerForFileURL_share_completionHandler___block_invoke_2;
    v15[3] = &unk_1E4003140;
    v16 = v10;
    -[SHSheetServiceManager isShareOwnerOrAdminForFileURL:completionHandler:](self, "isShareOwnerOrAdminForFileURL:completionHandler:", v8, v15);
    v13 = v16;
    goto LABEL_5;
  }
  share_sheet_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[SHSheetServiceManager isShareOwnerForFileURL:share:completionHandler:].cold.1(v14);

  v11[2](v11, 0);
LABEL_6:

}

uint64_t __72__SHSheetServiceManager_isShareOwnerForFileURL_share_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__SHSheetServiceManager_isShareOwnerForFileURL_share_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)isShareOwnerOrAdminForFileURL:(id)a3 completionHandler:(id)a4
{
  -[SFShareSheetSlotManager isShareOwnerOrAdminForFileURL:completionHandler:](self->_slotManager, "isShareOwnerOrAdminForFileURL:completionHandler:", a3, a4);
}

- (void)shareStatusForURL:(id)a3 completionHandler:(id)a4
{
  -[SFShareSheetSlotManager shareStatusForFileURL:completionHandler:](self->_slotManager, "shareStatusForFileURL:completionHandler:", a3, a4);
}

- (void)createSharingURLForCollaborationRequest:(id)a3 completionHandler:(id)a4
{
  -[SFShareSheetSlotManager createSharingURLForCollaborationRequest:completionHandler:](self->_slotManager, "createSharingURLForCollaborationRequest:completionHandler:", a3, a4);
}

- (SHSheetSession)session
{
  return self->_session;
}

- (SHSheetServiceManagerDelegate)delegate
{
  return (SHSheetServiceManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (SFShareSheetSlotManager)slotManager
{
  return self->_slotManager;
}

- (UISUIActivityViewControllerConfiguration)hostConfiguration
{
  return self->_hostConfiguration;
}

- (void)setHostConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_hostConfiguration, a3);
}

- (BOOL)updateAfterConnection
{
  return self->_updateAfterConnection;
}

- (void)setUpdateAfterConnection:(BOOL)a3
{
  self->_updateAfterConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostConfiguration, 0);
  objc_storeStrong((id *)&self->_slotManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)isShareOwnerForFileURL:(os_log_t)log share:completionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19E419000, log, OS_LOG_TYPE_ERROR, "no fileURL or share provided to figure out if it's the owner.", v1, 2u);
}

@end
