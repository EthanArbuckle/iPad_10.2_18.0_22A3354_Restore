@implementation SiriAnalyticsClockInactivityScheduler

- (SiriAnalyticsClockInactivityScheduler)initWithSeconds:(int64_t)a3 queue:(id)a4 expiration:(id)a5 creation:(id)a6
{
  void *v8;
  void *v9;
  id v10;

  v8 = _Block_copy(a5);
  v9 = _Block_copy(a6);
  *(_QWORD *)(swift_allocObject() + 16) = v8;
  if (v9)
    *(_QWORD *)(swift_allocObject() + 16) = v9;
  v10 = a4;
  return (SiriAnalyticsClockInactivityScheduler *)ClockInactivityScheduler.init(seconds:queue:expiration:creation:)();
}

- (void)startScheduling
{
  SiriAnalyticsClockInactivityScheduler *v2;

  v2 = self;
  sub_1A028A378();

}

- (void)destroyInactivityTimer
{
  SiriAnalyticsClockInactivityScheduler *v2;

  v2 = self;
  sub_1A028A418();

}

- (void)clockExpiredWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  SiriAnalyticsClockInactivityScheduler *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_1A028ABA0;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_1A028A538((uint64_t)v7, v6);
  sub_1A0276D84((uint64_t)v7);

}

- (void)clockForcefullyDestroyedWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  SiriAnalyticsClockInactivityScheduler *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_1A0276DB8;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_1A028A614((uint64_t)v7, v6);
  sub_1A0276D84((uint64_t)v7);

}

- (void)clockCreated
{
  SiriAnalyticsClockInactivityScheduler *v2;

  v2 = self;
  sub_1A028A784();

}

- (SiriAnalyticsClockInactivityScheduler)init
{
  ClockInactivityScheduler.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___SiriAnalyticsClockInactivityScheduler_interval;
  v4 = OUTLINED_FUNCTION_6_11();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  sub_1A0276D84(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SiriAnalyticsClockInactivityScheduler_creation));
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
}

@end
