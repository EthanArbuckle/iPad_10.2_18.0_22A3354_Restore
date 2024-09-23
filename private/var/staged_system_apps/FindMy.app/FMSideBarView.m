@implementation FMSideBarView

- (_TtC6FindMy13FMSideBarView)init
{
  uint64_t v3;
  id v4;
  _TtC6FindMy13FMSideBarView *v5;
  _TtC6FindMy13FMSideBarView *v6;
  objc_super v8;

  v3 = OBJC_IVAR____TtC6FindMy13FMSideBarView_blurredBackground;
  v4 = objc_allocWithZone((Class)UIVisualEffectView);
  v5 = self;
  *(Class *)((char *)&self->super.super.super.isa + v3) = (Class)objc_msgSend(v4, "init");

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for FMSideBarView();
  v6 = -[FMSideBarView initWithFrame:](&v8, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  sub_10033EA40();
  sub_10033EBF8();

  return v6;
}

- (_TtC6FindMy13FMSideBarView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC6FindMy13FMSideBarView *result;

  v5 = OBJC_IVAR____TtC6FindMy13FMSideBarView_blurredBackground;
  v6 = objc_allocWithZone((Class)UIVisualEffectView);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC6FindMy13FMSideBarView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMSideBarView.swift", 26, 2, 32, 0);
  __break(1u);
  return result;
}

- (_TtC6FindMy13FMSideBarView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy13FMSideBarView *result;

  result = (_TtC6FindMy13FMSideBarView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMSideBarView", 20, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
