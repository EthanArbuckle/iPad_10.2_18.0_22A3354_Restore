@implementation ZincDomain

- (unint64_t)domain
{
  return 31;
}

- (id)domainChangeNotificationName
{
  return CFSTR("com.apple.os-eligibility-domain.change.zinc");
}

- (ZincDomain)init
{
  ZincDomain *v2;
  ZincDomain *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ZincDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  v3 = v2;
  if (v2)
    -[ZincDomain _internal_doInit](v2, "_internal_doInit");
  return v3;
}

- (ZincDomain)initWithCoder:(id)a3
{
  ZincDomain *v3;
  ZincDomain *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ZincDomain;
  v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[ZincDomain _internal_doInit](v3, "_internal_doInit");
  return v4;
}

- (void)updateParameters
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("ko")));
  -[EligibilityDomain setDeviceLanguagesOfInterest:](self, "setDeviceLanguagesOfInterest:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("KR")));
  -[EligibilityDomain setBillingCountriesOfInterest:](self, "setBillingCountriesOfInterest:", v3);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
