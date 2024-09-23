@implementation HeliumDomain

- (unint64_t)domain
{
  return 3;
}

- (id)domainChangeNotificationName
{
  return CFSTR("com.apple.os-eligibility-domain.change.helium");
}

- (void)_internal_doInit
{
  id v3;

  -[HeliumDomain updateParameters](self, "updateParameters");
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("iPhone"), CFSTR("iPad"), 0));
  -[EligibilityDomain setDeviceClassesOfInterest:](self, "setDeviceClassesOfInterest:", v3);

}

- (HeliumDomain)init
{
  HeliumDomain *v2;
  HeliumDomain *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HeliumDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  v3 = v2;
  if (v2)
    -[HeliumDomain _internal_doInit](v2, "_internal_doInit");
  return v3;
}

- (HeliumDomain)initWithCoder:(id)a3
{
  HeliumDomain *v3;
  HeliumDomain *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HeliumDomain;
  v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[HeliumDomain _internal_doInit](v3, "_internal_doInit");
  return v4;
}

- (void)updateParameters
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MobileAssetManager sharedInstance](MobileAssetManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "heliumAsset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "countryCodes"));
  -[EligibilityDomain setLocatedCountriesOfInterest:withGracePeriod:](self, "setLocatedCountriesOfInterest:withGracePeriod:", v4, objc_msgSend(v3, "gracePeriodInSeconds"));
  -[EligibilityDomain setBillingCountriesOfInterest:](self, "setBillingCountriesOfInterest:", v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
