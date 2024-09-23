@implementation PassthroughView

- (_TtC5Books15PassthroughView)initWithFrame:(CGRect)a3
{
  return (_TtC5Books15PassthroughView *)sub_100675B4C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Books15PassthroughView)initWithCoder:(id)a3
{
  id v5;
  _TtC5Books15PassthroughView *result;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC5Books15PassthroughView_secondaryView, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC5Books15PassthroughView_delegate, 0);
  v5 = a3;

  result = (_TtC5Books15PassthroughView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001007B93A0, "Books/PassthroughView.swift", 27, 2, 22, 0);
  __break(1u);
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  uint64_t Strong;
  void *v9;
  id v10;
  _TtC5Books15PassthroughView *v11;
  unsigned __int8 v12;

  y = a3.y;
  x = a3.x;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Books15PassthroughView_delegate);
  if (!Strong)
    return 1;
  v9 = (void *)Strong;
  v10 = a4;
  v11 = self;
  v12 = objc_msgSend(v9, "passThroughView:shouldPassthroughHitAtPoint:", v11, x, y);

  swift_unknownObjectRelease(v9);
  return v12 ^ 1;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Books15PassthroughView_secondaryView);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books15PassthroughView_delegate);
}

@end
