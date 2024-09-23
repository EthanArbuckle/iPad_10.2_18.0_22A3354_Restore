@implementation BloomFilterShim

- (_TtC22WebContentRestrictions15BloomFilterShim)initWithPath:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC22WebContentRestrictions15BloomFilterShim *)BloomFilterShim.init(path:)(v3, v4);
}

- (BOOL)contains:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC22WebContentRestrictions15BloomFilterShim *v7;
  Swift::String v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  LOBYTE(v4) = BloomFilterShim.contains(_:)(v8);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (_TtC22WebContentRestrictions15BloomFilterShim)init
{
  _TtC22WebContentRestrictions15BloomFilterShim *result;

  result = (_TtC22WebContentRestrictions15BloomFilterShim *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of MembershipFilter?((uint64_t)self + OBJC_IVAR____TtC22WebContentRestrictions15BloomFilterShim_filter, &demangling cache variable for type metadata for MembershipFilter?);
}

@end
