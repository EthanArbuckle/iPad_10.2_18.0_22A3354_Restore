@implementation MigrationViewController

- (_TtC23ShelfKitCollectionViews23MigrationViewController)init
{
  return (_TtC23ShelfKitCollectionViews23MigrationViewController *)sub_2A280C();
}

- (_TtC23ShelfKitCollectionViews23MigrationViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2A3670();
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (void)viewDidLoad
{
  _TtC23ShelfKitCollectionViews23MigrationViewController *v2;

  v2 = self;
  sub_2A2A54();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC23ShelfKitCollectionViews23MigrationViewController *v4;

  v4 = self;
  sub_2A3210(a3);

}

- (_TtC23ShelfKitCollectionViews23MigrationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC23ShelfKitCollectionViews23MigrationViewController *result;

  v4 = a4;
  result = (_TtC23ShelfKitCollectionViews23MigrationViewController *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.MigrationViewController", 47, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23MigrationViewController_spinner));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23MigrationViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23MigrationViewController_messageLabel));
  sub_1D618(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews23MigrationViewController_deferredBlock), *(_QWORD *)&self->spinner[OBJC_IVAR____TtC23ShelfKitCollectionViews23MigrationViewController_deferredBlock]);
}

@end
