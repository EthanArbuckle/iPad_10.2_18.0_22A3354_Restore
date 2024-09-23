@implementation NoticePresenter.UIRootViewController

- (_TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C120UIRootViewController)initWithCoder:(id)a3
{
  _TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C120UIRootViewController *result;

  result = (_TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C120UIRootViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "MusicCoreUI/NoticePresenter.swift", 33, 2, 437, 0);
  __break(1u);
  return result;
}

- (void)loadView
{
  id v3;
  _TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C120UIRootViewController *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  type metadata accessor for PassthroughView();
  v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v4 = self;
  v5 = objc_msgSend(v3, "init");
  v6 = (void *)objc_opt_self(UIColor);
  v8 = v5;
  v7 = objc_msgSend(v6, "clearColor");
  objc_msgSend(v8, "setBackgroundColor:", v7);

  -[NoticePresenter.UIRootViewController setView:](v4, "setView:", v8);
}

- (void)viewDidLoad
{
  _TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C120UIRootViewController *v2;

  v2 = self;
  sub_100C0DAB0();

}

- (void)viewDidLayoutSubviews
{
  _TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C120UIRootViewController *v2;

  v2 = self;
  sub_100C0DCA0();

}

- (_TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C120UIRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C120UIRootViewController *result;

  v4 = a4;
  result = (_TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C120UIRootViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicCoreUI.UIRootViewController", 32, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C120UIRootViewController_hostingController));
  swift_release();
  sub_10013C71C((uint64_t)self+ OBJC_IVAR____TtCC11MusicCoreUI15NoticePresenterP33_D8FBFBA4851A241D976DAD2E389878C120UIRootViewController_configuration, v3);
}

@end
