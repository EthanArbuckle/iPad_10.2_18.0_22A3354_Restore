@implementation NCNotificationRootList

- (NCNotificationRootList)initWithListView:(id)a3
{
  id v5;
  char *v6;
  NCNotificationListCache *v7;
  void *v8;
  NCNotificationListCache *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NCSuggestionManager *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  NCNotificationListPersistentStateManager *v45;
  void *v46;
  NCNotificationListMigrationScheduler *v47;
  void *v48;
  void *v49;
  void *v50;
  objc_super v52;

  v5 = a3;
  v52.receiver = self;
  v52.super_class = (Class)NCNotificationRootList;
  v6 = -[NCNotificationRootList init](&v52, sel_init);
  if (v6)
  {
    objc_storeStrong((id *)&__sharedInstance, v6);
    v7 = objc_alloc_init(NCNotificationListCache);
    v8 = (void *)*((_QWORD *)v6 + 10);
    *((_QWORD *)v6 + 10) = v7;

    objc_msgSend(*((id *)v6 + 10), "setDelegate:", v6);
    v9 = objc_alloc_init(NCNotificationListCache);
    v10 = (void *)*((_QWORD *)v6 + 11);
    *((_QWORD *)v6 + 11) = v9;

    objc_msgSend(*((id *)v6 + 11), "setDelegate:", v6);
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = (void *)*((_QWORD *)v6 + 8);
    *((_QWORD *)v6 + 8) = v11;

    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = (void *)*((_QWORD *)v6 + 15);
    *((_QWORD *)v6 + 15) = v13;

    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v16 = (void *)*((_QWORD *)v6 + 28);
    *((_QWORD *)v6 + 28) = v15;

    v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v18 = (void *)*((_QWORD *)v6 + 16);
    *((_QWORD *)v6 + 16) = v17;

    v6[20] = 0;
    v6[29] = 0;
    objc_msgSend(v6, "_setupNotificationSectionLists");
    v19 = (void *)*((_QWORD *)v6 + 1);
    *((_QWORD *)v6 + 1) = 0;

    v20 = objc_alloc_init(NCSuggestionManager);
    v21 = (void *)*((_QWORD *)v6 + 7);
    *((_QWORD *)v6 + 7) = v20;

    objc_msgSend(*((id *)v6 + 7), "setDelegate:", v6);
    v6[23] = 0;
    *(_WORD *)(v6 + 21) = 0;
    v6[25] = 1;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", CFSTR("NCOverrideNotificationMigrationToHistory"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v6[27] = objc_msgSend(v24, "BOOLForKey:", CFSTR("NCOverrideNotificationMigrationToHistory"));

    }
    else
    {
      v6[27] = 0;
    }

    *((_QWORD *)v6 + 29) = 0xBFF0000000000000;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKey:", CFSTR("NCOverrideNotificationMigrateHighlightToHistoryTimeIntervalKey"));
    v26 = objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v27 = (void *)v26;
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "doubleForKey:", CFSTR("NCOverrideNotificationMigrateHighlightToHistoryTimeIntervalKey"));
      v30 = v29;

      if (v30 <= 0.0)
        goto LABEL_9;
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "doubleForKey:", CFSTR("NCOverrideNotificationMigrateHighlightToHistoryTimeIntervalKey"));
      *((_QWORD *)v6 + 29) = v31;
    }

LABEL_9:
    *((_QWORD *)v6 + 30) = 0xBFF0000000000000;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKey:", CFSTR("NCOverrideNotificationMigrateTimeSensitiveToHistoryTimeIntervalKey"));
    v33 = objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v34 = (void *)v33;
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "doubleForKey:", CFSTR("NCOverrideNotificationMigrateTimeSensitiveToHistoryTimeIntervalKey"));
      v37 = v36;

      if (v37 <= 0.0)
      {
LABEL_13:
        objc_msgSend(v6, "_digestTestRecipe");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        +[PTDomain registerTestRecipe:](NCUNUIKitPrototypeDomain, "registerTestRecipe:", v39);

        objc_msgSend(v6, "_notificationMigrationOverrideTestRecipe");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        +[PTDomain registerTestRecipe:](NCUNUIKitPrototypeDomain, "registerTestRecipe:", v40);

        +[NCNotificationListStalenessEventTracker eventTrackerWithAutomaticCollation](NCNotificationListStalenessEventTracker, "eventTrackerWithAutomaticCollation");
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = (void *)*((_QWORD *)v6 + 13);
        *((_QWORD *)v6 + 13) = v41;

        objc_msgSend(v6, "notificationListStalenessEventTracker");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "incomingSectionList");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setStructuredSectionList:", v44);

        v45 = -[NCNotificationListPersistentStateManager initWithDelegate:]([NCNotificationListPersistentStateManager alloc], "initWithDelegate:", v6);
        v46 = (void *)*((_QWORD *)v6 + 14);
        *((_QWORD *)v6 + 14) = v45;

        v47 = -[NCNotificationListMigrationScheduler initWithDelegate:]([NCNotificationListMigrationScheduler alloc], "initWithDelegate:", v6);
        v48 = (void *)*((_QWORD *)v6 + 25);
        *((_QWORD *)v6 + 25) = v47;

        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "addObserver:forKeyPath:options:context:", v6, CFSTR("NCOverrideNotificationMigrationToHistory"), 1, 0);

        objc_msgSend(v6, "_addStateCaptureBlock");
        objc_storeStrong((id *)v6 + 6, a3);
        objc_msgSend(*((id *)v6 + 6), "setDataSource:", v6);
        objc_msgSend(*((id *)v6 + 6), "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
        v50 = (void *)*((_QWORD *)v6 + 6);
        objc_opt_class();
        objc_msgSend(v50, "setLayoutFromBottom:", (objc_opt_isKindOfClass() & 1) == 0);
        objc_msgSend(*((id *)v6 + 6), "setShouldLimitViewHeightForRollUnder:", 1);
        objc_msgSend(v6, "_updateIndexForReveal");
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "doubleForKey:", CFSTR("NCOverrideNotificationMigrateTimeSensitiveToHistoryTimeIntervalKey"));
      *((_QWORD *)v6 + 30) = v38;
    }

    goto LABEL_13;
  }
LABEL_14:

  return (NCNotificationRootList *)v6;
}

- (void)setDelegate:(id)a3
{
  void *v4;
  NCNotificationListViewProtocol *rootListView;
  id v6;

  v6 = a3;
  objc_storeWeak((id *)&self->_delegate, v6);
  v4 = v6;
  if (v6)
  {
    rootListView = self->_rootListView;
    objc_msgSend(v6, "insetHorizontalMarginForNotificationListComponent:", self);
    -[NCNotificationListViewProtocol setHorizontalInsetMargin:](rootListView, "setHorizontalInsetMargin:");
    v4 = v6;
  }

}

+ (id)sharedInstance
{
  return (id)__sharedInstance;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _BOOL4 overrideMigrationToHistory;
  int v12;
  void *v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("NCOverrideNotificationMigrationToHistory"), a4, a5, a6))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_overrideMigrationToHistory = objc_msgSend(v7, "BOOLForKey:", CFSTR("NCOverrideNotificationMigrationToHistory"));

    v8 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      overrideMigrationToHistory = self->_overrideMigrationToHistory;
      v12 = 138543618;
      v13 = v10;
      v14 = 1024;
      v15 = overrideMigrationToHistory;
      _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ setting override migration to history to %{BOOL}d on user defaults value change", (uint8_t *)&v12, 0x12u);

    }
  }
}

- (void)migrateNotificationsFromIncomingSectionToHistorySection
{
  -[NCNotificationRootList migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection:](self, "migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection:", 1);
}

- (void)migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  void *v9;
  void *v10;
  os_log_t *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  os_log_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  NCNotificationRootList *v26;
  void *v27;
  void *v28;
  void *v29;
  os_log_t v30;
  NSObject *v31;
  void *v32;
  int v33;
  _BOOL4 v34;
  _BOOL4 v35;
  os_log_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  _BOOL4 v54;
  __int16 v55;
  _BOOL4 v56;
  uint64_t v57;

  v3 = a3;
  v57 = *MEMORY[0x1E0C80C00];
  if (-[NCNotificationRootList overrideMigrationToHistory](self, "overrideMigrationToHistory"))
  {
    v5 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v7;
      v8 = "%{public}@ not migrating notifications from incoming section to history section because override is set";
LABEL_4:
      _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);

      return;
    }
    return;
  }
  -[NCNotificationRootList highlightedSectionList](self, "highlightedSectionList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
    goto LABEL_8;
  -[NCNotificationRootList prominentIncomingSectionList](self, "prominentIncomingSectionList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {

LABEL_8:
LABEL_9:
    v11 = (os_log_t *)MEMORY[0x1E0DC5F90];
    v12 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v14;
      _os_log_impl(&dword_1CFC3D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ migrating notifications from incoming section to history section", buf, 0xCu);

    }
    -[NCNotificationRootList prominentIncomingSectionList](self, "prominentIncomingSectionList");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __103__NCNotificationRootList_migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection___block_invoke;
    v48[3] = &unk_1E8D1BF28;
    v48[4] = self;
    BYTE2(v43) = 0;
    LOWORD(v43) = 0;
    -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v15, v16, 0, v48, 0, 0, v43);

    if (_NCStackElevation()
      && +[NCPlatformEligibility areGenerativeModelsAvailable](NCPlatformEligibility, "areGenerativeModelsAvailable")&& -[NCNotificationRootList isGlobalIntelligentSummarizationEnabled](self, "isGlobalIntelligentSummarizationEnabled"))
    {
      v18 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
      {
        v19 = v18;
        -[NCNotificationRootList logDescription](self, "logDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v50 = v20;
        _os_log_impl(&dword_1CFC3D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ migrating notifications in stack", buf, 0xCu);

      }
      -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationRootList historySectionList](self, "historySectionList");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v17;
      v47[1] = 3221225472;
      v47[2] = __103__NCNotificationRootList_migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection___block_invoke_25;
      v47[3] = &unk_1E8D1BF50;
      v47[4] = self;
      BYTE2(v44) = 0;
      LOWORD(v44) = 1;
      -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v21, v22, v47, 0, v3, 1, v44);

      -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationRootList historySectionList](self, "historySectionList");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = v17;
      v46[1] = 3221225472;
      v46[2] = __103__NCNotificationRootList_migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection___block_invoke_27;
      v46[3] = &unk_1E8D1BF28;
      v46[4] = self;
      BYTE2(v44) = 0;
      LOWORD(v44) = 1;
      v25 = v46;
      v26 = self;
      v27 = v23;
      v28 = v24;
      v29 = 0;
    }
    else
    {
      v30 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
      {
        v31 = v30;
        -[NCNotificationRootList logDescription](self, "logDescription");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = _NCStackElevation();
        v34 = +[NCPlatformEligibility areGenerativeModelsAvailable](NCPlatformEligibility, "areGenerativeModelsAvailable");
        v35 = -[NCNotificationRootList isGlobalIntelligentSummarizationEnabled](self, "isGlobalIntelligentSummarizationEnabled");
        *(_DWORD *)buf = 138544130;
        v50 = v32;
        v51 = 1024;
        v52 = v33;
        v53 = 1024;
        v54 = v34;
        v55 = 1024;
        v56 = v35;
        _os_log_impl(&dword_1CFC3D000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ migrating individual notifications; stack elevation not eligible; stackElevationFlagEnabled: %d; ar"
          "eGenerativeModelsAvailable: %d; isGlobalIntelligentSummarizationEnabled: %d",
          buf,
          0x1Eu);

      }
      -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationRootList historySectionList](self, "historySectionList");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v17;
      v45[1] = 3221225472;
      v45[2] = __103__NCNotificationRootList_migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection___block_invoke_2;
      v45[3] = &unk_1E8D1BF28;
      v45[4] = self;
      BYTE2(v44) = 0;
      LOWORD(v44) = 1;
      v29 = &__block_literal_global_3;
      v25 = v45;
      v26 = self;
      v27 = v23;
      v28 = v24;
    }
    -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](v26, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v27, v28, v29, v25, v3, 1, v44);

    if (-[NCNotificationRootList deferDigestMigration](self, "deferDigestMigration")
      && -[NCNotificationRootList _isCurrentDigestListAboveHistorySectionList](self, "_isCurrentDigestListAboveHistorySectionList"))
    {
      v36 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
      {
        v37 = v36;
        -[NCNotificationRootList logDescription](self, "logDescription");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v50 = v38;
        _os_log_impl(&dword_1CFC3D000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ performing deferred migration of current digest", buf, 0xCu);

      }
      -[NCNotificationRootList _migrateCurrentDigestSectionListToReadSection](self, "_migrateCurrentDigestSectionListToReadSection");
      self->_deferDigestMigration = 0;
    }
    else
    {
      -[NCNotificationRootList _scheduleNotificationDigestMigrationIfNecessary](self, "_scheduleNotificationDigestMigrationIfNecessary");
    }
    if (_NCStackElevation()
      && +[NCPlatformEligibility areGenerativeModelsAvailable](NCPlatformEligibility, "areGenerativeModelsAvailable")&& -[NCNotificationRootList isGlobalIntelligentSummarizationEnabled](self, "isGlobalIntelligentSummarizationEnabled"))
    {
      v39 = &__block_literal_global_30;
    }
    else
    {
      v39 = &__block_literal_global_32;
    }
    -[NCNotificationRootList _scheduleAllNotificationRequestsForMigrationFromHighlightList](self, "_scheduleAllNotificationRequestsForMigrationFromHighlightList");
    -[NCNotificationRootList _scheduleNotificationRequestsForMigrationFromIncomingListPassingTest:](self, "_scheduleNotificationRequestsForMigrationFromIncomingListPassingTest:", v39);
    -[NCNotificationRootList _notificationListDidChangeContent](self, "_notificationListDidChangeContent");
    return;
  }
  -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "count");

  if (v41)
    goto LABEL_9;
  v42 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v42;
    -[NCNotificationRootList logDescription](self, "logDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v50 = v7;
    v8 = "%{public}@ not migrating notifications to history section because highlight/prominent/incoming are empty";
    goto LABEL_4;
  }
}

uint64_t __103__NCNotificationRootList_migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_isProminentNotificationRequest:", v3);
  if ((_DWORD)v4)
  {
    v5 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(a1 + 32);
      v7 = v5;
      objc_msgSend(v6, "logDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "notificationIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "un_logDigest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "options");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138544130;
      v14 = v8;
      v15 = 2114;
      v16 = v10;
      v17 = 2048;
      v18 = objc_msgSend(v11, "lockScreenPersistence");
      v19 = 2048;
      v20 = objc_msgSend(v3, "interruptionLevel");
      _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ notification %{public}@ is persistent notification; lockScreenPersistence: %lu; interruptionLevel: %l"
        "u; skip migration from prominent incoming to incoming.",
        (uint8_t *)&v13,
        0x2Au);

    }
  }

  return v4;
}

uint64_t __103__NCNotificationRootList_migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection___block_invoke_25(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "containsCommunicationTypeNotificationRequests") & 1) != 0)
  {
    if (objc_msgSend(v3, "containsPersistentNotificationRequests"))
    {
      v4 = (void *)*MEMORY[0x1E0DC5F90];
      v5 = 0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(void **)(a1 + 32);
        v7 = v4;
        objc_msgSend(v6, "logDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "logDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543618;
        v25 = v8;
        v26 = 2114;
        v27 = v9;
        v10 = "%{public}@ thread %{public}@ contains persistent notification; skip migrate from incoming to history.";
        goto LABEL_10;
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "migrationScheduler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "migratedTimeSensitiveNotificationRequests");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v3, "hasNewTimeSensitiveNotificationRequestsWithMigratedTimeSensitiveNotificationRequests:", v14);

      v16 = (void *)*MEMORY[0x1E0DC5F90];
      v17 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT);
      if (v15)
      {
        if (!v17)
        {
LABEL_11:
          v5 = 0;
          goto LABEL_15;
        }
        v18 = *(void **)(a1 + 32);
        v7 = v16;
        objc_msgSend(v18, "logDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "logDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543618;
        v25 = v8;
        v26 = 2114;
        v27 = v9;
        v10 = "%{public}@ thread %{public}@ contains new time sensitive notification; defer migrate from incoming to hist"
              "ory until migration timer fired.";
LABEL_10:
        _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v24, 0x16u);

        goto LABEL_11;
      }
      if (v17)
      {
        v19 = *(void **)(a1 + 32);
        v20 = v16;
        objc_msgSend(v19, "logDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "logDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543618;
        v25 = v21;
        v26 = 2114;
        v27 = v22;
        _os_log_impl(&dword_1CFC3D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ migrate thread %{public}@ from incoming to history", (uint8_t *)&v24, 0x16u);

      }
      v5 = 1;
    }
  }
  else
  {
    v11 = (void *)*MEMORY[0x1E0DC5F90];
    v5 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(void **)(a1 + 32);
      v7 = v11;
      objc_msgSend(v12, "logDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "threadIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v8;
      v26 = 2114;
      v27 = v9;
      v10 = "%{public}@ thread %{public}@ is not communication thread; skip group migrate from incoming to history.";
      goto LABEL_10;
    }
  }
LABEL_15:

  return v5;
}

uint64_t __103__NCNotificationRootList_migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection___block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  uint64_t v21;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCommunicationType");

  if (v5)
  {
    v6 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      objc_msgSend(v7, "logDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "notificationIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "un_logDigest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v9;
      v30 = 2114;
      v31 = v11;
      v12 = "%{public}@ notification %{public}@ is communication notification; skip individual request migration check fr"
            "om incoming to history.";
LABEL_10:
      _os_log_impl(&dword_1CFC3D000, v8, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v28, 0x16u);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  objc_msgSend(v3, "options");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "lockScreenPersistence");

  if (v14)
  {
    v15 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(void **)(a1 + 32);
      v8 = v15;
      objc_msgSend(v16, "logDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "notificationIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "un_logDigest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v9;
      v30 = 2114;
      v31 = v11;
      v12 = "%{public}@ notification %{public}@ is persistent notification; skip migrate from incoming to history.";
      goto LABEL_10;
    }
LABEL_11:
    v21 = 1;
    goto LABEL_12;
  }
  v17 = objc_msgSend(v3, "interruptionLevel");
  v18 = (void *)*MEMORY[0x1E0DC5F90];
  v19 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT);
  if (v17 == 2)
  {
    if (v19)
    {
      v20 = *(void **)(a1 + 32);
      v8 = v18;
      objc_msgSend(v20, "logDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "notificationIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "un_logDigest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v9;
      v30 = 2114;
      v31 = v11;
      v12 = "%{public}@ notification %{public}@ is time sensitive notification; defer migrate from incoming to history un"
            "til migration timer fired.";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v19)
  {
    v23 = *(void **)(a1 + 32);
    v24 = v18;
    objc_msgSend(v23, "logDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "notificationIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "un_logDigest");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543618;
    v29 = v25;
    v30 = 2114;
    v31 = v27;
    _os_log_impl(&dword_1CFC3D000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ migrate notification %{public}@ from incoming to history", (uint8_t *)&v28, 0x16u);

  }
  v21 = 0;
LABEL_12:

  return v21;
}

uint64_t __103__NCNotificationRootList_migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection___block_invoke_28(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsNonPersistentNotificationRequests");
}

uint64_t __103__NCNotificationRootList_migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "lockScreenPersistence");

  if (v5)
  {
    v6 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      objc_msgSend(v7, "logDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "notificationIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "un_logDigest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v9;
      v26 = 2114;
      v27 = v11;
      v12 = "%{public}@ notification %{public}@ is persistent notification; skip migrate from incoming to history.";
LABEL_7:
      _os_log_impl(&dword_1CFC3D000, v8, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v24, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v13 = objc_msgSend(v3, "interruptionLevel");
  v14 = (void *)*MEMORY[0x1E0DC5F90];
  v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT);
  if (v13 == 2)
  {
    if (v15)
    {
      v16 = *(void **)(a1 + 32);
      v8 = v14;
      objc_msgSend(v16, "logDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "notificationIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "un_logDigest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v9;
      v26 = 2114;
      v27 = v11;
      v12 = "%{public}@ notification %{public}@ is time sensitive notification; defer migrate from incoming to history un"
            "til migration timer fired.";
      goto LABEL_7;
    }
LABEL_8:
    v17 = 1;
    goto LABEL_9;
  }
  if (v15)
  {
    v19 = *(void **)(a1 + 32);
    v20 = v14;
    objc_msgSend(v19, "logDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "notificationIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "un_logDigest");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v21;
    v26 = 2114;
    v27 = v23;
    _os_log_impl(&dword_1CFC3D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ migrate notification %{public}@ from incoming to history", (uint8_t *)&v24, 0x16u);

  }
  v17 = 0;
LABEL_9:

  return v17;
}

BOOL __103__NCNotificationRootList_migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection___block_invoke_29(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lockScreenPersistence") == 0;

  return v3;
}

BOOL __103__NCNotificationRootList_migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection___block_invoke_2_31(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  if (objc_msgSend(v2, "interruptionLevel") == 2)
  {
    objc_msgSend(v2, "options");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "lockScreenPersistence") == 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)listViewControllerPresentedByUserAction
{
  id v2;

  -[NCNotificationRootList notificationListStalenessEventTracker](self, "notificationListStalenessEventTracker");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleEvent:", 0);

}

- (void)toggleFilteringForSectionIdentifier:(id)a3 shouldFilter:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;

  v6 = a3;
  -[NCNotificationRootList _notificationSectionListsForEnumeration](self, "_notificationSectionListsForEnumeration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__NCNotificationRootList_toggleFilteringForSectionIdentifier_shouldFilter___block_invoke;
  v9[3] = &unk_1E8D1C018;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

  -[NCNotificationRootList _notificationListDidChangeContent](self, "_notificationListDidChangeContent");
  -[NCNotificationRootList _updateDelegateAndSubclassIfNecessaryOfContentChange](self, "_updateDelegateAndSubclassIfNecessaryOfContentChange");

}

uint64_t __75__NCNotificationRootList_toggleFilteringForSectionIdentifier_shouldFilter___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "toggleFilteringForSectionIdentifier:shouldFilter:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)setNotificationHistoryRevealed:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (self->_notificationHistoryRevealed == a3)
  {
    if (!a3)
    {
LABEL_10:
      -[NCNotificationRootList _regroupAllNotificationGroups](self, "_regroupAllNotificationGroups");
      -[NCNotificationRootList _sortNotificationGroupsIfNecessary](self, "_sortNotificationGroupsIfNecessary");
      -[NSMutableArray enumerateObjectsUsingBlock:](self->_supplementaryViewsSections, "enumerateObjectsUsingBlock:", &__block_literal_global_35);
      if (-[NCNotificationRootList currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting") == 2
        && -[NCNotificationRootList isListDisplayStyleHiddenForUserInteraction](self, "isListDisplayStyleHiddenForUserInteraction"))
      {
        -[NCNotificationRootList setOverrideNotificationListDisplayStyleSetting:forReason:hideNotificationCount:](self, "setOverrideNotificationListDisplayStyleSetting:forReason:hideNotificationCount:", 2, CFSTR("NCNotificationListDisplayStyleReasonOverridePersistHidden"), 0);
        -[NCNotificationRootList setListDisplayStyleHiddenForUserInteraction:](self, "setListDisplayStyleHiddenForUserInteraction:", 0);
      }
      else if (!-[NCNotificationRootList isListDisplayStyleHiddenForUserInteraction](self, "isListDisplayStyleHiddenForUserInteraction"))
      {
        -[NCNotificationRootList removeOverrideNotificationListDisplayStyleSettingForReason:](self, "removeOverrideNotificationListDisplayStyleSettingForReason:", CFSTR("NCNotificationListDisplayStyleReasonOverridePersistHidden"));
      }
      -[NCNotificationRootList removeOverrideNotificationListDisplayStyleSettingForReason:](self, "removeOverrideNotificationListDisplayStyleSettingForReason:", CFSTR("NCNotificationListDisplayStyleReasonInteractiveTransition"));
      goto LABEL_16;
    }
  }
  else
  {
    if (!a3)
    {
      self->_notificationHistoryRevealed = 0;
      goto LABEL_10;
    }
    if (-[NCNotificationCombinedSectionList count](self->_historySectionList, "count"))
    {
      self->_notificationHistoryRevealed = v3;
      -[NCNotificationRootList setOverrideNotificationListDisplayStyleSetting:forReason:hideNotificationCount:](self, "setOverrideNotificationListDisplayStyleSetting:forReason:hideNotificationCount:", 0, CFSTR("NCNotificationListDisplayStyleReasonInteractiveTransition"), 0);
    }
  }
  if (-[NCNotificationCombinedSectionList count](self->_historySectionList, "count"))
LABEL_16:
    -[NCNotificationRootList _setForceRevealed:](self, "_setForceRevealed:", v3);
}

uint64_t __57__NCNotificationRootList_setNotificationHistoryRevealed___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "collapseAllExpandedSupplementaryViewsGroups");
}

- (void)toggleMissedSectionActive:(BOOL)a3 forDNDMode:(id)a4 hideVisibleNotifications:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  os_log_t *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _BOOL4 missedSectionActive;
  os_log_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  _BYTE v23[10];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v5 = a5;
  v6 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (os_log_t *)MEMORY[0x1E0DC5F90];
  v10 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    -[NCNotificationRootList logDescription](self, "logDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    missedSectionActive = self->_missedSectionActive;
    v20 = 138543874;
    v21 = v12;
    v22 = 1024;
    *(_DWORD *)v23 = missedSectionActive;
    *(_WORD *)&v23[4] = 1024;
    *(_DWORD *)&v23[6] = v6;
    _os_log_impl(&dword_1CFC3D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ toggle missed section; wasActive: %d, isActive: %d.",
      (uint8_t *)&v20,
      0x18u);

  }
  if (self->_missedSectionActive != v6)
  {
    if (v6)
    {
      if (v5)
      {
        -[NCNotificationRootList migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection:](self, "migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection:", -[NCNotificationRootList deviceAuthenticated](self, "deviceAuthenticated") ^ 1);
        -[NCNotificationRootList _migrateCurrentDigestSectionListToReadSection](self, "_migrateCurrentDigestSectionListToReadSection");
      }
      -[NCNotificationRootList _configureUpcomingMissedSectionForDNDMode:](self, "_configureUpcomingMissedSectionForDNDMode:", v8);
    }
    else
    {
      if (-[NCNotificationCombinedSectionList containsSectionList:](self->_upcomingMissedSectionList, "containsSectionList:", self->_currentDigestSectionList))
      {
        v14 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          v15 = v14;
          -[NCNotificationRootList logDescription](self, "logDescription");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NCNotificationStructuredSectionList logDescription](self->_currentDigestSectionList, "logDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NCNotificationStructuredSectionList logDescription](self->_upcomingMissedSectionList, "logDescription");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NCNotificationStructuredSectionList logDescription](self->_incomingSectionList, "logDescription");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138544130;
          v21 = v16;
          v22 = 2114;
          *(_QWORD *)v23 = v17;
          *(_WORD *)&v23[8] = 2114;
          v24 = v18;
          v25 = 2114;
          v26 = v19;
          _os_log_impl(&dword_1CFC3D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ migrating current digest %{public}@ from %{public}@ to %{public}@ as missed section was deactivated.", (uint8_t *)&v20, 0x2Au);

        }
        -[NCNotificationRootList _removeCurrentDigestSectionListFromMissedSectionList](self, "_removeCurrentDigestSectionListFromMissedSectionList");
        -[NCNotificationRootList _upgradeCurrentDigestSectionListForPromotionAboveFold](self, "_upgradeCurrentDigestSectionListForPromotionAboveFold");
        -[NCNotificationSummarizedSectionList collapseSummarizedSectionList](self->_currentDigestSectionList, "collapseSummarizedSectionList");
        -[NCNotificationRootList _insertCurrentDigestSectionList](self, "_insertCurrentDigestSectionList");
      }
      -[NCNotificationRootList _migrateUpcomingMissedSectionToIncoming](self, "_migrateUpcomingMissedSectionToIncoming");
      -[NCNotificationRootList _notificationListDidChangeContent](self, "_notificationListDidChangeContent");
    }
    self->_missedSectionActive = v6;
    -[NCNotificationRootList _updateDelegateAndSubclassIfNecessaryOfContentChange](self, "_updateDelegateAndSubclassIfNecessaryOfContentChange");
  }

}

- (id)notificationRequestWithNotificationIdentifier:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  -[NCNotificationRootList notificationSections](self, "notificationSections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __90__NCNotificationRootList_notificationRequestWithNotificationIdentifier_sectionIdentifier___block_invoke;
  v13[3] = &unk_1E8D1C080;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  v16 = &v17;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __90__NCNotificationRootList_notificationRequestWithNotificationIdentifier_sectionIdentifier___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "allNotificationRequests");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "notificationIdentifier", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "isEqualToString:", a1[4]) & 1) != 0)
        {
          objc_msgSend(v11, "sectionIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", a1[5]);

          if (v14)
          {
            objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v11);
            *a4 = 1;
            goto LABEL_12;
          }
        }
        else
        {

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
LABEL_12:

}

- (void)expandGroupForNotificationRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[NCNotificationRootList notificationSections](self, "notificationSections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__NCNotificationRootList_expandGroupForNotificationRequest_withCompletion___block_invoke;
  v11[3] = &unk_1E8D1C0A8;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

}

uint64_t __75__NCNotificationRootList_expandGroupForNotificationRequest_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "expandGroupForNotificationRequest:withCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)collapseGroupForNotificationRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[NCNotificationRootList notificationSections](self, "notificationSections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__NCNotificationRootList_collapseGroupForNotificationRequest_withCompletion___block_invoke;
  v11[3] = &unk_1E8D1C0A8;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

}

uint64_t __77__NCNotificationRootList_collapseGroupForNotificationRequest_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "collapseGroupForNotificationRequest:withCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)hasVisibleContentToReveal
{
  void *v2;
  char v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;

  if (!-[NCNotificationRootList deviceAuthenticated](self, "deviceAuthenticated"))
  {
    -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "hasVisibleContentToReveal") & 1) != 0)
    {
      v4 = 1;
LABEL_23:

      return v4;
    }
    -[NCNotificationRootList highlightedSectionList](self, "highlightedSectionList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "hasVisibleContentToReveal") & 1) != 0)
    {
      v4 = 1;
LABEL_22:

      goto LABEL_23;
    }
    v7 = -[NCNotificationRootList _isCurrentDigestListAboveHistorySectionList](self, "_isCurrentDigestListAboveHistorySectionList");
    if (v7)
    {
      -[NCNotificationRootList currentDigestSectionList](self, "currentDigestSectionList");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v2, "hasVisibleContentToReveal") & 1) != 0)
      {
        v4 = 1;
        goto LABEL_21;
      }
      if (!-[NCNotificationRootList isNotificationHistoryRevealed](self, "isNotificationHistoryRevealed"))
      {
        v4 = 0;
        goto LABEL_21;
      }
    }
    else if (!-[NCNotificationRootList isNotificationHistoryRevealed](self, "isNotificationHistoryRevealed"))
    {
      v4 = 0;
      goto LABEL_22;
    }
    -[NCNotificationRootList upcomingDigestSectionList](self, "upcomingDigestSectionList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "hasVisibleContentToReveal") & 1) != 0)
    {

      v4 = 1;
      if (!v7)
        goto LABEL_22;
    }
    else
    {
      -[NCNotificationRootList upcomingMissedSectionList](self, "upcomingMissedSectionList");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "hasVisibleContentToReveal") & 1) != 0)
      {

        v4 = 1;
        if (!v7)
          goto LABEL_22;
      }
      else
      {
        -[NCNotificationRootList historySectionList](self, "historySectionList");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v10, "hasVisibleContentToReveal");

        if (!v7)
          goto LABEL_22;
      }
    }
LABEL_21:

    goto LABEL_22;
  }
  return 0;
}

