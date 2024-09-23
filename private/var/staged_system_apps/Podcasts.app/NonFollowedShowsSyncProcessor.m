@implementation NonFollowedShowsSyncProcessor

- (_TtC8Podcasts29NonFollowedShowsSyncProcessor)init
{
  return (_TtC8Podcasts29NonFollowedShowsSyncProcessor *)NonFollowedShowsSyncProcessor.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_10003D380((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC8Podcasts29NonFollowedShowsSyncProcessor_nonFollowedShowsSyncStorage));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Podcasts29NonFollowedShowsSyncProcessor_cloudSyncBugReporter));
  v3 = (char *)self + OBJC_IVAR____TtC8Podcasts29NonFollowedShowsSyncProcessor_signpostID;
  v4 = type metadata accessor for OSSignpostID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Podcasts29NonFollowedShowsSyncProcessor_signpostState));
}

- (int64_t)operationTypeForSET
{
  return 15;
}

- (BOOL)hasLocalChanges
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  _TtC8Podcasts29NonFollowedShowsSyncProcessor *v7;
  uint64_t v9;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  v3 = (uint64_t)self + OBJC_IVAR____TtC8Podcasts29NonFollowedShowsSyncProcessor_nonFollowedShowsSyncStorage;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Podcasts29NonFollowedShowsSyncProcessor_nonFollowedShowsSyncStorage, &v9, 0, 0);
  sub_10000A520(v3, (uint64_t)v10);
  v4 = v11;
  v5 = v12;
  sub_10003A834(v10, v11);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 112);
  v7 = self;
  LOBYTE(v3) = v6(v4, v5);
  sub_10003D380(v10);

  return v3 & 1;
}

- (BOOL)requiresNextGetTransaction
{
  return 1;
}

- (id)versionForGetTransaction:(id)a3 key:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  _TtC8Podcasts29NonFollowedShowsSyncProcessor *v10;
  uint64_t v11;
  uint64_t v12;
  NSString v13;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_1001F4648(v6, v8);
  v12 = v11;

  swift_bridgeObjectRelease(v8);
  if (v12)
  {
    v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v12);
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  _TtC8Podcasts29NonFollowedShowsSyncProcessor *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  Class isa;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;
  v11 = a3;
  v12 = self;
  v13 = sub_1001F4B34(v8, v10, a5);
  v15 = v14;

  swift_bridgeObjectRelease(v10);
  if (v15 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    sub_1001C0F60(v13, v15);
  }
  return isa;
}

- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  void *v11;
  id v12;
  id v13;
  id v14;
  _TtC8Podcasts29NonFollowedShowsSyncProcessor *v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)();

  v11 = _Block_copy(a7);
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = self;
  if (a4)
  {
    v16 = a4;
    a4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v18 = v17;

  }
  else
  {
    v18 = 0xF000000000000000;
  }
  v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v21 = v20;

  if (!a6)
  {
    v22 = 0;
    v24 = 0;
    if (v11)
      goto LABEL_6;
LABEL_8:
    v26 = 0;
    v25 = 0;
    goto LABEL_9;
  }
  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v24 = v23;

  if (!v11)
    goto LABEL_8;
LABEL_6:
  v25 = swift_allocObject(&unk_1004B5518, 24, 7);
  *(_QWORD *)(v25 + 16) = v11;
  v26 = sub_1001CE028;
LABEL_9:
  sub_1001F5530((uint64_t)a4, v18, v19, v21, v22, v24, (uint64_t (*)(_QWORD))v26, v25);
  sub_10002CA30((uint64_t)v26, v25);
  swift_bridgeObjectRelease(v21);
  swift_bridgeObjectRelease(v24);
  sub_1001C0F60((uint64_t)a4, v18);

}

- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  void *v11;
  id v12;
  id v13;
  id v14;
  _TtC8Podcasts29NonFollowedShowsSyncProcessor *v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)();

  v11 = _Block_copy(a7);
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = self;
  if (a4)
  {
    v16 = a4;
    a4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v18 = v17;

  }
  else
  {
    v18 = 0xF000000000000000;
  }
  v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v21 = v20;

  if (!a6)
  {
    v22 = 0;
    v24 = 0;
    if (v11)
      goto LABEL_6;
LABEL_8:
    v26 = 0;
    v25 = 0;
    goto LABEL_9;
  }
  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v24 = v23;

  if (!v11)
    goto LABEL_8;
LABEL_6:
  v25 = swift_allocObject(&unk_1004B54F0, 24, 7);
  *(_QWORD *)(v25 + 16) = v11;
  v26 = sub_1001CE028;
LABEL_9:
  sub_1001F573C(v19, v21, v22, v24, (uint64_t (*)(_QWORD))v26, v25);
  sub_10002CA30((uint64_t)v26, v25);
  swift_bridgeObjectRelease(v21);
  swift_bridgeObjectRelease(v24);
  sub_1001C0F60((uint64_t)a4, v18);

}

- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  void *v11;
  id v12;
  id v13;
  id v14;
  _TtC8Podcasts29NonFollowedShowsSyncProcessor *v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(char);

  v11 = _Block_copy(a7);
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = self;
  if (a4)
  {
    v16 = a4;
    a4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v18 = v17;

  }
  else
  {
    v18 = 0xF000000000000000;
  }
  v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v21 = v20;

  if (!a6)
  {
    v22 = 0;
    v24 = 0;
    if (v11)
      goto LABEL_6;
LABEL_8:
    v26 = 0;
    v25 = 0;
    goto LABEL_9;
  }
  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v24 = v23;

  if (!v11)
    goto LABEL_8;
LABEL_6:
  v25 = swift_allocObject(&unk_1004B54C8, 24, 7);
  *(_QWORD *)(v25 + 16) = v11;
  v26 = sub_1001CE020;
LABEL_9:
  sub_1001F592C((uint64_t)a4, v18, v19, v21, v22, v24, (uint64_t (*)(_QWORD))v26, v25);
  sub_10002CA30((uint64_t)v26, v25);
  swift_bridgeObjectRelease(v21);
  swift_bridgeObjectRelease(v24);
  sub_1001C0F60((uint64_t)a4, v18);

}

- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);
  id v13;
  _TtC8Podcasts29NonFollowedShowsSyncProcessor *v14;
  _BYTE v15[24];

  if (a4)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = (char *)self + OBJC_IVAR____TtC8Podcasts29NonFollowedShowsSyncProcessor_nonFollowedShowsSyncStorage;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Podcasts29NonFollowedShowsSyncProcessor_nonFollowedShowsSyncStorage, v15, 33, 0);
  v10 = *((_QWORD *)v9 + 3);
  v11 = *((_QWORD *)v9 + 4);
  sub_100038DEC((uint64_t)v9, v10);
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 96);
  swift_bridgeObjectRetain(v8);
  v13 = a3;
  v14 = self;
  v12(v6, v8, v10, v11);
  swift_endAccess(v15);

  swift_bridgeObjectRelease(v8);
}

@end
