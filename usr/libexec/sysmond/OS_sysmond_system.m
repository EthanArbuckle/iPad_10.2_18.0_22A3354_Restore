@implementation OS_sysmond_system

- (void)dealloc
{
  kern_return_t v3;
  objc_super v4;

  v3 = mach_port_deallocate(mach_task_self_, (mach_port_name_t)self[5].super.super.super.super.isa);
  if (v3)
    _os_assumes_log(v3);
  v4.receiver = self;
  v4.super_class = (Class)OS_sysmond_system;
  -[OS_sysmond_row dealloc](&v4, "dealloc");
}

@end
