@implementation SUDefaultWiFiOnlyDownloadPolicy

+ (unint64_t)wifiOnlyPeriodInDaysForUpdate:(id)a3
{
  if (objc_msgSend(a3, "updateType") == 3)
    return 0;
  else
    return 7;
}

- (SUDefaultWiFiOnlyDownloadPolicy)initWithDescriptor:(id)a3
{
  SUDefaultWiFiOnlyDownloadPolicy *v3;
  SUDefaultWiFiOnlyDownloadPolicy *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUDefaultWiFiOnlyDownloadPolicy;
  v3 = -[SUDefaultDownloadPolicy initWithDescriptor:](&v6, sel_initWithDescriptor_, a3);
  v4 = v3;
  if (v3)
  {
    v3->super._cellularCapable = 0;
    -[SUDefaultDownloadPolicy setCarrierPolicy:](v3, "setCarrierPolicy:", 0);
  }
  return v4;
}

- (BOOL)isDownloadAllowableForCellular
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars0;

  SULogInfo(CFSTR("Cellular download not allowable due to SUDefaultWiFiOnlyDownloadPolicy"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (BOOL)allowExpensiveNetwork
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars0;

  SULogInfo(CFSTR("Expensive network download not allowable due to SUDefaultWiFiOnlyDownloadPolicy"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, vars0);
  return 0;
}

@end
