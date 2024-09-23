@implementation SDAirDropBLEController

+ (_TtC16DaemoniOSLibrary22SDAirDropBLEController)shared
{
  if (qword_1007B41A8 != -1)
    swift_once(&qword_1007B41A8, sub_1004A2368);
  return (_TtC16DaemoniOSLibrary22SDAirDropBLEController *)(id)qword_1007D84C0;
}

- (_TtC16DaemoniOSLibrary22SDAirDropBLEController)init
{
  return (_TtC16DaemoniOSLibrary22SDAirDropBLEController *)sub_1004A23D4();
}

- (void)startScanningWithIdentifier:(id)a3 deviceUpdatesHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  _TtC16DaemoniOSLibrary22SDAirDropBLEController *v13;
  uint64_t v14;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = swift_allocObject(&unk_10072ACF8, 24, 7);
  *(_QWORD *)(v12 + 16) = v11;
  v13 = self;
  sub_1004A390C((uint64_t)v10, (uint64_t)sub_1004A5C90, v12, (uint64_t)&unk_10072AD20, (uint64_t)sub_1004A5CAC, (uint64_t)&unk_10072AD38);

  swift_release(v12);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)stopScanningWithIdentifier:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC16DaemoniOSLibrary22SDAirDropBLEController *v9;
  uint64_t v10;

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1004A1944((uint64_t)v8, (uint64_t)&unk_10072ACA8, (uint64_t)sub_1004A48B0, (uint64_t)&unk_10072ACC0);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary22SDAirDropBLEController_airDropAdvertiser));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary22SDAirDropBLEController_nearbyInfoV2Advertiser));

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary22SDAirDropBLEController_aggressiveScannerTimer));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16DaemoniOSLibrary22SDAirDropBLEController_deviceUpdatesHandlers));
}

@end
