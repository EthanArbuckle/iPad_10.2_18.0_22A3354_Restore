@implementation CopperDomain

- (unint64_t)domain
{
  return 30;
}

- (id)domainChangeNotificationName
{
  return CFSTR("com.apple.os-eligibility-domain.change.copper");
}

- (CopperDomain)init
{
  CopperDomain *v2;
  CopperDomain *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CopperDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  v3 = v2;
  if (v2)
    -[CopperDomain _internal_doInit](v2, "_internal_doInit");
  return v3;
}

- (CopperDomain)initWithCoder:(id)a3
{
  CopperDomain *v3;
  CopperDomain *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CopperDomain;
  v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[CopperDomain _internal_doInit](v3, "_internal_doInit");
  return v4;
}

- (BOOL)computeWithError:(id *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MobileAssetManager sharedInstance](MobileAssetManager, "sharedInstance", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "copperAsset"));
  if (objc_msgSend(v5, "isEnabled"))
    v6 = 4;
  else
    v6 = 2;
  -[EligibilityDomain setAnswer:](self, "setAnswer:", v6);

  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
