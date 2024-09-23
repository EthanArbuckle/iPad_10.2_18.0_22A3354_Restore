@implementation PXSKCloudServiceSetupMessageIdentifier

+ (NSString)join
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
  v2 = (id *)getSKCloudServiceSetupMessageIdentifierJoinSymbolLoc_ptr;
  v10 = getSKCloudServiceSetupMessageIdentifierJoinSymbolLoc_ptr;
  if (!getSKCloudServiceSetupMessageIdentifierJoinSymbolLoc_ptr)
  {
    v3 = StoreKitLibrary();
    v2 = (id *)dlsym(v3, "SKCloudServiceSetupMessageIdentifierJoin");
    v8[3] = (uint64_t)v2;
    getSKCloudServiceSetupMessageIdentifierJoinSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return (NSString *)*v2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SKCloudServiceSetupMessageIdentifier getSKCloudServiceSetupMessageIdentifierJoin(void)");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("StoreKit+PhotosUICore.m"), 26, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

+ (NSString)connect
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
  v2 = (id *)getSKCloudServiceSetupMessageIdentifierConnectSymbolLoc_ptr;
  v10 = getSKCloudServiceSetupMessageIdentifierConnectSymbolLoc_ptr;
  if (!getSKCloudServiceSetupMessageIdentifierConnectSymbolLoc_ptr)
  {
    v3 = StoreKitLibrary();
    v2 = (id *)dlsym(v3, "SKCloudServiceSetupMessageIdentifierConnect");
    v8[3] = (uint64_t)v2;
    getSKCloudServiceSetupMessageIdentifierConnectSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return (NSString *)*v2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SKCloudServiceSetupMessageIdentifier getSKCloudServiceSetupMessageIdentifierConnect(void)");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("StoreKit+PhotosUICore.m"), 27, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

+ (NSString)addMusic
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
  v2 = (id *)getSKCloudServiceSetupMessageIdentifierAddMusicSymbolLoc_ptr;
  v10 = getSKCloudServiceSetupMessageIdentifierAddMusicSymbolLoc_ptr;
  if (!getSKCloudServiceSetupMessageIdentifierAddMusicSymbolLoc_ptr)
  {
    v3 = StoreKitLibrary();
    v2 = (id *)dlsym(v3, "SKCloudServiceSetupMessageIdentifierAddMusic");
    v8[3] = (uint64_t)v2;
    getSKCloudServiceSetupMessageIdentifierAddMusicSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return (NSString *)*v2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SKCloudServiceSetupMessageIdentifier getSKCloudServiceSetupMessageIdentifierAddMusic(void)");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("StoreKit+PhotosUICore.m"), 28, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

+ (NSString)playMusic
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
  v2 = (id *)getSKCloudServiceSetupMessageIdentifierPlayMusicSymbolLoc_ptr;
  v10 = getSKCloudServiceSetupMessageIdentifierPlayMusicSymbolLoc_ptr;
  if (!getSKCloudServiceSetupMessageIdentifierPlayMusicSymbolLoc_ptr)
  {
    v3 = StoreKitLibrary();
    v2 = (id *)dlsym(v3, "SKCloudServiceSetupMessageIdentifierPlayMusic");
    v8[3] = (uint64_t)v2;
    getSKCloudServiceSetupMessageIdentifierPlayMusicSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return (NSString *)*v2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SKCloudServiceSetupMessageIdentifier getSKCloudServiceSetupMessageIdentifierPlayMusic(void)");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("StoreKit+PhotosUICore.m"), 29, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

@end
