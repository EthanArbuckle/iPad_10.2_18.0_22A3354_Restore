@implementation WFLogForCategory

void __WFLogForCategory_block_invoke()
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

  v0 = os_log_create("com.apple.wifikit", "general");
  v1 = (void *)_WFLogGeneral;
  _WFLogGeneral = (uint64_t)v0;

  v2 = os_log_create("com.apple.wifikit", "alertprovider");
  v3 = (void *)_WFLogAlertProvider;
  _WFLogAlertProvider = (uint64_t)v2;

  v4 = os_log_create("com.apple.wifikit", "captive");
  v5 = (void *)_WFLogCaptive;
  _WFLogCaptive = (uint64_t)v4;

  v6 = os_log_create("com.apple.wifikit", "picker");
  v7 = (void *)_WFLogPicker;
  _WFLogPicker = (uint64_t)v6;

  v8 = os_log_create("com.apple.wifikit", "personalhotspot");
  v9 = (void *)_WFLogPersonalHotspot;
  _WFLogPersonalHotspot = (uint64_t)v8;

  v10 = os_log_create("com.apple.wifikit", "association");
  v11 = (void *)_WFLogAssociation;
  _WFLogAssociation = (uint64_t)v10;

  v12 = os_log_create("com.apple.wifikit", "scanning");
  v13 = (void *)_WFLogScanning;
  _WFLogScanning = (uint64_t)v12;

  v14 = os_log_create("com.apple.wifikit", "controlcenter");
  v15 = (void *)_WFLogControlCenter;
  _WFLogControlCenter = (uint64_t)v14;

  v16 = os_log_create("com.apple.wifikit", "private-address");
  v17 = (void *)_WFLogPrivateAddress;
  _WFLogPrivateAddress = (uint64_t)v16;

}

@end
