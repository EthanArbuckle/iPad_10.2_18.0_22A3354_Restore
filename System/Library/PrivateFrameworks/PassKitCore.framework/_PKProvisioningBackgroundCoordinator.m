@implementation _PKProvisioningBackgroundCoordinator

- (_PKProvisioningBackgroundCoordinator)initWithPkContext:(id)a3 credential:(id)a4 previouslyAcceptedTerms:(BOOL)a5
{
  id v7;
  id v8;
  _QWORD *v9;
  id v10;
  _PKProvisioningBackgroundCoordinator *v11;

  v7 = a3;
  v8 = a4;
  v9 = _s11PassKitCore19ProvisioningContextC02pkE0ACSo014PKProvisioningE0C_tcfC_0(v7);
  v10 = objc_allocWithZone((Class)type metadata accessor for ProvisioningBackgroundCoordinator());
  v11 = (_PKProvisioningBackgroundCoordinator *)ProvisioningBackgroundCoordinator.init(context:credential:previouslyAcceptedTerms:)((uint64_t)v9, (uint64_t)v8, a5);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v11;
}

- (void)dealloc
{
  _PKProvisioningBackgroundCoordinator *v2;
  objc_super v3;

  v2 = self;
  sub_18FD70CF8();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for ProvisioningBackgroundCoordinator();
  -[_PKProvisioningBackgroundCoordinator dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_18FD4A1C4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____PKProvisioningBackgroundCoordinator_completion));
  sub_18FD4A1C4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____PKProvisioningBackgroundCoordinator_preflightCompletion));
  sub_18FD36250((uint64_t)self + OBJC_IVAR____PKProvisioningBackgroundCoordinator_composer, &qword_1EE1BEFB8);

  swift_bridgeObjectRelease();
}

- (void)startWithCompletion:(id)a3
{
  sub_18FD712BC(self, (int)a2, a3, (uint64_t)&unk_1E2AB34E8, (uint64_t)sub_18FD78558, (void (*)(uint64_t, uint64_t))sub_18FD6F47C);
}

- (void)cancel
{
  _PKProvisioningBackgroundCoordinator *v2;

  v2 = self;
  sub_18FD703DC();

}

- (id)archivedState
{
  _PKProvisioningBackgroundCoordinator *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_18FD70508();

  return v3;
}

- (void)invalidate
{
  _PKProvisioningBackgroundCoordinator *v2;

  v2 = self;
  sub_18FD70CF8();

}

- (void)cleanUpArchivedProvisioningAndInvalidateWithCompletion:(id)a3
{
  sub_18FD712BC(self, (int)a2, a3, (uint64_t)&unk_1E2AB34C0, (uint64_t)sub_18FD78550, (void (*)(uint64_t, uint64_t))sub_18FD71150);
}

- (_PKProvisioningBackgroundCoordinator)init
{
  _PKProvisioningBackgroundCoordinator *result;

  result = (_PKProvisioningBackgroundCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
