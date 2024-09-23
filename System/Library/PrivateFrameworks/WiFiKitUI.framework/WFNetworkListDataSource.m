@implementation WFNetworkListDataSource

- (void)updateCurrentNetworkConfig:(id)a3
{
  id v5;
  WFNetworkListDataSource *v6;

  v5 = a3;
  v6 = self;
  NetworkListDataSource.updateCurrentNetworkConfig(newConfig:)((WFNetworkRowConfig_optional *)a3);

}

- (void)updateCurrentNetwork:(id)a3
{
  WFNetworkListDataSource *v5;

  swift_unknownObjectRetain();
  v5 = self;
  NetworkListDataSource.updateCurrentNetwork(newCurrentNetwork:)((uint64_t)a3);
  swift_unknownObjectRelease();

}

- (void)updateScanResults:(id)a3
{
  WFNetworkListDataSource *v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2550965D0);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___WFNetworkListDataSource_scanResults) = (Class)sub_2197529FC();
  v4 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_219731F1C();

  swift_bridgeObjectRelease();
}

- (void)setScanning:(BOOL)a3
{
  WFNetworkListDataSource *v4;

  v4 = self;
  NetworkListDataSource.updateScanning(newState:)(a3);

}

- (void)setOtherNetworkTapHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_2197306BC;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFNetworkListDataSource_otherNetworkTapHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_219731D9C(v7);
}

- (void)setInfoButtonHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_21973D1C4;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFNetworkListDataSource_infoButtonTapHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_219731D9C(v7);
}

- (void)setAssociationHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_21973D1B4;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFNetworkListDataSource_associationHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_219731D9C(v7);
}

- (void)setPendingDeletingNetworksChangedCallback:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_21973D1AC;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFNetworkListDataSource_pendingDeletingNetworksChangedCallback);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_219731D9C(v7);
}

- (void)setUnconfiguredNetworksSectionTitleDelegate:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_21973D1A4;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFNetworkListDataSource_unconfiguredNetworksSectionTitleDelegate);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_219731D9C(v7);
}

- (void)updateManagedPreferredNetworks:(id)a3
{
  sub_219735730(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))NetworkListDataSource.updateManagedPreferredNetworks(newManagedPreferredNetworks:));
}

- (void)updateEditablePreferredNetworks:(id)a3
{
  sub_219735730(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))NetworkListDataSource.updateEditablePreferredNetworks(newEditablePreferredNetworks:));
}

- (void)startEditingPreferredNetworks
{
  WFNetworkListDataSource *v2;

  v2 = self;
  NetworkListDataSource.startEditingPreferredNetworks()();

}

- (void)switchToScanList
{
  WFNetworkListDataSource *v2;

  v2 = self;
  NetworkListDataSource.switchToScanList()();

}

- (WFNetworkListDataSource)init
{
  return (WFNetworkListDataSource *)NetworkListDataSource.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t);
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;

  v3 = (char *)self + OBJC_IVAR___WFNetworkListDataSource__currentNetwork;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096500);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___WFNetworkListDataSource__currentNetworkRowConfig;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550964F8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR___WFNetworkListDataSource__listMode;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550964F0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR___WFNetworkListDataSource__knownNetworks;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550964E8);
  v11 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8);
  v11(v9, v10);
  v11((char *)self + OBJC_IVAR___WFNetworkListDataSource__publicNetworks, v10);
  v11((char *)self + OBJC_IVAR___WFNetworkListDataSource__infraNetworks, v10);
  v11((char *)self + OBJC_IVAR___WFNetworkListDataSource__adhocNetworks, v10);
  v11((char *)self + OBJC_IVAR___WFNetworkListDataSource__unConfiguredNetworks, v10);
  v11((char *)self + OBJC_IVAR___WFNetworkListDataSource__managedPreferredNetworks, v10);
  v11((char *)self + OBJC_IVAR___WFNetworkListDataSource__editablePreferredNetworks, v10);
  v12 = (char *)self + OBJC_IVAR___WFNetworkListDataSource__isScanning;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550964E0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  v14 = (char *)self + OBJC_IVAR___WFNetworkListDataSource__unconfiguredNetworksSectionTitle;
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550967B0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
  swift_bridgeObjectRelease();
  sub_219731D9C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFNetworkListDataSource_networkTapHandler));
  sub_219731D9C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFNetworkListDataSource_infoButtonTapHandler));
  sub_219731D9C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFNetworkListDataSource_associationHandler));
  sub_219731D9C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___WFNetworkListDataSource_pendingDeletingNetworksChangedCallback));
  sub_219731D9C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFNetworkListDataSource_otherNetworkTapHandler));
  sub_219731D9C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___WFNetworkListDataSource_unconfiguredNetworksSectionTitleDelegate));
  swift_bridgeObjectRelease();
}

@end
