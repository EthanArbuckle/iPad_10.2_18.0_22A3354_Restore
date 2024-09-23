@implementation TrophyCaseAwardDetailViewController

- (AAUIBadgeView)badgeView
{
  return (AAUIBadgeView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                  + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_badgeView));
}

- (_TtC10FitnessApp35TrophyCaseAwardDetailViewController)initWithAchievement:(id)a3 healthStore:(id)a4 friendListManager:(id)a5 achievementDataProvider:(id)a6 badgeImageFactory:(id)a7 resourceProvider:(id)a8 formattingManager:(id)a9 localizationProvider:(id)a10 pauseRingsCoordinator:(id)a11 fitnessAppContext:(id)a12 workoutFormattingManager:(id)a13 workoutDataProvider:(id)a14 forModalPresentation:(BOOL)a15 shouldShowCelebration:(BOOL)a16 shouldShowEarned:(BOOL)a17 shouldShowAssociatedWorkout:(BOOL)a18
{
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _TtC10FitnessApp35TrophyCaseAwardDetailViewController *v31;
  __int128 v33;
  uint64_t v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t ObjectType;
  _QWORD v40[3];
  uint64_t v41;
  uint64_t v42;

  ObjectType = swift_getObjectType(self);
  sub_1000252E0((uint64_t)a6 + OBJC_IVAR___CHAwardsDataProvider_awardsDataProvider, (uint64_t)v40);
  v24 = v41;
  v34 = v42;
  v37 = sub_10017C044((uint64_t)v40, v41);
  v35 = a3;
  v25 = a4;
  v26 = a5;
  v36 = a6;
  v27 = a7;
  v28 = a8;
  v29 = a9;
  v30 = a10;
  *(_QWORD *)&v33 = a11;
  *((_QWORD *)&v33 + 1) = a12;
  v31 = (_TtC10FitnessApp35TrophyCaseAwardDetailViewController *)sub_1005A7AB0(v35, v25, v26, v37, v27, v28, v29, v30, v33, a13, a14, a15, a16, a17, a18, 0, ObjectType, v24, v34);
  _s10FitnessApp24HistoryViewActionContextVwxx_0(v40);

  swift_deallocPartialClassInstance(self, ObjectType, 232, 7);
  return v31;
}

- (_TtC10FitnessApp35TrophyCaseAwardDetailViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005A7E00();
}

- (void)dealloc
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC10FitnessApp35TrophyCaseAwardDetailViewController *v8;
  objc_super v9;

  v3 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_achievementDataProvider);
  v4 = v3[3];
  v5 = v3[4];
  sub_100016804(v3, v4);
  v7 = sub_100028404((unint64_t *)&unk_10082E590, v6, (uint64_t (*)(uint64_t))type metadata accessor for TrophyCaseAwardDetailViewController, (uint64_t)&unk_100648314);
  v8 = self;
  dispatch thunk of AAUIAwardsDataProviding.remove(observer:)(v8, v7, v4, v5);

  v9.receiver = v8;
  v9.super_class = (Class)type metadata accessor for TrophyCaseAwardDetailViewController();
  -[TrophyCaseAwardDetailViewController dealloc](&v9, "dealloc");
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

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_achievement));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_healthStore));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.super.super.super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_achievementDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_badgeImageFactory));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_resourceProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_formattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_localizationProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_pauseRingsCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_fitnessAppContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_workoutFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_workoutDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_celebrationVideoContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_badgeViewCell));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_associatedWorkout));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_avPlayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_avPlayerLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_sharingImage));
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)&self->achievement[OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_sharingText], v3, v4, v5, v6, v7, v8, v9);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_badgeView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_friendListManager));
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_friendsWithAchievement), v10, v11, v12, v13, v14, v15, v16);
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TrophyCaseAwardDetailViewController();
  v2 = v3.receiver;
  -[TrophyCaseAwardDetailViewController viewDidLoad](&v3, "viewDidLoad");
  sub_1005A41C4();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC10FitnessApp35TrophyCaseAwardDetailViewController *v4;

  v4 = self;
  sub_1005A4858(a3);

}

