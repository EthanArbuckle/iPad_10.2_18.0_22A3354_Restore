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
  v5 = *(void (**)(char *, __n128))&v4[OBJC_IVAR____TtC5MusicP33_8995DE762EDB3B0CA6E03DE2F9BEA1B637PrivacyOnboardingNavigationController_dismissCallback];
  if (v5)
  {
    v6 = *(_QWORD *)&v4[OBJC_IVAR____TtC5MusicP33_8995DE762EDB3B0CA6E03DE2F9BEA1B637PrivacyOnboardingNavigationController_dismissCallback
                      + 8];
    v7 = swift_retain();
    v5(v4, v7);
    sub_10004BA30((uint64_t)v5, v6);
  }

}

- (_TtC5MusicP33_8995DE762EDB3B0CA6E03DE2F9BEA1B637PrivacyOnboardingNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _QWORD *v7;
  objc_class *v8;
  objc_super v10;

  v7 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC5MusicP33_8995DE762EDB3B0CA6E03DE2F9BEA1B637PrivacyOnboardingNavigationController_dismissCallback);
  v8 = (objc_class *)type metadata accessor for PrivacyOnboardingNavigationController();
  *v7 = 0;
  v7[1] = 0;
  v10.receiver = self;
  v10.super_class = v8;
  return -[PrivacyOnboardingNavigationController initWithNavigationBarClass:toolbarClass:](&v10, "initWithNavigationBarClass:toolbarClass:", a3, a4);
}

- (_TtC5MusicP33_8995DE762EDB3B0CA6E03DE2F9BEA1B637PrivacyOnboardingNavigationController)initWithRootViewController:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC5MusicP33_8995DE762EDB3B0CA6E03DE2F9BEA1B637PrivacyOnboardingNavigationController_dismissCallback);
  v6 = (objc_class *)type metadata accessor for PrivacyOnboardingNavigationController();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[PrivacyOnboardingNavigationController initWithRootViewController:](&v8, "initWithRootViewController:", a3);
}

- (_TtC5MusicP33_8995DE762EDB3B0CA6E03DE2F9BEA1B637PrivacyOnboardingNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  _QWORD *v6;
  id v7;
  NSString v8;
  _QWORD *v9;
  id v10;
  _TtC5MusicP33_8995DE762EDB3B0CA6E03DE2F9BEA1B637PrivacyOnboardingNavigationController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC5MusicP33_8995DE762EDB3B0CA6E03DE2F9BEA1B637PrivacyOnboardingNavigationController_dismissCallback);
    *v6 = 0;
    v6[1] = 0;
    v7 = a4;
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC5MusicP33_8995DE762EDB3B0CA6E03DE2F9BEA1B637PrivacyOnboardingNavigationController_dismissCallback);
    *v9 = 0;
    v9[1] = 0;
    v10 = a4;
    v8 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for PrivacyOnboardingNavigationController();
  v11 = -[PrivacyOnboardingNavigationController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v8, a4);

  return v11;
}

- (_TtC5MusicP33_8995DE762EDB3B0CA6E03DE2F9BEA1B637PrivacyOnboardingNavigationController)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC5MusicP33_8995DE762EDB3B0CA6E03DE2F9BEA1B637PrivacyOnboardingNavigationController_dismissCallback);
  v6 = (objc_class *)type metadata accessor for PrivacyOnboardingNavigationController();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[PrivacyOnboardingNavigationController initWithCoder:](&v8, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC5MusicP33_8995DE762EDB3B0CA6E03DE2F9BEA1B637PrivacyOnboardingNavigationController_dismissCallback), *(_QWORD *)&self->dismissCallback[OBJC_IVAR____TtC5MusicP33_8995DE762EDB3B0CA6E03DE2F9BEA1B637PrivacyOnboardingNavigationController_dismissCallback]);
}

@end
