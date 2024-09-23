@implementation SDTempPairingClient

- (void)handleRapportIdentitiesChanged
{
  _TtC16DaemoniOSLibrary19SDTempPairingClient *v2;

  v2 = self;
  sub_10034EC28();

}

- (void)handleDiscoverableModeChanged
{
  _TtC16DaemoniOSLibrary19SDTempPairingClient *v2;

  v2 = self;
  sub_10034EE00();

}

- (_TtC16DaemoniOSLibrary19SDTempPairingClient)init
{
  _TtC16DaemoniOSLibrary19SDTempPairingClient *result;

  result = (_TtC16DaemoniOSLibrary19SDTempPairingClient *)_swift_stdlib_reportUnimplementedInitializer("DaemoniOSLibrary.SDTempPairingClient", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  double v5;
  double v6;

  sub_1002845F4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary19SDTempPairingClient_objectChanged), *(_QWORD *)&self->queue[OBJC_IVAR____TtC16DaemoniOSLibrary19SDTempPairingClient_objectChanged]);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary19SDTempPairingClient_browser));

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary19SDTempPairingClient_statusItemController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary19SDTempPairingClient_bluetoothController));
  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary19SDTempPairingClient_scanningIdentifier;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  *(_QWORD *)&v5 = swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC16DaemoniOSLibrary19SDTempPairingClient_availableEndpoints)).n128_u64[0];
  *(_QWORD *)&v6 = swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary19SDTempPairingClient_activeConnections), v5).n128_u64[0];
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary19SDTempPairingClient_nearbyDevicesByIdentifier), v6);
}

- (void)proximityDeviceDidTrigger:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC16DaemoniOSLibrary19SDTempPairingClient *v9;
  uint64_t v10;

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_10034FAC0();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end
