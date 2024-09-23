@implementation ActivityDashboardViewController

- (void)presentAppSettingsShowingPane:(int64_t)a3
{
  _TtC10FitnessApp31ActivityDashboardViewController *v4;

  v4 = self;
  sub_1003128E0(a3);

}

- (id)showTodayAndShareImmediately:(BOOL)a3 animated:(BOOL)a4 forGoalCompleteNotification:(BOOL)a5 goalRecommendation:(id)a6
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v11;
  id v12;
  _TtC10FitnessApp31ActivityDashboardViewController *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;

  v8 = a4;
  v9 = a3;
  v11 = objc_allocWithZone((Class)NSDate);
  v12 = a6;
  v13 = self;
  v14 = objc_msgSend(v11, "init");
  if (v12)
  {
    objc_msgSend(v12, "doubleValue");
    v16 = v15;
  }
  else
  {
    v16 = 0;
  }
  v17 = sub_100312B88(v14, v9, v8, a5, v16, v12 == 0, 0);

  return v17;
}

- (id)showTodayAndShareImmediately:(BOOL)a3 animated:(BOOL)a4 forGoalCompleteNotification:(BOOL)a5 goalRecommendation:(id)a6 withPauseRingsEditing:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v10;
  _BOOL4 v11;
  id v13;
  id v14;
  _TtC10FitnessApp31ActivityDashboardViewController *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;

  v7 = a7;
  v10 = a4;
  v11 = a3;
  v13 = objc_allocWithZone((Class)NSDate);
  v14 = a6;
  v15 = self;
  v16 = objc_msgSend(v13, "init");
  if (v14)
  {
    objc_msgSend(v14, "doubleValue");
    v18 = v17;
  }
  else
  {
    v18 = 0;
  }
  v19 = sub_100312B88(v16, v11, v10, a5, v18, v14 == 0, v7);

  return v19;
}

- (id)showActivityOnDate:(id)a3 shareImmediately:(BOOL)a4 animated:(BOOL)a5 forGoalCompleteNotification:(BOOL)a6 goalRecommendation:(id)a7
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v12;
  id v13;
  _TtC10FitnessApp31ActivityDashboardViewController *v14;
  uint64_t v15;
  uint64_t v16;
  _TtC10FitnessApp31ActivityDashboardViewController *v17;
  char *v18;

  v9 = a5;
  v10 = a4;
  v12 = a3;
  if (a7)
  {
    v13 = a7;
    v14 = self;
    objc_msgSend(v13, "doubleValue");
    v16 = v15;
  }
  else
  {
    v17 = self;
    v16 = 0;
  }
  v18 = sub_100312B88(v12, v10, v9, a6, v16, a7 == 0, 0);

  return v18;
}

- (id)showActivityOnDate:(id)a3 shareImmediately:(BOOL)a4 animated:(BOOL)a5 forGoalCompleteNotification:(BOOL)a6 goalRecommendation:(id)a7 withPauseRingsEditing:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v11;
  _BOOL4 v12;
  id v14;
  id v15;
  _TtC10FitnessApp31ActivityDashboardViewController *v16;
  uint64_t v17;
  uint64_t v18;
  _TtC10FitnessApp31ActivityDashboardViewController *v19;
  char *v20;

  v8 = a8;
  v11 = a5;
  v12 = a4;
  v14 = a3;
  if (a7)
  {
    v15 = a7;
    v16 = self;
    objc_msgSend(v15, "doubleValue");
    v18 = v17;
  }
  else
  {
    v19 = self;
    v18 = 0;
  }
  v20 = sub_100312B88(v14, v12, v11, a6, v18, a7 == 0, v8);

  return v20;
}

- (id)navigateToTrophyCaseAnimated:(BOOL)a3 initialAchievement:(id)a4 shouldShowCelebration:(BOOL)a5 forModalPresentation:(BOOL)a6
{
  id v11;
  _TtC10FitnessApp31ActivityDashboardViewController *v12;
  char *v13;

  v11 = a4;
  v12 = self;
  v13 = sub_100314118(a3, a4, a5, a6);

  return v13;
}

- (void)navigateToTrophyCaseSection:(id)a3 withAchievementID:(id)a4 animated:(BOOL)a5
{
  uint64_t v7;
  CHWorkoutDetailHeartRateTableViewCell *v8;
  CHWorkoutDetailHeartRateTableViewCell *v9;
  uint64_t v10;
  void *v11;
  _TtC10FitnessApp31ActivityDashboardViewController *v12;
  SEL v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  SEL v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  if (a4)
  {
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v11;
  }
  else
  {
    v10 = 0;
  }
  v12 = self;
  sub_10031BE28(v7, (unint64_t)v9, v10, (uint64_t)a4);

  swift_bridgeObjectRelease(v9, v13, v14, v15, v16, v17, v18, v19);
  swift_bridgeObjectRelease((CHWorkoutDetailHeartRateTableViewCell *)a4, v20, v21, v22, v23, v24, v25, v26);
}

