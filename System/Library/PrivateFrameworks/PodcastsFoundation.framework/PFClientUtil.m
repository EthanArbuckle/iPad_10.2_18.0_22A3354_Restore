@implementation PFClientUtil

+ (BOOL)supportsDownloads
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__PFClientUtil_supportsDownloads__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportsDownloads_onceToken != -1)
    dispatch_once(&supportsDownloads_onceToken, block);
  return supportsDownloads_supportsDownloads;
}

+ (id)clientBundleVersion
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("CFBundleShortVersionString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)isRunningOnInternalOS
{
  if (isRunningOnInternalOS_onceToken != -1)
    dispatch_once(&isRunningOnInternalOS_onceToken, &__block_literal_global_18);
  return isRunningOnInternalOS_isRunningOnInternalOS;
}

+ (id)mediaApiClientVersion
{
  return CFSTR("1");
}

+ (BOOL)platformSupportsVideo
{
  return objc_msgSend(a1, "isRunningOnHomepod") ^ 1;
}

+ (BOOL)isRunningOnHomepod
{
  if (isRunningOnHomepod_onceToken != -1)
    dispatch_once(&isRunningOnHomepod_onceToken, &__block_literal_global_13);
  return isRunningOnHomepod_isRunningOnHomepod;
}

+ (BOOL)isRunningOnTV
{
  return 0;
}

uint64_t __33__PFClientUtil_supportsDownloads__block_invoke(uint64_t a1)
{
  uint64_t result;

  supportsDownloads_supportsDownloads = objc_msgSend(*(id *)(a1 + 32), "isPodcastsApp");
  if ((supportsDownloads_supportsDownloads & 1) != 0)
    result = 1;
  else
    result = isRunningUnitTests();
  supportsDownloads_supportsDownloads = result;
  return result;
}

+ (BOOL)isPodcastsApp
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__PFClientUtil_isPodcastsApp__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isPodcastsApp_onceToken != -1)
    dispatch_once(&isPodcastsApp_onceToken, block);
  return isPodcastsApp_isPodcastsApp;
}

+ (id)mediaApiClientIdentifier
{
  if (mediaApiClientIdentifier_onceToken != -1)
    dispatch_once(&mediaApiClientIdentifier_onceToken, &__block_literal_global_8);
  return (id)mediaApiClientIdentifier_identifier;
}

void __40__PFClientUtil_mediaApiClientIdentifier__block_invoke()
{
  void *v0;

  v0 = (void *)mediaApiClientIdentifier_identifier;
  mediaApiClientIdentifier_identifier = (uint64_t)CFSTR("com.apple.podcasts");

}

uint64_t __37__PFClientUtil_isRunningOnInternalOS__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  isRunningOnInternalOS_isRunningOnInternalOS = result;
  return result;
}

uint64_t __35__PFClientUtil_isRunningOnVisionOS__block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  isRunningOnVisionOS_isRunningOnVisionOS = (_DWORD)result == 11;
  return result;
}

uint64_t __34__PFClientUtil_isRunningOnHomepod__block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  isRunningOnHomepod_isRunningOnHomepod = (_DWORD)result == 7;
  return result;
}

void __29__PFClientUtil_isPodcastsApp__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "clientIdentifier");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isPodcastsApp_isPodcastsApp = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.podcasts"));

}

+ (id)clientIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "processName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (BOOL)isRunningOnVisionOS
{
  if (isRunningOnVisionOS_onceToken != -1)
    dispatch_once(&isRunningOnVisionOS_onceToken, &__block_literal_global_17_0);
  return isRunningOnVisionOS_isRunningOnVisionOS;
}

+ (id)clientIdentifierHeader
{
  return CFSTR("Podcasts");
}

+ (NSString)bagProfileName
{
  if (bagProfileName_onceToken != -1)
    dispatch_once(&bagProfileName_onceToken, &__block_literal_global_12);
  return (NSString *)CFSTR("Podcasts");
}

+ (NSString)bagProfileVersion
{
  return (NSString *)CFSTR("1");
}

+ (BOOL)isAppRemovalService
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__PFClientUtil_isAppRemovalService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isAppRemovalService_onceToken != -1)
    dispatch_once(&isAppRemovalService_onceToken, block);
  return isAppRemovalService_isAppRemovalService;
}

void __35__PFClientUtil_isAppRemovalService__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "clientIdentifier");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isAppRemovalService_isAppRemovalService = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.podcasts.appremoval"));

}

+ (BOOL)isPodcastsKit
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__PFClientUtil_isPodcastsKit__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isPodcastsKit_onceToken != -1)
    dispatch_once(&isPodcastsKit_onceToken, block);
  return isPodcastsKit_isPodcastsKit;
}

void __29__PFClientUtil_isPodcastsKit__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "clientIdentifier");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  isPodcastsKit_isPodcastsKit = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.PodcastsKit"));

}

+ (BOOL)isRunningOnDesktop
{
  return 0;
}

+ (BOOL)isRunningOnWatch
{
  if (isRunningOnWatch_onceToken != -1)
    dispatch_once(&isRunningOnWatch_onceToken, &__block_literal_global_16);
  return 0;
}

+ (BOOL)supportsLocalLibrary
{
  if (supportsLocalLibrary_onceToken != -1)
    dispatch_once(&supportsLocalLibrary_onceToken, &__block_literal_global_21_0);
  return (supportsLocalLibrary_supportsLocalLibrary & 1) == 0;
}

void __36__PFClientUtil_supportsLocalLibrary__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "valueForKey:", CFSTR("PodcastsThinClient"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", MEMORY[0x1E0C9AAB0]);

  supportsLocalLibrary_supportsLocalLibrary = v3;
}

+ (BOOL)supportsImageStore
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__PFClientUtil_supportsImageStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportsImageStore_onceToken != -1)
    dispatch_once(&supportsImageStore_onceToken, block);
  return supportsImageStore_supportsImageStore;
}

uint64_t __34__PFClientUtil_supportsImageStore__block_invoke(uint64_t a1)
{
  char v2;
  uint64_t result;
  char v4;

  v2 = os_feature_enabled_removed_imagestore();
  result = objc_msgSend(*(id *)(a1 + 32), "isRunningOnHomepod");
  if ((result & 1) != 0 || (result = objc_msgSend(*(id *)(a1 + 32), "isPodcastsKit"), (result & 1) != 0))
  {
    v4 = 0;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isAppRemovalService");
    v4 = (result | v2) ^ 1;
  }
  supportsImageStore_supportsImageStore = v4;
  return result;
}

+ (BOOL)supportsGUI
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__PFClientUtil_supportsGUI__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportsGUI_onceToken != -1)
    dispatch_once(&supportsGUI_onceToken, block);
  return supportsGUI_supportsGUI;
}

uint64_t __27__PFClientUtil_supportsGUI__block_invoke(uint64_t a1)
{
  uint64_t result;

  if ((objc_msgSend(*(id *)(a1 + 32), "isRunningOnHomepod") & 1) != 0)
    result = 0;
  else
    result = objc_msgSend(*(id *)(a1 + 32), "isPodcastsApp");
  supportsGUI_supportsGUI = result;
  return result;
}

@end
