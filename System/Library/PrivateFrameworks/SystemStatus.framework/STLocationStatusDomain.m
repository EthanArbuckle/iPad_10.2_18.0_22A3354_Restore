@implementation STLocationStatusDomain

+ (unint64_t)statusDomainName
{
  return 5;
}

- (void)observeData:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STLocationStatusDomain;
  -[STStatusDomain observeData:](&v3, sel_observeData_, a3);
}

@end
