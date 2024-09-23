@implementation DebugServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC14dockaccessoryd20DebugServiceDelegate *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1001B0064(v7);

  return v9 & 1;
}

- (_TtC14dockaccessoryd20DebugServiceDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DebugServiceDelegate((uint64_t)self, (uint64_t)a2);
  return -[DebugServiceDelegate init](&v3, "init");
}

@end