- (void)updateNotificationSystemSettings:(id)a3 previousSystemSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  os_log_t *v11;
  int v12;
  os_log_t v13;
  NSObject *v14;
  void *v15;
  _BOOL4 upcomingDigestVisible;
  uint64_t v17;
  os_log_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NCNotificationRootList setScheduledDeliveryEnabled:](self, "setScheduledDeliveryEnabled:", objc_msgSend(v6, "isScheduledDeliveryEnabled"));
  -[NCNotificationRootList digestScheduleManager](self, "digestScheduleManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NCNotificationRootList digestScheduleManager](self, "digestScheduleManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scheduledDeliveryTimes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDigestScheduleTimes:", v10);

  }
  v11 = (os_log_t *)MEMORY[0x1E0DC5F90];
  if (!v7
    || (v12 = objc_msgSend(v6, "shouldScheduledDeliveryShowNextSummary"),
        v12 != objc_msgSend(v7, "shouldScheduledDeliveryShowNextSummary")))
  {
    self->_upcomingDigestVisible = objc_msgSend(v6, "shouldScheduledDeliveryShowNextSummary");
    v13 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      upcomingDigestVisible = self->_upcomingDigestVisible;
      *(_DWORD *)buf = 138543618;
      v36 = v15;
      v37 = 1024;
      LODWORD(v38) = upcomingDigestVisible;
      _os_log_impl(&dword_1CFC3D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ toggling visibility of upcoming digest to %{BOOL}d", buf, 0x12u);

    }
    -[NCNotificationRootList _toggleUpcomingDigestSectionListVisibility](self, "_toggleUpcomingDigestSectionListVisibility");
    if (!v7)
      goto LABEL_20;
  }
  v17 = objc_msgSend(v6, "listDisplayStyleSetting");
  if (v17 != objc_msgSend(v7, "listDisplayStyleSetting"))
  {
LABEL_20:
    v18 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC6020], "stringForNotificationListDisplayStyleSetting:", objc_msgSend(v6, "listDisplayStyleSetting"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC6020], "stringForNotificationListDisplayStyleSetting:", -[NCNotificationRootList currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v36 = v20;
      v37 = 2114;
      v38 = v21;
      v39 = 2114;
      v40 = v22;
      _os_log_impl(&dword_1CFC3D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ updating notification list display system setting to %{public}@ from %{public}@ on system settings change", buf, 0x20u);

    }
    -[NCNotificationRootList notificationListDisplayStyleSettingsForReason](self, "notificationListDisplayStyleSettingsForReason");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "listDisplayStyleSetting"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setValue:forKey:", v24, CFSTR("NCNotificationListDisplayStyleReasonSystemSetting"));

    -[NCNotificationRootList notificationListDisplayStyleSettingsForReason](self, "notificationListDisplayStyleSettingsForReason");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "removeObjectForKey:", CFSTR("NCNotificationListDisplayStyleReasonInteractiveTransition"));

    -[NCNotificationRootList _updateNotificationListDisplayStyleSetting](self, "_updateNotificationListDisplayStyleSetting");
    if (!v7)
      goto LABEL_19;
  }
  v26 = objc_msgSend(v6, "isSummarizationEnabled");
  if (v26 != objc_msgSend(v7, "isSummarizationEnabled"))
  {
LABEL_19:
    -[NCNotificationRootList setGlobalIntelligentSummarizationEnabled:](self, "setGlobalIntelligentSummarizationEnabled:", objc_msgSend(v6, "isSummarizationEnabled"));
    -[NCNotificationRootList notificationSections](self, "notificationSections");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __82__NCNotificationRootList_updateNotificationSystemSettings_previousSystemSettings___block_invoke;
    v32 = &unk_1E8D1C0D0;
    v33 = v6;
    v34 = v7;
    objc_msgSend(v27, "enumerateObjectsUsingBlock:", &v29);

    if (!v7)
      goto LABEL_15;
  }
  v28 = objc_msgSend(v6, "areHighlightsEnabled", v29, v30, v31, v32);
  if (v28 != objc_msgSend(v7, "areHighlightsEnabled"))
LABEL_15:
    -[NCNotificationRootList _setHighlightsFeatureEnabled:](self, "_setHighlightsFeatureEnabled:", objc_msgSend(v6, "areHighlightsEnabled", v29, v30, v31, v32));

}

uint64_t __82__NCNotificationRootList_updateNotificationSystemSettings_previousSystemSettings___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateNotificationSystemSettings:previousSystemSettings:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)hasVisibleUrgentBreakthroughContent
{
  void *v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[NCNotificationRootList _visibleNotificationRequests](self, "_visibleNotificationRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NCNotificationRootList isMissedSectionActive](self, "isMissedSectionActive") && objc_msgSend(v3, "count"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61__NCNotificationRootList_hasVisibleUrgentBreakthroughContent__block_invoke;
    v6[3] = &unk_1E8D1C0F8;
    v6[4] = &v7;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  }
  v4 = *((_BYTE *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __61__NCNotificationRootList_hasVisibleUrgentBreakthroughContent__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  BOOL v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "alertOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "suppression"))
    v7 = (unint64_t)objc_msgSend(v8, "interruptionLevel") > 1;
  else
    v7 = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7;

  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

- (void)reloadRemoteSuggestions
{
  -[NCSuggestionManager reloadRemoteSuggestions](self->_suggestionManager, "reloadRemoteSuggestions");
}

- (void)setOnboardingSummaryVisible:(BOOL)a3
{
  _BOOL4 v3;
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  os_log_t v9;
  os_log_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NCNotificationSummarizedSectionList *currentDigestSectionList;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  unint64_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const __CFString *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NCMutableDigestInfo *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  dispatch_time_t v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  _QWORD block[5];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  id v53;
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  unint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (self->_onboardingSummaryVisible != a3)
  {
    v3 = a3;
    v5 = (os_log_t *)MEMORY[0x1E0DC5F90];
    v6 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v56 = v8;
      v57 = 1024;
      LODWORD(v58) = v3;
      _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ setting onboarding summary visible = %{BOOL}d", buf, 0x12u);

    }
    if (v3)
    {
      if (self->_currentDigestSectionList)
      {
        v9 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
          -[NCNotificationRootList setOnboardingSummaryVisible:].cold.2(v9, self);
      }
      else
      {
        -[NCNotificationCombinedSectionList allNotificationRequests](self->_historySectionList, "allNotificationRequests");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v15, "copy");

        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "dateByAddingTimeInterval:", -86400.0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __54__NCNotificationRootList_setOnboardingSummaryVisible___block_invoke;
        v52[3] = &unk_1E8D1BF28;
        v19 = v18;
        v53 = v19;
        objc_msgSend(v16, "bs_filter:", v52);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");
        v22 = *v5;
        if (v21 < 5)
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            -[NCNotificationRootList setOnboardingSummaryVisible:].cold.1(v22);
        }
        else
        {
          v45 = v19;
          v46 = v16;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = v22;
            -[NCNotificationRootList logDescription](self, "logDescription");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v56 = v24;
            v57 = 2048;
            v58 = v21;
            _os_log_impl(&dword_1CFC3D000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ creating onboarding summary with notification count %lu", buf, 0x16u);

          }
          objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "components:fromDate:", 124, v17);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = objc_msgSend(v26, "hour");
          v28 = 18 - v27;
          if (v27 >= 18)
            v28 = v27 - 18;
          v29 = 8 - v27;
          if (v27 >= 8)
            v29 = v27 - 8;
          if (v28 >= v29)
            v30 = 8;
          else
            v30 = 18;
          if (v28 >= v29)
            v31 = CFSTR("NOTIFICATION_SUMMARY_HEADER_MORNING");
          else
            v31 = CFSTR("NOTIFICATION_SUMMARY_HEADER_EVENING");
          objc_msgSend(v26, "setHour:", v30);
          objc_msgSend(v26, "setMinute:", 0);
          objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "dateFromComponents:", v26);
          v33 = objc_claimAutoreleasedReturnValue();

          NCUserNotificationsUIKitFrameworkBundle();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "localizedStringForKey:value:table:", v31, &stru_1E8D21F60, 0);
          v35 = objc_claimAutoreleasedReturnValue();

          v36 = objc_alloc_init(NCMutableDigestInfo);
          v43 = (void *)v35;
          -[NCMutableDigestInfo setHeaderString:](v36, "setHeaderString:", v35);
          v44 = (void *)v33;
          -[NCMutableDigestInfo setScheduleDate:](v36, "setScheduleDate:", v33);
          -[NCNotificationRootList _configureCurrentDigestSectionListWithDigestInfo:sectionType:summaryOrderProviderType:](self, "_configureCurrentDigestSectionListWithDigestInfo:sectionType:summaryOrderProviderType:", v36, 8, 1);
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          v37 = v20;
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
          if (v38)
          {
            v39 = v38;
            v40 = *(_QWORD *)v49;
            do
            {
              for (i = 0; i != v39; ++i)
              {
                if (*(_QWORD *)v49 != v40)
                  objc_enumerationMutation(v37);
                -[NCNotificationSummarizedSectionList insertNotificationRequest:](self->_currentDigestSectionList, "insertNotificationRequest:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
              }
              v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
            }
            while (v39);
          }

          v42 = dispatch_time(0, 500000000);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __54__NCNotificationRootList_setOnboardingSummaryVisible___block_invoke_49;
          block[3] = &unk_1E8D1B568;
          block[4] = self;
          dispatch_after(v42, MEMORY[0x1E0C80D38], block);
          self->_onboardingSummaryVisible = v3;

          v19 = v45;
          v16 = v46;
        }

      }
    }
    else
    {
      v10 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        -[NCNotificationRootList logDescription](self, "logDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v56 = v12;
        _os_log_impl(&dword_1CFC3D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ removing onboarding summary from list", buf, 0xCu);

      }
      -[NCNotificationStructuredSectionList listView](self->_currentDigestSectionList, "listView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setGrouped:", 1);

      -[NCNotificationRootList _removeCurrentDigestSectionList](self, "_removeCurrentDigestSectionList");
      currentDigestSectionList = self->_currentDigestSectionList;
      self->_currentDigestSectionList = 0;

      self->_onboardingSummaryVisible = 0;
    }
  }
}

BOOL __54__NCNotificationRootList_setOnboardingSummaryVisible___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "earlierDate:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == *(void **)(a1 + 32))
  {
    objc_msgSend(v3, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_msgSend(v7, "isCommunicationType") & 1) == 0
      && (unint64_t)objc_msgSend(v3, "interruptionLevel") < 2;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __54__NCNotificationRootList_setOnboardingSummaryVisible___block_invoke_49(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_toggleCurrentDigestSectionListVisibility");
}

- (id)insertSupplementaryViewsContainerAtListPosition:(unint64_t)a3 identifier:(id)a4 withDescription:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NCNotificationListSupplementaryViewsSection *v13;
  NCNotificationListCache *supplementaryCache;
  NCNotificationListCache *v15;
  NCNotificationListCache *v16;
  uint64_t v17;
  NSMutableArray *supplementaryViewsSections;
  void *v19;
  _QWORD v21[5];
  _BYTE buf[24];
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    -[NCNotificationRootList logDescription](self, "logDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2048;
    v23 = a3;
    _os_log_impl(&dword_1CFC3D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting supplementary views container for %{public}@ at position %lu", buf, 0x20u);

  }
  v13 = -[NCNotificationListSupplementaryViewsSection initWithPosition:]([NCNotificationListSupplementaryViewsSection alloc], "initWithPosition:", a3);
  supplementaryCache = self->_supplementaryCache;
  if (!supplementaryCache)
  {
    v15 = objc_alloc_init(NCNotificationListCache);
    v16 = self->_supplementaryCache;
    self->_supplementaryCache = v15;

    -[NCNotificationListCache setDelegate:](self->_supplementaryCache, "setDelegate:", self);
    supplementaryCache = self->_supplementaryCache;
  }
  -[NCNotificationListSupplementaryViewsSection setNotificationListCache:](v13, "setNotificationListCache:", supplementaryCache);
  -[NCNotificationListSupplementaryViewsSection setIdentifier:](v13, "setIdentifier:", v8);
  -[NCNotificationListSupplementaryViewsSection setDescriptionString:](v13, "setDescriptionString:", v9);
  -[NCNotificationListSupplementaryViewsSection setDelegate:](v13, "setDelegate:", self);
  -[NCNotificationRootList _updateIndexForReveal](self, "_updateIndexForReveal");
  v17 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v23 = 0;
  if (a3 != 1)
  {
    supplementaryViewsSections = self->_supplementaryViewsSections;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __101__NCNotificationRootList_insertSupplementaryViewsContainerAtListPosition_identifier_withDescription___block_invoke;
    v21[3] = &unk_1E8D1C120;
    v21[4] = buf;
    -[NSMutableArray enumerateObjectsUsingBlock:](supplementaryViewsSections, "enumerateObjectsUsingBlock:", v21, 0);
    v17 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
  }
  -[NSMutableArray insertObject:atIndex:](self->_supplementaryViewsSections, "insertObject:atIndex:", v13, v17);
  -[NCNotificationRootList rootListView](self, "rootListView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "insertViewAtIndex:animated:", *(_QWORD *)(*(_QWORD *)&buf[8] + 24), 0);

  _Block_object_dispose(buf, 8);
  return v13;
}

void __101__NCNotificationRootList_insertSupplementaryViewsContainerAtListPosition_identifier_withDescription___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "position") == 1)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3 + 1;
  else
    *a4 = 1;

}

- (void)didTapCountIndicator
{
  -[NCNotificationRootList setOverrideNotificationListDisplayStyleSetting:forReason:hideNotificationCount:](self, "setOverrideNotificationListDisplayStyleSetting:forReason:hideNotificationCount:", 1, CFSTR("NCNotificationListDisplayStyleReasonFooterUITapped"), 0);
}

- (void)setOverrideNotificationListDisplayStyleSetting:(int64_t)a3 forReason:(id)a4 hideNotificationCount:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  os_log_t *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  os_log_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  double v50;
  uint64_t v51;
  CGRect v52;
  CGRect v53;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("NCNotificationListDisplayStyleReasonFooterUITapped")))
  {
    -[NCNotificationRootList delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "notificationCount")
       || -[NCNotificationRootList _isCurrentDigestListAboveHistorySectionList](self, "_isCurrentDigestListAboveHistorySectionList"))&& -[NCNotificationRootList currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting") == 2)
    {
      v10 = -[NCNotificationRootList isNotificationHistoryRevealed](self, "isNotificationHistoryRevealed");

      if (!v10)
      {
        v11 = (os_log_t *)MEMORY[0x1E0DC5F90];
        v12 = (void *)*MEMORY[0x1E0DC5F90];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
        {
          v13 = v12;
          -[NCNotificationRootList logDescription](self, "logDescription");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = 138543362;
          v46 = v14;
          _os_log_impl(&dword_1CFC3D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ revealing incoming notification section for list string representation tapped", (uint8_t *)&v45, 0xCu);

        }
        -[NCNotificationRootList setOverrideNotificationListDisplayStyleSetting:forReason:hideNotificationCount:](self, "setOverrideNotificationListDisplayStyleSetting:forReason:hideNotificationCount:", a3, CFSTR("NCNotificationListDisplayStyleReasonInteractiveTransition"), 0);
        -[NCNotificationRootList _notificationListSections](self, "_notificationListSections");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "indexOfObject:", v16);

        if (v17 != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[NCNotificationRootList rootListView](self, "rootListView");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "layoutOffsetForViewAtIndex:", v17);
          v20 = v19 + -100.0;

          -[NCNotificationRootList rootListView](self, "rootListView");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NCNotificationRootList rootListView](self, "rootListView");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "frame");
          -[NCNotificationRootList notificationListView:heightForItemAtIndex:withWidth:](self, "notificationListView:heightForItemAtIndex:withWidth:", v21, v17, CGRectGetWidth(v52));
          v24 = v23;

          -[NCNotificationRootList rootListView](self, "rootListView");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "frame");
          v26 = v20 + v24 - CGRectGetHeight(v53);
          -[NCNotificationRootList rootListView](self, "rootListView");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "contentInset");
          v29 = v26 + v28 + -100.0;

          if (v20 >= v29)
            v20 = v29;
          -[NCNotificationRootList rootListView](self, "rootListView");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "contentOffset");
          v32 = v31;

          if (v32 < v20)
            v32 = v20;
          v33 = *v11;
          if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
          {
            v34 = v33;
            -[NCNotificationRootList logDescription](self, "logDescription");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[NCNotificationRootList rootListView](self, "rootListView");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "contentOffset");
            v45 = 138543874;
            v46 = v35;
            v47 = 2048;
            v48 = v37;
            v49 = 2048;
            v50 = v32;
            _os_log_impl(&dword_1CFC3D000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ currentContentOffset.y is %f; set to %f to reveal incoming section",
              (uint8_t *)&v45,
              0x20u);

          }
          -[NCNotificationRootList rootListView](self, "rootListView");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "_setContentOffsetWithDecelerationAnimation:", 0.0, v32);

        }
        objc_msgSend(v8, "notificationListBaseComponentDidSignificantUserInteraction:", self);
      }
    }
    else
    {

    }
  }
  else
  {
    v39 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v40 = v39;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC6020], "stringForNotificationListDisplayStyleSetting:", a3);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 138543874;
      v46 = v41;
      v47 = 2114;
      v48 = v42;
      v49 = 2114;
      v50 = *(double *)&v7;
      _os_log_impl(&dword_1CFC3D000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ setting override notification list display style setting to %{public}@ for reason %{public}@", (uint8_t *)&v45, 0x20u);

    }
    -[NCNotificationRootList notificationListDisplayStyleSettingsForReason](self, "notificationListDisplayStyleSettingsForReason");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setValue:forKey:", v44, v7);

    -[NCNotificationRootList _updateNotificationListDisplayStyleSetting](self, "_updateNotificationListDisplayStyleSetting");
  }

}

- (void)removeOverrideNotificationListDisplayStyleSettingForReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NCNotificationRootList notificationListDisplayStyleSettingsForReason](self, "notificationListDisplayStyleSettingsForReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v9;
      v13 = 2114;
      v14 = v4;
      _os_log_impl(&dword_1CFC3D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ removing override notification list display style setting for reason %{public}@", (uint8_t *)&v11, 0x16u);

    }
    -[NCNotificationRootList notificationListDisplayStyleSettingsForReason](self, "notificationListDisplayStyleSettingsForReason");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v4);

    -[NCNotificationRootList _updateNotificationListDisplayStyleSetting](self, "_updateNotificationListDisplayStyleSetting");
  }

}

- (void)setActiveDNDModeConfiguration:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_activeDNDModeConfiguration, a3);
    -[NCNotificationRootList rootListView](self, "rootListView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");

  }
}

- (id)activeDNDMode
{
  return (id)-[DNDModeConfiguration mode](self->_activeDNDModeConfiguration, "mode");
}

- (void)updateListViewVisibleRectForSize:(CGSize)a3
{
  id v4;

  -[NCNotificationRootList rootListView](self, "rootListView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentOffset");
  -[NCNotificationRootList _updateVisibleRectForContentOffset:size:](self, "_updateVisibleRectForContentOffset:size:");

}

- (BOOL)isScrollingListContent
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;

  if ((-[NCNotificationListViewProtocol isTracking](self->_rootListView, "isTracking") & 1) == 0
    && !-[NCNotificationRootList _isAdditionalPanGestureActive](self, "_isAdditionalPanGestureActive"))
  {
    return 0;
  }
  -[NCNotificationListViewProtocol panGestureRecognizer](self->_rootListView, "panGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationInView:", self->_rootListView);
  v5 = v4;
  objc_msgSend(v3, "velocityInView:", self->_rootListView);
  v7 = v6;
  -[NCNotificationListViewProtocol contentLayoutOffset](self->_rootListView, "contentLayoutOffset");
  v9 = v5 >= v8 || v7 < 0.0;

  return v9;
}

- (unint64_t)visibleNotificationCount
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[NCNotificationStructuredSectionList notificationCount](self->_incomingSectionList, "notificationCount");
  v4 = -[NCNotificationStructuredSectionList notificationCount](self->_prominentIncomingSectionList, "notificationCount")+ v3;
  v5 = v4 + -[NCNotificationStructuredSectionList notificationCount](self->_highlightedSectionList, "notificationCount");
  return v5
       + -[NCNotificationRootList _isCurrentDigestListAboveHistorySectionList](self, "_isCurrentDigestListAboveHistorySectionList");
}

- (void)prepareForUIAppear
{
  NSMutableArray *v2;
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
  v2 = self->_notificationSections;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "prepareForUIAppear", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)handleTapToWake
{
  NSMutableArray *v2;
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
  v2 = self->_notificationSections;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "handleTapToWake", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)setVisibleRectBottomMarginForRollUnder:(double)a3
{
  id v4;

  -[NCNotificationRootList rootListView](self, "rootListView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVisibleRectBottomMarginForRollUnder:", a3);

}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[NCNotificationRootList notificationSections](self, "notificationSections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

+ (NSSet)presentableTypes
{
  void *v2;
  void *v3;
  void *v4;

  +[NCNotificationListSupplementaryViewsSection presentableTypes](NCNotificationListSupplementaryViewsSection, "presentableTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NCNotificationStructuredSectionList presentableTypes](NCNotificationStructuredSectionList, "presentableTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (void)clearAll
{
  -[NCNotificationRootList _clearAllNotifications:supplementaryViewControllers:](self, "_clearAllNotifications:supplementaryViewControllers:", 1, 1);
}

- (unint64_t)notificationCount
{
  void *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[NCNotificationRootList notificationSections](self, "notificationSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__NCNotificationRootList_notificationCount__block_invoke;
  v6[3] = &unk_1E8D1C148;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __43__NCNotificationRootList_notificationCount__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = objc_msgSend(*(id *)(a1 + 32), "_indexForReveal");
  if (v5 - objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "count") > a3
    || objc_msgSend(*(id *)(a1 + 32), "isNotificationHistoryRevealed"))
  {
    v6 = objc_msgSend(v7, "notificationCount");
  }
  else
  {
    v6 = 0;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v6;

}

- (unint64_t)totalNotificationCount
{
  void *v2;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[NCNotificationRootList notificationSections](self, "notificationSections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__NCNotificationRootList_totalNotificationCount__block_invoke;
  v5[3] = &unk_1E8D1C170;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__NCNotificationRootList_totalNotificationCount__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "notificationCount");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (void)insertNotificationRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  id v8;

  v8 = a3;
  -[NCNotificationRootList suggestionManager](self, "suggestionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "checkSuggestionNeededForNotificationRequest:", v8);

  -[NCNotificationRootList loadedNotificationSections](self, "loadedNotificationSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "containsObject:", v6))
  {

    goto LABEL_5;
  }
  v7 = -[NCNotificationRootList containsNotificationRequest:](self, "containsNotificationRequest:", v8);

  if (!v7)
  {
    -[NCNotificationRootList suggestionManager](self, "suggestionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadRemoteSuggestions");
LABEL_5:

  }
  -[NCNotificationRootList _insertNotificationRequest:](self, "_insertNotificationRequest:", v8);
  -[NCNotificationRootList _notificationListDidChangeContent](self, "_notificationListDidChangeContent");

}

- (id)matchingRequestForRequest:(id)a3 inList:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  objc_msgSend(a4, "allNotificationRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__NCNotificationRootList_matchingRequestForRequest_inList___block_invoke;
  v11[3] = &unk_1E8D1C198;
  v12 = v5;
  v7 = v5;
  v8 = objc_msgSend(v6, "indexOfObjectPassingTest:", v11);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

uint64_t __59__NCNotificationRootList_matchingRequestForRequest_inList___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matchesRequest:", *(_QWORD *)(a1 + 32));
}

- (void)removeNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  os_log_t *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  os_log_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  os_log_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  os_log_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _BOOL4 v46;
  os_log_t v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _BOOL4 v56;
  os_log_t v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _BOOL4 v66;
  os_log_t v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  _BOOL4 v76;
  os_log_t v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  _BOOL4 v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  NSObject *log;
  uint8_t buf[4];
  void *v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  void *v99;
  __int16 v100;
  void *v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "requestDestinations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = (os_log_t *)MEMORY[0x1E0DC5F90];
  if (!v6)
  {
    v8 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
      -[NCNotificationRootList removeNotificationRequest:].cold.1(v8, self);
  }
  -[NCNotificationRootList highlightedSectionList](self, "highlightedSectionList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NCNotificationRootList _isNotificationRequest:forSectionList:](self, "_isNotificationRequest:forSectionList:", v4, v9);

  if (v10)
  {
    -[NCNotificationRootList highlightedSectionList](self, "highlightedSectionList");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeNotificationRequest:", v4);

  }
  -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[NCNotificationRootList _isNotificationRequest:forSectionList:](self, "_isNotificationRequest:forSectionList:", v4, v12);

  if (v13)
  {
    -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationRootList matchingRequestForRequest:inList:](self, "matchingRequestForRequest:inList:", v4, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "requestDestinations");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "containsObject:", CFSTR("BulletinDestinationNotificationCenter"));

      v18 = v17 ^ 1;
    }
    else
    {
      v18 = 1;
    }
    objc_msgSend(v4, "requestDestinations");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "containsObject:", CFSTR("BulletinDestinationNotificationCenter"));

    if ((v18 & 1) == 0 && (v20 & 1) == 0)
    {
      -[NCNotificationRootList historySectionList](self, "historySectionList");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "insertNotificationRequest:", v15);

      v22 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        log = v22;
        -[NCNotificationRootList logDescription](self, "logDescription");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "notificationIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "un_logDigest");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "logDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationRootList historySectionList](self, "historySectionList");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "logDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v95 = v92;
        v96 = 2114;
        v97 = v24;
        v98 = 2114;
        v99 = v26;
        v100 = 2114;
        v101 = v28;
        _os_log_impl(&dword_1CFC3D000, log, OS_LOG_TYPE_DEFAULT, "%{public}@ Migrating notification request %{public}@ from %{public}@ to %{public}@ on removal", buf, 0x2Au);

        v7 = (os_log_t *)MEMORY[0x1E0DC5F90];
      }
    }
    v29 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v30 = v29;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "un_logDigest");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "logDescription");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v95 = v31;
      v96 = 2114;
      v97 = v33;
      v98 = 2114;
      v99 = v35;
      _os_log_impl(&dword_1CFC3D000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ removing notification request %{public}@ from %{public}@", buf, 0x20u);

    }
    -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "removeNotificationRequest:", v4);

    if (-[NCNotificationRootList isMissedSectionActive](self, "isMissedSectionActive"))
    {
      v37 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        v38 = v37;
        -[NCNotificationRootList logDescription](self, "logDescription");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "notificationIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "un_logDigest");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationRootList upcomingMissedSectionList](self, "upcomingMissedSectionList");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "logDescription");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v95 = v39;
        v96 = 2114;
        v97 = v41;
        v98 = 2114;
        v99 = v43;
        _os_log_impl(&dword_1CFC3D000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@ removing notification request %{public}@ from %{public}@", buf, 0x20u);

      }
      -[NCNotificationRootList upcomingMissedSectionList](self, "upcomingMissedSectionList");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "removeNotificationRequest:", v4);

    }
  }
  -[NCNotificationRootList prominentIncomingSectionList](self, "prominentIncomingSectionList");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[NCNotificationRootList _isNotificationRequest:forSectionList:](self, "_isNotificationRequest:forSectionList:", v4, v45);

  if (v46)
  {
    v47 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v48 = v47;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "un_logDigest");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationRootList prominentIncomingSectionList](self, "prominentIncomingSectionList");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "logDescription");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v95 = v49;
      v96 = 2114;
      v97 = v51;
      v98 = 2114;
      v99 = v53;
      _os_log_impl(&dword_1CFC3D000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@ removing notification request %{public}@ from %{public}@", buf, 0x20u);

    }
    -[NCNotificationRootList prominentIncomingSectionList](self, "prominentIncomingSectionList");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "removeNotificationRequest:", v4);

  }
  -[NCNotificationRootList historySectionList](self, "historySectionList");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = -[NCNotificationRootList _isNotificationRequest:forSectionList:](self, "_isNotificationRequest:forSectionList:", v4, v55);

  if (v56)
  {
    v57 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v58 = v57;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "un_logDigest");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationRootList historySectionList](self, "historySectionList");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "logDescription");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v95 = v59;
      v96 = 2114;
      v97 = v61;
      v98 = 2114;
      v99 = v63;
      _os_log_impl(&dword_1CFC3D000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@ removing notification request %{public}@ from %{public}@", buf, 0x20u);

    }
    -[NCNotificationRootList historySectionList](self, "historySectionList");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "removeNotificationRequest:", v4);

  }
  -[NCNotificationRootList currentDigestSectionList](self, "currentDigestSectionList");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = -[NCNotificationRootList _isNotificationRequest:forSectionList:](self, "_isNotificationRequest:forSectionList:", v4, v65);

  if (v66)
  {
    v67 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v68 = v67;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "un_logDigest");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationRootList currentDigestSectionList](self, "currentDigestSectionList");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "logDescription");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v95 = v69;
      v96 = 2114;
      v97 = v71;
      v98 = 2114;
      v99 = v73;
      _os_log_impl(&dword_1CFC3D000, v68, OS_LOG_TYPE_DEFAULT, "%{public}@ removing notification request %{public}@ from %{public}@", buf, 0x20u);

    }
    -[NCNotificationRootList currentDigestSectionList](self, "currentDigestSectionList");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "removeNotificationRequest:", v4);

  }
  -[NCNotificationRootList upcomingDigestSectionList](self, "upcomingDigestSectionList");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = -[NCNotificationRootList _isNotificationRequest:forSectionList:](self, "_isNotificationRequest:forSectionList:", v4, v75);

  if (v76)
  {
    v77 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v78 = v77;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "notificationIdentifier");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "un_logDigest");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationRootList upcomingDigestSectionList](self, "upcomingDigestSectionList");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "logDescription");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v95 = v79;
      v96 = 2114;
      v97 = v81;
      v98 = 2114;
      v99 = v83;
      _os_log_impl(&dword_1CFC3D000, v78, OS_LOG_TYPE_DEFAULT, "%{public}@ removing notification request %{public}@ from %{public}@", buf, 0x20u);

    }
    -[NCNotificationRootList upcomingDigestSectionList](self, "upcomingDigestSectionList");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "removeNotificationRequest:", v4);

  }
  -[NCNotificationRootList _notificationListDidChangeContent](self, "_notificationListDidChangeContent");
  -[NCNotificationRootList historySectionList](self, "historySectionList");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = -[NCNotificationRootList _isNotificationRequest:forSectionList:](self, "_isNotificationRequest:forSectionList:", v4, v85);

  if (v86)
  {
    -[NCNotificationRootList notificationListCache](self, "notificationListCache");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "removeNotificationRequest:", v4);

    -[NCNotificationRootList notificationSummaryCache](self, "notificationSummaryCache");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "removeNotificationRequest:", v4);

    -[NCNotificationRootList suggestionManager](self, "suggestionManager");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "clearSuggestionForNotificationRequest:", v4);

    -[NCNotificationRootList migrationScheduler](self, "migrationScheduler");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "removeMigrationForNotificationRequest:", v4);

    -[NCNotificationRootList migrationScheduler](self, "migrationScheduler");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "removeMigratedTimeSensitiveNotificationRequests:", v4);

  }
}

- (void)modifyNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[NCNotificationRootList logDescription](self, "logDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "un_logDigest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ modifying notification request %{public}@", (uint8_t *)&v10, 0x16u);

  }
  -[NCNotificationRootList _insertNotificationRequest:](self, "_insertNotificationRequest:", v4);
  -[NCNotificationRootList _notificationListDidChangeContent](self, "_notificationListDidChangeContent");

}

- (void)reloadNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[NCNotificationRootList logDescription](self, "logDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "un_logDigest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v7;
    v18 = 2114;
    v19 = v9;
    _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ reloading notification request %{public}@", buf, 0x16u);

  }
  -[NCNotificationRootList notificationListCache](self, "notificationListCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clearCachedHeightsForNotificationRequest:", v4);

  -[NCNotificationRootList notificationSummaryCache](self, "notificationSummaryCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clearCachedHeightsForNotificationRequest:", v4);

  -[NCNotificationRootList notificationSections](self, "notificationSections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__NCNotificationRootList_reloadNotificationRequest___block_invoke;
  v14[3] = &unk_1E8D1B648;
  v15 = v4;
  v13 = v4;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v14);

}

