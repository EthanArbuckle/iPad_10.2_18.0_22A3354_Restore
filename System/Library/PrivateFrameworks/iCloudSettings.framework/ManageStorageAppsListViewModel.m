@implementation ManageStorageAppsListViewModel

+ (NSString)ViewModelDidUpdateNotificationName
{
  if (qword_257998788 != -1)
    swift_once();
  return (NSString *)(id)qword_2579998A8;
}

- (void)handleQuotaChangeNotification
{
  _TtC14iCloudSettings30ManageStorageAppsListViewModel *v2;

  v2 = self;
  ManageStorageAppsListViewModel.handleQuotaChangeNotification()();

}

- (void)fetchAppsListWithFetchHomeViewModel:(BOOL)a3 loadImages:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _TtC14iCloudSettings30ManageStorageAppsListViewModel *v17;
  uint64_t v18;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544D8D80);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = swift_allocObject();
  *(_BYTE *)(v13 + 16) = a3;
  *(_BYTE *)(v13 + 17) = a4;
  *(_QWORD *)(v13 + 24) = v12;
  *(_QWORD *)(v13 + 32) = self;
  v14 = sub_24B5E4464();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_257999BB8;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_257999560;
  v16[5] = v15;
  v17 = self;
  sub_24B57DBC0((uint64_t)v11, (uint64_t)&unk_257999568, (uint64_t)v16);
  swift_release();
}

- (id)expandedSubTitleForDataclass:(id)a3
{
  _TtC14iCloudSettings30ManageStorageAppsListViewModel *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = self;
  v5 = a3;
  ManageStorageAppsListViewModel.expandedSubTitle(forDataclass:)(v5);
  v7 = v6;

  if (v7)
  {
    v8 = (void *)sub_24B5E42C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)expandedSubTitleForLiverpoolBundleId:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC14iCloudSettings30ManageStorageAppsListViewModel *v7;
  Swift::String v8;
  void *object;
  void *v10;

  v4 = sub_24B5E42F0();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  object = ManageStorageAppsListViewModel.expandedSubTitle(forLiverpoolBundleId:)(v8).value._object;
  swift_bridgeObjectRelease();

  if (object)
  {
    v10 = (void *)sub_24B5E42C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (_TtC14iCloudSettings30ManageStorageAppsListViewModel)init
{
  _TtC14iCloudSettings30ManageStorageAppsListViewModel *result;

  result = (_TtC14iCloudSettings30ManageStorageAppsListViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings30ManageStorageAppsListViewModel__appsListDataModel));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings30ManageStorageAppsListViewModel_appsListDataController));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings30ManageStorageAppsListViewModel_account));
  swift_release();
  sub_24B5222B4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC14iCloudSettings30ManageStorageAppsListViewModel_appCategoryToShowWhenLoadingComplete), *(_QWORD *)&self->_appsListDataModel[OBJC_IVAR____TtC14iCloudSettings30ManageStorageAppsListViewModel_appCategoryToShowWhenLoadingComplete]);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings30ManageStorageAppsListViewModel_analyticsController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings30ManageStorageAppsListViewModel_navigationController));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings30ManageStorageAppsListViewModel_activityIndicator));
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC14iCloudSettings30ManageStorageAppsListViewModel___observationRegistrar;
  v4 = sub_24B5E30B4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
