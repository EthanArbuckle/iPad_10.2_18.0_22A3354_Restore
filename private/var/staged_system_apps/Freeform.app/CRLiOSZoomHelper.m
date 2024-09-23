@implementation CRLiOSZoomHelper

- (_TtC8Freeform16CRLiOSZoomHelper)initWithInteractiveCanvasController:(id)a3 zoomTrackerDelegate:(id)a4
{
  id v5;
  _TtC8Freeform16CRLiOSZoomHelper *v6;

  v5 = a3;
  swift_unknownObjectRetain(a4);
  v6 = (_TtC8Freeform16CRLiOSZoomHelper *)sub_100D36080(v5, (uint64_t)a4);

  swift_unknownObjectRelease(a4);
  return v6;
}

- (void)incrementZoomLevel
{
  _TtC8Freeform16CRLiOSZoomHelper *v2;

  v2 = self;
  sub_100D35718();

}

- (void)decrementZoomLevel
{
  _TtC8Freeform16CRLiOSZoomHelper *v2;

  v2 = self;
  sub_100D3580C();

}

+ (id)zoomLevels:(double)a3 maxRange:(double)a4 zoomScale:(double)a5
{
  Class isa;

  sub_100D35EF4(a3, a4, a5);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (_TtC8Freeform16CRLiOSZoomHelper)init
{
  _TtC8Freeform16CRLiOSZoomHelper *result;

  result = (_TtC8Freeform16CRLiOSZoomHelper *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSZoomHelper", 25, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform16CRLiOSZoomHelper_delegate);
  swift_bridgeObjectRelease();
}

@end