uint64_t __52__NCNotificationRootList_reloadNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadNotificationRequest:", *(_QWORD *)(a1 + 32));
}

- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, void *);
  void *v43;
  id v44;
  id v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[5];
  id v49;
  _QWORD v50[5];
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NCNotificationRootList highlightedSectionList](self, "highlightedSectionList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NCNotificationRootList highlightedSectionList](self, "highlightedSectionList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);

  }
  -[NCNotificationRootList prominentIncomingSectionList](self, "prominentIncomingSectionList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NCNotificationRootList prominentIncomingSectionList](self, "prominentIncomingSectionList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v12);

  }
  -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v14);

  }
  -[NCNotificationRootList upcomingMissedSectionList](self, "upcomingMissedSectionList");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[NCNotificationRootList upcomingMissedSectionList](self, "upcomingMissedSectionList");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v16);

  }
  v17 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    v18 = objc_msgSend(v6, "showsInLockScreen");
    if (v18 != objc_msgSend(v7, "showsInLockScreen") && (objc_msgSend(v6, "showsInLockScreen") & 1) == 0)
    {
      v19 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v20 = v19;
        -[NCNotificationRootList logDescription](self, "logDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "sectionIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v53 = v21;
        v54 = 2114;
        v55 = v22;
        _os_log_impl(&dword_1CFC3D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ moving notifications to history section for %{public}@ on Show in Lock Screen turned OFF", buf, 0x16u);

      }
      v50[0] = v17;
      v50[1] = 3221225472;
      v50[2] = __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke;
      v50[3] = &unk_1E8D1C0D0;
      v50[4] = self;
      v51 = v6;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v50);
      -[NCNotificationRootList _updateDelegateAndSubclassIfNecessaryOfContentChange](self, "_updateDelegateAndSubclassIfNecessaryOfContentChange");

    }
    objc_msgSend(v6, "muteAssertion");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "muteAssertion");
    v24 = objc_claimAutoreleasedReturnValue();
    if (v23 == (void *)v24)
    {

    }
    else
    {
      v25 = (void *)v24;
      objc_msgSend(v6, "muteAssertion");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        v27 = (void *)*MEMORY[0x1E0DC5F90];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
        {
          v28 = v27;
          -[NCNotificationRootList logDescription](self, "logDescription");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "sectionIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "muteAssertion");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v53 = v29;
          v54 = 2114;
          v55 = v30;
          v56 = 2112;
          v57 = v31;
          _os_log_impl(&dword_1CFC3D000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ moving notifications to history section for %{public}@ on mute assertion change to %@", buf, 0x20u);

        }
        v48[0] = v17;
        v48[1] = 3221225472;
        v48[2] = __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_54;
        v48[3] = &unk_1E8D1C0D0;
        v48[4] = self;
        v49 = v6;
        objc_msgSend(v8, "enumerateObjectsUsingBlock:", v48);
        -[NCNotificationRootList _updateDelegateAndSubclassIfNecessaryOfContentChange](self, "_updateDelegateAndSubclassIfNecessaryOfContentChange");

      }
    }
    v32 = objc_msgSend(v6, "isScheduledDeliveryEnabled");
    if (v32 != objc_msgSend(v7, "isScheduledDeliveryEnabled")
      && objc_msgSend(v6, "isScheduledDeliveryEnabled"))
    {
      v33 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v34 = v33;
        -[NCNotificationRootList logDescription](self, "logDescription");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "sectionIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v53 = v35;
        v54 = 2114;
        v55 = v36;
        _os_log_impl(&dword_1CFC3D000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ moving notifications to upcoming digest for %{public}@ on Scheduled Delivery setting enabled", buf, 0x16u);

      }
      v46[0] = v17;
      v46[1] = 3221225472;
      v46[2] = __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_56;
      v46[3] = &unk_1E8D1C0D0;
      v46[4] = self;
      v47 = v6;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v46);
      -[NCNotificationRootList _updateDelegateAndSubclassIfNecessaryOfContentChange](self, "_updateDelegateAndSubclassIfNecessaryOfContentChange");

    }
  }
  -[NCNotificationRootList notificationSections](self, "notificationSections");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v17;
  v41 = 3221225472;
  v42 = __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_3;
  v43 = &unk_1E8D1C0D0;
  v44 = v6;
  v45 = v7;
  v38 = v7;
  v39 = v6;
  objc_msgSend(v37, "enumerateObjectsUsingBlock:", &v40);

  -[NCSuggestionManager updateNotificationSectionSettings:previousSectionSettings:](self->_suggestionManager, "updateNotificationSectionSettings:previousSectionSettings:", v39, v38, v40, v41, v42, v43);
  -[NCNotificationRootList _notificationListDidChangeContent](self, "_notificationListDidChangeContent");

}

void __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "historySectionList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_2;
  v7[3] = &unk_1E8D1BF50;
  v8 = *(id *)(a1 + 40);
  BYTE2(v6) = 1;
  LOWORD(v6) = 1;
  objc_msgSend(v3, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v4, v5, v7, 0, 0, 1, v6);

}

uint64_t __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

void __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  if (objc_msgSend(v3, "notificationCount"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "historySectionList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_2_55;
    v7[3] = &unk_1E8D1BF50;
    v8 = *(id *)(a1 + 40);
    BYTE2(v6) = 0;
    LOWORD(v6) = 257;
    objc_msgSend(v4, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v3, v5, v7, 0, 0, 1, v6);

  }
}

BOOL __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_2_55(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  v3 = a2;
  objc_msgSend(v3, "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "muteAssertion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "threadIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "activeMuteAssertionLevelForThreadIdentifier:", v7) != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_56(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "upcomingDigestSectionList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_2_57;
  v7[3] = &unk_1E8D1BF50;
  v8 = *(id *)(a1 + 40);
  BYTE2(v6) = 0;
  LOWORD(v6) = 256;
  objc_msgSend(v3, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v4, v5, v7, 0, 0, 0, v6);

}

uint64_t __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_2_57(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "sectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateNotificationSectionSettings:previousSectionSettings:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (NSString)logDescription
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Notification Root List [%@]"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (double)scrollViewVisibleContentLayoutOffsetY
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;

  -[NCNotificationRootList rootListView](self, "rootListView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentLayoutOffset");
  v5 = v4;

  -[NCNotificationRootList rootListView](self, "rootListView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentOffset");
  v8 = v7;
  -[NCNotificationRootList rootListView](self, "rootListView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentInset");
  v11 = v8 + v10;

  v12 = 0.0;
  if (v11 > v5 && v5 > 0.0)
    v12 = v11;
  return v5 - v12;
}

- (void)setDeviceAuthenticated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  BOOL v12;

  if (self->_deviceAuthenticated != a3)
  {
    v3 = a3;
    self->_deviceAuthenticated = a3;
    -[NCNotificationRootList suggestionManager](self, "suggestionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDeviceAuthenticated:", v3);

    v6 = (void *)MEMORY[0x1E0C99E20];
    -[NCNotificationRootList _notificationSectionListsForEnumeration](self, "_notificationSectionListsForEnumeration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithSet:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (self->_upcomingDigestSectionList)
      objc_msgSend(v9, "addObject:");
    if (self->_currentDigestSectionList)
      objc_msgSend(v9, "addObject:");
    v8 = v9;
    if (self->_upcomingMissedSectionList)
    {
      objc_msgSend(v9, "addObject:");
      v8 = v9;
    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __49__NCNotificationRootList_setDeviceAuthenticated___block_invoke;
    v11[3] = &__block_descriptor_33_e49_v24__0__NCNotificationStructuredSectionList_8_B16l;
    v12 = v3;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11, v9);
    -[NCNotificationRootList _performDeferredMigrationIfNecessary](self, "_performDeferredMigrationIfNecessary");
    if (!-[NCNotificationRootList isNotificationHistoryRevealed](self, "isNotificationHistoryRevealed"))
      -[NCNotificationRootList _sortNotificationGroupsIfNecessary](self, "_sortNotificationGroupsIfNecessary");
    -[NCNotificationRootList _notificationListDidChangeContent](self, "_notificationListDidChangeContent");

  }
}

uint64_t __49__NCNotificationRootList_setDeviceAuthenticated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDeviceAuthenticated:", *(unsigned __int8 *)(a1 + 32));
}

- (void)notificationsLoadedForSectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NCNotificationRootList loadedNotificationSections](self, "loadedNotificationSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v9;
      v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_1CFC3D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ notifications loaded for section %{public}@", buf, 0x16u);

    }
    -[NCNotificationRootList loadedNotificationSections](self, "loadedNotificationSections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v10, "addObject:", v11);

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[NCNotificationRootList notificationSections](self, "notificationSections", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v17, "preloadsNotificationRequests"))
            objc_msgSend(v17, "notificationsLoadedForSectionIdentifier:", v4);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }

    -[NCNotificationRootList persistentStateManager](self, "persistentStateManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "notificationsLoadedForSectionIdentifier:", v4);

  }
}

- (BOOL)containsNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[NCNotificationRootList notificationSections](self, "notificationSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__NCNotificationRootList_containsNotificationRequest___block_invoke;
  v8[3] = &unk_1E8D1C1E0;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

uint64_t __54__NCNotificationRootList_containsNotificationRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "containsNotificationRequest:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (NSDate)comparisonDate
{
  return 0;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v5;
  id WeakRetained;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NCNotificationRootList;
  if (-[NCNotificationRootList respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    v5 = 1;
  }
  else if (+[NCNotificationStructuredListUtilities isNotificationListComponentDelegateMethod:](NCNotificationStructuredListUtilities, "isNotificationListComponentDelegateMethod:", a3))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  id WeakRetained;
  objc_super v6;

  v4 = a3;
  if (+[NCNotificationStructuredListUtilities isNotificationListComponentDelegateMethod:](NCNotificationStructuredListUtilities, "isNotificationListComponentDelegateMethod:", objc_msgSend(v4, "selector")))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "invokeWithTarget:", WeakRetained);
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)NCNotificationRootList;
      -[NCNotificationRootList forwardInvocation:](&v6, sel_forwardInvocation_, v4);
    }

  }
}

- (void)notificationListBaseComponentRequestsClearingAll:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "presentableTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NCNotificationStructuredSectionList presentableTypes](NCNotificationStructuredSectionList, "presentableTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isSubsetOfSet:", v6);

  v8 = (void *)objc_opt_class();
  objc_msgSend(v8, "presentableTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[NCNotificationListSupplementaryViewsSection presentableTypes](NCNotificationListSupplementaryViewsSection, "presentableTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isSubsetOfSet:", v10);

  -[NCNotificationRootList _clearAllNotifications:supplementaryViewControllers:](self, "_clearAllNotifications:supplementaryViewControllers:", v7, v11);
}

- (id)notificationStructuredSectionList:(id)a3 requestsAuxiliaryOptionsContentProviderForNotificationRequest:(id)a4 isLongLook:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;

  v5 = a5;
  v7 = a4;
  -[NCNotificationRootList suggestionManager](self, "suggestionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "auxiliaryOptionsContentProviderForNotificationRequest:isLongLook:", v7, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)notificationStructuredSectionList:(id)a3 shouldFilterNotificationRequest:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[NCNotificationRootList delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v6, "notificationRootList:shouldFilterNotificationRequest:", self, v5);

  return (char)self;
}

- (BOOL)notificationStructuredSectionList:(id)a3 areNotificationsLoadedForSectionIdentifier:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[NCNotificationRootList loadedNotificationSections](self, "loadedNotificationSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  return v7;
}

- (void)notificationStructuredSectionList:(id)a3 transitionedGroupedStateIsGrouped:(BOOL)a4
{
  id v4;

  if (self->_currentDigestSectionList == a3 || self->_upcomingDigestSectionList == a3)
  {
    -[NCNotificationRootList rootListView](self, "rootListView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

  }
}

- (void)notificationStructuredSectionListRequestsClearingSection:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[NCNotificationRootList logDescription](self, "logDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ requested to clear %{public}@ from the list", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(v4, "clearAll");
  -[NCNotificationRootList _notificationListDidChangeContent](self, "_notificationListDidChangeContent");

}

- (void)notificationStructuredSectionListDidClearAllNotificationRequests:(id)a3
{
  NCNotificationSummarizedSectionList *currentDigestSectionList;

  if (self->_currentDigestSectionList == a3)
  {
    -[NCNotificationRootList _removeCurrentDigestSectionListFromContainingSectionList](self, "_removeCurrentDigestSectionListFromContainingSectionList");
    currentDigestSectionList = self->_currentDigestSectionList;
    self->_currentDigestSectionList = 0;

  }
  -[NCNotificationRootList _notificationListDidChangeContent](self, "_notificationListDidChangeContent");
}

- (BOOL)shouldScrollToTopForNotificationListBaseComponent:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double Height;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  CGRect v16;
  CGRect v17;

  v4 = a3;
  -[NCNotificationRootList rootListView](self, "rootListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentSize");
  v7 = v6;

  objc_msgSend(v4, "listView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "frame");
  Height = CGRectGetHeight(v16);

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v11 = CGRectGetHeight(v17);

  -[NCNotificationRootList rootListView](self, "rootListView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentInset");
  v14 = v13;

  return v7 - Height + v14 < v11;
}

- (void)notificationListComponent:(id)a3 didRemoveNotificationRequest:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[NCNotificationRootList delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationListComponent:didRemoveNotificationRequest:", self, v5);

  -[NCNotificationRootList _notificationListDidChangeContent](self, "_notificationListDidChangeContent");
}

- (void)notificationListBaseComponentDidRemoveAll:(id)a3
{
  void *v4;

  -[NCNotificationRootList delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationListBaseComponentDidRemoveAll:", self);

  -[NCNotificationRootList _notificationListDidChangeContent](self, "_notificationListDidChangeContent");
}

- (BOOL)handleTapOnNotificationListBaseComponent:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 != v4)
  {

LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  v6 = -[NCNotificationRootList currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting");

  if (v6 != 1)
    goto LABEL_7;
  v7 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[NCNotificationRootList logDescription](self, "logDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC6020], "stringForNotificationListDisplayStyleSetting:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC6020], "stringForNotificationListDisplayStyleSetting:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v9;
    v17 = 2114;
    v18 = v10;
    v19 = 2114;
    v20 = v11;
    _os_log_impl(&dword_1CFC3D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ transitioning to %{public}@ from %{public}@ on user tap", (uint8_t *)&v15, 0x20u);

  }
  -[NCNotificationRootList setOverrideNotificationListDisplayStyleSetting:forReason:hideNotificationCount:](self, "setOverrideNotificationListDisplayStyleSetting:forReason:hideNotificationCount:", 0, CFSTR("NCNotificationListDisplayStyleReasonInteractiveTransition"), 0);
  -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (unint64_t)objc_msgSend(v12, "count") > 1;

LABEL_8:
  return v13;
}

- (double)notificationListView:(id)a3 heightForItemAtIndex:(unint64_t)a4 withWidth:(double)a5
{
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  double v15;

  -[NCNotificationRootList _notificationListSections](self, "_notificationListSections", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0.0;
  if (objc_msgSend(v7, "count") > a4)
  {
    objc_msgSend(v7, "objectAtIndex:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = objc_opt_class();
      v11 = v9;
      if (v10)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v9;
        else
          v12 = 0;
      }
      else
      {
        v12 = 0;
      }
      v13 = v12;

      objc_msgSend(v13, "listView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "sizeThatFits:", a5, 0.0);
      v8 = v15;

    }
  }

  return v8;
}

- (id)notificationListView:(id)a3 viewForItemAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double Width;
  CGRect v24;
  CGRect v25;

  -[NCNotificationRootList _notificationListSections](self, "_notificationListSections", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") <= a4)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v9 = objc_opt_class();
      v10 = v7;
      if (v9)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v7;
        else
          v11 = 0;
      }
      else
      {
        v11 = 0;
      }
      v12 = v11;

      objc_msgSend(v12, "listView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }
    -[NCNotificationRootList rootListView](self, "rootListView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    v24.origin.x = v15;
    v24.origin.y = v17;
    v24.size.width = v19;
    v24.size.height = v21;
    Width = CGRectGetWidth(v24);
    v25.origin.x = v15;
    v25.origin.y = v17;
    v25.size.width = v19;
    v25.size.height = v21;
    objc_msgSend(v8, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v25));

  }
  return v8;
}

- (unint64_t)notificationListViewNumberOfItems:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NCNotificationRootList _notificationListSections](self, "_notificationListSections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (void)recycleView:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "recycleVisibleViews");

}

- (double)footerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  return 60.0;
}

- (void)notificationListDidLayoutSubviews
{
  __int128 v3;
  void *v4;
  uint64_t v5;
  void *v6;
  CGSize v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  const char *v16;
  __int128 v17;
  __int128 v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x4010000000;
  v16 = "";
  v3 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v17 = *MEMORY[0x1E0C9D648];
  v18 = v3;
  -[NCNotificationRootList notificationSections](self, "notificationSections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__NCNotificationRootList_notificationListDidLayoutSubviews__block_invoke;
  v12[3] = &unk_1E8D1C170;
  v12[4] = &v13;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v12);

  -[NCNotificationRootList supplementaryViewsSections](self, "supplementaryViewsSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __59__NCNotificationRootList_notificationListDidLayoutSubviews__block_invoke_2;
  v11[3] = &unk_1E8D1C120;
  v11[4] = &v13;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);

  if (!CGRectEqualToRect(self->_aggregatedVisibleContentExtent, *((CGRect *)v14 + 1)))
  {
    v7 = (CGSize)*((_OWORD *)v14 + 3);
    self->_aggregatedVisibleContentExtent.origin = (CGPoint)*((_OWORD *)v14 + 2);
    self->_aggregatedVisibleContentExtent.size = v7;
    -[NCNotificationRootList rootListView](self, "rootListView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "debugView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayRect:withName:", CFSTR("aggregatedVisibleContentExtent"), self->_aggregatedVisibleContentExtent.origin.x, self->_aggregatedVisibleContentExtent.origin.y, self->_aggregatedVisibleContentExtent.size.width, self->_aggregatedVisibleContentExtent.size.height);

    -[NCNotificationRootList delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "notificationRootListDidUpdateVisibleContentExtent:", self);

  }
  _Block_object_dispose(&v13, 8);
}

void __59__NCNotificationRootList_notificationListDidLayoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat y;
  double v10;
  CGFloat width;
  double v12;
  CGFloat height;
  _BOOL4 v14;
  CGRect *v15;
  id v16;
  CGRect v17;
  CGRect v18;

  v16 = a2;
  v3 = objc_msgSend(v16, "isSectionVisible");
  v4 = v16;
  if (v3)
  {
    objc_msgSend(v16, "listView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6;
    y = v8;
    width = v10;
    height = v12;

    v14 = CGRectEqualToRect(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), *MEMORY[0x1E0C9D648]);
    v15 = *(CGRect **)(*(_QWORD *)(a1 + 32) + 8);
    if (v14)
    {
      v15[1].origin.x = v7;
    }
    else
    {
      v18.origin.x = v7;
      v18.origin.y = y;
      v18.size.width = width;
      v18.size.height = height;
      v17 = CGRectUnion(v15[1], v18);
      y = v17.origin.y;
      width = v17.size.width;
      height = v17.size.height;
      v15 = *(CGRect **)(*(_QWORD *)(a1 + 32) + 8);
      v15[1].origin.x = v17.origin.x;
    }
    v15[1].origin.y = y;
    v15[1].size.width = width;
    v15[1].size.height = height;
    v4 = v16;
  }

}

void __59__NCNotificationRootList_notificationListDidLayoutSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat y;
  double v11;
  CGFloat width;
  double v13;
  CGFloat height;
  _BOOL4 v15;
  CGRect *v16;
  id v17;
  CGRect v18;
  CGRect v19;

  v17 = a2;
  objc_msgSend(v17, "supplementaryViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = v17;
  if (v4)
  {
    objc_msgSend(v17, "listView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = v7;
    y = v9;
    width = v11;
    height = v13;

    v15 = CGRectEqualToRect(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), *MEMORY[0x1E0C9D648]);
    v16 = *(CGRect **)(*(_QWORD *)(a1 + 32) + 8);
    if (v15)
    {
      v16[1].origin.x = v8;
    }
    else
    {
      v19.origin.x = v8;
      v19.origin.y = y;
      v19.size.width = width;
      v19.size.height = height;
      v18 = CGRectUnion(v16[1], v19);
      y = v18.origin.y;
      width = v18.size.width;
      height = v18.size.height;
      v16 = *(CGRect **)(*(_QWORD *)(a1 + 32) + 8);
      v16[1].origin.x = v18.origin.x;
    }
    v16[1].origin.y = y;
    v16[1].size.width = width;
    v16[1].size.height = height;
    v5 = v17;
  }

}

- (void)suggestionManager:(id)a3 requestsUpdatingContentForNotificationRequest:(id)a4
{
  -[NCNotificationRootList reloadNotificationRequest:](self, "reloadNotificationRequest:", a4);
}

- (void)suggestionManager:(id)a3 requestsPresentingNotificationManagementViewType:(unint64_t)a4 forNotificationRequest:(id)a5 withPresentingView:(id)a6
{
  id v9;
  id v10;
  id v11;

  v9 = a6;
  v10 = a5;
  -[NCNotificationRootList delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "notificationListComponent:requestsPresentingManagementViewForNotificationRequest:managementViewType:withPresentingView:completion:", self, v10, a4, v9, 0);

}

- (id)suggestionManager:(id)a3 requestsSectionSettingsForSectionIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[NCNotificationRootList delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationListComponent:sectionSettingsForSectionIdentifier:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)suggestionManager:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  id v14;

  v9 = a4;
  v11 = a7;
  v12 = a6;
  v13 = a5;
  -[NCNotificationRootList delegate](self, "delegate");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "notificationListComponent:setMuted:untilDate:forSectionIdentifier:threadIdentifier:", self, v9, v13, v12, v11);

}

- (void)suggestionManager:(id)a3 setScheduledDelivery:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a4;
  v7 = a5;
  -[NCNotificationRootList delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notificationListComponent:setScheduledDelivery:forSectionIdentifier:", self, v5, v7);

}

- (void)suggestionManager:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a4;
  v7 = a5;
  -[NCNotificationRootList delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notificationListComponent:setAllowsTimeSensitive:forSectionIdentifier:", self, v5, v7);

}

- (void)suggestionManager:(id)a3 setAllowsDirectMessages:(BOOL)a4 forSectionIdentifier:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a4;
  v7 = a5;
  -[NCNotificationRootList delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notificationListComponent:setAllowsDirectMessages:forSectionIdentifier:", self, v5, v7);

}

- (id)suggestionManager:(id)a3 notificationRequestForUUID:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[NCNotificationRootList delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationListComponent:notificationRequestForUUID:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)suggestionManagerRequestsCurrentModeConfiguration:(id)a3
{
  void *v4;
  void *v5;

  -[NCNotificationRootList delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationListComponentRequestsCurrentModeConfiguration:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)suggestionManager:(id)a3 setModeConfiguration:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[NCNotificationRootList delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationListComponent:setModeConfiguration:", self, v5);

}

- (BOOL)suggestionManager:(id)a3 isSummaryVisibleForNotificationRequest:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[NCNotificationRootList _sectionForNotificationRequest:](self, "_sectionForNotificationRequest:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isShowingSummaryForNotificationRequest:", v5);

  return v7;
}

- (BOOL)suggestionManager:(id)a3 isThreadSummaryVisibleForNotificationRequest:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[NCNotificationRootList _sectionForNotificationRequest:](self, "_sectionForNotificationRequest:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isShowingSummarizedStackForNotificationRequest:", v5);

  return v7;
}

- (void)adjustForLegibilitySettingsChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[NCNotificationRootList _notificationSectionListsForEnumeration](self, "_notificationSectionListsForEnumeration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__NCNotificationRootList_adjustForLegibilitySettingsChange___block_invoke;
  v7[3] = &unk_1E8D1C208;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __60__NCNotificationRootList_adjustForLegibilitySettingsChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "adjustForLegibilitySettingsChange:", *(_QWORD *)(a1 + 32));
}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NCNotificationRootList _notificationSectionListsForEnumeration](self, "_notificationSectionListsForEnumeration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_71);

  -[NSMutableArray enumerateObjectsUsingBlock:](self->_supplementaryViewsSections, "enumerateObjectsUsingBlock:", &__block_literal_global_72);
  -[NCNotificationRootList notificationListCache](self, "notificationListCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adjustForContentSizeCategoryChange");

  -[NCNotificationRootList supplementaryCache](self, "supplementaryCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "adjustForContentSizeCategoryChange");

  -[NCNotificationRootList notificationSummaryCache](self, "notificationSummaryCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "adjustForContentSizeCategoryChange");

  return 1;
}

uint64_t __60__NCNotificationRootList_adjustForContentSizeCategoryChange__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "adjustForContentSizeCategoryChange");
}

uint64_t __60__NCNotificationRootList_adjustForContentSizeCategoryChange__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "adjustForContentSizeCategoryChange");
}

- (Class)notificationListCacheNotificationViewControllerClass:(id)a3
{
  id WeakRetained;
  void *v5;
  objc_class *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = (void *)objc_msgSend(WeakRetained, "notificationRootListNotificationViewControllerClass:", self);
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (void)publishScheduledDigest:(id)a3 upcomingDigest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[NCNotificationRootList logDescription](self, "logDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v10;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ received request from Digest Schedule Manager to promote upcoming digest to current with digest info = %{public}@", (uint8_t *)&v11, 0x16u);

  }
  -[NCNotificationRootList _dissolveCurrentDigestSectionListToHistorySection](self, "_dissolveCurrentDigestSectionListToHistorySection");
  -[NCNotificationRootList _migrateUpcomingDigestSectionListToCurrentDigestSectionList](self, "_migrateUpcomingDigestSectionListToCurrentDigestSectionList");
  -[NCNotificationRootList _configureUpcomingDigestSectionListWithDigestInfo:](self, "_configureUpcomingDigestSectionListWithDigestInfo:", v7);
  -[NCNotificationRootList _notificationListDidChangeContent](self, "_notificationListDidChangeContent");

}

- (void)publishUpcomingDigest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[NCNotificationRootList logDescription](self, "logDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ received request Digest Schedule Manager to publish upcoming digest with digest info = %{public}@", (uint8_t *)&v8, 0x16u);

  }
  if (self->_upcomingDigestSectionList)
    -[NCNotificationRootList _updateUpcomingDigestSectionListWithDigestInfo:](self, "_updateUpcomingDigestSectionListWithDigestInfo:", v4);
  else
    -[NCNotificationRootList _configureUpcomingDigestSectionListWithDigestInfo:](self, "_configureUpcomingDigestSectionListWithDigestInfo:", v4);
  -[NCNotificationRootList _notificationListDidChangeContent](self, "_notificationListDidChangeContent");

}

- (void)revokeUpcomingDigest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[NCNotificationRootList logDescription](self, "logDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ received request from Digest Schedule Manager to cancel digest with digest info = %{public}@", (uint8_t *)&v8, 0x16u);

  }
  -[NCNotificationRootList _dissolveCurrentDigestSectionListToHistorySection](self, "_dissolveCurrentDigestSectionListToHistorySection");
  -[NCNotificationRootList _dissolveUpcomingDigestSectionListToHistorySection](self, "_dissolveUpcomingDigestSectionListToHistorySection");
  -[NCNotificationRootList _notificationListDidChangeContent](self, "_notificationListDidChangeContent");

}

- (void)persistentStateManager:(id)a3 didFetchSummaryMigrationTime:(id)a4
{
  id v5;
  double v6;
  double v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "timeIntervalSinceNow");
  v7 = v6;
  v8 = (void *)*MEMORY[0x1E0DC5F90];
  v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT);
  if (v7 <= 0.0)
  {
    if (v9)
    {
      v12 = v8;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v13;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_1CFC3D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ persisted stored migration time for digest at %@ has expired!", (uint8_t *)&v14, 0x16u);

    }
  }
  else
  {
    if (v9)
    {
      v10 = v8;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_1CFC3D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ received persisted stored migration time for digest at %@", (uint8_t *)&v14, 0x16u);

    }
    -[NCNotificationListMigrationScheduler setMigrationDateForNotificationDigest:](self->_migrationScheduler, "setMigrationDateForNotificationDigest:", v5);
  }

}

- (void)persistentStateManager:(id)a3 hasStoredDataForSectionType:(unint64_t)a4
{
  id v6;
  os_log_t *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  os_log_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (os_log_t *)MEMORY[0x1E0DC5F90];
  v8 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[NCNotificationRootList logDescription](self, "logDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NCNotificationListSectionTypeString(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v10;
    v18 = 2114;
    v19 = v11;
    _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ has persisted stored data for section %{public}@", (uint8_t *)&v16, 0x16u);

  }
  if (a4 == 4)
  {
    v12 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NCNotificationListSectionTypeString(4uLL);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2114;
      v19 = v15;
      _os_log_impl(&dword_1CFC3D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ deferring presentation of section %{public}@ pending stored data load", (uint8_t *)&v16, 0x16u);

    }
    -[NCNotificationRootList setDeferCurrentDigestPresentationForPersistedDataLoad:](self, "setDeferCurrentDigestPresentationForPersistedDataLoad:", 1);
  }

}

- (void)persistentStateManager:(id)a3 finishedLoadingDataForSectionType:(unint64_t)a4
{
  id v6;
  os_log_t *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  os_log_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (os_log_t *)MEMORY[0x1E0DC5F90];
  v8 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[NCNotificationRootList logDescription](self, "logDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NCNotificationListSectionTypeString(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v10;
    v18 = 2114;
    v19 = v11;
    _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ finished loading stored data for section %{public}@", (uint8_t *)&v16, 0x16u);

  }
  if (a4 == 4)
  {
    v12 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NCNotificationListSectionTypeString(4uLL);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2114;
      v19 = v15;
      _os_log_impl(&dword_1CFC3D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ enabling presentation for section %{public}@ on stored data load finish", (uint8_t *)&v16, 0x16u);

    }
    -[NCNotificationRootList setDeferCurrentDigestPresentationForPersistedDataLoad:](self, "setDeferCurrentDigestPresentationForPersistedDataLoad:", 0);
    if (self->_currentDigestSectionList
      && !-[NCNotificationRootList _isCurrentDigestListInHistorySectionList](self, "_isCurrentDigestListInHistorySectionList")&& -[NCNotificationStructuredSectionList sectionType](self->_currentDigestSectionList, "sectionType") == 4)
    {
      if (-[NCNotificationRootList _isPersistentStateCurrentDigestInMissedSection](self, "_isPersistentStateCurrentDigestInMissedSection"))
      {
        -[NCNotificationRootList _insertCurrentDigestSectionListToMissedSectionList](self, "_insertCurrentDigestSectionListToMissedSectionList");
      }
      else
      {
        -[NCNotificationRootList _insertCurrentDigestSectionList](self, "_insertCurrentDigestSectionList");
      }
    }
  }

}

- (void)persistentStateManager:(id)a3 didFetchMigrationTime:(id)a4 forNotificationRequest:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NCNotificationListMigrationScheduler *migrationScheduler;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    -[NCNotificationRootList logDescription](self, "logDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "notificationIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "un_logDigest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v11;
    v19 = 2114;
    v20 = v13;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_1CFC3D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ received persisted stored migration time for request %{public}@ at %@", buf, 0x20u);

  }
  migrationScheduler = self->_migrationScheduler;
  v16 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListMigrationScheduler addMigrationForNotificationRequests:forDate:](migrationScheduler, "addMigrationForNotificationRequests:forDate:", v15, v7);

}

- (void)persistentStateManager:(id)a3 didFetchStoredListInfo:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSDictionary *v9;
  NSDictionary *persistentStoredListInfo;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[NCNotificationRootList logDescription](self, "logDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ received persisted stored info = %{public}@", (uint8_t *)&v11, 0x16u);

  }
  v9 = (NSDictionary *)objc_msgSend(v5, "copy");
  persistentStoredListInfo = self->_persistentStoredListInfo;
  self->_persistentStoredListInfo = v9;

}

