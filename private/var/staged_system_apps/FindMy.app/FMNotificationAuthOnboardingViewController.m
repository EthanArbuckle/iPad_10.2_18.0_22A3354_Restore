@implementation FMNotificationAuthOnboardingViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType(self);
  v4 = v8.receiver;
  -[FMNotificationAuthOnboardingViewController viewWillAppear:](&v8, "viewWillAppear:", v3);
  v5 = objc_msgSend(v4, "parentViewController", v8.receiver, v8.super_class);
  if (v5)
  {
    v6 = v5;
    v7 = objc_opt_self(UIPageViewController);
    if (swift_dynamicCastObjCClass(v6, v7))
      sub_10010D39C();

  }
  else
  {
    v6 = v4;
  }

}

- (NSArray)keyCommands
{
  uint64_t v3;
  uint64_t v4;
  _TtC6FindMy42FMNotificationAuthOnboardingViewController *v5;
  NSString v6;
  id v7;
  uint64_t v8;
  Class isa;

  v3 = sub_100053F2C(&qword_1005D2F10);
  v4 = swift_allocObject(v3, 40, 7);
  *(_OWORD *)(v4 + 16) = xmmword_100481B00;
  v5 = self;
  v6 = String._bridgeToObjectiveC()();
  v7 = objc_msgSend((id)objc_opt_self(UIKeyCommand), "keyCommandWithInput:modifierFlags:action:", v6, 0, "returnPressed");

  *(_QWORD *)(v4 + 32) = v7;
  specialized Array._endMutation()(v8);

  sub_100006C5C(0, (unint64_t *)&unk_1005D8180, UIKeyCommand_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSArray *)isa;
}

- (void)returnPressed
{
  _TtC6FindMy42FMNotificationAuthOnboardingViewController *v2;

  v2 = self;
  sub_10011B1A0();

}

- (void)ignore
{
  _TtC6FindMy42FMNotificationAuthOnboardingViewController *v2;

  v2 = self;
  sub_10011B37C();

}

- (_TtC6FindMy42FMNotificationAuthOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  if (!a4)
  {
    v13 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v14 = 0;
    v16 = 0;
    return (_TtC6FindMy42FMNotificationAuthOnboardingViewController *)sub_10011B494(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = v15;
  return (_TtC6FindMy42FMNotificationAuthOnboardingViewController *)sub_10011B494(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC6FindMy42FMNotificationAuthOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }
  v14 = a5;
  return (_TtC6FindMy42FMNotificationAuthOnboardingViewController *)sub_10011B76C(v9, v11, (uint64_t)a4, v13, a5, a6);
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy42FMNotificationAuthOnboardingViewController_mediator]);

  sub_10005E190((uint64_t)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy42FMNotificationAuthOnboardingViewController_delegate]);
}

@end
