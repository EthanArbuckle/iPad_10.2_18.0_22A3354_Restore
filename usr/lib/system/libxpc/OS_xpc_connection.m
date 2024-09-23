@implementation OS_xpc_connection

- (void)_xref_dispose
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  _xpc_connection_last_xref_cancel((uint64_t)self, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  v9.receiver = self;
  v9.super_class = (Class)OS_xpc_connection;
  -[OS_object _xref_dispose](&v9, sel__xref_dispose);
}

@end
