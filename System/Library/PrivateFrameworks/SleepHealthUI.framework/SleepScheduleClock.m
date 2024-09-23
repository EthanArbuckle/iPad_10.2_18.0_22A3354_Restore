@implementation SleepScheduleClock

- (_TtC13SleepHealthUI18SleepScheduleClock)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A9C29E94();
}

- (void)layoutSubviews
{
  _TtC13SleepHealthUI18SleepScheduleClock *v2;

  v2 = self;
  sub_1A9C2557C();

}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4;
  _TtC13SleepHealthUI18SleepScheduleClock *v5;

  v4 = a3;
  v5 = self;
  sub_1A9C257A4((uint64_t)v4);

}

- (id)accessibilityBedtimeHand
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_bedtimeHand));
}

- (id)accessibilityWakeUpHand
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_wakeUpHand));
}

- (BOOL)accessibilityIsForSingleDayOverride
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_model;
  swift_beginAccess();
  return v2[42];
}

- (BOOL)accessibilityAlarmEnabled
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_model;
  swift_beginAccess();
  return v2[41];
}

- (double)accessibilityTimeInBed
{
  double result;

  sub_1A9C25D3C();
  return result;
}

- (double)accessibilityTimeInBedGoal
{
  double *v2;
  double result;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_model);
  swift_beginAccess();
  result = v2[4];
  if (*((_BYTE *)v2 + 40))
    return 0.0;
  return result;
}

- (_TtC13SleepHealthUI18SleepScheduleClock)initWithFrame:(CGRect)a3
{
  _TtC13SleepHealthUI18SleepScheduleClock *result;

  result = (_TtC13SleepHealthUI18SleepScheduleClock *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _BYTE __dst[392];

  memcpy(__dst, (char *)self + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_configuration, sizeof(__dst));
  sub_1A9BD7B58((uint64_t)__dst);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_gestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_track));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_ring));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_grabber));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_dial));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_bedtimeHand));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_wakeUpHand));
  sub_1A9C2A678((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_majorFeedbackGenerator);
  sub_1A9C2A678((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_minorFeedbackGenerator);
  objc_release(*(id *)((char *)&self->super.super._animationInfo
                     + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_dragState));
}

- (void)accessibilitySetModel:(id)a3 wakeUpComponents:(id)a4 timeInBedGoal:(double)a5 alarmEnabled:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  _TtC13SleepHealthUI18SleepScheduleClock *v18;
  void *v19;
  void *v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;

  v6 = a6;
  v9 = sub_1A9CE60C0();
  v10 = *(_QWORD *)(v9 - 8);
  v12 = MEMORY[0x1E0C80A78](v9, v11);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12, v15);
  v17 = (char *)&v22 - v16;
  sub_1A9CE6024();
  sub_1A9CE6024();
  v18 = self;
  v19 = (void *)sub_1A9CE6018();
  v20 = (void *)sub_1A9CE6018();
  -[SleepScheduleClock accessibilitySetModel:wakeUpComponents:timeInBedGoal:alarmEnabled:isForSingleDayOverride:](v18, sel_accessibilitySetModel_wakeUpComponents_timeInBedGoal_alarmEnabled_isForSingleDayOverride_, v19, v20, v6, 0, a5);

  v21 = *(void (**)(char *, uint64_t))(v10 + 8);
  v21(v14, v9);
  v21(v17, v9);
}

- (void)accessibilitySetModel:(id)a3 wakeUpComponents:(id)a4 timeInBedGoal:(double)a5 alarmEnabled:(BOOL)a6 isForSingleDayOverride:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  double v21;
  double v22;
  _TtC13SleepHealthUI18SleepScheduleClock *v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;

  v7 = a7;
  v8 = a6;
  v11 = sub_1A9CE60C0();
  v12 = *(_QWORD *)(v11 - 8);
  v14 = MEMORY[0x1E0C80A78](v11, v13);
  v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14, v17);
  v19 = (char *)&v25 - v18;
  sub_1A9CE6024();
  sub_1A9CE6024();
  v20 = *(_QWORD *)&a5;
  v21 = *(double *)((char *)&self->super.super._minimumSafeAreaInsets.bottom
                  + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_configuration);
  v22 = *(double *)((char *)&self->super.super._minimumSafeAreaInsets.right
                  + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_configuration);
  swift_beginAccess();
  v23 = self;
  sub_1A9C6C394((uint64_t)v19, (uint64_t)v16, v20, 0, v8, v7, v21, v22);
  swift_endAccess();
  sub_1A9C24914();
  -[SleepScheduleClock sendActionsForControlEvents:](v23, sel_sendActionsForControlEvents_, 0x40000);
  sub_1A9C24914();

  v24 = *(void (**)(char *, uint64_t))(v12 + 8);
  v24(v16, v11);
  v24(v19, v11);
}