- (void)persistentStateManager:(id)a3 didMigratedTimeSensitiveForNotificationRequest:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[NCNotificationRootList logDescription](self, "logDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "notificationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "un_logDigest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ received persisted stored migrated time sensitive request %{public}@", (uint8_t *)&v11, 0x16u);

  }
  -[NCNotificationListMigrationScheduler addMigratedTimeSensitiveNotificationRequests:](self->_migrationScheduler, "addMigratedTimeSensitiveNotificationRequests:", v5);

}

- (void)notificationListMigrationSchedulerRequestsMigratingNotificationDigest:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  os_log_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0DC5F90];
  v6 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[NCNotificationRootList logDescription](self, "logDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v8;
    _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ migration scheduler requesting digest migration", (uint8_t *)&v13, 0xCu);

  }
  if (!-[NCNotificationRootList _isCurrentDigestListAboveHistorySectionList](self, "_isCurrentDigestListAboveHistorySectionList"))goto LABEL_9;
  if (!-[NCNotificationRootList deviceAuthenticated](self, "deviceAuthenticated"))
  {
    -[NCNotificationRootList _migrateCurrentDigestSectionListToReadSection](self, "_migrateCurrentDigestSectionListToReadSection");
LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  v9 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    -[NCNotificationRootList logDescription](self, "logDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v11;
    _os_log_impl(&dword_1CFC3D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ deferring digest migration while device is authenticated", (uint8_t *)&v13, 0xCu);

  }
  v12 = 1;
LABEL_10:
  -[NCNotificationRootList setDeferDigestMigration:](self, "setDeferDigestMigration:", v12);
  -[NCNotificationRootList _notificationListDidChangeContent](self, "_notificationListDidChangeContent");

}

- (void)notificationListMigrationScheduler:(id)a3 requestsMigratingNotificationRequests:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  os_log_t v14;
  NSObject *v15;
  void *v16;
  NSMutableArray *notificationRequestsPendingMigration;
  NSMutableArray *v18;
  NSMutableArray *v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x1E0DC5F90];
  v9 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    -[NCNotificationRootList logDescription](self, "logDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "count");
    objc_msgSend(v7, "bs_map:", &__block_literal_global_77);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543874;
    v21 = v11;
    v22 = 2048;
    v23 = v12;
    v24 = 2112;
    v25 = v13;
    _os_log_impl(&dword_1CFC3D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ migration scheduler requesting migration for %lu requests = %@", (uint8_t *)&v20, 0x20u);

  }
  if (-[NCNotificationRootList deviceAuthenticated](self, "deviceAuthenticated"))
  {
    v14 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v16;
      _os_log_impl(&dword_1CFC3D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ deferring migration of requests while device is authenticated", (uint8_t *)&v20, 0xCu);

    }
    notificationRequestsPendingMigration = self->_notificationRequestsPendingMigration;
    if (!notificationRequestsPendingMigration)
    {
      v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v19 = self->_notificationRequestsPendingMigration;
      self->_notificationRequestsPendingMigration = v18;

      notificationRequestsPendingMigration = self->_notificationRequestsPendingMigration;
    }
    -[NSMutableArray addObjectsFromArray:](notificationRequestsPendingMigration, "addObjectsFromArray:", v7);
  }
  else
  {
    -[NCNotificationRootList _migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection:](self, "_migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection:", v7);
    -[NCNotificationRootList _migrateOnScheduleNotificationRequestsFromIncomingSectionToHistorySection:](self, "_migrateOnScheduleNotificationRequestsFromIncomingSectionToHistorySection:", v7);
    if (-[NCNotificationRootList currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting") == 2)
      -[NCNotificationRootList _migrateOnScheduleNotificationRequestsFromProminentIncomingSectionToIncomingSection:](self, "_migrateOnScheduleNotificationRequestsFromProminentIncomingSectionToIncomingSection:", v7);
  }
  -[NCNotificationRootList _notificationListDidChangeContent](self, "_notificationListDidChangeContent");

}

id __99__NCNotificationRootList_notificationListMigrationScheduler_requestsMigratingNotificationRequests___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "notificationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "un_logDigest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_isAdditionalPanGestureActive
{
  return 0;
}

- (unint64_t)_indexForReveal
{
  return 0;
}

- (void)_signpostScrollingBegan:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  uint8_t *v7;
  NSObject *v8;
  os_signpost_type_t v9;
  __int16 v10;
  __int16 v11;

  v3 = a3;
  v4 = *MEMORY[0x1E0DC5F90];
  v5 = os_signpost_enabled((os_log_t)*MEMORY[0x1E0DC5F90]);
  if (v3)
  {
    if (v5)
    {
      v11 = 0;
      v6 = "NC_NOTIFICATION_LIST_SCROLL_BEGIN";
      v7 = (uint8_t *)&v11;
      v8 = v4;
      v9 = OS_SIGNPOST_INTERVAL_BEGIN;
LABEL_6:
      _os_signpost_emit_with_name_impl(&dword_1CFC3D000, v8, v9, 0xEEEEB0B5B2B2EEEELL, v6, " enableTelemetry=YES ", v7, 2u);
    }
  }
  else if (v5)
  {
    v10 = 0;
    v6 = "NC_NOTIFICATION_LIST_SCROLL_END";
    v7 = (uint8_t *)&v10;
    v8 = v4;
    v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_6;
  }
  kdebug_trace();
}

- (void)_setNotificationHistoryWasRevealed:(BOOL)a3
{
  self->_notificationHistoryRevealed = a3;
}

- (void)_cancelTouchesOnLiveActivities:(BOOL)a3
{
  NSMutableArray *supplementaryViewsSections;
  _QWORD v4[4];
  BOOL v5;

  supplementaryViewsSections = self->_supplementaryViewsSections;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__NCNotificationRootList__cancelTouchesOnLiveActivities___block_invoke;
  v4[3] = &__block_descriptor_33_e60_v32__0__NCNotificationListSupplementaryViewsSection_8Q16_B24l;
  v5 = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](supplementaryViewsSections, "enumerateObjectsUsingBlock:", v4);
}

uint64_t __57__NCNotificationRootList__cancelTouchesOnLiveActivities___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancelTouchesOnHostedViews:", *(unsigned __int8 *)(a1 + 32));
}

- (void)_updateDelegateAndSubclassIfNecessaryOfContentChange
{
  -[NCNotificationRootList notificationListComponentChangedContent:](self, "notificationListComponentChangedContent:", self);
}

- (void)_clearAllNotifications:(BOOL)a3 supplementaryViewControllers:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v4 = a4;
  v5 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  if (a3 || a4)
  {
    v7 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v9;
      v15 = 1024;
      v16 = v5;
      v17 = 1024;
      v18 = v4;
      _os_log_impl(&dword_1CFC3D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ clearing all notification requests: %d supplementary view controller:%d", (uint8_t *)&v13, 0x18u);

    }
    +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "notificationCenterClearAll");

    self->_performingClearAll = 1;
    if (v5)
    {
      -[NCNotificationRootList notificationSections](self, "notificationSections");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", &__block_literal_global_80);

    }
    if (v4)
    {
      -[NCNotificationRootList supplementaryViewsSections](self, "supplementaryViewsSections");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", &__block_literal_global_81);

    }
    self->_performingClearAll = 0;
    -[NCNotificationRootList _setForceRevealed:](self, "_setForceRevealed:", 0);
    -[NCNotificationRootList _updateDelegateAndSubclassIfNecessaryOfContentChange](self, "_updateDelegateAndSubclassIfNecessaryOfContentChange");
    -[NCNotificationRootList _notificationListDidChangeContent](self, "_notificationListDidChangeContent");
  }
}

uint64_t __78__NCNotificationRootList__clearAllNotifications_supplementaryViewControllers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clearAll");
}

uint64_t __78__NCNotificationRootList__clearAllNotifications_supplementaryViewControllers___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clearAll");
}

- (id)_notificationListSections
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NCNotificationRootList supplementaryViewsSections](self, "supplementaryViewsSections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  -[NCNotificationRootList notificationSections](self, "notificationSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  return v3;
}

- (void)setScheduledDeliveryEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  NCDigestScheduleManager *v10;
  NCDigestScheduleManager *digestScheduleManager;
  NCDigestScheduleManager *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_scheduledDeliveryEnabled != a3)
  {
    v3 = a3;
    v5 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      v9 = CFSTR("disabled");
      if (v3)
        v9 = CFSTR("enabled");
      v13 = 138543618;
      v14 = v7;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ setting scheduled delivery %@", (uint8_t *)&v13, 0x16u);

    }
    self->_scheduledDeliveryEnabled = v3;
    if (v3)
    {
      v10 = objc_alloc_init(NCDigestScheduleManager);
      digestScheduleManager = self->_digestScheduleManager;
      self->_digestScheduleManager = v10;

      -[NCDigestScheduleManager addObserver:](self->_digestScheduleManager, "addObserver:", self);
    }
    else
    {
      -[NCNotificationRootList _dissolveCurrentDigestSectionListToHistorySection](self, "_dissolveCurrentDigestSectionListToHistorySection");
      -[NCNotificationRootList _dissolveUpcomingDigestSectionListToHistorySection](self, "_dissolveUpcomingDigestSectionListToHistorySection");
      -[NCDigestScheduleManager invalidateScheduledTimer](self->_digestScheduleManager, "invalidateScheduledTimer");
      v12 = self->_digestScheduleManager;
      self->_digestScheduleManager = 0;

    }
  }
}

- (void)_updateVisibleRectForContentOffset:(CGPoint)a3 size:(CGSize)a4
{
  double width;
  double x;
  double v6;
  CGFloat v7;
  CGFloat v8;
  id v9;

  width = a4.width;
  x = a3.x;
  v6 = fmin(a3.y, 0.0);
  v7 = a3.y - v6;
  v8 = a4.height + v6;
  -[NCNotificationRootList rootListView](self, "rootListView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVisibleRect:", x, v7, width, v8);

}

- (void)_configureNotificationSectionList:(id)a3 notificationCache:(id)a4 notificationListViewRevealed:(BOOL)a5 logDescription:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v12, "setDelegate:", self);
  objc_msgSend(v12, "setDeviceAuthenticated:", -[NCNotificationRootList deviceAuthenticated](self, "deviceAuthenticated"));
  objc_msgSend(v12, "setNotificationListCache:", v11);

  objc_msgSend(v12, "setNotificationListViewRevealed:", v6);
  objc_msgSend(v12, "setLogDescription:", v10);

}

- (CGRect)aggregatedVisibleContentExtent
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_aggregatedVisibleContentExtent.origin.x;
  y = self->_aggregatedVisibleContentExtent.origin.y;
  width = self->_aggregatedVisibleContentExtent.size.width;
  height = self->_aggregatedVisibleContentExtent.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setHighlightsFeatureEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  if (a3)
  {
    -[NCNotificationRootList _generateHighlightsSectionListIfNeeded](self, "_generateHighlightsSectionListIfNeeded");
  }
  else
  {
    -[NCNotificationRootList highlightedSectionList](self, "highlightedSectionList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE2(v7) = 0;
    LOWORD(v7) = 256;
    -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v5, v6, 0, 0, 0, 0, v7);

  }
  -[NCNotificationStructuredSectionList setNotificationListViewRevealed:](self->_highlightedSectionList, "setNotificationListViewRevealed:", v3);
  -[NCNotificationRootList _notificationListDidChangeContent](self, "_notificationListDidChangeContent");
}

- (void)_generateHighlightsSectionListIfNeeded
{
  void *v3;
  NCNotificationListHighlights *v4;
  void *v5;
  void *v6;
  void *v7;
  NCNotificationStructuredSectionList *highlightedSectionList;
  id v9;

  if (_NCIsNotificationHighlightsAllowed()
    && +[NCPlatformEligibility areGenerativeModelsAvailable](NCPlatformEligibility, "areGenerativeModelsAvailable")&& -[NCNotificationRootList _areHighlightsEnabled](self, "_areHighlightsEnabled")&& !self->_highlightedSectionList)
  {
    NCUserNotificationsUIKitFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_HEADER_IMPORTANT_HIGHLIGHTS"), &stru_1E8D21F60, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v4 = -[NCNotificationListHighlights initWithTitle:sectionType:]([NCNotificationListHighlights alloc], "initWithTitle:sectionType:", v9, 10);
    -[NCNotificationRootList notificationListCache](self, "notificationListCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationRootList _configureNotificationSectionList:notificationCache:notificationListViewRevealed:logDescription:](self, "_configureNotificationSectionList:notificationCache:notificationListViewRevealed:logDescription:", v4, v5, 1, CFSTR("Important Section"));

    -[NCNotificationStructuredSectionList listView](v4, "listView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGrouped:", 0);

    -[NCNotificationRootList _setRevealed:forSection:](self, "_setRevealed:forSection:", 1, v4);
    -[NCNotificationStructuredSectionList setSectionListDestination:](v4, "setSectionListDestination:", CFSTR("BulletinDestinationLockScreen"));
    -[NCNotificationRootList notificationSections](self, "notificationSections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertObject:atIndex:", v4, 0);

    highlightedSectionList = self->_highlightedSectionList;
    self->_highlightedSectionList = &v4->super;

  }
}

- (BOOL)_areHighlightsEnabled
{
  NCNotificationRootList *v2;
  void *v3;

  v2 = self;
  -[NCNotificationRootList delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "notificationRootListAreHighlightsEnabled:", v2);

  return (char)v2;
}

- (void)_setupNotificationSectionLists
{
  NCNotificationStructuredSectionList *v3;
  void *v4;
  void *v5;
  NCNotificationStructuredSectionList *prominentIncomingSectionList;
  NCNotificationStructuredSectionList *v7;
  NCNotificationStructuredSectionList *v8;
  void *v9;
  void *v10;
  NCNotificationStructuredSectionList *incomingSectionList;
  NCNotificationStructuredSectionList *v12;
  void *v13;
  NCNotificationCombinedSectionList *v14;
  void *v15;
  void *v16;
  NCNotificationCombinedSectionList *historySectionList;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;

  -[NCNotificationRootList _generateHighlightsSectionListIfNeeded](self, "_generateHighlightsSectionListIfNeeded");
  v3 = -[NCNotificationStructuredSectionList initWithTitle:sectionType:]([NCNotificationStructuredSectionList alloc], "initWithTitle:sectionType:", 0, 1);
  -[NCNotificationRootList notificationListCache](self, "notificationListCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRootList _configureNotificationSectionList:notificationCache:notificationListViewRevealed:logDescription:](self, "_configureNotificationSectionList:notificationCache:notificationListViewRevealed:logDescription:", v3, v4, 1, CFSTR("Prominent Incoming Section"));

  -[NCNotificationStructuredSectionList setSupportsDynamicGrouping:](v3, "setSupportsDynamicGrouping:", 0);
  -[NCNotificationStructuredSectionList setSectionListDestination:](v3, "setSectionListDestination:", CFSTR("BulletinDestinationLockScreen"));
  -[NCNotificationRootList notificationSections](self, "notificationSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v3);

  prominentIncomingSectionList = self->_prominentIncomingSectionList;
  self->_prominentIncomingSectionList = v3;
  v7 = v3;

  v8 = -[NCNotificationStructuredSectionList initWithTitle:sectionType:]([NCNotificationStructuredSectionList alloc], "initWithTitle:sectionType:", 0, 2);
  -[NCNotificationRootList notificationListCache](self, "notificationListCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRootList _configureNotificationSectionList:notificationCache:notificationListViewRevealed:logDescription:](self, "_configureNotificationSectionList:notificationCache:notificationListViewRevealed:logDescription:", v8, v9, 1, CFSTR("Incoming Section"));

  -[NCNotificationStructuredSectionList setSupportsDynamicGrouping:](v8, "setSupportsDynamicGrouping:", 1);
  -[NCNotificationStructuredSectionList setSectionListDestination:](v8, "setSectionListDestination:", CFSTR("BulletinDestinationLockScreen"));
  -[NCNotificationRootList notificationSections](self, "notificationSections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v8);

  incomingSectionList = self->_incomingSectionList;
  self->_incomingSectionList = v8;
  v12 = v8;

  NCUserNotificationsUIKitFrameworkBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_HEADER_NOTIFICATION_CENTER"), &stru_1E8D21F60, 0);
  v22 = objc_claimAutoreleasedReturnValue();

  v14 = -[NCNotificationCombinedSectionList initWithTitle:sectionType:]([NCNotificationCombinedSectionList alloc], "initWithTitle:sectionType:", v22, 0);
  -[NCNotificationRootList notificationListCache](self, "notificationListCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRootList _configureNotificationSectionList:notificationCache:notificationListViewRevealed:logDescription:](self, "_configureNotificationSectionList:notificationCache:notificationListViewRevealed:logDescription:", v14, v15, 0, CFSTR("History Section"));

  -[NCNotificationStructuredSectionList setHistorySection:](v14, "setHistorySection:", 1);
  -[NCNotificationStructuredSectionList setPreloadsNotificationRequests:](v14, "setPreloadsNotificationRequests:", 1);
  -[NCNotificationStructuredSectionList setSectionListDestination:](v14, "setSectionListDestination:", CFSTR("BulletinDestinationNotificationCenter"));
  -[NCNotificationRootList notificationSections](self, "notificationSections");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v14);

  historySectionList = self->_historySectionList;
  self->_historySectionList = v14;

  v18 = -[NCNotificationRootList isScheduledDeliveryEnabled](self, "isScheduledDeliveryEnabled");
  v19 = (void *)v22;
  if (v18)
  {
    -[NCNotificationRootList digestScheduleManager](self, "digestScheduleManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "upcomingScheduledDigestInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      -[NCNotificationRootList _configureUpcomingDigestSectionListWithDigestInfo:](self, "_configureUpcomingDigestSectionListWithDigestInfo:", v21);

    v19 = (void *)v22;
  }

}

- (BOOL)_shouldInsertNotificationRequestToProminentIncomingSectionList:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[NCNotificationRootList _isProminentNotificationRequest:](self, "_isProminentNotificationRequest:", v4))
    v5 = 1;
  else
    v5 = -[NCNotificationRootList currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting") == 2
      && -[NCNotificationRootList _isAlertingNotificationRequest:](self, "_isAlertingNotificationRequest:", v4);

  return v5;
}

- (BOOL)_isProminentNotificationRequest:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "lockScreenPersistence") == 2 || (unint64_t)objc_msgSend(v3, "interruptionLevel") > 2;

  return v5;
}

- (BOOL)_isAlertingNotificationRequest:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "canTurnOnDisplay"))
    v5 = objc_msgSend(v3, "interruptionLevel") != 0;
  else
    v5 = 0;

  return v5;
}

- (BOOL)_isNotificationRequest:(id)a3 forSectionList:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(a3, "requestDestinations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionListDestination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "containsObject:", v7);
  return (char)v5;
}

- (BOOL)shouldDelayDeliveryOfNotificationRequest:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "alertOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "suppression") == 2;

  return v4;
}

- (id)_sectionForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  os_log_t *v8;
  NCNotificationCombinedSectionList *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  int v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  _BOOL4 v31;
  id *p_incomingSectionList;
  NCNotificationCombinedSectionList *v33;
  void *v34;
  void *v35;
  NCNotificationCombinedSectionList *v36;
  os_log_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  int v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NCNotificationRootList persistentStateManager](self, "persistentStateManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sectionForStoredNotificationRequest:", v4);

  -[NCNotificationRootList _sectionForStoredNotificationRequestOfSectionType:](self, "_sectionForStoredNotificationRequestOfSectionType:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (os_log_t *)MEMORY[0x1E0DC5F90];
  if (!v7)
  {
    if (-[NCNotificationRootList isScheduledDeliveryEnabled](self, "isScheduledDeliveryEnabled"))
    {
      -[NCNotificationRootList currentDigestSectionList](self, "currentDigestSectionList");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NCNotificationRootList _isNotificationRequest:forSectionList:](self, "_isNotificationRequest:forSectionList:", v4, v16))
      {
        -[NCNotificationRootList currentDigestSectionList](self, "currentDigestSectionList");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "containsNotificationRequest:", v4);

        if (v18)
        {
          -[NCNotificationRootList currentDigestSectionList](self, "currentDigestSectionList");
          v19 = objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        }
      }
      else
      {

      }
    }
    if (-[NCNotificationRootList isScheduledDeliveryEnabled](self, "isScheduledDeliveryEnabled")
      && (-[NCNotificationRootList upcomingDigestSectionList](self, "upcomingDigestSectionList"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = -[NCNotificationRootList _isNotificationRequest:forSectionList:](self, "_isNotificationRequest:forSectionList:", v4, v20), v20, v21))
    {
      -[NCNotificationRootList upcomingDigestSectionList](self, "upcomingDigestSectionList");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!-[NCNotificationRootList isMissedSectionActive](self, "isMissedSectionActive")
        || !-[NCNotificationRootList shouldDelayDeliveryOfNotificationRequest:](self, "shouldDelayDeliveryOfNotificationRequest:", v4)|| (-[NCNotificationRootList upcomingMissedSectionList](self, "upcomingMissedSectionList"), v22 = (void *)objc_claimAutoreleasedReturnValue(), v23 = -[NCNotificationRootList _isNotificationRequest:forSectionList:](self, "_isNotificationRequest:forSectionList:", v4, v22), v22, !v23))
      {
        if (-[NCNotificationRootList _areHighlightsEnabled](self, "_areHighlightsEnabled"))
        {
          -[NCNotificationRootList highlightedSectionList](self, "highlightedSectionList");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NCNotificationRootList _isNotificationRequest:forSectionList:](self, "_isNotificationRequest:forSectionList:", v4, v24))
          {
            v25 = objc_msgSend(v4, "isHighlight");

            if (v25)
            {
              -[NCNotificationRootList highlightedSectionList](self, "highlightedSectionList");
              v19 = objc_claimAutoreleasedReturnValue();
              goto LABEL_29;
            }
          }
          else
          {

          }
        }
        -[NCNotificationRootList prominentIncomingSectionList](self, "prominentIncomingSectionList");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NCNotificationRootList _isNotificationRequest:forSectionList:](self, "_isNotificationRequest:forSectionList:", v4, v26))
        {
          v27 = -[NCNotificationRootList _shouldInsertNotificationRequestToProminentIncomingSectionList:](self, "_shouldInsertNotificationRequestToProminentIncomingSectionList:", v4);

          if (v27)
          {
            -[NCNotificationRootList prominentIncomingSectionList](self, "prominentIncomingSectionList");
            v19 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          }
        }
        else
        {

        }
        -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[NCNotificationRootList _isNotificationRequest:forSectionList:](self, "_isNotificationRequest:forSectionList:", v4, v28);

        if (v29)
        {
          -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
          v19 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[NCNotificationRootList historySectionList](self, "historySectionList");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = -[NCNotificationRootList _isNotificationRequest:forSectionList:](self, "_isNotificationRequest:forSectionList:", v4, v30);

          if (!v31)
          {
            v9 = 0;
            goto LABEL_30;
          }
          -[NCNotificationRootList historySectionList](self, "historySectionList");
          v19 = objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_29;
      }
      -[NCNotificationRootList upcomingMissedSectionList](self, "upcomingMissedSectionList");
      v19 = objc_claimAutoreleasedReturnValue();
    }
LABEL_29:
    v9 = (NCNotificationCombinedSectionList *)v19;
    goto LABEL_30;
  }
  v9 = (NCNotificationCombinedSectionList *)v7;
  v10 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    -[NCNotificationRootList logDescription](self, "logDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NCNotificationListSectionTypeString(v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "un_logDigest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 138543874;
    v43 = v12;
    v44 = 2112;
    v45 = v13;
    v46 = 2112;
    v47 = v15;
    _os_log_impl(&dword_1CFC3D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ found existing section %@ for request %@ from notification list persistent state", (uint8_t *)&v42, 0x20u);

  }
LABEL_30:
  if (v9 == self->_historySectionList)
  {
    p_incomingSectionList = (id *)&self->_incomingSectionList;
    if (-[NCNotificationStructuredSectionList containsNotificationRequest:](self->_incomingSectionList, "containsNotificationRequest:", v4)|| (p_incomingSectionList = (id *)&self->_prominentIncomingSectionList, -[NCNotificationStructuredSectionList containsNotificationRequest:](self->_prominentIncomingSectionList, "containsNotificationRequest:", v4))|| (p_incomingSectionList = (id *)&self->_highlightedSectionList, -[NCNotificationStructuredSectionList containsNotificationRequest:](self->_highlightedSectionList, "containsNotificationRequest:", v4))|| (p_incomingSectionList = (id *)&self->_upcomingMissedSectionList, -[NCNotificationCombinedSectionList containsNotificationRequest:](self->_upcomingMissedSectionList, "containsNotificationRequest:", v4))|| (p_incomingSectionList = (id *)&self->_upcomingDigestSectionList,
          -[NCNotificationCombinedSectionList containsNotificationRequest:](self->_upcomingDigestSectionList, "containsNotificationRequest:", v4))|| (p_incomingSectionList = (id *)&self->_currentDigestSectionList, -[NCNotificationCombinedSectionList containsNotificationRequest:](self->_currentDigestSectionList, "containsNotificationRequest:", v4)))
    {
      v33 = (NCNotificationCombinedSectionList *)*p_incomingSectionList;

      v9 = v33;
    }
  }
  -[NCNotificationRootList _higherSectionToElevateForNotificationRequest:currentSectionType:](self, "_higherSectionToElevateForNotificationRequest:currentSectionType:", v4, -[NCNotificationStructuredSectionList sectionType](v9, "sectionType"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v34)
  {
    v36 = v34;

    v9 = v36;
  }
  v37 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v38 = v37;
    -[NCNotificationRootList logDescription](self, "logDescription");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    NCNotificationListSectionTypeString(-[NCNotificationStructuredSectionList sectionType](v9, "sectionType"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 138543618;
    v43 = v39;
    v44 = 2114;
    v45 = v40;
    _os_log_impl(&dword_1CFC3D000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@ Section for new request is %{public}@", (uint8_t *)&v42, 0x16u);

  }
  return v9;
}

- (id)_higherSectionToElevateForNotificationRequest:(id)a3 currentSectionType:(unint64_t)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void *v29;
  _QWORD v30[5];
  id v31;
  _BYTE *v32;
  uint64_t v33;
  unint64_t v34;
  _BYTE buf[24];
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (_NCStackElevation()
    && +[NCPlatformEligibility areGenerativeModelsAvailable](NCPlatformEligibility, "areGenerativeModelsAvailable")&& -[NCNotificationRootList isGlobalIntelligentSummarizationEnabled](self, "isGlobalIntelligentSummarizationEnabled"))
  {
    objc_msgSend(v6, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isCommunicationType");

    if ((v8 & 1) != 0)
    {
      NCStackElevationPriorityForSectionTypeString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NCNotificationListSectionTypeString(a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "indexOfObject:", v10);

      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v36 = __Block_byref_object_copy__0;
        v37 = __Block_byref_object_dispose__0;
        v38 = 0;
        NCStackElevationPriorityForSectionTypeString();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __91__NCNotificationRootList__higherSectionToElevateForNotificationRequest_currentSectionType___block_invoke;
        v30[3] = &unk_1E8D1C330;
        v33 = v11;
        v34 = a4;
        v30[4] = self;
        v31 = v6;
        v32 = buf;
        objc_msgSend(v29, "enumerateObjectsUsingBlock:", v30);

        v21 = *(id *)(*(_QWORD *)&buf[8] + 40);
        _Block_object_dispose(buf, 8);

        goto LABEL_11;
      }
      v12 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        -[NCNotificationRootList logDescription](self, "logDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "notificationIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "un_logDigest");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        NCNotificationListSectionTypeString(a4);
        v17 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v16;
        *(_WORD *)&buf[22] = 2114;
        v36 = v17;
        _os_log_impl(&dword_1CFC3D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Skip finding higher section with request %{public}@ in current section %{public}@; it's not in allow list",
          buf,
          0x20u);

      }
    }
    else
    {
      v23 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v24 = v23;
        -[NCNotificationRootList logDescription](self, "logDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "notificationIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "un_logDigest");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        NCNotificationListSectionTypeString(a4);
        v28 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v27;
        *(_WORD *)&buf[22] = 2114;
        v36 = v28;
        _os_log_impl(&dword_1CFC3D000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ Skip finding hider section with request %{public}@ in current section %{public}@; it's not communication request",
          buf,
          0x20u);

      }
    }
  }
  else
  {
    v18 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = _NCStackElevation();
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = +[NCPlatformEligibility areGenerativeModelsAvailable](NCPlatformEligibility, "areGenerativeModelsAvailable");
      LOWORD(v36) = 1024;
      *(_DWORD *)((char *)&v36 + 2) = -[NCNotificationRootList isGlobalIntelligentSummarizationEnabled](self, "isGlobalIntelligentSummarizationEnabled");
      _os_log_impl(&dword_1CFC3D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Skip finding hider section; stack elevation not eligible; stackElevationFlagEnabled: %d; areGenerativ"
        "eModelsAvailable: %d; isGlobalIntelligentSummarizationEnabled: %d",
        buf,
        0x1Eu);

    }
  }
  v21 = 0;
LABEL_11:

  return v21;
}

void __91__NCNotificationRootList__higherSectionToElevateForNotificationRequest_currentSectionType___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = v7;
  if (*(_QWORD *)(a1 + 56) <= a3)
  {
    v11 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(void **)(a1 + 32);
      v13 = v11;
      objc_msgSend(v12, "logDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NCNotificationListSectionTypeString(*(_QWORD *)(a1 + 64));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543874;
      v30 = v14;
      v31 = 2114;
      v32 = v15;
      v33 = 2114;
      v34 = v8;
      _os_log_impl(&dword_1CFC3D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Current section %{public}@ has higher or same priority than section %{public}@; Stop finding.",
        (uint8_t *)&v29,
        0x20u);

    }
    *a4 = 1;
  }
  else
  {
    v9 = NCNotificationListSectionTypeFromString(v7);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_FAULT))
        __91__NCNotificationRootList__higherSectionToElevateForNotificationRequest_currentSectionType___block_invoke_cold_1(a1, v10);
    }
    else
    {
      v16 = v9;
      objc_msgSend(*(id *)(a1 + 32), "_sectionOfSectionType:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        if (objc_msgSend(v17, "existingIndexOfGroupForNotificationRequestForInsertion:", *(_QWORD *)(a1 + 40)) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v19 = (void *)*MEMORY[0x1E0DC5F90];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
          {
            v20 = *(void **)(a1 + 32);
            v21 = v19;
            objc_msgSend(v20, "logDescription");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            NCNotificationListSectionTypeString(*(_QWORD *)(a1 + 64));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            NCNotificationListSectionTypeString(v16);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 138543874;
            v30 = v22;
            v31 = 2114;
            v32 = v23;
            v33 = 2114;
            v34 = v24;
            _os_log_impl(&dword_1CFC3D000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Elevate new request to higher section %{public}@; original section %{public}@",
              (uint8_t *)&v29,
              0x20u);

          }
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v18);
          *a4 = 1;
        }
      }
      else
      {
        v25 = (void *)*MEMORY[0x1E0DC5F90];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
        {
          v26 = *(void **)(a1 + 32);
          v27 = v25;
          objc_msgSend(v26, "logDescription");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138543618;
          v30 = v28;
          v31 = 2114;
          v32 = v8;
          _os_log_impl(&dword_1CFC3D000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ Higher section %{public}@ not exist; Skip checking.",
            (uint8_t *)&v29,
            0x16u);

        }
      }

    }
  }

}

- (void)_regroupAllNotificationGroups
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[NCNotificationRootList logDescription](self, "logDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CFC3D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ regrouping all expanded notification groups", (uint8_t *)&v7, 0xCu);

  }
  -[NCNotificationRootList notificationSections](self, "notificationSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &__block_literal_global_102);

}

uint64_t __55__NCNotificationRootList__regroupAllNotificationGroups__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "regroupNotificationGroups");
}

