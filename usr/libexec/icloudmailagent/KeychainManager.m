@implementation KeychainManager

- (id)saveIdentityToKeychain:(__SecCertificate *)a3 privateKey:(__SecKey *)a4 error:(id *)a5
{
  __SecCertificate *v7;
  __SecKey *v8;
  KeychainManager *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  Class isa;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = sub_10001D890((uint64_t)v7, (uint64_t)v8);
  v12 = v11;

  isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100008F94(v10, v12);
  return isa;
}

- (BOOL)saveCertificateToKeychain:(__SecCertificate *)a3 error:(id *)a4
{
  __SecCertificate *v5;
  KeychainManager *v6;

  v5 = a3;
  v6 = self;
  sub_10001DB30(v5);

  return 1;
}

- (void)getCertificateByIdentityRef:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  KeychainManager *v11;

  v6 = _Block_copy(a4);
  v7 = a3;
  v11 = self;
  v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;

  _Block_copy(v6);
  sub_10001F1A8(v8, v10, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
  sub_100008F94(v8, v10);

}

- (void)findSecIdentityRefForCertId:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  KeychainManager *v10;

  v6 = _Block_copy(a4);
  v7 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  _Block_copy(v6);
  v10 = self;
  sub_10001F62C(v7, v9, (uint64_t)v10, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(v9);
}

- (__SecIdentity)findSecIdentityForCertId:(id)a3 error:(id *)a4
{
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  KeychainManager *v8;
  Class v9;

  v5 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = self;
  v9 = sub_10001DD9C(v5, v7);
  swift_bridgeObjectRelease(v7);

  return v9;
}

- (id)getIdentityPersistentRef:(__SecIdentity *)a3 error:(id *)a4
{
  __SecIdentity *v5;
  KeychainManager *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  Class isa;

  v5 = a3;
  v6 = self;
  sub_10001E0DC(v5);
  v8 = v7;
  v10 = v9;

  isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100008F94(v8, v10);
  return isa;
}

- (__SecIdentity)getIdentityByRef:(id)a3 error:(id *)a4
{
  id v6;
  KeychainManager *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = a3;
  v7 = self;
  v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;

  sub_100008F50(v8, v10);
  v11 = sub_100016CF4(v8, v10);
  sub_100008F94(v8, v10);

  sub_100008F94(v8, v10);
  type metadata accessor for SecIdentity(0);
  return (__SecIdentity *)(id)swift_dynamicCastUnknownClassUnconditional(v11, v12, 0, 0, 0);
}

- (id)find:(const __CFString *)a3 error:(id *)a4
{
  __CFString *v5;
  KeychainManager *v6;
  Class v7;
  Class isa;

  v5 = (id)a3;
  v6 = self;
  v7 = sub_10001E688(v5);

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  return isa;
}

- (KeychainManager)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___KeychainManager_keychainAccessGroup);
  *v2 = 0xD000000000000019;
  v2[1] = 0x800000010002F210;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for KeychainManager();
  return -[KeychainManager init](&v4, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->keychainAccessGroup[OBJC_IVAR___KeychainManager_keychainAccessGroup]);
}

@end
