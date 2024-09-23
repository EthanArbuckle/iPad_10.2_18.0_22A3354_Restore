@implementation WBSFeatureAvailability

+ (BOOL)isSearchProviderEnabled:(unint64_t)a3
{
  if (a3 < 3)
    return objc_msgSend(a1, "_shouldShowChineseFeatures");
  if (a3 == 3)
    return objc_msgSend(a1, "_shouldShowRussianFeatures");
  return 0;
}

uint64_t __43__WBSFeatureAvailability_isInternalInstall__block_invoke()
{
  uint64_t result;

  result = os_variant_allows_internal_security_policies();
  isInternalInstall_isInternalInstall = result;
  return result;
}

+ (BOOL)isOngoingCredentialSharingEnabled
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  BOOL result;
  const char *v8;
  uint8_t *v9;
  _BOOL4 v10;
  void *v11;
  int v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;
  __int16 v19;
  __int16 v20;

  +[WBSKeychainSyncingMonitor sharedMonitor](WBSKeychainSyncingMonitor, "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "keychainSyncSettingValue");

  if (v4 == 1)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXKeychain();
    v10 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v10)
      return result;
    v19 = 0;
    v8 = "Ongoing credential sharing is disabled because iCloud Keychain is disabled";
    v9 = (uint8_t *)&v19;
    goto LABEL_17;
  }
  if (!v4)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXKeychain();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v6)
      return result;
    v20 = 0;
    v8 = "Ongoing credential sharing is disabled because iCloud Keychain state is unknown";
    v9 = (uint8_t *)&v20;
    goto LABEL_17;
  }
  +[WBSPrimaryAppleAccountObserver sharedObserver](WBSPrimaryAppleAccountObserver, "sharedObserver");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isCurrentAppleIDManaged");

  if (v12)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXKeychain();
    v13 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v13)
      return result;
    v18 = 0;
    v8 = "Ongoing credential sharing is disabled for Managed Apple IDs";
    v9 = (uint8_t *)&v18;
    goto LABEL_17;
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXKeychain();
    v14 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v14)
      return result;
    v17 = 0;
    v8 = "Ongoing credential sharing is disabled because the runtime feature flag is disabled";
    v9 = (uint8_t *)&v17;
    goto LABEL_17;
  }
  if ((objc_msgSend(a1, "_isPasswordSharingAvailable") & 1) != 0)
    return 1;
  v5 = WBS_LOG_CHANNEL_PREFIXKeychain();
  v15 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v15)
  {
    v16 = 0;
    v8 = "Ongoing credential sharing is disabled because profile that disables Password Sharing is installed to device.";
    v9 = (uint8_t *)&v16;
LABEL_17:
    _os_log_impl(&dword_1B2621000, v5, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    return 0;
  }
  return result;
}

+ (BOOL)isPerSiteSettingSyncEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safari_BOOLForKey:defaultValue:", CFSTR("WBSEnablePerSiteSettingsSync"), 1);

  return v3;
}

+ (BOOL)isSafariProfilesEnabled
{
  return 1;
}

+ (BOOL)isInternalInstall
{
  if (isInternalInstall_onceToken != -1)
    dispatch_once(&isInternalInstall_onceToken, &__block_literal_global_44);
  return isInternalInstall_isInternalInstall;
}

+ (BOOL)isLockedPrivateBrowsingEnabled
{
  return 1;
}

