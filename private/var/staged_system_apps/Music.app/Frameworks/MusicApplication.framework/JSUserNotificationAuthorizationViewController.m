@implementation JSUserNotificationAuthorizationViewController

- (_TtC16MusicApplication45JSUserNotificationAuthorizationViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplication45JSUserNotificationAuthorizationViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication45JSUserNotificationAuthorizationViewController_engagementViewController) = 0;
  v4 = a3;

  result = (_TtC16MusicApplication45JSUserNotificationAuthorizationViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/JSUserNotificationAuthorizationViewController.swift", 68, 2, 26, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC16MusicApplication45JSUserNotificationAuthorizationViewController *v2;

  v2 = self;
  JSUserNotificationAuthorizationViewController.viewDidLoad()();

}

- (_TtC16MusicApplication45JSUserNotificationAuthorizationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication45JSUserNotificationAuthorizationViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication45JSUserNotificationAuthorizationViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSUserNotificationAuthorizationViewController", 62, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication45JSUserNotificationAuthorizationViewController_userNotificationAuthorizationViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication45JSUserNotificationAuthorizationViewController_engagementViewController));
}

@end
