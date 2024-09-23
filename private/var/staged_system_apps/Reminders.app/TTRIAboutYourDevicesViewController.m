@implementation TTRIAboutYourDevicesViewController

- (void)didTapUpgradeButton:(id)a3
{
  _TtC9Reminders34TTRIAboutYourDevicesViewController *v5;
  uint64_t v6;
  uint64_t Strong;
  uint64_t v8;
  __int128 v9;
  _QWORD v10[4];
  _OWORD v11[3];
  uint64_t v12;

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v10);
  swift_unknownObjectRelease(a3);
  v6 = *(_QWORD *)&v5->OBWelcomeController_opaque[OBJC_IVAR____TtC9Reminders34TTRIAboutYourDevicesViewController_presenter];
  Strong = swift_unknownObjectWeakLoadStrong(v6 + 32);
  if (Strong)
  {
    v8 = Strong;
    v9 = *(_OWORD *)(v6 + 64);
    v11[0] = *(_OWORD *)(v6 + 48);
    v11[1] = v9;
    v11[2] = *(_OWORD *)(v6 + 80);
    v12 = *(_QWORD *)(v6 + 96);
    sub_1001EAA40((uint64_t)v11);
    sub_10035E4CC((uint64_t)v11);
    swift_unknownObjectRelease(v8);
    sub_1001EAA74((uint64_t)v11);
  }

  sub_100027F10(v10);
}

- (void)didTapLaterButton:(id)a3
{
  _TtC9Reminders34TTRIAboutYourDevicesViewController *v5;
  uint64_t Strong;
  uint64_t v7;
  _QWORD v8[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v8);
  swift_unknownObjectRelease(a3);
  Strong = swift_unknownObjectWeakLoadStrong(*(_QWORD *)&v5->OBWelcomeController_opaque[OBJC_IVAR____TtC9Reminders34TTRIAboutYourDevicesViewController_presenter]+ 32);
  if (Strong)
  {
    v7 = Strong;
    sub_1001EA948(Strong);

    swift_unknownObjectRelease(v7);
  }
  else
  {

  }
  sub_100027F10(v8);
}

- (uint64_t)didTapDevicesLearnMore:(uint64_t)a3
{
  id v5;
  _QWORD v7[4];

  swift_unknownObjectRetain(a3);
  v5 = a1;
  _bridgeAnyObjectToAny(_:)(v7);
  swift_unknownObjectRelease(a3);
  sub_1001E7484();

  return sub_100027F10(v7);
}

- (void)didTapSharedListsParticipant:(id)a3
{
  _TtC9Reminders34TTRIAboutYourDevicesViewController *v5;
  _QWORD v6[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v6);
  swift_unknownObjectRelease(a3);
  sub_1001E7748((uint64_t)v6);

  sub_100027F10(v6);
}

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC9Reminders34TTRIAboutYourDevicesViewController *v3;

  v3 = self;
  sub_1001E7ABC((uint64_t)v3, v2);

}

- (_TtC9Reminders34TTRIAboutYourDevicesViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC9Reminders34TTRIAboutYourDevicesViewController *result;

  result = (_TtC9Reminders34TTRIAboutYourDevicesViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIAboutYourDevicesViewController", 44, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC9Reminders34TTRIAboutYourDevicesViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC9Reminders34TTRIAboutYourDevicesViewController *result;

  v6 = a5;
  result = (_TtC9Reminders34TTRIAboutYourDevicesViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIAboutYourDevicesViewController", 44, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000B0360(*(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC9Reminders34TTRIAboutYourDevicesViewController_upgradeInfo], *(_QWORD *)&self->upgradeInfo[OBJC_IVAR____TtC9Reminders34TTRIAboutYourDevicesViewController_upgradeInfo], *(_QWORD *)&self->upgradeInfo[OBJC_IVAR____TtC9Reminders34TTRIAboutYourDevicesViewController_upgradeInfo + 8], *(_QWORD *)&self->upgradeInfo[OBJC_IVAR____TtC9Reminders34TTRIAboutYourDevicesViewController_upgradeInfo + 16], *(_QWORD *)&self->upgradeInfo[OBJC_IVAR____TtC9Reminders34TTRIAboutYourDevicesViewController_upgradeInfo + 24], *(_QWORD *)&self->upgradeInfo[OBJC_IVAR____TtC9Reminders34TTRIAboutYourDevicesViewController_upgradeInfo + 32], *(_QWORD *)&self->upgradeInfo[OBJC_IVAR____TtC9Reminders34TTRIAboutYourDevicesViewController_upgradeInfo + 40]);
  swift_unknownObjectRelease(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC9Reminders34TTRIAboutYourDevicesViewController_presenter]);

  sub_1000B0308(*(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC9Reminders34TTRIAboutYourDevicesViewController_viewModel], *(_QWORD *)&self->upgradeInfo[OBJC_IVAR____TtC9Reminders34TTRIAboutYourDevicesViewController_viewModel], *(_QWORD *)&self->upgradeInfo[OBJC_IVAR____TtC9Reminders34TTRIAboutYourDevicesViewController_viewModel + 8], *(_QWORD *)&self->upgradeInfo[OBJC_IVAR____TtC9Reminders34TTRIAboutYourDevicesViewController_viewModel + 16], *(_QWORD *)&self->upgradeInfo[OBJC_IVAR____TtC9Reminders34TTRIAboutYourDevicesViewController_viewModel + 24], *(_QWORD *)&self->upgradeInfo[OBJC_IVAR____TtC9Reminders34TTRIAboutYourDevicesViewController_viewModel + 32], *(_QWORD *)&self->upgradeInfo[OBJC_IVAR____TtC9Reminders34TTRIAboutYourDevicesViewController_viewModel + 40]);
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0, a5);
}

@end
