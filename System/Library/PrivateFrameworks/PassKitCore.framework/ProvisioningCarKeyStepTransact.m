@implementation ProvisioningCarKeyStepTransact

- (_TtC11PassKitCore30ProvisioningCarKeyStepTransact)init
{
  _TtC11PassKitCore30ProvisioningCarKeyStepTransact *result;

  result = (_TtC11PassKitCore30ProvisioningCarKeyStepTransact *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_18FCD6F28(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC11PassKitCore30ProvisioningCarKeyStepTransact_credential), *(_QWORD *)&self->context[OBJC_IVAR____TtC11PassKitCore30ProvisioningCarKeyStepTransact_credential], *(_QWORD *)&self->credential[OBJC_IVAR____TtC11PassKitCore30ProvisioningCarKeyStepTransact_credential], self->credential[OBJC_IVAR____TtC11PassKitCore30ProvisioningCarKeyStepTransact_credential + 8]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore30ProvisioningCarKeyStepTransact_sharedState));
  sub_18FD4A1C4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11PassKitCore30ProvisioningCarKeyStepTransact_commonCompletion));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore30ProvisioningCarKeyStepTransact_sessionHandle));

  swift_unknownObjectRelease();
}

- (void)contactlessInterfaceSessionDidTerminate:(id)a3
{
  void *v5;
  id v6;
  _TtC11PassKitCore30ProvisioningCarKeyStepTransact *v7;
  id v8;

  v5 = (void *)objc_opt_self();
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, sel_errorWithSeverity_, 4);
  sub_18FE1AE50(v8);

}

- (void)contactlessInterfaceSessionDidTerminate:(id)a3 withErrorCode:(unint64_t)a4
{
  void *v6;
  id v7;
  _TtC11PassKitCore30ProvisioningCarKeyStepTransact *v8;
  id v9;

  v6 = (void *)objc_opt_self();
  v7 = a3;
  v8 = self;
  v9 = objc_msgSend(v6, sel_errorWithSeverity_, 4);
  sub_18FE1AE50(v9);

}

- (void)contactlessInterfaceSession:(id)a3 didFinishTransactionWithContext:(id)a4
{
  id v6;
  id v7;
  _TtC11PassKitCore30ProvisioningCarKeyStepTransact *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_18FE1C9E8(a4);

}

- (void)contactlessInterfaceSession:(id)a3 didEndPersistentCardEmulationWithContext:(id)a4
{
  void *v7;
  id v8;
  id v9;
  _TtC11PassKitCore30ProvisioningCarKeyStepTransact *v10;
  id v11;

  v7 = (void *)objc_opt_self();
  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = objc_msgSend(v7, sel_errorWithSeverity_, 4);
  sub_18FE1AE50(v11);

}

@end
