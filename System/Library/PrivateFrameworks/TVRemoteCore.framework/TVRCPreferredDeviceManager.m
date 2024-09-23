@implementation TVRCPreferredDeviceManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__TVRCPreferredDeviceManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, block);
  return (id)sharedInstance_sharedInstance_2;
}

void __44__TVRCPreferredDeviceManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_2;
  sharedInstance_sharedInstance_2 = (uint64_t)v1;

}

- (id)preferredDeviceIdentifier
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v7[16];

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("TVRCDeviceIdentifierKey"), CFSTR("com.apple.TVRemoteCore"));
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    _TVRCPreferredDeviceLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Could not find a preferred device. Returning a nil identifier.", v7, 2u);
    }

  }
  return v3;
}

- (double)preferredDeviceSearchTimeout
{
  void *v2;
  void *v3;
  float v4;
  double v5;
  NSObject *v6;
  uint8_t v8[16];

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("TVRCDeviceTimeoutKey"), CFSTR("com.apple.TVRemoteCore"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "floatValue");
    v5 = v4;
  }
  else
  {
    _TVRCPreferredDeviceLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "Could not find a preferred device timeout. Returning default value for timeout.", v8, 2u);
    }

    v5 = 1.6;
  }

  return v5;
}

- (void)setPreferredDevice:(id)a3
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  double v7;
  const void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  _TVRCPreferredDeviceLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v9 = 138543362;
      v10 = v3;
      _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Setting preferred device %{public}@", (uint8_t *)&v9, 0xCu);
    }

    CFPreferencesSetAppValue(CFSTR("TVRCDeviceIdentifierKey"), (CFPropertyListRef)objc_msgSend(v3, "identifier"), CFSTR("com.apple.TVRemoteCore"));
    v6 = objc_msgSend(v3, "connectionType");
    v7 = 1.6;
    if (v6 == 3)
      v7 = 5.0;
    v8 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
  }
  else
  {
    if (v5)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "Removing preferred device", (uint8_t *)&v9, 2u);
    }

    CFPreferencesSetAppValue(CFSTR("TVRCDeviceIdentifierKey"), 0, CFSTR("com.apple.TVRemoteCore"));
    v8 = 0;
  }
  CFPreferencesSetAppValue(CFSTR("TVRCDeviceTimeoutKey"), v8, CFSTR("com.apple.TVRemoteCore"));

}

@end
