@implementation STBackgroundActivitiesStatusDomain

- (void)observeData:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STBackgroundActivitiesStatusDomain;
  -[STStatusDomain observeData:](&v3, sel_observeData_, a3);
}

+ (unint64_t)statusDomainName
{
  return 1;
}

@end
