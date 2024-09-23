@implementation SDAirDropBonjourDiscoverConnection

- (_TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection)init
{
  _TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection *result;

  result = (_TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection *)_swift_stdlib_reportUnimplementedInitializer("DaemoniOSLibrary.SDAirDropBonjourDiscoverConnection", 51, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(_QWORD *)&self->serviceName[OBJC_IVAR____TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection_serviceName]);
  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection_endpoint;
  v4 = type metadata accessor for NWEndpoint(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection_discoverConnection));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection_identityShareConnection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection_deviceStatus));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection_nearbyAgent));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection_browserQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary34SDAirDropBonjourDiscoverConnection_rpClient));
}

@end
