@implementation SDAirDropApplicationServiceServer

- (_TtC16DaemoniOSLibrary33SDAirDropApplicationServiceServer)init
{
  _TtC16DaemoniOSLibrary33SDAirDropApplicationServiceServer *result;

  result = (_TtC16DaemoniOSLibrary33SDAirDropApplicationServiceServer *)_swift_stdlib_reportUnimplementedInitializer("DaemoniOSLibrary.SDAirDropApplicationServiceServer", 50, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary33SDAirDropApplicationServiceServer_listener));
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa
                                           + OBJC_IVAR____TtC16DaemoniOSLibrary33SDAirDropApplicationServiceServer_connections));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary33SDAirDropApplicationServiceServer_deviceStatus));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary33SDAirDropApplicationServiceServer_sessionLogger));
  sub_100232F78((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary33SDAirDropApplicationServiceServer_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary33SDAirDropApplicationServiceServer_queue));
}

@end
