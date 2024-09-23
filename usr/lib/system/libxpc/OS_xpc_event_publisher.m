@implementation OS_xpc_event_publisher

- (OS_xpc_event_publisher)init
{
  char *v2;

  v2 = _xpc_asprintf("Calling -init", a2);
  _xpc_api_misuse(v2);
}

- (void)_xref_dispose
{
  objc_super v3;

  _xpc_event_publisher_xref_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_xpc_event_publisher;
  -[OS_object _xref_dispose](&v3, sel__xref_dispose);
}

- (void)dealloc
{
  objc_super v3;

  _xpc_event_publisher_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_xpc_event_publisher;
  -[OS_xpc_event_publisher dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return 0;
}

@end
