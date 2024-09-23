@implementation TPSChecklistViewController

- (TPSChecklistViewModel)viewModel
{
  return (TPSChecklistViewModel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                          + OBJC_IVAR___TPSChecklistViewController_viewModel));
}

- (UIViewController)hostingController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                     + OBJC_IVAR___TPSChecklistViewController_hostingController));
}

- (void)setHostingController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR___TPSChecklistViewController_hostingController);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR___TPSChecklistViewController_hostingController) = (Class)a3;
  v3 = a3;

}

- (TPSChecklistViewController)initWithViewModel:(id)a3
{
  id v3;
  TPSChecklistViewController *v4;

  v3 = a3;
  v4 = (TPSChecklistViewController *)sub_10004BF68(v3);

  return v4;
}

- (TPSChecklistViewController)initWithCoder:(id)a3
{
  return (TPSChecklistViewController *)sub_10004B388(a3);
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
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  TPSChecklistViewController *v6;
  id v8;

  v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR___TPSChecklistViewController_viewModel);
  KeyPath = swift_getKeyPath(&unk_10007A778);
  v5 = swift_getKeyPath(&unk_10007A7A0);
  v6 = self;
  static Published.subscript.getter(&v8, v3, KeyPath, v5);

  swift_release(KeyPath);
  swift_release(v5);
  return v8;
}

- (void)loadView
{
  TPSChecklistViewController *v2;

  v2 = self;
  sub_10004B69C();

}

- (void)viewDidLoad
{
  char *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ChecklistViewController();
  v2 = (char *)v6.receiver;
  -[TPSViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = objc_msgSend(v2, "navigationItem", v6.receiver, v6.super_class);
  objc_msgSend(v3, "setLargeTitleDisplayMode:", 2);

  v4 = *(_QWORD *)&v2[OBJC_IVAR___TPSChecklistViewController_viewModel];
  v5 = *(_QWORD *)(v4 + OBJC_IVAR___TPSChecklistViewModel_currentDisplayTips);
  *(_QWORD *)(v4 + OBJC_IVAR___TPSChecklistViewModel_currentDisplayTips) = 0;

  swift_bridgeObjectRelease(v5);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ChecklistViewController();
  v4 = v9.receiver;
  -[TipsTOCViewController viewWillAppear:](&v9, "viewWillAppear:", v3);
  v5 = objc_msgSend(v4, "navigationController", v9.receiver, v9.super_class);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "navigationBar");

    v8 = objc_msgSend((id)objc_opt_self(UIColor), "tintColor");
    objc_msgSend(v7, "setTintColor:", v8);

    v4 = v8;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  TPSChecklistViewController *v4;

  v4 = self;
  sub_10004BBD0(a3);

}

- (TPSChecklistViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  TPSChecklistViewController *result;

  v4 = a4;
  result = (TPSChecklistViewController *)_swift_stdlib_reportUnimplementedInitializer("Tips.ChecklistViewController", 28, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___TPSChecklistViewController_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___TPSChecklistViewController_hostingController));
}

@end
