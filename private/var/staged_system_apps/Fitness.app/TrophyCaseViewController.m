@implementation TrophyCaseViewController

- (_TtC10FitnessApp24TrophyCaseViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10028AB40();
}

- (void)dealloc
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC10FitnessApp24TrophyCaseViewController *v8;
  objc_super v9;

  v3 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_achievementDataProvider);
  v4 = v3[3];
  v5 = v3[4];
  sub_100016804(v3, v4);
  v7 = sub_100028404(&qword_10082B528, v6, (uint64_t (*)(uint64_t))type metadata accessor for TrophyCaseViewController, (uint64_t)&unk_100632308);
  v8 = self;
  dispatch thunk of AAUIAwardsDataProviding.remove(observer:)(v8, v7, v4, v5);

  v9.receiver = v8;
  v9.super_class = (Class)type metadata accessor for TrophyCaseViewController();
  -[TrophyCaseViewController dealloc](&v9, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_friendListManager));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.super.super.super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_achievementDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_badgeImageFactory));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_formattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_localizationProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_pauseRingsCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_resourceProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_fitnessAppContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_workoutFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_workoutDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_wheelchairUseCache));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_initialAchievement));
  sub_1000F61B4((uint64_t)self + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_transitionAnimator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_transitionAnimatorFromViewController));
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC10FitnessApp24TrophyCaseViewController *v4;

  v4 = self;
  sub_10028725C(a3);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TrophyCaseViewController();
  v4 = v5.receiver;
  -[TrophyCaseViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
  sub_100287344();

}

- (_TtC10FitnessApp24TrophyCaseViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC10FitnessApp24TrophyCaseViewController *result;

  v3 = a3;
  result = (_TtC10FitnessApp24TrophyCaseViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.TrophyCaseViewController", 35, "init(collectionViewLayout:)", 27, 0);
  __break(1u);
  return result;
}

- (_TtC10FitnessApp24TrophyCaseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10FitnessApp24TrophyCaseViewController *result;

  v4 = a4;
  result = (_TtC10FitnessApp24TrophyCaseViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.TrophyCaseViewController", 35, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 3;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  _TtC10FitnessApp24TrophyCaseViewController *v7;
  int64_t v8;
  int64_t v9;

  v6 = a3;
  v7 = self;
  sub_10028AC14(a4);
  v9 = v8;

  return v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp24TrophyCaseViewController *v12;
  void *v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = (void *)sub_100288F3C(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp24TrophyCaseViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_10028ADE4();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _TtC10FitnessApp24TrophyCaseViewController *v17;
  void *v18;
  void *v19;
  __n128 v20;
  uint64_t v22;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = a3;
  v17 = self;
  sub_10028A044(v16, v13, v15);
  v19 = v18;

  v20 = swift_bridgeObjectRelease(v15);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v20);
  return v19;
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10;
  id v11;
  id v12;
  _TtC10FitnessApp24TrophyCaseViewController *v13;
  void *v14;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = self;
  v14 = (void *)sub_10028B0A8((void *)a4, v11, v12);

  return v14;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  return 1;
}

- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_localizationProvider), "setWheelchairUser:", a4);
}

- (void)pregnancyModelDidChangeWithProvider:(id)a3 model:(id)a4
{
  void *v6;
  id v7;
  id v8;
  _TtC10FitnessApp24TrophyCaseViewController *v9;

  v6 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp24TrophyCaseViewController_localizationProvider);
  v7 = a3;
  v8 = a4;
  v9 = self;
  objc_msgSend(v6, "setIsPregnant:", objc_msgSend(v7, "isPregnant"));

}

@end
