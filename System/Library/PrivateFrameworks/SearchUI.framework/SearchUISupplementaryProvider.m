@implementation SearchUISupplementaryProvider

+ (void)registerSupplementariesForCollectionView:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DADDE394(v3);

}

+ (id)viewForSupplementaryOfKind:(id)a3 atIndexPath:(id)a4 forSectionModel:(id)a5 controller:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v19;

  v8 = sub_1DAE0C858();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1DAE0D53C();
  v14 = v13;
  sub_1DAE0C840();
  v15 = a5;
  v16 = a6;
  v17 = sub_1DADDE56C(v12, v14, (uint64_t)v11, v15, v16);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v17;
}

+ (id)sectionForHeaderView:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v13;

  v4 = type metadata accessor for Header();
  MEMORY[0x1E0C80A78](v4);
  v6 = (id *)((char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B448);
  v7 = swift_dynamicCastClass();
  if (!v7)
    return 0;
  v8 = *(void **)(v7 + qword_1ED4D4460);
  v9 = a3;
  v10 = v8;
  sub_1DAE0CB88();

  v11 = v6[8];
  sub_1DADDE8B8((uint64_t)v6);

  return v11;
}

+ (unint64_t)headerTypeForHeaderView:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  v4 = sub_1DADDE720();

  return v4;
}

- (SearchUISupplementaryProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUISupplementaryProvider;
  return -[SearchUISupplementaryProvider init](&v3, sel_init);
}

@end
