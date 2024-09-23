@implementation TapDragGestureRecognizer

- (_TtC9TeaCharts24TapDragGestureRecognizer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  TapDragGestureRecognizer.init(coder:)();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC9TeaCharts24TapDragGestureRecognizer *v8;

  sub_1B82025CC();
  sub_1B8202608();
  v6 = sub_1B820E960();
  v7 = a4;
  v8 = self;
  TapDragGestureRecognizer.touchesBegan(_:with:)(v6, v7);

  swift_bridgeObjectRelease();
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_1B8201C08(self, (uint64_t)a2, (uint64_t)a3, a4, TapDragGestureRecognizer.touchesMoved(_:with:));
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1B8201C08(self, (uint64_t)a2, (uint64_t)a3, a4, TapDragGestureRecognizer.touchesEnded(_:with:));
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  _TtC9TeaCharts24TapDragGestureRecognizer *v7;

  sub_1B82025CC();
  sub_1B8202608();
  sub_1B820E960();
  v6 = a4;
  v7 = self;
  TapDragGestureRecognizer.touchesCancelled(_:with:)();

  swift_bridgeObjectRelease();
}

- (void)reset
{
  _TtC9TeaCharts24TapDragGestureRecognizer *v2;

  v2 = self;
  TapDragGestureRecognizer.reset()();

}

- (_TtC9TeaCharts24TapDragGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_1B820EA80();
    swift_unknownObjectRelease();
  }
  TapDragGestureRecognizer.init(target:action:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
