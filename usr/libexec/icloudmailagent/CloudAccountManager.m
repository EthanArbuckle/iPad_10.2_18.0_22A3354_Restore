@implementation CloudAccountManager

- (BOOL)setFlagsToAccountWithEmailAddress:(id)a3 keys:(id)a4 value:(BOOL)a5 error:(id *)a6
{
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  CloudAccountManager *v13;

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String);
  v13 = self;
  sub_100028FFC(v9, v11, v12, a5);
  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v12);

  return 1;
}

- (id)getAppleAccountWithEmailAddress:(id)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  CloudAccountManager *v8;
  id v9;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = self;
  v9 = sub_10002936C(v5, v7);
  swift_bridgeObjectRelease(v7);

  return v9;
}

- (id)fetchDefaultCertificatesForAccountWithEmailAddress:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CloudAccountManager *v8;
  id v9;
  Class isa;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = self;
  v9 = sub_100024FB4(v5, v7);
  swift_bridgeObjectRelease(v7);

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  return isa;
}

- (BOOL)updateCertificateDefaultsWithEmailAddress:(id)a3 identityPersistentRefs:(id)a4 error:(id *)a5
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  CloudAccountManager *v11;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = (_QWORD *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, &type metadata for Data, &protocol witness table for String);
  v11 = self;
  sub_10002597C(v7, v9, v10);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v10);

  return 1;
}

- (BOOL)removeCertificateDefaultsWithEmailAddress:(id)a3 certTypeKey:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CloudAccountManager *v13;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = v11;
  v13 = self;
  sub_100026600(v7, v9, v10, v12);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v12);

  return 1;
}

- (CloudAccountManager)init
{
  _QWORD *v2;
  _QWORD *v3;
  objc_super v5;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CloudAccountManager_userDefaultsMailAppGroup);
  *v2 = 0xD000000000000014;
  v2[1] = 0x800000010002F4D0;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CloudAccountManager_mailPropertyKey);
  *v3 = 0xD000000000000023;
  v3[1] = 0x800000010002F4F0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CloudAccountManager();
  return -[CloudAccountManager init](&v5, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->userDefaultsMailAppGroup[OBJC_IVAR___CloudAccountManager_userDefaultsMailAppGroup]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->userDefaultsMailAppGroup[OBJC_IVAR___CloudAccountManager_mailPropertyKey]);
}

@end
