@implementation REMHashtagLabel_Codable

- (REMHashtagLabel_Codable)initWithName:(id)a3
{
  objc_class *ObjectType;
  void *v5;
  REMHashtagLabel_Codable *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
  v5 = (void *)sub_1A469087C();
  swift_bridgeObjectRelease();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = -[REMHashtagLabel initWithName:](&v8, sel_initWithName_, v5);

  return v6;
}

- (REMHashtagLabel_Codable)initWithName:(id)a3 canonicalName:(id)a4 firstOccurrenceCreationDate:(id)a5 recencyDate:(id)a6 uuidForChangeTracking:(id)a7
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  REMHashtagLabel_Codable *result;
  uint64_t v26;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED243170);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED243190);
  v14 = MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v26 - v17;
  if (a5)
  {
    sub_1A4690084();
    v20 = sub_1A46900B4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v18, 0, 1, v20);
  }
  else
  {
    v19 = sub_1A46900B4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v18, 1, 1, v19);
  }
  if (a6)
  {
    sub_1A4690084();
    v22 = sub_1A46900B4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v16, 0, 1, v22);
  }
  else
  {
    v21 = sub_1A46900B4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v16, 1, 1, v21);
  }
  if (a7)
  {
    sub_1A46900F0();
    v23 = 0;
  }
  else
  {
    v23 = 1;
  }
  v24 = sub_1A46900FC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v12, v23, 1, v24);
  result = (REMHashtagLabel_Codable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
