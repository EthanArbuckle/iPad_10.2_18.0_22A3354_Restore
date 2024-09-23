@implementation CryptoKitWrapper

+ (id)convertPrivateKeyToPEMWithX963PrivateKey:(id)a3 error:(id *)a4
{
  return sub_10001C47C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_10001C9FC);
}

+ (id)convertPrivateKeyTox963WithPemPrivateKey:(id)a3 error:(id *)a4
{
  return sub_10001C47C((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, unint64_t))sub_10001CC80);
}

+ (id)unwrapEncryptionKeyWithWrappedKey:(id)a3 encapsulatedKey:(id)a4 privateKey:(id)a5 error:(id *)a6
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
  unint64_t v19;
  unint64_t v20;
  uint64_t *v21;
  unint64_t v22;
  unint64_t v23;
  Class isa;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v14 = v13;

  v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v10);
  v17 = v16;

  v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v11);
  v20 = v19;

  v21 = sub_10001CEE0(v12, v14, v15, v17, v18, v20);
  v23 = v22;
  sub_10001DE08(v18, v20);
  sub_10001DE08(v15, v17);
  sub_10001DE08(v12, v14);
  isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10001DE08((uint64_t)v21, v23);
  return isa;
}

+ (id)wrappedDataDictionaryWithCertWithPlainText:(id)a3 certificate:(__SecCertificate *)a4 error:(id *)a5
{
  id v7;
  __SecCertificate *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  Class v12;
  Class isa;

  v7 = a3;
  v8 = a4;
  v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;

  v12 = sub_10001D3D4(v9, v11, v8);
  sub_10001DE08(v9, v11);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v12);
  return isa;
}

- (_TtC16FetchRestoreKeys16CryptoKitWrapper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CryptoKitWrapper();
  return -[CryptoKitWrapper init](&v3, "init");
}

@end
