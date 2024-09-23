@implementation ProvisioningHeroFlowItem

- (_TtC9PassKitUI24ProvisioningHeroFlowItem)init
{
  _TtC9PassKitUI24ProvisioningHeroFlowItem *result;

  result = (_TtC9PassKitUI24ProvisioningHeroFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI24ProvisioningHeroFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)heroViewControllerDidRequestTransferBalance:(id)a3
{
  id v4;
  _TtC9PassKitUI24ProvisioningHeroFlowItem *v5;

  v4 = a3;
  v5 = self;
  sub_19D4C05EC();

}

- (void)heroViewControllerDidSelectContinue:(id)a3
{
  uint64_t v5;
  void *v6;
  _TtC9PassKitUI24ProvisioningHeroFlowItem *v7;
  id v8;
  _QWORD v9[6];

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = self;
  v9[4] = sub_19D4C08D0;
  v9[5] = v5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = sub_19D1F8AF4;
  v9[3] = &block_descriptor_8_1;
  v6 = _Block_copy(v9);
  v7 = self;
  v8 = a3;
  swift_release();
  PKRequestContactAccessWithCompletion();
  _Block_release(v6);

}

- (void)heroViewControllerDidSelectSetupLater:(id)a3
{
  id v4;
  _TtC9PassKitUI24ProvisioningHeroFlowItem *v5;

  v4 = a3;
  v5 = self;
  sub_19D4C0800();

}

@end
