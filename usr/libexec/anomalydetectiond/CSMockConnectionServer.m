@implementation CSMockConnectionServer

- (CSMockConnectionServer)initWithDispatchSilo:(id)a3 andDelegate:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSMockConnectionServer;
  return -[CSMockConnectionServer init](&v5, "init", a3, a4);
}

- (id)serviceName
{
  return CFSTR("CSMockConnectionServer");
}

@end
