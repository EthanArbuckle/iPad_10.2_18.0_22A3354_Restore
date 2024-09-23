@implementation SearchHomeUserGuidesDataFetcher

- (SearchHomeDataFetcherDelegate)delegate
{
  return (SearchHomeDataFetcherDelegate *)(id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31SearchHomeUserGuidesDataFetcher_delegate));
}

- (void)setDelegate:(id)a3
{
  uint64_t v3;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31SearchHomeUserGuidesDataFetcher_delegate);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31SearchHomeUserGuidesDataFetcher_delegate) = (Class)a3;
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRelease(v3);
}

- (NSArray)dataProviders
{
  uint64_t v2;
  NSArray v3;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31SearchHomeUserGuidesDataFetcher_dataProviders);
  if (v2)
  {
    swift_bridgeObjectRetain(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC4Maps31SearchHomeUserGuidesDataFetcher_dataProviders));
    sub_100008B04((uint64_t *)&unk_101493B20);
    v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3.super.isa = 0;
  }
  return (NSArray *)v3.super.isa;
}

- (void)setDataProviders:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;

  if (a3)
  {
    v5 = sub_100008B04((uint64_t *)&unk_101493B20);
    v6 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  }
  else
  {
    v6 = 0;
  }
  v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31SearchHomeUserGuidesDataFetcher_dataProviders);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31SearchHomeUserGuidesDataFetcher_dataProviders) = v6;
  swift_bridgeObjectRelease(v7);
}

- (BOOL)isFetchingDataComplete
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps31SearchHomeUserGuidesDataFetcher_isFetchingDataComplete);
}

- (void)setIsFetchingDataComplete:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps31SearchHomeUserGuidesDataFetcher_isFetchingDataComplete) = a3;
}

- (_TtC4Maps31SearchHomeUserGuidesDataFetcher)initWithDelegate:(id)a3 isSearchAlongRoute:(BOOL)a4
{
  _TtC4Maps31SearchHomeUserGuidesDataFetcher *v5;

  swift_unknownObjectRetain(a3);
  v5 = (_TtC4Maps31SearchHomeUserGuidesDataFetcher *)sub_100023184((uint64_t)a3);
  swift_unknownObjectRelease(a3);
  return v5;
}

- (void)fetchContent
{
  _TtC4Maps31SearchHomeUserGuidesDataFetcher *v2;

  v2 = self;
  sub_10002250C();

}

- (_TtC4Maps31SearchHomeUserGuidesDataFetcher)init
{
  _TtC4Maps31SearchHomeUserGuidesDataFetcher *result;

  result = (_TtC4Maps31SearchHomeUserGuidesDataFetcher *)_swift_stdlib_reportUnimplementedInitializer("Maps.SearchHomeUserGuidesDataFetcher", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC4Maps31SearchHomeUserGuidesDataFetcher_delegate));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps31SearchHomeUserGuidesDataFetcher_dataProviders));
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC4Maps31SearchHomeUserGuidesDataFetcher_title]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps31SearchHomeUserGuidesDataFetcher_collectionDataProvider));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps31SearchHomeUserGuidesDataFetcher_diffableSnapshotObjects));
}

@end