- (void)_sortNotificationGroupsIfNecessary
{
  void *v2;
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
  -[NCNotificationRootList _notificationSectionListsForEnumeration](self, "_notificationSectionListsForEnumeration", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "sortNotificationGroupListsIfNecessary");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)_notificationSectionListsForEnumeration
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[NCNotificationRootList notificationSections](self, "notificationSections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  if (self->_currentDigestSectionList
    && !-[NCNotificationCombinedSectionList containsSectionList:](self->_historySectionList, "containsSectionList:")
    && (objc_msgSend(v5, "containsObject:", self->_currentDigestSectionList) & 1) == 0)
  {
    objc_msgSend(v5, "addObject:", self->_currentDigestSectionList);
  }
  if (self->_upcomingDigestSectionList
    && !-[NCNotificationCombinedSectionList containsSectionList:](self->_historySectionList, "containsSectionList:"))
  {
    objc_msgSend(v5, "addObject:", self->_upcomingDigestSectionList);
  }
  if (self->_upcomingMissedSectionList
    && !-[NCNotificationCombinedSectionList containsSectionList:](self->_historySectionList, "containsSectionList:"))
  {
    objc_msgSend(v5, "addObject:", self->_upcomingMissedSectionList);
  }
  return v5;
}

- (id)_visibleNotificationRequests
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NCNotificationRootList notificationSections](self, "notificationSections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__NCNotificationRootList__visibleNotificationRequests__block_invoke;
  v9[3] = &unk_1E8D1C0D0;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v6 = v10;
  v7 = v5;

  return v7;
}

void __54__NCNotificationRootList__visibleNotificationRequests__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = objc_msgSend(*(id *)(a1 + 32), "_indexForReveal");
  if (v5 - objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "count") > a3
    || objc_msgSend(*(id *)(a1 + 32), "isNotificationHistoryRevealed"))
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v8, "allNotificationRequests");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v7);

  }
}

- (void)_notificationListDidChangeContent
{
  -[NCNotificationRootList _updateVisibilityForSectionLists](self, "_updateVisibilityForSectionLists");
  -[NCNotificationRootList _updateNotificationListPersistentState](self, "_updateNotificationListPersistentState");
  -[NCNotificationRootList _updateVisibilityOfHistorySection](self, "_updateVisibilityOfHistorySection");
  -[NCNotificationRootList _updateDelegateAndSubclassIfNecessaryOfContentChange](self, "_updateDelegateAndSubclassIfNecessaryOfContentChange");
}

- (unint64_t)incomingCount
{
  void *v2;
  unint64_t v3;

  -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "notificationCount");

  return v3;
}

- (unint64_t)historyCount
{
  void *v2;
  unint64_t v3;

  -[NCNotificationRootList historySectionList](self, "historySectionList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "notificationCount");

  return v3;
}

- (NSString)incomingTitle
{
  return -[NCNotificationStructuredSectionList title](self->_currentDigestSectionList, "title");
}

- (void)_updateVisibilityOfHistorySection
{
  void *v3;
  uint64_t v4;

  if (-[NCNotificationRootList isNotificationHistoryRevealed](self, "isNotificationHistoryRevealed"))
  {
    -[NCNotificationRootList historySectionList](self, "historySectionList");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "notificationCount");

    if (!v4)
    {
      self->_notificationHistoryRevealed = 0;
      -[NCNotificationRootList _setForceRevealed:](self, "_setForceRevealed:", 0);
    }
  }
}

- (void)setOverrideMigrationToHistory:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_overrideMigrationToHistory != a3)
  {
    v3 = a3;
    self->_overrideMigrationToHistory = a3;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("NCOverrideNotificationMigrationToHistory"));

  }
}

- (void)setCurrentListDisplayStyleSetting:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSNumber *currentListDisplayStyleSetting;
  void *v10;
  _BOOL4 v11;
  NSNumber *v12;
  NSNumber *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  void *v27;
  _BOOL8 v28;
  void *v29;
  NCNotificationRootList *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!-[NCNotificationRootList _isCurrentListDisplayStyleSettingEqualTo:](self, "_isCurrentListDisplayStyleSettingEqualTo:"))
  {
    -[NCNotificationRootList delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[NCNotificationRootList logDescription](self, "logDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC6020], "stringForNotificationListDisplayStyleSetting:", a3);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      currentListDisplayStyleSetting = self->_currentListDisplayStyleSetting;
      if (currentListDisplayStyleSetting)
      {
        objc_msgSend(MEMORY[0x1E0DC6020], "stringForNotificationListDisplayStyleSetting:", -[NSNumber integerValue](self->_currentListDisplayStyleSetting, "integerValue"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      v34 = 138543874;
      v35 = v7;
      v36 = 2114;
      v37 = v8;
      v38 = 2114;
      v39 = v10;
      _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ changing list display visual style to %{public}@ from %{public}@", (uint8_t *)&v34, 0x20u);
      if (currentListDisplayStyleSetting)

    }
    v11 = -[NCNotificationRootList _isCurrentListDisplayStyleSettingEqualTo:](self, "_isCurrentListDisplayStyleSettingEqualTo:", 2);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v13 = self->_currentListDisplayStyleSetting;
    self->_currentListDisplayStyleSetting = v12;

    -[NCNotificationRootList _currentDisplayListStyleSettingsChanged:](self, "_currentDisplayListStyleSettingsChanged:", a3);
    if (!v11)
    {
LABEL_17:
      switch(a3)
      {
        case 2:
          -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setSectionListViewGroupedWithContentShown:", 1);

          -[NCNotificationRootList highlightedSectionList](self, "highlightedSectionList");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NCNotificationRootList _setRevealed:forSection:](self, "_setRevealed:forSection:", 0, v24);

          v25 = -[NCNotificationRootList isNotificationHistoryRevealed](self, "isNotificationHistoryRevealed");
          -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NCNotificationRootList _setRevealed:forSection:](self, "_setRevealed:forSection:", v25, v26);

          if (-[NCNotificationRootList _isCurrentDigestListAboveHistorySectionList](self, "_isCurrentDigestListAboveHistorySectionList"))
          {
            -[NCNotificationRootList currentDigestSectionList](self, "currentDigestSectionList");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "collapseSummarizedSectionList");

            v28 = -[NCNotificationRootList isNotificationHistoryRevealed](self, "isNotificationHistoryRevealed");
            -[NCNotificationRootList currentDigestSectionList](self, "currentDigestSectionList");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = self;
            v31 = v28;
LABEL_25:
            -[NCNotificationRootList _setRevealed:forSection:](v30, "_setRevealed:forSection:", v31, v29);

          }
          break;
        case 1:
          -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setSectionListViewGroupedWithContentShown:", 1);
          goto LABEL_24;
        case 0:
          -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setSectionListViewGroupedWithContentShown:", 0);

          -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setSupportsDynamicGrouping:", 1);
LABEL_24:

          -[NCNotificationRootList highlightedSectionList](self, "highlightedSectionList");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[NCNotificationRootList _setRevealed:forSection:](self, "_setRevealed:forSection:", 1, v32);

          -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = self;
          v31 = 1;
          goto LABEL_25;
      }
      -[NCNotificationRootList prominentIncomingSectionList](self, "prominentIncomingSectionList");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationRootList _setRevealed:forSection:](self, "_setRevealed:forSection:", 1, v33);

      -[NCNotificationRootList _updateIndexForReveal](self, "_updateIndexForReveal");
      objc_msgSend(v5, "notificationRootList:displayStyleSettingChanged:", self, a3);

      return;
    }
    -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "notificationCount"))
    {

    }
    else
    {
      v15 = -[NCNotificationRootList _isCurrentDigestListAboveHistorySectionList](self, "_isCurrentDigestListAboveHistorySectionList");

      if (!v15)
      {
LABEL_14:
        -[NCNotificationRootList highlightedSectionList](self, "highlightedSectionList");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationRootList _setRevealed:forSection:](self, "_setRevealed:forSection:", 1, v16);

        -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationRootList _setRevealed:forSection:](self, "_setRevealed:forSection:", 1, v17);

        if (-[NCNotificationRootList _isCurrentDigestListAboveHistorySectionList](self, "_isCurrentDigestListAboveHistorySectionList"))
        {
          -[NCNotificationRootList currentDigestSectionList](self, "currentDigestSectionList");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "listView");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setRevealed:", 1);

          -[NCNotificationRootList currentDigestSectionList](self, "currentDigestSectionList");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NCNotificationRootList _setRevealed:forSection:](self, "_setRevealed:forSection:", 1, v20);

        }
        -[NCNotificationRootList _migrateNotificationsFromProminentIncomingSectionToIncomingSection](self, "_migrateNotificationsFromProminentIncomingSectionToIncomingSection");
        goto LABEL_17;
      }
    }
    objc_msgSend(v5, "notificationRootListWillExpandNotificationListCount:", self);
    goto LABEL_14;
  }
}

- (int64_t)currentListDisplayStyleSetting
{
  int64_t result;

  result = (int64_t)self->_currentListDisplayStyleSetting;
  if (result)
    return objc_msgSend((id)result, "integerValue");
  return result;
}

- (BOOL)_isCurrentListDisplayStyleSettingEqualTo:(int64_t)a3
{
  NSNumber *currentListDisplayStyleSetting;

  currentListDisplayStyleSetting = self->_currentListDisplayStyleSetting;
  if (currentListDisplayStyleSetting)
    LOBYTE(currentListDisplayStyleSetting) = -[NSNumber integerValue](currentListDisplayStyleSetting, "integerValue") == a3;
  return (char)currentListDisplayStyleSetting;
}

- (void)_migrateNotificationsFromProminentIncomingSectionToIncomingSection
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  _QWORD v10[5];

  -[NCNotificationRootList prominentIncomingSectionList](self, "prominentIncomingSectionList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allNotificationRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__NCNotificationRootList__migrateNotificationsFromProminentIncomingSectionToIncomingSection__block_invoke;
  v10[3] = &unk_1E8D1B4B0;
  v10[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v10);

  -[NCNotificationRootList prominentIncomingSectionList](self, "prominentIncomingSectionList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __92__NCNotificationRootList__migrateNotificationsFromProminentIncomingSectionToIncomingSection__block_invoke_2;
  v9[3] = &unk_1E8D1BF28;
  v9[4] = self;
  BYTE2(v8) = 0;
  LOWORD(v8) = 0;
  -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v6, v7, 0, v9, 0, 0, v8);

  -[NCNotificationRootList _updateDelegateAndSubclassIfNecessaryOfContentChange](self, "_updateDelegateAndSubclassIfNecessaryOfContentChange");
}

void __92__NCNotificationRootList__migrateNotificationsFromProminentIncomingSectionToIncomingSection__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "migrationScheduler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeMigrationForNotificationRequest:", v3);

}

uint64_t __92__NCNotificationRootList__migrateNotificationsFromProminentIncomingSectionToIncomingSection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_isProminentNotificationRequest:", v3);
  if ((_DWORD)v4)
  {
    v5 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(a1 + 32);
      v7 = v5;
      objc_msgSend(v6, "logDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "notificationIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "un_logDigest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "options");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138544130;
      v14 = v8;
      v15 = 2114;
      v16 = v10;
      v17 = 2048;
      v18 = objc_msgSend(v11, "lockScreenPersistence");
      v19 = 2048;
      v20 = objc_msgSend(v3, "interruptionLevel");
      _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ notification %{public}@ is persistent notification; lockScreenPersistence: %lu; interruptionLevel: %l"
        "u; skip migration from prominent incoming to incoming.",
        (uint8_t *)&v13,
        0x2Au);

    }
  }

  return v4;
}

- (void)_updateSystemSettingsForUpdatedNotificationListDisplayStyleSetting:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[NCNotificationRootList delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "notificationSystemSettingsForNotificationListComponent:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "listDisplayStyleSetting") != a3)
    {
      v7 = (void *)objc_msgSend(v6, "mutableCopy");
      objc_msgSend(v7, "setListDisplayStyleSetting:", a3);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v8, "notificationListComponent:setNotificationSystemSettings:", self, v7);

    }
  }
  else
  {
    v6 = 0;
  }

}

- (void)_updateNotificationListDisplayStyleSetting
{
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int64_t v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  _QWORD v28[7];

  v28[6] = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v19 = -[NCNotificationRootList currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting");
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  v28[0] = CFSTR("NCNotificationListDisplayStyleReasonOverrideLandscapeOrientation");
  v28[1] = CFSTR("NCNotificationListDisplayStyleReasonInteractiveTransition");
  v28[2] = CFSTR("NCNotificationListDisplayStyleSettingOverrideReasonSleep");
  v28[3] = CFSTR("NCNotificationListDisplayStyleReasonOverridePersistHidden");
  v28[4] = CFSTR("NCNotificationListDisplayStyleReasonOverrideDeviceLocked");
  v28[5] = CFSTR("NCNotificationListDisplayStyleReasonSystemSetting");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__NCNotificationRootList__updateNotificationListDisplayStyleSetting__block_invoke;
  v9[3] = &unk_1E8D1C378;
  v9[4] = self;
  v9[5] = &v16;
  v9[6] = &v10;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);
  if (!-[NCNotificationRootList _isCurrentListDisplayStyleSettingEqualTo:](self, "_isCurrentListDisplayStyleSettingEqualTo:", v17[3]))
  {
    v4 = (id)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[NCNotificationRootList logDescription](self, "logDescription");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC6020], "stringForNotificationListDisplayStyleSetting:", v17[3]);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC6020], "stringForNotificationListDisplayStyleSetting:", -[NCNotificationRootList currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v11[5];
      *(_DWORD *)buf = 138544130;
      v21 = v5;
      v22 = 2114;
      v23 = v6;
      v24 = 2114;
      v25 = v7;
      v26 = 2114;
      v27 = v8;
      _os_log_impl(&dword_1CFC3D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ setting current list display setting to %{public}@ from %{public}@ for reason %{public}@", buf, 0x2Au);

    }
    -[NCNotificationRootList setCurrentListDisplayStyleSetting:](self, "setCurrentListDisplayStyleSetting:", v17[3]);
  }

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
}

void __68__NCNotificationRootList__updateNotificationListDisplayStyleSetting__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "notificationListDisplayStyleSettingsForReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v8, "unsignedIntegerValue");
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)_insertNotificationRequest:(id)a3
{
  id v4;
  NCNotificationStructuredSectionList *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NCNotificationRootList _sectionForNotificationRequest:](self, "_sectionForNotificationRequest:", v4);
  v5 = (NCNotificationStructuredSectionList *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E20];
  -[NCNotificationRootList _notificationSectionListsForEnumeration](self, "_notificationSectionListsForEnumeration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_upcomingDigestSectionList)
    objc_msgSend(v8, "addObject:");
  if (self->_currentDigestSectionList)
    objc_msgSend(v8, "addObject:");
  if (self->_upcomingMissedSectionList)
    objc_msgSend(v8, "addObject:");
  if (v5)
    objc_msgSend(v8, "removeObject:", v5);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__NCNotificationRootList__insertNotificationRequest___block_invoke;
  v14[3] = &unk_1E8D1C208;
  v9 = v4;
  v15 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);
  -[NCNotificationStructuredSectionList insertNotificationRequest:](v5, "insertNotificationRequest:", v9);
  if (v5 == self->_prominentIncomingSectionList
    && -[NCNotificationRootList _isAlertingNotificationRequest:](self, "_isAlertingNotificationRequest:", v9)
    && !-[NCNotificationRootList _isProminentNotificationRequest:](self, "_isProminentNotificationRequest:", v9))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 30.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationRootList migrationScheduler](self, "migrationScheduler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addMigrationForNotificationRequests:forDate:", v12, v10);

  }
  +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "insertedNotificationRequest:toSectionType:", v9, -[NCNotificationStructuredSectionList sectionType](v5, "sectionType"));

  -[NCNotificationRootList _elevateGroupInOtherSectionsIfNeededWithRequest:toSection:](self, "_elevateGroupInOtherSectionsIfNeededWithRequest:toSection:", v9, v5);
}

uint64_t __53__NCNotificationRootList__insertNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeNotificationRequest:", *(_QWORD *)(a1 + 32));
}

- (void)_migrateNotificationsFromList:(id)a3 toList:(id)a4 passingTest:(id)a5 filterRequestsPassingTest:(id)a6 hideToList:(BOOL)a7 clearRequests:(BOOL)a8 filterForDestination:(BOOL)a9 animateRemoval:(BOOL)a10 reorderGroupNotifications:(BOOL)a11
{
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL8 v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _BOOL4 v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  _QWORD v38[4];
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v11 = a8;
  v12 = a7;
  v17 = a10;
  v46 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v23 = v22;
    -[NCNotificationRootList logDescription](self, "logDescription");
    v37 = v12;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "logDescription");
    v25 = v11;
    v26 = v18;
    v27 = v21;
    v28 = v20;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "logDescription");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v41 = v24;
    v42 = 2114;
    v43 = v29;
    v44 = 2114;
    v45 = v30;
    _os_log_impl(&dword_1CFC3D000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ migrating notification requests from %{public}@ to %{public}@", buf, 0x20u);

    v20 = v28;
    v21 = v27;
    v18 = v26;
    v11 = v25;
    v17 = a10;

    v12 = v37;
  }
  objc_msgSend(v18, "removeNotificationGroupListsForMigrationPassingTest:filterRequestsPassingTest:animate:", v20, v21, v17);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = v32;
  if (v11)
  {
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __188__NCNotificationRootList__migrateNotificationsFromList_toList_passingTest_filterRequestsPassingTest_hideToList_clearRequests_filterForDestination_animateRemoval_reorderGroupNotifications___block_invoke;
    v38[3] = &unk_1E8D1C3A0;
    v39 = v32;
    objc_msgSend(v31, "enumerateObjectsUsingBlock:", v38);

  }
  if (a9)
  {
    -[NCNotificationRootList _filterNotificationsInGroupLists:withDestinationsForSectionList:](self, "_filterNotificationsInGroupLists:withDestinationsForSectionList:", v31, v19);
    v34 = objc_claimAutoreleasedReturnValue();

    v31 = (void *)v34;
  }
  if (objc_msgSend(v31, "count"))
    -[NCNotificationRootList _regroupAllNotificationGroups](self, "_regroupAllNotificationGroups");
  if (objc_msgSend(v31, "count"))
  {
    if (v12)
    {
      -[NCNotificationRootList _setRevealed:forSection:](self, "_setRevealed:forSection:", 0, v19);
      -[NCNotificationRootList _setForceRevealed:](self, "_setForceRevealed:", 0);
      if (!objc_msgSend(v19, "sectionType"))
      {
        -[NCNotificationRootList rootListView](self, "rootListView");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "_scrollToTopIfPossible:", 1);

      }
    }
  }
  objc_msgSend(v19, "mergeNotificationGroups:reorderGroupNotifications:", v31, a11);
  if (objc_msgSend(v33, "count"))
  {
    -[NCNotificationRootList delegate](self, "delegate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "notificationRootList:requestsClearingFromIncomingSectionNotificationRequests:", self, v33);

    if (objc_msgSend(v18, "sectionType") == 2 && !objc_msgSend(v19, "sectionType"))
      objc_msgSend(v33, "enumerateObjectsUsingBlock:", &__block_literal_global_108);
  }

}

void __188__NCNotificationRootList__migrateNotificationsFromList_toList_passingTest_filterRequestsPassingTest_hideToList_clearRequests_filterForDestination_animateRemoval_reorderGroupNotifications___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "allNotificationRequests");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

void __188__NCNotificationRootList__migrateNotificationsFromList_toList_passingTest_filterRequestsPassingTest_hideToList_clearRequests_filterForDestination_animateRemoval_reorderGroupNotifications___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hideNotificationRequest:", v2);

}

- (id)_filterNotificationsInGroupLists:(id)a3 withDestinationsForSectionList:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  id obj;
  id v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v8)
  {
    v9 = v8;
    v21 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v11, "allNotificationRequests");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v23 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
              if (!-[NCNotificationRootList _isNotificationRequest:forSectionList:](self, "_isNotificationRequest:forSectionList:", v17, v7))objc_msgSend(v11, "removeNotificationRequest:", v17);
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v14);
        }
        if (objc_msgSend(v11, "count"))
          objc_msgSend(v20, "addObject:", v11);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v9);
  }

  return v20;
}

- (void)_scheduleNotificationRequestsForMigrationFromIncomingListPassingTest:(id)a3
{
  id v4;
  NSObject **v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  double v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (NSObject **)MEMORY[0x1E0DC5F90];
  v6 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[NCNotificationRootList logDescription](self, "logDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v8;
    _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling migration for incoming list.", buf, 0xCu);

  }
  -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allNotificationRequests");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __95__NCNotificationRootList__scheduleNotificationRequestsForMigrationFromIncomingListPassingTest___block_invoke;
  v22[3] = &unk_1E8D1C408;
  v12 = v4;
  v24 = v12;
  v22[4] = self;
  v13 = v11;
  v23 = v13;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v22);
  v14 = 3600.0;
  if (MEMORY[0x1D17DCDFC]("-[NCNotificationRootList _scheduleNotificationRequestsForMigrationFromIncomingListPassingTest:]"))
  {
    -[NCNotificationRootList overrideNotificationMigrateTimeSensitiveToHistoryTimeIntervalKey](self, "overrideNotificationMigrateTimeSensitiveToHistoryTimeIntervalKey");
    if (v15 > 0.0)
    {
      v16 = *v5;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v16;
        -[NCNotificationRootList logDescription](self, "logDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationRootList overrideNotificationMigrateTimeSensitiveToHistoryTimeIntervalKey](self, "overrideNotificationMigrateTimeSensitiveToHistoryTimeIntervalKey");
        *(_DWORD *)buf = 138543618;
        v26 = v18;
        v27 = 2050;
        v28 = v19;
        _os_log_impl(&dword_1CFC3D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Found override value for TimeSensitive migrate timeInterval %{public}.2f.", buf, 0x16u);

      }
      -[NCNotificationRootList overrideNotificationMigrateTimeSensitiveToHistoryTimeIntervalKey](self, "overrideNotificationMigrateTimeSensitiveToHistoryTimeIntervalKey");
      v14 = v20;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationListMigrationScheduler addMigrationForNotificationRequests:forDate:](self->_migrationScheduler, "addMigrationForNotificationRequests:forDate:", v13, v21);

}

void __95__NCNotificationRootList__scheduleNotificationRequestsForMigrationFromIncomingListPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 48);
  if (!v4 || (*(unsigned int (**)(uint64_t, id))(v4 + 16))(v4, v3))
  {
    v5 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(a1 + 32);
      v7 = v5;
      objc_msgSend(v6, "logDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "notificationIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "un_logDigest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v8;
      v13 = 2114;
      v14 = v10;
      _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ schedule request %{public}@ for incoming to history migration.", (uint8_t *)&v11, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }

}

- (void)_scheduleAllNotificationRequestsForMigrationFromHighlightList
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  os_log_t *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  os_log_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  double v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[NCNotificationRootList highlightedSectionList](self, "highlightedSectionList");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[NCNotificationRootList highlightedSectionList](self, "highlightedSectionList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "notificationCount");

    if (v6)
    {
      v7 = (os_log_t *)MEMORY[0x1E0DC5F90];
      v8 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v9 = v8;
        -[NCNotificationRootList logDescription](self, "logDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543362;
        v22 = v10;
        _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling migration for all notifications in highlight list.", (uint8_t *)&v21, 0xCu);

      }
      -[NCNotificationRootList highlightedSectionList](self, "highlightedSectionList");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "allNotificationRequests");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = 3600.0;
      if (MEMORY[0x1D17DCDFC]("-[NCNotificationRootList _scheduleAllNotificationRequestsForMigrationFromHighlightList]"))
      {
        -[NCNotificationRootList overrideNotificationMigrateHighlightToHistoryTimeIntervalKey](self, "overrideNotificationMigrateHighlightToHistoryTimeIntervalKey");
        if (v14 > 0.0)
        {
          v15 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
          {
            v16 = v15;
            -[NCNotificationRootList logDescription](self, "logDescription");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[NCNotificationRootList overrideNotificationMigrateHighlightToHistoryTimeIntervalKey](self, "overrideNotificationMigrateHighlightToHistoryTimeIntervalKey");
            v21 = 138543618;
            v22 = v17;
            v23 = 2050;
            v24 = v18;
            _os_log_impl(&dword_1CFC3D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Found override value for Highlight migrate timeInterval %{public}.2f.", (uint8_t *)&v21, 0x16u);

          }
          -[NCNotificationRootList overrideNotificationMigrateHighlightToHistoryTimeIntervalKey](self, "overrideNotificationMigrateHighlightToHistoryTimeIntervalKey");
          v13 = v19;
        }
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationListMigrationScheduler addMigrationForNotificationRequests:forDate:](self->_migrationScheduler, "addMigrationForNotificationRequests:forDate:", v12, v20);

    }
  }
}

- (void)_scheduleNotificationDigestMigrationIfNecessary
{
  uint64_t v3;
  id v4;

  if (-[NCNotificationRootList _isCurrentDigestListAboveHistorySectionList](self, "_isCurrentDigestListAboveHistorySectionList")&& !-[NCNotificationRootList isOnboardingSummaryVisible](self, "isOnboardingSummaryVisible"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1800.0);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = (id)v3;
  -[NCNotificationListMigrationScheduler setMigrationDateForNotificationDigest:](self->_migrationScheduler, "setMigrationDateForNotificationDigest:", v3);

}

- (void)_performDeferredMigrationIfNecessary
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSMutableArray *notificationRequestsPendingMigration;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[NCNotificationRootList deferDigestMigration](self, "deferDigestMigration")
    && -[NCNotificationRootList _isCurrentDigestListAboveHistorySectionList](self, "_isCurrentDigestListAboveHistorySectionList"))
  {
    v3 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v5;
      _os_log_impl(&dword_1CFC3D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ performing deferred migration of current digest", (uint8_t *)&v11, 0xCu);

    }
    -[NCNotificationRootList _migrateCurrentDigestSectionListToReadSection](self, "_migrateCurrentDigestSectionListToReadSection");
    -[NCNotificationRootList setDeferDigestMigration:](self, "setDeferDigestMigration:", 0);
  }
  if (-[NSMutableArray count](self->_notificationRequestsPendingMigration, "count"))
  {
    v6 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray bs_map:](self->_notificationRequestsPendingMigration, "bs_map:", &__block_literal_global_109);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v8;
      v13 = 2114;
      v14 = v9;
      _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ performing deferred migration of requests pending migration %{public}@", (uint8_t *)&v11, 0x16u);

    }
    -[NCNotificationRootList _migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection:](self, "_migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection:", self->_notificationRequestsPendingMigration);
    -[NCNotificationRootList _migrateOnScheduleNotificationRequestsFromIncomingSectionToHistorySection:](self, "_migrateOnScheduleNotificationRequestsFromIncomingSectionToHistorySection:", self->_notificationRequestsPendingMigration);
    if (-[NCNotificationRootList currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting") == 2)
      -[NCNotificationRootList _migrateOnScheduleNotificationRequestsFromProminentIncomingSectionToIncomingSection:](self, "_migrateOnScheduleNotificationRequestsFromProminentIncomingSectionToIncomingSection:", self->_notificationRequestsPendingMigration);
    notificationRequestsPendingMigration = self->_notificationRequestsPendingMigration;
    self->_notificationRequestsPendingMigration = 0;

  }
}

id __62__NCNotificationRootList__performDeferredMigrationIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "notificationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "un_logDigest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;

  v4 = a3;
  -[NCNotificationRootList highlightedSectionList](self, "highlightedSectionList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = _NCStackElevation();
    v7 = MEMORY[0x1E0C809B0];
    if (v6
      && +[NCPlatformEligibility areGenerativeModelsAvailable](NCPlatformEligibility, "areGenerativeModelsAvailable")&& -[NCNotificationRootList isGlobalIntelligentSummarizationEnabled](self, "isGlobalIntelligentSummarizationEnabled"))
    {
      -[NCNotificationRootList highlightedSectionList](self, "highlightedSectionList");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v7;
      v25[1] = 3221225472;
      v25[2] = __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke;
      v25[3] = &unk_1E8D1C450;
      v25[4] = self;
      v10 = v4;
      v26 = v10;
      BYTE2(v16) = 0;
      LOWORD(v16) = 0;
      -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v8, v9, v25, 0, 0, 0, v16);

      -[NCNotificationRootList highlightedSectionList](self, "highlightedSectionList");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v7;
      v23[1] = 3221225472;
      v23[2] = __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_111;
      v23[3] = &unk_1E8D1C478;
      v23[4] = self;
      v24 = v10;
      BYTE2(v17) = 0;
      LOWORD(v17) = 0;
      -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v11, v12, 0, v23, 0, 0, v17);

      v13 = v26;
    }
    else
    {
      -[NCNotificationRootList highlightedSectionList](self, "highlightedSectionList");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v7;
      v21[1] = 3221225472;
      v21[2] = __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_113;
      v21[3] = &unk_1E8D1BF50;
      v22 = v4;
      v19[0] = v7;
      v19[1] = 3221225472;
      v19[2] = __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_3;
      v19[3] = &unk_1E8D1BF28;
      v20 = v22;
      BYTE2(v16) = 0;
      LOWORD(v16) = 0;
      -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v14, v15, v21, v19, 0, 0, v16);

      v13 = v22;
    }

    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_5;
    v18[3] = &unk_1E8D1B4B0;
    v18[4] = self;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v18);
  }

}

BOOL __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  BOOL v10;
  _BOOL8 v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "containsCommunicationTypeNotificationRequests") & 1) != 0)
  {
    objc_msgSend(v3, "leadingNotificationRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_110;
    v28[3] = &unk_1E8D1C198;
    v6 = v4;
    v29 = v6;
    v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v28);
    v8 = (void *)*MEMORY[0x1E0DC5F90];
    v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT);
    v10 = v7 == 0x7FFFFFFFFFFFFFFFLL;
    v11 = v7 != 0x7FFFFFFFFFFFFFFFLL;
    if (v10)
    {
      if (v9)
      {
        v21 = *(void **)(a1 + 32);
        v22 = v8;
        objc_msgSend(v21, "logDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "notificationIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "un_logDigest");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "logDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v31 = v23;
        v32 = 2114;
        v33 = v25;
        v34 = 2114;
        v35 = v26;
        _os_log_impl(&dword_1CFC3D000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ leading notification %{public}@ in the thread %{public}@ is not within the target requests we want to migrate this time; Skip migration from highlight to incoming.",
          buf,
          0x20u);

      }
    }
    else if (v9)
    {
      v12 = *(void **)(a1 + 32);
      v13 = v8;
      objc_msgSend(v12, "logDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "logDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v14;
      v32 = 2114;
      v33 = v15;
      _os_log_impl(&dword_1CFC3D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ migrate thread %{public}@ from highlight to incoming.", buf, 0x16u);

    }
  }
  else
  {
    v16 = (void *)*MEMORY[0x1E0DC5F90];
    v11 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(void **)(a1 + 32);
      v18 = v16;
      objc_msgSend(v17, "logDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "threadIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v19;
      v32 = 2114;
      v33 = v20;
      _os_log_impl(&dword_1CFC3D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ thread %{public}@ is not communication thread; Skip group migration from highlight to incoming.",
        buf,
        0x16u);

      v11 = 0;
    }
  }

  return v11;
}

uint64_t __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_110(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "matchesRequest:", a2);
}

BOOL __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_111(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCommunicationType");

  if (v5)
  {
    v6 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      objc_msgSend(v7, "logDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "notificationIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "un_logDigest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v9;
      v27 = 2114;
      v28 = v11;
      _os_log_impl(&dword_1CFC3D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ notification %{public}@ is communication notification; skip individual request migration check from h"
        "ighlight to incoming.",
        buf,
        0x16u);

    }
    v12 = 1;
  }
  else
  {
    v13 = *(void **)(a1 + 40);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_112;
    v23[3] = &unk_1E8D1C198;
    v14 = v3;
    v24 = v14;
    v15 = objc_msgSend(v13, "indexOfObjectPassingTest:", v23);
    v12 = v15 == 0x7FFFFFFFFFFFFFFFLL;
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = (void *)*MEMORY[0x1E0DC5F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(void **)(a1 + 32);
        v18 = v16;
        objc_msgSend(v17, "logDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "notificationIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "un_logDigest");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v19;
        v27 = 2114;
        v28 = v21;
        _os_log_impl(&dword_1CFC3D000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ migrate requests %{public}@ from highlight to incoming.", buf, 0x16u);

      }
    }

  }
  return v12;
}

