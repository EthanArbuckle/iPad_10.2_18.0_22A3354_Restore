@implementation PXSKCloudServiceSetupOptionsKey

+ (NSString)action
{
  id *v2;
  void *v3;
  NSString *result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (id *)getSKCloudServiceSetupOptionsActionKeySymbolLoc_ptr;
  v10 = getSKCloudServiceSetupOptionsActionKeySymbolLoc_ptr;
  if (!getSKCloudServiceSetupOptionsActionKeySymbolLoc_ptr)
  {
    v3 = StoreKitLibrary();
    v2 = (id *)dlsym(v3, "SKCloudServiceSetupOptionsActionKey");
    v8[3] = (uint64_t)v2;
    getSKCloudServiceSetupOptionsActionKeySymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return (NSString *)*v2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SKCloudServiceSetupOptionsKey getSKCloudServiceSetupOptionsActionKey(void)");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("StoreKit+PhotosUICore.m"), 18, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

+ (NSString)iTunesItemIdentifier
{
  id *v2;
  void *v3;
  NSString *result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (id *)getSKCloudServiceSetupOptionsITunesItemIdentifierKeySymbolLoc_ptr;
  v10 = getSKCloudServiceSetupOptionsITunesItemIdentifierKeySymbolLoc_ptr;
  if (!getSKCloudServiceSetupOptionsITunesItemIdentifierKeySymbolLoc_ptr)
  {
    v3 = StoreKitLibrary();
    v2 = (id *)dlsym(v3, "SKCloudServiceSetupOptionsITunesItemIdentifierKey");
    v8[3] = (uint64_t)v2;
    getSKCloudServiceSetupOptionsITunesItemIdentifierKeySymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return (NSString *)*v2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SKCloudServiceSetupOptionsKey getSKCloudServiceSetupOptionsITunesItemIdentifierKey(void)");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("StoreKit+PhotosUICore.m"), 19, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

+ (NSString)affiliateToken
{
  id *v2;
  void *v3;
  NSString *result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (id *)getSKCloudServiceSetupOptionsAffiliateTokenKeySymbolLoc_ptr;
  v10 = getSKCloudServiceSetupOptionsAffiliateTokenKeySymbolLoc_ptr;
  if (!getSKCloudServiceSetupOptionsAffiliateTokenKeySymbolLoc_ptr)
  {
    v3 = StoreKitLibrary();
    v2 = (id *)dlsym(v3, "SKCloudServiceSetupOptionsAffiliateTokenKey");
    v8[3] = (uint64_t)v2;
    getSKCloudServiceSetupOptionsAffiliateTokenKeySymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return (NSString *)*v2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SKCloudServiceSetupOptionsKey getSKCloudServiceSetupOptionsAffiliateTokenKey(void)");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("StoreKit+PhotosUICore.m"), 20, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

+ (NSString)campaignToken
{
  id *v2;
  void *v3;
  NSString *result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (id *)getSKCloudServiceSetupOptionsCampaignTokenKeySymbolLoc_ptr;
  v10 = getSKCloudServiceSetupOptionsCampaignTokenKeySymbolLoc_ptr;
  if (!getSKCloudServiceSetupOptionsCampaignTokenKeySymbolLoc_ptr)
  {
    v3 = StoreKitLibrary();
    v2 = (id *)dlsym(v3, "SKCloudServiceSetupOptionsCampaignTokenKey");
    v8[3] = (uint64_t)v2;
    getSKCloudServiceSetupOptionsCampaignTokenKeySymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return (NSString *)*v2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SKCloudServiceSetupOptionsKey getSKCloudServiceSetupOptionsCampaignTokenKey(void)");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("StoreKit+PhotosUICore.m"), 21, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

+ (NSString)messageIdentifier
{
  id *v2;
  void *v3;
  NSString *result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (id *)getSKCloudServiceSetupOptionsMessageIdentifierKeySymbolLoc_ptr;
  v10 = getSKCloudServiceSetupOptionsMessageIdentifierKeySymbolLoc_ptr;
  if (!getSKCloudServiceSetupOptionsMessageIdentifierKeySymbolLoc_ptr)
  {
    v3 = StoreKitLibrary();
    v2 = (id *)dlsym(v3, "SKCloudServiceSetupOptionsMessageIdentifierKey");
    v8[3] = (uint64_t)v2;
    getSKCloudServiceSetupOptionsMessageIdentifierKeySymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return (NSString *)*v2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SKCloudServiceSetupOptionsKey getSKCloudServiceSetupOptionsMessageIdentifierKey(void)");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("StoreKit+PhotosUICore.m"), 22, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

@end
