@implementation BYFlowSkipController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_14);
  return (id)sharedInstance__instance;
}

void __38__BYFlowSkipController_sharedInstance__block_invoke()
{
  BYFlowSkipController *v0;
  void *v1;

  v0 = objc_alloc_init(BYFlowSkipController);
  v1 = (void *)sharedInstance__instance;
  sharedInstance__instance = (uint64_t)v0;

}

- (id)_followUpController
{
  BYFlowSkipController *v2;
  uint64_t v3;
  FLFollowUpController *followUpController_doNotAccessDirectly;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_followUpController_doNotAccessDirectly)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D15E30]), "initWithClientIdentifier:", CFSTR("com.apple.purplebuddy"));
    followUpController_doNotAccessDirectly = v2->_followUpController_doNotAccessDirectly;
    v2->_followUpController_doNotAccessDirectly = (FLFollowUpController *)v3;

  }
  objc_sync_exit(v2);

  return v2->_followUpController_doNotAccessDirectly;
}

- (BYFlowSkipController)init
{
  BYFlowSkipController *v2;
  BYCapabilities *v3;
  BYCapabilities *capabilities;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BYFlowSkipController;
  v2 = -[BYFlowSkipController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(BYCapabilities);
    capabilities = v2->_capabilities;
    v2->_capabilities = v3;

  }
  return v2;
}

- (void)setBasicFunctionalityEnabled:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  _basicFunctionalityEnabled_doNotAccessDirectly = a3;
  _BYLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = _basicFunctionalityEnabled_doNotAccessDirectly;
    _os_log_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_DEFAULT, "Flow skip basic functionality enabled: %d", (uint8_t *)v6, 8u);
  }

  objc_sync_exit(v4);
}

- (BOOL)_isBasicFunctionalityEnabled
{
  void *v2;
  char v3;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  v3 = _basicFunctionalityEnabled_doNotAccessDirectly;
  objc_sync_exit(v2);

  return v3;
}

+ (id)_supportedIdentifiers
{
  if (_supportedIdentifiers_onceToken != -1)
    dispatch_once(&_supportedIdentifiers_onceToken, &__block_literal_global_24);
  return (id)_supportedIdentifiers__identifiers;
}

void __45__BYFlowSkipController__supportedIdentifiers__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[7];

  v4[6] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("siri");
  v4[1] = CFSTR("applePay");
  v4[2] = CFSTR("appleID");
  v4[3] = CFSTR("passcode");
  v4[4] = CFSTR("touchID");
  v4[5] = CFSTR("faceID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_supportedIdentifiers__identifiers;
  _supportedIdentifiers__identifiers = v2;

}

- (void)didSkipFlow:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[BYFlowSkipController _supportedIdentifiers](BYFlowSkipController, "_supportedIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (!v6)
  {
    _BYLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BYFlowSkipController didSkipFlow:].cold.1((uint64_t)v4, v7, v15);
    goto LABEL_12;
  }
  if (-[BYFlowSkipController _isBasicFunctionalityEnabled](self, "_isBasicFunctionalityEnabled"))
  {
    -[BYFlowSkipController _pendingFollowUpItem](self, "_pendingFollowUpItem");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject actions](v7, "actions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      -[NSObject actions](v7, "actions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("flowSkipIdentifiers"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        if ((objc_msgSend(v13, "containsObject:", v4) & 1) == 0)
        {
          objc_msgSend(v13, "arrayByAddingObject:", v4);
          v14 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v14;
        }
        goto LABEL_11;
      }
    }
    else
    {
      v10 = 0;
    }
    v16[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    -[BYFlowSkipController _postFollowUpItemForFlowSkipIdentifiers:previousFollowUpItem:forceNotification:](self, "_postFollowUpItemForFlowSkipIdentifiers:previousFollowUpItem:forceNotification:", v13, v7, 0);

LABEL_12:
  }

}

