@implementation KTCloudRecords

- (_TtC13transparencyd14KTCloudRecords)initWithContext:(id)a3 zone:(id)a4 database:(id)a5 hostInfo:(id)a6 delegate:(id)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;

  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  v14 = a3;
  v15 = a5;
  swift_unknownObjectRetain(a6);
  swift_unknownObjectRetain(a7);
  return (_TtC13transparencyd14KTCloudRecords *)KTCloudRecords.init(context:zone:database:hostInfo:delegate:)(v14, v11, v13, v15, (uint64_t)a6, (uint64_t)a7);
}

- (BOOL)disableKTSyncabledKVSStore
{
  _TtC13transparencyd14KTCloudRecords *v3;
  char v4;
  _QWORD v6[5];

  v6[3] = &type metadata for TransparencyFeatureFlags;
  v6[4] = sub_10009D5C0();
  LOBYTE(v6[0]) = 0;
  v3 = self;
  v4 = isFeatureEnabled(_:)(v6);
  sub_10006F0F8(v6);

  return v4 & 1;
}

- (id)sysdiagnose
{
  uint64_t (*v2)(void);
  _TtC13transparencyd14KTCloudRecords *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t inited;
  unint64_t v7;
  Class isa;
  uint64_t v10;

  v2 = *(uint64_t (**)(void))(**(_QWORD **)((char *)&self->super.isa
                                         + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                           + 280);
  v3 = self;
  v4 = v2();
  v5 = sub_10006F03C(&qword_10029FF78);
  inited = swift_initStackObject(v5, &v10);
  *(_OWORD *)(inited + 16) = xmmword_1002143C0;
  *(_QWORD *)(inited + 32) = 0x6E4974706FLL;
  *(_QWORD *)(inited + 40) = 0xE500000000000000;
  *(_QWORD *)(inited + 72) = sub_10006F03C(&qword_10029FF80);
  *(_QWORD *)(inited + 48) = v4;
  v7 = sub_10009CBF8(inited);

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  return isa;
}

- (void)updateSelfCloudDeviceWithPushToken:(id)a3 tbsRegistrationData:(id)a4 applications:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _TtC13transparencyd14KTCloudRecords *v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19 = self;
  v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v14 = v13;

  v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v10);
  v17 = v16;

  v18 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v11, &type metadata for String);
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t, uint64_t))(**(_QWORD **)((char *)&v19->super.isa + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudDevice)
                                                                                        + 248))(v12, v14, v15, v17, v18);
  swift_bridgeObjectRelease(v18);
  sub_10006F22C(v15, v17);
  sub_10006F22C(v12, v14);

}

- (BOOL)cloudDeviceNeedUpdateWithPushToken:(id)a3 tbsRegistrationData:(id)a4
{
  id v7;
  id v8;
  _TtC13transparencyd14KTCloudRecords *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = v11;

  v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v15 = v14;

  v16 = *(uint64_t *)((char *)&v9->super.isa + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudDevice);
  v17 = *(Class *)((char *)&v9->super.isa + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_hostInfo);
  if (v17)
  {
    v18 = objc_msgSend(v17, "osVersion");
    v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
    v21 = v20;

  }
  else
  {
    v19 = 0;
    v21 = 0;
  }
  v22 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(*(_QWORD *)v16 + 256))(v10, v12, v13, v15, v19, v21);
  swift_bridgeObjectRelease(v21);
  sub_10006F22C(v13, v15);
  sub_10006F22C(v10, v12);

  return v22 & 1;
}

- (id)fetchSyncedLoggableDataWithPushToken:(id)a3 tbsRegistrationData:(id)a4
{
  id v7;
  id v8;
  _TtC13transparencyd14KTCloudRecords *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = v11;

  v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v15 = v14;

  v16 = (void *)(*(uint64_t (**)(uint64_t, unint64_t, uint64_t, unint64_t))(**(_QWORD **)((char *)&v9->super.isa + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudDevice)
                                                                                                + 264))(v10, v12, v13, v15);
  sub_10006F22C(v13, v15);
  sub_10006F22C(v10, v12);

  return v16;
}

