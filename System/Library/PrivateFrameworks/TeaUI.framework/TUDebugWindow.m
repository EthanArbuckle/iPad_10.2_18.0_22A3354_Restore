@implementation TUDebugWindow

- (void)setRootViewController:(id)a3
{
  id v5;
  TUDebugWindow *v6;

  v5 = a3;
  v6 = self;
  DebugWindow.rootViewController.setter(a3);

}

- (void)onWillEnterForeground:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  TUDebugWindow *v9;
  uint64_t v10;

  v4 = sub_1B16B7910();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B16B78E0();
  v9 = self;
  sub_1B13BAB60();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  TUDebugWindow *v6;
  TUDebugWindow *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  DebugWindow.traitCollectionDidChange(_:)(v8);

}

- (UIViewController)rootViewController
{
  TUDebugWindow *v2;
  id v3;

  v2 = self;
  v3 = DebugWindow.rootViewController.getter();

  return (UIViewController *)v3;
}

- (void)onDidBecomeActive
{
  sub_1B1453ACC();
}

- (TUDebugWindow)initWithWindowScene:(id)a3
{
  TUDebugWindow *result;

  DebugWindow.init(windowScene:)(a3);
  return result;
}

- (TUDebugWindow)initWithFrame:(CGRect)a3
{
  return (TUDebugWindow *)DebugWindow.init(frame:)();
}

- (TUDebugWindow)initWithCoder:(id)a3
{
  id v3;
  TUDebugWindow *result;

  v3 = a3;
  DebugWindow.init(coder:)();
  return result;
}

- (void)sendEvent:(id)a3
{
  id v4;
  TUDebugWindow *v5;

  v4 = a3;
  v5 = self;
  DebugWindow.sendEvent(_:)((UIEvent)v4);

}

- (void)motionBegan:(int64_t)a3 withEvent:(id)a4
{
  id v7;
  TUDebugWindow *v8;
  TUDebugWindow *v9;
  UIEvent_optional v10;

  v7 = a4;
  v8 = self;
  v10.is_nil = (char)v8;
  v9 = v8;
  v10.value.super.isa = (Class)a4;
  DebugWindow.motionBegan(_:with:)((UIEventSubtype)a3, v10);

}

- (void).cxx_destruct
{
  sub_1B13C076C((uint64_t)self + OBJC_IVAR___TUDebugWindow_debugDelegate);
  swift_release();
}

- (void)onWillResignActive
{
  sub_1B16AABE0();
}

@end
