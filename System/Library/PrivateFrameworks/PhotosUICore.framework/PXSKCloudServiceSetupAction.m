@implementation PXSKCloudServiceSetupAction

+ (NSString)subscribe
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
  v2 = (id *)getSKCloudServiceSetupActionSubscribeSymbolLoc_ptr;
  v10 = getSKCloudServiceSetupActionSubscribeSymbolLoc_ptr;
  if (!getSKCloudServiceSetupActionSubscribeSymbolLoc_ptr)
  {
    v3 = StoreKitLibrary();
    v2 = (id *)dlsym(v3, "SKCloudServiceSetupActionSubscribe");
    v8[3] = (uint64_t)v2;
    getSKCloudServiceSetupActionSubscribeSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return (NSString *)*v2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SKCloudServiceSetupAction getSKCloudServiceSetupActionSubscribe(void)");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("StoreKit+PhotosUICore.m"), 24, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

@end