- (id)cloudKTDevices
{
  uint64_t (*v2)(void);
  _TtC13transparencyd14KTCloudRecords *v3;
  uint64_t v4;
  Class isa;

  v2 = *(uint64_t (**)(void))(**(_QWORD **)((char *)&self->super.isa
                                         + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudDevice)
                           + 272);
  v3 = self;
  v4 = v2();

  sub_10006D6DC(0, &qword_1002A0000, KTLoggableData_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return isa;
}

- (id)cloudDevices
{
  uint64_t (*v2)(void);
  _TtC13transparencyd14KTCloudRecords *v3;
  uint64_t v4;
  Class isa;

  v2 = *(uint64_t (**)(void))(**(_QWORD **)((char *)&self->super.isa
                                         + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudDevice)
                           + 280);
  v3 = self;
  v4 = v2();

  sub_10006D6DC(0, &qword_1002A00C0, TransparencyCloudDevice_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return isa;
}

- (BOOL)addDevice:(id)a3 clientData:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  _TtC13transparencyd14KTCloudRecords *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;

  v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v9);
  v16 = v15;

  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(**(_QWORD **)((char *)&v10->super.isa
                                                                                             + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudDevice)
                                                                               + 288))(v11, v13, v14, v16);

  sub_10006F22C(v14, v16);
  sub_10006F22C(v11, v13);
  return 1;
}

- (BOOL)removeDevice:(id)a3 clientData:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  _TtC13transparencyd14KTCloudRecords *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;

  v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v9);
  v16 = v15;

  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(**(_QWORD **)((char *)&v10->super.isa
                                                                                             + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudDevice)
                                                                               + 296))(v11, v13, v14, v16);

  sub_10006F22C(v14, v16);
  sub_10006F22C(v11, v13);
  return 1;
}

- (BOOL)setOptInStateWithURIs:(id)a3 application:(id)a4 state:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t, _BOOL8);
  _TtC13transparencyd14KTCloudRecords *v16;

  v6 = a5;
  v10 = type metadata accessor for Date(0);
  v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, v10, &protocol witness table for String);
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = v13;
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t, _BOOL8))(**(_QWORD **)((char *)&self->super.isa
                                                                               + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                                                                 + 352);
  v16 = self;
  v15(v11, v12, v14, v6);
  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v14);

  return 1;
}

- (BOOL)addOptInStateWithURI:(id)a3 smtTimestamp:(id)a4 application:(id)a5 state:(BOOL)a6 error:(id *)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, char *, uint64_t, uint64_t, _BOOL4);
  _TtC13transparencyd14KTCloudRecords *v22;
  _QWORD v24[2];
  _BOOL4 v25;

  v24[1] = a7;
  v25 = a6;
  v11 = type metadata accessor for Date(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin();
  v14 = (char *)v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v17 = v16;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v20 = v19;
  v21 = *(void (**)(uint64_t, uint64_t, char *, uint64_t, uint64_t, _BOOL4))(**(_QWORD **)((char *)&self->super.isa
                                                                                                + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                                                                                  + 360);
  v22 = self;
  v21(v15, v17, v14, v18, v20, v25);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v20);

  return 1;
}

- (id)getOptInStateWithUri:(id)a3 application:(id)a4 error:(id *)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t);
  _TtC13transparencyd14KTCloudRecords *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(**(_QWORD **)((char *)&self->super.isa
                                                                                   + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                                                                     + 248);
  v15 = self;
  v16 = v14(v8, v10, v11, v13);
  if (v16)
  {
    v17 = (void *)v16;
    swift_bridgeObjectRelease(v10);
    swift_bridgeObjectRelease(v13);

  }
  else
  {
    v18 = sub_10009E280();
    v19 = swift_allocError(&type metadata for KTCloudRecordsError, v18, 0, 0);
    swift_willThrow();
    swift_bridgeObjectRelease(v10);
    swift_bridgeObjectRelease(v13);

    if (a5)
    {
      v20 = (void *)_convertErrorToNSError(_:)(v19);
      swift_errorRelease(v19);
      v21 = v20;
      v17 = 0;
      *a5 = v20;
    }
    else
    {
      swift_errorRelease(v19);
      v17 = 0;
    }
  }
  return v17;
}

- (id)getAggregateOptInStateForApplication:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  _TtC13transparencyd14KTCloudRecords *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = *(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)((char *)&self->super.isa
                                                                + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                                                  + 264);
  v10 = self;
  v11 = v9(v6, v8);
  if (v11)
  {
    v12 = (void *)v11;
    swift_bridgeObjectRelease(v8);

  }
  else
  {
    v13 = type metadata accessor for KTError(0);
    v14 = sub_10006F284((unint64_t *)&qword_10029FCB0, type metadata accessor for KTError, (uint64_t)&unk_10021578C);
    v15 = swift_allocError(v13, v14, 0, 0);
    v17 = swift_storeEnumTagMultiPayload(v16, v13, 10);
    swift_willThrow(v17);
    swift_bridgeObjectRelease(v8);

    if (a4)
    {
      v18 = (void *)_convertErrorToNSError(_:)(v15);
      swift_errorRelease(v15);
      v19 = v18;
      v12 = 0;
      *a4 = v18;
    }
    else
    {
      swift_errorRelease(v15);
      v12 = 0;
    }
  }
  return v12;
}

