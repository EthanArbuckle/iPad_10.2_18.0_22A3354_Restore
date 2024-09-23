@implementation PhotoLibraryService

- (void)cancelOperationsWithIdentifiers:(id)a3 reply:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED858B40);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  sub_1CAC1C6B0(0, (unint64_t *)&qword_1ED858BE0);
  v10 = sub_1CADC39D4();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v9;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = sub_1CAC2E634;
  *(_QWORD *)(v12 + 24) = v11;
  v13 = sub_1CADC3A88();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v8, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = self;
  v14[5] = v10;
  v14[6] = sub_1CAC2E63C;
  v14[7] = v12;
  swift_retain_n();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1CAD15364((uint64_t)v8, (uint64_t)&unk_1EF980E90, (uint64_t)v14);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)updateKeyAssetOfSocialGroupsWithUUIDs:(NSSet *)a3 reply:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSSet *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED858B40);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_1CADC3A88();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EF980E78;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EF980E80;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_1CACEA6A0((uint64_t)v9, (uint64_t)&unk_1EF980E88, (uint64_t)v14);
  swift_release();
}

- (void)keyAssetFromAssetUUIDs:(NSArray *)a3 inAllAssets:(NSArray *)a4 reply:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSArray *v17;
  NSArray *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED858B40);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_1CADC3A88();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EF980E30;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EF980E38;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain();
  sub_1CACEA6A0((uint64_t)v11, (uint64_t)&unk_1EF980E40, (uint64_t)v16);
  swift_release();
}

- (void)curatedAssetsFromAssetUUIDs:(NSArray *)a3 options:(NSDictionary *)a4 reply:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSArray *v17;
  NSDictionary *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED858B40);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_1CADC3A88();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EF980E10;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EF980E18;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain();
  sub_1CACEA6A0((uint64_t)v11, (uint64_t)&unk_1EF980E20, (uint64_t)v16);
  swift_release();
}

- (void)extendedCuratedAssetsFromAssetUUIDs:(NSArray *)a3 options:(NSDictionary *)a4 reply:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSArray *v17;
  NSDictionary *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED858B40);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_1CADC3A88();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EF980DF0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EF980DF8;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain();
  sub_1CACEA6A0((uint64_t)v11, (uint64_t)&unk_1EF980E00, (uint64_t)v16);
  swift_release();
}

- (void)computeCacheDidLoad:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED858B40);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1CADC3A88();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EF980DD8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EF983DE0;
  v12[5] = v11;
  swift_retain();
  sub_1CACEA6A0((uint64_t)v7, (uint64_t)&unk_1EF980DE0, (uint64_t)v12);
  swift_release();
}

@end
