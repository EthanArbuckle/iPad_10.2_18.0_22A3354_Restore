@implementation _UIActivityHelper

- (_UIActivityHelper)initWithDelegate:(id)a3 sessionID:(id)a4 fetchShortcutsBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UIActivityHelper *v11;
  _UIActivityHelper *v12;
  uint64_t v13;
  NSArray *cachedBuiltinActivities;
  uint64_t v15;
  id fetchShortcutsBlock;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_UIActivityHelper;
  v11 = -[_UIActivityHelper init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeStrong((id *)&v12->_sessionID, a4);
    _UIActivityGetBuiltinActivities();
    v13 = objc_claimAutoreleasedReturnValue();
    cachedBuiltinActivities = v12->_cachedBuiltinActivities;
    v12->_cachedBuiltinActivities = (NSArray *)v13;

    v15 = MEMORY[0x1A1AE9514](v10);
    fetchShortcutsBlock = v12->_fetchShortcutsBlock;
    v12->_fetchShortcutsBlock = (id)v15;

  }
  return v12;
}

+ (id)builtinActivityClasses
{
  _QWORD v3[14];

  v3[13] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  v3[7] = objc_opt_class();
  v3[8] = objc_opt_class();
  v3[9] = objc_opt_class();
  v3[10] = objc_opt_class();
  v3[11] = objc_opt_class();
  v3[12] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 13);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)activityTypeForBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = v3;
  if (activityTypeForBundleIdentifier__onceToken != -1)
  {
    dispatch_once(&activityTypeForBundleIdentifier__onceToken, &__block_literal_global_42);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  objc_msgSend((id)activityTypeForBundleIdentifier__activityTypesForIdentifiers, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v5;
}

+ (id)transportImageForBundleIdentifier:(id)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (__CFString *)a3;
  if (transportImageForBundleIdentifier__onceToken != -1)
    dispatch_once(&transportImageForBundleIdentifier__onceToken, &__block_literal_global_138_0);
  objc_msgSend((id)transportImageForBundleIdentifier__transportImagesForIdentifiers, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString hasPrefix:](v3, "hasPrefix:", CFSTR("com.apple.InCallService")))
  {

    v3 = CFSTR("com.apple.facetime");
  }
  if (!v4)
  {
    v5 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    objc_msgSend(v5, "_applicationIconImageForBundleIdentifier:format:scale:", v3, 5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (void)registerContinuousExtensionsDiscoveryOnLaunch
{
  +[_UIActivityApplicationExtensionDiscovery registerContinuousExtensionsDiscoveryOnLaunch](_UIActivityApplicationExtensionDiscovery, "registerContinuousExtensionsDiscoveryOnLaunch");
}

- (void)primeWithDiscoveryContext:(id)a3
{
  id v4;
  void *v5;
  _UIActivityApplicationExtensionDiscovery *v6;

  v4 = a3;
  v6 = objc_alloc_init(_UIActivityApplicationExtensionDiscovery);
  -[_UIActivityHelper fetchShortcutsBlock](self, "fetchShortcutsBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityApplicationExtensionDiscovery setFetchShortcutsBlock:](v6, "setFetchShortcutsBlock:", v5);

  -[_UIActivityHelper setApplicationExtensionDiscovery:](self, "setApplicationExtensionDiscovery:", v6);
  -[_UIActivityHelper setPrimed:](self, "setPrimed:", 1);
  -[_UIActivityApplicationExtensionDiscovery primeWithDiscoveryContext:](v6, "primeWithDiscoveryContext:", v4);

}

- (id)reportExtensionsCacheResult
{
  void *v2;
  void *v3;

  -[_UIActivityHelper applicationExtensionDiscovery](self, "applicationExtensionDiscovery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportExtensionsCacheResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_enumerateAvailableActivitiesForMatchingContext:(id)a3 intoMatchingResults:(id)a4 matchingResultsUpdateBlock:(id)a5 enumerateActivityBlock:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  char v52;
  void *v53;
  void *v54;
  objc_class *v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  void *v64;
  objc_class *v65;
  void *v66;
  char v67;
  NSObject *v68;
  uint64_t v69;
  _UIActivityApplicationExtensionDiscovery *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  void (**v80)(id, void *);
  id v81;
  int v82;
  unsigned int v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  id obja;
  uint64_t v90;
  void *v91;
  void *v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint8_t buf[4];
  void *v104;
  void *v105;
  _BYTE v106[24];
  void *v107;
  _BYTE v108[16];
  _BYTE v109[16];
  _BYTE v110[24];
  void *v111;
  _BYTE v112[16];
  void *v113;
  _BYTE v114[128];
  uint64_t v115;
  _BYTE v116[128];
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v80 = (void (**)(id, void *))a6;
  share_sheet_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[_UIActivityHelper _enumerateAvailableActivitiesForMatchingContext:intoMatchingResults:matchingResultsUpdateBlock:enumerateActivityBlock:].cold.7((uint64_t)v9, v11);

  objc_msgSend(v9, "excludedActivityTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v10;
  objc_msgSend(v10, "addExcludedActivityTypes:", v12);

  objc_msgSend(v9, "activityItemValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v9, "isContentManaged");
  v82 = objc_msgSend(v9, "whitelistActionActivitiesOnly");
  objc_msgSend(v9, "activityItems");
  v90 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applicationActivities");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "includedActivityTypes");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v9, "excludedActivityCategories");
  v78 = v13;
  _UIActivityItemTypesSet(v13);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityHelper cachedBuiltinActivities](self, "cachedBuiltinActivities");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "allowMatchingBuiltInActivities"))
    objc_msgSend(v92, "addObjectsFromArray:", v91);
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  objc_msgSend(v9, "activityTypesGeneratedByDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v99, v116, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v100;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v100 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * i);
        -[_UIActivityHelper delegate](self, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIActivityHelper sessionID](self, "sessionID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "activityHelper:matchingWithContext:shouldIncludeSystemActivityType:sessionID:", self, v9, v19, v21);

        if (v22)
        {
          -[_UIActivityHelper delegate](self, "delegate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIActivityHelper sessionID](self, "sessionID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "activityHelper:activitiesForActivityType:matchingContext:sessionID:", self, v19, v9, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
            objc_msgSend(v92, "addObjectsFromArray:", v25);
        }
        else
        {
          v115 = v19;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v115, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "addExcludedActivityTypes:", v25);
        }

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v99, v116, 16);
    }
    while (v16);
  }

  objc_msgSend(v9, "prematchedExtensionActivities");
  v26 = objc_claimAutoreleasedReturnValue();
  v77 = (void *)v26;
  if (v26)
  {
    objc_msgSend(v92, "addObjectsFromArray:", v26);
    v27 = v87;
    v28 = (void *)v90;
  }
  else
  {
    v27 = v87;
    v28 = (void *)v90;
    if (a5 && objc_msgSend(v9, "allowMatchingExtensionActivities"))
    {
      if (-[_UIActivityHelper primed](self, "primed"))
      {
        -[_UIActivityHelper setPrimed:](self, "setPrimed:", 0);
      }
      else
      {
        v70 = objc_alloc_init(_UIActivityApplicationExtensionDiscovery);
        -[_UIActivityHelper setApplicationExtensionDiscovery:](self, "setApplicationExtensionDiscovery:", v70);

        -[_UIActivityHelper fetchShortcutsBlock](self, "fetchShortcutsBlock");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIActivityHelper applicationExtensionDiscovery](self, "applicationExtensionDiscovery");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setFetchShortcutsBlock:", v71);

      }
      -[_UIActivityHelper applicationExtensionDiscovery](self, "applicationExtensionDiscovery");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = 0;
      objc_msgSend(v73, "activitiesForMatchingContext:error:", v9, &v98);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v98;

      if (v74)
      {
        objc_msgSend(v92, "addObjectsFromArray:", v74);
      }
      else
      {
        share_sheet_log();
        v76 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
          -[_UIActivityHelper _enumerateAvailableActivitiesForMatchingContext:intoMatchingResults:matchingResultsUpdateBlock:enumerateActivityBlock:].cold.6((uint64_t)v75, v76);

      }
    }
  }
  objc_msgSend(v92, "addObjectsFromArray:", v79);
  v81 = v92;
  v29 = objc_msgSend(v81, "count");
  if (v29)
  {
    v30 = v29 - 1;
    do
    {
      objc_msgSend(v81, "objectAtIndexedSubscript:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "activityType");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(CFSTR("com.apple.UIKit.activity.OpenWithApp-com.apple.DocumentsApp"), "isEqualToString:", v32);

      if (v33)
        objc_msgSend(v81, "removeObjectAtIndex:", v30);

      --v30;
    }
    while (v30 != -1);
  }

  _UIActivityGetOrderedBuiltinActivitiesFromActivities(v81);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityHelper _activitiesByApplyingBeforeTypePinningToActivities:activitiesToBeforeTypePin:](self, "_activitiesByApplyingBeforeTypePinningToActivities:activitiesToBeforeTypePin:", v34, v79);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  obja = v35;
  v93 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v94, v114, 16);
  if (v93)
  {
    v36 = *(_QWORD *)v95;
    v85 = *(_QWORD *)v95;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v95 != v36)
          objc_enumerationMutation(obja);
        v38 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v37);
        if (objc_msgSend(v91, "containsObject:", v38))
        {
          objc_msgSend(v38, "activityType");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("com.apple.UIKit.activity.AirDrop"));

          if ((v40 & 1) == 0)
          {
            -[_UIActivityHelper delegate](self, "delegate");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "activityType");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UIActivityHelper sessionID](self, "sessionID");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v41, "activityHelper:matchingWithContext:shouldIncludeSystemActivityType:sessionID:", self, v9, v42, v43);

            v36 = v85;
            if ((v44 & 1) == 0)
            {
              objc_msgSend(v38, "activityType");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v113 = v49;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v113, 1);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "addExcludedActivityTypes:", v50);

              share_sheet_log();
              v47 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                -[_UIActivityHelper _enumerateAvailableActivitiesForMatchingContext:intoMatchingResults:matchingResultsUpdateBlock:enumerateActivityBlock:].cold.5((uint64_t)v112, (uint64_t)v38);
              goto LABEL_44;
            }
          }
        }
        if (objc_msgSend(v9, "shouldExcludeActivity:", v38))
        {
          objc_msgSend(v38, "activityType");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v111 = v45;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v111, 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addExcludedActivityTypes:", v46);

          share_sheet_log();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            -[_UIActivityHelper _enumerateAvailableActivitiesForMatchingContext:intoMatchingResults:matchingResultsUpdateBlock:enumerateActivityBlock:].cold.1((uint64_t)v110, (uint64_t)v38);
LABEL_44:

          goto LABEL_45;
        }
        if ((v86 & (1 << objc_msgSend((id)objc_opt_class(), "activityCategory"))) != 0)
        {
          share_sheet_log();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            -[_UIActivityHelper _enumerateAvailableActivitiesForMatchingContext:intoMatchingResults:matchingResultsUpdateBlock:enumerateActivityBlock:].cold.4((uint64_t)v109, (uint64_t)v38);
          goto LABEL_44;
        }
        if (v84)
        {
          objc_msgSend(v38, "activityType");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v84, "containsObject:", v48) & 1) != 0
            || v82 && objc_msgSend((id)objc_opt_class(), "activityCategory") == 1)
          {

          }
          else
          {
            objc_msgSend(v38, "activityType");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v51, "isEqualToString:", CFSTR("com.apple.UIKit.activity.Share"));

            if ((v52 & 1) == 0)
            {
              share_sheet_log();
              v68 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
                -[_UIActivityHelper _enumerateAvailableActivitiesForMatchingContext:intoMatchingResults:matchingResultsUpdateBlock:enumerateActivityBlock:].cold.3((uint64_t)v108, (uint64_t)v38);

              goto LABEL_66;
            }
          }
        }
        _setIsContentManagedIfResctrictableActivity(v38, v83);
        objc_msgSend(v38, "activityType");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v53, "isEqualToString:", CFSTR("com.apple.UIKit.activity.CopyToPasteboard"))
          && objc_msgSend(v28, "count"))
        {
          objc_msgSend(v28, "objectAtIndex:", 0);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = (objc_class *)objc_opt_class();
          NSStringFromClass(v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v56, "isEqualToString:", CFSTR("GKAchievement")))
          {

LABEL_66:
            v36 = v85;
            goto LABEL_45;
          }
          objc_msgSend(v28, "objectAtIndex:", 0);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = (objc_class *)objc_opt_class();
          NSStringFromClass(v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = objc_msgSend(v66, "isEqualToString:", CFSTR("GKScore"));

          v27 = v87;
          v36 = v85;
          if ((v67 & 1) != 0)
            goto LABEL_45;
        }
        else
        {

          v36 = v85;
        }
        objc_msgSend(v38, "activityType");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v57, "isEqualToString:", CFSTR("com.apple.UIKit.activity.SharePlay"));

        if (v58)
        {
          v107 = v38;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addHiddenActivities:", v59);

          if (objc_msgSend(v9, "showSharePlayProminently"))
          {
            share_sheet_log();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
              -[_UIActivityHelper _enumerateAvailableActivitiesForMatchingContext:intoMatchingResults:matchingResultsUpdateBlock:enumerateActivityBlock:].cold.2((uint64_t)v106, (uint64_t)v38);
            goto LABEL_44;
          }
        }
        objc_msgSend(v38, "activityType");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "isEqualToString:", CFSTR("com.apple.InCallService.ShareExtension"));

        if (v61)
        {
          v105 = v38;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v105, 1);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addHiddenActivities:", v62);

          share_sheet_log();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v38, "activityType");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v104 = v63;
            _os_log_impl(&dword_19E419000, v47, OS_LOG_TYPE_DEFAULT, "Excluding activityType %@ because it should only ever be shown as a suggestion", buf, 0xCu);

          }
          goto LABEL_44;
        }
        v80[2](v80, v38);
