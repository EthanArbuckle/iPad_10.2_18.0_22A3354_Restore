@implementation SLDProcessVerifier

+ (id)tagDataFromString:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  Class isa;
  uint64_t v13;

  v4 = type metadata accessor for String.Encoding();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
    return 0;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String.Encoding.utf8.getter();
  v8 = String.data(using:allowLossyConversion:)();
  v10 = v9;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_bridgeObjectRelease();
  if (v10 >> 60 == 15)
    return 0;
  isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data?(v8, v10);
  return isa;
}

- (id)signProcess:(id)a3 tag:(id)a4 error:(id *)a5
{
  id v8;
  SLDProcessVerifier *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  SLDProcessVerifier *v15;
  _DWORD *v16;
  unint64_t v17;
  unint64_t v18;
  Class isa;

  if (a4)
  {
    v8 = a3;
    v9 = self;
    v10 = a4;
    v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v13 = v12;

  }
  else
  {
    v14 = a3;
    v15 = self;
    v11 = 0;
    v13 = 0xF000000000000000;
  }
  v16 = ProcessVerifier.sign(process:tag:)(a3, v11, v13);
  v18 = v17;

  outlined consume of Data?(v11, v13);
  isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation((uint64_t)v16, v18);
  return isa;
}

- (id)verifyData:(id)a3 tag:(id)a4 error:(id *)a5
{
  id v7;
  SLDProcessVerifier *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint8_t *v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;

  v7 = a3;
  v8 = self;
  v9 = a4;
  v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;

  if (v9)
  {
    v13 = (uint8_t *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v15 = v14;

  }
  else
  {
    v13 = 0;
    v15 = 0xF000000000000000;
  }
  v16 = ProcessVerifier.verify(data:tag:)(v10, v12, v13, v15);

  outlined consume of Data?((uint64_t)v13, v15);
  outlined consume of Data._Representation(v10, v12);
  return v16;
}

- (SLDProcessVerifier)init
{
  objc_class *ObjectType;
  char *v4;
  uint64_t v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *((_BYTE *)&self->super.isa + OBJC_IVAR___SLDProcessVerifier_useStaticKeyForTesting) = 0;
  v4 = (char *)self + OBJC_IVAR___SLDProcessVerifier____lazy_storage___staticTestingKey;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SymmetricKey?);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[SLDProcessVerifier init](&v7, sel_init);
}

- (void).cxx_destruct
{
  outlined destroy of SymmetricKey??((uint64_t)self + OBJC_IVAR___SLDProcessVerifier____lazy_storage___staticTestingKey, &demangling cache variable for type metadata for SymmetricKey??);
}

@end
