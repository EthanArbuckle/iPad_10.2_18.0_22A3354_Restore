@implementation OS_resource

- (void)dealloc
{
  objc_super v3;

  sub_100026924((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_resource;
  -[OS_resource dealloc](&v3, "dealloc");
}

@end