LABEL_45:
        ++v37;
        v28 = (void *)v90;
      }
      while (v93 != v37);
      v69 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v94, v114, 16);
      v93 = v69;
    }
    while (v69);
  }

}

- (void)preheatAvailableActivitiesForMatchingContext:(id)a3
{
  NSObject *v5;
  id v6;
  dispatch_queue_t v7;
  NSObject *v8;
  _QWORD v9[4];
  dispatch_queue_t v10;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = a3;
  v7 = dispatch_queue_create("com.apple.ShareUI.activityPreheating", v5);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66___UIActivityHelper_preheatAvailableActivitiesForMatchingContext___block_invoke;
  v9[3] = &unk_1E4003A90;
  v10 = v7;
  v8 = v7;
  -[_UIActivityHelper _enumerateAvailableActivitiesForMatchingContext:intoMatchingResults:matchingResultsUpdateBlock:enumerateActivityBlock:](self, "_enumerateAvailableActivitiesForMatchingContext:intoMatchingResults:matchingResultsUpdateBlock:enumerateActivityBlock:", v6, 0, 0, v9);

}

- (id)orderedAvailableActivitiesForMatchingContext:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  const char *v14;
  _UIActivityMatchingResults *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  unint64_t v24;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  const char *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  _BOOL8 v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  os_signpost_id_t v40;
  const char *v41;
  id v43;
  id v44;
  _UIActivityHelper *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  char v53;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "activityItemValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isContentManaged");
  objc_msgSend(v4, "sourceApplicationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = self;
  -[_UIActivityHelper cachedBuiltinActivities](self, "cachedBuiltinActivities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIActivityPlaceholderItemProxy unproxiedItemsForItems:](_UIActivityPlaceholderItemProxy, "unproxiedItemsForItems:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "allowMatchingExtensionActivities");
  share_sheet_log();
  v11 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_make_with_pointer(v12, v4);

  if (v10)
  {
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      v14 = "AvailableActivitiesIncludingExtensions";
LABEL_8:
      _os_signpost_emit_with_name_impl(&dword_19E419000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, v14, (const char *)&unk_19E4D535F, buf, 2u);
    }
  }
  else if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    v14 = "AvailableActivitiesExcludingExtensions";
    goto LABEL_8;
  }

  v15 = -[_UIActivityMatchingResults initWithActivityMatchingContext:]([_UIActivityMatchingResults alloc], "initWithActivityMatchingContext:", v4);
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __66___UIActivityHelper_orderedAvailableActivitiesForMatchingContext___block_invoke_2;
  v46[3] = &unk_1E4003AF8;
  v47 = v8;
  v48 = v5;
  v49 = v9;
  v17 = v4;
  v50 = v17;
  v51 = v7;
  v18 = v16;
  v52 = v18;
  v53 = v6;
  v44 = v7;
  v43 = v9;
  v19 = v5;
  v20 = v8;
  -[_UIActivityHelper _enumerateAvailableActivitiesForMatchingContext:intoMatchingResults:matchingResultsUpdateBlock:enumerateActivityBlock:](v45, "_enumerateAvailableActivitiesForMatchingContext:intoMatchingResults:matchingResultsUpdateBlock:enumerateActivityBlock:", v17, v15, &__block_literal_global_159, v46);
  share_sheet_log();
  v21 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_signpost_id_make_with_pointer(v22, v17);

  v24 = v23 - 1;
  if (v10)
  {
    if (v24 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v21, OS_SIGNPOST_INTERVAL_END, v23, "AvailableActivitiesIncludingExtensions", (const char *)&unk_19E4D535F, buf, 2u);
    }

    share_sheet_log();
    v25 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_signpost_id_make_with_pointer(v26, v17);

    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      v28 = "SortAvailableActivitiesIncludingExtensions";
