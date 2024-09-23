@implementation FMLoadingView

- (_TtC6FindMy13FMLoadingView)init
{
  return (_TtC6FindMy13FMLoadingView *)sub_1000466C8();
}

- (void).cxx_destruct
{

}

- (_TtC6FindMy13FMLoadingView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC6FindMy13FMLoadingView *result;

  v5 = OBJC_IVAR____TtC6FindMy13FMLoadingView_title;
  v6 = objc_allocWithZone((Class)UILabel);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  v8 = OBJC_IVAR____TtC6FindMy13FMLoadingView_activityIndicator;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 101);

  result = (_TtC6FindMy13FMLoadingView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMLoadingView.swift", 26, 2, 36, 0);
  __break(1u);
  return result;
}

- (_TtC6FindMy13FMLoadingView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy13FMLoadingView *result;

  result = (_TtC6FindMy13FMLoadingView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMLoadingView", 20, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

@end
