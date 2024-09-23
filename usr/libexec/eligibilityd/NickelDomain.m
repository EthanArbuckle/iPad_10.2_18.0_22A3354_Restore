@implementation NickelDomain

- (unint64_t)domain
{
  return 29;
}

- (id)domainChangeNotificationName
{
  return CFSTR("com.apple.os-eligibility-domain.change.nickel");
}

- (void)_internal_doInit
{
  id v3;

  -[NickelDomain updateParameters](self, "updateParameters");
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("iPhone"), 0));
  -[EligibilityDomain setDeviceClassesOfInterest:](self, "setDeviceClassesOfInterest:", v3);

}

- (NickelDomain)init
{
  NickelDomain *v2;
  NickelDomain *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NickelDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  v3 = v2;
  if (v2)
    -[NickelDomain _internal_doInit](v2, "_internal_doInit");
  return v3;
}

- (NickelDomain)initWithCoder:(id)a3
{
  NickelDomain *v3;
  NickelDomain *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NickelDomain;
  v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[NickelDomain _internal_doInit](v3, "_internal_doInit");
  return v4;
}

- (void)updateParameters
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("AE"), CFSTR("SA"), CFSTR("RU"), 0));
  -[EligibilityDomain setDeviceLocalesOfInterest:isInverted:](self, "setDeviceLocalesOfInterest:isInverted:", v3, 1);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
