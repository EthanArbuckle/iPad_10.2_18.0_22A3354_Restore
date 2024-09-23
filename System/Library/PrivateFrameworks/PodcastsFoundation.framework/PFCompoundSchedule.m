@implementation PFCompoundSchedule

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
  PFCompoundSchedule *v14;
  char v15;
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
  v15 = sub_1A90A1410(v12, (uint64_t)v8);

  sub_1A90AC3A4((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v15 & 1;
}

- (PFCompoundSchedule)initWithType:(int64_t)a3 children:(id)a4
{
  objc_class *v6;
  objc_super v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEAB8288);
  v6 = (objc_class *)sub_1A93F8310();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PFCompoundSchedule_type) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PFCompoundSchedule_children) = v6;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CompoundSchedule();
  return -[PFCompoundSchedule init](&v8, sel_init);
}

- (PFCompoundSchedule)init
{
  PFCompoundSchedule *result;

  result = (PFCompoundSchedule *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
