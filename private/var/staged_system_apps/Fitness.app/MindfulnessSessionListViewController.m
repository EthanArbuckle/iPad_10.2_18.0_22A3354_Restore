@implementation MindfulnessSessionListViewController

- (_TtC10FitnessApp36MindfulnessSessionListViewController)initWithAllMindfulnessSessionViewModels:(id)a3 dataProvider:(id)a4 fitnessAppContext:(id)a5 fiuiFormattingManager:(id)a6 healthStore:(id)a7 mindfulnessSessionFormattingManager:(id)a8
{
  uint64_t v14;
  uint64_t v15;
  _TtC10FitnessApp36MindfulnessSessionListViewController *result;

  v14 = type metadata accessor for MindfulnessSessionViewModel(0);
  v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v14);
  sub_10012921C(v15, a4, a5, a6, a7, a8);
  return result;
}

- (void)dealloc
{
  _TtC10FitnessApp36MindfulnessSessionListViewController *v2;

  v2 = self;
  sub_100129854();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp36MindfulnessSessionListViewController_dataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp36MindfulnessSessionListViewController_fiuiFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp36MindfulnessSessionListViewController_fitnessAppContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp36MindfulnessSessionListViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp36MindfulnessSessionListViewController_mindfulnessSessionFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp36MindfulnessSessionListViewController_dataSource));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp36MindfulnessSessionListViewController_allMindfulnessSessionViewModels));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp36MindfulnessSessionListViewController_observers));
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC10FitnessApp36MindfulnessSessionListViewController *v7;
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
  _TtC10FitnessApp36MindfulnessSessionListViewController *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  v8 = (void *)sub_10012ABCC(v6, a4);

  return v8;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp36MindfulnessSessionListViewController *v12;
  double v13;
  double v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  if (IndexPath.row.getter())
  {
    v13 = UITableViewAutomaticDimension;
  }
  else
  {
    objc_msgSend((id)objc_opt_self(CHListSummaryTableViewCell), "heightForMindfulnessSessions");
    v13 = v14;
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
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

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC10FitnessApp36MindfulnessSessionListViewController *v13;
  id v14;
  uint64_t v16;

  v8 = type metadata accessor for IndexPath(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = a3;
  v13 = self;
  v14 = sub_10012EBEC((uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v14;
}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC10FitnessApp36MindfulnessSessionListViewController *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_10012ED7C(v9, a5);

  swift_unknownObjectRelease(a5);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp36MindfulnessSessionListViewController *v12;
  Class isa;
  uint64_t v14;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v11, "deselectRowAtIndexPath:animated:", isa, 1);

  sub_10012B9BC((uint64_t)v10);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp36MindfulnessSessionListViewController *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_10012EFE4((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (_TtC10FitnessApp36MindfulnessSessionListViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC10FitnessApp36MindfulnessSessionListViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp36MindfulnessSessionListViewController_dataSource) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp36MindfulnessSessionListViewController_allMindfulnessSessionViewModels) = (Class)&_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp36MindfulnessSessionListViewController_observers) = (Class)&_swiftEmptyArrayStorage;
  v4 = a3;

  result = (_TtC10FitnessApp36MindfulnessSessionListViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/MindfulnessSessionListViewController.swift", 53, 2, 315, 0);
  __break(1u);
  return result;
}

- (_TtC10FitnessApp36MindfulnessSessionListViewController)initWithStyle:(int64_t)a3
{
  _TtC10FitnessApp36MindfulnessSessionListViewController *result;

  result = (_TtC10FitnessApp36MindfulnessSessionListViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.MindfulnessSessionListViewController", 47, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (_TtC10FitnessApp36MindfulnessSessionListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10FitnessApp36MindfulnessSessionListViewController *result;

  v4 = a4;
  result = (_TtC10FitnessApp36MindfulnessSessionListViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.MindfulnessSessionListViewController", 47, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

@end
