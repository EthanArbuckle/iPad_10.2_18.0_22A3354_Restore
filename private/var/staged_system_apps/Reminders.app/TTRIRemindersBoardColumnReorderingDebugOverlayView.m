@implementation TTRIRemindersBoardColumnReorderingDebugOverlayView

- (_TtC9Reminders50TTRIRemindersBoardColumnReorderingDebugOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC9Reminders50TTRIRemindersBoardColumnReorderingDebugOverlayView *)sub_1003E134C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (_TtC9Reminders50TTRIRemindersBoardColumnReorderingDebugOverlayView)initWithCoder:(id)a3
{
  id v4;
  _TtC9Reminders50TTRIRemindersBoardColumnReorderingDebugOverlayView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9Reminders50TTRIRemindersBoardColumnReorderingDebugOverlayView_activeReorderingContext) = 0;
  v4 = a3;

  result = (_TtC9Reminders50TTRIRemindersBoardColumnReorderingDebugOverlayView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010055F310, "Reminders/TTRIRemindersBoardColumnReorderingDebugOverlayView.swift", 66, 2, 80, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders50TTRIRemindersBoardColumnReorderingDebugOverlayView_activeReorderingContext));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders50TTRIRemindersBoardColumnReorderingDebugOverlayView_infoLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders50TTRIRemindersBoardColumnReorderingDebugOverlayView_pointView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders50TTRIRemindersBoardColumnReorderingDebugOverlayView_borderView));
}

@end
