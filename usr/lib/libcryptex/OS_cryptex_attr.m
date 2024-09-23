@implementation OS_cryptex_attr

- (void)dealloc
{
  objc_super v3;

  _cryptex_attr_dealloc((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_cryptex_attr;
  -[OS_cryptex_attr dealloc](&v3, sel_dealloc);
}

@end
