@implementation SDAnalytics

+ (NSUUID)deviceIdentifier
{
  if (deviceIdentifier_onceToken != -1)
    dispatch_once(&deviceIdentifier_onceToken, &__block_literal_global_0);
  return (NSUUID *)(id)deviceIdentifier_uuid;
}

void __31__SDAnalytics_deviceIdentifier__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.seeding"));
  objc_msgSend(v0, "stringForKey:", CFSTR("DeviceIdentifier"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v1);
    v3 = (void *)deviceIdentifier_uuid;
    deviceIdentifier_uuid = v2;

    +[SDSeedingLogging analyticsHandle](SDSeedingLogging, "analyticsHandle");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)deviceIdentifier_uuid, "UUIDString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v5;
      _os_log_impl(&dword_1D4F89000, v4, OS_LOG_TYPE_DEFAULT, "Device identifier: %{public}@", (uint8_t *)&v11, 0xCu);

    }
  }
  if (!deviceIdentifier_uuid)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)deviceIdentifier_uuid;
    deviceIdentifier_uuid = v6;

    +[SDSeedingLogging analyticsHandle](SDSeedingLogging, "analyticsHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)deviceIdentifier_uuid, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1D4F89000, v8, OS_LOG_TYPE_DEFAULT, "Device identifier (new): %{public}@", (uint8_t *)&v11, 0xCu);

    }
    objc_msgSend((id)deviceIdentifier_uuid, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "setValue:forKey:", v10, CFSTR("DeviceIdentifier"));

  }
}

+ (void)deviceDidEnrollInSeeding
{
  NSObject *v2;
  uint8_t v3[16];

  +[SDSeedingLogging analyticsHandle](SDSeedingLogging, "analyticsHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D4F89000, v2, OS_LOG_TYPE_INFO, "Sending activated event", v3, 2u);
  }

  AnalyticsSendEventLazy();
}

void *__39__SDAnalytics_deviceDidEnrollInSeeding__block_invoke()
{
  return &unk_1E98D66A0;
}

+ (void)deviceDidUnenrollFromSeeding
{
  NSObject *v2;
  uint8_t v3[16];

  +[SDSeedingLogging analyticsHandle](SDSeedingLogging, "analyticsHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D4F89000, v2, OS_LOG_TYPE_INFO, "Sending deactivated event", v3, 2u);
  }

  AnalyticsSendEventLazy();
}

void *__43__SDAnalytics_deviceDidUnenrollFromSeeding__block_invoke()
{
  return &unk_1E98D66C8;
}

+ (void)deviceDidDeclineLegalAgreement
{
  NSObject *v2;
  uint8_t v3[16];

  +[SDSeedingLogging analyticsHandle](SDSeedingLogging, "analyticsHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D4F89000, v2, OS_LOG_TYPE_INFO, "Sending legaldeclined event", v3, 2u);
  }

  AnalyticsSendEventLazy();
}

void *__45__SDAnalytics_deviceDidDeclineLegalAgreement__block_invoke()
{
  return &unk_1E98D66F0;
}

@end
