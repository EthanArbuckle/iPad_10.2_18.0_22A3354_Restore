@implementation STKCallSetupSessionAction

- (STKCallSetupSessionData)sessionData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STKCallSetupSessionAction;
  -[STKTextSessionAction sessionData](&v3, sel_sessionData);
  return (STKCallSetupSessionData *)(id)objc_claimAutoreleasedReturnValue();
}

@end
