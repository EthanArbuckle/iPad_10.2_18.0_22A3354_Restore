@implementation TagCommandManager

- (_TtC12searchpartyd17TagCommandManager)init
{
  _TtC12searchpartyd17TagCommandManager *result;

  result = (_TtC12searchpartyd17TagCommandManager *)_swift_stdlib_reportUnimplementedInitializer("searchpartyd.TagCommandManager", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC12searchpartyd17TagCommandManager_batteryFetchInFlight));
  swift_release(*(_QWORD *)&self->commandQueue[OBJC_IVAR____TtC12searchpartyd17TagCommandManager_commandManagerCreator]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC12searchpartyd17TagCommandManager_commandManager));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd17TagCommandManager_beaconStore));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC12searchpartyd17TagCommandManager_tagCommandHandlers));
}

- (void)findMyAccessoryManager:(id)a3 didFetchFirmwareVersion:(id)a4 fromDevice:(id)a5 withError:(id)a6
{
  sub_100677AD0(self, (uint64_t)a2, a3, a4, a5, a6, (void (*)(uint64_t, unint64_t, char *, void *, id))sub_100678118);
}

- (void)findMyAccessoryManager:(id)a3 didSetObfuscatedIdentifierOnDevice:(id)a4 withError:(id)a5
{
  sub_1002456A0(self, (uint64_t)a2, a3, (uint64_t)a4, a5, (void (*)(char *, void *, id))sub_1006784B0);
}

- (void)findMyAccessoryManager:(id)a3 didStartPlayingSoundOnDevice:(id)a4 withError:(id)a5
{
  sub_1002456A0(self, (uint64_t)a2, a3, (uint64_t)a4, a5, (void (*)(char *, void *, id))sub_100678820);
}

- (void)findMyAccessoryManager:(id)a3 didStartPlayingUnauthorizedSoundOnDevice:(id)a4 withError:(id)a5
{
  sub_1002456A0(self, (uint64_t)a2, a3, (uint64_t)a4, a5, (void (*)(char *, void *, id))sub_100678B90);
}

- (void)findMyAccessoryManager:(id)a3 didCompletePlayingUnauthorizedSoundOnDevice:(id)a4 withError:(id)a5
{
  sub_1002456A0(self, (uint64_t)a2, a3, (uint64_t)a4, a5, (void (*)(char *, void *, id))sub_100679000);
}

- (void)findMyAccessoryManager:(id)a3 didCompletePlayingSoundOnDevice:(id)a4 withError:(id)a5
{
  sub_1002456A0(self, (uint64_t)a2, a3, (uint64_t)a4, a5, (void (*)(char *, void *, id))sub_100679370);
}

- (void)findMyAccessoryManager:(id)a3 didStopPlayingSoundOnDevice:(id)a4 withError:(id)a5
{
  sub_1002456A0(self, (uint64_t)a2, a3, (uint64_t)a4, a5, (void (*)(char *, void *, id))sub_1006796E0);
}

- (void)findMyAccessoryManager:(id)a3 didUnpairFromDevice:(id)a4 withError:(id)a5
{
  sub_1002456A0(self, (uint64_t)a2, a3, (uint64_t)a4, a5, (void (*)(char *, void *, id))sub_100679A50);
}

- (void)findMyAccessoryManager:(id)a3 didFetchUserStats:(id)a4 fromDevice:(id)a5 withError:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  id v17;
  _TtC12searchpartyd17TagCommandManager *v18;
  id v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = self;
  if (a4)
  {
    v19 = a4;
    a4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v21 = v20;

  }
  else
  {
    v21 = 0xF000000000000000;
  }
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a5);

  sub_100679DC0((uint64_t)a4, v21, (uint64_t)v14, (uint64_t)a6, (uint64_t)self);
  sub_10001EF3C((uint64_t)a4, v21);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)findMyAccessoryManager:(id)a3 didFetchUserStats:(id)a4 forDevice:(id)a5 withError:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  _TtC12searchpartyd17TagCommandManager *v17;
  id v18;
  uint64_t v19;

  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v15 = a3;
  v16 = a4;
  v17 = self;
  v18 = a6;
  sub_10067A718(v16, (uint64_t)v14, (uint64_t)a6, (uint64_t)v17);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)findMyAccessoryManager:(id)a3 didFailWithError:(id)a4 forDevice:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _TtC12searchpartyd17TagCommandManager *v16;
  uint64_t v17;

  v9 = sub_10001A9A8(&qword_1010ED860);
  __chkstk_darwin(v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v12 = type metadata accessor for UUID(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = a3;
  v15 = a4;
  v16 = self;
  sub_10067AE7C((uint64_t)v15, (uint64_t)v11);

  sub_100004048((uint64_t)v11, &qword_1010ED860);
}

- (void)findMyAccessoryManager:(id)a3 didFetchBatteryStatus:(unint64_t)a4 forDevice:(id)a5 withError:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  _TtC12searchpartyd17TagCommandManager *v16;
  id v17;
  uint64_t v18;

  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v15 = a3;
  v16 = self;
  v17 = a6;
  sub_10067B000(a4, (uint64_t)v14, (uint64_t)a6, v16);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)findMyAccessoryManager:(id)a3 didConnectDevice:(id)a4 error:(id)a5
{
  sub_1002456A0(self, (uint64_t)a2, a3, (uint64_t)a4, a5, (void (*)(char *, void *, id))sub_10067B76C);
}

- (void)findMyAccessoryManager:(id)a3 didDisconnectDevice:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC12searchpartyd17TagCommandManager *v12;
  uint64_t v13;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10067BADC((uint64_t)v10, v12);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)findMyAccessoryManager:(id)a3 didFetchHawkeyeSerialNumber:(id)a4 fromDevice:(id)a5 withError:(id)a6
{
  sub_100677AD0(self, (uint64_t)a2, a3, a4, a5, a6, (void (*)(uint64_t, unint64_t, char *, void *, id))sub_10067BE30);
}

@end