- (void)didCompleteFlow:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[BYFlowSkipController _supportedIdentifiers](BYFlowSkipController, "_supportedIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (!v6)
  {
    _BYLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BYFlowSkipController didSkipFlow:].cold.1((uint64_t)v4, v7, v14);
    goto LABEL_16;
  }
  if (-[BYFlowSkipController _isBasicFunctionalityEnabled](self, "_isBasicFunctionalityEnabled"))
  {
    -[BYFlowSkipController _pendingFollowUpItem](self, "_pendingFollowUpItem");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject actions](v7, "actions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("flowSkipIdentifiers"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "containsObject:", v4))
    {
      if (v11)
      {
        v12 = (void *)objc_msgSend(v11, "mutableCopy");
        objc_msgSend(v12, "removeObject:", v4);
        v13 = objc_msgSend(v12, "copy");

        v11 = (void *)v13;
      }
      if (objc_msgSend(v11, "count"))
      {
        -[BYFlowSkipController _postFollowUpItemForFlowSkipIdentifiers:previousFollowUpItem:forceNotification:](self, "_postFollowUpItemForFlowSkipIdentifiers:previousFollowUpItem:forceNotification:", v11, v7, 0);
      }
      else
      {
        -[BYFlowSkipController _followUpController](self, "_followUpController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = CFSTR("com.apple.purplebuddy.revisitSkippedSteps");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0;
        v17 = objc_msgSend(v15, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:", v16, &v24);
        v18 = v24;

        _BYLoggingFacility();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v17)
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A4E92000, v20, OS_LOG_TYPE_DEFAULT, "Cleared obsoleted follow up items", buf, 2u);
          }
        }
        else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          if ((_BYIsInternalInstall() & 1) != 0)
          {
            v21 = 0;
            v22 = v18;
          }
          else if (v18)
          {
            v23 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v18, "domain");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v16, objc_msgSend(v18, "code"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = 1;
          }
          else
          {
            v21 = 0;
            v22 = 0;
          }
          *(_DWORD *)buf = 138543362;
          v26 = v22;
          _os_log_error_impl(&dword_1A4E92000, v20, OS_LOG_TYPE_ERROR, "Failed to clear obsoleted follow up items: %{public}@", buf, 0xCu);
          if (v21)
          {

          }
        }

      }
    }

LABEL_16:
  }

}

- (void)cancelPendingFlows
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (-[BYFlowSkipController _isBasicFunctionalityEnabled](self, "_isBasicFunctionalityEnabled"))
  {
    -[BYFlowSkipController _followUpController](self, "_followUpController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = CFSTR("com.apple.purplebuddy.revisitSkippedSteps");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v5 = objc_msgSend(v3, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:", v4, &v12);
    v6 = v12;

    _BYLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4E92000, v8, OS_LOG_TYPE_DEFAULT, "Cleared pending follow up items", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v9 = 0;
        v10 = v6;
      }
      else if (v6)
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "domain");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v4, objc_msgSend(v6, "code"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 1;
      }
      else
      {
        v9 = 0;
        v10 = 0;
      }
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_log_error_impl(&dword_1A4E92000, v8, OS_LOG_TYPE_ERROR, "Failed to clear pending follow up items: %{public}@", buf, 0xCu);
      if (v9)
      {

      }
    }

  }
}

