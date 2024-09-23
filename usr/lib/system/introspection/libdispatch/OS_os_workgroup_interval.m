@implementation OS_os_workgroup_interval

- (OS_os_workgroup_interval)init
{
  qword_61228 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (void)_xref_dispose
{
  objc_super v3;

  _os_workgroup_interval_xref_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_os_workgroup_interval;
  -[OS_os_workgroup _xref_dispose](&v3, "_xref_dispose");
}

- (void)dealloc
{
  objc_super v3;

  _os_workgroup_interval_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_os_workgroup_interval;
  -[OS_os_workgroup dealloc](&v3, "dealloc");
}

@end
