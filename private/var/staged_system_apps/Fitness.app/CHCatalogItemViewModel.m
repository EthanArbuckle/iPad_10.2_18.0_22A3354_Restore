@implementation CHCatalogItemViewModel

- (NSAttributedString)title
{
  return (NSAttributedString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR___CHCatalogItemViewModel_title));
}

- (NSAttributedString)subtitle
{
  return (NSAttributedString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR___CHCatalogItemViewModel_subtitle));
}

- (BOOL)isSeymourPairedWorkout
{
  CHCatalogItemViewModel *v2;
  char v3;

  v2 = self;
  v3 = sub_100326F3C();

  return v3 & 1;
}

- (BOOL)isSeymourGuidedWalkWorkout
{
  CHCatalogItemViewModel *v2;
  char v3;

  v2 = self;
  v3 = sub_100326F78();

  return v3 & 1;
}

- (BOOL)isSeymourGuidedRunWorkout
{
  CHCatalogItemViewModel *v2;
  char v3;

  v2 = self;
  v3 = sub_10032708C();

  return v3 & 1;
}

- (NSString)description
{
  CHCatalogItemViewModel *v2;
  CHWorkoutDetailHeartRateTableViewCell *v3;
  CHWorkoutDetailHeartRateTableViewCell *v4;
  NSString v5;
  SEL v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v2 = self;
  sub_1003272E4();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4, v6, v7, v8, v9, v10, v11, v12);
  return (NSString *)v5;
}

- (CHCatalogItemViewModel)init
{
  CHCatalogItemViewModel *result;

  result = (CHCatalogItemViewModel *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.CatalogItemViewModel", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  SEL v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = (char *)self + OBJC_IVAR___CHCatalogItemViewModel_artwork;
  v4 = type metadata accessor for Artwork(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_100327B80(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CHCatalogItemViewModel_mediaType), *(_QWORD *)&self->title[OBJC_IVAR___CHCatalogItemViewModel_mediaType], self->subtitle[OBJC_IVAR___CHCatalogItemViewModel_mediaType]);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.isa + OBJC_IVAR___CHCatalogItemViewModel_workouts), v5, v6, v7, v8, v9, v10, v11);
}

@end
