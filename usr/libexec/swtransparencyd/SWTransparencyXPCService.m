@implementation SWTransparencyXPCService

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC15swtransparencyd24SWTransparencyXPCService *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10005AE34(v7);

  return v9 & 1;
}

- (_TtC15swtransparencyd24SWTransparencyXPCService)init
{
  _TtC15swtransparencyd24SWTransparencyXPCService *result;

  result = (_TtC15swtransparencyd24SWTransparencyXPCService *)_swift_stdlib_reportUnimplementedInitializer("swtransparencyd.SWTransparencyXPCService", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15swtransparencyd24SWTransparencyXPCService_xpcInterface));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC15swtransparencyd24SWTransparencyXPCService_stateMachine));
  sub_10005B3AC((uint64_t)self + OBJC_IVAR____TtC15swtransparencyd24SWTransparencyXPCService_daemon);
}

@end
