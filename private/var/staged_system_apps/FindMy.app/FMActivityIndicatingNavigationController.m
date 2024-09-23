@implementation FMActivityIndicatingNavigationController

- (_TtC6FindMy40FMActivityIndicatingNavigationController)initWithRootViewController:(id)a3
{
  return (_TtC6FindMy40FMActivityIndicatingNavigationController *)sub_1000A76C4(a3);
}

- (_TtC6FindMy40FMActivityIndicatingNavigationController)initWithCoder:(id)a3
{
  return (_TtC6FindMy40FMActivityIndicatingNavigationController *)sub_1000A7880(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FMActivityIndicatingNavigationController();
  v4 = (char *)v9.receiver;
  -[FMActivityIndicatingNavigationController viewWillAppear:](&v9, "viewWillAppear:", v3);
  v5 = *(void **)&v4[OBJC_IVAR____TtC6FindMy40FMActivityIndicatingNavigationController_inactiveOverlay];
  v6 = (void *)objc_opt_self(UIColor);
  v7 = objc_msgSend(v6, "systemBackgroundColor", v9.receiver, v9.super_class);
  v8 = objc_msgSend(v7, "colorWithAlphaComponent:", 0.6);

  objc_msgSend(v5, "setBackgroundColor:", v8);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for FMActivityIndicatingNavigationController();
  v4 = a3;
  v5 = (char *)v10.receiver;
  -[FMActivityIndicatingNavigationController traitCollectionDidChange:](&v10, "traitCollectionDidChange:", v4);
  v6 = *(void **)&v5[OBJC_IVAR____TtC6FindMy40FMActivityIndicatingNavigationController_inactiveOverlay];
  v7 = (void *)objc_opt_self(UIColor);
  v8 = objc_msgSend(v7, "systemBackgroundColor", v10.receiver, v10.super_class);
  v9 = objc_msgSend(v8, "colorWithAlphaComponent:", 0.6);

  objc_msgSend(v6, "setBackgroundColor:", v9);
}

- (_TtC6FindMy40FMActivityIndicatingNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtC6FindMy40FMActivityIndicatingNavigationController *result;

  result = (_TtC6FindMy40FMActivityIndicatingNavigationController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMActivityIndicatingNavigationController", 47, "init(navigationBarClass:toolbarClass:)", 38, 0);
  __break(1u);
  return result;
}

- (_TtC6FindMy40FMActivityIndicatingNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC6FindMy40FMActivityIndicatingNavigationController *result;

  v4 = a4;
  result = (_TtC6FindMy40FMActivityIndicatingNavigationController *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMActivityIndicatingNavigationController", 47, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy40FMActivityIndicatingNavigationController_inactiveOverlay));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy40FMActivityIndicatingNavigationController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy40FMActivityIndicatingNavigationController_activityBarButton));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy40FMActivityIndicatingNavigationController_rightBarButtonItems));
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return (*((_BYTE *)&self->super.super.super.super.isa
          + OBJC_IVAR____TtC6FindMy40FMActivityIndicatingNavigationController_operationInProgress) & 1) == 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC6FindMy40FMActivityIndicatingNavigationController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1000A8D5C(v4);

  return self & 1;
}

@end
