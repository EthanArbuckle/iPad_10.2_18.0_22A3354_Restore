@implementation ManageStorageAppsListDataController

- (ACAccount)account
{
  return (ACAccount *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC14iCloudSettings35ManageStorageAppsListDataController_account));
}

- (BOOL)shouldIgnoreCache
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC14iCloudSettings35ManageStorageAppsListDataController_shouldIgnoreCache;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldIgnoreCache:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC14iCloudSettings35ManageStorageAppsListDataController_shouldIgnoreCache;
  swift_beginAccess();
  *v4 = a3;
}

- (_TtC14iCloudSettings35ManageStorageAppsListDataController)initWithAccount:(id)a3 launchedFromRootLevel:(BOOL)a4 shouldIgnoreCache:(BOOL)a5
{
  id v7;
  _TtC14iCloudSettings35ManageStorageAppsListDataController *v8;

  v7 = a3;
  v8 = (_TtC14iCloudSettings35ManageStorageAppsListDataController *)sub_24B5147A8(v7, a4, a5);

  return v8;
}

- (void)fetchAppsListDataWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC14iCloudSettings35ManageStorageAppsListDataController *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544D8D80);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_24B5E4464();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_257999558;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_257999560;
  v12[5] = v11;
  v13 = self;
  sub_24B57DBC0((uint64_t)v7, (uint64_t)&unk_257999568, (uint64_t)v12);
  swift_release();
}

- (_TtC14iCloudSettings35ManageStorageAppsListDataController)init
{
  _TtC14iCloudSettings35ManageStorageAppsListDataController *result;

  result = (_TtC14iCloudSettings35ManageStorageAppsListDataController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings35ManageStorageAppsListDataController_account));
  swift_release();
}

@end
