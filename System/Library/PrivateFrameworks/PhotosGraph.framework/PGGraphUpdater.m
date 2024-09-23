@implementation PGGraphUpdater

- (PGGraphUpdater)initWith:(id)a3
{
  objc_class *ObjectType;
  id v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PGGraphUpdater_graphManager) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = a3;
  return -[PGGraphUpdater init](&v8, sel_init);
}

- (void)applyChangesFrom:(PGGraphUpdate *)a3 progressReporter:(MAProgressReporter *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  PGGraphUpdate *v17;
  MAProgressReporter *v18;
  PGGraphUpdater *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED872E00);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_1CA85B8E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EF9580F0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EF94B660;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_1CA47A6E8((uint64_t)v11, (uint64_t)&unk_1EF958100, (uint64_t)v16);
  swift_release();
}

- (PGGraphUpdater)init
{
  PGGraphUpdater *result;

  result = (PGGraphUpdater *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
