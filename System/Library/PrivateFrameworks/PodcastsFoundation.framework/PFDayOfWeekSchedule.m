@implementation PFDayOfWeekSchedule

- (BOOL)shouldExecuteOn:(id)a3 previousExecution:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  PFDayOfWeekSchedule *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v6 = sub_1A93F747C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD360);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1A93F738C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A93F7368();
  if (a4)
  {
    sub_1A93F7368();
    v17 = 0;
  }
  else
  {
    v17 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, v17, 1, v13);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E0CB1198], v6);
  v18 = self;
  v19 = sub_1A93F7488();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v20 = *(uint64_t *)((char *)&v18->super.isa + OBJC_IVAR___PFDayOfWeekSchedule_dayOfWeek);

  sub_1A90AC3A4((uint64_t)v12);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  return v19 == v20;
}

+ (PFDayOfWeekSchedule)firstDayOfWeek
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  objc_class *v11;
  char *v12;
  id v13;
  void (*v14)(char *, uint64_t);
  objc_super v16;

  v2 = sub_1A93F7494();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v16 - v7;
  sub_1A93F7470();
  v9 = sub_1A93F741C();
  v10 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v10(v5, v8, v2);
  v11 = (objc_class *)type metadata accessor for DayOfWeekSchedule();
  v12 = (char *)objc_allocWithZone(v11);
  *(_QWORD *)&v12[OBJC_IVAR___PFDayOfWeekSchedule_dayOfWeek] = v9;
  v10(&v12[OBJC_IVAR___PFDayOfWeekSchedule_calendar], v5, v2);
  v16.receiver = v12;
  v16.super_class = v11;
  v13 = objc_msgSendSuper2(&v16, sel_init);
  v14 = *(void (**)(char *, uint64_t))(v3 + 8);
  v14(v5, v2);
  v14(v8, v2);
  return (PFDayOfWeekSchedule *)v13;
}

- (PFDayOfWeekSchedule)initWithDayOfWeek:(int64_t)a3 calendar:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  objc_class *v10;
  PFDayOfWeekSchedule *v11;
  objc_super v13;

  v6 = sub_1A93F7494();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A93F7458();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PFDayOfWeekSchedule_dayOfWeek) = (Class)a3;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)self + OBJC_IVAR___PFDayOfWeekSchedule_calendar, v9, v6);
  v10 = (objc_class *)type metadata accessor for DayOfWeekSchedule();
  v13.receiver = self;
  v13.super_class = v10;
  v11 = -[PFDayOfWeekSchedule init](&v13, sel_init);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v11;
}

- (PFDayOfWeekSchedule)init
{
  PFDayOfWeekSchedule *result;

  result = (PFDayOfWeekSchedule *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___PFDayOfWeekSchedule_calendar;
  v3 = sub_1A93F7494();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
