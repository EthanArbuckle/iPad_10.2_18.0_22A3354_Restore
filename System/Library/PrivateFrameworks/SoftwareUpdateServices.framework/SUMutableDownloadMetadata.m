@implementation SUMutableDownloadMetadata

- (SUMutableDownloadMetadata)initWithMetadata:(id)a3
{
  id v4;
  SUMutableDownloadMetadata *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUMutableDownloadMetadata;
  v5 = -[SUDownloadMetadata init](&v7, sel_init);
  if (v5)
  {
    -[SUDownloadMetadata setAutoDownload:](v5, "setAutoDownload:", objc_msgSend(v4, "isAutoDownload"));
    -[SUDownloadMetadata setDownloadOnly:](v5, "setDownloadOnly:", objc_msgSend(v4, "isDownloadOnly"));
    -[SUDownloadMetadata setActiveDownloadPolicyType:](v5, "setActiveDownloadPolicyType:", objc_msgSend(v4, "activeDownloadPolicyType"));
    -[SUDownloadMetadata setEnabledFor2G:](v5, "setEnabledFor2G:", objc_msgSend(v4, "isEnabledFor2G"));
    -[SUDownloadMetadata setEnabledFor3G:](v5, "setEnabledFor3G:", objc_msgSend(v4, "isEnabledFor3G"));
    -[SUDownloadMetadata setEnabledFor4G:](v5, "setEnabledFor4G:", objc_msgSend(v4, "isEnabledFor4G"));
    -[SUDownloadMetadata setEnabledForWifi:](v5, "setEnabledForWifi:", objc_msgSend(v4, "isEnabledForWifi"));
    -[SUDownloadMetadata setEnabledOnBatteryPower:](v5, "setEnabledOnBatteryPower:", objc_msgSend(v4, "isEnabledOnBatteryPower"));
    -[SUDownloadMetadata setEnforceWifiOnlyOverride:](v5, "setEnforceWifiOnlyOverride:", objc_msgSend(v4, "enforceWifiOnlyOverride"));
    -[SUDownloadMetadata setDownloadFeeAgreementStatus:](v5, "setDownloadFeeAgreementStatus:", objc_msgSend(v4, "downloadFeeAgreementStatus"));
    -[SUDownloadMetadata setEnabledForCellularRoaming:](v5, "setEnabledForCellularRoaming:", objc_msgSend(v4, "isEnabledForCellularRoaming"));
    -[SUDownloadMetadata setTermsAndConditionsAgreementStatus:](v5, "setTermsAndConditionsAgreementStatus:", objc_msgSend(v4, "termsAndConditionsAgreementStatus"));
  }

  return v5;
}

- (void)applyDownloadPolicy:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUMutableDownloadMetadata;
  -[SUDownloadMetadata applyDownloadPolicy:](&v3, sel_applyDownloadPolicy_, a3);
}

@end
