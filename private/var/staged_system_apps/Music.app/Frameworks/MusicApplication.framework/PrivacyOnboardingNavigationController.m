@implementation PrivacyOnboardingNavigationController

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void (*v5)(char *, __n128);
  uint64_t v6;
  __n128 v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PrivacyOnboardingNavigationController();
  v4 = (char *)v8.receiver;
  -[PrivacyOnboardingNavigationController viewDidDisappear:](&v8, "viewDidDisappear:", v3);
  v5 = *(void (**)(char *, __n128))&v4[OBJC_IVAR____TtC16MusicApplicationP33_463B66530810D459C0FF47299D3F99DA37PrivacyOnboardingNavigationController_dismissCallback];
  if (v5)
  {
    v6 = *(_QWORD *)&v4[OBJC_IVAR____TtC16MusicApplicationP33_463B66530810D459C0FF47299D3F99DA37PrivacyOnboardingNavigationController_dismissCallback
                      + 8];
    v7 = swift_retain(v6);
    v5(v4, v7);
    sub_5C198((uint64_t)v5, v6);
  }

}

- (_TtC16MusicApplicationP33_463B66530810D459C0FF47299D3F99DA37PrivacyOnboardingNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _QWORD *v7;
  objc_class *v8;
  objc_super v10;

  v7 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplicationP33_463B66530810D459C0FF47299D3F99DA37PrivacyOnboardingNavigationController_dismissCallback);
  v8 = (objc_class *)type metadata accessor for PrivacyOnboardingNavigationController();
  *v7 = 0;
  v7[1] = 0;
  v10.receiver = self;
  v10.super_class = v8;
  return -[PrivacyOnboardingNavigationController initWithNavigationBarClass:toolbarClass:](&v10, "initWithNavigationBarClass:toolbarClass:", a3, a4);
}

- (_TtC16MusicApplicationP33_463B66530810D459C0FF47299D3F99DA37PrivacyOnboardingNavigationController)initWithRootViewController:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplicationP33_463B66530810D459C0FF47299D3F99DA37PrivacyOnboardingNavigationController_dismissCallback);
  v6 = (objc_class *)type metadata accessor for PrivacyOnboardingNavigationController();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[PrivacyOnboardingNavigationController initWithRootViewController:](&v8, "initWithRootViewController:", a3);
}

- (_TtC16MusicApplicationP33_463B66530810D459C0FF47299D3F99DA37PrivacyOnboardingNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  NSString v10;
  _QWORD *v11;
  id v12;
  _TtC16MusicApplicationP33_463B66530810D459C0FF47299D3F99DA37PrivacyOnboardingNavigationController *v13;
  objc_super v15;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC16MusicApplicationP33_463B66530810D459C0FF47299D3F99DA37PrivacyOnboardingNavigationController_dismissCallback);
    *v8 = 0;
    v8[1] = 0;
    v9 = a4;
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v11 = (Class *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplicationP33_463B66530810D459C0FF47299D3F99DA37PrivacyOnboardingNavigationController_dismissCallback);
    *v11 = 0;
    v11[1] = 0;
    v12 = a4;
    v10 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for PrivacyOnboardingNavigationController();
  v13 = -[PrivacyOnboardingNavigationController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", v10, a4);

  return v13;
}

- (_TtC16MusicApplicationP33_463B66530810D459C0FF47299D3F99DA37PrivacyOnboardingNavigationController)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC16MusicApplicationP33_463B66530810D459C0FF47299D3F99DA37PrivacyOnboardingNavigationController *v6;
  objc_super v8;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplicationP33_463B66530810D459C0FF47299D3F99DA37PrivacyOnboardingNavigationController_dismissCallback);
  *v4 = 0;
  v4[1] = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PrivacyOnboardingNavigationController();
  v5 = a3;
  v6 = -[PrivacyOnboardingNavigationController initWithCoder:](&v8, "initWithCoder:", v5);

  return v6;
}

- (void).cxx_destruct
{
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplicationP33_463B66530810D459C0FF47299D3F99DA37PrivacyOnboardingNavigationController_dismissCallback), *(_QWORD *)&self->dismissCallback[OBJC_IVAR____TtC16MusicApplicationP33_463B66530810D459C0FF47299D3F99DA37PrivacyOnboardingNavigationController_dismissCallback]);
}

@end
