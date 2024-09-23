@implementation HotReloadStatusHUDView

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HotReloadStatusHUDView();
  -[HotReloadStatusHUDView frame](&v6, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for HotReloadStatusHUDView();
  v7 = v8.receiver;
  -[HotReloadStatusHUDView setFrame:](&v8, "setFrame:", x, y, width, height);
  sub_53324();

}

- (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA222HotReloadStatusHUDView)initWithFrame:(CGRect)a3
{
  return (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA222HotReloadStatusHUDView *)sub_53414(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA222HotReloadStatusHUDView)initWithCoder:(id)a3
{
  _TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA222HotReloadStatusHUDView *result;

  result = (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA222HotReloadStatusHUDView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000089230, "JSApp/HotReloadStatusHUD.swift", 30, 2, 60, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA222HotReloadStatusHUDView_activityIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA222HotReloadStatusHUDView_label));
}

@end
