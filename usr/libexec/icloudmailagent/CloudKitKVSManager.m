@implementation CloudKitKVSManager

- (CloudKitKVSManager)initWithStoreIdentifier:(id)a3 cloudAccountManager:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  swift_unknownObjectRetain(a4);
  return (CloudKitKVSManager *)sub_10001CA5C(v6, v8, (char *)a4, (char *)self);
}

- (void)fetchSigningAndEncrytionStatusFor:(id)a3 completion:(id)a4
{
  sub_100009390(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_10000AD6C);
}

- (void)setSigningAndEncrytionStatusTo:(BOOL)a3 for:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  CloudKitKVSManager *v12;

  v8 = _Block_copy(a5);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  _Block_copy(v8);
  v12 = self;
  sub_10000AFE4(a3, v9, v11, (uint64_t)v12, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease(v11);
}

- (void)fetchSigningAndEncrytionMessagesStatusFor:(id)a3 completion:(id)a4
{
  sub_100009390(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_10000B56C);
}

- (void)setDigitallySignMessageIsEnabledTo:(BOOL)a3 for:(id)a4 completion:(id)a5
{
  sub_100009440(self, (int)a2, a3, (uint64_t)a4, a5, (uint64_t)&off_100034F98, 0xD000000000000013, 0x800000010002DB50);
}

- (void)setEncryptMessagesIsEnabledTo:(BOOL)a3 for:(id)a4 completion:(id)a5
{
  sub_100009440(self, (int)a2, a3, (uint64_t)a4, a5, (uint64_t)&off_100034FC8, 0xD000000000000016, 0x800000010002DB70);
}

- (id)fetchCertificatesSettingsWithEmailAddress:(id)a3 error:(id *)a4
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  CloudKitKVSManager *v8;
  uint64_t v9;
  Class isa;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = self;
  v9 = sub_100009988(v5, v7);
  swift_bridgeObjectRelease(v7);

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  return isa;
}

- (BOOL)updateCertificateSettingsWithEmailAddress:(id)a3 identityPersistentRefs:(id)a4 error:(id *)a5
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  CloudKitKVSManager *v11;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, &type metadata for Data, &protocol witness table for String);
  v11 = self;
  sub_100009FFC(v7, v9, v10);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v10);

  return 1;
}

- (BOOL)removeCertificateSettingsWithEmailAddress:(id)a3 certTypeKey:(id)a4 error:(id *)a5
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CloudKitKVSManager *v13;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = v11;
  v13 = self;
  sub_10000A5E0(v7, v9, v10, v12);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v12);

  return 1;
}

- (void)handleStoreDidChangeExternally:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v4 = type metadata accessor for Notification(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  sub_10000BE50((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)dealloc
{
  void *v3;
  CloudKitKVSManager *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "defaultCenter");
  objc_msgSend(v5, "removeObserver:name:object:", v4, NSUbiquitousKeyValueStoreDidChangeExternallyNotification, *(Class *)((char *)&v4->super.isa + OBJC_IVAR___CloudKitKVSManager_keyValueStore));

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for CloudKitKVSManager();
  -[CloudKitKVSManager dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->storeIdentifier[OBJC_IVAR___CloudKitKVSManager_storeIdentifier]);

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CloudKitKVSManager_cloudAccountManager));
}

- (CloudKitKVSManager)init
{
  CloudKitKVSManager *result;

  result = (CloudKitKVSManager *)_swift_stdlib_reportUnimplementedInitializer("icloudmailagent.CloudKitKVSManager", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
