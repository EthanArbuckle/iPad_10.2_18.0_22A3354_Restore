@implementation CRLiOSCanvasZoomControlViewController

- (void)viewDidLoad
{
  _TtC8Freeform37CRLiOSCanvasZoomControlViewController *v2;

  v2 = self;
  sub_10056D550();

}

- (void)updateViewConstraints
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLiOSCanvasZoomControlViewController();
  v2 = v3.receiver;
  -[CRLiOSCanvasZoomControlViewController updateViewConstraints](&v3, "updateViewConstraints");
  sub_10056E1FC();

}

- (_TtC8Freeform37CRLiOSCanvasZoomControlViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC8Freeform37CRLiOSCanvasZoomControlViewController *)sub_10056E9A8(v5, v7, a4);
}

- (_TtC8Freeform37CRLiOSCanvasZoomControlViewController)initWithCoder:(id)a3
{
  return (_TtC8Freeform37CRLiOSCanvasZoomControlViewController *)sub_10056EB28(a3);
}

- (void).cxx_destruct
{
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform37CRLiOSCanvasZoomControlViewController_delegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8Freeform37CRLiOSCanvasZoomControlViewController_viewScaleDetents));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8Freeform37CRLiOSCanvasZoomControlViewController_zoomUpdateObserver));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8Freeform37CRLiOSCanvasZoomControlViewController_zoomDidChangeObserver));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform37CRLiOSCanvasZoomControlViewController____lazy_storage___button));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform37CRLiOSCanvasZoomControlViewController_menu));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform37CRLiOSCanvasZoomControlViewController_buttonWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform37CRLiOSCanvasZoomControlViewController_buttonHeightConstraint));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8Freeform37CRLiOSCanvasZoomControlViewController_contentSizeCategoryChangeObserver));
}

@end
