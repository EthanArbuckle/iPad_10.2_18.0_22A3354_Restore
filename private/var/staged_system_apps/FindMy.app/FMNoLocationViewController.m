@implementation FMNoLocationViewController

- (void)viewDidLayoutSubviews
{
  _TtC6FindMy26FMNoLocationViewController *v2;

  v2 = self;
  sub_10000B380();

}

- (void)viewDidLoad
{
  _TtC6FindMy26FMNoLocationViewController *v2;

  v2 = self;
  sub_1000137D0();

}

- (_TtC6FindMy26FMNoLocationViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100115510();
}

- (void)previousSelection
{
  _TtC6FindMy26FMNoLocationViewController *v2;

  v2 = self;
  sub_1001102C8();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC6FindMy26FMNoLocationViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100115BA0();

}

- (_TtC6FindMy26FMNoLocationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC6FindMy26FMNoLocationViewController *result;

  v4 = a4;
  result = (_TtC6FindMy26FMNoLocationViewController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMNoLocationViewController", 33, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy26FMNoLocationViewController_mediator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMNoLocationViewController_visualEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMNoLocationViewController_darkenerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMNoLocationViewController_markerImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMNoLocationViewController_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMNoLocationViewController_iconImageViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMNoLocationViewController_markerImageViewTopConstraint));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy26FMNoLocationViewController_selectionSubscription));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy26FMNoLocationViewController_devicesSubscription));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy26FMNoLocationViewController_peopleSubscription));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy26FMNoLocationViewController_compactConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy26FMNoLocationViewController_regularConstraints));
}

@end
