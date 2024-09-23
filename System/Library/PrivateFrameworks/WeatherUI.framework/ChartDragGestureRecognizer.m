@implementation ChartDragGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC9WeatherUI26ChartDragGestureRecognizer *v8;

  sub_1AFF699B8();
  sub_1AFF699F4();
  v6 = sub_1B0008890();
  v7 = a4;
  v8 = self;
  ChartDragGestureRecognizer.touchesBegan(_:with:)(v6, (uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_1AFF6A190(self, (uint64_t)a2, (uint64_t)a3, a4, ChartDragGestureRecognizer.touchesMoved(_:with:));
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1AFF6A190(self, (uint64_t)a2, (uint64_t)a3, a4, ChartDragGestureRecognizer.touchesEnded(_:with:));
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  _TtC9WeatherUI26ChartDragGestureRecognizer *v7;

  sub_1AFF699B8();
  sub_1AFF699F4();
  sub_1B0008890();
  v6 = a4;
  v7 = self;
  ChartDragGestureRecognizer.touchesCancelled(_:with:)();

  swift_bridgeObjectRelease();
}

- (void)reset
{
  _TtC9WeatherUI26ChartDragGestureRecognizer *v2;

  v2 = self;
  ChartDragGestureRecognizer.reset()();

}

- (_TtC9WeatherUI26ChartDragGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _OWORD v6[2];

  if (a3)
  {
    swift_unknownObjectRetain();
    sub_1B0008C44();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtC9WeatherUI26ChartDragGestureRecognizer *)ChartDragGestureRecognizer.init(target:action:)((uint64_t)v6, (uint64_t)a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9WeatherUI26ChartDragGestureRecognizer_initialTouch));

}

@end
