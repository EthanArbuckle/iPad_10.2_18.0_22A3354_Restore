@implementation BKBookRecommendationProvider

- (BKBookRecommendationProvider)init
{
  char *v3;
  char *v4;
  char *v5;
  objc_class *v6;
  objc_super v8;

  v3 = (char *)self + OBJC_IVAR___BKBookRecommendationProvider____lazy_storage___recommendationService;
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((_QWORD *)v3 + 4) = 0;
  v4 = (char *)self + OBJC_IVAR___BKBookRecommendationProvider____lazy_storage___collectionRecommendationService;
  *((_QWORD *)v4 + 4) = 0;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v5 = (char *)self + OBJC_IVAR___BKBookRecommendationProvider____lazy_storage___postHydrationFilteringService;
  v6 = (objc_class *)type metadata accessor for BookRecommendationProvider();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[BKBookRecommendationProvider init](&v8, "init");
}

- (void)suggestionsTopPicksWithConfiguration:(id)a3 completion:(id)a4
{
  sub_10000CBAC(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))sub_10000801C);
}

- (void)booksYouMightLikeWithConfiguration:(id)a3 completion:(id)a4
{
  sub_10000CBAC(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))sub_100580ACC);
}

- (void)audiobooksYouMightLikeWithConfiguration:(id)a3 completion:(id)a4
{
  sub_10000CBAC(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))sub_100580EB4);
}

- (void)moreFromYourAuthorsWithConfiguration:(id)a3 completion:(id)a4
{
  sub_10000CBAC(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))sub_10058129C);
}

- (void)siriSuggestedTopPicksWithConfiguration:(id)a3 completion:(id)a4
{
  uint64_t v6;
  objc_class *v7;
  BKBookRecommendationProvider *v8;

  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Swift.AnyObject + 8, &protocol witness table for String);
  v7 = (objc_class *)a4;
  v8 = self;
  sub_10000801C(v6, v7);

  swift_bridgeObjectRelease(v6);
}

- (void)suggestionsTopPicksCollectionsWithConfiguration:(id)a3 completion:(id)a4
{
  sub_10000CBAC(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))sub_100581708);
}

- (void)postHydrationFilteredListWithPicks:(id)a3 completion:(id)a4
{
  uint64_t v6;
  objc_class *v7;
  BKBookRecommendationProvider *v8;
  JSValue v9;

  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Swift.AnyObject + 8);
  v7 = (objc_class *)a4;
  v8 = self;
  v9.super.isa = v7;
  sub_100583988(v6, 0, 0, v9);

  swift_bridgeObjectRelease(v6);
}

- (void)postHydrationFilteredListWithPicks:(id)a3 collectionType:(id)a4 completion:(id)a5
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  BKBookRecommendationProvider *v13;
  JSValue v14;

  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Swift.AnyObject + 8);
  v9 = (char *)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  v12 = (objc_class *)a5;
  v13 = self;
  v14.super.isa = v12;
  sub_100583988(v8, v9, v11, v14);

  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v11);
}

- (void).cxx_destruct
{
  sub_100010960((uint64_t)self + OBJC_IVAR___BKBookRecommendationProvider____lazy_storage___recommendationService, &qword_1009EC480);
  sub_100010960((uint64_t)self + OBJC_IVAR___BKBookRecommendationProvider____lazy_storage___collectionRecommendationService, &qword_1009EC470);
  sub_100010960((uint64_t)self + OBJC_IVAR___BKBookRecommendationProvider____lazy_storage___postHydrationFilteringService, &qword_1009EC460);
}

@end
