@implementation RMLog

+ (OS_os_log)nsdata_rm
{
  if (nsdata_rm_onceToken != -1)
    dispatch_once(&nsdata_rm_onceToken, &__block_literal_global_0);
  return (OS_os_log *)(id)nsdata_rm_result;
}

void __29__RMLog_nsdata_rm__nsdata_rm__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("RemoteManagement", "nsdata_rm");
  v1 = (void *)nsdata_rm_result;
  nsdata_rm_result = (uint64_t)v0;

}

+ (OS_os_log)nsdictionary_rm
{
  if (nsdictionary_rm_onceToken != -1)
    dispatch_once(&nsdictionary_rm_onceToken, &__block_literal_global_1);
  return (OS_os_log *)(id)nsdictionary_rm_result;
}

void __41__RMLog_nsdictionary_rm__nsdictionary_rm__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("RemoteManagement", "nsdictionary_rm");
  v1 = (void *)nsdictionary_rm_result;
  nsdictionary_rm_result = (uint64_t)v0;

}

+ (OS_os_log)accountHelper
{
  if (accountHelper_onceToken != -1)
    dispatch_once(&accountHelper_onceToken, &__block_literal_global_2);
  return (OS_os_log *)(id)accountHelper_result;
}

void __37__RMLog_accountHelper__accountHelper__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("RemoteManagement", "accountHelper");
  v1 = (void *)accountHelper_result;
  accountHelper_result = (uint64_t)v0;

}

+ (OS_os_log)debounceTimer
{
  if (debounceTimer_onceToken != -1)
    dispatch_once(&debounceTimer_onceToken, &__block_literal_global_4);
  return (OS_os_log *)(id)debounceTimer_result;
}

void __37__RMLog_debounceTimer__debounceTimer__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("RemoteManagement", "debounceTimer");
  v1 = (void *)debounceTimer_result;
  debounceTimer_result = (uint64_t)v0;

}

+ (OS_os_log)device
{
  if (device_onceToken != -1)
    dispatch_once(&device_onceToken, &__block_literal_global_5);
  return (OS_os_log *)(id)device_result;
}

void __23__RMLog_device__device__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("RemoteManagement", "device");
  v1 = (void *)device_result;
  device_result = (uint64_t)v0;

}

+ (OS_os_log)enrollmentController
{
  if (enrollmentController_onceToken != -1)
    dispatch_once(&enrollmentController_onceToken, &__block_literal_global_6);
  return (OS_os_log *)(id)enrollmentController_result;
}

void __51__RMLog_enrollmentController__enrollmentController__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("RemoteManagement", "enrollmentController");
  v1 = (void *)enrollmentController_result;
  enrollmentController_result = (uint64_t)v0;

}

+ (OS_os_log)jsonUtilities
{
  if (jsonUtilities_onceToken != -1)
    dispatch_once(&jsonUtilities_onceToken, &__block_literal_global_8);
  return (OS_os_log *)(id)jsonUtilities_result;
}

void __37__RMLog_jsonUtilities__jsonUtilities__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("RemoteManagement", "jsonUtilities");
  v1 = (void *)jsonUtilities_result;
  jsonUtilities_result = (uint64_t)v0;

}

+ (OS_os_log)locations
{
  if (locations_onceToken != -1)
    dispatch_once(&locations_onceToken, &__block_literal_global_9);
  return (OS_os_log *)(id)locations_result;
}

void __29__RMLog_locations__locations__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("RemoteManagement", "locations");
  v1 = (void *)locations_result;
  locations_result = (uint64_t)v0;

}

+ (OS_os_log)managedDevice
{
  if (managedDevice_onceToken != -1)
    dispatch_once(&managedDevice_onceToken, &__block_literal_global_10);
  return (OS_os_log *)(id)managedDevice_result;
}

void __37__RMLog_managedDevice__managedDevice__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("RemoteManagement", "managedDevice");
  v1 = (void *)managedDevice_result;
  managedDevice_result = (uint64_t)v0;

}

