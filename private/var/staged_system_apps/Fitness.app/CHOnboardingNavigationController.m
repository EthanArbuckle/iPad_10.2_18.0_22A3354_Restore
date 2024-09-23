@implementation CHOnboardingNavigationController

- (id)buddyControllerDoneAction
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;

  if (!*(Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction))
    return 0;
  v2 = *(_QWORD *)&self->buddyControllerDoneAction[OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction];
  v6[4] = *(Class *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction);
  v7 = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_10002D0F8;
  v6[3] = &unk_10078E430;
  v3 = _Block_copy(v6);
  v4 = v7;
  swift_retain(v2);
  swift_release(v4);
  return v3;
}

- (void)setBuddyControllerDoneAction:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (*v6)();
  uint64_t (**v7)();
  uint64_t v8;
  uint64_t v9;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = (_QWORD *)swift_allocObject(&unk_10078E418, 24, 7);
    v4[2] = v5;
    v6 = sub_100106890;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction);
  v9 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction);
  v8 = *(_QWORD *)&self->buddyControllerDoneAction[OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction];
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_100022BA4(v9, v8);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (CHOnboardingNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _QWORD *v7;
  objc_class *v8;
  objc_super v10;

  v7 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction);
  v8 = (objc_class *)type metadata accessor for OnboardingNavigationController();
  *v7 = 0;
  v7[1] = 0;
  v10.receiver = self;
  v10.super_class = v8;
  return -[CHOnboardingNavigationController initWithNavigationBarClass:toolbarClass:](&v10, "initWithNavigationBarClass:toolbarClass:", a3, a4);
}

- (CHOnboardingNavigationController)initWithRootViewController:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction);
  v6 = (objc_class *)type metadata accessor for OnboardingNavigationController();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[CHOnboardingNavigationController initWithRootViewController:](&v8, "initWithRootViewController:", a3);
}

- (CHOnboardingNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  NSString v10;
  _QWORD *v11;
  id v12;
  CHOnboardingNavigationController *v13;
  objc_super v15;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction);
    *v8 = 0;
    v8[1] = 0;
    v9 = a4;
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v11 = (Class *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction);
    *v11 = 0;
    v11[1] = 0;
    v12 = a4;
    v10 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for OnboardingNavigationController();
  v13 = -[CHOnboardingNavigationController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", v10, a4);

  return v13;
}

- (CHOnboardingNavigationController)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction);
  v6 = (objc_class *)type metadata accessor for OnboardingNavigationController();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[CHOnboardingNavigationController initWithCoder:](&v8, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_100022BA4(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction), *(_QWORD *)&self->buddyControllerDoneAction[OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction]);
}

- (id)activePairingDevice
{
  return 0;
}

- (id)setupFlowUserInfo
{
  return 0;
}

- (void)buddyControllerDone:(id)a3
{
  void (*v3)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  CHOnboardingNavigationController *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction);
  if (v3)
  {
    v6 = *(_QWORD *)&self->buddyControllerDoneAction[OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction];
    swift_unknownObjectRetain(a3);
    v8 = self;
    v7 = sub_10003AFE0((uint64_t)v3, v6);
    v3(v7);
    sub_100022BA4((uint64_t)v3, v6);
    swift_unknownObjectRelease(a3);

  }
}

- (void)buddyControllerDone:(id)a3 nextControllerClass:(Class)a4
{
  void (*v4)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  CHOnboardingNavigationController *v9;

  v4 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction);
  if (v4)
  {
    v7 = *(_QWORD *)&self->buddyControllerDoneAction[OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction];
    swift_unknownObjectRetain(a3);
    v9 = self;
    v8 = sub_10003AFE0((uint64_t)v4, v7);
    v4(v8);
    sub_100022BA4((uint64_t)v4, v7);
    swift_unknownObjectRelease(a3);

  }
}

@end
