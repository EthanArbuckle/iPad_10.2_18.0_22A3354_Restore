@implementation AddToYourRingCollectionViewController

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return sub_1003A5654(a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp37AddToYourRingCollectionViewController *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1003A4440((uint64_t)v11);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  CHWorkoutDetailHeartRateTableViewCell *v14;
  CHWorkoutDetailHeartRateTableViewCell *v15;
  id v16;
  _TtC10FitnessApp37AddToYourRingCollectionViewController *v17;
  id v18;
  SEL v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v27;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = a3;
  v17 = self;
  v18 = sub_1003A5A38(v16, v13, v15);

  swift_bridgeObjectRelease(v15, v19, v20, v21, v22, v23, v24, v25);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v18;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp37AddToYourRingCollectionViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1003A5BB0();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp37AddToYourRingCollectionViewController *v12;
  unint64_t v13;
  int v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = IndexPath.section.getter();
  if (v13 > 3)
  {
    __break(1u);
  }
  else
  {
    v14 = *((unsigned __int8 *)&off_100782D18 + v13 + 32);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    LOBYTE(v13) = v14 != 0;
  }
  return v13;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp37AddToYourRingCollectionViewController *v12;
  unint64_t v13;
  int v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = IndexPath.section.getter();
  if (v13 > 3)
  {
    __break(1u);
  }
  else
  {
    v14 = *((unsigned __int8 *)&off_100782D40 + v13 + 32);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    LOBYTE(v13) = v14 != 0;
  }
  return v13;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (_TtC10FitnessApp37AddToYourRingCollectionViewController)initWithCoder:(id)a3
{
  sub_1005B2880(a3);
  return 0;
}

- (void)dealloc
{
  _TtC10FitnessApp37AddToYourRingCollectionViewController *v2;

  v2 = self;
  sub_1005B29C4();
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
  SEL v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SEL v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.super.super.super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp37AddToYourRingCollectionViewController_appRecommendationDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp37AddToYourRingCollectionViewController_fitnessAppContext));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.super.super.super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp37AddToYourRingCollectionViewController_seymourWorkoutRecommendationDataProvider));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.super.super.super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp37AddToYourRingCollectionViewController_walkSuggestionDataProvider));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC10FitnessApp37AddToYourRingCollectionViewController_impressionsTracker));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.super.super.super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp37AddToYourRingCollectionViewController_artworkImageLoader));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC10FitnessApp37AddToYourRingCollectionViewController_subscriptionToken));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.super.super.super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp37AddToYourRingCollectionViewController_networkEvaluator));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC10FitnessApp37AddToYourRingCollectionViewController_eventHub));
  sub_1000F61B4((uint64_t)self + OBJC_IVAR____TtC10FitnessApp37AddToYourRingCollectionViewController_delegate);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC10FitnessApp37AddToYourRingCollectionViewController_protectedAppsSubscription));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp37AddToYourRingCollectionViewController_walkSuggestionCell));
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp37AddToYourRingCollectionViewController_seymourWorkoutRecommendations), v3, v4, v5, v6, v7, v8, v9);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp37AddToYourRingCollectionViewController_appStoreRecommendations), v10, v11, v12, v13, v14, v15, v16);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp37AddToYourRingCollectionViewController_recentWorkoutAppRecommendations), v17, v18, v19, v20, v21, v22, v23);
}

- (void)viewDidLoad
{
  _TtC10FitnessApp37AddToYourRingCollectionViewController *v2;

  v2 = self;
  sub_1005B2B90();

}

- (_TtC10FitnessApp37AddToYourRingCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC10FitnessApp37AddToYourRingCollectionViewController *result;

  v3 = a3;
  result = (_TtC10FitnessApp37AddToYourRingCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.AddToYourRingCollectionViewController", 48, "init(collectionViewLayout:)", 27, 0);
  __break(1u);
  return result;
}

- (_TtC10FitnessApp37AddToYourRingCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10FitnessApp37AddToYourRingCollectionViewController *result;

  v4 = a4;
  result = (_TtC10FitnessApp37AddToYourRingCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.AddToYourRingCollectionViewController", 48, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void)applicationsDidInstall:(id)a3
{
  _TtC10FitnessApp37AddToYourRingCollectionViewController *v3;

  v3 = self;
  sub_1005B6934("[AddToYourRingSuggestion] applicationsDidInstall, refreshing appRecommendation data provider", 92, (uint64_t)&unk_1007AC628, (uint64_t)&unk_10083C570);

}

- (void)applicationsDidUninstall:(id)a3
{
  _TtC10FitnessApp37AddToYourRingCollectionViewController *v3;

  v3 = self;
  sub_1005B6934("[AddToYourRingSuggestion] applicationsDidUninstall, refreshing appRecommendation data provider", 94, (uint64_t)&unk_1007AC5D8, (uint64_t)&unk_10083C558);

}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  _TtC10FitnessApp37AddToYourRingCollectionViewController *v6;

  swift_unknownObjectRetain(a4);
  v6 = self;
  sub_1005B6934("[AddToYourRingSuggestion] appProtectionSubjectsChanged, refreshing appRecommendation data provider", 98, (uint64_t)&unk_1007AC538, (uint64_t)&unk_10083C530);
  swift_unknownObjectRelease(a4);

}

@end
