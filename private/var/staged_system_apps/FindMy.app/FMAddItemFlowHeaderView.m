@implementation FMAddItemFlowHeaderView

- (_TtC6FindMy23FMAddItemFlowHeaderView)init
{
  return (_TtC6FindMy23FMAddItemFlowHeaderView *)sub_100325790();
}

- (_TtC6FindMy23FMAddItemFlowHeaderView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC6FindMy23FMAddItemFlowHeaderView *result;

  v5 = OBJC_IVAR____TtC6FindMy23FMAddItemFlowHeaderView_headerLabel;
  v6 = objc_allocWithZone((Class)UILabel);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  v8 = OBJC_IVAR____TtC6FindMy23FMAddItemFlowHeaderView_subheaderLabel;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)UILabel), "init");

  result = (_TtC6FindMy23FMAddItemFlowHeaderView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMAddItemFlowHeaderView.swift", 36, 2, 42, 0);
  __break(1u);
  return result;
}

- (_TtC6FindMy23FMAddItemFlowHeaderView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy23FMAddItemFlowHeaderView *result;

  result = (_TtC6FindMy23FMAddItemFlowHeaderView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMAddItemFlowHeaderView", 30, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy23FMAddItemFlowHeaderView_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy23FMAddItemFlowHeaderView_subheaderLabel));
}

@end
