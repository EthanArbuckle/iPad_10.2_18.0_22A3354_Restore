@implementation FMSideBarViewController

- (_TtC6FindMy23FMSideBarViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10020A60C();
}

- (void)viewDidLoad
{
  _TtC6FindMy23FMSideBarViewController *v2;

  v2 = self;
  sub_100208E34();

}

- (void)indexChangedWithSender:(id)a3
{
  id v4;
  _TtC6FindMy23FMSideBarViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100209C10(v4);

}

- (void)indexNotChangedWithSender:(id)a3
{
  id v4;
  _TtC6FindMy23FMSideBarViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100209EC8(v4);

}

- (_TtC6FindMy23FMSideBarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC6FindMy23FMSideBarViewController *result;

  v4 = a4;
  result = (_TtC6FindMy23FMSideBarViewController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMSideBarViewController", 30, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy23FMSideBarViewController_contentDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy23FMSideBarViewController_sideBarView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy23FMSideBarViewController_segmentedControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy23FMSideBarViewController_topConstraint));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy23FMSideBarViewController_devicesSubscription));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy23FMSideBarViewController_mediator));
}

@end
