@implementation SBHIconApplicationShortcutListComposer

+ (id)composedShortcutsForApplicationWithBundleIdentifier:(id)a3 iconDisplayName:(id)a4 staticItems:(id)a5 dynamicItems:(id)a6 applicationItemID:(unint64_t)a7 numberOfDisplayItemsInSwitcher:(int64_t)a8 supportsMultipleWindows:(BOOL)a9 isSystemApplication:(BOOL)a10 isInternalApplication:(BOOL)a11 isApplicationInBeta:(BOOL)a12 isApplicationHidden:(BOOL)a13 iconManagerAllowsEditing:(BOOL)a14 removeStyle:(int64_t)a15
{
  _BOOL4 v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  int v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  id v43;
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
  id v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v62;
  void *v63;
  id v64;
  _BOOL4 v65;
  uint64_t v66;
  _QWORD v67[2];

  v20 = a11;
  v65 = a10;
  v67[1] = *MEMORY[0x1E0C80C00];
  v64 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v62 = v23;
  v63 = v22;
  objc_msgSend((id)objc_opt_class(), "filteredApplicationShortcutItemsWithStaticApplicationShortcutItems:dynamicApplicationShortcutItems:", v22, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObjectsFromArray:", v25);

  if (!os_variant_has_internal_content())
    goto LABEL_10;
  if (composedShortcutsForApplicationWithBundleIdentifier_iconDisplayName_staticItems_dynamicItems_applicationItemID_numberOfDisplayItemsInSwitcher_supportsMultipleWindows_isSystemApplication_isInternalApplication_isApplicationInBeta_isApplicationHidden_iconManagerAllowsEditing_removeStyle__onceToken != -1)
    dispatch_once(&composedShortcutsForApplicationWithBundleIdentifier_iconDisplayName_staticItems_dynamicItems_applicationItemID_numberOfDisplayItemsInSwitcher_supportsMultipleWindows_isSystemApplication_isInternalApplication_isApplicationInBeta_isApplicationHidden_iconManagerAllowsEditing_removeStyle__onceToken, &__block_literal_global_92);
  if (objc_msgSend((id)composedShortcutsForApplicationWithBundleIdentifier_iconDisplayName_staticItems_dynamicItems_applicationItemID_numberOfDisplayItemsInSwitcher_supportsMultipleWindows_isSystemApplication_isInternalApplication_isApplicationInBeta_isApplicationHidden_iconManagerAllowsEditing_removeStyle__homeScreenDefaults, "shouldFudgeShortcutsToCauseMaximumPain"))
  {
    if (!a7)
      a7 = 10000;
    if ((unint64_t)objc_msgSend(v24, "count") > 3)
    {
      v65 = 0;
      v20 = 0;
      a12 = 0;
      v28 = v21;
      v29 = a14;
    }
    else
    {
      do
      {
        v26 = objc_alloc_init(MEMORY[0x1E0DAADA0]);
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAADB8]), "initWithType:", 18);
        objc_msgSend(v26, "setIcon:", v27);

        objc_msgSend(v26, "setLocalizedTitle:", CFSTR("QA TEST"));
        objc_msgSend(v26, "setType:", CFSTR("com.apple.springboardhome.application-shortcut-item.cancel-download"));
        objc_msgSend(v24, "addObject:", v26);

      }
      while ((unint64_t)objc_msgSend(v24, "count") < 4);
      v65 = 0;
      v20 = 0;
      a12 = 0;
      v28 = v21;
      v29 = a14;
    }
  }
  else
  {
LABEL_10:
    v28 = v21;
    v29 = a14;
    if (!a9)
      goto LABEL_16;
  }
  v30 = objc_msgSend((id)objc_opt_class(), "supportsMultiwindowShortcut");
  if (a8 >= 1 && v30)
  {
    SBHBundle();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("SHOW_ALL_WINDOWS_SHORTCUT_ITEM_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_alloc_init(MEMORY[0x1E0DAADA0]);
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAADB8]), "initWithSystemImageName:", CFSTR("rectangle.grid.2x2"));
    objc_msgSend(v33, "setIcon:", v34);

    objc_msgSend(v33, "setLocalizedTitle:", v32);
    objc_msgSend(v33, "setType:", CFSTR("com.apple.springboardhome.application-shortcut-item.show-all-windows"));
    objc_msgSend(v24, "addObject:", v33);

  }
