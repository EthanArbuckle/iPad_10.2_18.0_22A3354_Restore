@implementation CarbonDomain

- (unint64_t)domain
{
  return 7;
}

- (id)domainChangeNotificationName
{
  return CFSTR("com.apple.os-eligibility-domain.change.carbon");
}

- (void)_internal_doInit
{
  id v3;

  -[CarbonDomain updateParameters](self, "updateParameters");
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("iPhone"), CFSTR("iPad"), 0));
  -[EligibilityDomain setDeviceClassesOfInterest:](self, "setDeviceClassesOfInterest:", v3);

}

- (CarbonDomain)init
{
  CarbonDomain *v2;
  CarbonDomain *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarbonDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  v3 = v2;
  if (v2)
    -[CarbonDomain _internal_doInit](v2, "_internal_doInit");
  return v3;
}

- (CarbonDomain)initWithCoder:(id)a3
{
  CarbonDomain *v3;
  CarbonDomain *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarbonDomain;
  v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[CarbonDomain _internal_doInit](v3, "_internal_doInit");
  return v4;
}

- (void)updateParameters
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MobileAssetManager sharedInstance](MobileAssetManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "carbonAsset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "countryCodes"));
  -[EligibilityDomain setLocatedCountriesOfInterest:](self, "setLocatedCountriesOfInterest:", v4);
  -[EligibilityDomain setBillingCountriesOfInterest:](self, "setBillingCountriesOfInterest:", v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
