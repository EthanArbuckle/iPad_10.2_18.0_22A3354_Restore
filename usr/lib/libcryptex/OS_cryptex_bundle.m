@implementation OS_cryptex_bundle

- (void)dealloc
{
  objc_super v3;

  _cryptex_bundle_dealloc(self);
  v3.receiver = self;
  v3.super_class = (Class)OS_cryptex_bundle;
  -[OS_cryptex_bundle dealloc](&v3, sel_dealloc);
}

@end