- (id)_pendingFollowUpItem
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[BYFlowSkipController _followUpController](self, "_followUpController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v2, "pendingFollowUpItems:", &v20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v20;

  if (v4)
  {
    _BYLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[BYFlowSkipController _pendingFollowUpItem].cold.1(v4, v5);

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "uniqueIdentifier", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.purplebuddy.revisitSkippedSteps"));

        if (v13)
        {
          v14 = v11;
          goto LABEL_15;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_15:

  return v14;
}

- (void)_postFollowUpItemForFlowSkipIdentifiers:(id)a3 previousFollowUpItem:(id)a4 forceNotification:(BOOL)a5
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  int v44;
  id v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  _BOOL4 v55;
  BYFlowSkipController *v56;
  id v57;
  uint8_t buf[4];
  id v59;
  void *v60;
  const __CFString *v61;
  _QWORD v62[2];

  v55 = a5;
  v62[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (objc_class *)MEMORY[0x1E0D15E38];
  v9 = a4;
  v10 = objc_alloc_init(v8);
  objc_msgSend(v10, "setUniqueIdentifier:", CFSTR("com.apple.purplebuddy.revisitSkippedSteps"));
  objc_msgSend(v10, "setGroupIdentifier:", *MEMORY[0x1E0D15DF0]);
  objc_msgSend(v10, "setTargetBundleIdentifier:", *MEMORY[0x1E0D15DD8]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_TITLE"), &stru_1E4E29440, CFSTR("FollowUp"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v12);

  -[BYFlowSkipController capabilities](self, "capabilities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v13, "supportsPearl");

  v56 = self;
  if ((_DWORD)v12)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = CFSTR("FOLLOWUP_DETAIL_FACEID");
  }
  else
  {
    -[BYFlowSkipController capabilities](self, "capabilities");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "mgHasMesa");

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v18)
      v16 = CFSTR("FOLLOWUP_DETAIL_TOUCHID");
    else
      v16 = CFSTR("FOLLOWUP_DETAIL");
  }
  objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_1E4E29440, CFSTR("FollowUp"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setInformativeText:", v19);
  objc_msgSend(v10, "setDisplayStyle:", 0);
  objc_msgSend(v9, "userInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("initialPostDate"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v23 = v22;
    objc_msgSend(v21, "doubleValue");
    v25 = v23 - v24;
  }
  else
  {
    v26 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v26, "numberWithDouble:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0.0;
  }
  v61 = CFSTR("initialPostDate");
  v62[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUserInfo:", v27);

  +[BYFlowSkipController _actionForFlowSkipIdentifiers:](BYFlowSkipController, "_actionForFlowSkipIdentifiers:", v7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActions:", v29);

  if (v25 < (double)-[BYFlowSkipController _timeIntervalForNotifications](self, "_timeIntervalForNotifications"))
  {
    v52 = v28;
    v53 = v19;
    v29 = objc_alloc_init(MEMORY[0x1E0D15E40]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_TITLE"), &stru_1E4E29440, CFSTR("FollowUp"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTitle:", v31);

    +[BYFlowSkipController _localizedStringListingFlowSkipIdentifiers:](BYFlowSkipController, "_localizedStringListingFlowSkipIdentifiers:", v7);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v7;
    v33 = objc_msgSend(v7, "count");
    v34 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v33 == 1)
      v37 = CFSTR("NOTIFICATION_DETAIL_FLOW");
    else
      v37 = CFSTR("NOTIFICATION_DETAIL_FLOWS");
    objc_msgSend(v35, "localizedStringForKey:value:table:", v37, &stru_1E4E29440, CFSTR("FollowUp"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringWithFormat:", v38, v32);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setInformativeText:", v39);

    objc_msgSend(v29, "setFrequency:", dbl_1A4ECFE00[v25 < (double)-[BYFlowSkipController _timeIntervalForFrequentNotifications](v56, "_timeIntervalForFrequentNotifications")]);
    objc_msgSend(v29, "setFirstNotificationDelay:", 3600.0);
    objc_msgSend(MEMORY[0x1E0D15E40], "defaultOptions");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setByAddingObject:", *MEMORY[0x1E0D15E20]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55)
    {
      objc_msgSend(v41, "setByAddingObject:", *MEMORY[0x1E0D15E10]);
      v42 = objc_claimAutoreleasedReturnValue();

      v41 = (void *)v42;
    }
    objc_msgSend(v29, "setOptions:", v41);
    objc_msgSend(v10, "setNotification:", v29);

    v19 = v53;
    v7 = v54;
    v28 = v52;
    self = v56;
  }
  -[BYFlowSkipController _followUpController](self, "_followUpController");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  v44 = objc_msgSend(v43, "postFollowUpItem:error:", v10, &v57);
  v45 = v57;

  _BYLoggingFacility();
  v46 = objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (v44)
  {
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v59 = v10;
      _os_log_impl(&dword_1A4E92000, v47, OS_LOG_TYPE_DEFAULT, "Posted new follow up item: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    v48 = v19;
    if ((_BYIsInternalInstall() & 1) != 0)
    {
      v49 = 0;
      v50 = v45;
    }
    else if (v45)
    {
      v51 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v45, "domain");
      v29 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v29, objc_msgSend(v45, "code"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 1;
    }
    else
    {
      v49 = 0;
      v50 = 0;
    }
    *(_DWORD *)buf = 138543362;
    v59 = v50;
    _os_log_error_impl(&dword_1A4E92000, v47, OS_LOG_TYPE_ERROR, "Failed to post new follow up item: %{public}@", buf, 0xCu);
    if (v49)
    {

    }
    v19 = v48;
  }

}

- (void)_repostExistingFollowUpItemForcingNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("flowSkipIdentifiers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
    -[BYFlowSkipController _postFollowUpItemForFlowSkipIdentifiers:previousFollowUpItem:forceNotification:](self, "_postFollowUpItemForFlowSkipIdentifiers:previousFollowUpItem:forceNotification:", v7, v8, 1);

}

+ (id)flowSkipIdentifiersFromFollowUpAction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[BYFlowSkipController _flowSkipIdentifierFromActionIdentifier:](BYFlowSkipController, "_flowSkipIdentifierFromActionIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", CFSTR("everything")))
  {
    objc_msgSend(v3, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("flowSkipIdentifiers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)_actionForFlowSkipIdentifiers:(id)a3
{
  id v3;
  id v4;
  void *v5;
  __CFString *v6;
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
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D15E28]);
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    objc_msgSend(v3, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[BYFlowSkipController _actionIdentifierForFlowSkipIdentifier:](BYFlowSkipController, "_actionIdentifierForFlowSkipIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIdentifier:", v8);

    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", CFSTR("FOLLOWUP_ACTION_LABEL.%@"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[BYFlowSkipController _actionIdentifierForFlowSkipIdentifier:](BYFlowSkipController, "_actionIdentifierForFlowSkipIdentifier:", CFSTR("everything"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIdentifier:", v5);
    v6 = CFSTR("FOLLOWUP_ACTION_LABEL_ALL");
  }

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", v6, &stru_1E4E29440, CFSTR("FollowUp"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", v11);

  v18 = CFSTR("flowSkipIdentifiers");
  v19[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInfo:", v12);

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("prefs:root=SETUP_FINISH&flow=%@"), v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLWithString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUrl:", v16);

  return v4;
}

+ (id)_actionIdentifierForFlowSkipIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.purplebuddy.revisitSkippedSteps"), a3);
}

+ (id)_flowSkipIdentifierFromActionIdentifier:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)passcodeDidChange
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[BYFlowSkipController _isPasscodeSet](self, "_isPasscodeSet"))
  {
    _BYLoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A4E92000, v3, OS_LOG_TYPE_DEFAULT, "A passcode is now set; removing finish setup passcode follow up item",
        v4,
        2u);
    }

    -[BYFlowSkipController didCompleteFlow:](self, "didCompleteFlow:", CFSTR("passcode"));
  }
}

