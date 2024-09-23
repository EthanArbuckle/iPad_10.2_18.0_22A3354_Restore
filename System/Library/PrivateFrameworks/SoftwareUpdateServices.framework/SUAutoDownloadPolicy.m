@implementation SUAutoDownloadPolicy

- (BOOL)isPowerRequired
{
  return 0;
}

- (BOOL)batteryPolicySatisfied
{
  return 1;
}

- (id)createSpaceOptions
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  SUSpacePurgeOptions *v10;
  uint64_t v12;

  -[SUDefaultDownloadPolicy descriptor](self, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_alloc_init(SUSpacePurgeOptions);
    -[SUSpacePurgeOptions setNeededBytes:](v10, "setNeededBytes:", +[SUUtility totalDiskSpaceForUpdate:](SUUtility, "totalDiskSpaceForUpdate:", v9));
    -[SUSpacePurgeOptions setEnableAppOffload:](v10, "setEnableAppOffload:", 0);
    -[SUSpacePurgeOptions setEnableCacheDelete:](v10, "setEnableCacheDelete:", 1);
    -[SUSpacePurgeOptions setCacheDeleteUrgency:](v10, "setCacheDeleteUrgency:", 4);
  }
  else
  {
    SULogInfo(CFSTR("Unable to create space options for null descriptor"), v2, v3, v4, v5, v6, v7, v8, v12);
    v10 = 0;
  }

  return v10;
}

- (SUAutoDownloadPolicy)initWithDescriptor:(id)a3
{
  SUAutoDownloadPolicy *v3;
  SUAutoDownloadPolicy *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUAutoDownloadPolicy;
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

  SULogInfo(CFSTR("Cellular download not allowable due to SUAutoDownloadPolicy"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, vars0);
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

  SULogInfo(CFSTR("Expensive network download not allowable due to SUAutoDownloadPolicy"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (BOOL)is5GDownloadAllowed
{
  return 0;
}

- (unint64_t)wifiOnlyPeriodInDays
{
  return 7;
}

- (id)computAutoDownloadEndDateFromDate:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  +[SUUtility addToDate:numberOfDays:](SUUtility, "addToDate:numberOfDays:", v5, 90);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)computeTimeOfWifiOnlyPeriodEndFromDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  +[SUUtility addToDate:numberOfDays:](SUUtility, "addToDate:numberOfDays:", v4, -[SUAutoDownloadPolicy wifiOnlyPeriodInDays](self, "wifiOnlyPeriodInDays"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