LABEL_16:
  if (v29)
  {
    SBHBundle();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("REARRANGE_ICONS_SHORTCUT_ITEM_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    _SBCreateRearrangeAppsApplicationShortcutItemWithLocalizedTitle(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v37);

  }
  if (a13)
  {
    v38 = objc_alloc_init(MEMORY[0x1E0DAADA0]);
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAADB8]), "initWithSystemImageName:", CFSTR("plus.app"));
    objc_msgSend(v38, "setIcon:", v39);

    SBHBundle();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("ADD_TO_HOMESCREEN_SHORTCUT_ITEM_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setLocalizedTitle:", v41);

    objc_msgSend(v38, "setType:", CFSTR("com.apple.springboardhome.application-shortcut-item.add-to-home-screen"));
    objc_msgSend(v24, "addObject:", v38);

  }
  if (a7)
    v42 = v20;
  else
    v42 = 1;
  if (((v65 | v42) & 1) == 0)
  {
    if (a12)
    {
      v43 = objc_alloc_init(MEMORY[0x1E0DAADA0]);
      objc_msgSend(v43, "setActivationMode:", 0);
      objc_msgSend(v43, "setBundleIdentifierToLaunch:", CFSTR("com.apple.TestFlight"));
      v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAADB8]), "initWithSystemImageName:", CFSTR("square.and.pencil"));
      objc_msgSend(v43, "setIcon:", v44);

      SBHBundle();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("SEND_BETA_FEEDBACK_APPLICATION_SHORTCUT_ITEM_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setLocalizedTitle:", v46);

      objc_msgSend(v43, "setType:", *MEMORY[0x1E0DABFB0]);
      v66 = *MEMORY[0x1E0DABFB8];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = v47;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, &v66, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setUserInfo:", v48);

      objc_msgSend(v24, "addObject:", v43);
    }
    else
    {
      v49 = (void *)MEMORY[0x1E0CB3940];
      SBHBundle();
      v43 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("SHARE_APPLICATION_SHORTCUT_ITEM_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "localizedStringWithFormat:", v50, v28);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      _SBCreateShareApplicationShortcutItemWithLocalizedTitle(v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObject:", v53);

      v29 = a14;
    }

  }
  if (v29)
  {
    v54 = objc_alloc_init(MEMORY[0x1E0DAADA0]);
    objc_msgSend(v54, "setType:", CFSTR("com.apple.springboardhome.application-shortcut-item.change-widget-size"));
    objc_msgSend(v24, "addObject:", v54);

  }
  if (objc_msgSend((id)objc_opt_class(), "supportsProtectedAppsShortcuts"))
  {
    _SBCreateAppProtectionApplicationShortcutItemForBundleIdentifier((uint64_t)v64);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v55)
      objc_msgSend(v24, "addObject:", v55);

  }
  switch(a15)
  {
    case 1:
      SBHBundle();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("HIDE_APP_SHORTCUT_ITEM_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      _SBCreateHideAppSuggestionApplicationShortcutItemWithLocalizedTitle(v57);
      v58 = objc_claimAutoreleasedReturnValue();
      goto LABEL_40;
    case 2:
      SBHBundle();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("REMOVE_APP_SHORTCUT_ITEM_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      _SBCreateRemoveAppApplicationShortcutItemWithLocalizedTitle(v57);
      v58 = objc_claimAutoreleasedReturnValue();
      goto LABEL_40;
    case 3:
      SBHBundle();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("DELETE_APP_SHORTCUT_ITEM_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      _SBCreateDeleteAppApplicationShortcutItemWithLocalizedTitle(v57);
      v58 = objc_claimAutoreleasedReturnValue();
LABEL_40:
      v59 = (void *)v58;
      objc_msgSend(v24, "addObject:", v58);

      break;
  }

  return v24;
}

+ (id)filteredApplicationShortcutItemsWithStaticApplicationShortcutItems:(id)a3 dynamicApplicationShortcutItems:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void (**v10)(void *, id);
  void *v11;
  _QWORD aBlock[4];
  id v14;

  if (!((unint64_t)a3 | (unint64_t)a4))
    return 0;
  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __141__SBHIconApplicationShortcutListComposer_filteredApplicationShortcutItemsWithStaticApplicationShortcutItems_dynamicApplicationShortcutItems___block_invoke;
  aBlock[3] = &unk_1E8D86880;
  v9 = v8;
  v14 = v9;
  v10 = (void (**)(void *, id))_Block_copy(aBlock);
  v10[2](v10, v7);

  v10[2](v10, v6);
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __141__SBHIconApplicationShortcutListComposer_filteredApplicationShortcutItemsWithStaticApplicationShortcutItems_dynamicApplicationShortcutItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") <= 3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_msgSend(v9, "localizedTitle", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "length");

        if (v11)
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
        if (objc_msgSend(*(id *)(a1 + 32), "count") == 4)
          break;
        if (v6 == ++v8)
        {
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v6)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

+ (BOOL)supportsMultiwindowShortcut
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

+ (id)homeScreenDefaults
{
  if (homeScreenDefaults_onceToken != -1)
    dispatch_once(&homeScreenDefaults_onceToken, &__block_literal_global_12);
  return (id)homeScreenDefaults_homeScreenDefaults;
}

void __60__SBHIconApplicationShortcutListComposer_homeScreenDefaults__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0DA9F98]);
  v1 = (void *)homeScreenDefaults_homeScreenDefaults;
  homeScreenDefaults_homeScreenDefaults = (uint64_t)v0;

}