- (void)viewWillLayoutSubviews
{
  _TtC10FitnessApp35TrophyCaseAwardDetailViewController *v2;

  v2 = self;
  sub_1005A4930();

}

- (void)viewDidLayoutSubviews
{
  char *v2;
  void *v3;
  void *v4;
  char *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TrophyCaseAwardDetailViewController();
  v2 = (char *)v6.receiver;
  -[TrophyCaseAwardDetailViewController viewDidLayoutSubviews](&v6, "viewDidLayoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_avPlayerLayer];
  if (v3)
  {
    v4 = *(void **)&v2[OBJC_IVAR____TtC10FitnessApp35TrophyCaseAwardDetailViewController_celebrationVideoContainer];
    v5 = v3;
    objc_msgSend(v4, "bounds", v6.receiver, v6.super_class);
    objc_msgSend(v5, "setFrame:");

    v2 = v5;
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC10FitnessApp35TrophyCaseAwardDetailViewController *v4;

  v4 = self;
  sub_1005A4A8C(a3);

}

- (void)appWillResignActive:(id)a3
{
  id v4;
  _TtC10FitnessApp35TrophyCaseAwardDetailViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1005A7F78();

}

- (_TtC10FitnessApp35TrophyCaseAwardDetailViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC10FitnessApp35TrophyCaseAwardDetailViewController *result;

  v3 = a3;
  result = (_TtC10FitnessApp35TrophyCaseAwardDetailViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.TrophyCaseAwardDetailViewController", 46, "init(collectionViewLayout:)", 27, 0);
  __break(1u);
  return result;
}

- (_TtC10FitnessApp35TrophyCaseAwardDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10FitnessApp35TrophyCaseAwardDetailViewController *result;

  v4 = a4;
  result = (_TtC10FitnessApp35TrophyCaseAwardDetailViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.TrophyCaseAwardDetailViewController", 46, "init(nibName:bundle:)", 21, 0);
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
  _TtC10FitnessApp35TrophyCaseAwardDetailViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1005A8254(a4);

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp35TrophyCaseAwardDetailViewController *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_1005A6338(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CHWorkoutDetailHeartRateTableViewCell *v10;
  id v11;
  _TtC10FitnessApp35TrophyCaseAwardDetailViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (CHWorkoutDetailHeartRateTableViewCell *)((char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1005A8320(v10);

  (*(void (**)(CHWorkoutDetailHeartRateTableViewCell *, uint64_t))(v8 + 8))(v10, v7);
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
  _TtC10FitnessApp35TrophyCaseAwardDetailViewController *v17;
  void *v18;
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
  v18 = (void *)sub_1005A89C8(v16, v13, v15);

  swift_bridgeObjectRelease(v15, v19, v20, v21, v22, v23, v24, v25);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v18;
}

- (CGRect)badgeFrame
{
  _TtC10FitnessApp35TrophyCaseAwardDetailViewController *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  v2 = self;
  v3 = sub_1005A6AA8();
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)placeBadgeViewInContainer
{
  _TtC10FitnessApp35TrophyCaseAwardDetailViewController *v2;

  v2 = self;
  sub_1005A6C00();

}

- (void)doneTapped:(id)a3
{
  -[TrophyCaseAwardDetailViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)shareTapped:(id)a3
{
  id v4;
  _TtC10FitnessApp35TrophyCaseAwardDetailViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1005A8B34();

}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  _QWORD v4[2];

  v4[0] = 0;
  v4[1] = 0xE000000000000000;
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(v4, &type metadata for String, a3);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return 0;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  id v4;
  _TtC10FitnessApp35TrophyCaseAwardDetailViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1005A8DCC();

  return v6;
}

- (void)playerFinished:(id)a3
{
  id v4;
  _TtC10FitnessApp35TrophyCaseAwardDetailViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1005A8F54();

}

@end
