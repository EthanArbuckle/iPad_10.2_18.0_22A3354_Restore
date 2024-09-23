@implementation AssetActivityItemProviderWrapper

- (_TtC5Books32AssetActivityItemProviderWrapper)init
{
  _TtC5Books32AssetActivityItemProviderWrapper *result;

  result = (_TtC5Books32AssetActivityItemProviderWrapper *)_swift_stdlib_reportUnimplementedInitializer("Books.AssetActivityItemProviderWrapper", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books32AssetActivityItemProviderWrapper_paginationService);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books32AssetActivityItemProviderWrapper_bookProvider);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Books32AssetActivityItemProviderWrapper_progressKitController));

  sub_100010960((uint64_t)self + OBJC_IVAR____TtC5Books32AssetActivityItemProviderWrapper_cachedStoreShortURL, (uint64_t *)&unk_1009D23D0);
}

- (_NSRange)pageRangeForAnnotation:(id)a3
{
  _TtC5Books32AssetActivityItemProviderWrapper *v5;
  id v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  swift_unknownObjectRetain(a3);
  v5 = self;
  v6 = sub_1001FDB14(a3);
  v8 = v7;
  swift_unknownObjectRelease(a3);

  v9 = (NSUInteger)v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (id)chapterTitleForAnnotation:(id)a3
{
  _TtC5Books32AssetActivityItemProviderWrapper *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v4 = self;
  v5 = (void *)swift_unknownObjectRetain(a3);
  sub_1001FDD50(v5);
  v7 = v6;
  swift_unknownObjectRelease(a3);

  if (v7)
  {
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end
