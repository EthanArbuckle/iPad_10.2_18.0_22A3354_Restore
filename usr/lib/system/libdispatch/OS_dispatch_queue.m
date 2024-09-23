@implementation OS_dispatch_queue

- (OS_dispatch_queue)init
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (NSString)description
{
  Class v3;
  Class v4;
  uint64_t v5;
  uint64_t v6;
  const char *ClassName;

  v3 = objc_lookUpClass("NSString");
  if (!v3)
    return 0;
  v4 = v3;
  v5 = -[objc_class stringWithUTF8String:](v3, "stringWithUTF8String:", "<%s: %s>");
  if (!v5)
    return 0;
  v6 = v5;
  ClassName = object_getClassName(self);
  return (NSString *)-[objc_class stringWithFormat:](v4, "stringWithFormat:", v6, ClassName, dispatch_queue_get_label_0(&self->super.super.super), self);
}

- (void)_xref_dispose
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  j___dispatch_queue_xref_dispose((uint64_t)self, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  v9.receiver = self;
  v9.super_class = (Class)OS_dispatch_queue;
  -[OS_object _xref_dispose](&v9, sel__xref_dispose);
}

@end
