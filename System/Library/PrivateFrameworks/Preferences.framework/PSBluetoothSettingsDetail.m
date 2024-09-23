@implementation PSBluetoothSettingsDetail

+ (id)preferencesURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=Bluetooth"));
}

+ (id)iconImage
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "ps_synchronousIconWithTypeIdentifier:", CFSTR("com.apple.graphic-icon.bluetooth"));
}

+ (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  _PSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "+[PSBluetoothSettingsDetail setEnabled:]";
    v8 = 1024;
    v9 = v3;
    _os_log_impl(&dword_1A3819000, v4, OS_LOG_TYPE_DEFAULT, "######## %s - enabled: %d", (uint8_t *)&v6, 0x12u);
  }

  objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

}

+ (BOOL)isEnabled
{
  void *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  int v7;
  const __SCDynamicStore *v8;
  const __SCDynamicStore *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "available");

  _PSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v15 = 136315138;
      v16 = "+[PSBluetoothSettingsDetail isEnabled]";
      _os_log_impl(&dword_1A3819000, v4, OS_LOG_TYPE_DEFAULT, "######## %s - BT is already available", (uint8_t *)&v15, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "enabled");
  }
  else
  {
    if (v5)
    {
      v15 = 136315138;
      v16 = "+[PSBluetoothSettingsDetail isEnabled]";
      _os_log_impl(&dword_1A3819000, v4, OS_LOG_TYPE_DEFAULT, "######## %s - BT not available, checking SCDynamicStore", (uint8_t *)&v15, 0xCu);
    }

    v8 = SCDynamicStoreCreate(0, CFSTR("com.apple.settings.bluetooth"), 0, 0);
    if (!v8)
    {
      v7 = 0;
      goto LABEL_16;
    }
    v9 = v8;
    v6 = (void *)SCDynamicStoreCopyValue(v8, CFSTR("com.apple.MobileBluetooth"));
    _PSLoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315394;
      v16 = "+[PSBluetoothSettingsDetail isEnabled]";
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1A3819000, v10, OS_LOG_TYPE_DEFAULT, "######## %s - SCDynamicStore shows: %@", (uint8_t *)&v15, 0x16u);
    }

    objc_msgSend(v6, "objectForKey:", CFSTR("Powered"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      v7 = objc_msgSend(v11, "BOOLValue");
    else
      v7 = 0;
    CFRelease(v9);

  }
LABEL_16:
  _PSLoggingFacility();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315394;
    v16 = "+[PSBluetoothSettingsDetail isEnabled]";
    v17 = 1024;
    LODWORD(v18) = v7;
    _os_log_impl(&dword_1A3819000, v13, OS_LOG_TYPE_DEFAULT, "######## %s - enabled: %d", (uint8_t *)&v15, 0x12u);
  }

  return v7;
}

@end
