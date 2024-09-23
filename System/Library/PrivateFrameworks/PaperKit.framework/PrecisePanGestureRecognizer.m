@implementation PrecisePanGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  @objc PrecisePanGestureRecognizer.touchesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, PrecisePanGestureRecognizer.touchesBegan(_:with:));
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  @objc PrecisePanGestureRecognizer.touchesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))PrecisePanGestureRecognizer.touchesMoved(_:with:));
}

- (_TtC8PaperKit27PrecisePanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _TtC8PaperKit27PrecisePanGestureRecognizer *result;

  if (a3)
  {
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  result = (_TtC8PaperKit27PrecisePanGestureRecognizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
