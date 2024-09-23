@implementation CanvasElementResizeHandle

- (void)didMoveToWindow
{
  _TtC8PaperKit25CanvasElementResizeHandle *v2;

  v2 = self;
  CanvasElementResizeHandle.didMoveToWindow()();

}

- (_TtC8PaperKit25CanvasElementResizeHandle)initWithCoder:(id)a3
{
  _TtC8PaperKit25CanvasElementResizeHandle *result;

  result = (_TtC8PaperKit25CanvasElementResizeHandle *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  _TtC8PaperKit25CanvasElementResizeHandle *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = specialized CanvasElementResizeHandle.pointerInteraction(_:styleFor:)(v6);

  return v9;
}

- (BOOL)scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _TtC8PaperKit25CanvasElementResizeHandle *v8;
  char v9;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = self;
  CanvasElementResizeHandle.hitHandle(_:with:)(0, x, y);
  LOBYTE(self) = v9;

  return self & 1;
}

- (_TtC8PaperKit25CanvasElementResizeHandle)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit25CanvasElementResizeHandle *result;

  result = (_TtC8PaperKit25CanvasElementResizeHandle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit25CanvasElementResizeHandle_dragGestureRecognizer));
}

@end