+ (BOOL)supportsProtectedAppsShortcuts
{
  char v2;
  void *v3;
  int v4;
  char v5;

  v2 = _os_feature_enabled_impl();
  objc_msgSend(MEMORY[0x1E0D016E0], "tokenForCurrentProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasEntitlement:", CFSTR("com.apple.appprotectiond.read.access"));
  if (v4)
  {
    v4 = objc_msgSend(v3, "hasEntitlement:", CFSTR("com.apple.appprotectiond.write.access"));
    if (v4)
      LOBYTE(v4) = objc_msgSend(v3, "hasEntitlement:", CFSTR("com.apple.appprotectiond.guard.access"));
  }
  v5 = v2 & v4;

  return v5;
}

void __327__SBHIconApplicationShortcutListComposer_composedShortcutsForApplicationWithBundleIdentifier_iconDisplayName_staticItems_dynamicItems_applicationItemID_numberOfDisplayItemsInSwitcher_supportsMultipleWindows_isSystemApplication_isInternalApplication_isApplicationInBeta_isApplicationHidden_iconManagerAllowsEditing_removeStyle___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0DA9F98]);
  v1 = (void *)composedShortcutsForApplicationWithBundleIdentifier_iconDisplayName_staticItems_dynamicItems_applicationItemID_numberOfDisplayItemsInSwitcher_supportsMultipleWindows_isSystemApplication_isInternalApplication_isApplicationInBeta_isApplicationHidden_iconManagerAllowsEditing_removeStyle__homeScreenDefaults;
  composedShortcutsForApplicationWithBundleIdentifier_iconDisplayName_staticItems_dynamicItems_applicationItemID_numberOfDisplayItemsInSwitcher_supportsMultipleWindows_isSystemApplication_isInternalApplication_isApplicationInBeta_isApplicationHidden_iconManagerAllowsEditing_removeStyle__homeScreenDefaults = (uint64_t)v0;

}

+ (id)composedShortcutsForBookmarkIcon:(id)a3 withDisplayName:(id)a4 iconManagerAllowsEditing:(BOOL)a5 removeStyle:(int64_t)a6
{
  _BOOL4 v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  const __CFString *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  const __CFString *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  const __CFString *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  __CFString *v52;
  _QWORD v53[2];

  v7 = a5;
  v53[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v7)
  {
    SBHBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("REARRANGE_ICONS_SHORTCUT_ITEM_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _SBCreateRearrangeAppsApplicationShortcutItemWithLocalizedTitle(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v12);

  }
  if (objc_msgSend(v8, "displaysShareBookmarkShortcutItem"))
  {
    v13 = objc_msgSend(v8, "isAppClipIcon");
    SBHBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
    {
      v16 = CFSTR("SHARE_APPCLIP_APPLICATION_SHORTCUT_ITEM_TITLE");
      v17 = CFSTR("SpringBoardHome-AppClips");
    }
    else
    {
      v16 = CFSTR("SHARE_BOOKMARK_APPLICATION_SHORTCUT_ITEM_TITLE");
      v17 = CFSTR("SpringBoardHome");
    }
    objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_1E8D8E958, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    _SBCreateShareApplicationShortcutItemWithLocalizedTitle(v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v19);

  }
  if (objc_msgSend(v8, "displaysAppStoreURLShortcutItem"))
  {
    objc_msgSend(v8, "appClip");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fullAppStoreURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      SBHBundle();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("APPSTORE_URL_APPCLIP"), &stru_1E8D8E958, CFSTR("SpringBoardHome-AppClips"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (objc_class *)MEMORY[0x1E0DAADA0];
      v25 = v23;
      v26 = v21;
      v27 = objc_alloc_init(v24);
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAADC0]), "initWithSystemImageName:", CFSTR("appstore"));
      objc_msgSend(v27, "setIcon:", v28);

      objc_msgSend(v27, "setType:", CFSTR("com.apple.springboardhome.application-shortcut-item.appStoreLink"));
      objc_msgSend(v27, "setLocalizedTitle:", v25);

      v52 = kSBHIconAppStoreURLUserInfoKey;
      objc_msgSend(v26, "absoluteString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v53[0] = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setUserInfo:", v30);

      objc_msgSend(v9, "addObject:", v27);
    }
  }
  switch(a6)
  {
    case 1:
      objc_msgSend(v8, "webClip");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isAppClip");

      SBHBundle();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v37)
      {
        v40 = CFSTR("HIDE_APPCLIP_SHORTCUT_ITEM_TITLE");
        v41 = CFSTR("SpringBoardHome-AppClips");
      }
      else
      {
        v40 = CFSTR("HIDE_BOOKMARK_SHORTCUT_ITEM_TITLE");
        v41 = CFSTR("SpringBoardHome");
      }
      objc_msgSend(v38, "localizedStringForKey:value:table:", v40, &stru_1E8D8E958, v41);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      _SBCreateHideAppSuggestionApplicationShortcutItemWithLocalizedTitle(v33);
      v48 = objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    case 2:
      objc_msgSend(v8, "webClip");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "isAppClip");

      SBHBundle();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v44;
      if (v43)
      {
        v46 = CFSTR("HIDE_APPCLIP_SHORTCUT_ITEM_TITLE");
        v47 = CFSTR("SpringBoardHome-AppClips");
      }
      else
      {
        v46 = CFSTR("REMOVE_BOOKMARK_SHORTCUT_ITEM_TITLE");
        v47 = CFSTR("SpringBoardHome");
      }
      objc_msgSend(v44, "localizedStringForKey:value:table:", v46, &stru_1E8D8E958, v47);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      _SBCreateRemoveAppApplicationShortcutItemWithLocalizedTitle(v33);
      v48 = objc_claimAutoreleasedReturnValue();
