@implementation PressGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1005D5470(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesBegan_withEvent_);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_1005D5470(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesMoved_withEvent_);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1005D5470(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesEnded_withEvent_);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_1005D5470(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesCancelled_withEvent_);
}

- (_TtC5Books22PressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  uint64_t v5;
  _TtC5Books22PressGestureRecognizer *result;

  if (a3)
  {
    v5 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v5);
    swift_unknownObjectRelease(a3);
  }
  result = (_TtC5Books22PressGestureRecognizer *)_swift_stdlib_reportUnimplementedInitializer("Books.PressGestureRecognizer", 28, "init(target:action:)", 20, 0);
  __break(1u);
  return result;
}

@end
