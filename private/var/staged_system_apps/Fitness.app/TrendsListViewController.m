@implementation TrendsListViewController

- (_TtC10FitnessApp24TrendsListViewController)initWithCoder:(id)a3
{
  sub_100330DB8(a3);
  return 0;
}

- (void)dealloc
{
  void *v2;
  _TtC10FitnessApp24TrendsListViewController *v3;
  id v4;
  objc_super v5;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp24TrendsListViewController_dataProvider);
  v3 = self;
  v4 = v2;
  sub_100221460((uint64_t)v3);

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for TrendsListViewController();
  -[TrendsListViewController dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrendsListViewController_dataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrendsListViewController_formattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrendsListViewController_trendsFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrendsListViewController_activityDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrendsListViewController_pregnancyStateProvider));
  swift_bridgeObjectRelease(*(_QWORD *)&self->dataProvider[OBJC_IVAR____TtC10FitnessApp24TrendsListViewController_userFirstName]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrendsListViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrendsListViewController_spinner));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp24TrendsListViewController_metricsByTrendType));
}

- (void)viewDidLoad
{
  _TtC10FitnessApp24TrendsListViewController *v2;

  v2 = self;
  sub_100331160();

}

- (void)wheelchairUseDidChangeWithNote:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC10FitnessApp24TrendsListViewController *v9;
  __n128 v10;
  uint64_t v11;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1003318A8(v10);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)viewWillLayoutSubviews
{
  _TtC10FitnessApp24TrendsListViewController *v2;

  v2 = self;
  sub_100331A58();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC10FitnessApp24TrendsListViewController *v4;

  v4 = self;
  sub_100331BE8(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC10FitnessApp24TrendsListViewController *v4;

  v4 = self;
  sub_100331E50(a3);

}

- (void)reloadForFontSizeChangeWithNote:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC10FitnessApp24TrendsListViewController *v9;
  id v10;
  void *v11;
  uint64_t v12;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (*((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp24TrendsListViewController_dataDidLoad) != 1)
    goto LABEL_4;
  v9 = self;
  sub_100332490();
  v10 = -[TrendsListViewController view](v9, "view");
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v10, "setNeedsLayout");

    objc_msgSend(*(id *)((char *)&v9->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp24TrendsListViewController_tableView), "reloadData");
LABEL_4:
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return;
  }
  __break(1u);
}

- (_TtC10FitnessApp24TrendsListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10FitnessApp24TrendsListViewController *result;

  v4 = a4;
  result = (_TtC10FitnessApp24TrendsListViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.TrendsListViewController", 35, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC10FitnessApp24TrendsListViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_100335D68(a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp24TrendsListViewController *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_10033434C(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC10FitnessApp24TrendsListViewController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = sub_100334618((uint64_t)v6, a4);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC10FitnessApp24TrendsListViewController *v7;
  double v8;

  v6 = a3;
  v7 = self;
  v8 = 0.0;
  if (-[TrendsListViewController tableView:numberOfRowsInSection:](v7, "tableView:numberOfRowsInSection:", v6, a4) >= 1
    && (a4 | 4) != 4)
  {
    v8 = UITableViewAutomaticDimension;
  }

  return v8;
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
    return sub_10001BE90((uint64_t)v2, &qword_10081E640);
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
