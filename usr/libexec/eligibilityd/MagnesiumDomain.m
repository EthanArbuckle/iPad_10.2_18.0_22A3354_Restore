@implementation MagnesiumDomain

- (unint64_t)domain
{
  return 13;
}

- (id)domainChangeNotificationName
{
  return CFSTR("com.apple.os-eligibility-domain.change.magnesium");
}

- (void)_internal_doInit
{
  id v3;

  -[MagnesiumDomain updateParameters](self, "updateParameters");
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("iPhone")));
  -[EligibilityDomain setDeviceClassesOfInterest:](self, "setDeviceClassesOfInterest:", v3);

}

- (MagnesiumDomain)init
{
  MagnesiumDomain *v2;
  MagnesiumDomain *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MagnesiumDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  v3 = v2;
  if (v2)
    -[MagnesiumDomain _internal_doInit](v2, "_internal_doInit");
  return v3;
}

- (MagnesiumDomain)initWithCoder:(id)a3
{
  MagnesiumDomain *v3;
  MagnesiumDomain *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MagnesiumDomain;
  v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[MagnesiumDomain _internal_doInit](v3, "_internal_doInit");
  return v4;
}

- (void)updateParameters
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MobileAssetManager sharedInstance](MobileAssetManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "magnesiumAsset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "countryCodes"));
  -[EligibilityDomain setBillingCountriesOfInterest:](self, "setBillingCountriesOfInterest:", v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
