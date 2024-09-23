@implementation ActivityTileViewController

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC10FitnessApp26ActivityTileViewController *v5;
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

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC10FitnessApp26ActivityTileViewController *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_100021F0C(v14, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (CHAwardsDataProvider)awardsDataProviderWrapper
{
  objc_class *v3;
  id v4;
  _TtC10FitnessApp26ActivityTileViewController *v5;
  _TtC10FitnessApp26ActivityTileViewController *v6;
  objc_super v8;
  _QWORD v9[5];

  sub_1000252E0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_awardsDataProvider, (uint64_t)v9);
  v3 = (objc_class *)type metadata accessor for CHAwardsDataProvider();
  v4 = objc_allocWithZone(v3);
  sub_1000252E0((uint64_t)v9, (uint64_t)v4 + OBJC_IVAR___CHAwardsDataProvider_awardsDataProvider);
  v8.receiver = v4;
  v8.super_class = v3;
  v5 = self;
  v6 = -[ActivityTileViewController init](&v8, "init");
  _s10FitnessApp24HistoryViewActionContextVwxx_0(v9);

  return (CHAwardsDataProvider *)v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp26ActivityTileViewController *v12;
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
  sub_1000284FC((uint64_t)v11);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC10FitnessApp26ActivityTileViewController *v15;
  uint64_t v16;

  v9 = type metadata accessor for IndexPath(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_10002FF1C(v13, v14, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC10FitnessApp26ActivityTileViewController *v7;
  double v8;

  v6 = a3;
  v7 = self;
  if ((uint64_t)objc_msgSend(v6, "numberOfRowsInSection:", a4) <= 0)
    v8 = 0.0;
  else
    v8 = UITableViewAutomaticDimension;

  return v8;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC10FitnessApp26ActivityTileViewController *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  v8 = (void *)sub_100034470(v6, a4);

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC10FitnessApp26ActivityTileViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_100035820(a4);

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 6;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_delegate, a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC10FitnessApp26ActivityTileViewController *v4;

  v4 = self;
  sub_10000C8D0(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC10FitnessApp26ActivityTileViewController *v4;

  v4 = self;
  sub_100014E00(a3);

}

- (void)viewDidLoad
{
  _TtC10FitnessApp26ActivityTileViewController *v2;

  v2 = self;
  sub_100027084();

}

- (_TtP10FitnessApp34ActivityTileViewControllerDelegate_)delegate
{
  return (_TtP10FitnessApp34ActivityTileViewControllerDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_delegate);
}

- (_TtC10FitnessApp26ActivityTileViewController)initWithHealthStore:(id)a3 fitnessAppContext:(id)a4 activityDataProvider:(id)a5 pauseRingsCoordinator:(id)a6 historyDataProvider:(id)a7 achievementsDataProvider:(id)a8 achievementLocalizationProvider:(id)a9 fiuiModel:(id)a10 badgeImageFactory:(id)a11 friendListManager:(id)a12 fiuiFormattingManager:(id)a13 workoutFormattingManager:(id)a14 activityDateCache:(id)a15 trendsAvailabilityManager:(id)a16 wheelchairUseCache:(id)a17
{
  return (_TtC10FitnessApp26ActivityTileViewController *)sub_10020DE20(a3, a4, a5, a6, (char *)a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17);
}

- (void)dealloc
{
  _TtC10FitnessApp26ActivityTileViewController *v2;

  v2 = self;
  sub_10020EB34();
}

- (void).cxx_destruct
{
  sub_1000F61B4((uint64_t)self + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_fitnessAppContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_activityDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_pauseRingsCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_workoutDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_historyDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_mindfulnessSessionDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_fiuiModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_fiuiFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_workoutFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_mindfulnessSessionFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_stackFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_activityDateCache));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_trendsAvailabilityManager));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_impressionsTracker));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.super.super.super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_awardsDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_achievementsDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_achievementResourceProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_badgeImageFactory));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.super.super.super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_trophyCasePrefetcher));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_marketingBannerPresenter));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.super.super.super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_avatarSettingsProvider));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_dependencies));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_eventHub));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_subscriptionToken));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_summaryBannerActionPresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_trendsDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_trendsFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_wheelchairUseCache));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_achievementLocalizationProvider));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_activityTileViewDataModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_friendListManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_achievementTransitionAnimator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_transitionAnimatorFromViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_marketingBannerViewController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_observers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_keyValueObservers));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_resignActiveObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_accountButton));
}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC10FitnessApp26ActivityTileViewController *v4;

  v4 = self;
  sub_10020FB84(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC10FitnessApp26ActivityTileViewController *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for ActivityTileViewController();
  v11.receiver = self;
  v11.super_class = v5;
  v6 = self;
  -[ActivityTileViewController viewDidDisappear:](&v11, "viewDidDisappear:", v3);
  v8 = sub_100028404(&qword_100828430, v7, (uint64_t (*)(uint64_t))type metadata accessor for ActivityTileViewController, (uint64_t)&unk_10062E4E8);
  v10 = sub_100028404(&qword_100828438, v9, (uint64_t (*)(uint64_t))type metadata accessor for ActivityTileViewController, (uint64_t)&unk_10062E478);
  MetricResignActiveObserving<>.removeResignActiveObserver()(v5, v8, v10);

}

- (void)scrollToTop
{
  _TtC10FitnessApp26ActivityTileViewController *v2;

  v2 = self;
  sub_10020FDE4();

}

- (_TtC10FitnessApp26ActivityTileViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002177D0();
}

