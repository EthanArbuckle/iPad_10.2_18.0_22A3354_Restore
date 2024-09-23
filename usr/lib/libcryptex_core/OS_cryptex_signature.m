@implementation OS_cryptex_signature

- (void)dealloc
{
  objc_super v3;

  _cryptex_signature_dealloc((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_cryptex_signature;
  -[OS_cryptex_signature dealloc](&v3, sel_dealloc);
}

@end
