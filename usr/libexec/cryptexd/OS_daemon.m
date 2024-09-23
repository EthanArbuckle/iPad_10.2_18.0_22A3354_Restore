@implementation OS_daemon

- (void)dealloc
{
  objc_super v3;

  sub_10000845C((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_daemon;
  -[OS_daemon dealloc](&v3, "dealloc");
}

@end
