@implementation RecommendationAnalyticsHelper

- (_TtC13iCloudQuotaUI29RecommendationAnalyticsHelper)initWithAccount:(id)a3
{
  id v3;
  _TtC13iCloudQuotaUI29RecommendationAnalyticsHelper *v4;

  v3 = a3;
  v4 = (_TtC13iCloudQuotaUI29RecommendationAnalyticsHelper *)sub_21F389E78(v3);

  return v4;
}

- (void)sendRecommendedForYouTapEventWithCompletionHandler:(id)a3
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

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554C1040);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_21F456268();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2554C1F90;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2554C1F98;
  v12[5] = v11;
  swift_retain();
  sub_21F388738((uint64_t)v7, (uint64_t)&unk_2554C1FA0, (uint64_t)v12);
  swift_release();
}

- (void)sendiCloudSettingsDisplayedEventWithCompletionHandler:(id)a3
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

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554C1040);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_21F456268();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2554C1F70;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2554C1F78;
  v12[5] = v11;
  swift_retain();
  sub_21F388738((uint64_t)v7, (uint64_t)&unk_2554C1F80, (uint64_t)v12);
  swift_release();
}

- (void)sendManageStorageDisplayedEventWithCompletionHandler:(id)a3
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

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554C1040);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_21F456268();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2554C1F30;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2554C1F40;
  v12[5] = v11;
  swift_retain();
  sub_21F388738((uint64_t)v7, (uint64_t)&unk_2554C1F50, (uint64_t)v12);
  swift_release();
}

- (_TtC13iCloudQuotaUI29RecommendationAnalyticsHelper)init
{
  _TtC13iCloudQuotaUI29RecommendationAnalyticsHelper *result;

  swift_defaultActor_initialize();
  result = (_TtC13iCloudQuotaUI29RecommendationAnalyticsHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
