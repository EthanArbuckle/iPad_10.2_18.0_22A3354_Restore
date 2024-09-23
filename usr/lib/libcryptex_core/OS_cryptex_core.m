@implementation OS_cryptex_core

- (void)dealloc
{
  objc_super v3;

  _cryptex_core_dealloc(self);
  v3.receiver = self;
  v3.super_class = (Class)OS_cryptex_core;
  -[OS_cryptex_core dealloc](&v3, sel_dealloc);
}

@end
