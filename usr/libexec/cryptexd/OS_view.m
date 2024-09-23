@implementation OS_view

- (void)dealloc
{
  objc_super v3;

  sub_100009C1C((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_view;
  -[OS_view dealloc](&v3, "dealloc");
}

@end
