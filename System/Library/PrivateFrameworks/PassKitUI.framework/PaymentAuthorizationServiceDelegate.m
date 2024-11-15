@implementation PaymentAuthorizationServiceDelegate

- (void)authorizationDidChangeCouponCodeCompleteWithUpdate:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI35PaymentAuthorizationServiceDelegate_stateMachine), sel_didReceiveCouponCodeCompleteWithUpdate_, a3);
}

- (void)authorizationDidUpdateAccountServicePaymentMethodCompleteWithUpdate:(id)a3 signatureRequest:(id)a4
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI35PaymentAuthorizationServiceDelegate_stateMachine), sel_didReceiveUpdateAccountServicePaymentMethodCompleteWithUpdate_signatureRequest_, a3, a4);
}

- (void)handleHostApplicationDidCancel
{
  _TtC9PassKitUI35PaymentAuthorizationServiceDelegate *v2;

  v2 = self;
  sub_19D8D0C80();

}

- (void)handleDismissWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  _TtC9PassKitUI35PaymentAuthorizationServiceDelegate *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_19D266A30;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_19D8D0E04(v7, v6);
  sub_19D1A9F60((uint64_t)v7);

}

- (void)authorizationDidRequestMerchantSessionCompleteWithUpdate:(id)a3
{
  id v5;
  _TtC9PassKitUI35PaymentAuthorizationServiceDelegate *v6;

  v5 = a3;
  v6 = self;
  sub_19D8D1040((uint64_t)a3);

}

- (char)authorizationDidAuthorizeContextCompleteWithResult:(uint64_t)a3
{
  if (a3)
    return (char *)objc_msgSend(*(id *)&result[OBJC_IVAR____TtC9PassKitUI35PaymentAuthorizationServiceDelegate_stateMachine], sel_didReceivePaymentAuthorizationResult_);
  __break(1u);
  return result;
}

- (void)authorizationDidAuthorizePurchaseCompleteWithStatus:(int64_t)a3
{
  id v5;
  _TtC9PassKitUI35PaymentAuthorizationServiceDelegate *v6;
  id v7;

  v5 = objc_allocWithZone(MEMORY[0x1E0D670A8]);
  v6 = self;
  v7 = objc_msgSend(v5, sel_init);
  objc_msgSend(v7, sel_setStatus_, a3);
  objc_msgSend(*(id *)((char *)&v6->super.isa + OBJC_IVAR____TtC9PassKitUI35PaymentAuthorizationServiceDelegate_stateMachine), sel_didReceivePaymentAuthorizationResult_, v7);

}

- (void)authorizationDidSelectShippingMethodCompleteWithUpdate:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI35PaymentAuthorizationServiceDelegate_stateMachine), sel_didReceiveShippingMethodCompleteWithUpdate_, a3);
}

- (void)authorizationDidSelectShippingAddressCompleteWithUpdate:(id)a3
{
  void *v4;
  _TtC9PassKitUI35PaymentAuthorizationServiceDelegate *v5;
  id v6;
  void *v7;
  _TtC9PassKitUI35PaymentAuthorizationServiceDelegate *v8;
  _TtC9PassKitUI35PaymentAuthorizationServiceDelegate *v9;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI35PaymentAuthorizationServiceDelegate_stateMachine);
  v9 = self;
  v5 = (_TtC9PassKitUI35PaymentAuthorizationServiceDelegate *)a3;
  objc_msgSend(v4, sel_didReceiveShippingContactCompleteWithUpdate_, v5);
  if (!v5)
  {
    __break(1u);
    goto LABEL_7;
  }
  v6 = -[PaymentAuthorizationServiceDelegate availableShippingMethods](v5, sel_availableShippingMethods);
  if (!v6)
  {
LABEL_7:
    __break(1u);
    return;
  }
  v7 = v6;
  v8 = (_TtC9PassKitUI35PaymentAuthorizationServiceDelegate *)objc_msgSend(v6, sel_defaultMethod);

  if (v8)
  {
    objc_msgSend(v4, sel_didSelectShippingMethod_, v8);

    v5 = v9;
    v9 = v8;
  }

}

- (void)authorizationDidSelectPaymentMethodCompleteWithUpdate:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI35PaymentAuthorizationServiceDelegate_stateMachine), sel_didReceivePaymentMethodCompleteWithUpdate_, a3);
}

- (_TtC9PassKitUI35PaymentAuthorizationServiceDelegate)init
{
  _TtC9PassKitUI35PaymentAuthorizationServiceDelegate *result;

  result = (_TtC9PassKitUI35PaymentAuthorizationServiceDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35PaymentAuthorizationServiceDelegate_stateMachine));
  swift_release();
}

@end
