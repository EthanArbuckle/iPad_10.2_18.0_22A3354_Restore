@implementation WBSWebExtensionNewTabOverridePreferencesManager

- (BOOL)shouldNewTabPageOverriddenByAnEnabledExtensionApplyInPrivateBrowsingWithUserDefaults:(id)a3
{
  WBSWebExtensionsController **p_webExtensionsController;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  char v9;

  p_webExtensionsController = &self->_webExtensionsController;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_webExtensionsController);
  -[WBSWebExtensionNewTabOverridePreferencesManager _webExtensionOverridingNewTabPageWithDefaults:](self, "_webExtensionOverridingNewTabPageWithDefaults:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "allowedInPrivateBrowsing"))
  {
    objc_msgSend(v7, "extension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(WeakRetained, "extensionIsEnabled:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isNewTabPageOverriddenByAnEnabledExtensionInUserDefaults:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  char v7;

  -[WBSWebExtensionNewTabOverridePreferencesManager _webExtensionOverridingNewTabPageWithDefaults:](self, "_webExtensionOverridingNewTabPageWithDefaults:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_webExtensionsController);
  objc_msgSend(v4, "extension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(WeakRetained, "extensionIsEnabled:", v6);

  return v7;
}

- (id)_webExtensionOverridingNewTabPageWithDefaults:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webExtensionsController);
  objc_msgSend(WeakRetained, "profileServerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:](WBSWebExtensionUtilities, "isProfileServerIDForDefaultProfile:", v6);

  if (v7)
  {
    objc_msgSend(v4, "dictionaryForKey:", CFSTR("IdentifierOfExtensionWithOverridePageForNewTabs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "profileServerID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_stringForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "webExtensionForComposedIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(WeakRetained, "profile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "settingForKey:", *MEMORY[0x1E0D8A458]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "length"))
    {
      objc_msgSend(WeakRetained, "webExtensionForComposedIdentifier:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (WBSWebExtensionNewTabOverridePreferencesManager)initWithExtensionsController:(id)a3
{
  id v4;
  WBSWebExtensionNewTabOverridePreferencesManager *v5;
  WBSWebExtensionNewTabOverridePreferencesManager *v6;
  WBSWebExtensionNewTabOverridePreferencesManager *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WBSWebExtensionNewTabOverridePreferencesManager;
  v5 = -[WBSWebExtensionNewTabOverridePreferencesManager init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_webExtensionsController, v4);
    v7 = v6;
  }

  return v6;
}

+ (void)migrateStorageToPerProfileFormatIfNecessaryWithDefaults:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "stringForKey:", CFSTR("IdentifierOfExtensionWithOverridePageForNewTabs"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7 = *MEMORY[0x1E0D8A2D8];
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("IdentifierOfExtensionWithOverridePageForNewTabs"));

  }
}

- (id)sortedComposedIdentifiersForExtensionsWithOverridePages
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_webExtensionsController);
  objc_msgSend(WeakRetained, "extensions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __106__WBSWebExtensionNewTabOverridePreferencesManager_sortedComposedIdentifiersForExtensionsWithOverridePages__block_invoke;
  v12[3] = &unk_1E5448A28;
  v5 = WeakRetained;
  v13 = v5;
  objc_msgSend(v3, "sortedArrayUsingComparator:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __106__WBSWebExtensionNewTabOverridePreferencesManager_sortedComposedIdentifiersForExtensionsWithOverridePages__block_invoke_2;
  v10[3] = &unk_1E5448A50;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "safari_mapAndFilterObjectsUsingBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __106__WBSWebExtensionNewTabOverridePreferencesManager_sortedComposedIdentifiersForExtensionsWithOverridePages__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "webExtensionForExtension:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "webExtensionForExtension:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "localizedCompare:", v10);

  return v11;
}

id __106__WBSWebExtensionNewTabOverridePreferencesManager_sortedComposedIdentifiersForExtensionsWithOverridePages__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "webExtensionForExtension:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "newTabOverridePageURL");
  if (v5 && objc_msgSend(*(id *)(a1 + 32), "extensionIsEnabled:", v3))
  {
    objc_msgSend(v4, "composedIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)extensionComposedIdentifierForNewTabPreferenceInDefaults:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webExtensionsController);
  objc_msgSend(WeakRetained, "profileServerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:](WBSWebExtensionUtilities, "isProfileServerIDForDefaultProfile:", v6);

  if (v7)
  {
    objc_msgSend(v4, "dictionaryForKey:", CFSTR("IdentifierOfExtensionWithOverridePageForNewTabs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "profileServerID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(WeakRetained, "profile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "settingForKey:", *MEMORY[0x1E0D8A458]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v8;
    else
      v12 = 0;
    v10 = v12;
  }

  return v10;
}

- (void)setNewTabBehaviorWithExtensionComposedIdentifier:(id)a3 inDefaults:(id)a4
{
  -[WBSWebExtensionNewTabOverridePreferencesManager setNewTabBehaviorWithExtensionComposedIdentifier:inDefaults:fromUserGesture:](self, "setNewTabBehaviorWithExtensionComposedIdentifier:inDefaults:fromUserGesture:", a3, a4, 1);
}

- (void)setNewTabBehaviorWithExtensionComposedIdentifier:(id)a3 inDefaults:(id)a4 fromUserGesture:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webExtensionsController);
  objc_msgSend(WeakRetained, "profileServerID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:](WBSWebExtensionUtilities, "isProfileServerIDForDefaultProfile:", v11))
  {
    objc_msgSend(v9, "dictionaryForKey:", CFSTR("IdentifierOfExtensionWithOverridePageForNewTabs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v20 = v15;

    objc_msgSend(v20, "setObject:forKeyedSubscript:", v8, v11);
    objc_msgSend(v9, "setObject:forKey:", v20, CFSTR("IdentifierOfExtensionWithOverridePageForNewTabs"));
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D8A2D8]))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "safari_setDate:forKey:", v21, CFSTR("NewTabPageLastModified"));

      objc_msgSend(v9, "setBool:forKey:", v5, CFSTR("NewTabPageSetByUserGesture"));
      +[WBSCloudExtensionStateManager sharedManager](WBSCloudExtensionStateManager, "sharedManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localExtensionStateDidChange");

    }
  }
  else
  {
    objc_msgSend(WeakRetained, "tabGroupManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "profile");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __127__WBSWebExtensionNewTabOverridePreferencesManager_setNewTabBehaviorWithExtensionComposedIdentifier_inDefaults_fromUserGesture___block_invoke;
    v23[3] = &unk_1E5445640;
    v24 = v8;
    v19 = (id)objc_msgSend(v16, "updateProfileWithIdentifier:persist:usingBlock:completionHandler:", v18, 1, v23, 0);

  }
}

void __127__WBSWebExtensionNewTabOverridePreferencesManager_setNewTabBehaviorWithExtensionComposedIdentifier_inDefaults_fromUserGesture___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  const __CFString *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v3, "numberWithInteger:", 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSetting:forKey:", v4, *MEMORY[0x1E0D8A460]);

  if (*(_QWORD *)(a1 + 32))
    v5 = *(const __CFString **)(a1 + 32);
  else
    v5 = &stru_1E5449658;
  objc_msgSend(v6, "setSetting:forKey:", v5, *MEMORY[0x1E0D8A458]);

}

- (void)clearNewTabBehaviorInDefaults:(id)a3
{
  -[WBSWebExtensionNewTabOverridePreferencesManager clearNewTabBehaviorInDefaults:fromUserGesture:](self, "clearNewTabBehaviorInDefaults:fromUserGesture:", a3, 1);
}

- (void)clearNewTabBehaviorInDefaults:(id)a3 fromUserGesture:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v4 = a4;
  v17 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webExtensionsController);
  objc_msgSend(WeakRetained, "profileServerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:](WBSWebExtensionUtilities, "isProfileServerIDForDefaultProfile:", v7))
  {
    objc_msgSend(WeakRetained, "tabGroupManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "profile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v12, "updateProfileWithIdentifier:persist:usingBlock:completionHandler:", v14, 1, &__block_literal_global_66, 0);

LABEL_8:
    goto LABEL_9;
  }
  objc_msgSend(v17, "dictionaryForKey:", CFSTR("IdentifierOfExtensionWithOverridePageForNewTabs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_msgSend(v12, "removeObjectForKey:", v7);
  objc_msgSend(v17, "setValue:forKey:", v12, CFSTR("IdentifierOfExtensionWithOverridePageForNewTabs"));
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D8A2D8]))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "safari_setDate:forKey:", v16, CFSTR("NewTabPageLastModified"));

    objc_msgSend(v17, "setBool:forKey:", v4, CFSTR("NewTabPageSetByUserGesture"));
    +[WBSCloudExtensionStateManager sharedManager](WBSCloudExtensionStateManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localExtensionStateDidChange");
    goto LABEL_8;
  }
LABEL_9:

}

uint64_t __97__WBSWebExtensionNewTabOverridePreferencesManager_clearNewTabBehaviorInDefaults_fromUserGesture___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSetting:forKey:", &stru_1E5449658, *MEMORY[0x1E0D8A458]);
}

- (id)cloudExtensionStateForDefaults:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  int v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_webExtensionsController);
  objc_msgSend(WeakRetained, "profileServerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D8A2D8]);

  if (v7)
  {
    if (-[WBSWebExtensionNewTabOverridePreferencesManager isNewTabPageOverriddenByAnEnabledExtensionInUserDefaults:](self, "isNewTabPageOverriddenByAnEnabledExtensionInUserDefaults:", v4))
    {
      -[WBSWebExtensionNewTabOverridePreferencesManager extensionComposedIdentifierForNewTabPreferenceInDefaults:](self, "extensionComposedIdentifierForNewTabPreferenceInDefaults:", v4);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = &stru_1E5449658;
    }
    objc_msgSend(v4, "safari_dateForKey:", CFSTR("NewTabPageLastModified"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "safari_setDate:forKey:", v10, CFSTR("NewTabPageLastModified"));
    }
    v11 = *MEMORY[0x1E0D8A598];
    v14[0] = *MEMORY[0x1E0D8A590];
    v14[1] = v11;
    v15[0] = v8;
    v15[1] = v10;
    v14[2] = *MEMORY[0x1E0D8A5A0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "BOOLForKey:", CFSTR("NewTabPageSetByUserGesture")));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_webExtensionsController);
}

@end
