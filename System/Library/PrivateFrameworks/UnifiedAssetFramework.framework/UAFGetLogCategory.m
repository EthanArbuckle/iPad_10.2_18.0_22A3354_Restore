@implementation UAFGetLogCategory

void __UAFGetLogCategory_block_invoke()
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
  os_log_t v20;
  void *v21;
  os_log_t v22;
  void *v23;

  v0 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.UnifiedAssetFramework"), "UTF8String"), "UAFTrialClient");
  v1 = (void *)UAFLogContextTrialCategory;
  UAFLogContextTrialCategory = (uint64_t)v0;

  v2 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.UnifiedAssetFramework"), "UTF8String"), "UAFAssetUtilities");
  v3 = (void *)UAFLogContextAssetUtilities;
  UAFLogContextAssetUtilities = (uint64_t)v2;

  v4 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.UnifiedAssetFramework"), "UTF8String"), "Configuration");
  v5 = (void *)UAFLogContextConfiguration;
  UAFLogContextConfiguration = (uint64_t)v4;

  v6 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.UnifiedAssetFramework"), "UTF8String"), "Client");
  v7 = (void *)UAFLogContextClient;
  UAFLogContextClient = (uint64_t)v6;

  v8 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.UnifiedAssetFramework"), "UTF8String"), "Storage");
  v9 = (void *)UAFLogContextStorage;
  UAFLogContextStorage = (uint64_t)v8;

  v10 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.UnifiedAssetFramework"), "UTF8String"), "XPCActivity");
  v11 = (void *)UAFLogContextXPCActivity;
  UAFLogContextXPCActivity = (uint64_t)v10;

  v12 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.UnifiedAssetFramework"), "UTF8String"), "XPCService");
  v13 = (void *)UAFLogContextXPCService;
  UAFLogContextXPCService = (uint64_t)v12;

  v14 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.UnifiedAssetFramework"), "UTF8String"), "UAFInstrumentation");
  v15 = (void *)UAFLogContextInstrumentation;
  UAFLogContextInstrumentation = (uint64_t)v14;

  v16 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.UnifiedAssetFramework"), "UTF8String"), "Subscription");
  v17 = (void *)UAFLogContextSubscription;
  UAFLogContextSubscription = (uint64_t)v16;

  v18 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.UnifiedAssetFramework"), "UTF8String"), "LargeMessage");
  v19 = (void *)UAFLogContextLargeMessage;
  UAFLogContextLargeMessage = (uint64_t)v18;

  v20 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.UnifiedAssetFramework"), "UTF8String"), "MAConfig");
  v21 = (void *)UAFLogContextMAConfig;
  UAFLogContextMAConfig = (uint64_t)v20;

  v22 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.UnifiedAssetFramework"), "UTF8String"), "UAFTool");
  v23 = (void *)UAFLogContextUAFTool;
  UAFLogContextUAFTool = (uint64_t)v22;

}

@end
