@implementation ICSManageStorageDrilldownController

- (NSString)appBundleID
{
  void *v2;

  if (*(_QWORD *)&self->appBundleID[OBJC_IVAR___ICSManageStorageDrilldownController_appBundleID])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_24B5E42C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setAppBundleID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;

  if (a3)
  {
    v4 = sub_24B5E42F0();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___ICSManageStorageDrilldownController_appBundleID);
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease();
}

- (ACAccount)account
{
  return (ACAccount *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR___ICSManageStorageDrilldownController_account));
}

- (void)setAccount:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSManageStorageDrilldownController_account);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSManageStorageDrilldownController_account) = (Class)a3;
  v3 = a3;

}

- (UINavigationController)navigationController
{
  return (UINavigationController *)(id)MEMORY[0x24BD23900]((char *)self+ OBJC_IVAR___ICSManageStorageDrilldownController_navigationController, a2);
}

- (void)setNavigationController:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (ICSManageStorageDrilldownController)initWithAppBundleID:(id)a3 account:(id)a4 navigationController:(id)a5
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  id v11;
  ICSManageStorageDrilldownController *v12;

  if (a3)
  {
    v7 = sub_24B5E42F0();
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v10 = a4;
  v11 = a5;
  v12 = (ICSManageStorageDrilldownController *)sub_24B54170C(v7, v9, a4);

  return v12;
}

- (void)beginLoadingForSpecifier:(id)a3
{
  ICSManageStorageDrilldownController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  ManageStorageDrilldownController.beginLoading(specifier:)(v5);

}

- (void)loadStarted:(id)a3
{
  ICSManageStorageDrilldownController *v4;
  ICSManageStorageDrilldownController *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _OWORD v10[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_24B5E4638();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v5 = self;
  }
  if (qword_257998798 != -1)
    swift_once();
  v6 = sub_24B5E32C4();
  __swift_project_value_buffer(v6, (uint64_t)qword_2579AA088);
  v7 = sub_24B5E32AC();
  v8 = sub_24B5E453C();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_24B4C1000, v7, v8, "Storage used VC loading started", v9, 2u);
    MEMORY[0x24BD23834](v9, -1, -1);
  }

  sub_24B511914((uint64_t)v10, &qword_2544D8DB0);
}

- (void)loadFinished:(id)a3
{
  ICSManageStorageDrilldownController *v4;
  ICSManageStorageDrilldownController *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_24B5E4638();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  ManageStorageDrilldownController.loadFinished(_:)();

  sub_24B511914((uint64_t)v6, &qword_2544D8DB0);
}

- (void)loadFailed:(id)a3 withError:(id)a4
{
  id v6;
  ICSManageStorageDrilldownController *v7;
  ICSManageStorageDrilldownController *v8;
  id v9;
  _OWORD v10[2];

  if (a3)
  {
    v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_24B5E4638();
    v8 = (ICSManageStorageDrilldownController *)swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v9 = a4;
    v8 = self;
  }
  ManageStorageDrilldownController.loadFailed(_:withError:)((uint64_t)v8, a4);

  sub_24B511914((uint64_t)v10, &qword_2544D8DB0);
}

- (ICSManageStorageDrilldownController)init
{
  ICSManageStorageDrilldownController *result;

  result = (ICSManageStorageDrilldownController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();

}

@end
