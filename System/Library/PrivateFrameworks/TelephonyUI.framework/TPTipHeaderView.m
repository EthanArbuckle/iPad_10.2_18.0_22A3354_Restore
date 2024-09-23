@implementation TPTipHeaderView

- (_TtC11TelephonyUI15TPTipHeaderView)initWithCoder:(id)a3
{
  _OWORD *v4;
  __int128 v5;
  id v6;
  _TtC11TelephonyUI15TPTipHeaderView *result;

  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_separatorEdgeInset);
  v5 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  *v4 = *MEMORY[0x1E0DC49E8];
  v4[1] = v5;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_bottomSeparatorView) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_displaysBottomSeparator) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_hostingView) = 0;
  v6 = a3;

  result = (_TtC11TelephonyUI15TPTipHeaderView *)sub_1BCFE2BA8();
  __break(1u);
  return result;
}

- (_TtC11TelephonyUI15TPTipHeaderView)initWithFrame:(CGRect)a3
{
  _TtC11TelephonyUI15TPTipHeaderView *result;

  result = (_TtC11TelephonyUI15TPTipHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_bottomSeparatorView));

}

@end
