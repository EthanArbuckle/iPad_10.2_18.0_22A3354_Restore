@implementation FMRemoveItemViewController

- (_TtC6FindMy26FMRemoveItemViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100195EF0();
}

- (void)viewDidLoad
{
  _TtC6FindMy26FMRemoveItemViewController *v2;

  v2 = self;
  sub_10018FCC4();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC6FindMy26FMRemoveItemViewController *v4;

  v4 = self;
  sub_10018FD9C(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy26FMRemoveItemViewController *v4;

  v4 = self;
  sub_10018FF40(a3);

}

- (void)removeItem
{
  _TtC6FindMy26FMRemoveItemViewController *v2;

  v2 = self;
  sub_100191AA0();

}

- (void)cancel
{
  -[FMRemoveItemViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (_TtC6FindMy26FMRemoveItemViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC6FindMy26FMRemoveItemViewController *result;

  v4 = a4;
  result = (_TtC6FindMy26FMRemoveItemViewController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMRemoveItemViewController", 33, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy26FMRemoveItemViewController_mediator));
  sub_1000051EC((uint64_t)self + OBJC_IVAR____TtC6FindMy26FMRemoveItemViewController_itemToRemove, (uint64_t *)&unk_1005D3AA0);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy26FMRemoveItemViewController_selectionSubscription));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy26FMRemoveItemViewController_devicesSubscription));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRemoveItemViewController_landingView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy26FMRemoveItemViewController_imageFetchingCancellable));
}

@end
