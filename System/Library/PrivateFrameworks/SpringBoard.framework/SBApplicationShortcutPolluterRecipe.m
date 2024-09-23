@implementation SBApplicationShortcutPolluterRecipe

- (id)title
{
  return CFSTR("Application Shortcut Polluter");
}

- (void)handleVolumeIncrease
{
  void *v2;
  NSObject *v3;
  __int128 v4;
  unint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  __int128 v24;
  id obj;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBApplicationShortcutStoreManager sharedManager](SBApplicationShortcutStoreManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogAppShortcuts();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Populating mock shortcuts...", buf, 2u);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(MEMORY[0x1E0D23068], "applicationsWithAvailableStores");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v28)
  {
    v26 = *(_QWORD *)v30;
    v5 = 0x1E0C99000uLL;
    *(_QWORD *)&v4 = 138412290;
    v24 = v4;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v30 != v26)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v27, "applicationWithBundleIdentifier:", v7, v24);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "info");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = objc_msgSend(v9, "dynamicApplicationShortcutItemsVersion");
        v11 = v2;
        objc_msgSend(v2, "applicationShortcutItemsForBundleIdentifier:withVersion:", v7, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "mutableCopy");
        v14 = v13;
        if (v13)
          v15 = v13;
        else
          v15 = (id)objc_opt_new();
        v16 = v15;

        v17 = v5;
        v18 = (void *)objc_opt_new();
        v19 = 20;
        do
        {
          __mockShortcutPlist();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v20);

          --v19;
        }
        while (v19);
        SBLogAppShortcuts();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v24;
          v34 = v7;
          _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_INFO, "Populated mock shortcuts for %@", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0DAADA0], "_staticApplicationShortcutItemsFromInfoPlistEntry:", v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObjectsFromArray:", v22);

        v2 = v11;
        objc_msgSend(v11, "setApplicationShortcutItems:forBundleIdentifier:withVersion:", v16, v7, v10);

        v5 = v17;
      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v28);
  }

  objc_msgSend(v2, "saveSynchronously");
  SBLogAppShortcuts();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_INFO, "Populated mock shortcuts", buf, 2u);
  }

}

- (void)handleVolumeDecrease
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  NSObject *v25;
  void *v26;
  int v27;
  NSObject *v28;
  id obj;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  uint64_t v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSuppressAppShortcutTruncation:", 0);

  __mockShortcutPlist();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("UIApplicationShortcutItemType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  __mockShortcutPlist();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("UIApplicationShortcutItemTitle"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBApplicationShortcutStoreManager sharedManager](SBApplicationShortcutStoreManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogAppShortcuts();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "Removing mock shortcuts...", buf, 2u);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(MEMORY[0x1E0D23068], "applicationsWithAvailableStores");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (v33)
  {
    v30 = *(_QWORD *)v44;
    v31 = v7;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v44 != v30)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v9);
        objc_msgSend(v32, "applicationWithBundleIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "info");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v12, "dynamicApplicationShortcutItemsVersion");
        v37 = v10;
        objc_msgSend(v7, "applicationShortcutItemsForBundleIdentifier:withVersion:", v10, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v14, "mutableCopy");
        v16 = v15;
        v35 = v12;
        v36 = v9;
        v34 = v13;
        if (v15)
          v17 = v15;
        else
          v17 = (id)objc_opt_new();
        v18 = v17;

        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v19 = (void *)objc_msgSend(v18, "copy");
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v40 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
              objc_msgSend(v24, "type");
              v25 = objc_claimAutoreleasedReturnValue();
              if (-[NSObject isEqualToString:](v25, "isEqualToString:", v5))
              {
                objc_msgSend(v24, "localizedTitle");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v26, "isEqualToString:", v38);

                if (!v27)
                  continue;
                objc_msgSend(v18, "removeObject:", v24);
                SBLogAppShortcuts();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v48 = v37;
                  _os_log_impl(&dword_1D0540000, v25, OS_LOG_TYPE_INFO, "Removing mock shortcut from %@", buf, 0xCu);
                }
              }

            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
          }
          while (v21);
        }

        v7 = v31;
        objc_msgSend(v31, "setApplicationShortcutItems:forBundleIdentifier:withVersion:", v18, v37, v34);

        v9 = v36 + 1;
      }
      while (v36 + 1 != v33);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    }
    while (v33);
  }

  objc_msgSend(v7, "saveSynchronously");
  SBLogAppShortcuts();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_INFO, "Removed all mock shortcuts.", buf, 2u);
  }

}

@end