- (BOOL)_isPasscodeSet
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeSet");

  return v3;
}

- (void)revisePendingFollowUpsForcingRepost:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  char v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  int v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  const __CFString *v43;
  uint8_t buf[4];
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v3 = a3;
  v47 = *MEMORY[0x1E0C80C00];
  -[BYFlowSkipController _pendingFollowUpItem](self, "_pendingFollowUpItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("flowSkipIdentifiers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "count"))
    goto LABEL_44;
  v37 = (void *)objc_msgSend(v9, "mutableCopy");
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v10 = v9;
  v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  v12 = v11 != 0;
  if (!v11)
    goto LABEL_29;
  v13 = v11;
  v34 = v11 != 0;
  v35 = v3;
  v36 = v9;
  v14 = 0;
  v15 = *(_QWORD *)v40;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v40 != v15)
        objc_enumerationMutation(v10);
      v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
      if (objc_msgSend(v17, "isEqualToString:", CFSTR("touchID")))
      {
        -[BYFlowSkipController capabilities](self, "capabilities");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "canShowTouchIDScreen");
      }
      else if (objc_msgSend(v17, "isEqualToString:", CFSTR("faceID")))
      {
        -[BYFlowSkipController capabilities](self, "capabilities");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "canShowFaceIDScreen");
      }
      else if (objc_msgSend(v17, "isEqualToString:", CFSTR("passcode")))
      {
        -[BYFlowSkipController capabilities](self, "capabilities");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "canShowPasscodeScreen");
      }
      else if (objc_msgSend(v17, "isEqualToString:", CFSTR("appleID")))
      {
        -[BYFlowSkipController capabilities](self, "capabilities");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "canShowAppleIDScreen");
      }
      else if (objc_msgSend(v17, "isEqualToString:", CFSTR("applePay")))
      {
        -[BYFlowSkipController capabilities](self, "capabilities");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "canShowPaymentScreen");
      }
      else
      {
        if (!objc_msgSend(v17, "isEqualToString:", CFSTR("siri")))
          continue;
        -[BYFlowSkipController capabilities](self, "capabilities");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "canShowSiriScreen");
      }
      v20 = v19;

      if ((v20 & 1) == 0)
      {
        objc_msgSend(v37, "removeObject:", v17);
        v14 = 1;
      }
    }
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  }
  while (v13);

  if ((v14 & 1) == 0)
  {
    v12 = 0;
    v9 = v36;
    v3 = v35;
    if (!v35)
      goto LABEL_35;
    goto LABEL_32;
  }
  _BYLoggingFacility();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    -[NSObject componentsJoinedByString:](v10, "componentsJoinedByString:", CFSTR(","));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v45 = v22;
    _os_log_impl(&dword_1A4E92000, v21, OS_LOG_TYPE_DEFAULT, "Revising current flow skip identifiers: %{public}@", buf, 0xCu);

  }
  _BYLoggingFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  v9 = v36;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v37, "componentsJoinedByString:", CFSTR(","));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v45 = v23;
    _os_log_impl(&dword_1A4E92000, v10, OS_LOG_TYPE_DEFAULT, "New flow skip identifiers: %{public}@", buf, 0xCu);

  }
  v12 = v34;
  v3 = v35;
LABEL_29:

  if (v3)
  {
LABEL_32:
    _BYLoggingFacility();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E92000, v24, OS_LOG_TYPE_DEFAULT, "Forcing a repost of finish setup flows...", buf, 2u);
    }

  }