- (id)accessibilityRoundedBedtimeComponents
{
  return sub_1A9C26554((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t, double))sub_1A9C6BD5C);
}

- (id)accessibilityRoundedWakeUpComponents
{
  return sub_1A9C26554((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t, double))sub_1A9C6BF60);
}

- (void)gestureReconizerDidChange:(id)a3
{
  id v4;
  _TtC13SleepHealthUI18SleepScheduleClock *v5;

  v4 = a3;
  v5 = self;
  sub_1A9C26C64(v4);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  char *v4;

  v4 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_dragState;
  swift_beginAccess();
  return *((_QWORD *)v4 + 5) == 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC13SleepHealthUI18SleepScheduleClock *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  CGPoint v15;
  CGPoint v16;
  CGRect v17;
  CGRect v18;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_msgSend(v7, sel_locationInView_, v8);
  v10 = v9;
  v12 = v11;
  objc_msgSend(*(id *)((char *)&v8->super.super.super.super.isa + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_bedtimeHand), sel_frame);
  v15.x = v10;
  v15.y = v12;
  v13 = CGRectContainsPoint(v17, v15)
     || (objc_msgSend(*(id *)((char *)&v8->super.super.super.super.isa+ OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_wakeUpHand), sel_frame), v16.x = v10, v16.y = v12, CGRectContainsPoint(v18, v16))|| sub_1A9C27560(v10, v12);

  return v13;
}

- (void)gestureRecognizerDidStart:(id)a3
{
  id v4;
  _TtC13SleepHealthUI18SleepScheduleClock *v5;

  v4 = a3;
  v5 = self;
  sub_1A9C27984(v4);

}

- (void)gestureRecognizerDidMove:(id)a3
{
  id v4;
  _TtC13SleepHealthUI18SleepScheduleClock *v5;

  v4 = a3;
  v5 = self;
  sub_1A9C28104(v4);

}

- (void)gestureRecognizerDidEnd:(id)a3
{
  id v4;
  _TtC13SleepHealthUI18SleepScheduleClock *v5;

  v4 = a3;
  v5 = self;
  sub_1A9C2A008();

}

- (double)accessibilityMinimumTimeInBed
{
  return *(double *)((char *)&self->super.super._minimumSafeAreaInsets.bottom
                   + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_configuration);
}

- (double)accessibilityMaximumTimeInBed
{
  return *(double *)((char *)&self->super.super._minimumSafeAreaInsets.right
                   + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_configuration);
}

- (void)accessibilitySetBedtimeAngle:(double)a3 minimumTimeInBed:(double)a4 maximumTimeInBed:(double)a5
{
  _TtC13SleepHealthUI18SleepScheduleClock *v8;

  swift_beginAccess();
  v8 = self;
  sub_1A9C6CA40(a3, a4, a4);
  sub_1A9C24914();

}

- (void)accessibilitySetWakeupAngle:(double)a3 minimumTimeInBed:(double)a4 maximumTimeInBed:(double)a5
{
  char *v8;
  _TtC13SleepHealthUI18SleepScheduleClock *v9;
  uint64_t v10;

  v8 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_model;
  swift_beginAccess();
  v9 = self;
  *((_QWORD *)v8 + 2) = sub_1A9C6C888(a3);
  *((_QWORD *)v8 + 3) = v10;
  sub_1A9C6D304(a4, a4);
  sub_1A9C24914();

}

@end
