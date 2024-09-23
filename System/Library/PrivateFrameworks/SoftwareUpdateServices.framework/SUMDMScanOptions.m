@implementation SUMDMScanOptions

- (SUMDMScanOptions)init
{
  SUMDMScanOptions *v2;
  SUMDMScanOptions *v3;
  NSString *requestedProductMarketingVersion;
  NSString *requestedBuildVersion;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUMDMScanOptions;
  v2 = -[SUOptionsBase init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    requestedProductMarketingVersion = v2->_requestedProductMarketingVersion;
    v2->_requestedProductMarketingVersion = 0;

    requestedBuildVersion = v3->_requestedBuildVersion;
    v3->_requestedBuildVersion = 0;

    v3->_useDelayPeriod = 2;
    v3->_delayPeriodSeconds = 0;
    v3->_MDMSoftwareUpdatePath = 3;
    v3->_allowSplat = 2;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUMDMScanOptions)initWithCoder:(id)a3
{
  id v4;
  SUMDMScanOptions *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUMDMScanOptions;
  v5 = -[SUOptionsBase init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RequestedProductMarketingVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUMDMScanOptions setRequestedProductMarketingVersion:](v5, "setRequestedProductMarketingVersion:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RequestedBuildVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUMDMScanOptions setRequestedBuildVersion:](v5, "setRequestedBuildVersion:", v7);

    -[SUMDMScanOptions setUseDelayPeriod:](v5, "setUseDelayPeriod:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("UseDelayPeriod")));
    -[SUMDMScanOptions setDelayPeriodSeconds:](v5, "setDelayPeriodSeconds:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("DelayPeriodSeconds")));
    -[SUMDMScanOptions setMDMSoftwareUpdatePath:](v5, "setMDMSoftwareUpdatePath:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("MDMSoftwareUpdatePath")));
    -[SUMDMScanOptions setAllowSplat:](v5, "setAllowSplat:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("AllowSplat")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *requestedProductMarketingVersion;
  id v5;

  requestedProductMarketingVersion = self->_requestedProductMarketingVersion;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", requestedProductMarketingVersion, CFSTR("RequestedProductMarketingVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestedBuildVersion, CFSTR("RequestedBuildVersion"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_useDelayPeriod, CFSTR("UseDelayPeriod"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_delayPeriodSeconds, CFSTR("DelayPeriodSeconds"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_MDMSoftwareUpdatePath, CFSTR("MDMSoftwareUpdatePath"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_allowSplat, CFSTR("AllowSplat"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setRequestedProductMarketingVersion:", self->_requestedProductMarketingVersion);
  objc_msgSend(v4, "setRequestedBuildVersion:", self->_requestedBuildVersion);
  objc_msgSend(v4, "setUseDelayPeriod:", self->_useDelayPeriod);
  objc_msgSend(v4, "setDelayPeriodSeconds:", self->_delayPeriodSeconds);
  objc_msgSend(v4, "setMDMSoftwareUpdatePath:", self->_MDMSoftwareUpdatePath);
  objc_msgSend(v4, "setAllowSplat:", self->_allowSplat);
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SUMDMScanOptions requestedProductMarketingVersion](self, "requestedProductMarketingVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUMDMScanOptions requestedBuildVersion](self, "requestedBuildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEAEA28], "stringFromTriState:", -[SUMDMScanOptions useDelayPeriod](self, "useDelayPeriod"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SUMDMScanOptions delayPeriodSeconds](self, "delayPeriodSeconds");
  SUStringFromMDMSUPath(-[SUMDMScanOptions MDMSoftwareUpdatePath](self, "MDMSoftwareUpdatePath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEAEA28], "stringFromTriState:", -[SUMDMScanOptions allowSplat](self, "allowSplat"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n            RequestedProductMarketingVersion: %@\n            RequestedBuildVersion: %@\n            UseDelayPeriod: %@\n            DelayPeriodSeconds: %lu\n            MDMSoftwareUpdatePath: %@\n            AllowSplat: %@"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)requestedProductMarketingVersion
{
  return self->_requestedProductMarketingVersion;
}

- (void)setRequestedProductMarketingVersion:(id)a3
{
  objc_storeStrong((id *)&self->_requestedProductMarketingVersion, a3);
}

- (NSString)requestedBuildVersion
{
  return self->_requestedBuildVersion;
}

- (void)setRequestedBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_requestedBuildVersion, a3);
}

- (int64_t)useDelayPeriod
{
  return self->_useDelayPeriod;
}

- (void)setUseDelayPeriod:(int64_t)a3
{
  self->_useDelayPeriod = a3;
}

- (unint64_t)delayPeriodSeconds
{
  return self->_delayPeriodSeconds;
}

- (void)setDelayPeriodSeconds:(unint64_t)a3
{
  self->_delayPeriodSeconds = a3;
}

- (unint64_t)MDMSoftwareUpdatePath
{
  return self->_MDMSoftwareUpdatePath;
}

- (void)setMDMSoftwareUpdatePath:(unint64_t)a3
{
  self->_MDMSoftwareUpdatePath = a3;
}

- (int64_t)allowSplat
{
  return self->_allowSplat;
}

- (void)setAllowSplat:(int64_t)a3
{
  self->_allowSplat = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedBuildVersion, 0);
  objc_storeStrong((id *)&self->_requestedProductMarketingVersion, 0);
}

@end
