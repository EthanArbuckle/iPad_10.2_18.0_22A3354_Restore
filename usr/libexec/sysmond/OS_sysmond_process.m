@implementation OS_sysmond_process

- (void)dealloc
{
  kern_return_t v3;
  objc_super v4;

  v3 = mach_port_deallocate(mach_task_self_, HIDWORD(self[5].super.super.super.super.isa));
  if (v3)
    _os_assumes_log(v3);
  v4.receiver = self;
  v4.super_class = (Class)OS_sysmond_process;
  -[OS_sysmond_row dealloc](&v4, "dealloc");
}

@end