LABEL_35:
  if (objc_msgSend(v37, "count"))
  {
    if (v12 || v3)
      -[BYFlowSkipController _postFollowUpItemForFlowSkipIdentifiers:previousFollowUpItem:forceNotification:](self, "_postFollowUpItemForFlowSkipIdentifiers:previousFollowUpItem:forceNotification:", v37, v5, 0);
  }
  else
  {
    -[BYFlowSkipController _followUpController](self, "_followUpController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = CFSTR("com.apple.purplebuddy.revisitSkippedSteps");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v27 = objc_msgSend(v25, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:", v26, &v38);
    v28 = v38;

    _BYLoggingFacility();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v27)
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4E92000, v30, OS_LOG_TYPE_DEFAULT, "Cleared obsoleted follow up items", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v31 = 0;
        v32 = v28;
      }
      else if (v28)
      {
        v33 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v28, "domain");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v26, objc_msgSend(v28, "code"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 1;
      }
      else
      {
        v31 = 0;
        v32 = 0;
      }
      *(_DWORD *)buf = 138543362;
      v45 = v32;
      _os_log_error_impl(&dword_1A4E92000, v30, OS_LOG_TYPE_ERROR, "Failed to clear obsoleted follow up items: %{public}@", buf, 0xCu);
      if (v31)
      {

      }
    }

  }
LABEL_44:

}

+ (id)_localizedStringListingFlowSkipIdentifiers:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", v9, &stru_1E4E29440, CFSTR("FollowUp"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)observeFinishSetupTriggers
{
  -[BYFlowSkipController _persistInitialNetworkSSID](self, "_persistInitialNetworkSSID");
  -[BYFlowSkipController registerActivities](self, "registerActivities");
}

+ (void)_setShouldObserveChangeFromNetworkSSID:(id)a3
{
  id v3;

  if (a3)
    v3 = a3;
  else
    v3 = &unk_1E4E344D0;
  CFPreferencesSetAppValue(CFSTR("PBInitialNetworkSSID"), v3, CFSTR("com.apple.purplebuddy.notbackedup"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.purplebuddy.notbackedup"));
}

+ (BOOL)_shouldObserveChangeFromNetworkSSID:(id *)a3
{
  void *v4;

  CFPreferencesAppSynchronize(CFSTR("com.apple.purplebuddy.notbackedup"));
  v4 = (id)CFPreferencesCopyAppValue(CFSTR("PBInitialNetworkSSID"), CFSTR("com.apple.purplebuddy.notbackedup"));
  *a3 = v4;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      *a3 = 0;
  }
  return v4 != 0;
}

+ (void)_clearShouldObserveChangeFromNetworkSSID
{
  CFPreferencesSetAppValue(CFSTR("PBInitialNetworkSSID"), 0, CFSTR("com.apple.purplebuddy.notbackedup"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.purplebuddy.notbackedup"));
}

- (void)_persistInitialNetworkSSID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[BYFlowSkipController _pendingFollowUpItem](self, "_pendingFollowUpItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(getWFClientClass(), "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "interface");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentNetwork");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ssid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    _BYLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1A4E92000, v7, OS_LOG_TYPE_DEFAULT, "Finish setup observing changes from network SSID: %@", (uint8_t *)&v8, 0xCu);
    }

    +[BYFlowSkipController _setShouldObserveChangeFromNetworkSSID:](BYFlowSkipController, "_setShouldObserveChangeFromNetworkSSID:", v6);
  }

}

- (int64_t)_timeoutForWifiObserver
{
  return 3000;
}

- (int64_t)_timeIntervalForWifiObserver
{
  return 300;
}

- (void)_registerWiFiObserverActivityWithNeedsActivity:(BOOL)a3 handlerQueue:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BYFlowSkipController *v12;
  BOOL v13;

  v6 = a4;
  +[BYXPCActivityRegistrar sharedInstance](BYXPCActivityRegistrar, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0C80748];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__BYFlowSkipController__registerWiFiObserverActivityWithNeedsActivity_handlerQueue___block_invoke;
  v10[3] = &unk_1E4E27848;
  v13 = a3;
  v11 = v6;
  v12 = self;
  v9 = v6;
  objc_msgSend(v7, "registerActivityWithIdentifier:criteria:handler:", "com.apple.purplebuddy.finishsetup.wifiobserver", v8, v10);

}

