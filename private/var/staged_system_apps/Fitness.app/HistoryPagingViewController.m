@implementation HistoryPagingViewController

- (void)checkFlightsClimbedEnabled
{
  _TtC10FitnessApp27HistoryPagingViewController *v2;

  v2 = self;
  sub_100218E24();

}

- (void)dealloc
{
  _TtC10FitnessApp27HistoryPagingViewController *v2;

  v2 = self;
  sub_100219178();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1000F61B4((uint64_t)self + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_activityDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_activityDateCache));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_pauseRingsCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_mindfulnessSessionDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_badgeImageFactory));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_friendListManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_achievementResourceProvider));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.super.super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_awardsDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_workoutFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_workoutDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_mindfulnessSessionFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_fiuiFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_achievementLocalizationProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_fitnessAppContext));
  sub_10001BE90((uint64_t)self + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_deviceDateListener, (uint64_t *)&unk_100828420);
  sub_10001BE90((uint64_t)self + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_selectedDateListener, (uint64_t *)&unk_100828420);
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.super.super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_appStoreQuery));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.super.super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_recentWorkoutAppQuery));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.super.super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_appRecommendationDataProvider));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.super.super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_walkSuggestionDataProvider));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.super.super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_seymourWorkoutRecommendationDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_pageViewController));
  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_jan1_2014;
  v4 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (_TtC10FitnessApp27HistoryPagingViewController)initWithCoder:(id)a3
{
  sub_1002194E0(a3);
  return 0;
}

- (void)loadView
{
  _TtC10FitnessApp27HistoryPagingViewController *v2;

  v2 = self;
  sub_1002196F4();

}

- (void)viewDidLoad
{
  _TtC10FitnessApp27HistoryPagingViewController *v2;

  v2 = self;
  sub_100219A18();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for HistoryPagingViewController(0);
  v4 = v7.receiver;
  -[HistoryPagingViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  sub_100218E24();
  v5 = objc_msgSend(v4, "navigationController", v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "setDelegate:", v4);

    v4 = v6;
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC10FitnessApp27HistoryPagingViewController *v4;

  v4 = self;
  sub_10021A4A0(a3);

}

- (void)viewWillLayoutSubviews
{
  char *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for HistoryPagingViewController(0);
  v2 = (char *)v15.receiver;
  -[HistoryPagingViewController viewWillLayoutSubviews](&v15, "viewWillLayoutSubviews");
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_pageViewController], "view", v15.receiver, v15.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v2, "view");
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "bounds");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;

      objc_msgSend(v4, "setFrame:", v8, v10, v12, v14);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (void)showHistoryMonthView
{
  _TtC10FitnessApp27HistoryPagingViewController *v2;

  v2 = self;
  sub_10021AB94();

}

- (void)shareImmediatelyWithSender:(id)a3
{
  id v4;
  _TtC10FitnessApp27HistoryPagingViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10021CC90();

}

- (_TtC10FitnessApp27HistoryPagingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10FitnessApp27HistoryPagingViewController *result;

  v4 = a4;
  result = (_TtC10FitnessApp27HistoryPagingViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.HistoryPagingViewController", 38, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (int64_t)numberOfViewControllersForPageViewController:(id)a3
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_nPages);
}

- (id)pageViewController:(id)a3 viewControllerAtIndex:(int64_t)a4
{
  id v6;
  _TtC10FitnessApp27HistoryPagingViewController *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  v8 = (void *)sub_10021CD24(a4);

  return v8;
}

- (void)pageViewController:(id)a3 didUpdateCurrentlyDisplayedIndex:(int64_t)a4
{
  id v6;
  _TtC10FitnessApp27HistoryPagingViewController *v7;

  v6 = a3;
  v7 = self;
  sub_10021D3EC(a4);

}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  _TtC10FitnessApp27HistoryPagingViewController *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;

  v10 = *(Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC10FitnessApp27HistoryPagingViewController_pageViewController);
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = self;
  v15 = objc_msgSend(v10, "currentlyDisplayedViewController");
  v16 = type metadata accessor for HistoryDayViewController(0);
  v17 = (void *)swift_dynamicCastClass(v15, v16);
  if (v17)
    v18 = objc_msgSend(v17, "navigationController:animationControllerForOperation:fromViewController:toViewController:", v11, a4, v12, v13);
  else
    v18 = 0;

  return v18;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  return 1;
}

@end
