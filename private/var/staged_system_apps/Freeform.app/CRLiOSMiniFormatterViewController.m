@implementation CRLiOSMiniFormatterViewController

- (CRLCanvasRep)crlaxCurrentPresentedRep
{
  return (CRLCanvasRep *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                 + OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_crlaxCurrentPresentedRep));
}

- (void)setCrlaxCurrentPresentedRep:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_crlaxCurrentPresentedRep);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_crlaxCurrentPresentedRep) = (Class)a3;
  v3 = a3;

}

- (_TtC8Freeform33CRLiOSMiniFormatterViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10080AC34();
}

- (void)loadView
{
  id v3;
  _TtC8Freeform33CRLiOSMiniFormatterViewController *v4;
  id v5;

  v3 = objc_allocWithZone((Class)UIView);
  v4 = self;
  v5 = objc_msgSend(v3, "init");
  -[CRLiOSMiniFormatterViewController setView:](v4, "setView:", v5);

}

- (id)crlaxAccessibilityViews
{
  void *v2;
  _TtC8Freeform33CRLiOSMiniFormatterViewController *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  Class isa;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_stackViewForDisplay);
  v3 = self;
  v4 = objc_msgSend(v2, "arrangedSubviews");
  v5 = sub_1004B8930(0, (unint64_t *)&qword_1013DFC10, UIView_ptr);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v5);

  sub_10052136C(v6);
  swift_bridgeObjectRelease();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (void)viewDidLoad
{
  _TtC8Freeform33CRLiOSMiniFormatterViewController *v2;

  v2 = self;
  sub_100805B9C();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLiOSMiniFormatterViewController();
  v4 = v5.receiver;
  -[CRLiOSMiniFormatterViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  sub_1004BB5A4(&v4[OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_delegate], *(_QWORD *)&v4[OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_delegate + 24]);
  sub_1005C5D98();
  v4[OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_viewDidAppear] = 1;

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  id v8;
  void *v9;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CRLiOSMiniFormatterViewController();
  swift_unknownObjectRetain(a4);
  v7 = v10.receiver;
  -[CRLiOSMiniFormatterViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v8 = objc_msgSend(v7, "view", v10.receiver, v10.super_class);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "setNeedsLayout");
    swift_unknownObjectRelease(a4);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillLayoutSubviews
{
  _TtC8Freeform33CRLiOSMiniFormatterViewController *v2;

  v2 = self;
  sub_1008065E4();

}

- (void)viewDidLayoutSubviews
{
  _BYTE *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLiOSMiniFormatterViewController();
  v2 = v3.receiver;
  -[CRLiOSMiniFormatterViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  if ((v2[OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_isAnimatingHide] & 1) == 0
    && v2[OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_isAnimatingDisplay] != 1)
  {
    sub_100809E20();
  }

}

- (_TtC8Freeform33CRLiOSMiniFormatterViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8Freeform33CRLiOSMiniFormatterViewController *result;

  v4 = a4;
  result = (_TtC8Freeform33CRLiOSMiniFormatterViewController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSMiniFormatterViewController", 42, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_stackViewForDisplay));
  swift_bridgeObjectRelease();
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((Class *)((char *)&self->super.super.super.isa
                                                        + OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_delegate));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_repTrackingViewHelper));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_fixedPositionDynamicOperationViewHelper));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLiOSMiniFormatterViewController_crlaxCurrentPresentedRep));
}

@end
