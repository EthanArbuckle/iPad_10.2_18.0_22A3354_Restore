@implementation SleepScheduleComponentsEditView

- (_TtC13SleepHealthUI31SleepScheduleComponentsEditView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A9BD8F8C();
}

- (void)willMoveToWindow:(id)a3
{
  id v5;
  _TtC13SleepHealthUI31SleepScheduleComponentsEditView *v6;

  v5 = a3;
  v6 = self;
  sub_1A9BD6078(a3);

}

- (void)layoutSubviews
{
  _TtC13SleepHealthUI31SleepScheduleComponentsEditView *v2;

  v2 = self;
  sub_1A9BD656C();

}

- (void)clockDidChange:(id)a3
{
  id v4;
  _TtC13SleepHealthUI31SleepScheduleComponentsEditView *v5;

  v4 = a3;
  v5 = self;
  sub_1A9BD6ED4((uint64_t)v4);

}

- (id)accessibilityComponentsHeader
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC13SleepHealthUI31SleepScheduleComponentsEditView_componentsHeader));
}

- (id)accessibilityClock
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC13SleepHealthUI31SleepScheduleComponentsEditView_clock));
}

- (id)accessibilityClockCaption
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC13SleepHealthUI31SleepScheduleComponentsEditView_clockCaption));
}

- (id)accessibilityTimeInBedLabel
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC13SleepHealthUI31SleepScheduleComponentsEditView_timeInBed));
}

- (_TtC13SleepHealthUI31SleepScheduleComponentsEditView)initWithFrame:(CGRect)a3
{
  _TtC13SleepHealthUI31SleepScheduleComponentsEditView *result;

  result = (_TtC13SleepHealthUI31SleepScheduleComponentsEditView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A9BD9114((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI31SleepScheduleComponentsEditView_model);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI31SleepScheduleComponentsEditView_componentsHeader));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI31SleepScheduleComponentsEditView_clock));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI31SleepScheduleComponentsEditView_timeInBed));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI31SleepScheduleComponentsEditView_clockCaption));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI31SleepScheduleComponentsEditView_clockWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI31SleepScheduleComponentsEditView_captionTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI31SleepScheduleComponentsEditView____lazy_storage___formatter));
}

@end
