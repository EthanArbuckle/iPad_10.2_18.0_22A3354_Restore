@implementation FMSymbolBulletedListHeaderView

- (NSLayoutYAxisAnchor)firstBaselineAnchor
{
  return (NSLayoutYAxisAnchor *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC6FindMy30FMSymbolBulletedListHeaderView_titleLabel), "firstBaselineAnchor");
}

- (NSLayoutYAxisAnchor)lastBaselineAnchor
{
  return (NSLayoutYAxisAnchor *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC6FindMy30FMSymbolBulletedListHeaderView_separatorView), "bottomAnchor");
}

- (_TtC6FindMy30FMSymbolBulletedListHeaderView)init
{
  return (_TtC6FindMy30FMSymbolBulletedListHeaderView *)sub_1002E07C4();
}

- (_TtC6FindMy30FMSymbolBulletedListHeaderView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC6FindMy30FMSymbolBulletedListHeaderView *result;

  v5 = OBJC_IVAR____TtC6FindMy30FMSymbolBulletedListHeaderView_titleLabel;
  v6 = objc_allocWithZone((Class)UILabel);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  v8 = OBJC_IVAR____TtC6FindMy30FMSymbolBulletedListHeaderView_separatorView;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)UIView), "init");

  result = (_TtC6FindMy30FMSymbolBulletedListHeaderView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMSymbolBulletedListHeaderView.swift", 43, 2, 45, 0);
  __break(1u);
  return result;
}

- (_TtC6FindMy30FMSymbolBulletedListHeaderView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy30FMSymbolBulletedListHeaderView *result;

  result = (_TtC6FindMy30FMSymbolBulletedListHeaderView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMSymbolBulletedListHeaderView", 37, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy30FMSymbolBulletedListHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy30FMSymbolBulletedListHeaderView_separatorView));
}

@end
