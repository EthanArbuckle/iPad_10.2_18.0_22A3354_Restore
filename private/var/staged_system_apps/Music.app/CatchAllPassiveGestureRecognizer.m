@implementation CatchAllPassiveGestureRecognizer

- (_TtC5Music32CatchAllPassiveGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  uint64_t v6;
  _OWORD v8[2];

  if (a3)
  {
    v6 = swift_unknownObjectRetain(a3, a2);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  return (_TtC5Music32CatchAllPassiveGestureRecognizer *)sub_10066E094((uint64_t)v8, (uint64_t)a4);
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music32CatchAllPassiveGestureRecognizer____lazy_storage___alwaysSimultaneousGestureRecognizerDelegate));
}

@end
