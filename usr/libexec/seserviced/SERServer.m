@implementation SERServer

- (_TtC10seserviced9SERServer)init
{
  return (_TtC10seserviced9SERServer *)SERServer.init()();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC10seserviced9SERServer *v8;
  char v9;
  char v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1000F9140(v7);
  v10 = v9;

  return v10 & 1;
}

- (_TtC10seserviced9SERServer)initWithMachServiceName:(id)a3
{
  _TtC10seserviced9SERServer *result;

  result = (_TtC10seserviced9SERServer *)_swift_stdlib_reportUnimplementedInitializer("seserviced.SERServer", 20, "init(machServiceName:)", 22, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10seserviced9SERServer_helper));
}

@end
