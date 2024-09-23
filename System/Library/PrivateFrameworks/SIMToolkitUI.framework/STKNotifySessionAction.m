@implementation STKNotifySessionAction

- (STKNotifySessionData)sessionData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STKNotifySessionAction;
  -[STKTextSessionAction sessionData](&v3, sel_sessionData);
  return (STKNotifySessionData *)(id)objc_claimAutoreleasedReturnValue();
}

@end
