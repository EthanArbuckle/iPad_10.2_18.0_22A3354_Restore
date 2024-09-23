@implementation OS_codex

- (void)dealloc
{
  objc_super v3;

  sub_100014E38((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_codex;
  -[OS_cryptex_base dealloc](&v3, "dealloc");
}

@end