uint64_t __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_112(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matchesRequest:", *(_QWORD *)(a1 + 32));
}

BOOL __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_113(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _BOOL8 v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_2;
  v8[3] = &unk_1E8D1C198;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "indexOfObjectPassingTest:", v8) != 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

uint64_t __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "threadIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "threadIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

BOOL __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _BOOL8 v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_4;
  v8[3] = &unk_1E8D1C198;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "indexOfObjectPassingTest:", v8) == 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

uint64_t __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matchesRequest:", *(_QWORD *)(a1 + 32));
}

uint64_t __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "removeMigrationForNotificationRequest:", a2);
}

- (void)_migrateOnScheduleNotificationRequestsFromIncomingSectionToHistorySection:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRootList historySectionList](self, "historySectionList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRootList _migrateOnScheduleNotificationRequests:fromSection:toSection:clearRequests:filterForDestination:animateRemoval:](self, "_migrateOnScheduleNotificationRequests:fromSection:toSection:clearRequests:filterForDestination:animateRemoval:", v4, v6, v5, 1, 1, 0);

}

- (void)_migrateOnScheduleNotificationRequestsFromProminentIncomingSectionToIncomingSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NCNotificationRootList prominentIncomingSectionList](self, "prominentIncomingSectionList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRootList incomingSectionList](self, "incomingSectionList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRootList _migrateOnScheduleNotificationRequests:fromSection:toSection:clearRequests:filterForDestination:animateRemoval:](self, "_migrateOnScheduleNotificationRequests:fromSection:toSection:clearRequests:filterForDestination:animateRemoval:", v4, v5, v6, 0, 0, 0);

  -[NCNotificationRootList _updateDelegateAndSubclassIfNecessaryOfContentChange](self, "_updateDelegateAndSubclassIfNecessaryOfContentChange");
}

- (void)_migrateOnScheduleNotificationRequests:(id)a3 fromSection:(id)a4 toSection:(id)a5 clearRequests:(BOOL)a6 filterForDestination:(BOOL)a7 animateRemoval:(BOOL)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  int v17;
  uint64_t v18;
  double (*__ptr32 *v19)();
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[5];
  _QWORD v27[4];
  id v28;
  NCNotificationRootList *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  id v40;
  id v41;

  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = _NCStackElevation();
  v18 = MEMORY[0x1E0C809B0];
  v19 = &off_1CFD91000;
  if (v17
    && +[NCPlatformEligibility areGenerativeModelsAvailable](NCPlatformEligibility, "areGenerativeModelsAvailable")&& -[NCNotificationRootList isGlobalIntelligentSummarizationEnabled](self, "isGlobalIntelligentSummarizationEnabled"))
  {
    v38[0] = v18;
    v38[1] = 3221225472;
    v38[2] = __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke;
    v38[3] = &unk_1E8D1C4A0;
    v38[4] = self;
    v20 = v14;
    v39 = v20;
    v21 = v15;
    v40 = v21;
    v22 = v16;
    v41 = v22;
    BYTE2(v24) = 0;
    BYTE1(v24) = a8;
    LOBYTE(v24) = a7;
    -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v21, v22, v38, 0, 1, v10, v24);
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_115;
    v34[3] = &unk_1E8D1C4C8;
    v34[4] = self;
    v35 = v21;
    v36 = v22;
    v37 = v20;
    *(_WORD *)((char *)&v25 + 1) = a8;
    LOBYTE(v25) = a7;
    v18 = MEMORY[0x1E0C809B0];
    v19 = &off_1CFD91000;
    -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v35, v36, 0, v34, 1, v10, v25);

    v23 = v39;
  }
  else
  {
    v32[0] = v18;
    v32[1] = 3221225472;
    v32[2] = __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_117;
    v32[3] = &unk_1E8D1BF50;
    v33 = v14;
    v27[0] = v18;
    v27[1] = 3221225472;
    v27[2] = __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_3;
    v27[3] = &unk_1E8D1C4C8;
    v28 = v33;
    v29 = self;
    v30 = v15;
    v31 = v16;
    BYTE2(v24) = 0;
    BYTE1(v24) = a8;
    LOBYTE(v24) = a7;
    -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v30, v31, v32, v27, 1, v10, v24);

    v23 = v33;
  }

  v26[0] = v18;
  v26[1] = *((_QWORD *)v19 + 198);
  v26[2] = __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_118;
  v26[3] = &unk_1E8D1B4B0;
  v26[4] = self;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v26);

}

uint64_t __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v34[4];
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "containsCommunicationTypeNotificationRequests") & 1) != 0)
  {
    objc_msgSend(v3, "leadingNotificationRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_114;
    v34[3] = &unk_1E8D1C198;
    v6 = v4;
    v35 = v6;
    if (objc_msgSend(v5, "indexOfObjectPassingTest:", v34) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = (void *)*MEMORY[0x1E0DC5F90];
      v8 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      {
LABEL_15:

        goto LABEL_16;
      }
      v9 = *(void **)(a1 + 32);
      v10 = v7;
      objc_msgSend(v9, "logDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "notificationIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "un_logDigest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "logDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NCNotificationListSectionTypeString(objc_msgSend(*(id *)(a1 + 48), "sectionType"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NCNotificationListSectionTypeString(objc_msgSend(*(id *)(a1 + 56), "sectionType"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v37 = v11;
      v38 = 2114;
      v39 = v13;
      v40 = 2114;
      v41 = v14;
      v42 = 2114;
      v43 = v15;
      v44 = 2114;
      v45 = v16;
      _os_log_impl(&dword_1CFC3D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ leading notification %{public}@ in the thread %{public}@ is not within the target requests we want to migrate this time; Skip migration from %{public}@ to %{public}@.",
        buf,
        0x34u);

    }
    else
    {
      v22 = objc_msgSend(v3, "containsPersistentNotificationRequests");
      v23 = (void *)*MEMORY[0x1E0DC5F90];
      v24 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT);
      if (!v22)
      {
        if (v24)
        {
          v27 = *(void **)(a1 + 32);
          v28 = v23;
          objc_msgSend(v27, "logDescription");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "logDescription");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          NCNotificationListSectionTypeString(objc_msgSend(*(id *)(a1 + 48), "sectionType"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          NCNotificationListSectionTypeString(objc_msgSend(*(id *)(a1 + 56), "sectionType"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v37 = v29;
          v38 = 2114;
          v39 = v30;
          v40 = 2114;
          v41 = v31;
          v42 = 2114;
          v43 = v32;
          _os_log_impl(&dword_1CFC3D000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ migrate thread %{public}@ from %{public}@ to %{public}@.", buf, 0x2Au);

        }
        v8 = 1;
        goto LABEL_15;
      }
      if (!v24)
        goto LABEL_11;
      v25 = *(void **)(a1 + 32);
      v10 = v23;
      objc_msgSend(v25, "logDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "logDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NCNotificationListSectionTypeString(objc_msgSend(*(id *)(a1 + 48), "sectionType"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NCNotificationListSectionTypeString(objc_msgSend(*(id *)(a1 + 56), "sectionType"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v37 = v11;
      v38 = 2114;
      v39 = v13;
      v40 = 2114;
      v41 = v14;
      v42 = 2114;
      v43 = v26;
      _os_log_impl(&dword_1CFC3D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ found persistent notification in thread %{public}@; Skip migration from %{public}@ to %{public}@.",
        buf,
        0x2Au);

    }
LABEL_11:
    v8 = 0;
    goto LABEL_15;
  }
  v17 = (void *)*MEMORY[0x1E0DC5F90];
  v8 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v18 = *(void **)(a1 + 32);
    v19 = v17;
    objc_msgSend(v18, "logDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "threadIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v37 = v20;
    v38 = 2114;
    v39 = v21;
    _os_log_impl(&dword_1CFC3D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ thread %{public}@ is not communication thread; Skip group migration from incoming to history.",
      buf,
      0x16u);

    v8 = 0;
  }
LABEL_16:

  return v8;
}

uint64_t __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_114(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "matchesRequest:", a2);
}

BOOL __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_115(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
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
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *log;
  _QWORD v37[4];
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCommunicationType");

  if (!v5)
  {
    v15 = *(void **)(a1 + 56);
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_116;
    v37[3] = &unk_1E8D1C198;
    v38 = v3;
    v16 = objc_msgSend(v15, "indexOfObjectPassingTest:", v37);
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = 1;
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "options");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "lockScreenPersistence");
    v14 = v19 != 0;

    v20 = (void *)*MEMORY[0x1E0DC5F90];
    v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (v21)
      {
        v22 = *(void **)(a1 + 32);
        log = v20;
        objc_msgSend(v22, "logDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "notificationIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "un_logDigest");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "options");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "lockScreenPersistence");
        NCNotificationListSectionTypeString(objc_msgSend(*(id *)(a1 + 40), "sectionType"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        NCNotificationListSectionTypeString(objc_msgSend(*(id *)(a1 + 48), "sectionType"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v40 = v23;
        v41 = 2114;
        v42 = v25;
        v43 = 2048;
        v44 = v27;
        v45 = 2114;
        v46 = v28;
        v47 = 2114;
        v48 = v29;
        v30 = log;
        _os_log_impl(&dword_1CFC3D000, log, OS_LOG_TYPE_DEFAULT, "%{public}@ found the request %{public}@, but it's lock screen persistence %lu; Skip migration from %{public}@ to %{public}@.",
          buf,
          0x34u);

LABEL_12:
      }
    }
    else if (v21)
    {
      v31 = *(void **)(a1 + 32);
      v30 = v20;
      objc_msgSend(v31, "logDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "notificationIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "un_logDigest");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      NCNotificationListSectionTypeString(objc_msgSend(*(id *)(a1 + 40), "sectionType"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      NCNotificationListSectionTypeString(objc_msgSend(*(id *)(a1 + 48), "sectionType"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v40 = v23;
      v41 = 2114;
      v42 = v25;
      v43 = 2114;
      v44 = (uint64_t)v33;
      v45 = 2114;
      v46 = v34;
      _os_log_impl(&dword_1CFC3D000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ migrate request %{public}@ from %{public}@ to %{public}@.", buf, 0x2Au);

      goto LABEL_12;
    }

    goto LABEL_14;
  }
  v6 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    objc_msgSend(v7, "logDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "notificationIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "un_logDigest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NCNotificationListSectionTypeString(objc_msgSend(*(id *)(a1 + 40), "sectionType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NCNotificationListSectionTypeString(objc_msgSend(*(id *)(a1 + 48), "sectionType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v40 = v9;
    v41 = 2114;
    v42 = v11;
    v43 = 2114;
    v44 = (uint64_t)v12;
    v45 = 2114;
    v46 = v13;
    _os_log_impl(&dword_1CFC3D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ notification %{public}@ is communication notification; skip individual request migration check from %{p"
      "ublic}@ to %{public}@.",
      buf,
      0x2Au);

  }
  v14 = 1;
LABEL_15:

  return v14;
}

uint64_t __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_116(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matchesRequest:", *(_QWORD *)(a1 + 32));
}

BOOL __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_117(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _BOOL8 v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_2;
  v8[3] = &unk_1E8D1C198;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "indexOfObjectPassingTest:", v8) != 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

uint64_t __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "threadIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "threadIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

BOOL __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *log;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_4;
  v28[3] = &unk_1E8D1C198;
  v5 = v3;
  v29 = v5;
  v6 = objc_msgSend(v4, "indexOfObjectPassingTest:", v28);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "lockScreenPersistence");
    v7 = v10 != 0;

    v11 = (void *)*MEMORY[0x1E0DC5F90];
    v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        v13 = *(void **)(a1 + 40);
        log = v11;
        objc_msgSend(v13, "logDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "notificationIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "un_logDigest");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "options");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "lockScreenPersistence");
        NCNotificationListSectionTypeString(objc_msgSend(*(id *)(a1 + 48), "sectionType"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        NCNotificationListSectionTypeString(objc_msgSend(*(id *)(a1 + 56), "sectionType"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v31 = v14;
        v32 = 2114;
        v33 = v16;
        v34 = 2048;
        v35 = v18;
        v36 = 2114;
        v37 = v19;
        v38 = 2114;
        v39 = v20;
        v21 = log;
        _os_log_impl(&dword_1CFC3D000, log, OS_LOG_TYPE_DEFAULT, "%{public}@ found the request %{public}@, but it's lock screen persistence %lu; Skip migration from %{public}@ to %{public}@.",
          buf,
          0x34u);

LABEL_8:
      }
    }
    else if (v12)
    {
      v22 = *(void **)(a1 + 40);
      v21 = v11;
      objc_msgSend(v22, "logDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "notificationIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "un_logDigest");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NCNotificationListSectionTypeString(objc_msgSend(*(id *)(a1 + 48), "sectionType"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      NCNotificationListSectionTypeString(objc_msgSend(*(id *)(a1 + 56), "sectionType"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v31 = v14;
      v32 = 2114;
      v33 = v16;
      v34 = 2114;
      v35 = (uint64_t)v24;
      v36 = 2114;
      v37 = v25;
      _os_log_impl(&dword_1CFC3D000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ migrate request %{public}@ from %{public}@ to %{public}@.", buf, 0x2Au);

      goto LABEL_8;
    }

    goto LABEL_10;
  }
  v7 = 1;
LABEL_10:

  return v7;
}

uint64_t __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matchesRequest:", *(_QWORD *)(a1 + 32));
}

uint64_t __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_118(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "removeMigrationForNotificationRequest:", a2);
}

- (void)_elevateGroupInOtherSectionsIfNeededWithRequest:(id)a3 toSection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  os_log_t *v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  os_log_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  uint64_t v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  _BYTE v44[10];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (_NCStackElevation()
    && +[NCPlatformEligibility areGenerativeModelsAvailable](NCPlatformEligibility, "areGenerativeModelsAvailable")&& -[NCNotificationRootList isGlobalIntelligentSummarizationEnabled](self, "isGlobalIntelligentSummarizationEnabled"))
  {
    objc_msgSend(v6, "content");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isCommunicationType");

    if ((v9 & 1) == 0)
    {
      v24 = (void *)*MEMORY[0x1E0DC5F90];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      v16 = v24;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "notificationIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "un_logDigest");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NCNotificationListSectionTypeString(objc_msgSend(v7, "sectionType"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v42 = v17;
      v43 = 2114;
      *(_QWORD *)v44 = v19;
      *(_WORD *)&v44[8] = 2114;
      v45 = v20;
      v21 = "%{public}@ Skip elevate same groups in other section with request %{public}@ in section %{public}@; it's not"
            " communication request";
      goto LABEL_14;
    }
    NCStackElevationPriorityForSectionTypeString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NCNotificationListSectionTypeString(objc_msgSend(v7, "sectionType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "indexOfObject:", v11);

    v13 = (os_log_t *)MEMORY[0x1E0DC5F90];
    v14 = (void *)*MEMORY[0x1E0DC5F90];
    v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT);
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v15)
      {
        v16 = v14;
        -[NCNotificationRootList logDescription](self, "logDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "notificationIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "un_logDigest");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        NCNotificationListSectionTypeString(objc_msgSend(v7, "sectionType"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v42 = v17;
        v43 = 2114;
        *(_QWORD *)v44 = v19;
        *(_WORD *)&v44[8] = 2114;
        v45 = v20;
        v21 = "%{public}@ Skip elevate same groups in other section with request %{public}@ in section %{public}@; it's n"
              "ot in allow list";
LABEL_14:
        _os_log_impl(&dword_1CFC3D000, v16, OS_LOG_TYPE_DEFAULT, v21, buf, 0x20u);
LABEL_15:

        goto LABEL_10;
      }
    }
    else
    {
      if (v15)
      {
        v25 = v14;
        -[NCNotificationRootList logDescription](self, "logDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "notificationIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "un_logDigest");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        NCNotificationListSectionTypeString(objc_msgSend(v7, "sectionType"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v42 = v26;
        v43 = 2114;
        *(_QWORD *)v44 = v28;
        *(_WORD *)&v44[8] = 2114;
        v45 = v29;
        _os_log_impl(&dword_1CFC3D000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Elevating same group in other sections with request %{public}@ in section %{public}@", buf, 0x20u);

      }
      v30 = objc_msgSend(v7, "existingIndexOfGroupForNotificationRequestForInsertion:", v6);
      if (v30 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v32 = v30;
        objc_msgSend(v7, "allNotificationGroups");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectAtIndex:", v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        NCStackElevationPriorityForSectionTypeString();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __84__NCNotificationRootList__elevateGroupInOtherSectionsIfNeededWithRequest_toSection___block_invoke;
        v37[3] = &unk_1E8D1C4F0;
        v40 = v12;
        v37[4] = self;
        v38 = v7;
        v39 = v34;
        v36 = v34;
        objc_msgSend(v35, "enumerateObjectsUsingBlock:", v37);

        goto LABEL_11;
      }
      v31 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
      {
        v16 = v31;
        -[NCNotificationRootList logDescription](self, "logDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "notificationIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "un_logDigest");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        NCNotificationListSectionTypeString(objc_msgSend(v7, "sectionType"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v42 = v17;
        v43 = 2114;
        *(_QWORD *)v44 = v19;
        *(_WORD *)&v44[8] = 2114;
        v45 = v20;
        _os_log_error_impl(&dword_1CFC3D000, v16, OS_LOG_TYPE_ERROR, "%{public}@ No group found with request %{public}@ in section %{public}@", buf, 0x20u);
        goto LABEL_15;
      }
    }
  }
  else
  {
    v22 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v16 = v22;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v42 = v23;
      v43 = 1024;
      *(_DWORD *)v44 = _NCStackElevation();
      *(_WORD *)&v44[4] = 1024;
      *(_DWORD *)&v44[6] = +[NCPlatformEligibility areGenerativeModelsAvailable](NCPlatformEligibility, "areGenerativeModelsAvailable");
      LOWORD(v45) = 1024;
      *(_DWORD *)((char *)&v45 + 2) = -[NCNotificationRootList isGlobalIntelligentSummarizationEnabled](self, "isGlobalIntelligentSummarizationEnabled");
      _os_log_impl(&dword_1CFC3D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Skip elevate same groups in other section; stack elevation not eligible; stackElevationFlagEnabled: %"
        "d; areGenerativeModelsAvailable: %d; isGlobalIntelligentSummarizationEnabled: %d",
        buf,
        0x1Eu);

LABEL_10:
    }
  }
LABEL_11:

}

void __84__NCNotificationRootList__elevateGroupInOtherSectionsIfNeededWithRequest_toSection___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  uint8_t buf[4];
  NSObject *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  NSObject *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (*(_QWORD *)(a1 + 56) >= a3)
  {
    v9 = (void *)*MEMORY[0x1E0DC5F90];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v10 = *(void **)(a1 + 32);
    v11 = v9;
    objc_msgSend(v10, "logDescription");
    v12 = objc_claimAutoreleasedReturnValue();
    NCNotificationListSectionTypeString(objc_msgSend(*(id *)(a1 + 40), "sectionType"));
    v13 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v12;
    v31 = 2114;
    v32 = v6;
    v33 = 2114;
    v34 = v13;
    v14 = "%{public}@ Section %{public}@ has higher or same priority than toSection %{public}@; Stop migrating to toSection.";
    v15 = v11;
    v16 = 32;
    goto LABEL_7;
  }
  v7 = NCNotificationListSectionTypeFromString(v5);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "_sectionOfSectionType:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v17 = *(void **)(a1 + 32);
      v18 = *(_QWORD *)(a1 + 40);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __84__NCNotificationRootList__elevateGroupInOtherSectionsIfNeededWithRequest_toSection___block_invoke_119;
      v24[3] = &unk_1E8D1C4A0;
      v19 = *(id *)(a1 + 48);
      v20 = *(_QWORD *)(a1 + 32);
      v25 = v19;
      v26 = v20;
      v27 = v11;
      v28 = *(id *)(a1 + 40);
      BYTE2(v23) = 1;
      LOWORD(v23) = 0;
      objc_msgSend(v17, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v27, v18, v24, 0, 0, 0, v23);

      goto LABEL_12;
    }
    v21 = (void *)*MEMORY[0x1E0DC5F90];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v22 = *(void **)(a1 + 32);
    v12 = v21;
    objc_msgSend(v22, "logDescription");
    v13 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v13;
    v31 = 2114;
    v32 = v6;
    v14 = "%{public}@ fromSection %{public}@ not exist; Skip migrating.";
    v15 = v12;
    v16 = 22;
LABEL_7:
    _os_log_impl(&dword_1CFC3D000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);

LABEL_12:
    goto LABEL_13;
  }
  v8 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_FAULT))
    __91__NCNotificationRootList__higherSectionToElevateForNotificationRequest_currentSectionType___block_invoke_cold_1(a1, v8);
LABEL_13:

}

uint64_t __84__NCNotificationRootList__elevateGroupInOtherSectionsIfNeededWithRequest_toSection___block_invoke_119(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(*(id *)(a1 + 32), "matchesGroup:", a2);
  if ((_DWORD)v3)
  {
    v4 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 40);
      v6 = v4;
      objc_msgSend(v5, "logDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NCNotificationListSectionTypeString(objc_msgSend(*(id *)(a1 + 48), "sectionType"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NCNotificationListSectionTypeString(objc_msgSend(*(id *)(a1 + 56), "sectionType"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Found same group in %{public}@, migrating to %{public}@", (uint8_t *)&v11, 0x20u);

    }
  }
  return v3;
}

- (id)_sectionOfSectionType:(unint64_t)a3
{
  id v4;
  uint64_t v5;
  int64_t v6;

  v4 = 0;
  v5 = 152;
  switch(a3)
  {
    case 0uLL:
      v5 = 160;
      goto LABEL_10;
    case 1uLL:
      v6 = -[NCNotificationRootList currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting");
      v5 = 152;
      if (v6 == 2)
        v5 = 144;
      goto LABEL_10;
    case 2uLL:
      goto LABEL_10;
    case 3uLL:
      v5 = 184;
      goto LABEL_10;
    case 4uLL:
    case 6uLL:
      v5 = 168;
      goto LABEL_10;
    case 5uLL:
      v5 = 176;
      goto LABEL_10;
    case 0xAuLL:
      v5 = 136;
LABEL_10:
      v4 = *(id *)((char *)&self->super.isa + v5);
      break;
    default:
      return v4;
  }
  return v4;
}

- (void)_updateNotificationListPersistentState
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NCNotificationListMigrationScheduler *migrationScheduler;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[NCNotificationRootList logDescription](self, "logDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v5;
    _os_log_impl(&dword_1CFC3D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating Notification List Persistent State", (uint8_t *)&v10, 0xCu);

  }
  -[NCNotificationRootList _sectionListsForPersistentState](self, "_sectionListsForPersistentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRootList persistentStateManager](self, "persistentStateManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  migrationScheduler = self->_migrationScheduler;
  -[NCNotificationRootList _listInfoForPersistentState](self, "_listInfoForPersistentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updatePersistentStateForNotificationList:sectionLists:listCache:migrationScheduler:listInfo:detailed:", self, v6, 0, migrationScheduler, v9, 0);

}

- (id)_listInfoForPersistentState
{
  id v3;
  NCNotificationSummarizedSectionList *upcomingMissedSectionList;
  _BOOL8 v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (self->_currentDigestSectionList
    || -[NCNotificationRootList deferCurrentDigestPresentationForPersistedDataLoad](self, "deferCurrentDigestPresentationForPersistedDataLoad"))
  {
    upcomingMissedSectionList = self->_upcomingMissedSectionList;
    if (upcomingMissedSectionList
      && -[NCNotificationCombinedSectionList containsSectionList:](upcomingMissedSectionList, "containsSectionList:", self->_currentDigestSectionList))
    {
      v5 = 1;
    }
    else if (-[NCNotificationRootList deferCurrentDigestPresentationForPersistedDataLoad](self, "deferCurrentDigestPresentationForPersistedDataLoad"))
    {
      v5 = -[NCNotificationRootList _isPersistentStateCurrentDigestInMissedSection](self, "_isPersistentStateCurrentDigestInMissedSection");
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("isCurrentDigestInMissedSection"));

  }
  if (objc_msgSend(v3, "count"))
    v7 = v3;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (BOOL)_isPersistentStateCurrentDigestInMissedSection
{
  NSDictionary *persistentStoredListInfo;
  void *v3;
  char v4;

  persistentStoredListInfo = self->_persistentStoredListInfo;
  if (persistentStoredListInfo)
  {
    -[NSDictionary objectForKey:](persistentStoredListInfo, "objectForKey:", CFSTR("isCurrentDigestInMissedSection"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");

    LOBYTE(persistentStoredListInfo) = v4;
  }
  return (char)persistentStoredListInfo;
}

- (id)_sectionListsForPersistentState
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = v3;
  if (self->_highlightedSectionList)
    objc_msgSend(v3, "addObject:");
  if (self->_prominentIncomingSectionList)
    objc_msgSend(v4, "addObject:");
  if (self->_incomingSectionList)
    objc_msgSend(v4, "addObject:");
  if (self->_currentDigestSectionList)
    objc_msgSend(v4, "addObject:");
  if (self->_upcomingDigestSectionList)
    objc_msgSend(v4, "addObject:");
  if (self->_upcomingMissedSectionList)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (id)_sectionForStoredNotificationRequestOfSectionType:(unint64_t)a3
{
  NCNotificationSummarizedSectionList *v4;
  NCNotificationSummarizedSectionList *currentDigestSectionList;
  NCNotificationSummarizedSectionList **p_incomingSectionList;
  void *v8;
  _BOOL4 v9;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;

  v4 = 0;
  switch(a3)
  {
    case 1uLL:
      v12 = -[NCNotificationRootList currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting");
      v13 = 152;
      if (v12 == 2)
        v13 = 144;
      p_incomingSectionList = (NCNotificationSummarizedSectionList **)((char *)self + v13);
      goto LABEL_17;
    case 2uLL:
      p_incomingSectionList = (NCNotificationSummarizedSectionList **)&self->_incomingSectionList;
      goto LABEL_17;
    case 3uLL:
      p_incomingSectionList = &self->_upcomingMissedSectionList;
      goto LABEL_17;
    case 4uLL:
    case 6uLL:
      p_incomingSectionList = &self->_currentDigestSectionList;
      currentDigestSectionList = self->_currentDigestSectionList;
      if (currentDigestSectionList)
        goto LABEL_18;
      -[NCDigestScheduleManager previouslyScheduledDigestInfo](self->_digestScheduleManager, "previouslyScheduledDigestInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[NCNotificationRootList _isPersistentStateCurrentDigestInMissedSection](self, "_isPersistentStateCurrentDigestInMissedSection");
      if (a3 == 6 || v9)
        v11 = 2;
      else
        v11 = 1;
      -[NCNotificationRootList _configureCurrentDigestSectionListWithDigestInfo:sectionType:summaryOrderProviderType:](self, "_configureCurrentDigestSectionListWithDigestInfo:sectionType:summaryOrderProviderType:", v8, a3, v11);

LABEL_17:
      currentDigestSectionList = *p_incomingSectionList;
LABEL_18:
      v4 = currentDigestSectionList;
      return v4;
    case 5uLL:
      p_incomingSectionList = &self->_upcomingDigestSectionList;
      goto LABEL_17;
    case 0xAuLL:
      p_incomingSectionList = (NCNotificationSummarizedSectionList **)&self->_highlightedSectionList;
      goto LABEL_17;
    default:
      return v4;
  }
}

- (void)_insertSectionListInHistorySectionList:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v5 = a5;
  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!-[NCNotificationCombinedSectionList containsSectionList:](self->_historySectionList, "containsSectionList:", v8))
  {
    v9 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationStructuredSectionList logDescription](self->_historySectionList, "logDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v11;
      v16 = 2114;
      v17 = v12;
      v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_1CFC3D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting %{public}@ to %{public}@", (uint8_t *)&v14, 0x20u);

    }
    -[NCNotificationCombinedSectionList insertNotificationSectionList:atIndex:animated:](self->_historySectionList, "insertNotificationSectionList:atIndex:animated:", v8, a4, v5);
    objc_msgSend(v8, "setDeviceAuthenticated:", -[NCNotificationRootList deviceAuthenticated](self, "deviceAuthenticated"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v8, "collapseSummarizedSectionList");
  }

}

- (void)_removeSectionListInHistorySectionList:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[NCNotificationCombinedSectionList containsSectionList:](self->_historySectionList, "containsSectionList:", v6))
  {
    v7 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationStructuredSectionList logDescription](self->_historySectionList, "logDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v9;
      v14 = 2114;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1CFC3D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ removing %{public}@ from %{public}@", (uint8_t *)&v12, 0x20u);

    }
    -[NCNotificationCombinedSectionList removeNotificationSectionList:animated:](self->_historySectionList, "removeNotificationSectionList:animated:", v6, v4);
  }

}

- (void)_toggleVisibilityInHistorySectionListForSectionList:(id)a3 atIndex:(unint64_t)a4 isSectionHidden:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  id v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  if (v10)
  {
    v13 = v10;
    if (!-[NCNotificationCombinedSectionList containsSectionList:](self->_historySectionList, "containsSectionList:", v10)&& objc_msgSend(v13, "notificationCount")&& !v7)
    {
      -[NCNotificationRootList _insertSectionListInHistorySectionList:atIndex:animated:](self, "_insertSectionListInHistorySectionList:atIndex:animated:", v13, a4, v6);
      goto LABEL_10;
    }
    v11 = -[NCNotificationCombinedSectionList containsSectionList:](self->_historySectionList, "containsSectionList:", v13);
    v10 = v13;
    if (v11)
    {
      v12 = objc_msgSend(v13, "notificationCount");
      v10 = v13;
      if (!v12 || v7)
      {
        -[NCNotificationRootList _removeSectionListInHistorySectionList:animated:](self, "_removeSectionListInHistorySectionList:animated:", v13, v6);
LABEL_10:
        v10 = v13;
      }
    }
  }

}

- (void)_updateVisibilityForSectionLists
{
  -[NCNotificationRootList _toggleUpcomingDigestSectionListVisibility](self, "_toggleUpcomingDigestSectionListVisibility");
  -[NCNotificationRootList _toggleUpcomingMissedSectionListVisibility](self, "_toggleUpcomingMissedSectionListVisibility");
  -[NCNotificationRootList _toggleCurrentDigestSectionListVisibility](self, "_toggleCurrentDigestSectionListVisibility");
  -[NCNotificationRootList _toggleCurrentDigestSectionListVisibilityInHistorySection](self, "_toggleCurrentDigestSectionListVisibilityInHistorySection");
  -[NCNotificationRootList _updateRevealCoordinator](self, "_updateRevealCoordinator");
}

- (id)_newMissedSectionWithTitle:(id)a3 summaryHeading:(id)a4 logDescription:(id)a5 dndMode:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NCNotificationSummarizedSectionList *v14;
  id v15;
  void *v16;
  void *v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[NCNotificationCombinedSectionList initWithTitle:sectionType:]([NCNotificationSummarizedSectionList alloc], "initWithTitle:sectionType:", v13, 3);

  v15 = -[NCNotificationRootList _newSummaryOrderProviderOfType:summaryHeading:summaryDate:atxDigestDeliveryTime:isOnboardingSummary:](self, "_newSummaryOrderProviderOfType:summaryHeading:summaryDate:atxDigestDeliveryTime:isOnboardingSummary:", 0, v12, 0, 2, 0);
  objc_msgSend(v15, "setDndMode:", v10);

  -[NCNotificationRootList notificationListCache](self, "notificationListCache");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRootList _configureNotificationSectionList:notificationCache:notificationListViewRevealed:logDescription:](self, "_configureNotificationSectionList:notificationCache:notificationListViewRevealed:logDescription:", v14, v16, -[NCNotificationRootList isNotificationHistoryRevealed](self, "isNotificationHistoryRevealed"), v11);

  -[NCNotificationSummarizedSectionList setSummaryOrderProvider:](v14, "setSummaryOrderProvider:", v15);
  -[NCNotificationStructuredSectionList setSectionListDestination:](v14, "setSectionListDestination:", CFSTR("BulletinDestinationLockScreen"));
  -[NCNotificationStructuredSectionList listView](v14, "listView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setGrouped:", 1);

  return v14;
}

- (void)_configureUpcomingMissedSectionForDNDMode:(id)a3
{
  id v4;
  void *v5;
  NCNotificationSummarizedSectionList *v6;
  NCNotificationSummarizedSectionList *upcomingMissedSectionList;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_upcomingMissedSectionList)
  {
    -[NCNotificationRootList _missedSectionTitleForDNDMode:](self, "_missedSectionTitleForDNDMode:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NCNotificationRootList _newMissedSectionWithTitle:summaryHeading:logDescription:dndMode:](self, "_newMissedSectionWithTitle:summaryHeading:logDescription:dndMode:", v5, v5, CFSTR("Upcoming Missed Section"), v4);
    upcomingMissedSectionList = self->_upcomingMissedSectionList;
    self->_upcomingMissedSectionList = v6;

    v8 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationStructuredSectionList logDescription](self->_upcomingMissedSectionList, "logDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "modeIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138544130;
      v14 = v10;
      v15 = 2114;
      v16 = v11;
      v17 = 2112;
      v18 = v5;
      v19 = 2114;
      v20 = v12;
      _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ configured new %{public}@ with title \"%@\" for mode %{public}@", (uint8_t *)&v13, 0x2Au);

    }
  }

}

- (id)_missedSectionTitleForDNDMode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = a3;
  NCUserNotificationsUIKitFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_MISSED_SECTION_HEADER_DO_NOT_DISTURB"), &stru_1E8D21F60, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  switch(objc_msgSend(v3, "semanticType"))
  {
    case 0:
      NCUserNotificationsUIKitFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("NOTIFICATION_LIST_MISSED_SECTION_HEADER_DO_NOT_DISTURB");
      goto LABEL_12;
    case 1:
      NCUserNotificationsUIKitFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("NOTIFICATION_LIST_MISSED_SECTION_HEADER_SLEEP");
      goto LABEL_12;
    case 2:
      NCUserNotificationsUIKitFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("NOTIFICATION_LIST_MISSED_SECTION_HEADER_DRIVING");
      goto LABEL_12;
    case 3:
      NCUserNotificationsUIKitFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("NOTIFICATION_LIST_MISSED_SECTION_HEADER_FITNESS");
      goto LABEL_12;
    case 4:
      NCUserNotificationsUIKitFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("NOTIFICATION_LIST_MISSED_SECTION_HEADER_WORK");
      goto LABEL_12;
    case 5:
      NCUserNotificationsUIKitFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("NOTIFICATION_LIST_MISSED_SECTION_HEADER_PERSONAL");
      goto LABEL_12;
    case 6:
      NCUserNotificationsUIKitFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("NOTIFICATION_LIST_MISSED_SECTION_HEADER_READING");
      goto LABEL_12;
    case 7:
      NCUserNotificationsUIKitFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("NOTIFICATION_LIST_MISSED_SECTION_HEADER_GAMING");
      goto LABEL_12;
    case 8:
      NCUserNotificationsUIKitFrameworkBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("NOTIFICATION_LIST_MISSED_SECTION_HEADER_MINDFULNESS");
LABEL_12:
      objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E8D21F60, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v9 = (void *)MEMORY[0x1E0CB3940];
      NCUserNotificationsUIKitFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_MISSED_SECTION_HEADER_GENERAL"), &stru_1E8D21F60, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = (void *)v10;
      break;
  }

  return v12;
}

- (void)_migrateUpcomingMissedSectionToIncoming
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NCNotificationSummarizedSectionList *upcomingMissedSectionList;
  NCNotificationStructuredSectionList *prominentIncomingSectionList;
  NCNotificationSummarizedSectionList *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_upcomingMissedSectionList)
  {
    v3 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationStructuredSectionList logDescription](self->_upcomingMissedSectionList, "logDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationStructuredSectionList logDescription](self->_incomingSectionList, "logDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v5;
      v19 = 2114;
      v20 = v6;
      v21 = 2114;
      v22 = v7;
      _os_log_impl(&dword_1CFC3D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ migrating all notifications from %{public}@ to %{public}@", buf, 0x20u);

    }
    +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationSummarizedSectionList atxUUID](self->_upcomingMissedSectionList, "atxUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "missedBundleExpired:", v9);

    -[NCNotificationSummarizedSectionList summaryOrderProvider](self->_upcomingMissedSectionList, "summaryOrderProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "atxLogSummaryPlatterRemoval");

    upcomingMissedSectionList = self->_upcomingMissedSectionList;
    prominentIncomingSectionList = self->_prominentIncomingSectionList;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __65__NCNotificationRootList__migrateUpcomingMissedSectionToIncoming__block_invoke;
    v16[3] = &unk_1E8D1BF28;
    v16[4] = self;
    BYTE2(v14) = 1;
    LOWORD(v14) = 0;
    -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", upcomingMissedSectionList, prominentIncomingSectionList, 0, v16, 0, 0, v14);
    BYTE2(v15) = 1;
    LOWORD(v15) = 0;
    -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", self->_upcomingMissedSectionList, self->_incomingSectionList, 0, 0, 0, 0, v15);
    -[NCNotificationRootList _removeSectionListInHistorySectionList:animated:](self, "_removeSectionListInHistorySectionList:animated:", self->_upcomingMissedSectionList, -[NCNotificationRootList isNotificationHistoryRevealed](self, "isNotificationHistoryRevealed"));
    v13 = self->_upcomingMissedSectionList;
    self->_upcomingMissedSectionList = 0;

  }
}

uint64_t __65__NCNotificationRootList__migrateUpcomingMissedSectionToIncoming__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isProminentNotificationRequest:", a2) ^ 1;
}

- (void)_toggleUpcomingMissedSectionListVisibility
{
  -[NCNotificationRootList _toggleVisibilityInHistorySectionListForSectionList:atIndex:isSectionHidden:animated:](self, "_toggleVisibilityInHistorySectionListForSectionList:atIndex:isSectionHidden:animated:", self->_upcomingMissedSectionList, 0, 0, -[NCNotificationRootList isNotificationHistoryRevealed](self, "isNotificationHistoryRevealed"));
}

- (id)_newDigestSectionListWithTitle:(id)a3 sectionType:(unint64_t)a4 summaryOrderProvider:(id)a5 logDescription:(id)a6
{
  id v10;
  id v11;
  id v12;
  NCNotificationSummarizedInlineExpandingSectionList *v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = -[NCNotificationSummarizedInlineExpandingSectionList initWithTitle:sectionType:]([NCNotificationSummarizedInlineExpandingSectionList alloc], "initWithTitle:sectionType:", v12, a4);

  -[NCNotificationRootList notificationSummaryCache](self, "notificationSummaryCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationRootList _configureNotificationSectionList:notificationCache:notificationListViewRevealed:logDescription:](self, "_configureNotificationSectionList:notificationCache:notificationListViewRevealed:logDescription:", v13, v14, 1, v10);

  -[NCNotificationSummarizedSectionList setSummaryOrderProvider:](v13, "setSummaryOrderProvider:", v11);
  -[NCNotificationStructuredSectionList listView](v13, "listView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setGrouped:", 1);

  -[NCNotificationRootList _setRevealed:forSection:](self, "_setRevealed:forSection:", 1, v13);
  -[NCNotificationStructuredSectionList setSectionListDestination:](v13, "setSectionListDestination:", CFSTR("BulletinDestinationDigest"));
  return v13;
}

- (id)_newSummaryOrderProviderOfType:(unint64_t)a3 summaryHeading:(id)a4 summaryDate:(id)a5 atxDigestDeliveryTime:(int64_t)a6 isOnboardingSummary:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  void *v14;

  v7 = a7;
  v12 = a5;
  v13 = a4;
  +[NCNotificationSummaryOrderProvider notificationSummaryOrderProviderOfType:](NCNotificationSummaryOrderProvider, "notificationSummaryOrderProviderOfType:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOnboardingSummary:", v7);
  objc_msgSend(v14, "setDeviceAuthenticated:", -[NCNotificationRootList deviceAuthenticated](self, "deviceAuthenticated"));
  objc_msgSend(v14, "setSummaryHeading:", v13);

  objc_msgSend(v14, "setSummaryDate:", v12);
  objc_msgSend(v14, "setAtxDigestDeliveryTime:", a6);
  return v14;
}

- (id)_newSummaryOrderProviderOfType:(unint64_t)a3 fromSummaryOrderProvider:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v6 = a4;
  objc_msgSend(v6, "summaryHeading");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "summaryDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "atxDigestDeliveryTime");

  v10 = -[NCNotificationRootList _newSummaryOrderProviderOfType:summaryHeading:summaryDate:atxDigestDeliveryTime:isOnboardingSummary:](self, "_newSummaryOrderProviderOfType:summaryHeading:summaryDate:atxDigestDeliveryTime:isOnboardingSummary:", a3, v7, v8, v9, 0);
  return v10;
}

- (int64_t)_atxDigestDeliveryTimeForDeliveryOrder:(int64_t)a3
{
  if (a3)
    return a3 == 2;
  else
    return 2;
}

- (void)_configureUpcomingDigestSectionListWithDigestInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NCNotificationSummarizedSectionList *v12;
  NCNotificationSummarizedSectionList *upcomingDigestSectionList;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_upcomingDigestSectionList)
  {
    v5 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
      -[NCNotificationRootList _configureUpcomingDigestSectionListWithDigestInfo:].cold.1(v5, (uint64_t)self, (id *)&self->_upcomingDigestSectionList);
  }
  else
  {
    NCUserNotificationsUIKitFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_SUMMARY_HEADER_NEXT"), &stru_1E8D21F60, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheduleDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NCNotificationRootList _newSummaryOrderProviderOfType:summaryHeading:summaryDate:atxDigestDeliveryTime:isOnboardingSummary:](self, "_newSummaryOrderProviderOfType:summaryHeading:summaryDate:atxDigestDeliveryTime:isOnboardingSummary:", 2, v7, v8, -[NCNotificationRootList _atxDigestDeliveryTimeForDeliveryOrder:](self, "_atxDigestDeliveryTimeForDeliveryOrder:", objc_msgSend(v4, "deliveryOrder")), 0);

    NCUserNotificationsUIKitFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_SUMMARY_SECTION_TITLE_NEXT"), &stru_1E8D21F60, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NCNotificationRootList _newDigestSectionListWithTitle:sectionType:summaryOrderProvider:logDescription:](self, "_newDigestSectionListWithTitle:sectionType:summaryOrderProvider:logDescription:", v11, 5, v9, CFSTR("Upcoming Digest"));
    upcomingDigestSectionList = self->_upcomingDigestSectionList;
    self->_upcomingDigestSectionList = v12;

    v14 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationStructuredSectionList logDescription](self->_upcomingDigestSectionList, "logDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v16;
      v20 = 2114;
      v21 = v17;
      v22 = 2114;
      v23 = v4;
      _os_log_impl(&dword_1CFC3D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ configured new %{public}@ with digest info : %{public}@", (uint8_t *)&v18, 0x20u);

    }
  }

}

- (unint64_t)_upcomingDigestSectionListIndexInHistorySectionList
{
  return -[NCNotificationCombinedSectionList containsSectionList:](self->_historySectionList, "containsSectionList:", self->_upcomingMissedSectionList);
}

- (void)_toggleUpcomingDigestSectionListVisibility
{
  if (self->_upcomingDigestSectionList)
    -[NCNotificationRootList _toggleVisibilityInHistorySectionListForSectionList:atIndex:isSectionHidden:animated:](self, "_toggleVisibilityInHistorySectionListForSectionList:atIndex:isSectionHidden:animated:", self->_upcomingDigestSectionList, -[NCNotificationRootList _upcomingDigestSectionListIndexInHistorySectionList](self, "_upcomingDigestSectionListIndexInHistorySectionList"), -[NCNotificationRootList isUpcomingDigestVisible](self, "isUpcomingDigestVisible") ^ 1, -[NCNotificationRootList isNotificationHistoryRevealed](self, "isNotificationHistoryRevealed"));
}

- (void)_updateUpcomingDigestSectionListWithDigestInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NCNotificationSummarizedSectionList *upcomingDigestSectionList;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NCNotificationCombinedSectionList allNotificationRequests](self->_upcomingDigestSectionList, "allNotificationRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  -[NCNotificationRootList _removeSectionListInHistorySectionList:animated:](self, "_removeSectionListInHistorySectionList:animated:", self->_upcomingDigestSectionList, 0);
  upcomingDigestSectionList = self->_upcomingDigestSectionList;
  self->_upcomingDigestSectionList = 0;

  -[NCNotificationRootList _configureUpcomingDigestSectionListWithDigestInfo:](self, "_configureUpcomingDigestSectionListWithDigestInfo:", v4);
  v8 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[NCNotificationRootList logDescription](self, "logDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationStructuredSectionList logDescription](self->_upcomingDigestSectionList, "logDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v10;
    v24 = 2114;
    v25 = v11;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ replaced existing with new %{public}@ with digest info : %{public}@", buf, 0x20u);

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[NCNotificationSummarizedSectionList insertNotificationRequest:](self->_upcomingDigestSectionList, "insertNotificationRequest:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), (_QWORD)v17);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (void)_dissolveUpcomingDigestSectionListToHistorySection
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NCNotificationSummarizedSectionList *upcomingDigestSectionList;
  uint64_t v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_upcomingDigestSectionList)
  {
    v3 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationStructuredSectionList logDescription](self->_upcomingDigestSectionList, "logDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationStructuredSectionList logDescription](self->_historySectionList, "logDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v11 = v5;
      v12 = 2114;
      v13 = v6;
      v14 = 2114;
      v15 = v7;
      _os_log_impl(&dword_1CFC3D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ removing %{public}@ and moving all notifications to %{public}@", buf, 0x20u);

    }
    BYTE2(v9) = 1;
    LOWORD(v9) = 1;
    -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", self->_upcomingDigestSectionList, self->_historySectionList, 0, 0, 0, 1, v9);
    -[NCNotificationRootList _removeSectionListInHistorySectionList:animated:](self, "_removeSectionListInHistorySectionList:animated:", self->_upcomingDigestSectionList, 0);
    upcomingDigestSectionList = self->_upcomingDigestSectionList;
    self->_upcomingDigestSectionList = 0;

  }
}

- (void)_configureCurrentDigestSectionListWithDigestInfo:(id)a3 sectionType:(unint64_t)a4 summaryOrderProviderType:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NCNotificationSummarizedSectionList *v16;
  NCNotificationSummarizedSectionList *currentDigestSectionList;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (self->_currentDigestSectionList)
  {
    v10 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_ERROR))
      -[NCNotificationRootList _configureCurrentDigestSectionListWithDigestInfo:sectionType:summaryOrderProviderType:].cold.1(v10, (uint64_t)self, (id *)&self->_currentDigestSectionList);
  }
  else
  {
    objc_msgSend(v8, "headerString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scheduleDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NCNotificationRootList _newSummaryOrderProviderOfType:summaryHeading:summaryDate:atxDigestDeliveryTime:isOnboardingSummary:](self, "_newSummaryOrderProviderOfType:summaryHeading:summaryDate:atxDigestDeliveryTime:isOnboardingSummary:", a5, v11, v12, -[NCNotificationRootList _atxDigestDeliveryTimeForDeliveryOrder:](self, "_atxDigestDeliveryTimeForDeliveryOrder:", objc_msgSend(v9, "deliveryOrder")), a4 == 8);

    objc_msgSend(v9, "titleString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NCNotificationListSectionTypeString(a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[NCNotificationRootList _newDigestSectionListWithTitle:sectionType:summaryOrderProvider:logDescription:](self, "_newDigestSectionListWithTitle:sectionType:summaryOrderProvider:logDescription:", v14, a4, v13, v15);
    currentDigestSectionList = self->_currentDigestSectionList;
    self->_currentDigestSectionList = v16;

    v18 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationStructuredSectionList logDescription](self->_currentDigestSectionList, "logDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v20;
      v24 = 2114;
      v25 = v21;
      v26 = 2114;
      v27 = v9;
      _os_log_impl(&dword_1CFC3D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ configured new %{public}@ with digest info : %{public}@", (uint8_t *)&v22, 0x20u);

    }
  }

}

- (void)_insertCurrentDigestSectionList
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_currentDigestSectionList)
  {
    v3 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationStructuredSectionList logDescription](self->_currentDigestSectionList, "logDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v5;
      v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_1CFC3D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting %{public}@ to visible section", (uint8_t *)&v13, 0x16u);

    }
    -[NCNotificationRootList _notificationListSections](self, "_notificationListSections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "indexOfObject:", self->_incomingSectionList);
    -[NCNotificationRootList notificationSections](self, "notificationSections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "indexOfObject:", self->_incomingSectionList);

    -[NCNotificationSummarizedSectionList setDeviceAuthenticated:](self->_currentDigestSectionList, "setDeviceAuthenticated:", -[NCNotificationRootList deviceAuthenticated](self, "deviceAuthenticated"));
    -[NCNotificationRootList notificationSections](self, "notificationSections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertObject:atIndex:", self->_currentDigestSectionList, v10);

    -[NCNotificationRootList rootListView](self, "rootListView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertViewAtIndex:animated:", v8, 1);

    -[NCNotificationRootList _updateIndexForReveal](self, "_updateIndexForReveal");
    if (-[NCNotificationRootList currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting") == 2)
      -[NCNotificationRootList _setRevealed:forSection:](self, "_setRevealed:forSection:", -[NCNotificationRootList isNotificationHistoryRevealed](self, "isNotificationHistoryRevealed"), self->_currentDigestSectionList);
    -[NCNotificationRootList _updateDelegateAndSubclassIfNecessaryOfContentChange](self, "_updateDelegateAndSubclassIfNecessaryOfContentChange");

  }
}

- (void)_removeCurrentDigestSectionList
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_currentDigestSectionList)
  {
    v3 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationStructuredSectionList logDescription](self->_currentDigestSectionList, "logDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v5;
      v13 = 2114;
      v14 = v6;
      _os_log_impl(&dword_1CFC3D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ removing %{public}@ from visible section", (uint8_t *)&v11, 0x16u);

    }
    -[NCNotificationRootList _notificationListSections](self, "_notificationListSections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "indexOfObject:", self->_currentDigestSectionList);
    -[NCNotificationRootList notificationSections](self, "notificationSections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", self->_currentDigestSectionList);

    -[NCNotificationRootList rootListView](self, "rootListView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeViewAtIndex:animated:isHorizontallyDisplaced:", v8, 1, -[NCNotificationSummarizedSectionList isHorizontallyDisplaced](self->_currentDigestSectionList, "isHorizontallyDisplaced"));

    -[NCNotificationRootList _updateIndexForReveal](self, "_updateIndexForReveal");
    -[NCNotificationRootList _updateDelegateAndSubclassIfNecessaryOfContentChange](self, "_updateDelegateAndSubclassIfNecessaryOfContentChange");

  }
}

- (void)_insertCurrentDigestSectionListToSectionList:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  NCNotificationSummarizedSectionList *currentDigestSectionList;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  currentDigestSectionList = self->_currentDigestSectionList;
  if (currentDigestSectionList
    && -[NCNotificationCombinedSectionList count](currentDigestSectionList, "count")
    && (objc_msgSend(v6, "containsSectionList:", self->_currentDigestSectionList) & 1) == 0)
  {
    v8 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationStructuredSectionList logDescription](self->_currentDigestSectionList, "logDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138544130;
      v14 = v10;
      v15 = 2114;
      v16 = v11;
      v17 = 2114;
      v18 = v12;
      v19 = 2048;
      v20 = a4;
      _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting %{public}@ to %{public}@ at index %lu", (uint8_t *)&v13, 0x2Au);

    }
    objc_msgSend(v6, "insertNotificationSectionList:atIndex:animated:", self->_currentDigestSectionList, a4, -[NCNotificationRootList isNotificationHistoryRevealed](self, "isNotificationHistoryRevealed"));
  }

}

- (void)_removeCurrentDigestSectionListFromSectionList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_currentDigestSectionList && objc_msgSend(v4, "containsSectionList:"))
  {
    v6 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationStructuredSectionList logDescription](self->_currentDigestSectionList, "logDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v8;
      v13 = 2114;
      v14 = v9;
      v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_1CFC3D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ removing %{public}@ from %{public}@", (uint8_t *)&v11, 0x20u);

    }
    objc_msgSend(v5, "removeNotificationSectionList:animated:", self->_currentDigestSectionList, -[NCNotificationRootList isNotificationHistoryRevealed](self, "isNotificationHistoryRevealed"));
  }

}

- (void)_insertCurrentDigestSectionListToMissedSectionList
{
  id v3;

  -[NCNotificationRootList _insertCurrentDigestSectionListToSectionList:atIndex:](self, "_insertCurrentDigestSectionListToSectionList:atIndex:", self->_upcomingMissedSectionList, 0);
  -[NCNotificationSummarizedSectionList summaryOrderProvider](self->_upcomingMissedSectionList, "summaryOrderProvider");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateLeadingSummaryPlatterView");

}

- (void)_removeCurrentDigestSectionListFromMissedSectionList
{
  id v3;

  -[NCNotificationRootList _removeCurrentDigestSectionListFromSectionList:](self, "_removeCurrentDigestSectionListFromSectionList:", self->_upcomingMissedSectionList);
  -[NCNotificationSummarizedSectionList summaryOrderProvider](self->_upcomingMissedSectionList, "summaryOrderProvider");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateLeadingSummaryPlatterView");

}

- (void)_insertCurrentDigestSectionListToHistorySectionList
{
  NCNotificationSummarizedSectionList *currentDigestSectionList;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  currentDigestSectionList = self->_currentDigestSectionList;
  if (currentDigestSectionList
    && -[NCNotificationCombinedSectionList count](currentDigestSectionList, "count")
    && !-[NCNotificationCombinedSectionList containsSectionList:](self->_historySectionList, "containsSectionList:", self->_currentDigestSectionList))
  {
    v4 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationStructuredSectionList logDescription](self->_currentDigestSectionList, "logDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationStructuredSectionList logDescription](self->_historySectionList, "logDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543874;
      v10 = v6;
      v11 = 2114;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting %{public}@ to %{public}@ at chronologically", (uint8_t *)&v9, 0x20u);

    }
    -[NCNotificationCombinedSectionList insertNotificationSectionListChronologically:animated:](self->_historySectionList, "insertNotificationSectionListChronologically:animated:", self->_currentDigestSectionList, -[NCNotificationRootList isNotificationHistoryRevealed](self, "isNotificationHistoryRevealed"));
  }
}

