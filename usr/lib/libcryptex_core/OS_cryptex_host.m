@implementation OS_cryptex_host

- (void)dealloc
{
  objc_super v3;

  _cryptex_host_dealloc((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_cryptex_host;
  -[OS_cryptex_host dealloc](&v3, sel_dealloc);
}

@end
