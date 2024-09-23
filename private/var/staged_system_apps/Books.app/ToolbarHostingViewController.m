@implementation ToolbarHostingViewController

- (_TtC5Books28ToolbarHostingViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  _TtC5Books28ToolbarHostingViewController *result;
  uint64_t v9;

  v5 = OBJC_IVAR____TtC5Books28ToolbarHostingViewController_toolbarHeightPublisher;
  v9 = 0;
  v6 = sub_10004CFD4((uint64_t *)&unk_1009CEED0);
  swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)CurrentValueSubject.init(_:)(&v9);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books28ToolbarHostingViewController_cancellables) = (Class)&_swiftEmptySetSingleton;

  result = (_TtC5Books28ToolbarHostingViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001007B93A0, "Books/ToolbarHostingViewController.swift", 40, 2, 28, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC5Books28ToolbarHostingViewController *v2;

  v2 = self;
  sub_1005D12B8();

}

- (_TtC5Books28ToolbarHostingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Books28ToolbarHostingViewController *result;

  v4 = a4;
  result = (_TtC5Books28ToolbarHostingViewController *)_swift_stdlib_reportUnimplementedInitializer("Books.ToolbarHostingViewController", 34, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books28ToolbarHostingViewController_rootViewController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Books28ToolbarHostingViewController_toolbarHeightPublisher));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Books28ToolbarHostingViewController_cancellables));
}

@end
