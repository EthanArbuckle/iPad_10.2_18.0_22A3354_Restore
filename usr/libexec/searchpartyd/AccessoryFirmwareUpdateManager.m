@implementation AccessoryFirmwareUpdateManager

- (void)findMyAccessoryFirmwareUpdateManager:(id)a3 didFailWithError:(id)a4 forDevice:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;

  v8 = sub_10001A9A8(&qword_1010ED860);
  __chkstk_darwin(v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v11 = type metadata accessor for UUID(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    v12 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  v13 = a3;
  v14 = a4;
  swift_retain();
  sub_100BF9E10((uint64_t)v14, (uint64_t)v10);

  swift_release();
  sub_100004048((uint64_t)v10, &qword_1010ED860);
}

- (void)findMyAccessoryFirmwareUpdateManager:(id)a3 firmwareUpdateRequestForDevice:(id)a4 completedWithError:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  uint64_t v14;

  v8 = type metadata accessor for UUID(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = a3;
  swift_retain();
  v13 = a5;
  sub_100BFA130((uint64_t)v11, (uint64_t)a5);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

@end
