@implementation CalciumDomain

- (unint64_t)domain
{
  return 21;
}

- (id)domainChangeNotificationName
{
  return CFSTR("com.apple.os-eligibility-domain.change.calcium");
}

- (void)_internal_doInit
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("CH")));
  -[EligibilityDomain setDeviceRegionCodesOfInterest:](self, "setDeviceRegionCodesOfInterest:", v3);

}

- (CalciumDomain)init
{
  CalciumDomain *v2;
  CalciumDomain *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CalciumDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  v3 = v2;
  if (v2)
    -[CalciumDomain _internal_doInit](v2, "_internal_doInit");
  return v3;
}

- (CalciumDomain)initWithCoder:(id)a3
{
  CalciumDomain *v3;
  CalciumDomain *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CalciumDomain;
  v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[CalciumDomain _internal_doInit](v3, "_internal_doInit");
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