LABEL_24:
      v49 = (void *)v48;
      objc_msgSend(v9, "addObject:", v48);
LABEL_27:

      break;
    case 3:
      v31 = objc_msgSend(v8, "isAppClipIcon");
      SBHBundle();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v31)
      {
        v34 = CFSTR("DELETE_APPCLIP_SHORTCUT_ITEM_TITLE");
        v35 = CFSTR("SpringBoardHome-AppClips");
      }
      else
      {
        v34 = CFSTR("DELETE_BOOKMARK_SHORTCUT_ITEM_TITLE");
        v35 = CFSTR("SpringBoardHome");
      }
      objc_msgSend(v32, "localizedStringForKey:value:table:", v34, &stru_1E8D8E958, v35);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      _SBCreateDeleteAppApplicationShortcutItemWithLocalizedTitle(v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v50);

      goto LABEL_27;
  }

  return v9;
}

+ (id)composedShortcutsForDownloadingApplicationWithBundleIdentifier:(id)a3 iconDisplayName:(id)a4 applicationItemID:(unint64_t)a5 canModifyDownloadState:(BOOL)a6 prioritizationIsAvailable:(BOOL)a7 downloadingInformationAgent:(id)a8 iconManagerAllowsEditing:(BOOL)a9 removeStyle:(int64_t)a10 canShare:(BOOL)a11
{
  _BOOL4 v12;
  _BOOL4 v13;
  int64_t v15;
  _BOOL4 v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  id v27;
  id v28;
  id v29;
  id v30;
  UIImage *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _BOOL4 v37;
  id v38;
  UIImage *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  UIImage *v46;
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
  uint64_t v63;
  void *v64;
  _BOOL4 v66;

  v12 = a7;
  v13 = a6;
  v15 = a10;
  v16 = a9;
  v17 = a3;
  v18 = a4;
  v19 = a8;
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v13 && ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v19, "isCloudDemoted") & 1) == 0))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v19, "isPrioritizable") && v12)
    {
      v21 = objc_alloc_init(MEMORY[0x1E0DAADA0]);
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAADB8]), "initWithType:", 33);
      objc_msgSend(v21, "setIcon:", v22);

      SBHBundle();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("PRIORITIZE_DOWNLOAD_APPLICATION_SHORTCUT_ITEM_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setLocalizedTitle:", v24);

      v15 = a10;
      objc_msgSend(v21, "setType:", CFSTR("com.apple.springboardhome.application-shortcut-item.prioritize-download"));
      objc_msgSend(v20, "addObject:", v21);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v25 = objc_msgSend(v19, "isPausable") ^ 1;
    else
      v25 = 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v26 = objc_msgSend(v19, "isPaused");
    else
      v26 = 0;
    if (((v25 | v26) & 1) == 0)
    {
      v27 = objc_alloc_init(MEMORY[0x1E0DAADA0]);
      v28 = objc_alloc(MEMORY[0x1E0DAAD98]);
      objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("PauseDownloadApplicationShortcutItemIcon"));
      v29 = v18;
      v30 = v17;
      v31 = (UIImage *)objc_claimAutoreleasedReturnValue();
      UIImagePNGRepresentation(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v28, "initWithImageData:dataType:isTemplate:", v32, 0, 1);
      objc_msgSend(v27, "setIcon:", v33);

      v17 = v30;
      v18 = v29;
      SBHBundle();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("PAUSE_DOWNLOAD_APPLICATION_SHORTCUT_ITEM_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setLocalizedTitle:", v35);

      v15 = a10;
      v16 = a9;
      objc_msgSend(v27, "setType:", CFSTR("com.apple.springboardhome.application-shortcut-item.pause-download"));
      objc_msgSend(v20, "addObject:", v27);

    }
    if (((v25 | v26 ^ 1) & 1) == 0)
    {
      v36 = objc_alloc_init(MEMORY[0x1E0DAADA0]);
      v37 = v16;
      v38 = objc_alloc(MEMORY[0x1E0DAAD98]);
      objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("ResumeDownloadApplicationShortcutItemIcon"));
      v39 = (UIImage *)objc_claimAutoreleasedReturnValue();
      UIImagePNGRepresentation(v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)objc_msgSend(v38, "initWithImageData:dataType:isTemplate:", v40, 0, 1);
      objc_msgSend(v36, "setIcon:", v41);

      v15 = a10;
      SBHBundle();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("RESUME_DOWNLOAD_APPLICATION_SHORTCUT_ITEM_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setLocalizedTitle:", v43);

      v16 = v37;
      objc_msgSend(v36, "setType:", CFSTR("com.apple.springboardhome.application-shortcut-item.resume-download"));
      objc_msgSend(v20, "addObject:", v36);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v19, "isCancelable"))
    {
      v44 = objc_alloc_init(MEMORY[0x1E0DAADA0]);
      v66 = v16;
      v45 = objc_alloc(MEMORY[0x1E0DAAD98]);
      objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", CFSTR("CancelDownloadApplicationShortcutItemIcon"));
      v46 = (UIImage *)objc_claimAutoreleasedReturnValue();
      UIImagePNGRepresentation(v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (void *)objc_msgSend(v45, "initWithImageData:dataType:isTemplate:", v47, 0, 1);
      objc_msgSend(v44, "setIcon:", v48);

      v15 = a10;
      SBHBundle();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("CANCEL_DOWNLOAD_APPLICATION_SHORTCUT_ITEM_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setLocalizedTitle:", v50);

      v16 = v66;
      objc_msgSend(v44, "setType:", CFSTR("com.apple.springboardhome.application-shortcut-item.cancel-download"));
      objc_msgSend(v20, "addObject:", v44);

    }
  }
  if (v16)
  {
    SBHBundle();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("REARRANGE_ICONS_SHORTCUT_ITEM_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    _SBCreateRearrangeAppsApplicationShortcutItemWithLocalizedTitle(v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v53);

  }
  if (a5 && a11)
  {
    v54 = (void *)MEMORY[0x1E0CB3940];
    SBHBundle();
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("SHARE_APPLICATION_SHORTCUT_ITEM_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "localizedStringWithFormat:", v56, v18);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    _SBCreateShareApplicationShortcutItemWithLocalizedTitle(v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v59);

  }
  if (objc_msgSend((id)objc_opt_class(), "supportsProtectedAppsShortcuts"))
  {
    _SBCreateAppProtectionApplicationShortcutItemForBundleIdentifier((uint64_t)v17);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
      objc_msgSend(v20, "addObject:", v60);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v19, "isCloudDemoted"))
  {
    if (v15 == 2)
    {
      SBHBundle();
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "localizedStringForKey:value:table:", CFSTR("REMOVE_APP_SHORTCUT_ITEM_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      _SBCreateRemoveAppApplicationShortcutItemWithLocalizedTitle(v62);
      v63 = objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
    if (v15 == 3)
    {
      SBHBundle();
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "localizedStringForKey:value:table:", CFSTR("DELETE_APP_SHORTCUT_ITEM_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      _SBCreateDeleteAppApplicationShortcutItemWithLocalizedTitle(v62);
      v63 = objc_claimAutoreleasedReturnValue();
LABEL_36:
      v64 = (void *)v63;
      objc_msgSend(v20, "addObject:", v63);

    }
  }

  return v20;
}

+ (id)composedShortcutsForFolderIcon:(id)a3 iconImageCache:(id)a4 iconManagerAllowsEditing:(BOOL)a5 removeStyle:(int64_t)a6 badgeViewGenerator:(id)a7
{
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  UIImage *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL4 v43;
  void *v44;
  id obj;
  uint64_t v46;
  uint64_t v47;
  void (**v48)(id, void *);
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  double v53;
  double v54;
  double v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v43 = a5;
  v61 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v48 = (void (**)(id, void *))a7;
  v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v11 = v10;

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v44 = v8;
  objc_msgSend(v8, "leafIconsWithBadgesSortedByImportance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reverseObjectEnumerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v13;
  v47 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (v47)
  {
    v46 = *(_QWORD *)v57;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v57 != v46)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v14);
      objc_msgSend(v15, "iconImageWithInfo:", v11 * 29.0 / v11, v11 * 29.0 / v11, v11, 0.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v48[2](v48, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "badgeBackgroundColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v11 * 29.0, v11 * 29.0);
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __144__SBHIconApplicationShortcutListComposer_composedShortcutsForFolderIcon_iconImageCache_iconManagerAllowsEditing_removeStyle_badgeViewGenerator___block_invoke;
      v50[3] = &unk_1E8D868C8;
      v53 = v11 * 29.0;
      v54 = v11 * 6.0;
      v51 = v16;
      v52 = v18;
      v55 = v11 * 10.0;
      v20 = v18;
      v21 = v16;
      objc_msgSend(v19, "imageWithActions:", v50);
      v22 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v23 = objc_alloc(MEMORY[0x1E0DAAD98]);
      UIImagePNGRepresentation(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v23, "initWithImageData:dataType:isTemplate:", v24, 0, 0);

      v26 = objc_alloc_init(MEMORY[0x1E0DAADA0]);
      objc_msgSend(v26, "setBadgeView:", v17);
      objc_msgSend(v15, "applicationBundleID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setBundleIdentifierToLaunch:", v27);

      objc_msgSend(v26, "setIcon:", v25);
      objc_msgSend(v15, "displayName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setLocalizedTitle:", v28);

      objc_msgSend(v26, "setType:", CFSTR("com.apple.springboardhome.application-shortcut-item.unread-notifications"));
      objc_msgSend(v49, "addObject:", v26);
      v29 = objc_msgSend(v49, "count");

      if (v29 == 4)
        break;
      if (v47 == ++v14)
      {
        v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
        if (v47)
          goto LABEL_3;
        break;
      }
    }
  }

  if (v43)
  {
    v30 = objc_alloc_init(MEMORY[0x1E0DAADA0]);
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAADB8]), "initWithSystemImageName:", CFSTR("pencil"));
    objc_msgSend(v30, "setIcon:", v31);

    SBHBundle();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("RENAME_FOLDER_APPLICATION_SHORTCUT_ITEM_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setLocalizedTitle:", v33);

    objc_msgSend(v30, "setType:", CFSTR("com.apple.springboardhome.application-shortcut-item.rename-folder"));
    objc_msgSend(v49, "addObject:", v30);

    SBHBundle();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("REARRANGE_ICONS_SHORTCUT_ITEM_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    _SBCreateRearrangeAppsApplicationShortcutItemWithLocalizedTitle(v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v36);

    if (a6 == 2)
    {
      v37 = objc_alloc_init(MEMORY[0x1E0DAADA0]);
      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAADB8]), "initWithSystemImageName:", CFSTR("minus.circle"));
      objc_msgSend(v37, "setIcon:", v38);

      SBHBundle();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("REMOVE_FOLDER_SHORTCUT_ITEM_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setLocalizedTitle:", v40);

      objc_msgSend(v37, "setType:", CFSTR("com.apple.springboardhome.application-shortcut-item.hide-folder"));
      objc_msgSend(v49, "addObject:", v37);

    }
  }

  return v49;
}

