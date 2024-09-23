@implementation ModelViewOverflowViewController

- (_TtC23ShelfKitCollectionViews31ModelViewOverflowViewController)initWithCoder:(id)a3
{
  _TtC23ShelfKitCollectionViews31ModelViewOverflowViewController *result;

  result = (_TtC23ShelfKitCollectionViews31ModelViewOverflowViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/ModelViewOverflowViewController.swift", 61, 2, 48, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC23ShelfKitCollectionViews31ModelViewOverflowViewController *v2;

  v2 = self;
  sub_EDB60();

}

- (void)viewDidLayoutSubviews
{
  _TtC23ShelfKitCollectionViews31ModelViewOverflowViewController *v2;

  v2 = self;
  sub_EDD74();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ModelViewOverflowViewController();
  v4 = (char *)v5.receiver;
  -[ModelViewOverflowViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC23ShelfKitCollectionViews31ModelViewOverflowViewController_scrollView], "setContentOffset:animated:", 0, 0.0, 0.0, v5.receiver, v5.super_class);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC23ShelfKitCollectionViews31ModelViewOverflowViewController *v6;

  v5 = a3;
  v6 = self;
  sub_EE0D4(a3);

}

- (void)dismissAnimated
{
  -[ModelViewOverflowViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (_TtC23ShelfKitCollectionViews31ModelViewOverflowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC23ShelfKitCollectionViews31ModelViewOverflowViewController *result;

  v4 = a4;
  result = (_TtC23ShelfKitCollectionViews31ModelViewOverflowViewController *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.ModelViewOverflowViewController", 55, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((Class *)((char *)&self->super.super.super.isa
                                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31ModelViewOverflowViewController_model));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31ModelViewOverflowViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31ModelViewOverflowViewController_modelView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews31ModelViewOverflowViewController_objectGraph));
  sub_1D618(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews31ModelViewOverflowViewController_preflightHandler), *(_QWORD *)&self->model[OBJC_IVAR____TtC23ShelfKitCollectionViews31ModelViewOverflowViewController_preflightHandler]);
}

@end
