@implementation SEFidoKeyManager

- (void)reportCAEvent:(id)a3 count:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t inited;
  _TtC10seserviced16SEFidoKeyManager *v12;
  unint64_t v13;
  Class isa;
  _QWORD v15[2];
  _BYTE v16[104];

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = objc_opt_self(SESDAnalyticsLogger);
  v10 = sub_100063D3C(&qword_1003460E0);
  inited = swift_initStackObject(v10, v16);
  *(_OWORD *)(inited + 16) = xmmword_1002888E0;
  v15[0] = v6;
  v15[1] = v8;
  v12 = self;
  swift_bridgeObjectRetain(v8);
  AnyHashable.init<A>(_:)(v15, &type metadata for String, &protocol witness table for String);
  *(_QWORD *)(inited + 96) = &type metadata for Int;
  *(_QWORD *)(inited + 72) = a4;
  v13 = sub_10017C368(inited);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v13);
  sub_10004A360(v9, isa);

  swift_bridgeObjectRelease(v8);
}

- (void)reportCAEvent:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t inited;
  _TtC10seserviced16SEFidoKeyManager *v10;
  unint64_t v11;
  Class isa;
  _QWORD v13[2];
  _BYTE v14[104];

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = objc_opt_self(SESDAnalyticsLogger);
  v8 = sub_100063D3C(&qword_1003460E0);
  inited = swift_initStackObject(v8, v14);
  *(_OWORD *)(inited + 16) = xmmword_1002888E0;
  v13[0] = v4;
  v13[1] = v6;
  v10 = self;
  swift_bridgeObjectRetain(v6);
  AnyHashable.init<A>(_:)(v13, &type metadata for String, &protocol witness table for String);
  *(_QWORD *)(inited + 96) = &type metadata for Int;
  *(_QWORD *)(inited + 72) = 1;
  v11 = sub_10017C368(inited);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v11);
  sub_10004A360(v7, isa);

  swift_bridgeObjectRelease(v6);
}

+ (_TtC10seserviced16SEFidoKeyManager)singleton
{
  if (qword_100344790 != -1)
    swift_once(&qword_100344790, sub_1001E2B68);
  return (_TtC10seserviced16SEFidoKeyManager *)(id)qword_100354ED0;
}

- (id)createFidoAttestationWithSecureElement:(id)a3 instanceAID:(id)a4 fidoKey:(id)a5 relyingParty:(id)a6 relyingPartyAccountHash:(id)a7 challenge:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  _TtC10seserviced16SEFidoKeyManager *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  Class isa;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;

  v41 = a3;
  v15 = a4;
  v40 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = self;
  v20 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v22 = v21;

  v39 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
  v24 = v23;

  v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
  v27 = v26;

  v28 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v18);
  v30 = v29;

  v38 = v20;
  v31 = v20;
  v32 = v24;
  v33 = sub_1001E2BD8(v41, v31, v22, v40, v39, v24, v25, v27);
  v35 = v34;

  sub_100063CD0(v28, v30);
  swift_bridgeObjectRelease(v32);
  swift_bridgeObjectRelease(v27);
  sub_100063CD0(v38, v22);
  isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100063CD0(v33, v35);
  return isa;
}

- (id)performFidoSignatureWithSecureElement:(id)a3 instanceAID:(id)a4 loadedKey:(id)a5 relyingParty:(id)a6 relyingPartyAccountHash:(id)a7 challenge:(id)a8 ptaEndPointIdentifierForExtension:(id)a9 externalizedAuth:(id)a10 error:(id *)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  _TtC10seserviced16SEFidoKeyManager *v21;
  id v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  unint64_t v37;
  Class isa;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  unint64_t v44;
  uint64_t v45;
  id v46;
  id v47;

  v47 = a3;
  v43 = a4;
  v46 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a10;
  v21 = self;
  v22 = a9;
  v45 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v24 = v23;

  v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
  v27 = v26;

  v28 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v19);
  v30 = v29;

  if (v22)
  {
    v42 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v22);
    v44 = v31;

  }
  else
  {
    v42 = 0;
    v44 = 0xF000000000000000;
  }
  v32 = v25;
  v33 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v20);
  v35 = v34;

  v36 = sub_1001E8084(v47, v45, v24, v46, v32, v27);
  v40 = v37;
  v41 = (uint64_t)v36;

  sub_100063CD0(v33, v35);
  sub_10006B9B4(v42, v44);
  sub_100063CD0(v28, v30);
  swift_bridgeObjectRelease(v27);
  sub_100063CD0(v45, v24);
  isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100063CD0(v41, v40);
  return isa;
}

