@implementation TrendDetailViewController

- (void)contentSizeCategoryDidChangeWithNote:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC10FitnessApp25TrendDetailViewController *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100268978();
  if ((v9->trendType[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_daysRingsClosed90] & 1) == 0
    && (v9->trendType[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_daysRingsClosed365] & 1) == 0
    && *(Class *)((char *)&v9->super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_ringClosureSummary))
  {
    sub_10022E908(*((_BYTE *)&v9->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_trendType), *(uint64_t *)((char *)&v9->super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_daysRingsClosed90), *(uint64_t *)((char *)&v9->super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_daysRingsClosed365), *((unsigned __int8 *)&v9->super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_isWheelchairUser));
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)loadView
{
  _TtC10FitnessApp25TrendDetailViewController *v2;

  v2 = self;
  sub_1002681A4();

}

- (void)viewDidLoad
{
  _TtC10FitnessApp25TrendDetailViewController *v2;

  v2 = self;
  sub_100268AF0();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC10FitnessApp25TrendDetailViewController *v4;

  v4 = self;
  sub_100268D60(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TrendDetailViewController();
  v4 = v7.receiver;
  -[TrendDetailViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  if (*((_BYTE *)v4 + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_direction) == 1)
  {

  }
  else
  {
    v5 = swift_allocObject(&unk_100791FC0, 24, 7);
    *(_QWORD *)(v5 + 16) = v4;
    v6 = v4;
    sub_100151A58((uint64_t)sub_1002692EC, v5, 0.1);

    swift_release(v5);
  }
}

- (_TtC10FitnessApp25TrendDetailViewController)initWithCoder:(id)a3
{
  sub_100268F6C(a3);
  return 0;
}

- (_TtC10FitnessApp25TrendDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10FitnessApp25TrendDetailViewController *result;

  v4 = a4;
  result = (_TtC10FitnessApp25TrendDetailViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.TrendDetailViewController", 36, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[12];
  unsigned __int8 v16;
  _OWORD v17[12];
  unsigned __int8 v18;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_valueQuantity));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_differenceQuantity));
  v3 = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics90 + 150];
  v15[10] = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics90 + 134];
  v15[11] = v3;
  v16 = self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics90 + 166];
  v4 = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics90 + 86];
  v15[6] = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics90 + 70];
  v15[7] = v4;
  v5 = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics90 + 118];
  v15[8] = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics90 + 102];
  v15[9] = v5;
  v6 = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics90 + 22];
  v15[2] = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics90 + 6];
  v15[3] = v6;
  v7 = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics90 + 54];
  v15[4] = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics90 + 38];
  v15[5] = v7;
  v8 = *(_OWORD *)&self->valueQuantity[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics90 + 6];
  v15[0] = *(_OWORD *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics90);
  v15[1] = v8;
  sub_100049DE4(v15);
  v9 = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics365 + 150];
  v17[10] = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics365 + 134];
  v17[11] = v9;
  v18 = self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics365 + 166];
  v10 = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics365 + 86];
  v17[6] = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics365 + 70];
  v17[7] = v10;
  v11 = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics365 + 118];
  v17[8] = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics365 + 102];
  v17[9] = v11;
  v12 = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics365 + 22];
  v17[2] = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics365 + 6];
  v17[3] = v12;
  v13 = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics365 + 54];
  v17[4] = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics365 + 38];
  v17[5] = v13;
  v14 = *(_OWORD *)&self->valueQuantity[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics365 + 6];
  v17[0] = *(_OWORD *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics365);
  v17[1] = v14;
  sub_100049DE4(v17);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_formattingManager));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_pairedWatchManager));
  swift_bridgeObjectRelease(*(_QWORD *)&self->trendType[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_coachingString]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_summaryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_chartView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_dailyChart));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_ringClosureSummary));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_vO2MaxChart));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_explanationView));
}

- (uint64_t)tapToRadar
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v8;
  NSURL *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v0 = sub_100047110(&qword_10081E640);
  __chkstk_darwin(v0);
  v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for URL(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TrendsRadarHandler();
  sub_10011260C((uint64_t)v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
    return sub_10012089C((uint64_t)v2);
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
  v8 = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
  if (v8)
  {
    v10 = v8;
    URL._bridgeToObjectiveC()(v9);
    v12 = v11;
    objc_msgSend(v10, "openURL:configuration:completionHandler:", v11, 0, 0);

  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end
