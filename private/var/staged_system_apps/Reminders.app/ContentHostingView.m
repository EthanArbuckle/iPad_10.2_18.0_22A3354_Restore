@implementation ContentHostingView

- (_TtC9RemindersP33_B98983B1AA1B7BB80BBF7452C6255D2A18ContentHostingView)initWithFrame:(CGRect)a3
{
  return (_TtC9RemindersP33_B98983B1AA1B7BB80BBF7452C6255D2A18ContentHostingView *)sub_1000DF0F8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (_TtC9RemindersP33_B98983B1AA1B7BB80BBF7452C6255D2A18ContentHostingView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC9RemindersP33_B98983B1AA1B7BB80BBF7452C6255D2A18ContentHostingView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC9RemindersP33_B98983B1AA1B7BB80BBF7452C6255D2A18ContentHostingView_contentView);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9RemindersP33_B98983B1AA1B7BB80BBF7452C6255D2A18ContentHostingView_viewHeightDidChangeCancellable) = 0;
  v5 = a3;

  result = (_TtC9RemindersP33_B98983B1AA1B7BB80BBF7452C6255D2A18ContentHostingView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010055F310, "Reminders/TTRIRemindersBoardTipHeaderView.swift", 47, 2, 141, 0);
  __break(1u);
  return result;
}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  return 1;
}

- (CGSize)_layoutSizeThatFits:(CGSize)result fixedAxes:(unint64_t)a4
{
  double v4;

  v4 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC9RemindersP33_B98983B1AA1B7BB80BBF7452C6255D2A18ContentHostingView_contentHeight);
  result.height = v4;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9RemindersP33_B98983B1AA1B7BB80BBF7452C6255D2A18ContentHostingView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9RemindersP33_B98983B1AA1B7BB80BBF7452C6255D2A18ContentHostingView_dummyView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9RemindersP33_B98983B1AA1B7BB80BBF7452C6255D2A18ContentHostingView_viewHeightDidChangeCancellable));
}

@end
