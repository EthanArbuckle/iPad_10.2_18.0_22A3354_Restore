@implementation CRLScenesNavigatorViewController

- (_TtC8Freeform32CRLScenesNavigatorViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100B75D40();
}

- (void)loadView
{
  objc_class *v3;
  char *v4;
  uint64_t v5;
  _TtC8Freeform32CRLScenesNavigatorViewController *v6;
  _TtC8Freeform32CRLScenesNavigatorViewController *v7;
  objc_super v8;

  v3 = (objc_class *)type metadata accessor for CRLScenesNavigatorViewController.PlatformView();
  v4 = (char *)objc_allocWithZone(v3);
  v5 = swift_unknownObjectWeakInit(&v4[OBJC_IVAR____TtCC8Freeform32CRLScenesNavigatorViewController12PlatformView_owningViewController]);
  swift_unknownObjectWeakAssign(v5, self);
  v8.receiver = v4;
  v8.super_class = v3;
  v6 = self;
  v7 = -[CRLScenesNavigatorViewController initWithFrame:](&v8, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  -[CRLScenesNavigatorViewController setView:](v6, "setView:", v7, v8.receiver, v8.super_class);

  sub_100B675F4();
}

- (void)viewDidLoad
{
  _TtC8Freeform32CRLScenesNavigatorViewController *v2;

  v2 = self;
  sub_100B6601C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC8Freeform32CRLScenesNavigatorViewController *v4;

  v4 = self;
  sub_100B66360(a3, (SEL *)&selRef_viewWillAppear_);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8Freeform32CRLScenesNavigatorViewController *v4;

  v4 = self;
  sub_100B6620C(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC8Freeform32CRLScenesNavigatorViewController *v4;

  v4 = self;
  sub_100B66360(a3, (SEL *)&selRef_viewDidDisappear_);

}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLScenesNavigatorViewController();
  v2 = v3.receiver;
  -[CRLScenesNavigatorViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  sub_100B6A308();
  sub_100B6B204(0);

}

- (void)dealloc
{
  _TtC8Freeform32CRLScenesNavigatorViewController *v2;
  objc_super v3;

  v2 = self;
  sub_100B66D60();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for CRLScenesNavigatorViewController();
  -[CRLScenesNavigatorViewController dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController_scenesNavigatorState));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController_scenesPopoverState));
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController_delegate);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController_boardViewController);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController_scenesNavigatorStatePassthroughObserver));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController____lazy_storage___topCaptureSnapshotView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController____lazy_storage___bottomCaptureSnapshotView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController_floatingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController_bezelView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController_drawerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController_backdropView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController_leadingSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController_trailingSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController____lazy_storage___grabberButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController____lazy_storage___previousSceneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController____lazy_storage___nextSceneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController____lazy_storage___popoverButton));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController____lazy_storage___drawerWidthConstraint));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)grabberButtonPressedWithSender:(id)a3
{
  sub_100714BDC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100B6715C);
}

- (void)previousSceneButtonPressed
{
  uint64_t Strong;
  uint64_t v4;
  _TtC8Freeform32CRLScenesNavigatorViewController *v5;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController_delegate);
  if (Strong)
  {
    v4 = Strong;
    v5 = self;
    sub_100C39B9C();

    swift_unknownObjectRelease(v4);
  }
}

- (void)nextSceneButtonPressedWithSender:(id)a3
{
  _TtC8Freeform32CRLScenesNavigatorViewController *v5;
  uint64_t v6;
  _TtC8Freeform32CRLScenesNavigatorViewController *v7;
  uint64_t Strong;
  uint64_t v9;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController_delegate);
  if (Strong)
  {
    v9 = Strong;
    sub_100C3976C();

    swift_unknownObjectRelease(v9);
  }
  else
  {

  }
  sub_1004CB800((uint64_t)v10, &qword_1013E0230);
}

- (void)popoverButtonPressedWithSender:(id)a3
{
  sub_100714BDC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))sub_100B6741C);
}

- (void)updateViewConstraints
{
  _TtC8Freeform32CRLScenesNavigatorViewController *v2;

  v2 = self;
  sub_100B69F94();

}

- (BOOL)accessibilityPerformEscape
{
  _TtC8Freeform32CRLScenesNavigatorViewController *v2;
  unsigned int v3;

  v2 = self;
  v3 = -[CRLScenesNavigatorViewController crl_canBeDismissed](v2, "crl_canBeDismissed");
  if (v3)
    -[CRLScenesNavigatorViewController dismissViewControllerAnimated:completion:](v2, "dismissViewControllerAnimated:completion:", 1, 0);

  return v3;
}

- (NSArray)decoratorOverlayRenderables
{
  sub_1004B8930(0, (unint64_t *)&qword_1013EE6D0, off_101229820);
  return (NSArray *)Array._bridgeToObjectiveC()().super.isa;
}

- (void)willBeginZoomingOperation
{
  _TtC8Freeform32CRLScenesNavigatorViewController *v2;

  v2 = self;
  sub_100B75770();

}

- (_TtC8Freeform32CRLScenesNavigatorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8Freeform32CRLScenesNavigatorViewController *result;

  v4 = a4;
  result = (_TtC8Freeform32CRLScenesNavigatorViewController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLScenesNavigatorViewController", 41, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

@end
