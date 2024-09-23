@implementation MindfulnessSessionDetailViewController

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
  v9.super_class = (Class)type metadata accessor for MindfulnessSessionDetailViewController(0);
  v4 = v9.receiver;
  -[MindfulnessSessionDetailViewController viewWillAppear:](&v9, "viewWillAppear:", v3);
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
  return 0;
}

- (void)didTapShareButton
{
  _TtC10FitnessApp38MindfulnessSessionDetailViewController *v2;

  v2 = self;
  sub_1002C3694();

}

- (_TtC10FitnessApp38MindfulnessSessionDetailViewController)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC10FitnessApp38MindfulnessSessionDetailViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp38MindfulnessSessionDetailViewController_dataSource) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp38MindfulnessSessionDetailViewController_sharingImage) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC10FitnessApp38MindfulnessSessionDetailViewController_trainer;
  v6 = type metadata accessor for Trainer(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = a3;

  result = (_TtC10FitnessApp38MindfulnessSessionDetailViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/MindfulnessSessionDetailViewController.swift", 55, 2, 172, 0);
  __break(1u);
  return result;
}

- (_TtC10FitnessApp38MindfulnessSessionDetailViewController)initWithStyle:(int64_t)a3
{
  _TtC10FitnessApp38MindfulnessSessionDetailViewController *result;

  result = (_TtC10FitnessApp38MindfulnessSessionDetailViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.MindfulnessSessionDetailViewController", 49, "init(style:)", 12, 0);
  __break(1u);
  return result;
}

- (_TtC10FitnessApp38MindfulnessSessionDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10FitnessApp38MindfulnessSessionDetailViewController *result;

  v4 = a4;
  result = (_TtC10FitnessApp38MindfulnessSessionDetailViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.MindfulnessSessionDetailViewController", 49, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp38MindfulnessSessionDetailViewController_mindfulnessSessionViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp38MindfulnessSessionDetailViewController_fitnessAppContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp38MindfulnessSessionDetailViewController_mindfulnessSessionFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp38MindfulnessSessionDetailViewController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp38MindfulnessSessionDetailViewController_sharingImage));
  sub_10001BE90((uint64_t)self + OBJC_IVAR____TtC10FitnessApp38MindfulnessSessionDetailViewController_trainer, &qword_1008239C0);
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  id v4;
  _TtC10FitnessApp38MindfulnessSessionDetailViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1002C448C();

  return v6;
}

@end