- (id)getAllOptInStatesAndReturnError:(id *)a3
{
  uint64_t (*v3)(void);
  _TtC13transparencyd14KTCloudRecords *v4;
  uint64_t v5;
  Class isa;

  v3 = *(uint64_t (**)(void))(**(_QWORD **)((char *)&self->super.isa
                                         + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                           + 272);
  v4 = self;
  v5 = v3();

  sub_10006D6DC(0, (unint64_t *)&qword_10029FFC0, KTOptInState_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  return isa;
}

- (BOOL)clearOptInStateForURI:(id)a3 application:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t, uint64_t);
  _TtC13transparencyd14KTCloudRecords *v14;

  if (a3)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = v11;
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(**(_QWORD **)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                                                                  + 288);
  v14 = self;
  v13(v7, v9, v10, v12);
  swift_bridgeObjectRelease(v12);

  swift_bridgeObjectRelease(v9);
  return 1;
}

- (id)storeOptInIntentForApplication:(id)a3 state:(BOOL)a4 overwrite:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, _BOOL8, _BOOL8);
  _TtC13transparencyd14KTCloudRecords *v13;
  void *v14;

  v6 = a5;
  v7 = a4;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  v12 = *(uint64_t (**)(uint64_t, uint64_t, _BOOL8, _BOOL8))(**(_QWORD **)((char *)&self->super.isa
                                                                                 + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                                                                   + 328);
  v13 = self;
  v14 = (void *)v12(v9, v11, v7, v6);
  swift_bridgeObjectRelease(v11);

  return v14;
}

- (id)deleteOptInIntentForApplication:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, _TtC13transparencyd14KTCloudRecords *);
  _TtC13transparencyd14KTCloudRecords *v9;
  void *v10;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = *(uint64_t (**)(uint64_t, uint64_t, _TtC13transparencyd14KTCloudRecords *))(**(_QWORD **)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                                                                                         + 336);
  v9 = self;
  v10 = (void *)v8(v5, v7, v9);
  swift_bridgeObjectRelease(v7);

  return v10;
}

- (id)storeOptInForApplication:(id)a3 uris:(id)a4 state:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, _BOOL8, _TtC13transparencyd14KTCloudRecords *);
  _TtC13transparencyd14KTCloudRecords *v15;
  void *v16;

  v6 = a5;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  v12 = type metadata accessor for Date(0);
  v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, v12, &protocol witness table for String);
  v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, _BOOL8, _TtC13transparencyd14KTCloudRecords *))(**(_QWORD **)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn) + 344);
  v15 = self;
  v16 = (void *)v14(v9, v11, v13, v6, v15);
  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v13);

  return v16;
}

- (void)clearDataStore:(BOOL)a3
{
  _BOOL8 v3;
  void (*v4)(_BOOL8);
  _TtC13transparencyd14KTCloudRecords *v5;

  v3 = a3;
  v4 = *(void (**)(_BOOL8))(**(_QWORD **)((char *)&self->super.isa
                                                   + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn)
                                     + 456);
  v5 = self;
  v4(v3);
  (*(void (**)(_BOOL8))(**(_QWORD **)((char *)&v5->super.isa
                                               + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudDevice)
                                 + 392))(v3);

}

- (void)clearLocalCloudState
{
  void (*v2)(_QWORD);
  _TtC13transparencyd14KTCloudRecords *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(void (**)(_QWORD))((swift_isaMask & (uint64_t)self->super.isa) + 0x158);
  v3 = self;
  v2(0);
  type metadata accessor for KTCKZone();
  v4 = sub_1000A56EC((uint64_t)objc_retain(*(id *)((char *)&v3->super.isa
                                                + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_context)));
  v5 = objc_msgSend(*(id *)((char *)&v3->super.isa + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_zoneID), "zoneName");
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  v8 = v7;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v4 + 128))(v6, v8);
  swift_release(v4);
  swift_bridgeObjectRelease(v8);
}

- (BOOL)havePendingRecords
{
  _TtC13transparencyd14KTCloudRecords *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = KTCloudRecords.havePendingRecords()();

  return v3;
}

