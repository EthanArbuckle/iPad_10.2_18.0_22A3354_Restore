@implementation SBSAbstractSystemService

- (SBSSystemServiceClient)client
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSAbstractSystemService;
  -[SBSAbstractFacilityService client](&v3, sel_client);
  return (SBSSystemServiceClient *)(id)objc_claimAutoreleasedReturnValue();
}

+ (Class)serviceFacilityClientClass
{
  return (Class)objc_opt_class();
}

@end
