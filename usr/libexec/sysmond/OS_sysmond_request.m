@implementation OS_sysmond_request

- (void)dealloc
{
  Class isa;
  objc_super v4;

  isa = self[3].super.super.super.isa;
  if (isa)
    xpc_release(isa);
  v4.receiver = self;
  v4.super_class = (Class)OS_sysmond_request;
  -[OS_sysmond_request dealloc](&v4, "dealloc");
}

@end