- (void)navigateToHistoryAnimated:(BOOL)a3
{
  _TtC10FitnessApp31ActivityDashboardViewController *v4;

  v4 = self;
  sub_10031448C(a3);

}

- (void)navigateToWorkoutHistoryWithActivityType:(id)a3 animated:(BOOL)a4
{
  id v7;
  _TtC10FitnessApp31ActivityDashboardViewController *v8;

  v7 = a3;
  v8 = self;
  sub_100314EDC(a3, a4);

}

- (void)showWorkoutWithId:(id)a3 activityId:(id)a4 page:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _TtC10FitnessApp31ActivityDashboardViewController *v19;
  SEL v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;

  v9 = sub_100047110((uint64_t *)&unk_10082E690);
  __chkstk_darwin(v9);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for UUID(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v16 = 0;
  }
  else
  {
    v16 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, v16, 1, v12);
  if (a5)
  {
    v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    a5 = v18;
  }
  else
  {
    v17 = 0;
  }
  v19 = self;
  sub_100315244((uint64_t)v15, (uint64_t)v11, v17, (uint64_t)a5);

  swift_bridgeObjectRelease((CHWorkoutDetailHeartRateTableViewCell *)a5, v20, v21, v22, v23, v24, v25, v26);
  sub_10001BE90((uint64_t)v11, (uint64_t *)&unk_10082E690);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

- (void)navigateToMindfulnessHistoryAnimated:(BOOL)a3
{
  _TtC10FitnessApp31ActivityDashboardViewController *v4;

  v4 = self;
  sub_100315D58(a3);

}

- (void)showMindfulnessSessionWithUUID:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC10FitnessApp31ActivityDashboardViewController *v9;
  uint64_t v10;

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100315FF4((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)showAllTrendsAnimated:(BOOL)a3
{
  _TtC10FitnessApp31ActivityDashboardViewController *v4;

  v4 = self;
  sub_100317D48(a3);

}

- (void)showTrendWithIdentifier:(int64_t)a3 animated:(BOOL)a4
{
  _TtC10FitnessApp31ActivityDashboardViewController *v6;

  v6 = self;
  sub_100318234(a3, a4);

}

- (void)showLoad
{
  void *v3;
  id v4;
  _TtC10FitnessApp31ActivityDashboardViewController *v5;
  _TtC10FitnessApp31ActivityDashboardViewController *v6;
  _TtC10FitnessApp31ActivityDashboardViewController *v7;
  char *v8;

  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_context);
  v4 = objc_allocWithZone((Class)type metadata accessor for LoadDetailViewController(0));
  v5 = self;
  v8 = sub_1003B85C0(v3);
  v6 = (_TtC10FitnessApp31ActivityDashboardViewController *)-[ActivityDashboardViewController navigationController](v5, "navigationController");
  if (v6)
  {
    v7 = v6;
    -[ActivityDashboardViewController pushViewController:animated:](v6, "pushViewController:animated:", v8, 1);

    v5 = v7;
  }

}

- (void)showSummaryCardWithIdentifier:(int64_t)a3
{
  _TtC10FitnessApp31ActivityDashboardViewController *v4;

  v4 = self;
  sub_1003189C0(a3);

}

- (void)presentWorkoutConfigurationWithData:(id)a3
{
  id v5;
  _TtC10FitnessApp31ActivityDashboardViewController *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  Class isa;
  void *v12;
  _QWORD v13[6];

  v5 = a3;
  v6 = self;
  v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;

  v10 = objc_msgSend((id)objc_opt_self(WorkoutKitXPCServiceHelper), "sharedInstance");
  isa = Data._bridgeToObjectiveC()().super.isa;
  v13[4] = sub_1002125A4;
  v13[5] = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_1000064EC;
  v13[3] = &unk_1007961D0;
  v12 = _Block_copy(v13);
  objc_msgSend(v10, "presentWorkoutConfigurationData:completion:", isa, v12);
  _Block_release(v12);

  sub_10004D9E4(v7, v9);
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10;
  id v11;
  id v12;
  _TtC10FitnessApp31ActivityDashboardViewController *v13;
  void *v14;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = self;
  v14 = sub_10031C1A8((void *)a4, v11, v12);

  return v14;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC10FitnessApp31ActivityDashboardViewController *v13;
  id v14;
  uint64_t v16;

  v8 = type metadata accessor for IndexPath(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = a3;
  v13 = self;
  v14 = sub_100320F04((uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v14;
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  _TtC10FitnessApp31ActivityDashboardViewController *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100321210(v6, v7);

  return v9;
}

- (_TtC10FitnessApp18SummaryCoordinator)summaryCoordinator
{
  return (_TtC10FitnessApp18SummaryCoordinator *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                         + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_summaryCoordinator));
}

- (_TtP10FitnessApp32TrophyCaseViewControllerDelegate_)trophyCaseViewControllerDelegate
{
  return (_TtP10FitnessApp32TrophyCaseViewControllerDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_trophyCaseViewControllerDelegate);
}

- (void)setTrophyCaseViewControllerDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_trophyCaseViewControllerDelegate, a3);
}

