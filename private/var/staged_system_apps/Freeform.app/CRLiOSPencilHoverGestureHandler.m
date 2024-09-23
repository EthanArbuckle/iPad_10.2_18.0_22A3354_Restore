@implementation CRLiOSPencilHoverGestureHandler

- (_TtC8Freeform31CRLiOSPencilHoverGestureHandler)initWithInteractiveCanvasController:(id)a3 pencilMediator:(id)a4
{
  id v6;
  _TtC8Freeform31CRLiOSPencilHoverGestureHandler *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = (_TtC8Freeform31CRLiOSPencilHoverGestureHandler *)sub_10096681C((uint64_t)a3, (uint64_t)a4);

  swift_unknownObjectRelease(a4);
  return v7;
}

- (void)handleHoverGesture:(id)a3
{
  id v4;
  _TtC8Freeform31CRLiOSPencilHoverGestureHandler *v5;

  v4 = a3;
  v5 = self;
  sub_100965030(v4);

}

- (void)removeHoverEffect
{
  _TtC8Freeform31CRLiOSPencilHoverGestureHandler *v2;

  v2 = self;
  sub_100965AE0();

}

- (_TtC8Freeform31CRLiOSPencilHoverGestureHandler)init
{
  _TtC8Freeform31CRLiOSPencilHoverGestureHandler *result;

  result = (_TtC8Freeform31CRLiOSPencilHoverGestureHandler *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSPencilHoverGestureHandler", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform31CRLiOSPencilHoverGestureHandler_icc);
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform31CRLiOSPencilHoverGestureHandler_pencilMediator);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform31CRLiOSPencilHoverGestureHandler_hoverRepManager));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Freeform31CRLiOSPencilHoverGestureHandler_previewImageProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform31CRLiOSPencilHoverGestureHandler_pencilHoverStates));
}

@end
