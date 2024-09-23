@implementation SXSetupLogging

void __SXSetupLogging_block_invoke()
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

  v0 = os_log_create((const char *)SXLogSubsystemIdentifier, "ANF");
  v1 = (void *)SXDefaultLog;
  SXDefaultLog = (uint64_t)v0;

  v2 = os_log_create((const char *)SXLogSubsystemIdentifier, "ANFAnalytics");
  v3 = (void *)SXAnalyticsLog;
  SXAnalyticsLog = (uint64_t)v2;

  v4 = os_log_create((const char *)SXLogSubsystemIdentifier, "ANFSocialEmbed");
  v5 = (void *)SXEmbedLog;
  SXEmbedLog = (uint64_t)v4;

  v6 = os_log_create((const char *)SXLogSubsystemIdentifier, "ANFInvalidation");
  v7 = (void *)SXInvalidationLog;
  SXInvalidationLog = (uint64_t)v6;

  v8 = os_log_create((const char *)SXLogSubsystemIdentifier, "ANFComponentInsertion");
  v9 = (void *)SXInsertionLog;
  SXInsertionLog = (uint64_t)v8;

  v10 = os_log_create((const char *)SXLogSubsystemIdentifier, "ANFLayout");
  v11 = (void *)SXLayoutLog;
  SXLayoutLog = (uint64_t)v10;

  v12 = os_log_create((const char *)SXLogSubsystemIdentifier, "ANFProxy");
  v13 = (void *)SXProxyLog;
  SXProxyLog = (uint64_t)v12;

  v14 = os_log_create((const char *)SXLogSubsystemIdentifier, "ANFWebContent");
  v15 = (void *)SXWebContentLog;
  SXWebContentLog = (uint64_t)v14;

}

@end
