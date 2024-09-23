@implementation NFTemperatureReporter

- (void)dealloc
{
  id v3;
  objc_super v4;

  v3 = (id)sub_1001D163C((uint64_t)self);
  v4.receiver = self;
  v4.super_class = (Class)NFTemperatureReporter;
  -[NFTemperatureReporter dealloc](&v4, "dealloc");
}

@end
