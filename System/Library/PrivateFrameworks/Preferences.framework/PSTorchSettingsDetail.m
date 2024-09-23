@implementation PSTorchSettingsDetail

+ (id)preferencesURL
{
  return 0;
}

+ (id)iconImage
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA638], "ps_synchronousIconWithTypeIdentifier:", CFSTR("com.apple.graphic-icon.gear"));
}

+ (int64_t)torchState
{
  void *v2;
  int64_t v3;
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8B0A0], "defaultDeviceWithMediaType:", *MEMORY[0x1E0C8A808]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hasTorch"))
    v3 = objc_msgSend(v2, "isTorchAvailable");
  else
    v3 = -1;
  _PSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1A3819000, v4, OS_LOG_TYPE_DEFAULT, "########### Torch state (%d)", (uint8_t *)v6, 8u);
  }

  return v3;
}

+ (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  int v5;
  id v6;
  double v7;
  void *v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8B0A0], "defaultDeviceWithMediaType:", *MEMORY[0x1E0C8A808]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isTorchModeSupported:", v3))
  {
    v13 = 0;
    v5 = objc_msgSend(v4, "lockForConfiguration:", &v13);
    v6 = v13;
    v8 = v6;
    if (v5)
    {
      if (v3)
      {
        LODWORD(v7) = *MEMORY[0x1E0C89FE0];
        v12 = v6;
        objc_msgSend(v4, "setTorchModeOnWithLevel:error:", &v12, v7);
        v9 = v12;

        v8 = v9;
      }
      else
      {
        objc_msgSend(v4, "setTorchMode:", 0);
      }
      objc_msgSend(v4, "unlockForConfiguration");
    }
    _PSLoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = CFSTR("OFF");
      if (v3)
        v11 = CFSTR("ON");
      *(_DWORD *)buf = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_1A3819000, v10, OS_LOG_TYPE_DEFAULT, "########### Tried to set torch (%@) Error: %@", buf, 0x16u);
    }

  }
}

+ (BOOL)isEnabled
{
  void *v2;
  _BOOL4 v3;
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8B0A0], "defaultDeviceWithMediaType:", *MEMORY[0x1E0C8A808]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isTorchAvailable"))
    v3 = objc_msgSend(v2, "torchMode") == 1;
  else
    v3 = 0;
  _PSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("OFF");
    if (v3)
      v5 = CFSTR("ON");
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1A3819000, v4, OS_LOG_TYPE_DEFAULT, "########### Torch enabled (%@)", (uint8_t *)&v7, 0xCu);
  }

  return v3;
}

@end
