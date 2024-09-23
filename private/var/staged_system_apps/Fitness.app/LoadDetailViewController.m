@implementation LoadDetailViewController

- (_TtC10FitnessApp24LoadDetailViewController)initWithCoder:(id)a3
{
  char *v5;
  uint64_t DetailsView;
  id v7;
  _TtC10FitnessApp24LoadDetailViewController *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp24LoadDetailViewController_subView) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC10FitnessApp24LoadDetailViewController____lazy_storage___loadDetailView;
  DetailsView = type metadata accessor for LoadDetailsView(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(DetailsView - 8) + 56))(v5, 1, 1, DetailsView);
  v7 = a3;

  result = (_TtC10FitnessApp24LoadDetailViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/LoadDetailViewController.swift", 41, 2, 48, 0);
  __break(1u);
  return result;
}

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
  v9.super_class = (Class)type metadata accessor for LoadDetailViewController(0);
  v4 = v9.receiver;
  -[LoadDetailViewController viewWillAppear:](&v9, "viewWillAppear:", v3);
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

- (void)viewDidLoad
{
  _TtC10FitnessApp24LoadDetailViewController *v2;

  v2 = self;
  sub_1003B8CB8();

}

- (void)didTapOnInfoButton:(id)a3
{
  uint64_t InfoPaneDetailView;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  _TtC10FitnessApp24LoadDetailViewController *v13;
  void *v14;
  uint64_t v15;

  InfoPaneDetailView = type metadata accessor for TrainingLoadInfoPaneDetailView(0);
  __chkstk_darwin(InfoPaneDetailView);
  v7 = (uint64_t *)((char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v8);
  v10 = (char *)&v15 - v9;
  *v7 = swift_getKeyPath(&unk_100639DB8);
  v11 = sub_100047110((uint64_t *)&unk_100832400);
  swift_storeEnumTagMultiPayload(v7, v11, 0);
  sub_100047C88((uint64_t)v7, (uint64_t)v10, type metadata accessor for TrainingLoadInfoPaneDetailView);
  objc_allocWithZone((Class)sub_100047110(&qword_1008314C8));
  v12 = a3;
  v13 = self;
  v14 = (void *)UIHostingController.init(rootView:)(v10);
  objc_msgSend(v14, "setModalPresentationStyle:", 1);
  -[LoadDetailViewController presentViewController:animated:completion:](v13, "presentViewController:animated:completion:", v14, 1, 0);

}

- (_TtC10FitnessApp24LoadDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10FitnessApp24LoadDetailViewController *result;

  v4 = a4;
  result = (_TtC10FitnessApp24LoadDetailViewController *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.LoadDetailViewController", 35, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24LoadDetailViewController_context));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24LoadDetailViewController_subView));
  sub_10001BE90((uint64_t)self + OBJC_IVAR____TtC10FitnessApp24LoadDetailViewController____lazy_storage___loadDetailView, &qword_1008314C0);
}

@end
