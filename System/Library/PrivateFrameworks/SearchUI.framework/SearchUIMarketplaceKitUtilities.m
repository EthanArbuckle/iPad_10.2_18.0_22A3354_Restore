@implementation SearchUIMarketplaceKitUtilities

+ (void)requestProductPageWithDistributorID:(NSString *)a3 itemID:(unint64_t)a4 versionID:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSString *v19;
  uint64_t v20;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4D4410);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = a1;
  v16 = sub_1DAE0D650();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1F029E108;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1F029E110;
  v18[5] = v17;
  v19 = a3;
  sub_1DADFDE48((uint64_t)v13, (uint64_t)&unk_1F029E118, (uint64_t)v18);
  swift_release();
}

+ (void)requestSearchPageWithDistributorID:(NSString *)a3 searchString:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSString *v17;
  NSString *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4D4410);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = a1;
  v14 = sub_1DAE0D650();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1F029E0F8;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1F029DA20;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  sub_1DADFDE48((uint64_t)v11, (uint64_t)&unk_1F029DA28, (uint64_t)v16);
  swift_release();
}

- (_TtC8SearchUI31SearchUIMarketplaceKitUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchUIMarketplaceKitUtilities();
  return -[SearchUIMarketplaceKitUtilities init](&v3, sel_init);
}

@end
