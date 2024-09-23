@implementation SDAirDropBonjourServer

- (_TtC16DaemoniOSLibrary22SDAirDropBonjourServer)init
{
  _TtC16DaemoniOSLibrary22SDAirDropBonjourServer *result;

  result = (_TtC16DaemoniOSLibrary22SDAirDropBonjourServer *)_swift_stdlib_reportUnimplementedInitializer("DaemoniOSLibrary.SDAirDropBonjourServer", 39, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary22SDAirDropBonjourServer_listener));
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa
                                           + OBJC_IVAR____TtC16DaemoniOSLibrary22SDAirDropBonjourServer_connections));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary22SDAirDropBonjourServer_deviceSupportManager));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary22SDAirDropBonjourServer_sessionLogger));

  sub_100232F78((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary22SDAirDropBonjourServer_delegate);
}

@end