void __84__BYFlowSkipController__registerWiFiObserverActivityWithNeedsActivity_handlerQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;
  char v10;

  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__BYFlowSkipController__registerWiFiObserverActivityWithNeedsActivity_handlerQueue___block_invoke_2;
  v7[3] = &unk_1E4E27820;
  v10 = *(_BYTE *)(a1 + 48);
  v8 = v3;
  v9 = v4;
  v5 = *(NSObject **)(a1 + 32);
  v7[4] = *(_QWORD *)(a1 + 40);
  v6 = v3;
  dispatch_async(v5, v7);

}

void __84__BYFlowSkipController__registerWiFiObserverActivityWithNeedsActivity_handlerQueue___block_invoke_2(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  xpc_object_t v11;
  int64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  uint64_t *v20;
  uint8_t *v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;

  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  if (!*(_BYTE *)(a1 + 56))
  {
    v3 = 0;
LABEL_9:
    +[BYXPCActivityRegistrar sharedInstance](BYXPCActivityRegistrar, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unregisterActivityWithIdentifier:", "com.apple.purplebuddy.finishsetup.wifiobserver");

    goto LABEL_18;
  }
  v28 = 0;
  v2 = +[BYFlowSkipController _shouldObserveChangeFromNetworkSSID:](BYFlowSkipController, "_shouldObserveChangeFromNetworkSSID:", &v28);
  v3 = v28;
  *((_BYTE *)v30 + 24) = v2;
  if (!v2)
  {
    _BYLoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_DEFAULT, "Will not monitor for Wi-Fi SSID changes for finish setup", buf, 2u);
    }

    if (!*((_BYTE *)v30 + 24))
      goto LABEL_9;
  }
  if (*(_QWORD *)(a1 + 48) == 2)
  {
    *(_QWORD *)buf = 0;
    v23 = buf;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__5;
    v26 = __Block_byref_object_dispose__5;
    v27 = (id)os_transaction_create();
    objc_msgSend(getWFClientClass(), "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __84__BYFlowSkipController__registerWiFiObserverActivityWithNeedsActivity_handlerQueue___block_invoke_77;
    v16[3] = &unk_1E4E277F8;
    v3 = v3;
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v17 = v3;
    v18 = v7;
    v20 = &v29;
    v19 = v8;
    v21 = buf;
    objc_msgSend(v6, "asyncCurrentNetwork:", v16);

    _Block_object_dispose(buf, 8);
    goto LABEL_18;
  }
  objc_msgSend(*(id *)(a1 + 40), "criteria");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v11, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
  v12 = objc_msgSend(*(id *)(a1 + 32), "_timeIntervalForWifiObserver");
  xpc_dictionary_set_int64(v11, (const char *)*MEMORY[0x1E0C807A8], v12);
  if (v10 && xpc_equal(v10, v11))
  {
    _BYLoggingFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v14 = "finish setup wifi observer check-in already had correct criteria";
LABEL_16:
      _os_log_impl(&dword_1A4E92000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setCriteria:", v11);
    _BYLoggingFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v14 = "finish setup wifi observer check-in did set criteria";
      goto LABEL_16;
    }
  }

LABEL_18:
  _BYLoggingFacility();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4E92000, v15, OS_LOG_TYPE_DEFAULT, "WiFi Handler Finished", buf, 2u);
  }

  _Block_object_dispose(&v29, 8);
}

void __84__BYFlowSkipController__registerWiFiObserverActivityWithNeedsActivity_handlerQueue___block_invoke_77(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "ssid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _BYLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v23 = 138412546;
    v24 = v5;
    v25 = 2112;
    v26 = v3;
    _os_log_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_DEFAULT, "finish setup wifi observer initial network ssid %@ current network ssid %@", (uint8_t *)&v23, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "_pendingFollowUpItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length") && (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v3) & 1) == 0)
  {
    _BYLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1A4E92000, v7, OS_LOG_TYPE_DEFAULT, "finish setup wifi observer will force notification", (uint8_t *)&v23, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "_repostExistingFollowUpItemForcingNotification:", v6);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    goto LABEL_16;
  objc_msgSend(v6, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("initialPostDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v11 = v10;
  objc_msgSend(v9, "doubleValue");
  v13 = v11 - v12;
  _BYLoggingFacility();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412290;
    v24 = (uint64_t)v15;
    _os_log_impl(&dword_1A4E92000, v14, OS_LOG_TYPE_DEFAULT, "finish setup wifi observer time interval since initial post %@", (uint8_t *)&v23, 0xCu);

  }
  if (v13 >= (double)objc_msgSend(*(id *)(a1 + 40), "_timeoutForWifiObserver"))
  {
    _BYLoggingFacility();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1A4E92000, v16, OS_LOG_TYPE_DEFAULT, "finish setup wifi observer beyond timeout", (uint8_t *)&v23, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
LABEL_16:
    _BYLoggingFacility();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1A4E92000, v17, OS_LOG_TYPE_DEFAULT, "finish setup wifi observer clearing initial network ssid", (uint8_t *)&v23, 2u);
    }

    +[BYFlowSkipController _clearShouldObserveChangeFromNetworkSSID](BYFlowSkipController, "_clearShouldObserveChangeFromNetworkSSID");
  }
  _BYLoggingFacility();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_msgSend(*(id *)(a1 + 48), "state");
    v23 = 134217984;
    v24 = v19;
    _os_log_impl(&dword_1A4E92000, v18, OS_LOG_TYPE_DEFAULT, "finish setup wifi observer did run. activity state %ld", (uint8_t *)&v23, 0xCu);
  }

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    +[BYXPCActivityRegistrar sharedInstance](BYXPCActivityRegistrar, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "unregisterActivityWithIdentifier:", "com.apple.purplebuddy.finishsetup.wifiobserver");

  }
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = 0;

}

