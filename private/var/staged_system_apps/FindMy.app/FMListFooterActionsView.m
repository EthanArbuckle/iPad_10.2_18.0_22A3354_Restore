@implementation FMListFooterActionsView

- (_TtC6FindMy23FMListFooterActionsView)init
{
  _TtC6FindMy23FMListFooterActionsView *v2;
  objc_super v4;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy23FMListFooterActionsView_actions) = (Class)_swiftEmptyArrayStorage;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMListFooterActionsView();
  v2 = -[FMListFooterActionsView initWithFrame:](&v4, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  -[FMListFooterActionsView setAxis:](v2, "setAxis:", 1);
  -[FMListFooterActionsView setAlignment:](v2, "setAlignment:", 0);

  return v2;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy23FMListFooterActionsView_actions));
}

- (_TtC6FindMy23FMListFooterActionsView)initWithCoder:(id)a3
{
  id v4;
  _TtC6FindMy23FMListFooterActionsView *result;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy23FMListFooterActionsView_actions) = (Class)&_swiftEmptyArrayStorage;
  v4 = a3;

  result = (_TtC6FindMy23FMListFooterActionsView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMListFooterActionsView.swift", 36, 2, 223, 0);
  __break(1u);
  return result;
}

- (_TtC6FindMy23FMListFooterActionsView)initWithFrame:(CGRect)a3
{
  sub_100371220((uint64_t)self, (uint64_t)a2, (uint64_t)"FindMy.FMListFooterActionsView", 30);
}

@end