LABEL_22:
      _os_signpost_emit_with_name_impl(&dword_19E419000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v27, v28, (const char *)&unk_19E4D535F, buf, 2u);
    }
  }
  else
  {
    if (v24 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v21, OS_SIGNPOST_INTERVAL_END, v23, "AvailableActivitiesExcludingExtensions", (const char *)&unk_19E4D535F, buf, 2u);
    }

    share_sheet_log();
    v25 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v29 = objc_claimAutoreleasedReturnValue();
    v27 = os_signpost_id_make_with_pointer(v29, v17);

    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      v28 = "SortAvailableActivitiesExcludingExtensions";
      goto LABEL_22;
    }
  }

  objc_msgSend(v17, "externalMatchBuiltinOrderedActivities");
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v30;
  v32 = (void *)MEMORY[0x1E0C9AA60];
  if (v30)
    v32 = (void *)v30;
  v33 = v32;

  objc_msgSend(v33, "arrayByAddingObjectsFromArray:", v18);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (objc_msgSend(v17, "excludedActivityCategories") & 2) != 0 || objc_msgSend(v17, "sharingStyle") == 2;
  objc_msgSend(v17, "activityTypeOrder");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityHelper activitiesByOrderingActivities:applyDefaultOrdering:applyBeforeTypePinning:activityTypeOrdering:bypassDuet:](v45, "activitiesByOrderingActivities:applyDefaultOrdering:applyBeforeTypePinning:activityTypeOrdering:bypassDuet:", v34, 1, 1, v36, v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityMatchingResults setOrderedActivities:](v15, "setOrderedActivities:", v37);

  share_sheet_log();
  v38 = objc_claimAutoreleasedReturnValue();
  share_sheet_log();
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = os_signpost_id_make_with_pointer(v39, v17);

  if (v10)
  {
    if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      *(_WORD *)buf = 0;
      v41 = "SortAvailableActivitiesIncludingExtensions";
LABEL_35:
      _os_signpost_emit_with_name_impl(&dword_19E419000, v38, OS_SIGNPOST_INTERVAL_END, v40, v41, (const char *)&unk_19E4D535F, buf, 2u);
    }
  }
  else if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    *(_WORD *)buf = 0;
    v41 = "SortAvailableActivitiesExcludingExtensions";
    goto LABEL_35;
  }

  return v15;
}

