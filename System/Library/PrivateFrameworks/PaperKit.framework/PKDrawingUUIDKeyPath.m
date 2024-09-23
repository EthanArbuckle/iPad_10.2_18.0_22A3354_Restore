@implementation PKDrawingUUIDKeyPath

- (NSString)uniqueCacheFilePath
{
  _TtC8PaperKit20PKDrawingUUIDKeyPath *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = self;
  v3 = MEMORY[0x1DF0E3D44]();
  v5 = v4;
  Data.base64EncodedString(options:)(0);
  outlined consume of Data._Representation(v3, v5);
  lazy protocol witness table accessor for type String and conformance String();
  v6 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  v8 = v7;

  swift_bridgeObjectRelease();
  v9 = (void *)MEMORY[0x1DF0E41AC](v6, v8);
  swift_bridgeObjectRelease();
  return (NSString *)v9;
}

- (NSData)AES128Key
{
  _TtC8PaperKit20PKDrawingUUIDKeyPath *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  Class isa;

  v2 = self;
  PKDrawingUUIDKeyPath.aes128Key.getter();
  v4 = v3;
  v6 = v5;

  isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v4, v6);
  return (NSData *)isa;
}

- (BOOL)isEqual:(id)a3
{
  _TtC8PaperKit20PKDrawingUUIDKeyPath *v4;
  _TtC8PaperKit20PKDrawingUUIDKeyPath *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = PKDrawingUUIDKeyPath.isEqual(_:)((uint64_t)v8);

  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v8, &demangling cache variable for type metadata for Any?);
  return v6 & 1;
}

- (int64_t)hash
{
  _TtC8PaperKit20PKDrawingUUIDKeyPath *v3;
  Swift::Int v4;

  Hasher.init()();
  type metadata accessor for CRKeyPath();
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags((unint64_t *)&lazy protocol witness table cache variable for type CRKeyPath and conformance CRKeyPath, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0D12C70], MEMORY[0x1E0D12C88]);
  v3 = self;
  dispatch thunk of Hashable.hash(into:)();
  v4 = Hasher.finalize()();

  return v4;
}

- (NSString)description
{
  _TtC8PaperKit20PKDrawingUUIDKeyPath *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CRKeyPath.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x1DF0E41AC](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC8PaperKit20PKDrawingUUIDKeyPath)init
{
  _TtC8PaperKit20PKDrawingUUIDKeyPath *result;

  result = (_TtC8PaperKit20PKDrawingUUIDKeyPath *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC8PaperKit20PKDrawingUUIDKeyPath_keypath;
  v3 = type metadata accessor for CRKeyPath();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
