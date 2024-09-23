@implementation CKContainer

void __77__CKContainer_CloudBookmarkCKContainerExtras__safari_cloudBookmarksContainer__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_safari_containerWithIdentifier:encryptionServiceName:environment:useApplicationBundleIdentifierOverride:", CFSTR("com.apple.SafariShared.WBSCloudBookmarksStore"), 0, objc_msgSend(*(id *)(a1 + 32), "_safari_containerEnvironment"), 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)safari_cloudBookmarksContainer_container;
  safari_cloudBookmarksContainer_container = v1;

}

void __70__CKContainer_CloudBookmarkCKContainerExtras__safari_historyContainer__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_safari_containerWithIdentifier:encryptionServiceName:environment:useApplicationBundleIdentifierOverride:", CFSTR("com.apple.SafariShared.WBSCloudHistoryStore"), 0, objc_msgSend(*(id *)(a1 + 32), "_safari_containerEnvironment"), 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)safari_historyContainer_container;
  safari_historyContainer_container = v1;

}

void __77__CKContainer_CloudBookmarkCKContainerExtras__safari_historyManateeContainer__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_safari_containerWithIdentifier:encryptionServiceName:environment:useApplicationBundleIdentifierOverride:", CFSTR("com.apple.SafariShared.History"), CFSTR("com.apple.SafariShared.History"), objc_msgSend(*(id *)(a1 + 32), "_safari_containerEnvironment"), 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)safari_historyManateeContainer_container;
  safari_historyManateeContainer_container = v1;

}

void __72__CKContainer_CloudBookmarkCKContainerExtras__safari_cloudTabsContainer__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_safari_containerWithIdentifier:encryptionServiceName:environment:useApplicationBundleIdentifierOverride:", CFSTR("com.apple.SafariShared.CloudTabs"), CFSTR("com.apple.SafariShared.CloudTabs"), objc_msgSend(*(id *)(a1 + 32), "_safari_containerEnvironment"), 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)safari_cloudTabsContainer_container;
  safari_cloudTabsContainer_container = v1;

}

void __76__CKContainer_CloudBookmarkCKContainerExtras__safari_cloudSettingsContainer__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_safari_containerWithIdentifier:encryptionServiceName:environment:useApplicationBundleIdentifierOverride:", CFSTR("com.apple.SafariShared.Settings"), CFSTR("com.apple.SafariShared.History"), objc_msgSend(*(id *)(a1 + 32), "_safari_containerEnvironment"), 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)safari_cloudSettingsContainer_container;
  safari_cloudSettingsContainer_container = v1;

}

void __79__CKContainer_CloudBookmarkCKContainerExtras__safari_scribbleFeedbackContainer__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_safari_containerWithIdentifier:encryptionServiceName:environment:useApplicationBundleIdentifierOverride:", CFSTR("com.apple.SafariShared.WebElementVisibilityFeedback"), 0, objc_msgSend(*(id *)(a1 + 32), "_safari_containerEnvironment"), 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)safari_scribbleFeedbackContainer_container;
  safari_scribbleFeedbackContainer_container = v1;

}

void __78__CKContainer_CloudBookmarkCKContainerExtras__safari_cloudExtensionsContainer__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_safari_containerWithIdentifier:encryptionServiceName:environment:useApplicationBundleIdentifierOverride:", CFSTR("com.apple.SafariShared.Settings"), CFSTR("com.apple.SafariShared.History"), objc_msgSend(*(id *)(a1 + 32), "_safari_containerEnvironment"), 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)safari_cloudExtensionsContainer_container;
  safari_cloudExtensionsContainer_container = v1;

}

void __75__CKContainer_CloudBookmarkCKContainerExtras___safari_containerEnvironment__block_invoke()
{
  void *v0;
  int v1;

  _safari_containerEnvironment_environment = 1;
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "isInternalInstall"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("WBSDebugUseCloudKitContainerSandboxEnvironment"));

    if (v1)
      _safari_containerEnvironment_environment = 2;
  }
}

@end