+ (OS_os_log)managedKeychainController
{
  if (managedKeychainController_onceToken != -1)
    dispatch_once(&managedKeychainController_onceToken, &__block_literal_global_11);
  return (OS_os_log *)(id)managedKeychainController_result;
}

void __61__RMLog_managedKeychainController__managedKeychainController__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("RemoteManagement", "managedKeychainController");
  v1 = (void *)managedKeychainController_result;
  managedKeychainController_result = (uint64_t)v0;

}

+ (OS_os_log)managedTrustStoreController
{
  if (managedTrustStoreController_onceToken != -1)
    dispatch_once(&managedTrustStoreController_onceToken, &__block_literal_global_12);
  return (OS_os_log *)(id)managedTrustStoreController_result;
}

void __65__RMLog_managedTrustStoreController__managedTrustStoreController__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("RemoteManagement", "managedTrustStoreController");
  v1 = (void *)managedTrustStoreController_result;
  managedTrustStoreController_result = (uint64_t)v0;

}

+ (OS_os_log)mcAdapter
{
  if (mcAdapter_onceToken != -1)
    dispatch_once(&mcAdapter_onceToken, &__block_literal_global_13);
  return (OS_os_log *)(id)mcAdapter_result;
}

void __29__RMLog_mcAdapter__mcAdapter__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("RemoteManagement", "mcAdapter");
  v1 = (void *)mcAdapter_result;
  mcAdapter_result = (uint64_t)v0;

}

+ (OS_os_log)mdmHelper
{
  if (mdmHelper_onceToken != -1)
    dispatch_once(&mdmHelper_onceToken, &__block_literal_global_14);
  return (OS_os_log *)(id)mdmHelper_result;
}

void __29__RMLog_mdmHelper__mdmHelper__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("RemoteManagement", "mdmHelper");
  v1 = (void *)mdmHelper_result;
  mdmHelper_result = (uint64_t)v0;

}

+ (OS_os_log)sandbox
{
  if (sandbox_onceToken != -1)
    dispatch_once(&sandbox_onceToken, &__block_literal_global_15);
  return (OS_os_log *)(id)sandbox_result;
}

void __25__RMLog_sandbox__sandbox__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("RemoteManagement", "sandbox");
  v1 = (void *)sandbox_result;
  sandbox_result = (uint64_t)v0;

}

+ (OS_os_log)sharedLock
{
  if (sharedLock_onceToken != -1)
    dispatch_once(&sharedLock_onceToken, &__block_literal_global_16);
  return (OS_os_log *)(id)sharedLock_result;
}

void __31__RMLog_sharedLock__sharedLock__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("RemoteManagement", "sharedLock");
  v1 = (void *)sharedLock_result;
  sharedLock_result = (uint64_t)v0;

}

+ (OS_os_log)timeddispatch
{
  if (timeddispatch_onceToken != -1)
    dispatch_once(&timeddispatch_onceToken, &__block_literal_global_17);
  return (OS_os_log *)(id)timeddispatch_result;
}

void __37__RMLog_timeddispatch__timeddispatch__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("RemoteManagement", "timeddispatch");
  v1 = (void *)timeddispatch_result;
  timeddispatch_result = (uint64_t)v0;

}

+ (OS_os_log)xpcEvent
{
  if (xpcEvent_onceToken[0] != -1)
    dispatch_once(xpcEvent_onceToken, &__block_literal_global_18);
  return (OS_os_log *)(id)xpcEvent_result;
}

void __27__RMLog_xpcEvent__xpcEvent__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("RemoteManagement", "xpcEvent");
  v1 = (void *)xpcEvent_result;
  xpcEvent_result = (uint64_t)v0;

}

+ (OS_os_log)xpcNotifications
{
  if (xpcNotifications_onceToken != -1)
    dispatch_once(&xpcNotifications_onceToken, &__block_literal_global_19);
  return (OS_os_log *)(id)xpcNotifications_result;
}

void __43__RMLog_xpcNotifications__xpcNotifications__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("RemoteManagement", "xpcNotifications");
  v1 = (void *)xpcNotifications_result;
  xpcNotifications_result = (uint64_t)v0;

}

@end
