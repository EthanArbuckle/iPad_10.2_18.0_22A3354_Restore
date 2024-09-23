@implementation StackDetailViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for StackDetailViewController(0);
  v4 = v9.receiver;
  -[StackDetailViewController viewWillAppear:](&v9, "viewWillAppear:", v3);
  v5 = objc_msgSend(v4, "navigationController", v9.receiver, v9.super_class);
  if (v5)
  {
    v6 = v5;
    v7 = objc_opt_self(CHActivityHistoryNavigationController);
    v8 = (void *)swift_dynamicCastObjCClass(v6, v7);
    if (!v8)

    objc_msgSend(v8, "detachPalette");
  }
  else
  {
    v8 = v4;
  }

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return UITableViewAutomaticDimension;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  _TtC10FitnessApp25StackDetailViewController *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t);
  uint64_t v20;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v20 - v12;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = a3;
  v15 = self;
  v16 = IndexPath.row.getter(v15);
  v17 = (*(uint64_t (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  if (v16)
  {
    v16 = IndexPath.row.getter(v17);
    v18 = *(void (**)(char *, uint64_t))(v8 + 8);
    v18(v11, v7);

    LOBYTE(v16) = v16 != 1;
  }
  else
  {
    v18 = *(void (**)(char *, uint64_t))(v8 + 8);
    v18(v11, v7);

  }
  v18(v13, v7);
  return v16;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC10FitnessApp25StackDetailViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_1002365EC(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC10FitnessApp25StackDetailViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC10FitnessApp25StackDetailViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp25StackDetailViewController_dataSource) = 0;
  v4 = a3;

  result = (_TtC10FitnessApp25StackDetailViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/StackDetailViewController.swift", 42, 2, 285, 0);
  __break(1u);
  return result;
}

- (_TtC10FitnessApp25StackDetailViewController)initWithStyle:(int64_t)a3
{
  _TtC10FitnessApp25StackDetailViewController *result;

  result = (_TtC10FitnessApp25StackDetailViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.StackDetailViewController", 36, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (_TtC10FitnessApp25StackDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10FitnessApp25StackDetailViewController *result;

  v4 = a4;
  result = (_TtC10FitnessApp25StackDetailViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.StackDetailViewController", 36, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25StackDetailViewController_achievementLocalizationProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25StackDetailViewController_pauseRingsCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25StackDetailViewController_achievementResourceProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25StackDetailViewController_awardsDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25StackDetailViewController_badgeImageFactory));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25StackDetailViewController_historyDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25StackDetailViewController_fitnessAppContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25StackDetailViewController_fiuiFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25StackDetailViewController_friendListManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25StackDetailViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25StackDetailViewController_mindfulnessSessionFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25StackDetailViewController_model));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25StackDetailViewController_stackFormattingManager));
  sub_100149D44((uint64_t)self + OBJC_IVAR____TtC10FitnessApp25StackDetailViewController_stackViewModel);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25StackDetailViewController_workoutFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25StackDetailViewController_dataSource));
}

@end
