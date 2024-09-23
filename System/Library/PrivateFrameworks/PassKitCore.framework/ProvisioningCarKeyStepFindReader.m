@implementation ProvisioningCarKeyStepFindReader

- (_TtC11PassKitCore32ProvisioningCarKeyStepFindReader)init
{
  _TtC11PassKitCore32ProvisioningCarKeyStepFindReader *result;

  result = (_TtC11PassKitCore32ProvisioningCarKeyStepFindReader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_18FCD6F28(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC11PassKitCore32ProvisioningCarKeyStepFindReader_credential), *(_QWORD *)&self->context[OBJC_IVAR____TtC11PassKitCore32ProvisioningCarKeyStepFindReader_credential], *(_QWORD *)&self->credential[OBJC_IVAR____TtC11PassKitCore32ProvisioningCarKeyStepFindReader_credential], self->credential[OBJC_IVAR____TtC11PassKitCore32ProvisioningCarKeyStepFindReader_credential + 8]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore32ProvisioningCarKeyStepFindReader_sharedState));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore32ProvisioningCarKeyStepFindReader_carConfiguration));
  sub_18FD4A1C4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11PassKitCore32ProvisioningCarKeyStepFindReader_commonCompletion));

  sub_18FD4D5D8(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC11PassKitCore32ProvisioningCarKeyStepFindReader_bindingAttestation), *(_QWORD *)&self->context[OBJC_IVAR____TtC11PassKitCore32ProvisioningCarKeyStepFindReader_bindingAttestation]);
  sub_18FD4A1C4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11PassKitCore32ProvisioningCarKeyStepFindReader_onDidStartPairing));
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  _TtC11PassKitCore32ProvisioningCarKeyStepFindReader *v6;

  swift_unknownObjectRetain();
  v6 = self;
  sub_18FDB5730(a4);
  swift_unknownObjectRelease();

}

- (void)appletSubcredentialPairingSessionDidBeginPairing:(id)a3
{
  id v4;
  _TtC11PassKitCore32ProvisioningCarKeyStepFindReader *v5;

  v4 = a3;
  v5 = self;
  _s11PassKitCore32ProvisioningCarKeyStepFindReaderC041appletSubcredentialPairingSessionDidBeginL0yySo08PKAppletklM0CSgF_0();

}

- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithSubcredential:(id)a4 registrationData:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC11PassKitCore32ProvisioningCarKeyStepFindReader *v11;

  if (a4)
  {
    v8 = a3;
    v9 = a5;
    v11 = self;
    v10 = a4;
    objc_msgSend(v10, sel_setTrackingRequest_, v9);
    sub_18FDB4260(a4, 0);

  }
  else
  {
    __break(1u);
  }
}

- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithError:(id)a4
{
  id v6;
  _TtC11PassKitCore32ProvisioningCarKeyStepFindReader *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_18FDB5A60(a4);

}

- (void)appletSubcredentialPairingSession:(id)a3 didFinishPreWarmWithResult:(id)a4
{
  id v6;
  _TtC11PassKitCore32ProvisioningCarKeyStepFindReader *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_18FDB5C4C(a4);

}

@end
