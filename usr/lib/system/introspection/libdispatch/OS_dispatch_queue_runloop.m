@implementation OS_dispatch_queue_runloop

- (OS_dispatch_queue_runloop)init
{
  qword_61228 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (void)_xref_dispose
{
  objc_super v3;

  _dispatch_queue_xref_dispose((uint64_t)self);
  _dispatch_runloop_queue_xref_dispose((unint64_t *)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_dispatch_queue_runloop;
  -[OS_dispatch_queue _xref_dispose](&v3, "_xref_dispose");
}

@end
