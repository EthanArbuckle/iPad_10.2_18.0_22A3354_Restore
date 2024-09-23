@implementation SoundPlaybackManager

- (void)findMyAccessoryManager:(id)a3 didStartPlayingSoundOnDevice:(id)a4 withError:(id)a5
{
  sub_100245788(self, (uint64_t)a2, a3, (uint64_t)a4, a5, (void (*)(char *, void *))sub_1005F40A4);
}

- (void)findMyAccessoryManager:(id)a3 didStartPlayingUnauthorizedSoundOnDevice:(id)a4 withError:(id)a5
{
  sub_1002456A0(self, (uint64_t)a2, a3, (uint64_t)a4, a5, (void (*)(char *, void *, id))sub_100245C98);
}

- (void)findMyAccessoryManager:(id)a3 didCompletePlayingUnauthorizedSoundOnDevice:(id)a4 withError:(id)a5
{
  sub_1002456A0(self, (uint64_t)a2, a3, (uint64_t)a4, a5, (void (*)(char *, void *, id))sub_100246714);
}

- (void)findMyAccessoryManager:(id)a3 didCompletePlayingSoundOnDevice:(id)a4 withError:(id)a5
{
  sub_100245788(self, (uint64_t)a2, a3, (uint64_t)a4, a5, (void (*)(char *, void *))sub_1005F6F4C);
}

- (void)findMyAccessoryManager:(id)a3 didStopPlayingSoundOnDevice:(id)a4 withError:(id)a5
{
  sub_100245788(self, (uint64_t)a2, a3, (uint64_t)a4, a5, (void (*)(char *, void *))sub_1005F5ED4);
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
  _TtC12searchpartyd20SoundPlaybackManager *v18;
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

  sub_10001EF3C((uint64_t)a4, v21);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)findMyAccessoryManager:(id)a3 didFailWithError:(id)a4 forDevice:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_10001A9A8(&qword_1010ED860);
  __chkstk_darwin(v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v9 = type metadata accessor for UUID(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    v10 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  sub_100004048((uint64_t)v8, &qword_1010ED860);
}

- (void)findMyAccessoryManager:(id)a3 didFetchBatteryStatus:(unint64_t)a4 forDevice:(id)a5 withError:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v11 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a5);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (uint64_t)findMyAccessoryManager:(uint64_t)a3 didSetObfuscatedIdentifierOnDevice:(uint64_t)a4 withError:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)findMyAccessoryManager:(id)a3 didDisconnectDevice:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (uint64_t)findMyAccessoryManager:(void *)a3 didFetchFirmwareVersion:(void *)a4 fromDevice:(void *)a5 withError:(void *)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v24;

  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a1;
  v19 = a6;
  v20 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v22 = v21;

  static UUID._unconditionallyBridgeFromObjectiveC(_:)(v17);
  sub_10001BC14(v20, v22);

  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (_TtC12searchpartyd20SoundPlaybackManager)init
{
  _TtC12searchpartyd20SoundPlaybackManager *result;

  result = (_TtC12searchpartyd20SoundPlaybackManager *)_swift_stdlib_reportUnimplementedInitializer("searchpartyd.SoundPlaybackManager", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release();
  _s12searchpartyd26ManagedCBPeripheralManagerVwxx_0((Class *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC12searchpartyd20SoundPlaybackManager_findMyCommandManager));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC12searchpartyd20SoundPlaybackManager____lazy_storage___commandManager));
}

@end
