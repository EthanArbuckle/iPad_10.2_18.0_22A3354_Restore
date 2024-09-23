@implementation OS_proc

- (void)dealloc
{
  objc_super v3;

  sub_1000116B8((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_proc;
  -[OS_proc dealloc](&v3, "dealloc");
}

@end
