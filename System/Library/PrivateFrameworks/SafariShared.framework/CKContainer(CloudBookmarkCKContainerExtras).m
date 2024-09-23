@implementation CKContainer(CloudBookmarkCKContainerExtras)

+ (id)_safari_containerWithIdentifier:()CloudBookmarkCKContainerExtras encryptionServiceName:environment:useApplicationBundleIdentifierOverride:
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C38]), "initWithContainerIdentifier:environment:", v9, a5);
  v12 = objc_alloc_init(MEMORY[0x1E0C94C48]);
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(v12, "setEncryptionServiceName:", v10);
    objc_msgSend(v12, "setUseZoneWidePCS:", 1);
  }
  if (a6)
  {
    objc_msgSend(v12, "setApplicationBundleIdentifierOverrideForPushTopicGeneration:", v9);
    objc_msgSend(v12, "setApplicationBundleIdentifierOverrideForContainerAccess:", v9);
    objc_msgSend(MEMORY[0x1E0CB34D0], "safari_safariApplicationPlatformBundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setApplicationBundleIdentifierOverrideForTCC:", v13);
    objc_msgSend(v12, "setApplicationBundleIdentifierOverrideForNetworkAttribution:", v13);
    objc_msgSend(v12, "setPrefersHiddenAllowedSharingOptionsUI:", 1);

  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C30]), "initWithContainerID:options:", v11, v12);

  return v14;
}

+ (id)safari_cloudBookmarksContainer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__CKContainer_CloudBookmarkCKContainerExtras__safari_cloudBookmarksContainer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (safari_cloudBookmarksContainer_onceToken != -1)
    dispatch_once(&safari_cloudBookmarksContainer_onceToken, block);
  return (id)safari_cloudBookmarksContainer_container;
}

+ (id)safari_historyContainer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__CKContainer_CloudBookmarkCKContainerExtras__safari_historyContainer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (safari_historyContainer_onceToken != -1)
    dispatch_once(&safari_historyContainer_onceToken, block);
  return (id)safari_historyContainer_container;
}

+ (id)safari_historyManateeContainer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__CKContainer_CloudBookmarkCKContainerExtras__safari_historyManateeContainer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (safari_historyManateeContainer_onceToken != -1)
    dispatch_once(&safari_historyManateeContainer_onceToken, block);
  return (id)safari_historyManateeContainer_container;
}

+ (id)safari_cloudTabsContainer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__CKContainer_CloudBookmarkCKContainerExtras__safari_cloudTabsContainer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (safari_cloudTabsContainer_onceToken != -1)
    dispatch_once(&safari_cloudTabsContainer_onceToken, block);
  return (id)safari_cloudTabsContainer_container;
}

+ (id)safari_cloudSettingsContainer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__CKContainer_CloudBookmarkCKContainerExtras__safari_cloudSettingsContainer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (safari_cloudSettingsContainer_onceToken != -1)
    dispatch_once(&safari_cloudSettingsContainer_onceToken, block);
  return (id)safari_cloudSettingsContainer_container;
}

+ (id)safari_scribbleFeedbackContainer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__CKContainer_CloudBookmarkCKContainerExtras__safari_scribbleFeedbackContainer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (safari_scribbleFeedbackContainer_onceToken != -1)
    dispatch_once(&safari_scribbleFeedbackContainer_onceToken, block);
  return (id)safari_scribbleFeedbackContainer_container;
}

+ (id)safari_cloudExtensionsContainer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__CKContainer_CloudBookmarkCKContainerExtras__safari_cloudExtensionsContainer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (safari_cloudExtensionsContainer_onceToken != -1)
    dispatch_once(&safari_cloudExtensionsContainer_onceToken, block);
  return (id)safari_cloudExtensionsContainer_container;
}

+ (uint64_t)_safari_containerEnvironment
{
  if (_safari_containerEnvironment_onceToken != -1)
    dispatch_once(&_safari_containerEnvironment_onceToken, &__block_literal_global_11);
  return _safari_containerEnvironment_environment;
}

@end
