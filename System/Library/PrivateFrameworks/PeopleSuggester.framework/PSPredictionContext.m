@implementation PSPredictionContext

void __46___PSPredictionContext_supportsZKWSuggestions__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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

  v15 = (void *)MEMORY[0x1E0C99E60];
  +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants mobileMessagesComposeBundleId](_PSConstants, "mobileMessagesComposeBundleId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants mobileFacetimeBundleId](_PSConstants, "mobileFacetimeBundleId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants macFacetimeBundleId](_PSConstants, "macFacetimeBundleId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants mobilePhoneBundleId](_PSConstants, "mobilePhoneBundleId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants mobileSharePlayPeoplePickerBundleId](_PSConstants, "mobileSharePlayPeoplePickerBundleId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants macSharePlayPeoplePickerBundleId](_PSConstants, "macSharePlayPeoplePickerBundleId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants mobileMailAccountSettingsBundleId](_PSConstants, "mobileMailAccountSettingsBundleId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants preferencesBundleId](_PSConstants, "preferencesBundleId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants findMyBundleId](_PSConstants, "findMyBundleId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants passwordsAppBundleId](_PSConstants, "passwordsAppBundleId");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants macSafariBundleId](_PSConstants, "macSafariBundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants macSafariTechnologyPreviewBundleId](_PSConstants, "macSafariTechnologyPreviewBundleId");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants macSafariPlatformSupportBundleId](_PSConstants, "macSafariPlatformSupportBundleId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants realityLauncherBundleId](_PSConstants, "realityLauncherBundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants peoplePickerBundleId](_PSConstants, "peoplePickerBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants peoplePickerTesterBundleId](_PSConstants, "peoplePickerTesterBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants CKTesterBundleId](_PSConstants, "CKTesterBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithObjects:", v20, v14, v19, v13, v18, v12, v17, v16, v11, v10, v0, v9, v1, v2, v3, v4, v5,
    v6,
    0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)supportsZKWSuggestions_supportedBundleIds;
  supportsZKWSuggestions_supportedBundleIds = v7;

}

@end
