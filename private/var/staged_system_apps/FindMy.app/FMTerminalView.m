@implementation FMTerminalView

- (void).cxx_destruct
{
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy14FMTerminalView_delegate);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC6FindMy14FMTerminalView_conditionSubcription));
}

- (void)dealloc
{
  _TtC6FindMy14FMTerminalView *v2;

  v2 = self;
  sub_100009250();
}

- (_TtC6FindMy14FMTerminalView)initWithCoder:(id)a3
{
  char *v5;
  id v6;
  _TtC6FindMy14FMTerminalView *result;

  v5 = (char *)self + OBJC_IVAR____TtC6FindMy14FMTerminalView_delegate;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy14FMTerminalView_isVisible) = 0;
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy14FMTerminalView_isPeopleTab) = 0;
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy14FMTerminalView_state) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy14FMTerminalView_conditionSubcription) = 0;
  v6 = a3;

  result = (_TtC6FindMy14FMTerminalView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMTerminalView.swift", 27, 2, 74, 0);
  __break(1u);
  return result;
}

- (void)handleAction
{
  __asm { BR              X10 }
}

@end
