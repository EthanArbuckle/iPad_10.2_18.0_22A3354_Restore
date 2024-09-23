@implementation OpaqueDataService

+ (id)serializedHPKEWithData:(id)a3 publicKey:(id)a4 scheme:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)sub_1C35B6A5C();
  v13 = v12;

  v14 = (void *)sub_1C35B6A5C();
  v16 = v15;

  if (v10)
  {
    sub_1C35B6C60();

  }
  v17 = sub_1C35AD66C(v11, v13, v14, v16);
  v19 = v18;
  swift_bridgeObjectRelease();
  sub_1C3573D7C((uint64_t)v14, (unint64_t)v16);
  sub_1C3573D7C((uint64_t)v11, v13);
  v20 = (void *)sub_1C35B6A44();
  sub_1C3573D7C((uint64_t)v17, v19);
  return v20;
}

- (_TtC24AppletTranslationLibrary17OpaqueDataService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for OpaqueDataService();
  return -[OpaqueDataService init](&v3, sel_init);
}

@end
