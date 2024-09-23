@implementation ProvisioningReaderModeReadCardFlowItem

- (_TtC9PassKitUI38ProvisioningReaderModeReadCardFlowItem)init
{
  _TtC9PassKitUI38ProvisioningReaderModeReadCardFlowItem *result;

  result = (_TtC9PassKitUI38ProvisioningReaderModeReadCardFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38ProvisioningReaderModeReadCardFlowItem_product));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38ProvisioningReaderModeReadCardFlowItem_fieldsModel));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI38ProvisioningReaderModeReadCardFlowItem_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38ProvisioningReaderModeReadCardFlowItem_coordinator));
  sub_19D1ECDCC(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC9PassKitUI38ProvisioningReaderModeReadCardFlowItem_provisioningResult), self->context[OBJC_IVAR____TtC9PassKitUI38ProvisioningReaderModeReadCardFlowItem_provisioningResult]);
}

- (void)provisionWithFieldModel:(id)a3 paymentCredential:(id)a4
{
  id v6;
  id v7;
  _TtC9PassKitUI38ProvisioningReaderModeReadCardFlowItem *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_19D7A2A68(v6, v7);

}

- (void)viewControllerDidCancel:(id)a3
{
  id v4;
  _TtC9PassKitUI38ProvisioningReaderModeReadCardFlowItem *v5;

  v4 = a3;
  v5 = self;
  sub_19D7A2EC0();

}

- (void)viewControllerDidComplete:(id)a3
{
  id v4;
  _TtC9PassKitUI38ProvisioningReaderModeReadCardFlowItem *v5;

  v4 = a3;
  v5 = self;
  sub_19D7A2F4C();

}

- (void)viewControllerDidFailIngestion:(id)a3
{
  id v4;
  _TtC9PassKitUI38ProvisioningReaderModeReadCardFlowItem *v5;

  v4 = a3;
  v5 = self;
  sub_19D7A3124();

}

- (id)provisionedPass
{
  _TtC9PassKitUI38ProvisioningReaderModeReadCardFlowItem *v2;
  void *v3;

  v2 = self;
  v3 = sub_19D7A2D3C();

  return v3;
}

@end
