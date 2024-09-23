@implementation HotReloadStatusHUDWindow

- (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA224HotReloadStatusHUDWindow)initWithWindowScene:(id)a3
{
  return (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA224HotReloadStatusHUDWindow *)sub_53D8C(a3);
}

- (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA224HotReloadStatusHUDWindow)initWithCoder:(id)a3
{
  _TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA224HotReloadStatusHUDWindow *result;

  result = (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA224HotReloadStatusHUDWindow *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000089230, "JSApp/HotReloadStatusHUD.swift", 30, 2, 117, 0);
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t ObjCClassFromMetadata;
  unsigned __int8 v13;
  objc_super v15;

  y = a3.y;
  x = a3.x;
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for HotReloadStatusHUDWindow();
  v7 = v15.receiver;
  v8 = a4;
  v9 = -[HotReloadStatusHUDWindow hitTest:withEvent:](&v15, "hitTest:withEvent:", v8, x, y);
  if (v9)
  {
    v10 = v9;
    v11 = type metadata accessor for HotReloadStatusHUDManager();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v11);
    v13 = objc_msgSend(v10, "isKindOfClass:", ObjCClassFromMetadata, v15.receiver, v15.super_class);

    v7 = v10;
    if ((v13 & 1) != 0)
      return v10;
  }
  else
  {

  }
  v10 = 0;
  return v10;
}

- (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA224HotReloadStatusHUDWindow)initWithFrame:(CGRect)a3
{
  _TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA224HotReloadStatusHUDWindow *result;

  result = (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA224HotReloadStatusHUDWindow *)_swift_stdlib_reportUnimplementedInitializer("JSApp.HotReloadStatusHUDWindow", 30, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA224HotReloadStatusHUDWindow_hudViewController));
}

@end
