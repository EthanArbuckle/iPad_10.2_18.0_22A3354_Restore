@implementation OS_os_eventlink

- (OS_os_eventlink)init
{
  qword_61228 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (void)dealloc
{
  objc_super v3;

  _os_eventlink_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_os_eventlink;
  -[OS_os_eventlink dealloc](&v3, "dealloc");
}

@end