- (id)performFidoVerificationWithPublicKey:(id)a3 signedChallenge:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  _TtC10seserviced16SEFidoKeyManager *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;

  v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v9);
  v16 = v15;

  v17 = (void *)sub_1001E3980(v11, v13, v14, v16);
  sub_100063CD0(v14, v16);
  sub_100063CD0(v11, v13);
  return v17;
}

- (id)findKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 secureElement:(id)a6 error:(id *)a7
{
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  _TtC10seserviced16SEFidoKeyManager *v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  id v26;
  void *v27;
  id v28;
  Class isa;
  uint64_t v30;

  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v16 = v15;
  v17 = a6;
  v18 = self;
  if (a5)
  {
    v19 = a5;
    v20 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v22 = v21;

  }
  else
  {
    v20 = 0;
    v22 = 0xF000000000000000;
  }
  v23 = sub_1001E41F0(v11, v13, v14, v16, v20, v22, a6);
  v25 = v24;
  if (v24 >> 60 == 15)
  {
    sub_10006C25C(0, (unint64_t *)&qword_1003469E0, NSError_ptr);
    v26 = sub_1001E2838(0, 1, 0x20746F6E2079654BLL, 0xEE003F646E756F66, 0);
    swift_willThrow(v26);

    sub_10006B9B4(v20, v22);
    swift_bridgeObjectRelease(v13);
    swift_bridgeObjectRelease(v16);
    if (a7)
    {
      v27 = (void *)_convertErrorToNSError(_:)(v26);
      swift_errorRelease(v26);
      v28 = v27;
      isa = 0;
      *a7 = v27;
    }
    else
    {
      swift_errorRelease(v26);
      isa = 0;
    }
  }
  else
  {
    v30 = v23;

    sub_10006B9B4(v20, v22);
    swift_bridgeObjectRelease(v13);
    swift_bridgeObjectRelease(v16);
    isa = Data._bridgeToObjectiveC()().super.isa;
    sub_10006B9B4(v30, v25);
  }
  return isa;
}

- (BOOL)storeKeyWithRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 keyData:(id)a6 error:(id *)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _TtC10seserviced16SEFidoKeyManager *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v26;

  v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = v11;
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;
  v16 = a5;
  v17 = a6;
  v18 = self;
  v19 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v21 = v20;

  v22 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v17);
  v24 = v23;

  sub_1001E4F94(v26, v12, v13, v15, v19, v21, v22, v24);
  sub_100063CD0(v22, v24);
  sub_100063CD0(v19, v21);
  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v15);
  return 1;
}

- (BOOL)deleteKeyWithRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 error:(id *)a6
{
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _TtC10seserviced16SEFidoKeyManager *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = v13;
  v15 = a5;
  v16 = self;
  v17 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v19 = v18;

  sub_1001E573C(v9, v11, v12, v14, v17, v19);
  sub_100063CD0(v17, v19);
  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v14);
  return 1;
}

- (_TtC10seserviced16SEFidoKeyManager)init
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  _TtC10seserviced16SEFidoKeyManager *v6;
  uint64_t v7;
  objc_super v9;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced16SEFidoKeyManager_keychainGroup);
  *v3 = 0xD000000000000026;
  v3[1] = 0x80000001002C2D20;
  v4 = OBJC_IVAR____TtC10seserviced16SEFidoKeyManager_keychainWrapper;
  v5 = (void *)objc_opt_self(SESKeychainWrapper);
  v6 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)objc_msgSend(v5, "sharedInstance");
  v7 = String.init(cString:)(SESLoggingSubsystem);
  Logger.init(subsystem:category:)(v7);

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for SEFidoKeyManager(0);
  return -[SEFidoKeyManager init](&v9, "init");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(_QWORD *)&self->keychainGroup[OBJC_IVAR____TtC10seserviced16SEFidoKeyManager_keychainGroup]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC10seserviced16SEFidoKeyManager_keychainWrapper));
  v3 = (char *)self + OBJC_IVAR____TtC10seserviced16SEFidoKeyManager_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
