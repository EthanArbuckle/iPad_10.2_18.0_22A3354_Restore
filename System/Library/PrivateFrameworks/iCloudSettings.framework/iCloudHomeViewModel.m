@implementation iCloudHomeViewModel

- (_TtC14iCloudSettings22ICSAnalyticsController)analyticsController
{
  return (_TtC14iCloudSettings22ICSAnalyticsController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                                 + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel_analyticsController));
}

- (void)dealloc
{
  _TtC14iCloudSettings19iCloudHomeViewModel *v2;

  v2 = self;
  iCloudHomeViewModel.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__privateRelayViewModel));
  swift_unknownObjectWeakDestroy();
  sub_24B511914((uint64_t)self + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__appendSettingsNavigationPath, &qword_25799BE90);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__upgradeFlowManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__legacyRUIController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__legacyManagePlanController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__legacyManagePlanFlowManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__familyCircleStateController));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__customEmailPresenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__manageSubsPresenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__adpSectionViewModel));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__privateRelayViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__dataclassValidationController));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel__mailSettingsProvider));
  sub_24B511874(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel____lazy_storage___numberFormatter));
  sub_24B511874(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel____lazy_storage___appDownloadFlowManager));
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel_analyticsController));
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC14iCloudSettings19iCloudHomeViewModel___observationRegistrar;
  v4 = sub_24B5E30B4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (NSString)photosDataclassSubtitle
{
  return (NSString *)sub_24B503B0C(self, (uint64_t)a2, (void (*)(void))iCloudHomeViewModel.photosDataclassSubtitle.getter);
}

- (NSString)driveDataclassSubtitle
{
  return (NSString *)sub_24B503B0C(self, (uint64_t)a2, (void (*)(void))iCloudHomeViewModel.driveDataclassSubtitle.getter);
}

- (NSString)mailDataclassSubtitle
{
  return (NSString *)sub_24B503B0C(self, (uint64_t)a2, (void (*)(void))iCloudHomeViewModel.mailDataclassSubtitle.getter);
}

- (id)expandedSubTitleForDataclass:(id)a3
{
  id v4;
  _TtC14iCloudSettings19iCloudHomeViewModel *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = self;
  iCloudHomeViewModel.subTitle(for:)();
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

- (id)expandedSubTitleForService:(id)a3
{
  return (id)sub_24B5E42C0();
}

- (_TtC14iCloudSettings19iCloudHomeViewModel)init
{
  _TtC14iCloudSettings19iCloudHomeViewModel *result;

  result = (_TtC14iCloudSettings19iCloudHomeViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)didStartLoadingWithView:(int64_t)a3
{
  _TtC14iCloudSettings19iCloudHomeViewModel *v4;

  v4 = self;
  iCloudHomeViewModel.didStartLoading(view:)(a3);

}

- (void)didStopLoadingWithView:(int64_t)a3
{
  _TtC14iCloudSettings19iCloudHomeViewModel *v4;

  v4 = self;
  iCloudHomeViewModel.didStopLoading(view:)(a3);

}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  uint64_t v4;
  _TtC14iCloudSettings19iCloudHomeViewModel *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;

  v4 = qword_2544D8D50;
  v10 = a3;
  v5 = self;
  if (v4 != -1)
    swift_once();
  v6 = sub_24B5E32C4();
  __swift_project_value_buffer(v6, (uint64_t)qword_2544D8DC8);
  v7 = sub_24B5E32AC();
  v8 = sub_24B5E4524();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_24B4C1000, v7, v8, "Upgrade flow was cancelled.", v9, 2u);
    MEMORY[0x24BD23834](v9, -1, -1);
  }

}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  id v4;
  _TtC14iCloudSettings19iCloudHomeViewModel *v5;

  v4 = a3;
  v5 = self;
  _s14iCloudSettings01iA13HomeViewModelC29upgradeFlowManagerDidCompleteyySo010ICQUpgradegH0CSgF_0();

}

- (void)upgradeFlowManagerDidFail:(id)a3 error:(id)a4
{
  id v6;
  _TtC14iCloudSettings19iCloudHomeViewModel *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_24B572CDC(a4);

}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  void *v5;

  v5 = _Block_copy(a5);
  _Block_release(v5);
  return 0;
}

@end
