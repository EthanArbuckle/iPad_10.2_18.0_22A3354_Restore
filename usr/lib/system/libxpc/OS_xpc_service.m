@implementation OS_xpc_service

- (void)_xref_dispose
{
  objc_super v3;

  _xpc_service_last_xref_cancel((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_xpc_service;
  -[OS_object _xref_dispose](&v3, sel__xref_dispose);
}

@end
