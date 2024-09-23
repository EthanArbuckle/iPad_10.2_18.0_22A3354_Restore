@implementation ICNoteTimelineControllerInternal

+ (id)ascendingTimelineSectionsForNoteObjectIds:(id)a3 dates:(id)a4 referenceDate:(id)a5 direction:(int64_t)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(char *, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v7 = sub_1ACA3F9C0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (uint64_t (*)(char *, uint64_t, uint64_t))((char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1AC7C3570(0, (unint64_t *)&qword_1ED6E8570);
  v11 = sub_1ACA42228();
  v12 = sub_1ACA42228();
  sub_1ACA3F990();
  _s7NotesUI32ICNoteTimelineControllerInternalC09ascendingD8Sections3for5dates13referenceDate9directionSaySo0cD7SectionCGSaySo17NSManagedObjectIDCG_Say10Foundation0L0VGAQSo35ICFolderCustomNoteSortTypeDirectionVtFZ_0(v11, v12, v10, a6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t (*)(char *, uint64_t, uint64_t), uint64_t))(v8 + 8))(v10, v7);
  sub_1AC7C3570(0, &qword_1ED6E85D8);
  v13 = (void *)sub_1ACA42210();
  swift_bridgeObjectRelease();
  return v13;
}

+ (void)setTimeZone:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED6E80E0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1ACA3FB04();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v16 - v11;
  sub_1ACA3FAF8();
  if (qword_1ED6E84B0 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v3, (uint64_t)qword_1ED6E86C0);
  sub_1ACA3FA68();
  v14 = sub_1ACA3FA8C();
  v15 = *(_QWORD *)(v14 - 8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v5, 0, 1, v14);
  swift_beginAccess();
  sub_1AC9DF6DC((uint64_t)v5, v13);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
    sub_1ACA3FA74();
  }
  swift_endAccess();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

- (_TtC7NotesUI32ICNoteTimelineControllerInternal)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[ICNoteTimelineControllerInternal init](&v3, sel_init);
}

@end
