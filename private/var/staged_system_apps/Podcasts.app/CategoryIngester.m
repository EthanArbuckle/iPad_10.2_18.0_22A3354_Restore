@implementation CategoryIngester

- (id)unsafeIngestNewCategoryWithCtx:(id)a3 feedCategory:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  swift_retain();
  v7 = CategoryIngester.unsafeIngestNewCategory(ctx:feedCategory:)((uint64_t)v6, a4);

  swift_unknownObjectRelease(a4);
  swift_release(self);
  return v7;
}

- (id)unsafeIngestCategoryWithCategory:(id)a3 feedCategory:(id)a4 ctx:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a3;
  swift_unknownObjectRetain(a4);
  v9 = a5;
  swift_retain();
  v10 = CategoryIngester.unsafeIngestCategory(category:feedCategory:ctx:)(v8, a4, (uint64_t)v9);

  swift_unknownObjectRelease(a4);
  swift_release(self);
  return v10;
}

- (id)unsafeIngestFeedCategory:(id)a3 ctx:(id)a4
{
  id v7;
  id v8;

  swift_unknownObjectRetain(a3);
  v7 = a4;
  swift_retain();
  v8 = CategoryIngester.unsafeIngestFeedCategory(_:ctx:)(a3, (uint64_t)v7);
  swift_unknownObjectRelease(a3);

  swift_release(self);
  return v8;
}

@end
