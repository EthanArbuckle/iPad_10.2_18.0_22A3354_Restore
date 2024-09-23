@implementation SXLineBalancingSettings

- (SXLineBalancingSettings)initWithLineBalancingEnabled:(BOOL)a3
{
  SXLineBalancingSettings *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXLineBalancingSettings;
  result = -[SXLineBalancingSettings init](&v5, sel_init);
  if (result)
    result->_enableLineBalancing = a3;
  return result;
}

- (BOOL)enableLineBalancing
{
  return self->_enableLineBalancing;
}

@end
