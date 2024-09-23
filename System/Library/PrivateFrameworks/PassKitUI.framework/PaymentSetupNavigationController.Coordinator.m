@implementation PaymentSetupNavigationController.Coordinator

- (void)paymentSetupDidFinish:(id)a3
{
  void (*v4)(void);
  id v5;
  _TtCV9PassKitUI32PaymentSetupNavigationController11Coordinator *v6;

  v4 = *(void (**)(void))((char *)&self->super.isa
                        + OBJC_IVAR____TtCV9PassKitUI32PaymentSetupNavigationController11Coordinator_setupFinishedAction);
  v5 = a3;
  v6 = self;
  v4();

}

- (_TtCV9PassKitUI32PaymentSetupNavigationController11Coordinator)init
{
  _TtCV9PassKitUI32PaymentSetupNavigationController11Coordinator *result;

  result = (_TtCV9PassKitUI32PaymentSetupNavigationController11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_19D506204((uint64_t)self + OBJC_IVAR____TtCV9PassKitUI32PaymentSetupNavigationController11Coordinator_parent);
  swift_release();
}

@end