+ (BOOL)defaultSearchEngineMatchesExperiment
{
  void *v2;
  char v3;

  +[WBSSearchEnginePreferenceObserver sharedObserver](WBSSearchEnginePreferenceObserver, "sharedObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "defaultSearchEngineMatchesExperiment");

  return v3;
}

+ (BOOL)isCustomizationSyncEnabled
{
  if ((objc_msgSend(a1, "isPerSiteSettingSyncEnabled") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "isStartPageSettingSyncEnabled");
}

+ (BOOL)_shouldShowChineseFeatures
{
  return 0;
}

+ (BOOL)_shouldShowRussianFeatures
{
  return 0;
}

+ (BOOL)supportsURLCredentialStorageAccessControlGroups
{
  if (supportsURLCredentialStorageAccessControlGroups_onceToken != -1)
    dispatch_once(&supportsURLCredentialStorageAccessControlGroups_onceToken, &__block_literal_global_10);
  return supportsURLCredentialStorageAccessControlGroups_supportsURLCredentialStorageAccessControlGroups;
}

uint64_t __73__WBSFeatureAvailability_supportsURLCredentialStorageAccessControlGroups__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0C92C68], "instancesRespondToSelector:", NSSelectorFromString(CFSTR("_allCredentialsWithAccessControlGroup:includeLegacyKeychain:")));
  supportsURLCredentialStorageAccessControlGroups_supportsURLCredentialStorageAccessControlGroups = result;
  return result;
}

+ (BOOL)wantsAggressiveKeychainCredentialCaching
{
  return 0;
}

+ (BOOL)hasInternalContent
{
  if (hasInternalContent_onceToken != -1)
    dispatch_once(&hasInternalContent_onceToken, &__block_literal_global_46);
  return hasInternalContent_hasInternalContent;
}

uint64_t __44__WBSFeatureAvailability_hasInternalContent__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_content();
  hasInternalContent_hasInternalContent = result;
  return result;
}

+ (BOOL)shouldShowInternalUI
{
  void *v2;
  int v3;

  if (shouldShowInternalUI_onceToken != -1)
    dispatch_once(&shouldShowInternalUI_onceToken, &__block_literal_global_47_0);
  if (shouldShowInternalUI_hasInternalUI)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("hideInternalUI")) ^ 1;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

uint64_t __46__WBSFeatureAvailability_shouldShowInternalUI__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_ui();
  shouldShowInternalUI_hasInternalUI = result;
  return result;
}

+ (BOOL)_is2024StartPageDisabledOverride
{
  if (_is2024StartPageDisabledOverride_onceToken != -1)
    dispatch_once(&_is2024StartPageDisabledOverride_onceToken, &__block_literal_global_49);
  return _is2024StartPageDisabledOverride_is2024StartPageDisabledOverride;
}

void __58__WBSFeatureAvailability__is2024StartPageDisabledOverride__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _is2024StartPageDisabledOverride_is2024StartPageDisabledOverride = objc_msgSend(v0, "safari_BOOLForKey:defaultValue:", CFSTR("WBSDisable2024StartPageOverride"), 0);

}

+ (BOOL)is2024StartPageSectionTitleEnabled
{
  return +[WBSFeatureAvailability is2024FavoritesEnabled](WBSFeatureAvailability, "is2024FavoritesEnabled")|| +[WBSFeatureAvailability is2024CloudTabsEnabled](WBSFeatureAvailability, "is2024CloudTabsEnabled")|| +[WBSFeatureAvailability is2024SuggestionsEnabled](WBSFeatureAvailability, "is2024SuggestionsEnabled")|| +[WBSFeatureAvailability is2024PrivacyReportEnabled](WBSFeatureAvailability, "is2024PrivacyReportEnabled")|| +[WBSFeatureAvailability is2024ReadingListEnabled](WBSFeatureAvailability, "is2024ReadingListEnabled");
}

+ (BOOL)is2024FavoritesEnabled
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__WBSFeatureAvailability_is2024FavoritesEnabled__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (is2024FavoritesEnabled_onceToken != -1)
    dispatch_once(&is2024FavoritesEnabled_onceToken, block);
  return is2024FavoritesEnabled_is2024FavoritesEnabled;
}

void __48__WBSFeatureAvailability_is2024FavoritesEnabled__block_invoke(uint64_t a1)
{
  char v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "safari_BOOLForKey:defaultValue:", CFSTR("WBSEnable2024Favorites"), 1))
    v2 = objc_msgSend(*(id *)(a1 + 32), "_is2024StartPageDisabledOverride") ^ 1;
  else
    v2 = 0;
  is2024FavoritesEnabled_is2024FavoritesEnabled = v2;

}

