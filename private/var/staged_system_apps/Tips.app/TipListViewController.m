@implementation TipListViewController

- (TipListViewController)initWithViewModel:(id)a3
{
  id v4;
  TipListViewController *v5;

  v4 = a3;
  v5 = (TipListViewController *)sub_100005D54(a3);

  return v5;
}

- (TipListViewModel)viewModel
{
  return (TipListViewModel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                     + OBJC_IVAR___TipListViewController_viewModel));
}

- (void)viewDidLoad
{
  TipListViewController *v2;

  v2 = self;
  sub_100004FC0();

}

- (void)loadView
{
  TipListViewController *v2;

  v2 = self;
  sub_100009C94();

}

- (void)setViewModel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___TipListViewController_viewModel);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___TipListViewController_viewModel) = (Class)a3;
  v3 = a3;

}

- (UIViewController)hostingController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                     + OBJC_IVAR___TipListViewController_hostingController));
}

- (TipListViewController)initWithCoder:(id)a3
{
  return (TipListViewController *)sub_100052454(a3);
}

- (void)setPreferredViewMethod:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC4Tips21TipsTOCViewController_preferredViewMethod);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Tips21TipsTOCViewController_preferredViewMethod) = (Class)a3;
  v3 = a3;

}

- (id)currentCollection
{
  void *v3;
  uint64_t KeyPath;
  uint64_t v5;
  TipListViewController *v6;
  id v7;
  id v9;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___TipListViewController_viewModel);
  KeyPath = swift_getKeyPath(&unk_10007AFE8);
  v5 = swift_getKeyPath(&unk_10007B010);
  v6 = self;
  v7 = v3;
  static Published.subscript.getter(&v9, v7, KeyPath, v5);

  swift_release(KeyPath);
  swift_release(v5);
  return v9;
}

- (void)viewDidLayoutSubviews
{
  TipListViewController *v2;

  v2 = self;
  sub_1000526F8();

}

- (int64_t)preferredStatusBarStyle
{
  TipListViewController *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_10005288C();

  return v3;
}

- (TipListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  TipListViewController *result;

  v4 = a4;
  result = (TipListViewController *)_swift_stdlib_reportUnimplementedInitializer("Tips.TipListViewController", 26, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___TipListViewController_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___TipListViewController_hostingController));
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  TipListViewController *v11;

  v7 = sub_100006578(0, &qword_1000B5808, UIPress_ptr);
  v8 = sub_100052D18();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  v10 = a4;
  v11 = self;
  sub_100052A74(v9, (uint64_t)a4);

  swift_bridgeObjectRelease(v9);
}

- (void)runTest:(id)a3 options:(id)a4
{
  sub_10006BAC8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, &OBJC_IVAR___TipListViewController_hostingController, 64);
}

@end
