@implementation SDCatalogUtilities

+ (void)_setCatalog:(id)a3
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v5)
      goto LABEL_7;
    v11 = 136315138;
    v12 = objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
    v6 = "Seeding: Setting catalog URL: %s";
    v7 = v4;
    v8 = 12;
  }
  else
  {
    if (!v5)
      goto LABEL_7;
    LOWORD(v11) = 0;
    v6 = "Seeding: Clearing catalog URL";
    v7 = v4;
    v8 = 2;
  }
  _os_log_impl(&dword_1D4F89000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
LABEL_7:

  objc_msgSend((id)objc_opt_class(), "_currentCatalog");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", v3) & 1) != 0)
  {
    +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[SDCatalogUtilities _setCatalog:].cold.1(v10);

  }
  else
  {
    CFPreferencesSetValue(CFSTR("CatalogURL"), v3, CFSTR("com.apple.SoftwareUpdate"), (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B250]);
    CFPreferencesAppSynchronize(CFSTR("com.apple.SoftwareUpdate"));
    notify_post("com.apple.SoftwareUpdate.CheckForCatalogChange");
  }

}

+ (void)_setAudience:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = (uint64_t)v3;
    _os_log_impl(&dword_1D4F89000, v4, OS_LOG_TYPE_DEFAULT, "will set mobile asset audience [%{public}@]", buf, 0xCu);
  }

  if (objc_msgSend(v3, "length"))
  {
    v5 = MASetPallasAudience();
    +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v9 = v5;
      _os_log_impl(&dword_1D4F89000, v6, OS_LOG_TYPE_DEFAULT, "did set mobile asset audience with result [%lld]", buf, 0xCu);
    }

    NSLog(CFSTR("audiences result was %lld"), v5);
  }
  else
  {
    +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4F89000, v7, OS_LOG_TYPE_INFO, "Failed to set audience: given value is nil", buf, 2u);
    }

  }
}

+ (void)_resetAssetAudience
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1D4F89000, v2, OS_LOG_TYPE_DEFAULT, "will reset mobile asset audience", (uint8_t *)&v5, 2u);
  }

  v3 = MASetPallasAudience();
  +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_1D4F89000, v4, OS_LOG_TYPE_DEFAULT, "did reset mobile asset audience with result [%lld]", (uint8_t *)&v5, 0xCu);
  }

}

+ (id)_currentCatalog
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.SoftwareUpdate"));
  return (id)(id)CFPreferencesCopyValue(CFSTR("CatalogURL"), CFSTR("com.apple.SoftwareUpdate"), (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B250]);
}

+ (id)_currentAssetAudience
{
  JUMPOUT(0x1D826D244);
}

+ (void)_setCatalog:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D4F89000, log, OS_LOG_TYPE_ERROR, "Seeding: Skipped changing catalog URL because it's already set", v1, 2u);
}

@end
