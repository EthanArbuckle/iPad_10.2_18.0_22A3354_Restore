@implementation OS_cryptex_base

- (void)dealloc
{
  objc_super v3;

  _cryptex_base_dealloc(self, a2);
  v3.receiver = self;
  v3.super_class = (Class)OS_cryptex_base;
  -[OS_cryptex_base dealloc](&v3, "dealloc");
}

@end
