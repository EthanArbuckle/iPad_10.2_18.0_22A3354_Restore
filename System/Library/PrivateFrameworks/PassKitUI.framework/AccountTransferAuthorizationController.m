@implementation AccountTransferAuthorizationController

- (_TtC9PassKitUI38AccountTransferAuthorizationController)init
{
  _TtC9PassKitUI38AccountTransferAuthorizationController *result;

  result = (_TtC9PassKitUI38AccountTransferAuthorizationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38AccountTransferAuthorizationController_paymentRequest));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38AccountTransferAuthorizationController_accountModel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38AccountTransferAuthorizationController_paymentAuthorizationController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38AccountTransferAuthorizationController_window));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38AccountTransferAuthorizationController_paymentWebService));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38AccountTransferAuthorizationController_scheduleTransferRequest));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38AccountTransferAuthorizationController_accountService));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38AccountTransferAuthorizationController_transactionFetcher));
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI38AccountTransferAuthorizationController_dismissalTimer;
  v4 = sub_19DE87990();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (id)presentationWindowForPaymentAuthorizationController:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC9PassKitUI38AccountTransferAuthorizationController_window));
}

- (void)paymentAuthorizationControllerDidFinish:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  _TtC9PassKitUI38AccountTransferAuthorizationController *v8;
  _QWORD v9[6];

  v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v9[4] = sub_19D5A56D4;
  v9[5] = v5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = sub_19D1F8AF4;
  v9[3] = &block_descriptor_55_2;
  v6 = _Block_copy(v9);
  v7 = a3;
  v8 = self;
  swift_release();
  objc_msgSend(v7, sel_dismissWithCompletion_, v6);
  _Block_release(v6);

}

- (void)paymentAuthorizationController:(id)a3 didUpdateAccountServicePaymentMethod:(id)a4 handler:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  _TtC9PassKitUI38AccountTransferAuthorizationController *v15;

  v8 = _Block_copy(a5);
  if (v8)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v8;
    v8 = sub_19D5A56C0;
    if (a4)
    {
LABEL_3:
      v10 = *(Class *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38AccountTransferAuthorizationController_paymentRequest);
      v11 = *(uint64_t *)((char *)&self->super.isa
                       + OBJC_IVAR____TtC9PassKitUI38AccountTransferAuthorizationController_scheduleTransferModel);
      v12 = swift_allocObject();
      swift_unknownObjectWeakInit();
      sub_19D1A9EC4((uint64_t)v8);
      v13 = a3;
      v14 = a4;
      v15 = self;
      sub_19D781E20(v10, v14, v11, v12, (void (*)(_QWORD, _QWORD))v8, v9);
      sub_19D1A9F60((uint64_t)v8);
      swift_release();
      sub_19D1A9F60((uint64_t)v8);

      return;
    }
  }
  else
  {
    v9 = 0;
    if (a4)
      goto LABEL_3;
  }
  __break(1u);
}

- (void)paymentAuthorizationController:(id)a3 didAuthorizeApplePayTrustSignature:(id)a4 handler:(id)a5
{
  void (*v8)(void);
  uint64_t v9;
  id v10;
  id v11;
  _TtC9PassKitUI38AccountTransferAuthorizationController *v12;

  v8 = (void (*)(void))_Block_copy(a5);
  if (v8)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v8;
    v8 = (void (*)(void))sub_19D22E97C;
  }
  else
  {
    v9 = 0;
  }
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_19D5A50E8((uint64_t)a4, v8, v9);
  sub_19D1A9F60((uint64_t)v8);

}

- (void)transactionsChanged:(id)a3
{
  _TtC9PassKitUI38AccountTransferAuthorizationController *v3;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI38AccountTransferAuthorizationController_hasReceivedTransaction) = 1;
  v3 = self;
  sub_19D5A4CD0();

}

- (void)accountChanged:(id)a3
{
  id v4;
  _TtC9PassKitUI38AccountTransferAuthorizationController *v5;

  v4 = a3;
  v5 = self;
  sub_19D5A52F0();

}

@end