- (id)activitiesByOrderingActivities:(id)a3 applyDefaultOrdering:(BOOL)a4 applyBeforeTypePinning:(BOOL)a5 activityTypeOrdering:(id)a6 bypassDuet:(BOOL)a7
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  const void *v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  uint64_t v27;
  uint8_t v28[16];
  _QWORD v29[2];

  v9 = a5;
  v10 = a4;
  v29[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = v12;
  v15 = v14;
  if (v10)
  {
    -[_UIActivityHelper _activitiesByApplyingDefaultOrdering:](self, "_activitiesByApplyingDefaultOrdering:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
LABEL_3:
      if (!v13)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if (!v9)
  {
    goto LABEL_3;
  }
  -[_UIActivityHelper _activitiesByApplyingBeforeTypePinningToActivities:activitiesToBeforeTypePin:](self, "_activitiesByApplyingBeforeTypePinningToActivities:activitiesToBeforeTypePin:", v15, v15);
  v27 = objc_claimAutoreleasedReturnValue();

  v15 = (void *)v27;
  if (v13)
  {
LABEL_4:
    -[_UIActivityHelper _activitiesByTypeOrderingActivities:activityTypeOrdering:](self, "_activitiesByTypeOrderingActivities:activityTypeOrdering:", v15, v13);
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }
LABEL_5:
  if ((objc_msgSend(v13, "containsObject:", CFSTR("com.apple.UIKit.activity.Share")) & 1) == 0)
  {
    v29[0] = CFSTR("com.apple.UIKit.activity.Share");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityHelper _activitiesByApplyingFavoriteOrderingToActivities:favoriteActivityTypes:](self, "_activitiesByApplyingFavoriteOrderingToActivities:favoriteActivityTypes:", v15, v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v18;
  }
  if (!a7)
  {
    share_sheet_log();
    v19 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_signpost_id_make_with_pointer(v20, v15);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)v28 = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v21, "SortAvailableActivitiesByDuet", (const char *)&unk_19E4D535F, v28, 2u);
    }

    -[_UIActivityHelper _activitiesByDuetOrderingActivities:](self, "_activitiesByDuetOrderingActivities:", v15);
    v22 = (const void *)objc_claimAutoreleasedReturnValue();

    share_sheet_log();
    v23 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_signpost_id_make_with_pointer(v24, v22);

    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)v28 = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v23, OS_SIGNPOST_INTERVAL_END, v25, "SortAvailableActivitiesByDuet", (const char *)&unk_19E4D535F, v28, 2u);
    }

    v15 = (void *)v22;
  }

  return v15;
}

