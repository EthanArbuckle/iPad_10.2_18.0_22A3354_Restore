@implementation SESSettingsEligiblity

+ (BOOL)isDefaultContactlessAppConfigurationEligible
{
  return 0;
}

+ (BOOL)isSecureElementTCCServiceEligible
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  _DWORD v11[2];
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.seserviced.contactlessCredential.settings"));
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "BOOLForKey:", CFSTR("shouldShowSecureElementTcc"));
    SESDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v11[0] = 67109376;
      v11[1] = 0;
      v12 = 1024;
      v13 = v4;
      v6 = "SE TCC Pane: Platform eligible %d, Apps eligible: %d";
      v7 = v5;
      v8 = OS_LOG_TYPE_INFO;
      v9 = 14;
LABEL_6:
      _os_log_impl(&dword_20A048000, v7, v8, v6, (uint8_t *)v11, v9);
    }
  }
  else
  {
    SESDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v11[0]) = 0;
      v6 = "Unable to initialize user default suite for Settings Eligibility";
      v7 = v5;
      v8 = OS_LOG_TYPE_DEBUG;
      v9 = 2;
      goto LABEL_6;
    }
  }

  return 0;
}

+ (BOOL)isContactlessTCCServiceEligible
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.seserviced.contactlessCredential.settings"));
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "BOOLForKey:", CFSTR("shouldShowContactlessTcc"));
    SESDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109376;
      v7[1] = 1;
      v8 = 1024;
      v9 = v4;
      _os_log_impl(&dword_20A048000, v5, OS_LOG_TYPE_INFO, "Contactless TCC Pane: Platform eligible %d, Apps eligible: %d", (uint8_t *)v7, 0xEu);
    }
  }
  else
  {
    SESDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl(&dword_20A048000, v5, OS_LOG_TYPE_DEBUG, "Unable to initialize user default suite for Settings Eligibility", (uint8_t *)v7, 2u);
    }
    LOBYTE(v4) = 0;
  }

  return v4;
}

+ (BOOL)isApplicationInstalledOrPlaceholder:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  BOOL v7;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v9 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, &v9);
  v5 = v9;
  if (v5)
  {
    SESDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_20A048000, v6, OS_LOG_TYPE_ERROR, "Error %@ encountered when checking if %@ is installed", buf, 0x16u);
    }

    v7 = 0;
  }
  else
  {
    v7 = v4 != 0;
  }

  return v7;
}

@end
