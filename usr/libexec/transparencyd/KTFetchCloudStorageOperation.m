@implementation KTFetchCloudStorageOperation

- (BOOL)shouldRetry
{
  uint64_t (*v2)(void);
  _TtC13transparencyd28KTFetchCloudStorageOperation *v3;

  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.super.super.isa) + 0xD8);
  v3 = self;
  LOBYTE(v2) = v2();

  return v2 & 1;
}

+ (id)lastCKFetchWithDeps:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  id v8;
  NSString v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  Class isa;
  uint64_t v15;

  v4 = sub_10006F03C((uint64_t *)&unk_10029EE40);
  __chkstk_darwin(v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a3;
  v8 = objc_msgSend(v7, "smDataStore");
  if (qword_1002A4698 != -1)
    swift_once(&qword_1002A4698, sub_10006B2A8);
  v9 = String._bridgeToObjectiveC()();
  v10 = objc_msgSend(v8, "getSettingsDate:", v9);

  swift_unknownObjectRelease(v8);
  if (v10)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(v10);

    v11 = type metadata accessor for Date(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v6, 0, 1, v11);
  }
  else
  {
    v11 = type metadata accessor for Date(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v6, 1, 1, v11);
  }

  type metadata accessor for Date(0);
  v12 = *(_QWORD *)(v11 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v11) != 1)
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v11);
  }
  return isa;
}

- (_TtC13transparencyd28KTFetchCloudStorageOperation)initWithDeps:(id)a3 initialFetch:(BOOL)a4 userInteractive:(BOOL)a5 reason:(id)a6 context:(id)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _TtC13transparencyd28KTFetchCloudStorageOperation *v16;

  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v13 = v12;
  v14 = a3;
  v15 = a7;
  v16 = (_TtC13transparencyd28KTFetchCloudStorageOperation *)sub_10006D5A0(v14, a4, a5, v11, v13, v15);

  return v16;
}

- (void)groupStart
{
  _TtC13transparencyd28KTFetchCloudStorageOperation *v2;

  v2 = self;
  KTFetchCloudStorageOperation.groupStart()();

}

- (_TtC13transparencyd28KTFetchCloudStorageOperation)init
{
  _TtC13transparencyd28KTFetchCloudStorageOperation *result;

  result = (_TtC13transparencyd28KTFetchCloudStorageOperation *)_swift_stdlib_reportUnimplementedInitializer("transparencyd.KTFetchCloudStorageOperation", 42, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd28KTFetchCloudStorageOperation_deps));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd28KTFetchCloudStorageOperation_fetchOperation));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd28KTFetchCloudStorageOperation_previousServerChangeToken));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC13transparencyd28KTFetchCloudStorageOperation_serverChangeTokens));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd28KTFetchCloudStorageOperation_context));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC13transparencyd28KTFetchCloudStorageOperation_zoneHandler));
  swift_bridgeObjectRelease(*(_QWORD *)(&self->super.super.super._timeoutCanOccur
                                      + OBJC_IVAR____TtC13transparencyd28KTFetchCloudStorageOperation_reason));
  v3 = (char *)self + OBJC_IVAR____TtC13transparencyd28KTFetchCloudStorageOperation_lastFetch;
  v4 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