- (id)_activitiesByApplyingDefaultOrdering:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58___UIActivityHelper__activitiesByApplyingDefaultOrdering___block_invoke;
  v7[3] = &unk_1E4003B20;
  v7[4] = self;
  _mapArray(a3, v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _mapArray(v4, &__block_literal_global_164);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_defaultOrderingDescriptorForActivity:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  switch(objc_msgSend(v4, "_defaultSortGroup"))
  {
    case 1:
      -[_UIActivityHelper _defaultSortOrderForBuiltInElevatedActivity:](self, "_defaultSortOrderForBuiltInElevatedActivity:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2:
      -[_UIActivityHelper _defaultSortItemForBuiltinActivity:](self, "_defaultSortItemForBuiltinActivity:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 3:
      -[_UIActivityHelper _defaultSortOrderForApplicationDefinedActivity:](self, "_defaultSortOrderForApplicationDefinedActivity:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 4:
      -[_UIActivityHelper _defaultSortOrderForExtensionBasedActivity:](self, "_defaultSortOrderForExtensionBasedActivity:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 5:
      -[_UIActivityHelper _defaultSortOrderForOpenInAppActivity:](self, "_defaultSortOrderForOpenInAppActivity:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 6:
      -[_UIActivityHelper _defaultSortOrderForShortcutActivity:](self, "_defaultSortOrderForShortcutActivity:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 7:
      -[_UIActivityHelper _defaultSortOrderForOtherActivity:](self, "_defaultSortOrderForOtherActivity:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v6 = (void *)v5;
      break;
    default:
      v6 = 0;
      break;
  }

  return v6;
}

- (id)_defaultSortOrderForBuiltInElevatedActivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a3;
  +[_UIActivityUserDefaults builtinActivityOrder](_UIActivityUserDefaults, "builtinActivityOrder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[_UIActivitySortItem sortDescriptorForActivity:withGroup:secondarySortValue:](_UIActivitySortItem, "sortDescriptorForActivity:withGroup:secondarySortValue:", v3, 1, &unk_1E403FCA8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6 + 1000);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIActivitySortItem sortDescriptorForActivity:withGroup:secondarySortValue:](_UIActivitySortItem, "sortDescriptorForActivity:withGroup:secondarySortValue:", v3, 1, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_defaultSortItemForBuiltinActivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a3;
  +[_UIActivityUserDefaults builtinActivityOrder](_UIActivityUserDefaults, "builtinActivityOrder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[_UIActivitySortItem sortDescriptorForActivity:withGroup:secondarySortValue:](_UIActivitySortItem, "sortDescriptorForActivity:withGroup:secondarySortValue:", v3, 2, &unk_1E403FCA8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6 + 1000);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIActivitySortItem sortDescriptorForActivity:withGroup:secondarySortValue:](_UIActivitySortItem, "sortDescriptorForActivity:withGroup:secondarySortValue:", v3, 2, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_defaultSortOrderForExtensionBasedActivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  char isKindOfClass;
  double v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;

  v3 = a3;
  +[_UIActivityUserDefaults builtinActivityOrder](_UIActivityUserDefaults, "builtinActivityOrder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6 + 3000);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v3;
    v18 = 2;
LABEL_8:
    +[_UIActivitySortItem sortDescriptorForActivity:withGroup:secondarySortValue:](_UIActivitySortItem, "sortDescriptorForActivity:withGroup:secondarySortValue:", v17, v18, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v3, "activityTitle");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v3;
    v18 = 7;
    goto LABEL_8;
  }
  v7 = v3;
  objc_msgSend(v7, "installationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v12 = v10 / v11;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v14 = 2000.0;
  if ((isKindOfClass & 1) != 0)
    v14 = 1000.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12 + v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIActivitySortItem sortDescriptorForActivity:withGroup:secondarySortValue:](_UIActivitySortItem, "sortDescriptorForActivity:withGroup:secondarySortValue:", v7, 4, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v16;
}

- (id)_defaultSortOrderForApplicationDefinedActivity:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a3;
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "indexInApplicationDefinedActivities"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIActivitySortItem sortDescriptorForActivity:withGroup:secondarySortValue:](_UIActivitySortItem, "sortDescriptorForActivity:withGroup:secondarySortValue:", v4, 3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_defaultSortOrderForOpenInAppActivity:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "_appIsDocumentTypeOwner"))
    v4 = 0;
  else
    v4 = 10;
  v5 = objc_msgSend(v3, "_supportsOpenInPlace");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4 | v5 ^ 1u);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIActivitySortItem sortDescriptorForActivity:withGroup:secondarySortValue:tertiarySortValue:](_UIActivitySortItem, "sortDescriptorForActivity:withGroup:secondarySortValue:tertiarySortValue:", v3, 5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_defaultSortOrderForShortcutActivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "sortValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &unk_1E403FCC0;
  }
  +[_UIActivitySortItem sortDescriptorForActivity:withGroup:secondarySortValue:](_UIActivitySortItem, "sortDescriptorForActivity:withGroup:secondarySortValue:", v3, 6, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_defaultSortOrderForOtherActivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "activityTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIActivitySortItem sortDescriptorForActivity:withGroup:secondarySortValue:](_UIActivitySortItem, "sortDescriptorForActivity:withGroup:secondarySortValue:", v3, 7, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_activitiesByApplyingBeforeTypePinningToActivities:(id)a3 activitiesToBeforeTypePin:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, void *, uint64_t, unsigned __int8 *);
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t (*v21)(uint64_t, void *, uint64_t, unsigned __int8 *);
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    v10 = MEMORY[0x1E0C809B0];
    v11 = ___UIIndexOfActivityType_block_invoke;
    v12 = &unk_1E4003270;
    do
    {
      v13 = 0;
      v26 = v8;
      do
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v13);
        objc_msgSend(v14, "_beforeActivity", v26);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          v17 = v15;
          v32[0] = v10;
          v32[1] = 3221225472;
          v32[2] = v11;
          v32[3] = v12;
          v33 = v17;
          v18 = objc_msgSend(v6, "indexOfObjectPassingTest:", v32);

          if (v18 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v19 = v9;
            v20 = v12;
            v21 = v11;
            v22 = v10;
            v23 = objc_msgSend(v6, "indexOfObject:", v14);
            if (v23 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v24 = v23;
              objc_msgSend(v6, "removeObject:", v14);
              if (v24 > v18)
                ++v18;
            }
            objc_msgSend(v6, "insertObject:atIndex:", v14, v18);
            v10 = v22;
            v11 = v21;
            v12 = v20;
            v9 = v19;
            v8 = v26;
          }
        }

        ++v13;
      }
      while (v8 != v13);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v8);
  }

  return v6;
}

- (id)_activitiesByTypeOrderingActivities:(id)a3 activityTypeOrdering:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      v11 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(obj);
          v13 = *(id *)(*((_QWORD *)&v20 + 1) + 8 * i);
          v24[0] = v11;
          v24[1] = 3221225472;
          v24[2] = ___UIIndexOfActivityType_block_invoke;
          v24[3] = &unk_1E4003270;
          v25 = v13;
          v14 = v13;
          v15 = objc_msgSend(v7, "indexOfObjectPassingTest:", v24);

          if (v15 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v7, "objectAtIndexedSubscript:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v16);

            objc_msgSend(v7, "removeObjectAtIndex:", v15);
          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v9);
    }

    objc_msgSend(v18, "addObjectsFromArray:", v7);
  }
  else
  {
    v18 = v5;
  }

  return v18;
}

