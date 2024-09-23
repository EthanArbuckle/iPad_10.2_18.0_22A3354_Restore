@implementation TTRIWhatsNewViewController

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC9Reminders26TTRIWhatsNewViewController *v3;

  v3 = self;
  sub_10035EB20((uint64_t)v3, v2);

}

- (void)didTapContinueButton:(id)a3
{
  _TtC9Reminders26TTRIWhatsNewViewController *v5;
  _TtC9Reminders26TTRIWhatsNewViewController *v6;
  uint64_t Strong;
  uint64_t v8;
  _OWORD v9[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v6 = self;
  }
  Strong = swift_unknownObjectWeakLoadStrong(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC9Reminders26TTRIWhatsNewViewController_presenter]+ 32);
  if (Strong)
  {
    v8 = Strong;
    sub_10035F588(Strong);

    swift_unknownObjectRelease(v8);
  }
  else
  {

  }
  sub_10002CAA0((uint64_t)v9);
}

- (_TtC9Reminders26TTRIWhatsNewViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC9Reminders26TTRIWhatsNewViewController *result;

  result = (_TtC9Reminders26TTRIWhatsNewViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIWhatsNewViewController", 36, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC9Reminders26TTRIWhatsNewViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC9Reminders26TTRIWhatsNewViewController *result;

  v6 = a5;
  result = (_TtC9Reminders26TTRIWhatsNewViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIWhatsNewViewController", 36, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC9Reminders26TTRIWhatsNewViewController_presenter]);

}

@end