- (void)registerActivities
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL8 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  BOOL v13;
  _QWORD v14[5];
  BOOL v15;
  uint8_t buf[16];

  -[BYFlowSkipController _pendingFollowUpItem](self, "_pendingFollowUpItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("initialPostDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _BYLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4E92000, v6, OS_LOG_TYPE_DEFAULT, "Registering XPC activities for finish setup...", buf, 2u);
  }

  if (registerActivities__onceToken != -1)
    dispatch_once(&registerActivities__onceToken, &__block_literal_global_80);
  v7 = v5 != 0;
  -[BYFlowSkipController _registerWiFiObserverActivityWithNeedsActivity:handlerQueue:](self, "_registerWiFiObserverActivityWithNeedsActivity:handlerQueue:", v7, registerActivities__activity_queue);
  +[BYXPCActivityRegistrar sharedInstance](BYXPCActivityRegistrar, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C80748];
  v10 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __42__BYFlowSkipController_registerActivities__block_invoke_2;
  v14[3] = &unk_1E4E27870;
  v14[4] = self;
  v15 = v7;
  objc_msgSend(v8, "registerActivityWithIdentifier:criteria:handler:", "com.apple.purplebuddy.finishsetup.firstreschedule", v9, v14);

  +[BYXPCActivityRegistrar sharedInstance](BYXPCActivityRegistrar, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __42__BYFlowSkipController_registerActivities__block_invoke_84;
  v12[3] = &unk_1E4E27870;
  v12[4] = self;
  v13 = v7;
  objc_msgSend(v11, "registerActivityWithIdentifier:criteria:handler:", "com.apple.purplebuddy.finishsetup.secondreschedule", v9, v12);

}

void __42__BYFlowSkipController_registerActivities__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.purplebuddy.finishsetup.xpcactivity", 0);
  v1 = (void *)registerActivities__activity_queue;
  registerActivities__activity_queue = (uint64_t)v0;

}

void __42__BYFlowSkipController_registerActivities__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;
  char v10;

  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  v5 = registerActivities__activity_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__BYFlowSkipController_registerActivities__block_invoke_3;
  v7[3] = &unk_1E4E27820;
  v8 = v3;
  v9 = v4;
  v7[4] = *(_QWORD *)(a1 + 32);
  v10 = *(_BYTE *)(a1 + 40);
  v6 = v3;
  dispatch_async(v5, v7);

}

void __42__BYFlowSkipController_registerActivities__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const char *v4;
  NSObject *v5;
  uint32_t v6;
  xpc_object_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 48) == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "revisePendingFollowUpsForcingRepost:", 1);
    _BYLoggingFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(*(id *)(a1 + 40), "state");
      v17 = 134217984;
      v18 = v3;
      v4 = "First finish setup reschedule ran; state is now %ld";
      v5 = v2;
      v6 = 12;
LABEL_14:
      _os_log_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v17, v6);
    }
  }
  else if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 40), "criteria");
    v2 = objc_claimAutoreleasedReturnValue();
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v7, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
    xpc_dictionary_set_int64(v7, (const char *)*MEMORY[0x1E0C80760], objc_msgSend(*(id *)(a1 + 32), "_timeIntervalForFrequentNotifications"));
    if (v2 && xpc_equal(v2, v7))
    {
      _BYLoggingFacility();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __42__BYFlowSkipController_registerActivities__block_invoke_3_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setCriteria:", v7);
      _BYLoggingFacility();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1A4E92000, v8, OS_LOG_TYPE_DEFAULT, "Updated first finish setup check-in", (uint8_t *)&v17, 2u);
      }
    }

  }
  else
  {
    +[BYXPCActivityRegistrar sharedInstance](BYXPCActivityRegistrar, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "unregisterActivityWithIdentifier:", "com.apple.purplebuddy.finishsetup.firstreschedule");

    _BYLoggingFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      v4 = "Unregistered first finish setup reschedule";
      v5 = v2;
      v6 = 2;
      goto LABEL_14;
    }
  }

}