- (_TtC10FitnessApp26ActivityTileViewController)initWithStyle:(int64_t)a3
{
  _TtC10FitnessApp26ActivityTileViewController *result;

  result = (_TtC10FitnessApp26ActivityTileViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.ActivityTileViewController", 37, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (_TtC10FitnessApp26ActivityTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;

  v4 = a4;
  _swift_stdlib_reportUnimplementedInitializer("FitnessApp.ActivityTileViewController", 37, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  JUMPOUT(0x10020FFF4);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp26ActivityTileViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100217978((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)accountButtonTapped:(id)a3
{
  -[ActivityTileViewController presentAppSettingsShowingPane:](self, "presentAppSettingsShowingPane:", 0);
}

- (void)presentAppSettingsShowingPane:(int64_t)a3
{
  _TtC10FitnessApp26ActivityTileViewController *v4;

  v4 = self;
  sub_100212330(a3);

}

- (void)presentWorkoutConfigurationWithData:(id)a3
{
  id v5;
  _TtC10FitnessApp26ActivityTileViewController *v6;
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
  v13[3] = &unk_10078F2F8;
  v12 = _Block_copy(v13);
  objc_msgSend(v10, "presentWorkoutConfigurationData:completion:", isa, v12);
  _Block_release(v12);

  sub_10004D9E4(v7, v9);
}

- (id)showTodayAndShareImmediately:(BOOL)a3 animated:(BOOL)a4 forGoalCompleteNotification:(BOOL)a5 goalRecommendation:(id)a6
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v11;
  id v12;
  _TtC10FitnessApp26ActivityTileViewController *v13;
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
  v17 = sub_100212924(v14, v9, v8, a5, v16, v12 == 0);

  return v17;
}

- (id)showActivityOnDate:(id)a3 shareImmediately:(BOOL)a4 animated:(BOOL)a5 forGoalCompleteNotification:(BOOL)a6 goalRecommendation:(id)a7
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v12;
  id v13;
  _TtC10FitnessApp26ActivityTileViewController *v14;
  uint64_t v15;
  uint64_t v16;
  _TtC10FitnessApp26ActivityTileViewController *v17;
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
  v18 = sub_100212924(v12, v10, v9, a6, v16, a7 == 0);

  return v18;
}

- (void)navigateToWorkoutHistoryWithActivityType:(id)a3 animated:(BOOL)a4
{
  id v7;
  _TtC10FitnessApp26ActivityTileViewController *v8;

  v7 = a3;
  v8 = self;
  sub_1002140F0(a3, a4);

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
  _TtC10FitnessApp26ActivityTileViewController *v19;
  uint64_t v20;

  v9 = sub_100047110((uint64_t *)&unk_10082E690);
  __chkstk_darwin(v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for UUID(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  sub_100214448((uint64_t)v15, (uint64_t)v11, v17, (uint64_t)a5);

  swift_bridgeObjectRelease(a5);
  sub_10001BE90((uint64_t)v11, (uint64_t *)&unk_10082E690);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

- (void)showMindfulnessSessionWithUUID:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC10FitnessApp26ActivityTileViewController *v9;
  uint64_t v10;

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100214F54((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)navigateToHistoryAnimated:(BOOL)a3
{
  _TtC10FitnessApp26ActivityTileViewController *v4;

  v4 = self;
  sub_1002157FC(a3);

}

- (void)navigateToMindfulnessHistoryAnimated:(BOOL)a3
{
  _TtC10FitnessApp26ActivityTileViewController *v4;

  v4 = self;
  sub_100215A80(a3);

}

- (void)showAllTrendsAnimated:(BOOL)a3
{
  _TtC10FitnessApp26ActivityTileViewController *v4;

  v4 = self;
  sub_100215D10(a3);

}

- (void)showTrendWithIdentifier:(int64_t)a3 animated:(BOOL)a4
{
  _TtC10FitnessApp26ActivityTileViewController *v6;

  v6 = self;
  sub_100215F00(a3, a4);

}

- (id)navigateToTrophyCaseAnimated:(BOOL)a3 initialAchievement:(id)a4 shouldShowCelebration:(BOOL)a5 forModalPresentation:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v9;
  id v11;
  _TtC10FitnessApp26ActivityTileViewController *v12;
  char *v13;

  v6 = a6;
  v7 = a5;
  v9 = a3;
  v11 = a4;
  v12 = self;
  v13 = sub_100216190(v9, a4, v7, v6);

  return v13;
}

- (void)navigateToTrophyCaseSection:(id)a3 withAchievementID:(id)a4 animated:(BOOL)a5
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  _TtC10FitnessApp26ActivityTileViewController *v12;

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
  sub_100217AAC(v7, v9, v10, (uint64_t)a4);

  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(a4);
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10;
  id v11;
  id v12;
  _TtC10FitnessApp26ActivityTileViewController *v13;
  void *v14;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = self;
  v14 = sub_100217E30((void *)a4, v11, v12);

  return v14;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  return 1;
}

- (void)ringCelebrationDidBegin
{
  uint64_t Strong;
  void *v4;
  _TtC10FitnessApp26ActivityTileViewController *v5;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_delegate);
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = self;
    objc_msgSend(v4, "celebrationDidBegin");

    swift_unknownObjectRelease(v4);
  }
}

- (void)trophyCaseDidBeginCelebration:(id)a3
{
  uint64_t Strong;
  void *v6;
  id v7;
  _TtC10FitnessApp26ActivityTileViewController *v8;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC10FitnessApp26ActivityTileViewController_delegate);
  if (Strong)
  {
    v6 = (void *)Strong;
    v7 = a3;
    v8 = self;
    objc_msgSend(v6, "celebrationDidBegin");

    swift_unknownObjectRelease(v6);
  }
}

@end
