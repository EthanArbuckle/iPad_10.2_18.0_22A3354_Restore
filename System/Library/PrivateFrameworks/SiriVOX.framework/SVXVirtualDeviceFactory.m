@implementation SVXVirtualDeviceFactory

- (id)createWithInstanceContext:(id)a3
{
  id v3;
  SVXVirtualDevice *v4;

  v3 = a3;
  v4 = -[SVXVirtualDevice initWithInstanceContext:]([SVXVirtualDevice alloc], "initWithInstanceContext:", v3);

  return v4;
}

@end
