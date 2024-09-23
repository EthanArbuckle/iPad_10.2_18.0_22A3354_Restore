@implementation TTRIRemindersBoardCompletedHeaderView

- (_TtC9Reminders37TTRIRemindersBoardCompletedHeaderView)initWithFrame:(CGRect)a3
{
  _TtC9Reminders37TTRIRemindersBoardCompletedHeaderView *result;

  sub_1004DB194(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
  return result;
}

- (_TtC9Reminders37TTRIRemindersBoardCompletedHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004DBA44();
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC9Reminders37TTRIRemindersBoardCompletedHeaderView *v3;

  v3 = self;
  sub_1004DB624((uint64_t)v3, v2);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSArray)accessibilityElements
{
  _TtC9Reminders37TTRIRemindersBoardCompletedHeaderView *v2;
  uint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = sub_1004DB78C();

  if (v3)
  {
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (NSString)accessibilityLabel
{
  _TtC9Reminders37TTRIRemindersBoardCompletedHeaderView *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1004DB85C();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (_TtC9Reminders37TTRIRemindersBoardCompletedHeaderView)initWithArrangedSubviews:(id)a3
{
  _TtC9Reminders37TTRIRemindersBoardCompletedHeaderView *result;

  result = (_TtC9Reminders37TTRIRemindersBoardCompletedHeaderView *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIRemindersBoardCompletedHeaderView", 47, "init(arrangedSubviews:)", 23, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)&self->configuration[OBJC_IVAR____TtC9Reminders37TTRIRemindersBoardCompletedHeaderView_configuration
                                     + 16];
  v4 = *(_QWORD *)&self->configuration[OBJC_IVAR____TtC9Reminders37TTRIRemindersBoardCompletedHeaderView_configuration
                                     + 24];
  v5 = *(_QWORD *)&self->configuration[OBJC_IVAR____TtC9Reminders37TTRIRemindersBoardCompletedHeaderView_configuration
                                     + 32];
  v6 = *(_QWORD *)&self->configuration[OBJC_IVAR____TtC9Reminders37TTRIRemindersBoardCompletedHeaderView_configuration
                                     + 40];
  swift_bridgeObjectRelease(*(_QWORD *)&self->configuration[OBJC_IVAR____TtC9Reminders37TTRIRemindersBoardCompletedHeaderView_configuration]);
  sub_1000381B8(v3, v4);
  sub_1000381B8(v5, v6);

  swift_release();
}

@end