void __144__SBHIconApplicationShortcutListComposer_composedShortcutsForFolderIcon_iconImageCache_iconManagerAllowsEditing_removeStyle_badgeViewGenerator___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t v4;
  double v5;
  id v6;
  CGRect v7;
  CGRect v8;
  CGRect v9;

  v7.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
  v7.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
  v2 = *(double *)(a1 + 48);
  v7.size.width = v2;
  v7.size.height = v2;
  v8 = CGRectInset(v7, *(double *)(a1 + 56) * 0.5, *(double *)(a1 + 56) * 0.5);
  v9 = CGRectIntegral(v8);
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
  objc_msgSend(*(id *)(a1 + 40), "set");
  v3 = *(double *)(a1 + 64);
  v4 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");
  v5 = v2 - v3;
  if (v4 == 1)
    v5 = 0.0;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", v5, 0.0, v3, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fill");

}

+ (id)composedShortcutsForWidgetIcon:(id)a3 additionalApplicationShortcutItems:(id)a4 widgetIconSupportsConfiguration:(BOOL)a5 iconManagerAllowsEditing:(BOOL)a6 widgetSettings:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  char isKindOfClass;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  void *v54;
  void *v56;
  void *v57;
  id v58;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v8)
    goto LABEL_28;
  v16 = 0x1E0DAA000;
  if (objc_msgSend(v12, "isWidgetStackIcon"))
  {
    objc_msgSend(v12, "activeDataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v58 = a1;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v17, "suggestionSource") != 1)
      {
LABEL_14:
        if (!v9)
          goto LABEL_17;
        v37 = (void *)MEMORY[0x1E0CB3940];
        SBHBundle();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("CONFIGURE_WIDGET_WITH_NAME_SHORTCUT_ITEM_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "displayName");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v37;
        v36 = v38;
        objc_msgSend(v39, "stringWithFormat:", v30, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        _SBCreateConfigureWidgetApplicationShortcutItemWithLocalizedTitle(v33);
        v34 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
        objc_msgSend(v15, "addObject:", v34);

        v16 = 0x1E0DAA000uLL;
LABEL_17:
        SBHBundle();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("EDIT_STACK_SHORTCUT_ITEM_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        _SBCreateConfigureStackApplicationShortcutItemWithLocalizedTitle(v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v42);

        if (!os_variant_has_internal_content())
          goto LABEL_21;
        objc_msgSend(v58, "homeScreenDefaults");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "shouldHideReportWidgetStackRotationQuickAction");

        if ((v44 & 1) != 0)
          goto LABEL_21;
        v18 = objc_alloc_init(*(Class *)(v16 + 3488));
        v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAADB8]), "initWithSystemImageName:", CFSTR("ant.fill"));
        objc_msgSend(v18, "setIcon:", v45);

        objc_msgSend(v18, "setLocalizedTitle:", CFSTR("Report Rotation Issue"));
        objc_msgSend(v18, "setLocalizedSubtitle:", CFSTR("[Internal]"));
        objc_msgSend(v18, "setType:", CFSTR("com.apple.springboardhome.application-shortcut-item.debug-feedback-stack"));
        objc_msgSend(v15, "addObject:", v18);
LABEL_20:

LABEL_21:
        goto LABEL_22;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_14;
      v20 = objc_msgSend(v17, "suggestionSource");
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if (v20 != 1)
        goto LABEL_14;
      if ((isKindOfClass & 1) != 0)
      {
LABEL_12:
        v28 = objc_msgSend(v12, "iconDataSourceCount");
        if (v28 >= objc_msgSend(v14, "maximumWidgetsInAStack"))
          goto LABEL_17;
        v29 = (void *)MEMORY[0x1E0CB3940];
        SBHBundle();
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("ADD_TO_STACK_WITH_NAME_SHORTCUT_ITEM_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "displayName");
        v31 = v16;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringWithFormat:", v30, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_alloc_init(*(Class *)(v31 + 3488));
        v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAADB8]), "initWithSystemImageName:", CFSTR("rectangle.stack.badge.plus"));
        objc_msgSend(v34, "setIcon:", v35);

        v36 = v57;
        objc_msgSend(v34, "setLocalizedTitle:", v33);
        objc_msgSend(v34, "setType:", CFSTR("com.apple.springboardhome.application-shortcut-item.add-to-stack"));
        goto LABEL_16;
      }
    }
    v22 = (void *)MEMORY[0x1E0CB3940];
    SBHBundle();
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("HIDE_STACK_SUGGESTION_SHORTCUT_ITEM_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_alloc_init(MEMORY[0x1E0DAADA0]);
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAADB8]), "initWithSystemImageName:", CFSTR("hand.thumbsdown"));
    objc_msgSend(v26, "setIcon:", v27);

    objc_msgSend(v26, "setLocalizedTitle:", v25);
    objc_msgSend(v26, "setType:", CFSTR("com.apple.springboardhome.application-shortcut-item.hide-stack-suggestion"));
    objc_msgSend(v15, "addObject:", v26);

    v16 = 0x1E0DAA000uLL;
    goto LABEL_12;
  }
  if (v9)
  {
    SBHBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("CONFIGURE_WIDGET_SHORTCUT_ITEM_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
    v18 = (id)objc_claimAutoreleasedReturnValue();
    _SBCreateConfigureWidgetApplicationShortcutItemWithLocalizedTitle(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v19);

    goto LABEL_20;
  }
LABEL_22:
  v46 = objc_alloc_init(*(Class *)(v16 + 3488));
  objc_msgSend(v46, "setType:", CFSTR("com.apple.springboardhome.application-shortcut-item.change-widget-size"));
  objc_msgSend(v15, "addObject:", v46);

  if (v13)
    objc_msgSend(v15, "addObjectsFromArray:", v13);
  SBHBundle();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("REARRANGE_ICONS_SHORTCUT_ITEM_TITLE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  _SBCreateRearrangeAppsApplicationShortcutItemWithLocalizedTitle(v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v49);

  LODWORD(v47) = objc_msgSend(v12, "isWidgetStackIcon");
  SBHBundle();
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50;
  if ((_DWORD)v47)
    v52 = CFSTR("REMOVE_STACK_SHORTCUT_ITEM_TITLE");
  else
    v52 = CFSTR("REMOVE_WIDGET_SHORTCUT_ITEM_TITLE");
  objc_msgSend(v50, "localizedStringForKey:value:table:", v52, &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  _SBCreateRemoveWidgetApplicationShortcutItemWithLocalizedTitle(v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v54);

LABEL_28:
  return v15;
}

+ (unint64_t)sbh_shortcutSectionForItem:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a3;
  if (sbh_shortcutSectionForItem__systemActionTypesOnceToken != -1)
    dispatch_once(&sbh_shortcutSectionForItem__systemActionTypesOnceToken, &__block_literal_global_180);
  if (sbh_shortcutSectionForItem__widgetActionTypesOnceToken != -1)
    dispatch_once(&sbh_shortcutSectionForItem__widgetActionTypesOnceToken, &__block_literal_global_182);
  objc_msgSend(v3, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)sbh_shortcutSectionForItem__systemActionTypes, "containsObject:", v4) & 1) != 0)
    v5 = 2;
  else
    v5 = objc_msgSend((id)sbh_shortcutSectionForItem__widgetActionTypes, "containsObject:", v4);

  return v5;
}