- (id)_activitiesByApplyingFavoriteOrderingToActivities:(id)a3 favoriteActivityTypes:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v5, "reverseObjectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(obj);
        v12 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v22[0] = v10;
        v22[1] = 3221225472;
        v22[2] = ___UIIndexOfActivityType_block_invoke;
        v22[3] = &unk_1E4003270;
        v23 = v12;
        v13 = v12;
        v14 = objc_msgSend(v6, "indexOfObjectPassingTest:", v22);

        if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "removeObjectAtIndex:", v14);
          objc_msgSend(v6, "insertObject:atIndex:", v15, 0);

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v8);
  }

  return v6;
}

- (id)_activitiesByDuetOrderingActivities:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id obj;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint8_t v65[128];
  __int128 buf;
  void *v67;
  void *v68;
  uint64_t *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  -[_UIActivityHelper delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v59 = 0;
    v60 = &v59;
    v61 = 0x2050000000;
    v6 = (void *)get_PSSuggesterConfigurationClass_softClass;
    v62 = get_PSSuggesterConfigurationClass_softClass;
    if (!get_PSSuggesterConfigurationClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v67 = __get_PSSuggesterConfigurationClass_block_invoke;
      v68 = &unk_1E4001370;
      v69 = &v59;
      __get_PSSuggesterConfigurationClass_block_invoke((uint64_t)&buf);
      v6 = (void *)v60[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v59, 8);
    objc_msgSend(v7, "defaultConfiguration");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setMaximumNumberOfSuggestions:", 8);
    v59 = 0;
    v60 = &v59;
    v61 = 0x2050000000;
    v8 = (void *)get_PSSuggesterClass_softClass;
    v62 = get_PSSuggesterClass_softClass;
    if (!get_PSSuggesterClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v67 = __get_PSSuggesterClass_block_invoke;
      v68 = &unk_1E4001370;
      v69 = &v59;
      __get_PSSuggesterClass_block_invoke((uint64_t)&buf);
      v8 = (void *)v60[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v59, 8);
    v39 = (void *)objc_msgSend([v9 alloc], "initWithDaemonUsingConfiguration:", v42);
    -[_UIActivityHelper delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityHelper sessionID](self, "sessionID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activityHelper:predictionContextForSessionID:", self, v11);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v43, "count"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v12 = v43;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v56 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v16, "containingAppBundleIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "activityType");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "objectForKeyedSubscript:", v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v19;
            if (v19)
            {
              if ((objc_msgSend(v19, "containsObject:", v18) & 1) == 0)
                objc_msgSend(v20, "addObject:", v18);
              if (!v17)
                goto LABEL_19;
LABEL_18:
              objc_msgSend(v46, "setObject:forKeyedSubscript:", v20, v17);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v18);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
                goto LABEL_18;
            }
LABEL_19:

            continue;
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
      }
      while (v13);
    }

    objc_msgSend(v41, "setAppBundleIdsToShareExtensionBundleIdsMapping:", v46);
    objc_msgSend(v39, "shareExtensionSuggestionsFromContext:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v40, "count"))
    {
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v21 = v40;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v52;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v52 != v23)
              objc_enumerationMutation(v21);
            v25 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
            share_sheet_log();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v25, "bundleID");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v27;
              _os_log_impl(&dword_19E419000, v26, OS_LOG_TYPE_DEFAULT, "duet ordering suggestion for bundle ID: %@", (uint8_t *)&buf, 0xCu);

            }
          }
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
        }
        while (v22);
      }

      objc_msgSend(v21, "valueForKey:", CFSTR("bundleID"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v12, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v29, "count"));
      v44 = (id)objc_claimAutoreleasedReturnValue();
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      obj = v28;
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
      if (v30)
      {
        v31 = *(_QWORD *)v48;
        do
        {
          for (k = 0; k != v30; ++k)
          {
            if (*(_QWORD *)v48 != v31)
              objc_enumerationMutation(obj);
            v33 = (uint64_t *)*(id *)(*((_QWORD *)&v47 + 1) + 8 * k);
            *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
            *((_QWORD *)&buf + 1) = 3221225472;
            v67 = ___UIIndexOfActivityType_block_invoke;
            v68 = &unk_1E4003270;
            v69 = v33;
            v34 = v33;
            v35 = objc_msgSend(v29, "indexOfObjectPassingTest:", &buf);

            if (v35 != 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v29, "objectAtIndexedSubscript:", v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "addObject:", v36);

              objc_msgSend(v29, "removeObjectAtIndex:", v35);
            }
          }
          v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
        }
        while (v30);
      }

      objc_msgSend(v44, "addObjectsFromArray:", v29);
    }
    else
    {
      v44 = v12;
    }

    v37 = v43;
  }
  else
  {
    v37 = v43;
    v44 = v43;
  }

  return v44;
}

