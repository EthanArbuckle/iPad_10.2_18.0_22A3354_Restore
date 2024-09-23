@implementation PFScheduledOperationScheduler

- (void)evaluateOperationWithIdentifier:(id)a3 evaluationHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  PFScheduledOperationScheduler *v9;

  v5 = _Block_copy(a4);
  v6 = sub_1A93F8040();
  v8 = v7;
  _Block_copy(v5);
  v9 = self;
  sub_1A90C7668(v6, v8, (uint64_t)v9, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

+ (PFScheduledOperationScheduler)weeklyScheduler
{
  if (qword_1ED2A4870 != -1)
    swift_once();
  return (PFScheduledOperationScheduler *)(id)qword_1ED2A7C20;
}

- (PFScheduledOperationScheduler)initWithSchedule:(id)a3 scheduleStorage:(id)a4
{
  swift_getObjectType();
  swift_getObjectType();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return (PFScheduledOperationScheduler *)sub_1A91D2AE0((uint64_t)a3, (uint64_t)a4, (char *)self);
}

- (PFScheduledOperationScheduler)init
{
  PFScheduledOperationScheduler *result;

  result = (PFScheduledOperationScheduler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end