void __69__SBHIconApplicationShortcutListComposer_sbh_shortcutSectionForItem___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[13];

  v4[12] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("com.apple.springboardhome.application-shortcut-item.share");
  v4[1] = CFSTR("com.apple.springboardhome.application-shortcut-item.show-all-windows");
  v4[2] = CFSTR("com.apple.springboardhome.application-shortcut-item.rearrange-icons");
  v4[3] = CFSTR("com.apple.springboardhome.application-shortcut-item.rename-folder");
  v4[4] = CFSTR("com.apple.springboardhome.application-shortcut-item.hide-folder");
  v4[5] = CFSTR("com.apple.springboardhome.application-shortcut-item.delete-app");
  v4[6] = CFSTR("com.apple.springboardhome.application-shortcut-item.remove-app");
  v4[7] = CFSTR("com.apple.springboardhome.application-shortcut-item.remove-widget");
  v4[8] = CFSTR("com.apple.springboardhome.application-shortcut-item.hide-app-suggestion");
  v4[9] = CFSTR("com.apple.springboardhome.application-shortcut-item.add-to-home-screen");
  v4[10] = CFSTR("com.apple.springboardhome.application-shortcut-item.appStoreLink");
  v4[11] = CFSTR("com.apple.springboardhome.application-shortcut-item.app-protection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 12);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sbh_shortcutSectionForItem__systemActionTypes;
  sbh_shortcutSectionForItem__systemActionTypes = v2;

}

