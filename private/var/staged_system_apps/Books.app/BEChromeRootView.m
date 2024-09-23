@implementation BEChromeRootView

- (_TtC5Books16BEChromeRootView)initWithCoder:(id)a3
{
  _TtC5Books16BEChromeRootView *result;

  result = (_TtC5Books16BEChromeRootView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000010, 0x80000001007BAE10, "Books/BEChromeRootView.swift", 28, 2, 20, 0);
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC5Books16BEChromeRootView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = BEChromeRootView.hitTest(_:with:)((uint64_t)a4, x, y);

  return v10;
}

- (_TtC5Books16BEChromeRootView)initWithFrame:(CGRect)a3
{
  _TtC5Books16BEChromeRootView *result;

  result = (_TtC5Books16BEChromeRootView *)_swift_stdlib_reportUnimplementedInitializer("Books.BEChromeRootView", 22, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC5Books16BEChromeRootView_actionMenuState));
}

@end
