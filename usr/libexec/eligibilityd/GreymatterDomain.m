@implementation GreymatterDomain

- (unint64_t)domain
{
  return 122;
}

- (id)domainChangeNotificationName
{
  return CFSTR("com.apple.os-eligibility-domain.change.greymatter");
}

- (GreymatterDomain)init
{
  GreymatterDomain *v2;
  GreymatterDomain *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GreymatterDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  v3 = v2;
  if (v2)
    -[GreymatterDomain _internal_doInit](v2, "_internal_doInit");
  return v3;
}

- (GreymatterDomain)initWithCoder:(id)a3
{
  GreymatterDomain *v3;
  GreymatterDomain *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GreymatterDomain;
  v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[GreymatterDomain _internal_doInit](v3, "_internal_doInit");
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