void __69__SBHIconApplicationShortcutListComposer_sbh_shortcutSectionForItem___block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[13];

  v4[12] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("com.apple.springboardhome.application-shortcut-item.configure-widget");
  v4[1] = CFSTR("com.apple.springboardhome.application-shortcut-item.hide-stack-suggestion");
  v4[2] = CFSTR("com.apple.springboardhome.application-shortcut-item.hide-siri-suggestions-item");
  v4[3] = CFSTR("com.apple.springboardhome.application-shortcut-item.change-widget-size");
  v4[4] = CFSTR("com.apple.springboardhome.application-shortcut-item.change-widget-size-small");
  v4[5] = CFSTR("com.apple.springboardhome.application-shortcut-item.change-widget-size-medium");
  v4[6] = CFSTR("com.apple.springboardhome.application-shortcut-item.change-widget-size-large");
  v4[7] = CFSTR("com.apple.springboardhome.application-shortcut-item.change-widget-size-extralarge");
  v4[8] = CFSTR("com.apple.springboardhome.application-shortcut-item.change-widget-size-newsLargeTall");
  v4[9] = CFSTR("com.apple.springboardhome.application-shortcut-item.change-widget-to-app-icon");
  v4[10] = CFSTR("com.apple.springboardhome.application-shortcut-item.configure-stack");
  v4[11] = CFSTR("com.apple.springboardhome.application-shortcut-item.add-to-stack");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 12);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sbh_shortcutSectionForItem__widgetActionTypes;
  sbh_shortcutSectionForItem__widgetActionTypes = v2;

}

