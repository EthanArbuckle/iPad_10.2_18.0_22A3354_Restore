@implementation CRLiOSAutoSizingHostingController

- (_TtC8Freeform33CRLiOSAutoSizingHostingController)initWithCoder:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  id v6;
  _TtC8Freeform33CRLiOSAutoSizingHostingController *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8Freeform33CRLiOSAutoSizingHostingController_lastLayoutSize);
  *v4 = 0;
  v4[1] = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform33CRLiOSAutoSizingHostingController_didChangeSize) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform33CRLiOSAutoSizingHostingController_pendingResizeAnimator) = 0;
  v5 = OBJC_IVAR____TtC8Freeform33CRLiOSAutoSizingHostingController_scrollTargets;
  v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_1008D7828((uint64_t)_swiftEmptyArrayStorage);

  result = (_TtC8Freeform33CRLiOSAutoSizingHostingController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100FAD6F0, "Freeform/CRLiOSAutoSizingHostingController.swift", 48, 2, 163, 0);
  __break(1u);
  return result;
}

- (void)loadView
{
  id v3;
  _TtC8Freeform33CRLiOSAutoSizingHostingController *v4;
  id v5;

  v3 = objc_allocWithZone((Class)UIView);
  v4 = self;
  v5 = objc_msgSend(v3, "init");
  -[CRLiOSAutoSizingHostingController setView:](v4, "setView:", v5);

}

- (void)viewDidLoad
{
  _TtC8Freeform33CRLiOSAutoSizingHostingController *v2;

  v2 = self;
  CRLiOSAutoSizingHostingController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC8Freeform33CRLiOSAutoSizingHostingController *v4;

  v4 = self;
  CRLiOSAutoSizingHostingController.viewWillAppear(_:)(a3);

}

- (void)viewWillLayoutSubviews
{
  _TtC8Freeform33CRLiOSAutoSizingHostingController *v2;

  v2 = self;
  CRLiOSAutoSizingHostingController.viewWillLayoutSubviews()();

}

- (UINavigationItem)navigationItem
{
  return (UINavigationItem *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8Freeform33CRLiOSAutoSizingHostingController_hostingController), "navigationItem");
}

- (_TtC8Freeform33CRLiOSAutoSizingHostingController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8Freeform33CRLiOSAutoSizingHostingController *result;

  v4 = a4;
  result = (_TtC8Freeform33CRLiOSAutoSizingHostingController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSAutoSizingHostingController", 42, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC8Freeform33CRLiOSAutoSizingHostingController_hostProxy));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLiOSAutoSizingHostingController_hostingController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLiOSAutoSizingHostingController_scrollView));
  swift_release(*(_QWORD *)&self->hostProxy[OBJC_IVAR____TtC8Freeform33CRLiOSAutoSizingHostingController_calculatePreliminaryFittingSize]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLiOSAutoSizingHostingController_pendingResizeAnimator));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8Freeform33CRLiOSAutoSizingHostingController_scrollTargets));
}

@end
