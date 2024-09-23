@implementation PlaceSummaryMetadata

- (_TtC4Maps20PlaceSummaryMetadata)init
{
  _TtC4Maps20PlaceSummaryMetadata *result;

  result = (_TtC4Maps20PlaceSummaryMetadata *)_swift_stdlib_reportUnimplementedInitializer("Maps.PlaceSummaryMetadata", 25, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps20PlaceSummaryMetadata_templatePairs));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps20PlaceSummaryMetadata_serverOverrides));
}

- (_TtC4Maps20PlaceSummaryMetadata)initWithMetadata:(id)a3
{
  return (_TtC4Maps20PlaceSummaryMetadata *)sub_1001AA61C(a3);
}

- (BOOL)containsPhotoCarouselLine
{
  _TtC4Maps20PlaceSummaryMetadata *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1001AB0B0();

  return v3 & 1;
}

@end