+ (BOOL)sbh_isShortcutItemSpringBoardOnly:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  char v6;

  v3 = sbh_isShortcutItemSpringBoardOnly__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&sbh_isShortcutItemSpringBoardOnly__onceToken, &__block_literal_global_183);
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend((id)sbh_isShortcutItemSpringBoardOnly__springBoardOnlyShortcutTypes, "containsObject:", v5);
  return v6;
}

void __76__SBHIconApplicationShortcutListComposer_sbh_isShortcutItemSpringBoardOnly___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.springboardhome.application-shortcut-item.rearrange-icons"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.springboardhome.application-shortcut-item.hide-app-suggestion"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.springboardhome.application-shortcut-item.delete-app"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.springboardhome.application-shortcut-item.remove-app"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.springboardhome.application-shortcut-item.remove-widget"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.springboardhome.application-shortcut-item.configure-widget"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.springboardhome.application-shortcut-item.configure-stack"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.springboardhome.application-shortcut-item.hide-stack-suggestion"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.springboardhome.application-shortcut-item.hide-siri-suggestions-item"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.springboardhome.application-shortcut-item.add-to-stack"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.springboardhome.application-shortcut-item.change-widget-size"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.springboardhome.application-shortcut-item.change-widget-size-small"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.springboardhome.application-shortcut-item.change-widget-size-medium"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.springboardhome.application-shortcut-item.change-widget-size-large"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.springboardhome.application-shortcut-item.change-widget-size-newsLargeTall"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.springboardhome.application-shortcut-item.change-widget-size-extralarge"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.springboardhome.application-shortcut-item.change-widget-to-app-icon"));
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)sbh_isShortcutItemSpringBoardOnly__springBoardOnlyShortcutTypes;
  sbh_isShortcutItemSpringBoardOnly__springBoardOnlyShortcutTypes = v0;

}

+ (BOOL)sbh_isDestructiveShortcutItem:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  char v6;

  v3 = sbh_isDestructiveShortcutItem__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&sbh_isDestructiveShortcutItem__onceToken, &__block_literal_global_185);
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend((id)sbh_isDestructiveShortcutItem__isDestructive, "containsObject:", v5);
  return v6;
}

void __72__SBHIconApplicationShortcutListComposer_sbh_isDestructiveShortcutItem___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.springboardhome.application-shortcut-item.delete-app"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.springboardhome.application-shortcut-item.remove-app"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.springboardhome.application-shortcut-item.remove-widget"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.springboardhome.application-shortcut-item.hide-folder"));
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)sbh_isDestructiveShortcutItem__isDestructive;
  sbh_isDestructiveShortcutItem__isDestructive = v0;

}

+ (BOOL)sbh_isShortcutItemDeleteOrRemove:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  char v6;

  v3 = sbh_isShortcutItemDeleteOrRemove__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&sbh_isShortcutItemDeleteOrRemove__onceToken, &__block_literal_global_186);
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend((id)sbh_isShortcutItemDeleteOrRemove__springBoardOnlyShortcutTypes, "containsObject:", v5);
  return v6;
}

void __75__SBHIconApplicationShortcutListComposer_sbh_isShortcutItemDeleteOrRemove___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.springboardhome.application-shortcut-item.delete-app"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.springboardhome.application-shortcut-item.remove-app"));
  objc_msgSend(v2, "addObject:", CFSTR("com.apple.springboardhome.application-shortcut-item.remove-widget"));
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)sbh_isShortcutItemDeleteOrRemove__springBoardOnlyShortcutTypes;
  sbh_isShortcutItemDeleteOrRemove__springBoardOnlyShortcutTypes = v0;

}

@end
