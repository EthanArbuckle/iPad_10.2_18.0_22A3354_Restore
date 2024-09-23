@implementation SSMetricsAppInstallEvent

- (SSMetricsAppInstallEvent)init
{
  SSMetricsAppInstallEvent *v2;
  SSMetricsAppInstallEvent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSMetricsAppInstallEvent;
  v2 = -[SSMetricsMutableEvent init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SSMetricsMutableEvent setProperty:forBodyKey:](v2, "setProperty:forBodyKey:", &unk_1E481E810, CFSTR("clientId"));
    -[SSMetricsMutableEvent setEventType:](v3, "setEventType:", CFSTR("appInstall"));
    -[SSMetricsMutableEvent setTopic:](v3, "setTopic:", CFSTR("xp_amp_app_install"));
  }
  return v3;
}

- (NSString)buildVersion
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("buildVersion"));
}

- (NSString)bundleID
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("bundleId"));
}

- (NSString)hardwareType
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("hardwareType"));
}

- (NSString)installError
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("installError"));
}

- (unint64_t)installStatus
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_opt_class();
  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("installStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_installStatusForString:", v4);

  return v5;
}

- (unint64_t)installType
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_opt_class();
  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("installType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_installTypeForString:", v4);

  return v5;
}

- (int64_t)jobID
{
  void *v2;
  int64_t v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("jobId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  return v3;
}

- (void)setBuildVersion:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("buildVersion"));
}

- (void)setBundleID:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("bundleId"));
}

- (void)setHardwareType:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("hardwareType"));
}

- (void)setInstallError:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("installError"));
}

- (void)setInstallStatus:(unint64_t)a3
{
  id v4;

  objc_msgSend((id)objc_opt_class(), "_stringForInstallStatus:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("installStatus"));

}

- (void)setInstallType:(unint64_t)a3
{
  id v4;

  objc_msgSend((id)objc_opt_class(), "_stringForInstallType:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("installType"));

}

- (void)setJobID:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("jobId"));

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v12.receiver = self;
  v12.super_class = (Class)SSMetricsAppInstallEvent;
  -[SSMetricsAppInstallEvent description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  -[SSMetricsAppInstallEvent buildVersion](self, "buildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\nbuildVersion = %@"), v5);

  -[SSMetricsAppInstallEvent bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\nbundleID = %@"), v6);

  -[SSMetricsAppInstallEvent hardwareType](self, "hardwareType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\nhardwareType = %@"), v7);

  -[SSMetricsAppInstallEvent installError](self, "installError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\ninstallError = %@"), v8);

  objc_msgSend((id)objc_opt_class(), "_stringForInstallStatus:", -[SSMetricsAppInstallEvent installStatus](self, "installStatus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\ninstallStatus = %@"), v9);

  objc_msgSend((id)objc_opt_class(), "_stringForInstallType:", -[SSMetricsAppInstallEvent installType](self, "installType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\ninstallType = %@"), v10);

  objc_msgSend(v3, "appendFormat:", CFSTR("\njobID = %lld"), -[SSMetricsAppInstallEvent jobID](self, "jobID"));
  return v3;
}

- (BOOL)requiresDiagnosticSendingPermission
{
  return 1;
}

+ (unint64_t)_installStatusForString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cancelled")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Failed")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FailedAssetBlocked")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FailedDownloadRemoved")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FailedInstallVerification")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FailedKeepSafeHarborContainer")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FailedPermanently")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Started")) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Succeeded"));
  }

  return v4;
}

+ (unint64_t)_installTypeForString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AutoStoreQueue")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AutoUpdate")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("External")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Internal")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ManualUpdate")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PerDevice")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Restore")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RestoreDemoted")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("StoreQueue")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VPP")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_stringForInstallStatus:(unint64_t)a3
{
  if (a3 > 8)
    return CFSTR("Cancelled");
  else
    return off_1E47C0070[a3];
}

+ (id)_stringForInstallType:(unint64_t)a3
{
  if (a3 > 9)
    return CFSTR("AutoStoreQueue");
  else
    return off_1E47C00B8[a3];
}

@end