+ (BOOL)is2024CloudTabsEnabled
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__WBSFeatureAvailability_is2024CloudTabsEnabled__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (is2024CloudTabsEnabled_onceToken != -1)
    dispatch_once(&is2024CloudTabsEnabled_onceToken, block);
  return is2024CloudTabsEnabled_is2024CloudTabsEnabled;
}

void __48__WBSFeatureAvailability_is2024CloudTabsEnabled__block_invoke(uint64_t a1)
{
  char v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "safari_BOOLForKey:defaultValue:", CFSTR("WBSEnable2024CloudTabs"), 1))
    v2 = objc_msgSend(*(id *)(a1 + 32), "_is2024StartPageDisabledOverride") ^ 1;
  else
    v2 = 0;
  is2024CloudTabsEnabled_is2024CloudTabsEnabled = v2;

}

+ (BOOL)is2024SuggestionsEnabled
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__WBSFeatureAvailability_is2024SuggestionsEnabled__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (is2024SuggestionsEnabled_onceToken != -1)
    dispatch_once(&is2024SuggestionsEnabled_onceToken, block);
  return is2024SuggestionsEnabled_is2024SuggestionsEnabled;
}

void __50__WBSFeatureAvailability_is2024SuggestionsEnabled__block_invoke(uint64_t a1)
{
  char v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "safari_BOOLForKey:defaultValue:", CFSTR("WBSEnable2024Suggestions"), 1))
    v2 = objc_msgSend(*(id *)(a1 + 32), "_is2024StartPageDisabledOverride") ^ 1;
  else
    v2 = 0;
  is2024SuggestionsEnabled_is2024SuggestionsEnabled = v2;

}

+ (BOOL)is2024PrivacyReportEnabled
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__WBSFeatureAvailability_is2024PrivacyReportEnabled__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (is2024PrivacyReportEnabled_onceToken != -1)
    dispatch_once(&is2024PrivacyReportEnabled_onceToken, block);
  return is2024PrivacyReportEnabled_is2024PrivacyReportEnabled;
}

void __52__WBSFeatureAvailability_is2024PrivacyReportEnabled__block_invoke(uint64_t a1)
{
  char v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "safari_BOOLForKey:defaultValue:", CFSTR("WBSEnable2024PrivacyReport"), 1))
    v2 = objc_msgSend(*(id *)(a1 + 32), "_is2024StartPageDisabledOverride") ^ 1;
  else
    v2 = 0;
  is2024PrivacyReportEnabled_is2024PrivacyReportEnabled = v2;

}

+ (BOOL)is2024ReadingListEnabled
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__WBSFeatureAvailability_is2024ReadingListEnabled__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (is2024ReadingListEnabled_onceToken != -1)
    dispatch_once(&is2024ReadingListEnabled_onceToken, block);
  return is2024ReadingListEnabled_is2024ReadingListEnabled;
}

void __50__WBSFeatureAvailability_is2024ReadingListEnabled__block_invoke(uint64_t a1)
{
  char v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "safari_BOOLForKey:defaultValue:", CFSTR("WBSEnable2024ReadingList"), 1))
    v2 = objc_msgSend(*(id *)(a1 + 32), "_is2024StartPageDisabledOverride") ^ 1;
  else
    v2 = 0;
  is2024ReadingListEnabled_is2024ReadingListEnabled = v2;

}

+ (BOOL)isStartPageSettingSyncEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safari_BOOLForKey:defaultValue:", CFSTR("WBSEnableCloudSettingsSync"), 1);

  return v3;
}

+ (BOOL)isSiriReadThisEnabled
{
  if (isSiriReadThisEnabled_onceToken != -1)
    dispatch_once(&isSiriReadThisEnabled_onceToken, &__block_literal_global_51);
  return isSiriReadThisEnabled_isSiriReadThisEnabled;
}

void __47__WBSFeatureAvailability_isSiriReadThisEnabled__block_invoke()
{
  id v0;

  if (_os_feature_enabled_impl())
  {
    isSiriReadThisEnabled_isSiriReadThisEnabled = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    isSiriReadThisEnabled_isSiriReadThisEnabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("EnableSiriReadThis"));

  }
}

