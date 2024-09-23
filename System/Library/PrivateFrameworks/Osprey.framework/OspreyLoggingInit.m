@implementation OspreyLoggingInit

void __OspreyLoggingInit_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;
  os_log_t v10;
  void *v11;
  os_log_t v12;
  void *v13;
  os_log_t v14;
  void *v15;
  os_log_t v16;
  void *v17;
  os_log_t v18;
  void *v19;

  v0 = os_log_create((const char *)OspreyLoggingSubsystem, "Network");
  v1 = (void *)OspreyLogContextNetwork;
  OspreyLogContextNetwork = (uint64_t)v0;

  v2 = os_log_create((const char *)OspreyLoggingSubsystem, "Utility");
  v3 = (void *)OspreyLogContextUtility;
  OspreyLogContextUtility = (uint64_t)v2;

  v4 = os_log_create((const char *)OspreyLoggingSubsystem, "GRPCChannel");
  v5 = (void *)OspreyLogContextGRPC;
  OspreyLogContextGRPC = (uint64_t)v4;

  v6 = os_log_create((const char *)OspreyLoggingSubsystem, "Channel");
  v7 = (void *)OspreyLogContextChannel;
  OspreyLogContextChannel = (uint64_t)v6;

  v8 = os_log_create((const char *)OspreyLoggingSubsystem, "Request");
  v9 = (void *)OspreyLogContextRequest;
  OspreyLogContextRequest = (uint64_t)v8;

  v10 = os_log_create((const char *)OspreyLoggingSubsystem, "XPC");
  v11 = (void *)OspreyLogContextXPC;
  OspreyLogContextXPC = (uint64_t)v10;

  v12 = os_log_create((const char *)OspreyLoggingSubsystem, "Absinthe");
  v13 = (void *)OspreyLogContextAbsinthe;
  OspreyLogContextAbsinthe = (uint64_t)v12;

  v14 = os_log_create((const char *)OspreyLoggingSubsystem, "DeviceAuth");
  v15 = (void *)OspreyLogContextDeviceAuth;
  OspreyLogContextDeviceAuth = (uint64_t)v14;

  v16 = os_log_create((const char *)OspreyLoggingSubsystem, "Analytics");
  v17 = (void *)OspreyLogContextAnalytics;
  OspreyLogContextAnalytics = (uint64_t)v16;

  v18 = os_log_create((const char *)OspreyLoggingSubsystem, "Preferences");
  v19 = (void *)OspreyLogContextPreferences;
  OspreyLogContextPreferences = (uint64_t)v18;

}

@end
