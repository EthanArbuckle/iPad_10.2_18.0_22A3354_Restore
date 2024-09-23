@implementation WorkoutAppRecommendationCollectionViewController

- (_TtC10FitnessApp48WorkoutAppRecommendationCollectionViewController)initWithCoder:(id)a3
{
  uint64_t v4;

  v4 = type metadata accessor for WorkoutAppRecommendationCollectionViewController();
  swift_deallocPartialClassInstance(self, v4, 56, 7);
  return 0;
}

- (void)viewDidLoad
{
  _TtC10FitnessApp48WorkoutAppRecommendationCollectionViewController *v2;

  v2 = self;
  sub_1005850DC();

}

- (_TtC10FitnessApp48WorkoutAppRecommendationCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC10FitnessApp48WorkoutAppRecommendationCollectionViewController *result;

  v3 = a3;
  result = (_TtC10FitnessApp48WorkoutAppRecommendationCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.WorkoutAppRecommendationCollectionViewController", 59, "init(collectionViewLayout:)", 27, 0);
  __break(1u);
  return result;
}

- (_TtC10FitnessApp48WorkoutAppRecommendationCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10FitnessApp48WorkoutAppRecommendationCollectionViewController *result;

  v4 = a4;
  result = (_TtC10FitnessApp48WorkoutAppRecommendationCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.WorkoutAppRecommendationCollectionViewController", 59, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  SEL v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.super.super.super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp48WorkoutAppRecommendationCollectionViewController_appRecommendationDataProvider));
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp48WorkoutAppRecommendationCollectionViewController_recentWorkoutAppRecommendations), v3, v4, v5, v6, v7, v8, v9);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp48WorkoutAppRecommendationCollectionViewController_recentWorkoutAppRecommendations))[2] != 0;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (*(_QWORD **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp48WorkoutAppRecommendationCollectionViewController_recentWorkoutAppRecommendations))[2];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp48WorkoutAppRecommendationCollectionViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_1005853FC(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  CGSize result;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  objc_msgSend(a3, "frame");
  v12 = v11 * 0.25;
  v13 = v11 * 0.25 + 28.0;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v14 = v12;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp48WorkoutAppRecommendationCollectionViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100585988((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end