+ (BOOL)isAirDropPasswordsEnabled
{
  void *v3;
  char v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  BOOL result;
  const char *v10;
  uint8_t *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;

  +[WBSPrimaryAppleAccountObserver sharedObserver](WBSPrimaryAppleAccountObserver, "sharedObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUsingICloud");

  if ((v4 & 1) == 0)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXKeychain();
    v12 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v12)
      return result;
    v16 = 0;
    v10 = "AirDrop password sharing is disabled because user don't have iCloud";
    v11 = (uint8_t *)&v16;
    goto LABEL_11;
  }
  +[WBSPrimaryAppleAccountObserver sharedObserver](WBSPrimaryAppleAccountObserver, "sharedObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCurrentAppleIDManaged");

  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXKeychain();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v8)
      return result;
    v15 = 0;
    v10 = "AirDrop password sharing is disabled for Managed Apple IDs";
    v11 = (uint8_t *)&v15;
    goto LABEL_11;
  }
  if ((objc_msgSend(a1, "_isPasswordSharingAvailable") & 1) != 0)
    return 1;
  v7 = WBS_LOG_CHANNEL_PREFIXKeychain();
  v13 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v13)
  {
    v14 = 0;
    v10 = "AirDrop password sharing is disabled because profile that disables Password Sharing is installed to device.";
    v11 = (uint8_t *)&v14;
LABEL_11:
    _os_log_impl(&dword_1B2621000, v7, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
    return 0;
  }
  return result;
}

+ (BOOL)_isPasswordSharingAvailable
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasswordSharingAllowed");

  return v3;
}

+ (BOOL)isNewTabAndWindowSyncingEnabled
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__WBSFeatureAvailability_isNewTabAndWindowSyncingEnabled__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isNewTabAndWindowSyncingEnabled_onceToken != -1)
    dispatch_once(&isNewTabAndWindowSyncingEnabled_onceToken, block);
  return isNewTabAndWindowSyncingEnabled_isNewTabAndWindowSyncingEnabled;
}

void __57__WBSFeatureAvailability_isNewTabAndWindowSyncingEnabled__block_invoke(uint64_t a1)
{
  id v1;

  if ((objc_msgSend(*(id *)(a1 + 32), "isSafariProfilesEnabled") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    isNewTabAndWindowSyncingEnabled_isNewTabAndWindowSyncingEnabled = objc_msgSend(v1, "safari_BOOLForKey:defaultValue:", CFSTR("EnableSafariProfileNewTabAndWindowBehaviorSyncing"), 1);

  }
  else
  {
    isNewTabAndWindowSyncingEnabled_isNewTabAndWindowSyncingEnabled = 0;
  }
}

+ (BOOL)isShowURLsInURLAutocompleteDebugChannelEnabled
{
  return _WBSFeatureAvailabilityIsShowURLsInURLAutocompleteDebugChannelEnabled;
}

+ (void)toggleShowURLsInURLAutocompleteDebugChannel
{
  dispatch_time_t v2;

  if (_WBSFeatureAvailabilityIsShowURLsInURLAutocompleteDebugChannelEnabled == 1)
  {
    _WBSFeatureAvailabilityIsShowURLsInURLAutocompleteDebugChannelEnabled = 0;
  }
  else
  {
    _WBSFeatureAvailabilityIsShowURLsInURLAutocompleteDebugChannelEnabled = 1;
    v2 = dispatch_time(0, 600000000000);
    dispatch_after(v2, MEMORY[0x1E0C80D38], &__block_literal_global_59);
  }
}

void __69__WBSFeatureAvailability_toggleShowURLsInURLAutocompleteDebugChannel__block_invoke()
{
  _WBSFeatureAvailabilityIsShowURLsInURLAutocompleteDebugChannelEnabled = 0;
}

+ (BOOL)isStreamlinedCompletionListEnabled
{
  if (isStreamlinedCompletionListEnabled_onceToken != -1)
    dispatch_once(&isStreamlinedCompletionListEnabled_onceToken, &__block_literal_global_60);
  return isStreamlinedCompletionListEnabled_usesStreamlinedCompletionList;
}

void __60__WBSFeatureAvailability_isStreamlinedCompletionListEnabled__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  isStreamlinedCompletionListEnabled_usesStreamlinedCompletionList = objc_msgSend(v0, "BOOLForKey:", CFSTR("DebugStreamlinedCompletionList"));

}

