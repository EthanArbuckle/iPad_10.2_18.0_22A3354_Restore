@implementation PlaceSummaryTextHighlightConfiguration

- (NSString)typedAutocompleteQuery
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->typedAutocompleteQuery[OBJC_IVAR____TtC4Maps38PlaceSummaryTextHighlightConfiguration_typedAutocompleteQuery];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (_TtC4Maps29PlaceSummaryTextHighlightType)type
{
  return (_TtC4Maps29PlaceSummaryTextHighlightType *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                             + OBJC_IVAR____TtC4Maps38PlaceSummaryTextHighlightConfiguration_type));
}

- (_TtC4Maps38PlaceSummaryTextHighlightConfiguration)initWithTypedAutocompleteQuery:(id)a3 type:(id)a4
{
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  id v9;
  objc_super v11;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps38PlaceSummaryTextHighlightConfiguration_typedAutocompleteQuery);
  *v7 = v6;
  v7[1] = v8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps38PlaceSummaryTextHighlightConfiguration_type) = (Class)a4;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for PlaceSummaryTextHighlightConfiguration();
  v9 = a4;
  return -[PlaceSummaryTextHighlightConfiguration init](&v11, "init");
}

- (_TtC4Maps38PlaceSummaryTextHighlightConfiguration)init
{
  _TtC4Maps38PlaceSummaryTextHighlightConfiguration *result;

  result = (_TtC4Maps38PlaceSummaryTextHighlightConfiguration *)_swift_stdlib_reportUnimplementedInitializer("Maps.PlaceSummaryTextHighlightConfiguration", 43, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->typedAutocompleteQuery[OBJC_IVAR____TtC4Maps38PlaceSummaryTextHighlightConfiguration_typedAutocompleteQuery]);

}

@end
