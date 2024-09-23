@implementation FMWaitingView

- (_TtC6FindMy13FMWaitingView)init
{
  return (_TtC6FindMy13FMWaitingView *)sub_1003C5440();
}

- (_TtC6FindMy13FMWaitingView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC6FindMy13FMWaitingView *result;

  v5 = OBJC_IVAR____TtC6FindMy13FMWaitingView_title;
  v6 = objc_allocWithZone((Class)UILabel);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  v8 = OBJC_IVAR____TtC6FindMy13FMWaitingView_activityIndicator;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);

  result = (_TtC6FindMy13FMWaitingView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMWaitingView.swift", 26, 2, 36, 0);
  __break(1u);
  return result;
}

- (_TtC6FindMy13FMWaitingView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy13FMWaitingView *result;

  result = (_TtC6FindMy13FMWaitingView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMWaitingView", 20, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
