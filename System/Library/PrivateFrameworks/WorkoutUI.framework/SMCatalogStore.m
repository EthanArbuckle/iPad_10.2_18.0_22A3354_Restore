@implementation SMCatalogStore

- (id)init:(id)a3
{
  return CatalogStore.init(_:)(a3);
}

- (void)queryFeaturedCatalogLockupsWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  SMCatalogStore *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_24A770BE4((uint64_t)sub_24A773D34, v5);

  swift_release();
}

- (void)queryCatalogWorkoutDetail:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  SMCatalogStore *v10;

  v5 = _Block_copy(a4);
  v6 = sub_24A77B9B0();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = self;
  sub_24A7713C8(v6, v8, (uint64_t)sub_24A68BD9C, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)catalogResetSyncWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  SMCatalogStore *v11;
  uint64_t v12;
  void (*v13)(uint64_t (*)(uint64_t), uint64_t);
  uint64_t v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257949500);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  v11 = self;
  sub_24A771C58((uint64_t)v8);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = sub_24A773D28;
  *(_QWORD *)(v12 + 24) = v10;
  swift_retain();
  v13 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_24A778F50();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = sub_24A77406C;
  *(_QWORD *)(v14 + 24) = v12;
  swift_retain();
  v13(sub_24A68B610, v14);
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  swift_release();
}

- (void)handleCatalogResetSyncNotificationWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  SMCatalogStore *v12;
  void (*v13)(uint64_t (*)(uint64_t), uint64_t);
  uint64_t v14;
  uint64_t v15;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257949500);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24A778428();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A778410();
  v12 = self;
  sub_24A771C58((uint64_t)v7);
  v13 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_24A778F50();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = sub_24A7718F0;
  *(_QWORD *)(v14 + 24) = 0;
  v13(sub_24A68B610, v14);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (SMCatalogStore)init
{
  SMCatalogStore *result;

  result = (SMCatalogStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___SMCatalogStore_assetClient);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___SMCatalogStore_catalogClient);
  v3 = (char *)self + OBJC_IVAR___SMCatalogStore_calendar;
  v4 = sub_24A778968();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___SMCatalogStore_contentRestrictionObserver);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___SMCatalogStore_mediaTagStringBuilder);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___SMCatalogStore_bookmarkClient);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___SMCatalogStore_recommendationClient);
}

@end