- (_TtP10FitnessApp35HistoryPagingViewControllerDelegate_)historyPagingViewControllerDelegate
{
  return (_TtP10FitnessApp35HistoryPagingViewControllerDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_historyPagingViewControllerDelegate);
}

- (void)setHistoryPagingViewControllerDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_historyPagingViewControllerDelegate, a3);
}

- (_TtC10FitnessApp31ActivityDashboardViewController)initWithCollectionViewLayout:(id)a3 context:(id)a4
{
  return (_TtC10FitnessApp31ActivityDashboardViewController *)sub_1003DBDA0(a3, a4);
}

- (_TtC10FitnessApp31ActivityDashboardViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003E7808();
}

- (void)viewDidLoad
{
  _TtC10FitnessApp31ActivityDashboardViewController *v2;

  v2 = self;
  sub_1003DC814();

}

- (void)dealloc
{
  _TtC10FitnessApp31ActivityDashboardViewController *v2;

  v2 = self;
  sub_1003DCC2C();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  SEL v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  SEL v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  SEL v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_summaryCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_marketingBannerPresenter));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_summaryBannerActionPresenter));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_loadingCardHeightProvider));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_impressionsTracker));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_achievementTransitionAnimator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_marketingBannerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_transitionAnimatorFromViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_dataSource));
  sub_1000F61B4((uint64_t)self + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_trophyCaseViewControllerDelegate);
  sub_1000F61B4((uint64_t)self + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_historyPagingViewControllerDelegate);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_dashboardCardCellViewCache));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_context));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_addButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_doneButton));
  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_editButtonIdentifier;
  v4 = type metadata accessor for UUID(0);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_entryLinksButtonIdentifier, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_accountButton));
  sub_100011F54((uint64_t)self + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_customizeSummaryTip, type metadata accessor for CustomizeSummaryTip);
  sub_100011F54((uint64_t)self + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_trainingLoadTip, type metadata accessor for TrainingLoadTrackingTip);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)&self->summaryCoordinator[OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_dashboardTipReuseIdentifier], v6, v7, v8, v9, v10, v11, v12);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_observers), v13, v14, v15, v16, v17, v18, v19);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_keyValueObservers), v20, v21, v22, v23, v24, v25, v26);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController_resignActiveObserver));
  sub_100022BA4(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController____lazy_storage___onDismissAddCardModal), *(_QWORD *)&self->summaryCoordinator[OBJC_IVAR____TtC10FitnessApp31ActivityDashboardViewController____lazy_storage___onDismissAddCardModal]);
}