- (void)_removeCurrentDigestSectionListFromHistorySectionList
{
  -[NCNotificationRootList _removeCurrentDigestSectionListFromSectionList:](self, "_removeCurrentDigestSectionListFromSectionList:", self->_historySectionList);
}

- (void)_removeCurrentDigestSectionListFromContainingSectionList
{
  void *v3;
  int v4;

  -[NCNotificationRootList notificationSections](self, "notificationSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", self->_currentDigestSectionList);

  if (v4)
  {
    -[NCNotificationRootList _removeCurrentDigestSectionList](self, "_removeCurrentDigestSectionList");
  }
  else if (-[NCNotificationCombinedSectionList containsSectionList:](self->_upcomingMissedSectionList, "containsSectionList:", self->_currentDigestSectionList))
  {
    -[NCNotificationRootList _removeCurrentDigestSectionListFromMissedSectionList](self, "_removeCurrentDigestSectionListFromMissedSectionList");
  }
  else if (-[NCNotificationCombinedSectionList containsSectionList:](self->_historySectionList, "containsSectionList:", self->_currentDigestSectionList))
  {
    -[NCNotificationRootList _removeCurrentDigestSectionListFromHistorySectionList](self, "_removeCurrentDigestSectionListFromHistorySectionList");
  }
}

- (void)_toggleCurrentDigestSectionListVisibility
{
  NCNotificationSummarizedSectionList *currentDigestSectionList;
  BOOL v4;
  NCNotificationSummarizedSectionList *v5;
  NCNotificationSummarizedSectionList *v6;

  if (!-[NCNotificationRootList isPerformingClearAll](self, "isPerformingClearAll"))
  {
    currentDigestSectionList = self->_currentDigestSectionList;
    if (currentDigestSectionList)
    {
      if (-[NCNotificationCombinedSectionList count](currentDigestSectionList, "count"))
      {
        -[NCNotificationRootList notificationSections](self, "notificationSections");
        v6 = (NCNotificationSummarizedSectionList *)objc_claimAutoreleasedReturnValue();
        if ((-[NCNotificationSummarizedSectionList containsObject:](v6, "containsObject:", self->_currentDigestSectionList) & 1) == 0&& !-[NCNotificationCombinedSectionList containsSectionList:](self->_historySectionList, "containsSectionList:", self->_currentDigestSectionList)&& !-[NCNotificationCombinedSectionList containsSectionList:](self->_upcomingMissedSectionList, "containsSectionList:", self->_currentDigestSectionList)&& -[NCNotificationCombinedSectionList count](self->_currentDigestSectionList, "count")&& (-[NCNotificationStructuredSectionList sectionType](self->_currentDigestSectionList, "sectionType") == 4|| -[NCNotificationStructuredSectionList sectionType](self->_currentDigestSectionList, "sectionType") == 8))
        {
          v4 = -[NCNotificationRootList deferCurrentDigestPresentationForPersistedDataLoad](self, "deferCurrentDigestPresentationForPersistedDataLoad");

          if (!v4)
          {
            -[NCNotificationSummarizedSectionList setDeviceAuthenticated:](self->_currentDigestSectionList, "setDeviceAuthenticated:", -[NCNotificationRootList deviceAuthenticated](self, "deviceAuthenticated"));
            -[NCNotificationRootList _insertCurrentDigestSectionList](self, "_insertCurrentDigestSectionList");
          }
          return;
        }
        v5 = v6;
      }
      else
      {
        -[NCNotificationRootList _removeCurrentDigestSectionListFromContainingSectionList](self, "_removeCurrentDigestSectionListFromContainingSectionList");
        v5 = self->_currentDigestSectionList;
        self->_currentDigestSectionList = 0;
      }

    }
  }
}

- (void)_toggleCurrentDigestSectionListVisibilityInHistorySection
{
  unint64_t v3;
  id v4;

  if (self->_currentDigestSectionList)
  {
    if (-[NCNotificationCombinedSectionList containsSectionList:](self->_historySectionList, "containsSectionList:")
      && !-[NCNotificationCombinedSectionList count](self->_currentDigestSectionList, "count"))
    {
      -[NCNotificationRootList _removeCurrentDigestSectionListFromHistorySectionList](self, "_removeCurrentDigestSectionListFromHistorySectionList");
    }
    else if (!-[NCNotificationCombinedSectionList containsSectionList:](self->_historySectionList, "containsSectionList:", self->_currentDigestSectionList))
    {
      -[NCNotificationRootList notificationSections](self, "notificationSections");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "containsObject:", self->_currentDigestSectionList) & 1) != 0
        || !-[NCNotificationCombinedSectionList count](self->_currentDigestSectionList, "count"))
      {

      }
      else
      {
        v3 = -[NCNotificationStructuredSectionList sectionType](self->_currentDigestSectionList, "sectionType");

        if (v3 == 6)
          -[NCNotificationRootList _insertCurrentDigestSectionListToHistorySectionList](self, "_insertCurrentDigestSectionListToHistorySectionList");
      }
    }
  }
}

- (void)_upgradeCurrentDigestSectionListForPromotionAboveFold
{
  NCNotificationSummarizedSectionList *currentDigestSectionList;
  void *v4;
  void *v5;
  id v6;
  id v7;

  currentDigestSectionList = self->_currentDigestSectionList;
  if (currentDigestSectionList)
  {
    -[NCNotificationSummarizedSectionList summaryOrderProvider](currentDigestSectionList, "summaryOrderProvider");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "summaryHeading");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "summaryDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NCNotificationRootList _newSummaryOrderProviderOfType:summaryHeading:summaryDate:atxDigestDeliveryTime:isOnboardingSummary:](self, "_newSummaryOrderProviderOfType:summaryHeading:summaryDate:atxDigestDeliveryTime:isOnboardingSummary:", 1, v4, v5, objc_msgSend(v7, "atxDigestDeliveryTime"), 0);

    -[NCNotificationSummarizedSectionList setSummaryOrderProvider:](self->_currentDigestSectionList, "setSummaryOrderProvider:", v6);
  }
}

