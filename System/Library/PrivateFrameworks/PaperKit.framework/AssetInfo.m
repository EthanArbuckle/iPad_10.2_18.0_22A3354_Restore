@implementation AssetInfo

- (BOOL)isEqual:(id)a3
{
  _TtC8PaperKit9AssetInfo *v4;
  _TtC8PaperKit9AssetInfo *v5;
  BOOL v6;
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
  v6 = AssetInfo.isEqual(_:)((uint64_t)v8);

  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v8, &demangling cache variable for type metadata for Any?);
  return v6;
}

- (int64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  _TtC8PaperKit9AssetInfo *v5;
  Swift::Int v6;

  Hasher.init()();
  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit9AssetInfo_digest);
  v4 = *(_QWORD *)&self->digest[OBJC_IVAR____TtC8PaperKit9AssetInfo_digest];
  v5 = self;
  outlined copy of Data._Representation(v3, v4);
  Data.hash(into:)();
  outlined consume of Data._Representation(v3, v4);
  Hasher._combine(_:)(*(Swift::UInt *)((char *)&v5->super.isa + OBJC_IVAR____TtC8PaperKit9AssetInfo_maxDimensionInPixels));
  v6 = Hasher.finalize()();

  return v6;
}

- (_TtC8PaperKit9AssetInfo)init
{
  _TtC8PaperKit9AssetInfo *result;

  result = (_TtC8PaperKit9AssetInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined consume of Data._Representation(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit9AssetInfo_digest), *(_QWORD *)&self->digest[OBJC_IVAR____TtC8PaperKit9AssetInfo_digest]);
}

@end
