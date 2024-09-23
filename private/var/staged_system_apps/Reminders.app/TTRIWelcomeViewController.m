@implementation TTRIWelcomeViewController

- (void)dealloc
{
  objc_class *ObjectType;
  uint64_t v4;
  _TtC9Reminders25TTRIWelcomeViewController *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = qword_10063D698;
  v5 = self;
  if (v4 != -1)
    swift_once(&qword_10063D698, sub_100354EEC);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_100012DC4(v6, (uint64_t)qword_100656958);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "TTRIWelcomeViewController dealloc", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

  v11.receiver = v5;
  v11.super_class = ObjectType;
  -[TTRIWelcomeViewController dealloc](&v11, "dealloc");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->upgradeHelpURLString[OBJC_IVAR____TtC9Reminders25TTRIWelcomeViewController_upgradeHelpURLString]);
  sub_1000B0370(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC9Reminders25TTRIWelcomeViewController_viewModel], *(_QWORD *)&self->upgradeHelpURLString[OBJC_IVAR____TtC9Reminders25TTRIWelcomeViewController_viewModel]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC9Reminders25TTRIWelcomeViewController_originalBottomConstraints]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC9Reminders25TTRIWelcomeViewController_newBottomConstraints]);
  swift_unknownObjectRelease(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC9Reminders25TTRIWelcomeViewController_presenter]);
}

- (void)didTapContinueButton:(id)a3
{
  sub_100355228(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1000AFED8);
}

- (void)didTapContinueToUpgradeAutomaticallyButton:(id)a3
{
  sub_100355228(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1000B0054);
}

- (void)didTapUpgradeButton:(id)a3
{
  sub_100355228(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1000B0060);
}

- (uint64_t)didTapDismissButton:(uint64_t)a3
{
  char *v5;
  uint64_t Strong;
  uint64_t v7;
  _QWORD v9[4];

  swift_unknownObjectRetain(a3);
  v5 = a1;
  _bridgeAnyObjectToAny(_:)(v9);
  swift_unknownObjectRelease(a3);
  Strong = swift_unknownObjectWeakLoadStrong(*(_QWORD *)&v5[OBJC_IVAR____TtC9Reminders25TTRIWelcomeViewController_presenter] + 32);
  if (Strong)
  {
    v7 = Strong;
    sub_100356D80(Strong);

    swift_unknownObjectRelease(v7);
  }
  else
  {

  }
  return sub_100027F10(v9);
}

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC9Reminders25TTRIWelcomeViewController *v3;

  v3 = self;
  sub_100355328((uint64_t)v3, v2);

}

- (_TtC9Reminders25TTRIWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC9Reminders25TTRIWelcomeViewController *result;

  result = (_TtC9Reminders25TTRIWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIWelcomeViewController", 35, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC9Reminders25TTRIWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC9Reminders25TTRIWelcomeViewController *result;

  v6 = a5;
  result = (_TtC9Reminders25TTRIWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIWelcomeViewController", 35, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

@end
