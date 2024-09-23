@implementation WelcomeViewController

- (_TtC6Health21WelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;

  v6 = a5;
  sub_100076138();
}

- (void)viewDidLoad
{
  _TtC6Health21WelcomeViewController *v2;

  v2 = self;
  sub_1000727B4();

}

- (void)viewWillAppear:(BOOL)a3
{
  sub_100072908(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillAppear_, 1, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  sub_100072908(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillDisappear_, 0, 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  sub_100072A1C(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidAppear_, (void (*)(id))&dispatch thunk of MicaAnimationView.startAnimation());
}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_100072A1C(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_, (void (*)(id))&dispatch thunk of MicaAnimationView.stopAnimation());
}

- (void)didTapNext:(id)a3
{
  id v4;
  _TtC6Health21WelcomeViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100072A8C(v4);

}

- (_TtC6Health21WelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC6Health21WelcomeViewController *result;

  result = (_TtC6Health21WelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer("Health.WelcomeViewController", 28, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6Health21WelcomeViewController_cloudSyncBuddyAvailabilityProvider]);
  sub_10001EEB0(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6Health21WelcomeViewController_completionHandler], *(_QWORD *)&self->animationView[OBJC_IVAR____TtC6Health21WelcomeViewController_completionHandler]);

  swift_release(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6Health21WelcomeViewController_notificationManager]);
  swift_release(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6Health21WelcomeViewController_healthNotificationViewModel]);
  swift_release(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6Health21WelcomeViewController____lazy_storage___signalProvider]);
  sub_1000137A0((uint64_t)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6Health21WelcomeViewController_deepLinkCanceler], (uint64_t (*)(_QWORD))sub_100075B68);
  swift_release(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6Health21WelcomeViewController_statusPublisher]);
}

- (void)didTapContinueButtonWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC6Health21WelcomeViewController *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1000E0D88, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_100074418((uint64_t)sub_100075CF4, v5);

  swift_release(v5);
}

- (void)didSaveFirstLastNameFor:(id)a3
{
  id v4;
  _TtC6Health21WelcomeViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10007456C(v4);

}

@end