- (_UIActivityHelperDelegate)delegate
{
  return (_UIActivityHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (_UIActivityApplicationExtensionDiscovery)applicationExtensionDiscovery
{
  return self->_applicationExtensionDiscovery;
}

- (void)setApplicationExtensionDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_applicationExtensionDiscovery, a3);
}

- (NSArray)cachedBuiltinActivities
{
  return self->_cachedBuiltinActivities;
}

- (BOOL)primed
{
  return self->_primed;
}

- (void)setPrimed:(BOOL)a3
{
  self->_primed = a3;
}

- (id)fetchShortcutsBlock
{
  return self->_fetchShortcutsBlock;
}

- (void)setFetchShortcutsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchShortcutsBlock, 0);
  objc_storeStrong((id *)&self->_cachedBuiltinActivities, 0);
  objc_storeStrong((id *)&self->_applicationExtensionDiscovery, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_enumerateAvailableActivitiesForMatchingContext:(uint64_t)a1 intoMatchingResults:(uint64_t)a2 matchingResultsUpdateBlock:enumerateActivityBlock:.cold.1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend((id)OUTLINED_FUNCTION_1_5(a1, a2), "activityType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_4(&dword_19E419000, v3, v4, "Excluding activityType %@ as determined by activityMatchingContext");

  OUTLINED_FUNCTION_2_3();
}

- (void)_enumerateAvailableActivitiesForMatchingContext:(uint64_t)a1 intoMatchingResults:(uint64_t)a2 matchingResultsUpdateBlock:enumerateActivityBlock:.cold.2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend((id)OUTLINED_FUNCTION_1_5(a1, a2), "activityType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_4(&dword_19E419000, v3, v4, "Excluding activityType %@ because it should be shown prominently in the header");

  OUTLINED_FUNCTION_2_3();
}

- (void)_enumerateAvailableActivitiesForMatchingContext:(uint64_t)a1 intoMatchingResults:(uint64_t)a2 matchingResultsUpdateBlock:enumerateActivityBlock:.cold.3(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend((id)OUTLINED_FUNCTION_1_5(a1, a2), "activityType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_4(&dword_19E419000, v3, v4, "Excluding activityType %@ because client has set includedActivityTypes");

  OUTLINED_FUNCTION_2_3();
}

- (void)_enumerateAvailableActivitiesForMatchingContext:(uint64_t)a1 intoMatchingResults:(uint64_t)a2 matchingResultsUpdateBlock:enumerateActivityBlock:.cold.4(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend((id)OUTLINED_FUNCTION_1_5(a1, a2), "activityType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_4(&dword_19E419000, v3, v4, "Excluding activityType %@ because it is in a hidden category");

  OUTLINED_FUNCTION_2_3();
}

- (void)_enumerateAvailableActivitiesForMatchingContext:(uint64_t)a1 intoMatchingResults:(uint64_t)a2 matchingResultsUpdateBlock:enumerateActivityBlock:.cold.5(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend((id)OUTLINED_FUNCTION_1_5(a1, a2), "activityType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_4(&dword_19E419000, v3, v4, "Excluding activityType %@ as instructed by _shouldShowSystemActivityType");

  OUTLINED_FUNCTION_2_3();
}

- (void)_enumerateAvailableActivitiesForMatchingContext:(uint64_t)a1 intoMatchingResults:(NSObject *)a2 matchingResultsUpdateBlock:enumerateActivityBlock:.cold.6(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_19E419000, a2, OS_LOG_TYPE_ERROR, "Cannot find application extensions: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_enumerateAvailableActivitiesForMatchingContext:(uint64_t)a1 intoMatchingResults:(NSObject *)a2 matchingResultsUpdateBlock:enumerateActivityBlock:.cold.7(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_19E419000, a2, OS_LOG_TYPE_DEBUG, "Enumerate available activities for %@", (uint8_t *)&v2, 0xCu);
}

@end
