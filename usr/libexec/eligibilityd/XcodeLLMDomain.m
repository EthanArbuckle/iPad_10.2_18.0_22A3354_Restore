@implementation XcodeLLMDomain

- (unint64_t)domain
{
  return 123;
}

- (id)domainChangeNotificationName
{
  return CFSTR("com.apple.os-eligibility-domain.change.xcode-llm");
}

- (void)_internal_doInit
{
  void *v3;

  -[EligibilityDomain setDeviceRegionInterest](self, "setDeviceRegionInterest");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("Mac")));
  -[EligibilityDomain setDeviceClassesOfInterest:](self, "setDeviceClassesOfInterest:", v3);

  -[EligibilityDomain setExternalBootInterest](self, "setExternalBootInterest");
}

- (XcodeLLMDomain)init
{
  XcodeLLMDomain *v2;
  XcodeLLMDomain *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)XcodeLLMDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  v3 = v2;
  if (v2)
    -[XcodeLLMDomain _internal_doInit](v2, "_internal_doInit");
  return v3;
}

- (XcodeLLMDomain)initWithCoder:(id)a3
{
  XcodeLLMDomain *v3;
  XcodeLLMDomain *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)XcodeLLMDomain;
  v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[XcodeLLMDomain _internal_doInit](v3, "_internal_doInit");
  return v4;
}

- (unint64_t)computeInputStatusForDeviceRegionCodesInput:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  unint64_t v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MobileAssetManager sharedInstance](MobileAssetManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "xcodeLLMAsset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "countryCodes"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceRegionCode"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceRegionCode"));
    v10 = objc_msgSend(v6, "containsObject:", v9);

    if (v10)
      v11 = 2;
    else
      v11 = 3;
  }
  else
  {
    v11 = 3;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