void __42__BYFlowSkipController_registerActivities__block_invoke_84(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;
  char v10;

  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  v5 = registerActivities__activity_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__BYFlowSkipController_registerActivities__block_invoke_2_85;
  v7[3] = &unk_1E4E27820;
  v8 = v3;
  v9 = v4;
  v7[4] = *(_QWORD *)(a1 + 32);
  v10 = *(_BYTE *)(a1 + 40);
  v6 = v3;
  dispatch_async(v5, v7);

}

void __42__BYFlowSkipController_registerActivities__block_invoke_2_85(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const char *v4;
  NSObject *v5;
  uint32_t v6;
  xpc_object_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 48) == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "revisePendingFollowUpsForcingRepost:", 1);
    _BYLoggingFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_msgSend(*(id *)(a1 + 40), "state");
      v17 = 134217984;
      v18 = v3;
      v4 = "Second finish setup reschedule ran; state is now %ld";
      v5 = v2;
      v6 = 12;
LABEL_14:
      _os_log_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v17, v6);
    }
  }
  else if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 40), "criteria");
    v2 = objc_claimAutoreleasedReturnValue();
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v7, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
    xpc_dictionary_set_int64(v7, (const char *)*MEMORY[0x1E0C80760], objc_msgSend(*(id *)(a1 + 32), "_timeIntervalForNotifications"));
    if (v2 && xpc_equal(v2, v7))
    {
      _BYLoggingFacility();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __42__BYFlowSkipController_registerActivities__block_invoke_2_85_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setCriteria:", v7);
      _BYLoggingFacility();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1A4E92000, v8, OS_LOG_TYPE_DEFAULT, "Updated second finish setup check-in", (uint8_t *)&v17, 2u);
      }
    }

  }
  else
  {
    +[BYXPCActivityRegistrar sharedInstance](BYXPCActivityRegistrar, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "unregisterActivityWithIdentifier:", "com.apple.purplebuddy.finishsetup.secondreschedule");

    _BYLoggingFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      v4 = "Unregistered second finish setup reschedule";
      v5 = v2;
      v6 = 2;
      goto LABEL_14;
    }
  }

}

- (void)unregisterActivities
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  _BYLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A4E92000, v2, OS_LOG_TYPE_DEFAULT, "Unregistering XPC activities for finish setup...", v6, 2u);
  }

  +[BYXPCActivityRegistrar sharedInstance](BYXPCActivityRegistrar, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterActivityWithIdentifier:", "com.apple.purplebuddy.finishsetup.firstreschedule");

  +[BYXPCActivityRegistrar sharedInstance](BYXPCActivityRegistrar, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterActivityWithIdentifier:", "com.apple.purplebuddy.finishsetup.secondreschedule");

  +[BYXPCActivityRegistrar sharedInstance](BYXPCActivityRegistrar, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterActivityWithIdentifier:", "com.apple.purplebuddy.finishsetup.wifiobserver");

}

- (int64_t)_timeIntervalForFrequentNotifications
{
  return 230400;
}

- (int64_t)_timeIntervalForNotifications
{
  return 662400;
}

- (id)getFlowSkipIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[BYFlowSkipController _pendingFollowUpItem](self, "_pendingFollowUpItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("flowSkipIdentifiers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_wfNetworkChangeObserver, 0);
  objc_storeStrong((id *)&self->_followUpController_doNotAccessDirectly, 0);
}

- (void)didSkipFlow:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_1A4E92000, a2, a3, "Unknown flow skip identifier %{public}@", (uint8_t *)&v3);
}

- (void)_pendingFollowUpItem
{
  void *v2;
  uint64_t v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = _BYIsInternalInstall();
  if ((v6 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "domain");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v2, objc_msgSend(a1, "code"));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = 138543362;
  v9 = a1;
  OUTLINED_FUNCTION_0(&dword_1A4E92000, a2, v5, "Failed to get pending follow up items: %{public}@", (uint8_t *)&v8);
  if (!v6)
  {

  }
}

void __42__BYFlowSkipController_registerActivities__block_invoke_3_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A4E92000, a1, a3, "First finish setup reschedule had correct criteria", a5, a6, a7, a8, 0);
}

void __42__BYFlowSkipController_registerActivities__block_invoke_2_85_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A4E92000, a1, a3, "Second finish setup reschedule had correct criteria", a5, a6, a7, a8, 0);
}

@end