- (void)_migrateUpcomingDigestSectionListToCurrentDigestSectionList
{
  os_log_t *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NCNotificationSummarizedSectionList *currentDigestSectionList;
  NCNotificationSummarizedSectionList **p_currentDigestSectionList;
  void *v10;
  void *v11;
  NCNotificationSummarizedSectionList *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NCNotificationSummarizedSectionList *upcomingDigestSectionList;
  os_log_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  os_log_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NCNotificationSummarizedSectionList *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (self->_upcomingDigestSectionList)
  {
    v3 = (os_log_t *)MEMORY[0x1E0DC5F90];
    v4 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationStructuredSectionList logDescription](self->_upcomingDigestSectionList, "logDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543618;
      v33 = v6;
      v34 = 2114;
      v35 = v7;
      _os_log_impl(&dword_1CFC3D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ moving %{public}@ to current digest", (uint8_t *)&v32, 0x16u);

    }
    p_currentDigestSectionList = &self->_currentDigestSectionList;
    currentDigestSectionList = self->_currentDigestSectionList;
    if (currentDigestSectionList
      && -[NCNotificationCombinedSectionList notificationCount](currentDigestSectionList, "notificationCount"))
    {
      -[NCNotificationRootList _dissolveCurrentDigestSectionListToHistorySection](self, "_dissolveCurrentDigestSectionListToHistorySection");
    }
    -[NCNotificationRootList _removeSectionListInHistorySectionList:animated:](self, "_removeSectionListInHistorySectionList:animated:", self->_upcomingDigestSectionList, 0);
    objc_storeStrong((id *)&self->_currentDigestSectionList, self->_upcomingDigestSectionList);
    if (-[NCNotificationRootList currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting") == 2)
      -[NCNotificationRootList _setRevealed:forSection:](self, "_setRevealed:forSection:", -[NCNotificationRootList isNotificationHistoryRevealed](self, "isNotificationHistoryRevealed"), self->_currentDigestSectionList);
    -[NCNotificationStructuredSectionList setLogDescription:](self->_currentDigestSectionList, "setLogDescription:", CFSTR("Current Digest"));
    -[NCNotificationRootList digestScheduleManager](self, "digestScheduleManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "previouslyScheduledDigestInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = self->_currentDigestSectionList;
    objc_msgSend(v11, "titleString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationStructuredSectionList setTitle:](v12, "setTitle:", v13);

    if (-[NCNotificationRootList isMissedSectionActive](self, "isMissedSectionActive"))
      v14 = 2;
    else
      v14 = 1;
    objc_msgSend(v11, "headerString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scheduleDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NCNotificationRootList _newSummaryOrderProviderOfType:summaryHeading:summaryDate:atxDigestDeliveryTime:isOnboardingSummary:](self, "_newSummaryOrderProviderOfType:summaryHeading:summaryDate:atxDigestDeliveryTime:isOnboardingSummary:", v14, v15, v16, -[NCNotificationRootList _atxDigestDeliveryTimeForDeliveryOrder:](self, "_atxDigestDeliveryTimeForDeliveryOrder:", objc_msgSend(v11, "deliveryOrder")), 0);

    -[NCNotificationSummarizedSectionList setSummaryOrderProvider:](self->_currentDigestSectionList, "setSummaryOrderProvider:", v17);
    -[NCNotificationStructuredSectionList setSectionType:](self->_currentDigestSectionList, "setSectionType:", 4);
    upcomingDigestSectionList = self->_upcomingDigestSectionList;
    self->_upcomingDigestSectionList = 0;

    if (-[NCNotificationCombinedSectionList notificationCount](self->_currentDigestSectionList, "notificationCount"))
    {
      -[NCNotificationRootList setDeferCurrentDigestPresentationForPersistedDataLoad:](self, "setDeferCurrentDigestPresentationForPersistedDataLoad:", 0);
      if (-[NCNotificationRootList _shouldInsertCurrentDigestIntoMissedSectionList](self, "_shouldInsertCurrentDigestIntoMissedSectionList"))
      {
        v19 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
        {
          v20 = v19;
          -[NCNotificationRootList logDescription](self, "logDescription");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NCNotificationStructuredSectionList logDescription](self->_currentDigestSectionList, "logDescription");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NCNotificationStructuredSectionList logDescription](self->_upcomingMissedSectionList, "logDescription");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 138543874;
          v33 = v21;
          v34 = 2114;
          v35 = v22;
          v36 = 2114;
          v37 = v23;
          _os_log_impl(&dword_1CFC3D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ moving %{public}@ to %{public}@ because missed section is active and exclusive.", (uint8_t *)&v32, 0x20u);

        }
        -[NCNotificationRootList _insertCurrentDigestSectionListToMissedSectionList](self, "_insertCurrentDigestSectionListToMissedSectionList");
      }
      else
      {
        -[NCNotificationRootList _insertCurrentDigestSectionList](self, "_insertCurrentDigestSectionList");
      }
      -[NCNotificationSummarizedSectionList summaryOrderProvider](self->_currentDigestSectionList, "summaryOrderProvider");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "atxLogSummaryPlatterShownIsUpcoming:", 0);

      +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationSummarizedSectionList atxUUID](self->_currentDigestSectionList, "atxUUID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "digestAppeared:", v31);

      -[NCNotificationListMigrationScheduler setMigrationDateForNotificationDigest:](self->_migrationScheduler, "setMigrationDateForNotificationDigest:", 0);
    }
    else
    {
      v24 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v24;
        -[NCNotificationRootList logDescription](self, "logDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationStructuredSectionList logDescription](self->_currentDigestSectionList, "logDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138543618;
        v33 = v26;
        v34 = 2114;
        v35 = v27;
        _os_log_impl(&dword_1CFC3D000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ not presenting current digest %{public}@ because it has no notifications", (uint8_t *)&v32, 0x16u);

      }
      v28 = *p_currentDigestSectionList;
      *p_currentDigestSectionList = 0;

    }
  }
}

- (void)_migrateCurrentDigestSectionListToReadSection
{
  _BOOL4 v3;
  void *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_currentDigestSectionList
    && !-[NCNotificationCombinedSectionList containsSectionList:](self->_historySectionList, "containsSectionList:"))
  {
    v3 = -[NCNotificationRootList _isCurrentDigestListInMissedSectionList](self, "_isCurrentDigestListInMissedSectionList");
    v4 = (void *)*MEMORY[0x1E0DC5F90];
    v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        v6 = v4;
        -[NCNotificationRootList logDescription](self, "logDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationStructuredSectionList logDescription](self->_currentDigestSectionList, "logDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v7;
        v16 = 2114;
        v17 = v8;
        _os_log_impl(&dword_1CFC3D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ moving %{public}@ from missed section to history", (uint8_t *)&v14, 0x16u);

      }
      -[NCNotificationRootList _removeCurrentDigestSectionListFromMissedSectionList](self, "_removeCurrentDigestSectionListFromMissedSectionList");
    }
    else
    {
      if (v5)
      {
        v9 = v4;
        -[NCNotificationRootList logDescription](self, "logDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NCNotificationStructuredSectionList logDescription](self->_currentDigestSectionList, "logDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v10;
        v16 = 2114;
        v17 = v11;
        _os_log_impl(&dword_1CFC3D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ moving %{public}@ from visible section to history", (uint8_t *)&v14, 0x16u);

      }
      -[NCNotificationRootList _removeCurrentDigestSectionList](self, "_removeCurrentDigestSectionList");
    }
    -[NCNotificationStructuredSectionList setLogDescription:](self->_currentDigestSectionList, "setLogDescription:", CFSTR("Read Digest"));
    -[NCNotificationStructuredSectionList setSectionType:](self->_currentDigestSectionList, "setSectionType:", 6);
    -[NCNotificationSummarizedSectionList summaryOrderProvider](self->_currentDigestSectionList, "summaryOrderProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NCNotificationRootList _newSummaryOrderProviderOfType:fromSummaryOrderProvider:](self, "_newSummaryOrderProviderOfType:fromSummaryOrderProvider:", 2, v12);

    -[NCNotificationSummarizedSectionList setSummaryOrderProvider:](self->_currentDigestSectionList, "setSummaryOrderProvider:", v13);
    -[NCNotificationRootList _setRevealed:forSection:](self, "_setRevealed:forSection:", 1, self->_currentDigestSectionList);
    -[NCNotificationRootList _insertCurrentDigestSectionListToHistorySectionList](self, "_insertCurrentDigestSectionListToHistorySectionList");
    -[NCNotificationRootList _updateRevealCoordinator](self, "_updateRevealCoordinator");
    -[NCNotificationListMigrationScheduler setMigrationDateForNotificationDigest:](self->_migrationScheduler, "setMigrationDateForNotificationDigest:", 0);

  }
}

- (void)_dissolveCurrentDigestSectionListToHistorySection
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NCNotificationSummarizedSectionList *currentDigestSectionList;
  uint64_t v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_currentDigestSectionList)
  {
    v3 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      -[NCNotificationRootList logDescription](self, "logDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationStructuredSectionList logDescription](self->_currentDigestSectionList, "logDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCNotificationStructuredSectionList logDescription](self->_historySectionList, "logDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v13 = v5;
      v14 = 2114;
      v15 = v6;
      v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_1CFC3D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ removing %{public}@ and moving all notifications to %{public}@", buf, 0x20u);

    }
    -[NCNotificationRootList _removeCurrentDigestSectionListFromContainingSectionList](self, "_removeCurrentDigestSectionListFromContainingSectionList");
    BYTE2(v11) = 1;
    LOWORD(v11) = 1;
    -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", self->_currentDigestSectionList, self->_historySectionList, 0, 0, 0, 1, v11);
    +[NCNotificationEventTracker sharedInstance](NCNotificationEventTracker, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCNotificationSummarizedSectionList atxUUID](self->_currentDigestSectionList, "atxUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "digestExpired:", v9);

    currentDigestSectionList = self->_currentDigestSectionList;
    self->_currentDigestSectionList = 0;

  }
}

- (BOOL)_isCurrentDigestListAboveHistorySectionList
{
  NCNotificationRootList *v2;
  void *v3;

  if (!self->_currentDigestSectionList)
    return 0;
  v2 = self;
  -[NCNotificationRootList notificationSections](self, "notificationSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "containsObject:", v2->_currentDigestSectionList);

  return (char)v2;
}

- (BOOL)_isCurrentDigestListInHistorySectionList
{
  return self->_currentDigestSectionList
      && -[NCNotificationCombinedSectionList containsSectionList:](self->_historySectionList, "containsSectionList:");
}

- (BOOL)_isCurrentDigestListInMissedSectionList
{
  NCNotificationSummarizedSectionList *upcomingMissedSectionList;

  return self->_currentDigestSectionList
      && (upcomingMissedSectionList = self->_upcomingMissedSectionList) != 0
      && -[NCNotificationCombinedSectionList containsSectionList:](upcomingMissedSectionList, "containsSectionList:");
}

- (BOOL)_shouldInsertCurrentDigestIntoMissedSectionList
{
  int v3;
  void *v4;
  void *v5;

  v3 = -[NCNotificationRootList isMissedSectionActive](self, "isMissedSectionActive");
  -[NCNotificationRootList activeDNDModeConfiguration](self, "activeDNDModeConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 && v4)
    LOBYTE(v3) = objc_msgSend(v4, "nc_modeConfigurationHasExclusiveAppConfigurationType");

  return v3;
}

- (void)_addStateCaptureBlock
{
  id v2;
  id v3;
  id v4;
  id v5[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v2 = MEMORY[0x1E0C80D38];
  v5[1] = (id)MEMORY[0x1E0C809B0];
  v5[2] = (id)3221225472;
  v5[3] = __47__NCNotificationRootList__addStateCaptureBlock__block_invoke;
  v5[4] = &unk_1E8D1C518;
  objc_copyWeak(&v6, &location);
  v3 = (id)BSLogAddStateCaptureBlockWithTitle();

  objc_copyWeak(v5, &location);
  v4 = (id)BSLogAddStateCaptureBlockWithTitle();

  objc_destroyWeak(v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __47__NCNotificationRootList__addStateCaptureBlock__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "persistentStateManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_sectionsForStateDump");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "notificationListCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "migrationScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_listInfoForStateCapture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stateRepresentationForNotificationList:sectionLists:listCache:migrationScheduler:listInfo:detailed:", WeakRetained, v3, v4, v5, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __47__NCNotificationRootList__addStateCaptureBlock__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "overrideMigrationToHistory");
    NSStringFromBOOL();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setValue:forKey:", v3, CFSTR("OverrideMigrationToHistory"));

    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(WeakRetained, "overrideNotificationMigrateTimeSensitiveToHistoryTimeIntervalKey");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setValue:forKey:", v5, CFSTR("OverrideMigrateTimeSensitiveToHistoryTimeInterval"));

    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(WeakRetained, "overrideNotificationMigrateHighlightToHistoryTimeIntervalKey");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setValue:forKey:", v7, CFSTR("OverrideMigrateHighlightToHistoryTimeInterval"));

  }
  return v2;
}

- (id)_listInfoForStateCapture
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NCNotificationRootList _listInfoForPersistentState](self, "_listInfoForPersistentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addEntriesFromDictionary:", v4);
  if (self->_upcomingDigestSectionList)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NCNotificationRootList isUpcomingDigestVisible](self, "isUpcomingDigestVisible"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("isUpcomingDigestVisible"));

  }
  if (-[NCNotificationRootList isOnboardingSummaryVisible](self, "isOnboardingSummaryVisible"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NCNotificationRootList isOnboardingSummaryVisible](self, "isOnboardingSummaryVisible"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("isOnboardingDigestVisible"));

  }
  objc_msgSend(MEMORY[0x1E0DC6020], "stringForNotificationListDisplayStyleSetting:", -[NCNotificationRootList currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("currentListDisplayStyleSetting"));

  if (objc_msgSend(v3, "count"))
    v8 = v3;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (id)_sectionsForStateDump
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = v3;
  if (self->_incomingSectionList)
    objc_msgSend(v3, "addObject:");
  if (self->_currentDigestSectionList)
    objc_msgSend(v4, "addObject:");
  if (self->_upcomingDigestSectionList)
    objc_msgSend(v4, "addObject:");
  if (self->_upcomingMissedSectionList)
    objc_msgSend(v4, "addObject:");
  if (self->_historySectionList)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (id)_digestTestRecipe
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__NCNotificationRootList__digestTestRecipe__block_invoke;
  v4[3] = &unk_1E8D1B568;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__NCNotificationRootList__digestTestRecipe__block_invoke_177;
  v3[3] = &unk_1E8D1B568;
  objc_msgSend(MEMORY[0x1E0D83038], "recipeWithTitle:increaseAction:decreaseAction:", CFSTR("Notification Digest Promotion/Onboarding Suggestion"), v4, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __43__NCNotificationRootList__digestTestRecipe__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "_isCurrentDigestListAboveHistorySectionList") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "_isCurrentDigestListInMissedSectionList"))
  {
    v2 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(void **)(a1 + 32);
      v4 = v2;
      objc_msgSend(v3, "logDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v5;
      _os_log_impl(&dword_1CFC3D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ migrating current digest to Notification Center via test recipe", (uint8_t *)&v15, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "_migrateCurrentDigestSectionListToReadSection");
LABEL_6:
    objc_msgSend(*(id *)(a1 + 32), "_notificationListDidChangeContent");
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "upcomingDigestSectionList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 32);
      v10 = v8;
      objc_msgSend(v9, "logDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v11;
      _os_log_impl(&dword_1CFC3D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ promoting upcoming digest to current digest via test recipe", (uint8_t *)&v15, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "_migrateCurrentDigestSectionListToReadSection");
    objc_msgSend(*(id *)(a1 + 32), "_migrateUpcomingDigestSectionListToCurrentDigestSectionList");
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v12, "digestScheduleManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "upcomingScheduledDigestInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_configureUpcomingDigestSectionListWithDigestInfo:", v14);

    goto LABEL_6;
  }
}

uint64_t __43__NCNotificationRootList__digestTestRecipe__block_invoke_177(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)*MEMORY[0x1E0DC5F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "logDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CFC3D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ requests presenting digest onboarding platter via test recipe", (uint8_t *)&v7, 0xCu);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "isOnboardingSummaryVisible"))
    objc_msgSend(*(id *)(a1 + 32), "setOnboardingSummaryVisible:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_migrateCurrentDigestSectionListToReadSection");
  objc_msgSend(*(id *)(a1 + 32), "_dissolveCurrentDigestSectionListToHistorySection");
  return objc_msgSend(*(id *)(a1 + 32), "setOnboardingSummaryVisible:", 1);
}

- (id)_notificationMigrationOverrideTestRecipe
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__NCNotificationRootList__notificationMigrationOverrideTestRecipe__block_invoke;
  v4[3] = &unk_1E8D1B568;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__NCNotificationRootList__notificationMigrationOverrideTestRecipe__block_invoke_182;
  v3[3] = &unk_1E8D1B568;
  objc_msgSend(MEMORY[0x1E0D83038], "recipeWithTitle:increaseAction:decreaseAction:", CFSTR("Notification List History Migration Override [UP: Enable, DN: Disable]"), v4, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __66__NCNotificationRootList__notificationMigrationOverrideTestRecipe__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "overrideMigrationToHistory") & 1) == 0)
  {
    v2 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(void **)(a1 + 32);
      v4 = v2;
      objc_msgSend(v3, "logDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1CFC3D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ overriding notification migration to history via test recipe", (uint8_t *)&v7, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "setOverrideMigrationToHistory:", 1);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_updateOverrideMigrationOverlayLabelWithText:forOverrideState:", CFSTR("Overriding Notification Migration"), 1);
}

uint64_t __66__NCNotificationRootList__notificationMigrationOverrideTestRecipe__block_invoke_182(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "overrideMigrationToHistory"))
  {
    v2 = (void *)*MEMORY[0x1E0DC5F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F90], OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(void **)(a1 + 32);
      v4 = v2;
      objc_msgSend(v3, "logDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1CFC3D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ removing override for notification migration to history via test recipe", (uint8_t *)&v7, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "setOverrideMigrationToHistory:", 0);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_updateOverrideMigrationOverlayLabelWithText:forOverrideState:", CFSTR("Removing Notification Migration Override"), 0);
}

- (void)_configureOverrideMigrationOverlayLabelIfNecessary
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[NCNotificationRootList overrideMigrationOverlayLabel](self, "overrideMigrationOverlayLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[NCNotificationRootList rootListView](self, "rootListView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v13 = (id)objc_msgSend(v4, "initWithFrame:");

    objc_msgSend(v13, "setNumberOfLines:", 0);
    objc_msgSend(v13, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B50]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFont:", v6);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextColor:", v7);

    objc_msgSend(v13, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = 1041865114;
    objc_msgSend(v8, "setShadowOpacity:", v9);

    objc_msgSend(v13, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShadowRadius:", 5.0);

    objc_msgSend(v13, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShadowOffset:", 0.0, 2.0);

    -[NCNotificationRootList rootListView](self, "rootListView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v13);

    -[NCNotificationRootList setOverrideMigrationOverlayLabel:](self, "setOverrideMigrationOverlayLabel:", v13);
  }
}

- (void)_updateOverrideMigrationOverlayLabelWithText:(id)a3 forOverrideState:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  BOOL v10;
  _QWORD v11[5];

  v6 = a3;
  -[NCNotificationRootList _configureOverrideMigrationOverlayLabelIfNecessary](self, "_configureOverrideMigrationOverlayLabelIfNecessary");
  -[NCNotificationRootList overrideMigrationOverlayLabel](self, "overrideMigrationOverlayLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  -[NCNotificationRootList overrideMigrationOverlayLabel](self, "overrideMigrationOverlayLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", 0.0);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__NCNotificationRootList__updateOverrideMigrationOverlayLabelWithText_forOverrideState___block_invoke;
  v11[3] = &unk_1E8D1B568;
  v11[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __88__NCNotificationRootList__updateOverrideMigrationOverlayLabelWithText_forOverrideState___block_invoke_2;
  v9[3] = &unk_1E8D1C540;
  v9[4] = self;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v11, v9, 0.3, 0.0);
}

void __88__NCNotificationRootList__updateOverrideMigrationOverlayLabelWithText_forOverrideState___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "overrideMigrationOverlayLabel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __88__NCNotificationRootList__updateOverrideMigrationOverlayLabelWithText_forOverrideState___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  int v3;
  _QWORD v4[5];
  char v5;
  _QWORD v6[4];
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1 + 32), "overrideMigrationToHistory");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 == (_DWORD)result)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __88__NCNotificationRootList__updateOverrideMigrationOverlayLabelWithText_forOverrideState___block_invoke_3;
    v6[3] = &unk_1E8D1B568;
    v7 = *(_QWORD *)(a1 + 32);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __88__NCNotificationRootList__updateOverrideMigrationOverlayLabelWithText_forOverrideState___block_invoke_4;
    v4[3] = &unk_1E8D1C540;
    v4[4] = v7;
    v5 = v3;
    return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v6, v4, 1.0, 1.0);
  }
  return result;
}

void __88__NCNotificationRootList__updateOverrideMigrationOverlayLabelWithText_forOverrideState___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "overrideMigrationOverlayLabel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t __88__NCNotificationRootList__updateOverrideMigrationOverlayLabelWithText_forOverrideState___block_invoke_4(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = objc_msgSend(*(id *)(a1 + 32), "overrideMigrationToHistory");
  if (*(unsigned __int8 *)(a1 + 40) == (_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "overrideMigrationOverlayLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

    return objc_msgSend(*(id *)(a1 + 32), "setOverrideMigrationOverlayLabel:", 0);
  }
  return result;
}

- (void)setLogDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)deviceAuthenticated
{
  return self->_deviceAuthenticated;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (NCNotificationRootListDelegate)delegate
{
  return (NCNotificationRootListDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NCNotificationListViewProtocol)rootListView
{
  return self->_rootListView;
}

- (void)setRootListView:(id)a3
{
  objc_storeStrong((id *)&self->_rootListView, a3);
}

- (NCSuggestionManager)suggestionManager
{
  return self->_suggestionManager;
}

- (void)setSuggestionManager:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionManager, a3);
}

- (BOOL)isNotificationHistoryRevealed
{
  return self->_notificationHistoryRevealed;
}

- (NSMutableArray)notificationSections
{
  return self->_notificationSections;
}

- (void)setNotificationSections:(id)a3
{
  objc_storeStrong((id *)&self->_notificationSections, a3);
}

- (BOOL)isOnboardingSummaryVisible
{
  return self->_onboardingSummaryVisible;
}

- (DNDModeConfiguration)activeDNDModeConfiguration
{
  return self->_activeDNDModeConfiguration;
}

- (BOOL)expandsVisibleRegionOnSignificantScroll
{
  return self->_expandsVisibleRegionOnSignificantScroll;
}

- (void)setExpandsVisibleRegionOnSignificantScroll:(BOOL)a3
{
  self->_expandsVisibleRegionOnSignificantScroll = a3;
}

- (NCNotificationListCache)notificationListCache
{
  return self->_notificationListCache;
}

- (void)setNotificationListCache:(id)a3
{
  objc_storeStrong((id *)&self->_notificationListCache, a3);
}

- (NCNotificationListCache)notificationSummaryCache
{
  return self->_notificationSummaryCache;
}

- (void)setNotificationSummaryCache:(id)a3
{
  objc_storeStrong((id *)&self->_notificationSummaryCache, a3);
}

- (NCNotificationListCache)supplementaryCache
{
  return self->_supplementaryCache;
}

- (void)setSupplementaryCache:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryCache, a3);
}

- (NCNotificationListStalenessEventTracker)notificationListStalenessEventTracker
{
  return self->_notificationListStalenessEventTracker;
}

- (void)setNotificationListStalenessEventTracker:(id)a3
{
  objc_storeStrong((id *)&self->_notificationListStalenessEventTracker, a3);
}

- (BOOL)isMissedSectionActive
{
  return self->_missedSectionActive;
}

- (void)setMissedSectionActive:(BOOL)a3
{
  self->_missedSectionActive = a3;
}

- (BOOL)isScheduledDeliveryEnabled
{
  return self->_scheduledDeliveryEnabled;
}

- (NCNotificationListPersistentStateManager)persistentStateManager
{
  return self->_persistentStateManager;
}

- (void)setPersistentStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_persistentStateManager, a3);
}

- (NSMutableArray)supplementaryViewsSections
{
  return self->_supplementaryViewsSections;
}

- (void)setSupplementaryViewsSections:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryViewsSections, a3);
}

- (BOOL)isPerformingClearAll
{
  return self->_performingClearAll;
}

- (void)setPerformingClearAll:(BOOL)a3
{
  self->_performingClearAll = a3;
}

- (NSMutableSet)loadedNotificationSections
{
  return self->_loadedNotificationSections;
}

- (void)setLoadedNotificationSections:(id)a3
{
  objc_storeStrong((id *)&self->_loadedNotificationSections, a3);
}

- (NCNotificationStructuredSectionList)highlightedSectionList
{
  return self->_highlightedSectionList;
}

- (void)setHighlightedSectionList:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedSectionList, a3);
}

- (NCNotificationStructuredSectionList)prominentIncomingSectionList
{
  return self->_prominentIncomingSectionList;
}

- (void)setProminentIncomingSectionList:(id)a3
{
  objc_storeStrong((id *)&self->_prominentIncomingSectionList, a3);
}

- (NCNotificationStructuredSectionList)incomingSectionList
{
  return self->_incomingSectionList;
}

- (void)setIncomingSectionList:(id)a3
{
  objc_storeStrong((id *)&self->_incomingSectionList, a3);
}

- (NCNotificationCombinedSectionList)historySectionList
{
  return self->_historySectionList;
}

- (void)setHistorySectionList:(id)a3
{
  objc_storeStrong((id *)&self->_historySectionList, a3);
}

- (NCNotificationSummarizedSectionList)currentDigestSectionList
{
  return self->_currentDigestSectionList;
}

- (void)setCurrentDigestSectionList:(id)a3
{
  objc_storeStrong((id *)&self->_currentDigestSectionList, a3);
}

- (NCNotificationSummarizedSectionList)upcomingDigestSectionList
{
  return self->_upcomingDigestSectionList;
}

- (void)setUpcomingDigestSectionList:(id)a3
{
  objc_storeStrong((id *)&self->_upcomingDigestSectionList, a3);
}

- (NCNotificationSummarizedSectionList)upcomingMissedSectionList
{
  return self->_upcomingMissedSectionList;
}

- (void)setUpcomingMissedSectionList:(id)a3
{
  objc_storeStrong((id *)&self->_upcomingMissedSectionList, a3);
}

- (NCDigestScheduleManager)digestScheduleManager
{
  return self->_digestScheduleManager;
}

- (void)setDigestScheduleManager:(id)a3
{
  objc_storeStrong((id *)&self->_digestScheduleManager, a3);
}

- (BOOL)deferCurrentDigestPresentationForPersistedDataLoad
{
  return self->_deferCurrentDigestPresentationForPersistedDataLoad;
}

- (void)setDeferCurrentDigestPresentationForPersistedDataLoad:(BOOL)a3
{
  self->_deferCurrentDigestPresentationForPersistedDataLoad = a3;
}

- (BOOL)isUpcomingDigestVisible
{
  return self->_upcomingDigestVisible;
}

- (void)setUpcomingDigestVisible:(BOOL)a3
{
  self->_upcomingDigestVisible = a3;
}

- (NCNotificationListMigrationScheduler)migrationScheduler
{
  return self->_migrationScheduler;
}

- (void)setMigrationScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_migrationScheduler, a3);
}

- (BOOL)deferDigestMigration
{
  return self->_deferDigestMigration;
}

- (void)setDeferDigestMigration:(BOOL)a3
{
  self->_deferDigestMigration = a3;
}

- (NSMutableArray)notificationRequestsPendingMigration
{
  return self->_notificationRequestsPendingMigration;
}

- (void)setNotificationRequestsPendingMigration:(id)a3
{
  objc_storeStrong((id *)&self->_notificationRequestsPendingMigration, a3);
}

- (NSDictionary)persistentStoredListInfo
{
  return self->_persistentStoredListInfo;
}

- (void)setPersistentStoredListInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSMutableDictionary)notificationListDisplayStyleSettingsForReason
{
  return self->_notificationListDisplayStyleSettingsForReason;
}

- (void)setNotificationListDisplayStyleSettingsForReason:(id)a3
{
  objc_storeStrong((id *)&self->_notificationListDisplayStyleSettingsForReason, a3);
}

- (BOOL)overrideMigrationToHistory
{
  return self->_overrideMigrationToHistory;
}

- (double)overrideNotificationMigrateHighlightToHistoryTimeIntervalKey
{
  return self->_overrideNotificationMigrateHighlightToHistoryTimeIntervalKey;
}

- (void)setOverrideNotificationMigrateHighlightToHistoryTimeIntervalKey:(double)a3
{
  self->_overrideNotificationMigrateHighlightToHistoryTimeIntervalKey = a3;
}

- (double)overrideNotificationMigrateTimeSensitiveToHistoryTimeIntervalKey
{
  return self->_overrideNotificationMigrateTimeSensitiveToHistoryTimeIntervalKey;
}

- (void)setOverrideNotificationMigrateTimeSensitiveToHistoryTimeIntervalKey:(double)a3
{
  self->_overrideNotificationMigrateTimeSensitiveToHistoryTimeIntervalKey = a3;
}

- (UILabel)overrideMigrationOverlayLabel
{
  return self->_overrideMigrationOverlayLabel;
}

- (void)setOverrideMigrationOverlayLabel:(id)a3
{
  objc_storeStrong((id *)&self->_overrideMigrationOverlayLabel, a3);
}

- (BOOL)isListDisplayStyleHiddenForUserInteraction
{
  return self->_listDisplayStyleHiddenForUserInteraction;
}

- (void)setListDisplayStyleHiddenForUserInteraction:(BOOL)a3
{
  self->_listDisplayStyleHiddenForUserInteraction = a3;
}

- (void)setAggregatedVisibleContentExtent:(CGRect)a3
{
  self->_aggregatedVisibleContentExtent = a3;
}

- (BOOL)isGlobalIntelligentSummarizationEnabled
{
  return self->_globalIntelligentSummarizationEnabled;
}

- (void)setGlobalIntelligentSummarizationEnabled:(BOOL)a3
{
  self->_globalIntelligentSummarizationEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideMigrationOverlayLabel, 0);
  objc_storeStrong((id *)&self->_notificationListDisplayStyleSettingsForReason, 0);
  objc_storeStrong((id *)&self->_persistentStoredListInfo, 0);
  objc_storeStrong((id *)&self->_notificationRequestsPendingMigration, 0);
  objc_storeStrong((id *)&self->_migrationScheduler, 0);
  objc_storeStrong((id *)&self->_digestScheduleManager, 0);
  objc_storeStrong((id *)&self->_upcomingMissedSectionList, 0);
  objc_storeStrong((id *)&self->_upcomingDigestSectionList, 0);
  objc_storeStrong((id *)&self->_currentDigestSectionList, 0);
  objc_storeStrong((id *)&self->_historySectionList, 0);
  objc_storeStrong((id *)&self->_incomingSectionList, 0);
  objc_storeStrong((id *)&self->_prominentIncomingSectionList, 0);
  objc_storeStrong((id *)&self->_highlightedSectionList, 0);
  objc_storeStrong((id *)&self->_loadedNotificationSections, 0);
  objc_storeStrong((id *)&self->_supplementaryViewsSections, 0);
  objc_storeStrong((id *)&self->_persistentStateManager, 0);
  objc_storeStrong((id *)&self->_notificationListStalenessEventTracker, 0);
  objc_storeStrong((id *)&self->_supplementaryCache, 0);
  objc_storeStrong((id *)&self->_notificationSummaryCache, 0);
  objc_storeStrong((id *)&self->_notificationListCache, 0);
  objc_storeStrong((id *)&self->_activeDNDModeConfiguration, 0);
  objc_storeStrong((id *)&self->_notificationSections, 0);
  objc_storeStrong((id *)&self->_suggestionManager, 0);
  objc_storeStrong((id *)&self->_rootListView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logDescription, 0);
  objc_storeStrong((id *)&self->_currentListDisplayStyleSetting, 0);
}

- (id)initForTesting
{
  NCNotificationListView *v3;
  NCNotificationRootList *v4;

  v3 = -[NCNotificationListView initWithModelType:purpose:]([NCNotificationListView alloc], "initWithModelType:purpose:", objc_opt_class(), CFSTR("Testing"));
  v4 = -[NCNotificationRootList initWithListView:](self, "initWithListView:", v3);

  return v4;
}

- (void)testPromoteUpcomingDigestToCurrentDigest
{
  -[NCNotificationRootList _migrateUpcomingDigestSectionListToCurrentDigestSectionList](self, "_migrateUpcomingDigestSectionListToCurrentDigestSectionList");
  -[NCNotificationRootList _notificationListDidChangeContent](self, "_notificationListDidChangeContent");
}

- (void)testDigestTimerFired
{
  void *v3;
  id v4;

  -[NCNotificationRootList digestScheduleManager](self, "digestScheduleManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "upcomingScheduledDigestInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[NCNotificationRootList publishScheduledDigest:upcomingDigest:](self, "publishScheduledDigest:upcomingDigest:", v4, v4);
}

- (void)testDigestTimerUpdated
{
  void *v3;
  id v4;

  -[NCNotificationRootList digestScheduleManager](self, "digestScheduleManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "upcomingScheduledDigestInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[NCNotificationRootList publishUpcomingDigest:](self, "publishUpcomingDigest:", v4);
}

- (void)testDigestTimerRevoke
{
  void *v3;
  id v4;

  -[NCNotificationRootList digestScheduleManager](self, "digestScheduleManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "upcomingScheduledDigestInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[NCNotificationRootList revokeUpcomingDigest:](self, "revokeUpcomingDigest:", v4);
}

- (void)testClearPersistentStateManagerForTesting
{
  -[NCNotificationRootList setPersistentStateManager:](self, "setPersistentStateManager:", 0);
}

- (void)setOnboardingSummaryVisible:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4(), "logDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1(&dword_1CFC3D000, v3, v4, "%{public}@ not creating onboarding summary because notification count is %lu", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_0_0();
}

- (void)setOnboardingSummaryVisible:(void *)a1 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = OUTLINED_FUNCTION_2(a1);
  objc_msgSend(a2, "logDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1CFC3D000, v3, OS_LOG_TYPE_ERROR, "%{public}@ tried to create onboarding summary while a current digest already exists!", (uint8_t *)&v5, 0xCu);

}

- (void)removeNotificationRequest:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = OUTLINED_FUNCTION_2(a1);
  objc_msgSend(a2, "logDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_4(), "notificationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "un_logDigest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a2;
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1CFC3D000, v3, OS_LOG_TYPE_ERROR, "%{public}@ notification request %{public}@ has empty requestDestinations! Please check with client or UN.", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_0_0();
}

void __91__NCNotificationRootList__higherSectionToElevateForNotificationRequest_currentSectionType___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_7(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_4(), "logDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_1CFC3D000, v4, v5, "%{public}@ Can't map %{public}@ to NCNotificationListSectionType enum!", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0_0();
}

- (void)_configureUpcomingDigestSectionListWithDigestInfo:(id *)a3 .cold.1(void *a1, uint64_t a2, id *a3)
{
  void *v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4(), "logDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a3, "logDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1CFC3D000, v7, v8, "%{public}@ configuring a new upcoming section while one already exists %{public}@", v9, v10, v11, v12, 2u);

  OUTLINED_FUNCTION_0_0();
}

- (void)_configureCurrentDigestSectionListWithDigestInfo:(void *)a1 sectionType:(uint64_t)a2 summaryOrderProviderType:(id *)a3 .cold.1(void *a1, uint64_t a2, id *a3)
{
  void *v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4(), "logDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a3, "logDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1CFC3D000, v7, v8, "%{public}@ configuring a new current digest section while one already exists %{public}@", v9, v10, v11, v12, 2u);

  OUTLINED_FUNCTION_0_0();
}

@end
