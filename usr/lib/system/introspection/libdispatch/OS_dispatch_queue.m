@implementation OS_dispatch_queue

- (OS_dispatch_queue)init
{
  qword_61228 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (NSString)description
{
  Class v3;
  Class v4;
  id v5;
  id v6;
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
  return (NSString *)-[objc_class stringWithFormat:](v4, "stringWithFormat:", v6, ClassName, dispatch_queue_get_label(&self->super.super.super), self);
}

- (void)_xref_dispose
{
  objc_super v3;

  _dispatch_queue_xref_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_dispatch_queue;
  -[OS_object _xref_dispose](&v3, "_xref_dispose");
}

@end
