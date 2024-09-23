@implementation HistoryListViewController

- (void)dealloc
{
  _TtC10FitnessApp25HistoryListViewController *v2;

  v2 = self;
  sub_100500820();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25HistoryListViewController_dataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25HistoryListViewController_fiuiFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25HistoryListViewController_fitnessAppContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25HistoryListViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25HistoryListViewController_model));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25HistoryListViewController_mindfulnessSessionFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25HistoryListViewController_stackFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25HistoryListViewController_workoutFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25HistoryListViewController_awardsDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25HistoryListViewController_badgeImageFactory));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25HistoryListViewController_friendListManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25HistoryListViewController_achievementLocalizationProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25HistoryListViewController_pauseRingsCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25HistoryListViewController_achievementResourceProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25HistoryListViewController_dataSource));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp25HistoryListViewController_allHistoryItems));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp25HistoryListViewController_workoutStatistics));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25HistoryListViewController_filterViewController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp25HistoryListViewController_observers));
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC10FitnessApp25HistoryListViewController *v7;
  double v8;
  double v9;

  v6 = a3;
  v7 = self;
  if ((uint64_t)objc_msgSend(v6, "numberOfRowsInSection:", a4) < 1)
  {
    v9 = 0.0;
  }
  else
  {
    objc_msgSend((id)objc_opt_self(CHListTableHeaderView), "preferredHeight");
    v9 = v8;
  }

  return v9;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC10FitnessApp25HistoryListViewController *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = self;
  sub_100502918(v6, a4);
  v9 = v8;

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp25HistoryListViewController *v12;
  double v13;
  double v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1005058E8();
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  char *v5;
  double result;

  v5 = (char *)objc_msgSend(a3, "numberOfSections");
  if (__OFSUB__(v5, 1))
  {
    __break(1u);
  }
  else
  {
    result = 11.0;
    if (v5 - 1 == (char *)a4)
      return 0.0;
  }
  return result;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return objc_msgSend(objc_allocWithZone((Class)UIView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp25HistoryListViewController *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_100501770((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC10FitnessApp25HistoryListViewController *v13;
  id v14;
  uint64_t v16;

  v8 = type metadata accessor for IndexPath(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = a3;
  v13 = self;
  v14 = sub_100505B9C((uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v14;
}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC10FitnessApp25HistoryListViewController *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_100505D9C(v9, a5);

  swift_unknownObjectRelease(a5);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp25HistoryListViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100503170(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp25HistoryListViewController *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_100506018((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4;
  int64_t v5;

  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  v4 = *(_QWORD *)(self + OBJC_IVAR____TtC10FitnessApp25HistoryListViewController_allHistoryItems);
  if (*(_QWORD *)(v4 + 16) <= (unint64_t)a4)
  {
LABEL_7:
    __break(1u);
    return self;
  }
  v5 = *(_QWORD *)(*(_QWORD *)(v4 + 8 * a4 + 32) + 16);
  if (*(unsigned __int8 *)(self + OBJC_IVAR____TtC10FitnessApp25HistoryListViewController_filterValue + 9) << 8 == 512)
    return v5;
  else
    return v5 + 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25HistoryListViewController_allHistoryItems))[2];
}

- (_TtC10FitnessApp25HistoryListViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005063BC();
}

- (_TtC10FitnessApp25HistoryListViewController)initWithStyle:(int64_t)a3
{
  _TtC10FitnessApp25HistoryListViewController *result;

  result = (_TtC10FitnessApp25HistoryListViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.HistoryListViewController", 36, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (_TtC10FitnessApp25HistoryListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10FitnessApp25HistoryListViewController *result;

  v4 = a4;
  result = (_TtC10FitnessApp25HistoryListViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.HistoryListViewController", 36, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

@end
