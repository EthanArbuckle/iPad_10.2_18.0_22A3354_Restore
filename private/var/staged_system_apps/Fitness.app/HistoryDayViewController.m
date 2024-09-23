@implementation HistoryDayViewController

- (BOOL)beginContentAccess
{
  return 1;
}

- (BOOL)isContentDiscarded
{
  return 0;
}

- (void)dealloc
{
  _TtC10FitnessApp24HistoryDayViewController *v2;

  v2 = self;
  sub_100477814();
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
  SEL v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  SEL v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  SEL v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;

  sub_1000F61B4((uint64_t)self + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_activitySummary));
  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_date;
  v4 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_dataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_pauseRingsCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_mindfulnessSessionDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_workoutFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_workoutDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_mindfulnessSessionFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_fiuiFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_badgeImageFactory));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_friendListManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_achievementResourceProvider));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.super.super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_awardsDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_achievementLocalizationProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_fitnessAppContext));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.super.super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_appRecommendationDataProvider));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.super.super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_walkSuggestionDataProvider));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.super.super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_seymourRecommendationDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_ringCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_moveCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_exerciseCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_standCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_stepsAndDistanceCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_flightsCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_ringsConfigurationCell));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_protectedAppsSubscription));
  sub_1000F996C((uint64_t)self + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_fontListener);
  sub_1000F996C((uint64_t)self + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_dateChangeListener);
  sub_1000F996C((uint64_t)self + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_mindfulnessSessionsListener);
  sub_1000F996C((uint64_t)self + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_awardsListener);
  sub_1000F996C((uint64_t)self + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_awardsUpdateListener);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_awardsQuery));
  sub_1000F996C((uint64_t)self + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_wheelchairListener);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_workouts), v5, v6, v7, v8, v9, v10, v11);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_mindfulnessSessionViewModels), v12, v13, v14, v15, v16, v17, v18);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_awards), v19, v20, v21, v22, v23, v24, v25);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_addToYourRingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_chartData));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_totalEnergy));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_sharingImage));
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)&self->delegate[OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_sharingText], v26, v27, v28, v29, v30, v31, v32);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_awardsTransitionAnimator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_fromVC));
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4;
  char *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HistoryDayViewController(0);
  v4 = a3;
  v5 = (char *)v6.receiver;
  -[HistoryDayViewController willMoveToParentViewController:](&v6, "willMoveToParentViewController:", v4);
  objc_msgSend(*(id *)&v5[OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_tableView], "_scrollToTopHidingTableHeader:", 0, v6.receiver, v6.super_class);

}

- (_TtC10FitnessApp24HistoryDayViewController)initWithCoder:(id)a3
{
  sub_100478124(a3);
  return 0;
}

- (void)viewDidLoad
{
  _TtC10FitnessApp24HistoryDayViewController *v2;

  v2 = self;
  sub_1004784F4();

}

- (void)viewWillLayoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for HistoryDayViewController(0);
  v2 = (char *)v14.receiver;
  -[HistoryDayViewController viewWillLayoutSubviews](&v14, "viewWillLayoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_tableView];
  v4 = objc_msgSend(v2, "view", v14.receiver, v14.super_class);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    objc_msgSend(v3, "setFrame:", v7, v9, v11, v13);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC10FitnessApp24HistoryDayViewController *v4;

  v4 = self;
  sub_10047A2EC(a3);

}

- (void)share
{
  _TtC10FitnessApp24HistoryDayViewController *v2;

  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_activitySummary))
  {
    v2 = self;
    sub_10047C518();

  }
  else
  {
    *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp24HistoryDayViewController_shareWhenDataLoads) = 1;
  }
}

- (_TtC10FitnessApp24HistoryDayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10FitnessApp24HistoryDayViewController *result;

  v4 = a4;
  result = (_TtC10FitnessApp24HistoryDayViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.HistoryDayViewController", 35, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
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
  _TtC10FitnessApp24HistoryDayViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_10047D7F4();

  return v6;
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10;
  id v11;
  id v12;
  _TtC10FitnessApp24HistoryDayViewController *v13;
  void *v14;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = self;
  v14 = sub_10047D97C((void *)a4, v11, v12);

  return v14;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  return 1;
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  _TtC10FitnessApp24HistoryDayViewController *v6;

  swift_unknownObjectRetain(a4);
  v6 = self;
  sub_10047E310();
  swift_unknownObjectRelease(a4);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 11;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC10FitnessApp24HistoryDayViewController *v7;
  int64_t v8;
  int64_t v9;

  v6 = a3;
  v7 = self;
  sub_1005DCD60(a4);
  v9 = v8;

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp24HistoryDayViewController *v12;
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
  sub_1005DA78C(v11);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC10FitnessApp24HistoryDayViewController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1005DBE5C(v6, a4);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC10FitnessApp24HistoryDayViewController *v7;
  double v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1005DD054(a4);

  return v8;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC10FitnessApp24HistoryDayViewController *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_1005DD1B8((uint64_t)v14);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp24HistoryDayViewController *v12;
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
  if ((v13 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  if (v13 >= 0xB)
  {
LABEL_5:
    __break(1u);
    return v13;
  }
  v14 = *((unsigned __int8 *)&off_10077F660 + v13 + 32);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  LOBYTE(v13) = (v14 - 7) < 3;
  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp24HistoryDayViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1005DC64C((uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end
