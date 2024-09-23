@implementation PFMaximumFrequencySchedule

- (PFMaximumFrequencySchedule)initWithInterval:(double)a3
{
  objc_super v4;

  *(double *)((char *)&self->super.isa + OBJC_IVAR___PFMaximumFrequencySchedule_interval) = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MaximumFrequencySchedule();
  return -[PFMaximumFrequencySchedule init](&v4, sel_init);
}

- (PFMaximumFrequencySchedule)initWithFrequency:(int64_t)a3
{
  ScheduleFrequency.interval.getter(a3);
  return -[PFMaximumFrequencySchedule initWithInterval:](self, sel_initWithInterval_);
}

- (BOOL)shouldExecuteOn:(id)a3 previousExecution:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  PFMaximumFrequencySchedule *v14;
  BOOL v15;
  uint64_t v17;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD360);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1A93F738C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A93F7368();
  if (a4)
  {
    sub_1A93F7368();
    v13 = 0;
  }
  else
  {
    v13 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, v13, 1, v9);
  v14 = self;
  v15 = sub_1A91E60D4((uint64_t)v12, (uint64_t)v8);

  sub_1A90AC3A4((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v15;
}

- (PFMaximumFrequencySchedule)init
{
  PFMaximumFrequencySchedule *result;

  result = (PFMaximumFrequencySchedule *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
