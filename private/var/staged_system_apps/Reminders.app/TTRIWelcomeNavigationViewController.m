@implementation TTRIWelcomeNavigationViewController

- (_TtC9Reminders35TTRIWelcomeNavigationViewController)initWithCoder:(id)a3
{
  _TtC9Reminders35TTRIWelcomeNavigationViewController *result;

  result = (_TtC9Reminders35TTRIWelcomeNavigationViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001ALL, 0x800000010056B730, "Reminders/TTRIWelcomeNavigationViewController.swift", 51, 2, 27, 0);
  __break(1u);
  return result;
}

- (void)dealloc
{
  objc_class *ObjectType;
  uint64_t v4;
  _TtC9Reminders35TTRIWelcomeNavigationViewController *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = qword_10063D4A0;
  v5 = self;
  if (v4 != -1)
    swift_once(&qword_10063D4A0, sub_1001E1CA8);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_100012DC4(v6, (uint64_t)qword_10064BD50);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "TTRIWelcomeNavigationViewController dealloc", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

  v11.receiver = v5;
  v11.super_class = ObjectType;
  -[TTRIWelcomeNavigationViewController dealloc](&v11, "dealloc");
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(_QWORD *)&self->OBNavigationController_opaque[OBJC_IVAR____TtC9Reminders35TTRIWelcomeNavigationViewController_presenter]);
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v5.receiver;
  -[TTRIWelcomeNavigationViewController viewDidLoad](&v5, "viewDidLoad");
  objc_msgSend(v2, "setModalPresentationStyle:", 2, v5.receiver, v5.super_class);
  objc_msgSend(v2, "setNavigationBarHidden:", 1);
  v3 = objc_msgSend(v2, "presentationController");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setDelegate:", v2);

    v2 = v4;
  }

}

- (_TtC9Reminders35TTRIWelcomeNavigationViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtC9Reminders35TTRIWelcomeNavigationViewController *result;

  result = (_TtC9Reminders35TTRIWelcomeNavigationViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIWelcomeNavigationViewController", 45, "init(navigationBarClass:toolbarClass:)", 38, 0);
  __break(1u);
  return result;
}

- (_TtC9Reminders35TTRIWelcomeNavigationViewController)initWithRootViewController:(id)a3
{
  id v3;
  _TtC9Reminders35TTRIWelcomeNavigationViewController *result;

  v3 = a3;
  result = (_TtC9Reminders35TTRIWelcomeNavigationViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIWelcomeNavigationViewController", 45, "init(rootViewController:)", 25, 0);
  __break(1u);
  return result;
}

- (_TtC9Reminders35TTRIWelcomeNavigationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9Reminders35TTRIWelcomeNavigationViewController *result;

  v4 = a4;
  result = (_TtC9Reminders35TTRIWelcomeNavigationViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIWelcomeNavigationViewController", 45, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return (unint64_t)(*(_QWORD *)(*(_QWORD *)&self->OBNavigationController_opaque[OBJC_IVAR____TtC9Reminders35TTRIWelcomeNavigationViewController_presenter]
                                      + 48)
                          - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v5;
  uint64_t Strong;
  uint8_t *v7;
  id v8;
  _TtC9Reminders35TTRIWelcomeNavigationViewController *v9;

  v5 = *(_QWORD *)&self->OBNavigationController_opaque[OBJC_IVAR____TtC9Reminders35TTRIWelcomeNavigationViewController_presenter];
  Strong = swift_unknownObjectWeakLoadStrong(v5 + 32);
  if (Strong)
  {
    v7 = (uint8_t *)Strong;
    v8 = a3;
    v9 = self;
    sub_10035E624(v5, v7);

    swift_unknownObjectRelease(v7);
  }
}

@end
