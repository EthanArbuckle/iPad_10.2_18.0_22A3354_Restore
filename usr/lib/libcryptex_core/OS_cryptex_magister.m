@implementation OS_cryptex_magister

- (void)dealloc
{
  objc_super v3;

  _cryptex_magister_dealloc((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_cryptex_magister;
  -[OS_cryptex_base dealloc](&v3, sel_dealloc);
}

@end
