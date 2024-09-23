@implementation TapGestureRecognizer

- (_TtC17PromotedContentUI20TapGestureRecognizer)init
{
  return (_TtC17PromotedContentUI20TapGestureRecognizer *)sub_1B12BAA40();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1B12E9D48(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))sub_1B12E9110);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_1B12E9D48(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))sub_1B12E93B8);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_1B12E9D48(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))sub_1B12E96C8);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1B12E9D48(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))sub_1B12E99C4);
}

- (void)reset
{
  _TtC17PromotedContentUI20TapGestureRecognizer *v2;

  v2 = self;
  sub_1B12E9DFC();

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v7;
  id v8;
  _TtC17PromotedContentUI20TapGestureRecognizer *v9;
  uint64_t v10;
  char v11;

  swift_beginAccess();
  v7 = a4;
  v8 = a3;
  v9 = self;
  v10 = swift_bridgeObjectRetain();
  sub_1B12EA95C(v10, v7);
  LOBYTE(self) = v11;

  swift_bridgeObjectRelease();
  return (self & 1) == 0;
}

- (_TtC17PromotedContentUI20TapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _TtC17PromotedContentUI20TapGestureRecognizer *result;

  if (a3)
  {
    swift_unknownObjectRetain();
    sub_1B1372FC4();
    swift_unknownObjectRelease();
  }
  result = (_TtC17PromotedContentUI20TapGestureRecognizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B12C41A0(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC17PromotedContentUI20TapGestureRecognizer_touchDownHandler));
  sub_1B12C41A0(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC17PromotedContentUI20TapGestureRecognizer_touchMovedHandler));
  sub_1B12C41A0(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC17PromotedContentUI20TapGestureRecognizer_touchUpHandler));
  swift_bridgeObjectRelease();
  sub_1B12EA250(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR____TtC17PromotedContentUI20TapGestureRecognizer____lazy_storage___scrollableAncestor));
}

@end
