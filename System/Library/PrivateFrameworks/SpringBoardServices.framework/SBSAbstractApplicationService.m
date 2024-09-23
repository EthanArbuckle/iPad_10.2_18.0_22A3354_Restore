@implementation SBSAbstractApplicationService

- (SBSApplicationClient)client
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSAbstractApplicationService;
  -[SBSAbstractFacilityService client](&v3, sel_client);
  return (SBSApplicationClient *)(id)objc_claimAutoreleasedReturnValue();
}

+ (Class)serviceFacilityClientClass
{
  return (Class)objc_opt_class();
}

@end
