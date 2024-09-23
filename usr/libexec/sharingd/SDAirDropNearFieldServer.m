@implementation SDAirDropNearFieldServer

- (_TtC16DaemoniOSLibrary24SDAirDropNearFieldServer)init
{
  _TtC16DaemoniOSLibrary24SDAirDropNearFieldServer *result;

  result = (_TtC16DaemoniOSLibrary24SDAirDropNearFieldServer *)_swift_stdlib_reportUnimplementedInitializer("DaemoniOSLibrary.SDAirDropNearFieldServer", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropNearFieldServer_listener));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropNearFieldServer_networkListener));
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa
                                           + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropNearFieldServer_connections));
  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropNearFieldServer_transactionID;
  v4 = type metadata accessor for UUID(0);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  sub_100225AB4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropNearFieldServer_remotePublicKey), *(_QWORD *)&self->listener[OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropNearFieldServer_remotePublicKey]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropNearFieldServer_localIdentity));
  v5((char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropNearFieldServer_listenerUUID, v4);
  sub_100232F78((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropNearFieldServer_delegate);

}

@end
