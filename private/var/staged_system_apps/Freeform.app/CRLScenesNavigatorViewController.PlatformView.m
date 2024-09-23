@implementation CRLScenesNavigatorViewController.PlatformView

- (_TtCC8Freeform32CRLScenesNavigatorViewController12PlatformView)initWithCoder:(id)a3
{
  id v5;
  _TtCC8Freeform32CRLScenesNavigatorViewController12PlatformView *result;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtCC8Freeform32CRLScenesNavigatorViewController12PlatformView_owningViewController, 0);
  v5 = a3;

  result = (_TtCC8Freeform32CRLScenesNavigatorViewController12PlatformView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100FAD6F0, "Freeform/CRLScenesNavigatorViewController.swift", 47, 2, 1193, 0);
  __break(1u);
  return result;
}

- (void)updateConstraints
{
  char *v2;
  uint64_t Strong;
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLScenesNavigatorViewController.PlatformView();
  v2 = (char *)v5.receiver;
  -[CRLScenesNavigatorViewController.PlatformView updateConstraints](&v5, "updateConstraints");
  Strong = swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtCC8Freeform32CRLScenesNavigatorViewController12PlatformView_owningViewController]);
  if (Strong)
  {
    v4 = (char *)Strong;
    sub_100B6A308();

    v2 = v4;
  }

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtCC8Freeform32CRLScenesNavigatorViewController12PlatformView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_100B75438((uint64_t)a4, x, y);

  return v10;
}

- (_TtCC8Freeform32CRLScenesNavigatorViewController12PlatformView)initWithFrame:(CGRect)a3
{
  _TtCC8Freeform32CRLScenesNavigatorViewController12PlatformView *result;

  result = (_TtCC8Freeform32CRLScenesNavigatorViewController12PlatformView *)_swift_stdlib_reportUnimplementedInitializer("Freeform.PlatformView", 21, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtCC8Freeform32CRLScenesNavigatorViewController12PlatformView_owningViewController);
}

@end
