@implementation OS_cryptex_actor

- (void)dealloc
{
  objc_super v3;

  _cryptex_actor_dealloc((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_cryptex_actor;
  -[OS_cryptex_actor dealloc](&v3, sel_dealloc);
}

@end
