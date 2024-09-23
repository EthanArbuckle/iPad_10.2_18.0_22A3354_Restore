@implementation SinglePageViewController

- (_TtC5Books24SinglePageViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004B20C8();
}

- (NSString)description
{
  _TtC5Books24SinglePageViewController *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1004AF9D4();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (void)loadView
{
  uint64_t v3;
  id v4;
  _TtC5Books24SinglePageViewController *v5;
  id v6;

  v3 = type metadata accessor for AlwaysPassthroughView();
  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v3));
  v5 = self;
  v6 = objc_msgSend(v4, "init");
  -[SinglePageViewController setView:](v5, "setView:", v6);

}

- (void)viewDidLoad
{
  _TtC5Books24SinglePageViewController *v2;

  v2 = self;
  sub_1004AFB8C();

}

- (_TtC5Books24SinglePageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Books24SinglePageViewController *result;

  v4 = a4;
  result = (_TtC5Books24SinglePageViewController *)_swift_stdlib_reportUnimplementedInitializer("Books.SinglePageViewController", 30, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10028D108((uint64_t)self + OBJC_IVAR____TtC5Books24SinglePageViewController_containerBuilder);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books24SinglePageViewController_pageBackgroundColor));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Books24SinglePageViewController_curlSubscription));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Books24SinglePageViewController_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books24SinglePageViewController_contentContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books24SinglePageViewController_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books24SinglePageViewController_sampleHeaderChromeViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books24SinglePageViewController_titleChromeViewController));
}

@end
