@implementation PaymentOfferSetupProvisioningSheet.Coordinator

- (PKUIFlowManagerRendererDelegate)flowDelegate
{
  return (PKUIFlowManagerRendererDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setFlowDelegate:(id)a3
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator_flowDelegate) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (void)pushWithViewController:(id)a3 animated:(BOOL)a4
{
  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator_navigationController), sel_pushWithViewController_animated_, a3, a4);
}

- (void)presentWithViewController:(id)a3 animated:(BOOL)a4
{
  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator_navigationController), sel_presentWithViewController_animated_, a3, a4);
}

- (void)dismissWithViewController:(id)a3 animated:(BOOL)a4
{
  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator_navigationController), sel_dismissWithViewController_animated_, a3, a4);
}

- (id)navViewControllers
{
  void *v2;
  _TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator *v3;
  id v4;
  void *v5;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator_navigationController);
  v3 = self;
  v4 = objc_msgSend(v2, sel_viewControllers);
  sub_19D42BDC4();
  sub_19DE87E10();

  v5 = (void *)sub_19DE87DF8();
  swift_bridgeObjectRelease();
  return v5;
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  _TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator *v7;
  id v8;

  v4 = a4;
  sub_19D42BDC4();
  sub_19DE87E10();
  v6 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator_navigationController);
  v7 = self;
  v8 = (id)sub_19DE87DF8();
  objc_msgSend(v6, sel_setViewControllers_animated_, v8, v4);

  swift_bridgeObjectRelease();
}

- (id)rootViewController
{
  return objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator_navigationController), sel_rootViewController);
}

- (id)createChildRenderer
{
  _TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_19D6A2828();

  return v3;
}

- (_TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator)init
{
  _TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator *result;

  result = (_TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_19D1CE5EC((uint64_t)self + OBJC_IVAR____TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator_provisioningData, (uint64_t (*)(_QWORD))type metadata accessor for PaymentOfferSetupProvisioningMetadata);
  swift_bridgeObjectRelease();
  sub_19D2AC9BC((uint64_t)self + OBJC_IVAR____TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator_cardArtURL);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator_paymentOffersController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator_navigationController));
  swift_release();
  swift_unknownObjectRelease();
}

@end
