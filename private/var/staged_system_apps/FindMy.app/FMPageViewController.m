@implementation FMPageViewController

- (_TtC6FindMy20FMPageViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC6FindMy20FMPageViewController *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMPageViewController_pages) = (Class)&_swiftEmptyArrayStorage;
  v4 = a3;

  result = (_TtC6FindMy20FMPageViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMPageViewController.swift", 33, 2, 28, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC6FindMy20FMPageViewController *v2;

  v2 = self;
  sub_10010CDFC();

}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  id v6;
  id v7;
  _TtC6FindMy20FMPageViewController *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10010D4F8((uint64_t)v7);
  v10 = v9;

  return v10;
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  id v6;
  id v7;
  _TtC6FindMy20FMPageViewController *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10010D5C8((uint64_t)v7);
  v10 = v9;

  return v10;
}

- (_TtC6FindMy20FMPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC6FindMy20FMPageViewController *result;

  v4 = a4;
  result = (_TtC6FindMy20FMPageViewController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMPageViewController", 27, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy20FMPageViewController_pageViewController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy20FMPageViewController_pages));
}

@end
