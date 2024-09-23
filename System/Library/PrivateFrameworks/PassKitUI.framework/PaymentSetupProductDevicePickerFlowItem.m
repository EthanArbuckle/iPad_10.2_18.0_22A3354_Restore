@implementation PaymentSetupProductDevicePickerFlowItem

- (_TtC9PassKitUI39PaymentSetupProductDevicePickerFlowItem)init
{
  _TtC9PassKitUI39PaymentSetupProductDevicePickerFlowItem *result;

  result = (_TtC9PassKitUI39PaymentSetupProductDevicePickerFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI39PaymentSetupProductDevicePickerFlowItem_product));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI39PaymentSetupProductDevicePickerFlowItem_viewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI39PaymentSetupProductDevicePickerFlowItem_selectedProduct));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI39PaymentSetupProductDevicePickerFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)devicePickerViewController:(id)a3 didSelectProvisioningController:(id)a4 product:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC9PassKitUI39PaymentSetupProductDevicePickerFlowItem *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_19D5CF73C(v9, v10);

}

@end
