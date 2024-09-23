@implementation SDSeedingLogging

+ (id)fwHandle
{
  if (fwHandle_onceToken != -1)
    dispatch_once(&fwHandle_onceToken, &__block_literal_global_3);
  return (id)fwHandle_handle;
}

void __28__SDSeedingLogging_fwHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.seeding", "Framework");
  v1 = (void *)fwHandle_handle;
  fwHandle_handle = (uint64_t)v0;

}

+ (OS_os_log)httpHandle
{
  if (httpHandle_onceToken != -1)
    dispatch_once(&httpHandle_onceToken, &__block_literal_global_4);
  return (OS_os_log *)(id)httpHandle_handle;
}

void __30__SDSeedingLogging_httpHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.seeding", "HTTP");
  v1 = (void *)httpHandle_handle;
  httpHandle_handle = (uint64_t)v0;

}

+ (OS_os_log)profileHandle
{
  if (profileHandle_onceToken != -1)
    dispatch_once(&profileHandle_onceToken, &__block_literal_global_6);
  return (OS_os_log *)(id)profileHandle_handle;
}

void __33__SDSeedingLogging_profileHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.seeding", "Profile");
  v1 = (void *)profileHandle_handle;
  profileHandle_handle = (uint64_t)v0;

}

+ (OS_os_log)migrateHandle
{
  if (migrateHandle_onceToken != -1)
    dispatch_once(&migrateHandle_onceToken, &__block_literal_global_8);
  return (OS_os_log *)(id)migrateHandle_handle;
}

void __33__SDSeedingLogging_migrateHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.seeding", "migrate");
  v1 = (void *)migrateHandle_handle;
  migrateHandle_handle = (uint64_t)v0;

}

+ (OS_os_log)betaHandle
{
  if (betaHandle_onceToken != -1)
    dispatch_once(&betaHandle_onceToken, &__block_literal_global_10);
  return (OS_os_log *)(id)betaHandle_handle;
}

void __30__SDSeedingLogging_betaHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.seeding", "sd-beta");
  v1 = (void *)betaHandle_handle;
  betaHandle_handle = (uint64_t)v0;

}

+ (OS_os_log)analyticsHandle
{
  if (analyticsHandle_onceToken != -1)
    dispatch_once(&analyticsHandle_onceToken, &__block_literal_global_12_0);
  return (OS_os_log *)(id)analyticsHandle_handle;
}

void __35__SDSeedingLogging_analyticsHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.seeding", "analytics");
  v1 = (void *)analyticsHandle_handle;
  analyticsHandle_handle = (uint64_t)v0;

}

+ (OS_os_log)mdmHandle
{
  if (mdmHandle_onceToken != -1)
    dispatch_once(&mdmHandle_onceToken, &__block_literal_global_14);
  return (OS_os_log *)(id)mdmHandle_handle;
}

void __29__SDSeedingLogging_mdmHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.seeding", "mdm");
  v1 = (void *)mdmHandle_handle;
  mdmHandle_handle = (uint64_t)v0;

}

@end
