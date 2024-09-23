@implementation KTCloudRecordsCache

- (_TtC13transparencyd19KTCloudRecordsCache)initWithRecords:(id)a3
{
  _TtC13transparencyd19KTCloudRecordsCache *v4;

  swift_unknownObjectRetain(a3);
  v4 = (_TtC13transparencyd19KTCloudRecordsCache *)sub_1000A4168((uint64_t)a3);
  swift_unknownObjectRelease(a3);
  return v4;
}

- (void)setWithUriVRFHash:(id)a3
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void (*v9)(uint64_t, unint64_t);
  unint64_t v10;
  _TtC13transparencyd19KTCloudRecordsCache *v11;

  v5 = a3;
  v11 = self;
  v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;

  v9 = *(void (**)(uint64_t, unint64_t))((swift_isaMask & (uint64_t)v11->super.isa) + 0x90);
  sub_10006F1A0(v6, v8);
  v9(v6, v8);
  v10 = sub_10009CD48((uint64_t)_swiftEmptyArrayStorage);
  (*(void (**)(unint64_t))((swift_isaMask & (uint64_t)v11->super.isa) + 0xA8))(v10);
  sub_10006F22C(v6, v8);

}

- (BOOL)disableKTSyncabledKVSStore
{
  return objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC13transparencyd19KTCloudRecordsCache_records), "disableKTSyncabledKVSStore");
}

- (id)fetchSyncedLoggableDataByPushToken:(id)a3 registrationData:(id)a4
{
  id v7;
  id v8;
  _TtC13transparencyd19KTCloudRecordsCache *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  Class isa;
  Class v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = v11;

  v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v15 = v14;

  v16 = *(Class *)((char *)&v9->super.isa + OBJC_IVAR____TtC13transparencyd19KTCloudRecordsCache_records);
  isa = Data._bridgeToObjectiveC()().super.isa;
  v18 = Data._bridgeToObjectiveC()().super.isa;
  v19 = objc_msgSend(v16, "fetchSyncedLoggableDataWithPushToken:tbsRegistrationData:", isa, v18);

  sub_10006F22C(v13, v15);
  sub_10006F22C(v10, v12);

  return v19;
}

- (id)fetchSyncedLoggableDataByDeviceIdHash:(id)a3
{
  id v5;
  _TtC13transparencyd19KTCloudRecordsCache *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSArray v12;

  v5 = a3;
  v6 = self;
  v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;

  KTCloudRecordsCache.fetchSyncedLoggableData(byDeviceIdHash:)(v7, v9);
  v11 = v10;
  sub_10006F22C(v7, v9);

  if (v11)
  {
    sub_10006D6DC(0, &qword_1002A0000, KTLoggableData_ptr);
    v12.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v11);
  }
  else
  {
    v12.super.isa = 0;
  }
  return v12.super.isa;
}

- (_TtC13transparencyd19KTCloudRecordsCache)init
{
  _TtC13transparencyd19KTCloudRecordsCache *result;

  result = (_TtC13transparencyd19KTCloudRecordsCache *)_swift_stdlib_reportUnimplementedInitializer("transparencyd.KTCloudRecordsCache", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13transparencyd19KTCloudRecordsCache_records));
  sub_10006F218(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd19KTCloudRecordsCache_uriVRFHash), *(_QWORD *)&self->records[OBJC_IVAR____TtC13transparencyd19KTCloudRecordsCache_uriVRFHash]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13transparencyd19KTCloudRecordsCache_deviceIDHash));
}

@end
