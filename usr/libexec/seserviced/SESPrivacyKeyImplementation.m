@implementation SESPrivacyKeyImplementation

+ (void)createPrivacyKeyWithGroupIdentifier:(id)a3 options:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v8 = _Block_copy(a5);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  if (a4)
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v12 = swift_allocObject(&unk_10030C460, 24, 7);
  *(_QWORD *)(v12 + 16) = v8;
  swift_getObjCClassMetadata(a1);
  sub_1001A48CC(v9, v11, (uint64_t)a4, (uint64_t)sub_1001AAAC0, v12);
  swift_bridgeObjectRelease(v11);
  swift_release(v12);
  swift_bridgeObjectRelease(a4);
}

+ (void)getPrivacyKeyWithGroupIdentifier:(id)a3 keyIdentifier:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v8 = _Block_copy(a5);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  if (a4)
  {
    v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v13;
  }
  else
  {
    v12 = 0;
  }
  v14 = swift_allocObject(&unk_10030C3E8, 24, 7);
  *(_QWORD *)(v14 + 16) = v8;
  swift_getObjCClassMetadata(a1);
  sub_1001A4CD8(v9, v11, v12, (uint64_t)a4, (uint64_t)sub_1001AAAC0, v14);
  swift_bridgeObjectRelease(v11);
  swift_release(v14);
  swift_bridgeObjectRelease(a4);
}

+ (void)deletePrivacyKey:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_10030C370, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  swift_getObjCClassMetadata(a1);
  v8 = a3;
  sub_1001A59B8(v8, (uint64_t)sub_1001A94F0, v7);

  swift_release(v7);
}

+ (void)decryptPayload:(id)a3 groupIdentifier:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v8 = _Block_copy(a5);
  v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = v11;
  v13 = swift_allocObject(&unk_10030C2F8, 24, 7);
  *(_QWORD *)(v13 + 16) = v8;
  swift_getObjCClassMetadata(a1);
  sub_1001A6148(v9, v10, v12, (uint64_t)sub_1001A940C, v13);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v12);
  swift_release(v13);
}

+ (void)encryptPayload:(id)a3 scheme:(id)a4 recipientPublicKey:(id)a5 completion:(id)a6
{
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  id v20;

  v10 = _Block_copy(a6);
  v11 = a3;
  v20 = a4;
  v12 = a5;
  v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v15 = v14;

  v16 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v12);
  v18 = v17;

  v19 = swift_allocObject(&unk_10030C280, 24, 7);
  *(_QWORD *)(v19 + 16) = v10;
  swift_getObjCClassMetadata(a1);
  sub_1001A6F38(v13, v15, v20, v16, v18, (uint64_t)sub_1001A8F30, v19);
  swift_release(v19);
  sub_100063CD0(v16, v18);
  sub_100063CD0(v13, v15);

}

- (_TtC10seserviced27SESPrivacyKeyImplementation)init
{
  return (_TtC10seserviced27SESPrivacyKeyImplementation *)sub_1001A8778();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC10seserviced27SESPrivacyKeyImplementation_keychainWrapper));
  swift_bridgeObjectRelease(*(_QWORD *)&self->queue[OBJC_IVAR____TtC10seserviced27SESPrivacyKeyImplementation_keychainGroup]);
  v3 = (char *)self + OBJC_IVAR____TtC10seserviced27SESPrivacyKeyImplementation_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
