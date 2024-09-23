@implementation PlaceSummaryTemplateEntry

- (_TtC4Maps25PlaceSummaryTemplateEntry)init
{
  _TtC4Maps25PlaceSummaryTemplateEntry *result;

  result = (_TtC4Maps25PlaceSummaryTemplateEntry *)_swift_stdlib_reportUnimplementedInitializer("Maps.PlaceSummaryTemplateEntry", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps25PlaceSummaryTemplateEntry_lines));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps25PlaceSummaryTemplateEntry_trailingEntities));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps25PlaceSummaryTemplateEntry_leadingEntities));
}

- (BOOL)containsCuratedGuideUnit
{
  _TtC4Maps25PlaceSummaryTemplateEntry *v2;
  char v3;
  char v4;

  v2 = self;
  sub_10009BDC0();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)containsUserGeneratedGuideUnit
{
  _TtC4Maps25PlaceSummaryTemplateEntry *v2;
  char v3;
  char v4;

  v2 = self;
  sub_10009C038();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)containsContainmentParentUnit
{
  _TtC4Maps25PlaceSummaryTemplateEntry *v2;
  char v3;
  char v4;

  v2 = self;
  sub_10009C2B0();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)containsTransitShieldsUnit
{
  _TtC4Maps25PlaceSummaryTemplateEntry *v2;
  char v3;
  char v4;

  v2 = self;
  sub_10009C528();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)containsPhotoCarouselUnit
{
  _TtC4Maps25PlaceSummaryTemplateEntry *v2;
  char v3;
  char v4;

  v2 = self;
  sub_10009C7A0();
  v4 = v3;

  return v4 & 1;
}

- (id)stringUnitContent
{
  _TtC4Maps25PlaceSummaryTemplateEntry *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10009CA18();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)containsTappableEntityWithIdentifier:(id)a3 metadata:(id)a4
{
  id v5;
  id v7;
  id v8;
  _TtC4Maps25PlaceSummaryTemplateEntry *v9;
  char v10;

  v5 = a3;
  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_10009CC24(v5, (uint64_t)v8);
  LOBYTE(v5) = v10;

  return v5 & 1;
}

@end