- (id)pendingRecords
{
  return sub_1000A0028((char *)self, (uint64_t)a2, (uint64_t (*)(_QWORD *, uint64_t, __n128))sub_10009EFE4, &qword_1002A0350, CKRecord_ptr);
}

- (id)deletedRecords
{
  return sub_1000A0028((char *)self, (uint64_t)a2, (uint64_t (*)(_QWORD *, uint64_t, __n128))sub_10009F1E0, (unint64_t *)&unk_10029F3A0, CKRecordID_ptr);
}

- (id)cloudKitZones
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  Class isa;
  uint64_t v9;

  v3 = sub_10006F03C(&qword_10029F870);
  v4 = swift_allocObject(v3, 40, 7);
  *(_OWORD *)(v4 + 16) = xmmword_100214910;
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_zoneID);
  *(_QWORD *)(v4 + 32) = v5;
  v9 = v4;
  specialized Array._endMutation()(v4);
  sub_10006D6DC(0, &qword_10029ED80, CKRecordZoneID_ptr);
  v6 = v5;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  return isa;
}

- (BOOL)updatedRecordWithCkrecord:(id)a3
{
  id v4;
  _TtC13transparencyd14KTCloudRecords *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = KTCloudRecords.updatedRecord(withCkrecord:)((CKRecord)v4);

  return self & 1;
}

- (void)deleteRecordWithCkrecord:(id)a3
{
  id v4;
  _TtC13transparencyd14KTCloudRecords *v5;

  v4 = a3;
  v5 = self;
  KTCloudRecords.deleteRecord(withCkrecord:)((CKRecord)v4);

}

- (void)deleteRecordIDWithCkrecordID:(id)a3
{
  uint64_t *v5;
  uint64_t v6;
  id v7;
  _TtC13transparencyd14KTCloudRecords *v8;
  uint64_t v9;
  _BYTE v10[24];

  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_types);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_types, v10, 0, 0);
  v6 = *v5;
  v7 = a3;
  v8 = self;
  swift_bridgeObjectRetain(v6);
  sub_1000A3FA0(v9, (void (*)(uint64_t, uint64_t, _BYTE *, __n128))sub_1000A2C10);

  swift_bridgeObjectRelease(v6);
}

- (void)recordUpdateCloudStateWithType:(id)a3 records:(id)a4 newState:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(__int128 *__return_ptr, uint64_t, uint64_t);
  _TtC13transparencyd14KTCloudRecords *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  _QWORD v22[3];
  uint64_t v23;
  uint64_t v24;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  v11 = sub_10006D6DC(0, (unint64_t *)&unk_10029F3A0, CKRecordID_ptr);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v11);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v15 = v14;
  v16 = *(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))((swift_isaMask & (uint64_t)self->super.isa)
                                                                        + 0x190);
  v17 = self;
  v16(&v20, v8, v10);
  if (v21)
  {
    sub_100073F04(&v20, (uint64_t)v22);
    v18 = v23;
    v19 = v24;
    sub_1000754FC(v22, v23);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 64))(v12, v13, v15, v18, v19);
    sub_10006F0F8(v22);
  }
  else
  {
    sub_100081AB0((uint64_t)&v20, &qword_10029FFA8);
  }

  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v15);
}

- (id)evaluateKTLogData:(id)a3 application:(id)a4 error:(id *)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _TtC13transparencyd14KTCloudRecords *v13;
  _QWORD *v14;

  v8 = sub_10006F03C(&qword_10029FFC8);
  v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, v8, &protocol witness table for String);
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = v11;
  v13 = self;
  v14 = KTCloudRecords.evaluateKTLogData(_:application:)(v9, v10, v12);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v12);

  return v14;
}

- (BOOL)enforceCKOptInRecords
{
  _TtC13transparencyd14KTCloudRecords *v3;
  char v4;
  _QWORD v6[5];

  v6[3] = &type metadata for TransparencyFeatureFlags;
  v6[4] = sub_10009D5C0();
  LOBYTE(v6[0]) = 1;
  v3 = self;
  v4 = isFeatureEnabled(_:)(v6);
  sub_10006F0F8(v6);

  return (v4 & 1) == 0;
}

- (_TtC13transparencyd14KTCloudRecords)init
{
  _TtC13transparencyd14KTCloudRecords *result;

  result = (_TtC13transparencyd14KTCloudRecords *)_swift_stdlib_reportUnimplementedInitializer("transparencyd.KTCloudRecords", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_types));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudDevice));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_cloudOptIn));

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_hostInfo));
  sub_100080A78((uint64_t)self + OBJC_IVAR____TtC13transparencyd14KTCloudRecords_delegate);

}

@end
