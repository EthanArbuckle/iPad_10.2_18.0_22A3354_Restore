@implementation REMHashtagLabelDetailed_Codable

- (REMHashtagLabelDetailed_Codable)initWithName:(id)a3 canonicalName:(id)a4 firstOccurrenceCreationDate:(id)a5 recencyDate:(id)a6 uuidForChangeTracking:(id)a7
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, _QWORD, uint64_t, uint64_t);
  id v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  _QWORD v35[2];

  v35[1] = self;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED243170);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED243190);
  v15 = MEMORY[0x1E0C80A78](v14);
  v17 = (char *)v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)v35 - v18;
  v20 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
  v22 = v21;
  if (a4)
  {
    a4 = (id)_sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
    v24 = v23;
    if (a5)
    {
LABEL_3:
      sub_1A4690084();
      v25 = sub_1A46900B4();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v19, 0, 1, v25);
      goto LABEL_6;
    }
  }
  else
  {
    v24 = 0;
    if (a5)
      goto LABEL_3;
  }
  v26 = sub_1A46900B4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v19, 1, 1, v26);
LABEL_6:
  if (!a6)
  {
    v31 = sub_1A46900B4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v17, 1, 1, v31);
    v32 = a7;
    if (a7)
      goto LABEL_8;
LABEL_10:
    v33 = sub_1A46900FC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v13, 1, 1, v33);
    return (REMHashtagLabelDetailed_Codable *)REMHashtagLabelDetailed_Codable.init(name:canonicalName:firstOccurrenceCreationDate:recencyDate:uuidForChangeTracking:)(v20, v22, (uint64_t)a4, v24, (uint64_t)v19, (uint64_t)v17, (uint64_t)v13);
  }
  sub_1A4690084();
  v27 = sub_1A46900B4();
  v28 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56);
  v29 = a7;
  v28(v17, 0, 1, v27);
  if (!a7)
    goto LABEL_10;
LABEL_8:
  sub_1A46900F0();

  v30 = sub_1A46900FC();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v13, 0, 1, v30);
  return (REMHashtagLabelDetailed_Codable *)REMHashtagLabelDetailed_Codable.init(name:canonicalName:firstOccurrenceCreationDate:recencyDate:uuidForChangeTracking:)(v20, v22, (uint64_t)a4, v24, (uint64_t)v19, (uint64_t)v17, (uint64_t)v13);
}

- (REMHashtagLabelDetailed_Codable)initWithName:(id)a3
{
  REMHashtagLabelDetailed_Codable *result;

  result = (REMHashtagLabelDetailed_Codable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
