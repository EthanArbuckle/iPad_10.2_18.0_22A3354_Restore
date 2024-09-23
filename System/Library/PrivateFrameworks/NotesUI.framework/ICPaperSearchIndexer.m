@implementation ICPaperSearchIndexer

+ (id)shared
{
  if (qword_1ED6E74C8 != -1)
    swift_once();
  return (id)qword_1ED6E7F98;
}

- (void)needsToUpdateIndexWithManagedObjectContext:(NSManagedObjectContext *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSManagedObjectContext *v15;
  ICPaperSearchIndexer *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED6E8DB0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_1ACA4230C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = aZ;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EECA0000;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1AC8F1A2C((uint64_t)v9, (uint64_t)aZ_0, (uint64_t)v14);
  swift_release();
}

- (void)updateIndexWithManagedObjectContext:(NSManagedObjectContext *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSManagedObjectContext *v15;
  ICPaperSearchIndexer *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED6E8DB0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_1ACA4230C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EEC9FFD8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = aZ_1;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1AC8F1A2C((uint64_t)v9, (uint64_t)aZ_2, (uint64_t)v14);
  swift_release();
}

- (void)updateIndexForAttachments:(NSSet *)a3 userInitiated:(BOOL)a4 managedObjectContext:(NSManagedObjectContext *)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSSet *v19;
  NSManagedObjectContext *v20;
  ICPaperSearchIndexer *v21;
  uint64_t v22;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED6E8DB0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a3;
  *(_BYTE *)(v15 + 24) = a4;
  *(_QWORD *)(v15 + 32) = a5;
  *(_QWORD *)(v15 + 40) = v14;
  *(_QWORD *)(v15 + 48) = self;
  v16 = sub_1ACA4230C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = aZ_3;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = aZ_4;
  v18[5] = v17;
  v19 = a3;
  v20 = a5;
  v21 = self;
  sub_1AC8F1A2C((uint64_t)v13, (uint64_t)&unk_1EEC9FFC8, (uint64_t)v18);
  swift_release();
}

- (void)updateIndexForAttachment:(NSManagedObjectID *)a3 userInitiated:(BOOL)a4 managedObjectContext:(NSManagedObjectContext *)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSManagedObjectID *v19;
  NSManagedObjectContext *v20;
  ICPaperSearchIndexer *v21;
  uint64_t v22;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED6E8DB0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a3;
  *(_BYTE *)(v15 + 24) = a4;
  *(_QWORD *)(v15 + 32) = a5;
  *(_QWORD *)(v15 + 40) = v14;
  *(_QWORD *)(v15 + 48) = self;
  v16 = sub_1ACA4230C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = a0Z;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = aHZ;
  v18[5] = v17;
  v19 = a3;
  v20 = a5;
  v21 = self;
  sub_1AC8F1A2C((uint64_t)v13, (uint64_t)&unk_1EEC9FFA8, (uint64_t)v18);
  swift_release();
}

- (void)cancelEverythingWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  ICPaperSearchIndexer *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED6E8DB0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1ACA4230C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = aZ_5;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EEC9FF68;
  v12[5] = v11;
  v13 = self;
  sub_1AC8F1A2C((uint64_t)v7, (uint64_t)&unk_1EEC9FF78, (uint64_t)v12);
  swift_release();
}

- (ICPaperSearchIndexer)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICPaperSearchIndexer____lazy_storage___queue) = 0;
  v3.receiver = self;
  v3.super_class = (Class)ICPaperSearchIndexer;
  return -[ICPaperSearchIndexer init](&v3, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
