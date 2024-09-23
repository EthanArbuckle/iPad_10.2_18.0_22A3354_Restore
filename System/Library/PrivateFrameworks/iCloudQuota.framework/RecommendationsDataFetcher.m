@implementation RecommendationsDataFetcher

+ (_TtC11iCloudQuota26RecommendationsDataFetcher)shared
{
  if (qword_1EFA5B650 != -1)
    swift_once();
  return (_TtC11iCloudQuota26RecommendationsDataFetcher *)(id)qword_1EFA5B658;
}

- (void)refreshCacheFor:(id)a3
{
  id v4;
  _TtC11iCloudQuota26RecommendationsDataFetcher *v5;

  v4 = a3;
  v5 = self;
  sub_1CDF0EDE8(v4);

}

- (void)refreshCacheFor:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC11iCloudQuota26RecommendationsDataFetcher *v8;
  id v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1CDF16A04;
  }
  else
  {
    v7 = 0;
  }
  v9 = a3;
  v8 = self;
  sub_1CDF0F038(v9, (uint64_t)v6, v7);
  sub_1CDF16960((uint64_t)v6);

}

- (void)fetchServerRecommendationsFor:(id)a3 shouldIgnoreCache:(BOOL)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t (*v12)();
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _TtC11iCloudQuota26RecommendationsDataFetcher *v17;
  id v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B68);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (uint64_t (*)())_Block_copy(a5);
  if (v12)
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = v12;
    v12 = sub_1CDF16CD8;
  }
  else
  {
    v13 = 0;
  }
  v14 = sub_1CDF32DF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = 0;
  *(_QWORD *)(v15 + 24) = 0;
  *(_QWORD *)(v15 + 32) = self;
  *(_QWORD *)(v15 + 40) = a3;
  *(_BYTE *)(v15 + 48) = a4;
  *(_QWORD *)(v15 + 56) = v12;
  *(_QWORD *)(v15 + 64) = v13;
  v16 = a3;
  v17 = self;
  v18 = v16;
  sub_1CDF0DF60((uint64_t)v12);
  sub_1CDF1009C((uint64_t)v11, (uint64_t)&unk_1EFA5AB50, v15);
  swift_release();
  sub_1CDF16960((uint64_t)v12);

}

- (void)fetchRulesetsFor:(id)a3 shouldIgnoreCache:(BOOL)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _TtC11iCloudQuota26RecommendationsDataFetcher *v17;
  id v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B68);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  if (v12)
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = v12;
    v12 = sub_1CDF16980;
  }
  else
  {
    v13 = 0;
  }
  v14 = sub_1CDF32DF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = 0;
  *(_QWORD *)(v15 + 24) = 0;
  *(_QWORD *)(v15 + 32) = self;
  *(_QWORD *)(v15 + 40) = a3;
  *(_BYTE *)(v15 + 48) = a4;
  *(_QWORD *)(v15 + 56) = v12;
  *(_QWORD *)(v15 + 64) = v13;
  v16 = a3;
  v17 = self;
  v18 = v16;
  sub_1CDF0DF60((uint64_t)v12);
  sub_1CDF1009C((uint64_t)v11, (uint64_t)&unk_1EFA5AB48, v15);
  swift_release();
  sub_1CDF16960((uint64_t)v12);

}

- (void)fetchCompletedRecommendationsFor:(id)a3 shouldIgnoreCache:(BOOL)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t (*v12)();
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _TtC11iCloudQuota26RecommendationsDataFetcher *v17;
  id v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B68);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (uint64_t (*)())_Block_copy(a5);
  if (v12)
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = v12;
    v12 = sub_1CDF16CD8;
  }
  else
  {
    v13 = 0;
  }
  v14 = sub_1CDF32DF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = 0;
  *(_QWORD *)(v15 + 24) = 0;
  *(_QWORD *)(v15 + 32) = self;
  *(_QWORD *)(v15 + 40) = a3;
  *(_BYTE *)(v15 + 48) = a4;
  *(_QWORD *)(v15 + 56) = v12;
  *(_QWORD *)(v15 + 64) = v13;
  v16 = a3;
  v17 = self;
  v18 = v16;
  sub_1CDF0DF60((uint64_t)v12);
  sub_1CDF1009C((uint64_t)v11, (uint64_t)&unk_1EFA5AB40, v15);
  swift_release();
  sub_1CDF16960((uint64_t)v12);

}

- (void)fetchClientRecommendationsFor:(id)a3 shouldIgnoreCache:(BOOL)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _TtC11iCloudQuota26RecommendationsDataFetcher *v17;
  id v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2B9B68);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  if (v12)
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = v12;
    v12 = sub_1CDF16970;
  }
  else
  {
    v13 = 0;
  }
  v14 = sub_1CDF32DF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = 0;
  *(_QWORD *)(v15 + 24) = 0;
  *(_QWORD *)(v15 + 32) = self;
  *(_QWORD *)(v15 + 40) = a3;
  *(_BYTE *)(v15 + 48) = a4;
  *(_QWORD *)(v15 + 56) = v12;
  *(_QWORD *)(v15 + 64) = v13;
  v16 = a3;
  v17 = self;
  v18 = v16;
  sub_1CDF0DF60((uint64_t)v12);
  sub_1CDF1009C((uint64_t)v11, (uint64_t)&unk_1EFA5AB38, v15);
  swift_release();
  sub_1CDF16960((uint64_t)v12);

}

- (_TtC11iCloudQuota26RecommendationsDataFetcher)init
{
  uint64_t v3;
  objc_class *v4;
  _TtC11iCloudQuota26RecommendationsDataFetcher *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC11iCloudQuota26RecommendationsDataFetcher_dataFetchers;
  type metadata accessor for DataFetchers();
  v4 = (objc_class *)swift_allocObject();
  v5 = self;
  swift_defaultActor_initialize();
  *((_QWORD *)v4 + 14) = sub_1CDF11264(MEMORY[0x1E0DEE9D8]);
  *(Class *)((char *)&self->super.isa + v3) = v4;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for RecommendationsDataFetcher();
  return -[RecommendationsDataFetcher init](&v7, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