+ (BOOL)isLabelPreviousSearchesInCompletionListEnabled
{
  if (isLabelPreviousSearchesInCompletionListEnabled_onceToken != -1)
    dispatch_once(&isLabelPreviousSearchesInCompletionListEnabled_onceToken, &__block_literal_global_61);
  return isLabelPreviousSearchesInCompletionListEnabled_usesLabelPreviousSearchesInCompletionList;
}

void __72__WBSFeatureAvailability_isLabelPreviousSearchesInCompletionListEnabled__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  isLabelPreviousSearchesInCompletionListEnabled_usesLabelPreviousSearchesInCompletionList = objc_msgSend(v0, "BOOLForKey:", CFSTR("DebugLabelPreviousSearchesInCompletionList"));

}

+ (BOOL)isReflectUserIntentInSearchEnabled
{
  if (isReflectUserIntentInSearchEnabled_onceToken != -1)
    dispatch_once(&isReflectUserIntentInSearchEnabled_onceToken, &__block_literal_global_62);
  return isReflectUserIntentInSearchEnabled_isReflectUserIntentInSearchEnabled;
}

void __60__WBSFeatureAvailability_isReflectUserIntentInSearchEnabled__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  isReflectUserIntentInSearchEnabled_isReflectUserIntentInSearchEnabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("DebugReflectUserIntentInSearch"));

}

+ (BOOL)isSearchEvaluationLoggingEnabled
{
  if (isSearchEvaluationLoggingEnabled_onceToken != -1)
    dispatch_once(&isSearchEvaluationLoggingEnabled_onceToken, &__block_literal_global_64);
  return isSearchEvaluationLoggingEnabled_isSearchEvaluationLoggingEnabled;
}

void __58__WBSFeatureAvailability_isSearchEvaluationLoggingEnabled__block_invoke()
{
  void *v0;
  void *v1;
  dispatch_time_t v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  isSearchEvaluationLoggingEnabled_isSearchEvaluationLoggingEnabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("WBSDebugSearchEvaluationLogging"));

  if (isSearchEvaluationLoggingEnabled_isSearchEvaluationLoggingEnabled)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "removeObjectForKey:", CFSTR("WBSDebugSearchEvaluationLogging"));

    v2 = dispatch_time(0, 900000000000);
    dispatch_after(v2, MEMORY[0x1E0C80D38], &__block_literal_global_65);
  }
}

void __58__WBSFeatureAvailability_isSearchEvaluationLoggingEnabled__block_invoke_2()
{
  isSearchEvaluationLoggingEnabled_isSearchEvaluationLoggingEnabled = 0;
}

+ (BOOL)isDTOMitigationEnabled
{
  int v2;
  void *v3;
  char v4;

  v2 = _os_feature_enabled_impl();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CC12C8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isFeatureEnabled");

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)isBrowsingAssistantEnabled
{
  if (isBrowsingAssistantEnabled_onceToken != -1)
    dispatch_once(&isBrowsingAssistantEnabled_onceToken, &__block_literal_global_69);
  return isBrowsingAssistantEnabled_browsingAssistantEnabled;
}

void __52__WBSFeatureAvailability_isBrowsingAssistantEnabled__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  isBrowsingAssistantEnabled_browsingAssistantEnabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("WBSEnableBrowsingAssistant"));

}

+ (BOOL)isOnDeviceSummarizationEnabled
{
  if (isOnDeviceSummarizationEnabled_onceToken != -1)
    dispatch_once(&isOnDeviceSummarizationEnabled_onceToken, &__block_literal_global_70);
  return isOnDeviceSummarizationEnabled_onDeviceSummarizationEnabled;
}

