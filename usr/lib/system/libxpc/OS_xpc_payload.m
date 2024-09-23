@implementation OS_xpc_payload

- (void)dealloc
{
  objc_super v3;

  _xpc_payload_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_xpc_payload;
  -[OS_xpc_payload dealloc](&v3, sel_dealloc);
}

@end
