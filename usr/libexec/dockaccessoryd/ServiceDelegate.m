@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC14dockaccessoryd15ServiceDelegate *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1001135A8(v7);

  return v9 & 1;
}

- (_TtC14dockaccessoryd15ServiceDelegate)init
{
  _TtC14dockaccessoryd15ServiceDelegate *result;

  result = (_TtC14dockaccessoryd15ServiceDelegate *)_swift_stdlib_reportUnimplementedInitializer("dockaccessoryd.ServiceDelegate", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
