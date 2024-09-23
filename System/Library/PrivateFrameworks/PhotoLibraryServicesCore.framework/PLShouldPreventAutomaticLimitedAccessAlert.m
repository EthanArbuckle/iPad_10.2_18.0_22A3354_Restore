@implementation PLShouldPreventAutomaticLimitedAccessAlert

void __PLShouldPreventAutomaticLimitedAccessAlert_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("PHPhotoLibraryPreventAutomaticLimitedAccessAlert"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("NSPhotoLibraryLimitedAccessAPISupport"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v3 = objc_msgSend(v2, "BOOLValue");
  PLShouldPreventAutomaticLimitedAccessAlert_shouldPreventAlert = v3;
  if (v3)
  {
    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_DEFAULT, "Preventing automatic limited access alert based on info.plist configuration", buf, 2u);
    }

  }
  if (!v2)
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("NSExtension"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NSExtensionPointIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && objc_msgSend(CFSTR("com.apple.widgetkit-extension"), "isEqual:", v6))
    {
      PLBackendGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_199DF7000, v7, OS_LOG_TYPE_DEFAULT, "Preventing automatic limited access alert for widget extension", v8, 2u);
      }

      PLShouldPreventAutomaticLimitedAccessAlert_shouldPreventAlert = 1;
    }

  }
}

@end
