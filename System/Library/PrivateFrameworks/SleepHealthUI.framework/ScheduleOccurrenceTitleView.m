@implementation ScheduleOccurrenceTitleView

- (_TtC13SleepHealthUI27ScheduleOccurrenceTitleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A9CD8DE8();
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  double v5;
  double v6;
  _TtC13SleepHealthUI27ScheduleOccurrenceTitleView *v7;

  if (a3)
  {
    v7 = self;
    v4 = a3;
    objc_msgSend(v4, sel_bounds);
    sub_1A9CD8A28(v5, v6);

  }
}

- (_TtC13SleepHealthUI27ScheduleOccurrenceTitleView)initWithFrame:(CGRect)a3
{
  _TtC13SleepHealthUI27ScheduleOccurrenceTitleView *result;

  result = (_TtC13SleepHealthUI27ScheduleOccurrenceTitleView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_title));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_subtitle));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_topConstraint));
}

@end
