@implementation OS_dispatch_channel

- (OS_dispatch_channel)init
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (void)_xref_dispose
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;

  j___dispatch_queue_xref_dispose((uint64_t)self, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  j___dispatch_channel_xref_dispose((uint64_t)self, v9, v10, v11, v12, v13, v14, v15);
  v16.receiver = self;
  v16.super_class = (Class)OS_dispatch_channel;
  -[OS_object _xref_dispose](&v16, sel__xref_dispose);
}

@end
