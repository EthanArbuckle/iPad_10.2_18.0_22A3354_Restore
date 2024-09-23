@implementation OS_cryptex

- (void)dealloc
{
  objc_super v3;

  _cryptex_dealloc((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_cryptex;
  -[OS_cryptex dealloc](&v3, sel_dealloc);
}

@end