void __56__WBSFeatureAvailability_isOnDeviceSummarizationEnabled__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  isOnDeviceSummarizationEnabled_onDeviceSummarizationEnabled = objc_msgSend(v0, "safari_BOOLForKey:defaultValue:", CFSTR("EnableOnDeviceSummarization"), 1);

}

+ (BOOL)isPasswordManagerAppEnabledAndInstalled
{
  int v3;

  v3 = objc_msgSend(a1, "isPasswordManagerAppEnabled");
  if (v3)
    LOBYTE(v3) = objc_msgSend(a1, "isPasswordManagerAppInstalled");
  return v3;
}

+ (BOOL)isPasswordManagerAppEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isPasswordManagerAppInstalled
{
  void *v2;
  void *v3;
  BOOL v4;
  uint64_t v6;

  v6 = 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.Passwords"), 1, &v6);
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "isPlaceholder"))
      v4 = (unint64_t)(objc_msgSend(v3, "installType") - 7) < 3;
    else
      v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (void)setAutomaticStrongPasswordsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("EnableAutomaticStrongPasswords"));

}

+ (BOOL)isAutomaticStrongPasswordsEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safari_BOOLForKey:defaultValue:", CFSTR("EnableAutomaticStrongPasswords"), 1);

  return v3;
}

+ (BOOL)isAutomaticPasskeyUpgradesEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "pm_defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safari_BOOLForKey:defaultValue:", CFSTR("AllowAutomaticPasskeyUpgrades"), 1);

  return v3;
}

+ (void)setIsAutomaticPasskeyUpgradesEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "pm_defaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("AllowAutomaticPasskeyUpgrades"));

}

+ (BOOL)isSignInWithAppleInPasswordManagerEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSignInWithAppleCredentialSharingEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isWebKitTextExtractionEnabled
{
  if (isWebKitTextExtractionEnabled_onceToken != -1)
    dispatch_once(&isWebKitTextExtractionEnabled_onceToken, &__block_literal_global_78);
  return isWebKitTextExtractionEnabled_isWebKitTextExtractionEnabled;
}

void __55__WBSFeatureAvailability_isWebKitTextExtractionEnabled__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  isWebKitTextExtractionEnabled_isWebKitTextExtractionEnabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("DebugDisableWebKitTextExtraction")) ^ 1;

}

+ (BOOL)isAppleAccountBrandingEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSMARTParsecResultsEnabled
{
  if (isSMARTParsecResultsEnabled_onceToken != -1)
    dispatch_once(&isSMARTParsecResultsEnabled_onceToken, &__block_literal_global_83_0);
  return isSMARTParsecResultsEnabled_isSMARTParsecResultsEnabled;
}

uint64_t __53__WBSFeatureAvailability_isSMARTParsecResultsEnabled__block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  isSMARTParsecResultsEnabled_isSMARTParsecResultsEnabled = result;
  return result;
}

+ (BOOL)isScribbleEnabled
{
  if (isScribbleEnabled_onceToken != -1)
    dispatch_once(&isScribbleEnabled_onceToken, &__block_literal_global_86);
  return isScribbleEnabled_isWEVFeatureFlagEnabled;
}

void __43__WBSFeatureAvailability_isScribbleEnabled__block_invoke()
{
  id v0;

  if (_os_feature_enabled_impl())
  {
    isScribbleEnabled_isWEVFeatureFlagEnabled = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    isScribbleEnabled_isWEVFeatureFlagEnabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("DebugEnableScribble"));

  }
}

+ (BOOL)scribbleRequiresVisualSimilarity
{
  if (scribbleRequiresVisualSimilarity_onceToken != -1)
    dispatch_once(&scribbleRequiresVisualSimilarity_onceToken, &__block_literal_global_90);
  return scribbleRequiresVisualSimilarity_requiresVisualSimilarity;
}

void __58__WBSFeatureAvailability_scribbleRequiresVisualSimilarity__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  scribbleRequiresVisualSimilarity_requiresVisualSimilarity = objc_msgSend(v0, "safari_BOOLForKey:defaultValue:", CFSTR("DebugScribbleRequiresVisualSimilarity"), 1);

}

@end
