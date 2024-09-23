@implementation PlaceSummaryTextHighlightType

- (_TtC4Maps29PlaceSummaryTextHighlightType)initWithHighlightType:(int64_t)a3
{
  char v3;
  objc_super v5;

  v3 = a3 == 1;
  if (a3 == 2)
    v3 = 2;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps29PlaceSummaryTextHighlightType_type) = v3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PlaceSummaryTextHighlightType();
  return -[PlaceSummaryTextHighlightType init](&v5, "init");
}

- (_TtC4Maps29PlaceSummaryTextHighlightType)init
{
  _TtC4Maps29PlaceSummaryTextHighlightType *result;

  result = (_TtC4Maps29PlaceSummaryTextHighlightType *)_swift_stdlib_reportUnimplementedInitializer("Maps.PlaceSummaryTextHighlightType", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
