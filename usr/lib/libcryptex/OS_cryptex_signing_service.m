@implementation OS_cryptex_signing_service

- (void)dealloc
{
  objc_super v3;

  _cryptex_signing_service_dealloc((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_cryptex_signing_service;
  -[OS_cryptex_signing_service dealloc](&v3, sel_dealloc);
}

@end