- (void)textSizeChanged:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC10FitnessApp31ActivityDashboardViewController *v10;
  uint64_t v11;

  v5 = sub_100047110((uint64_t *)&unk_100832590);
  __chkstk_darwin(v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = type metadata accessor for Notification(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = type metadata accessor for Notification(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_1003DE368();

  sub_10001BE90((uint64_t)v7, (uint64_t *)&unk_100832590);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  id v8;
  void *v9;
  id v10;
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ActivityDashboardViewController(0);
  swift_unknownObjectRetain(a4);
  v7 = v11.receiver;
  -[ActivityDashboardViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v8 = objc_msgSend(v7, "collectionView", v11.receiver, v11.super_class);
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend(v8, "collectionViewLayout");

    objc_msgSend(v10, "invalidateLayout");
    swift_unknownObjectRelease(a4);
  }
  else
  {
    __break(1u);
  }
}

- (void)accountButtonTapped:(id)a3
{
  -[ActivityDashboardViewController presentAppSettingsShowingPane:](self, "presentAppSettingsShowingPane:", 0);
}

- (void)editButtonTapped
{
  _TtC10FitnessApp31ActivityDashboardViewController *v2;

  v2 = self;
  sub_1003DF038();

}

- (void)entryLinksButtonTapped
{
  _TtC10FitnessApp31ActivityDashboardViewController *v2;

  v2 = self;
  sub_1003DF46C();

}

- (void)didTapDone
{
  _TtC10FitnessApp31ActivityDashboardViewController *v2;

  v2 = self;
  sub_1003DF6F8();

}

- (void)didTapAddCard
{
  _TtC10FitnessApp31ActivityDashboardViewController *v2;

  v2 = self;
  sub_1003DFA3C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC10FitnessApp31ActivityDashboardViewController *v4;

  v4 = self;
  sub_1003E022C(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC10FitnessApp31ActivityDashboardViewController *v4;

  v4 = self;
  sub_1003E0324(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC10FitnessApp31ActivityDashboardViewController *v4;

  v4 = self;
  sub_1003E093C(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC10FitnessApp31ActivityDashboardViewController *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for ActivityDashboardViewController(0);
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  -[ActivityDashboardViewController viewDidDisappear:](&v9, "viewDidDisappear:", v3);
  v7 = sub_1000083D8(&qword_100832508, type metadata accessor for ActivityDashboardViewController, (uint64_t)&unk_10063B3D0);
  v8 = sub_1000083D8((unint64_t *)&unk_100832510, type metadata accessor for ActivityDashboardViewController, (uint64_t)&unk_10063B360);
  MetricResignActiveObserving<>.removeResignActiveObserver()(v5, v7, v8);

}

- (void)scrollToTop
{
  _TtC10FitnessApp31ActivityDashboardViewController *v2;

  v2 = self;
  sub_1003E29AC();

}

- (void)scrollToBottom
{
  _TtC10FitnessApp31ActivityDashboardViewController *v2;

  v2 = self;
  sub_1003E2B74();

}

- (_TtC10FitnessApp31ActivityDashboardViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC10FitnessApp31ActivityDashboardViewController *result;

  v3 = a3;
  result = (_TtC10FitnessApp31ActivityDashboardViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.ActivityDashboardViewController", 42, "init(collectionViewLayout:)", 27, 0);
  __break(1u);
  return result;
}

- (_TtC10FitnessApp31ActivityDashboardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10FitnessApp31ActivityDashboardViewController *result;

  v4 = a4;
  result = (_TtC10FitnessApp31ActivityDashboardViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.ActivityDashboardViewController", 42, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  _TtC10FitnessApp31ActivityDashboardViewController *v22;
  uint64_t v23;
  uint64_t (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  char *v28;
  Class isa;
  uint64_t v31;
  id v32;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v11);
  v16 = (char *)&v31 - v15;
  v17 = __chkstk_darwin(v14);
  v19 = (char *)&v31 - v18;
  __chkstk_darwin(v17);
  v21 = (char *)&v31 - v20;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v32 = a3;
  v22 = self;
  v23 = IndexPath.section.getter();
  v24 = *(uint64_t (**)(char *, char *, uint64_t))(v10 + 16);
  v25 = v24(v13, v16, v9);
  if (v23 != 1)
  {
    v27 = *(void (**)(char *, uint64_t))(v10 + 8);
    v27(v13, v9);
LABEL_5:
    v28 = v19;
    goto LABEL_6;
  }
  v26 = IndexPath.item.getter(v25);
  v27 = *(void (**)(char *, uint64_t))(v10 + 8);
  v27(v13, v9);
  v28 = v16;
  if (!v26)
    goto LABEL_5;
LABEL_6:
  v24(v21, v28, v9);

  v27(v16, v9);
  v27(v19, v9);
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v27(v21, v9);
  return isa;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  _TtC10FitnessApp31ActivityDashboardViewController *v18;
  uint64_t v19;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = type metadata accessor for ActivityDashboardCardCell();
  v14 = swift_dynamicCastClass(a4, v13);
  if (v14)
  {
    v15 = v14;
    v16 = a3;
    v17 = a4;
    v18 = self;
    sub_10044930C(v15, (uint64_t)v12, v16);

  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  id v15;
  _TtC10FitnessApp31ActivityDashboardViewController *v16;
  uint64_t v17;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = type metadata accessor for ActivityDashboardCardCell();
  if (swift_dynamicCastClass(a4, v13))
  {
    v14 = a3;
    v15 = a4;
    v16 = self;
    sub_100449894((uint64_t)v12);

  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC10FitnessApp31ActivityDashboardViewController *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;

  v4 = a3;
  v5 = self;
  objc_msgSend(v4, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = sub_100030B80();
  ImpressionsCalculator.viewBounds.setter(v7, v9, v11, v13);

  swift_release(v14);
}

@end
