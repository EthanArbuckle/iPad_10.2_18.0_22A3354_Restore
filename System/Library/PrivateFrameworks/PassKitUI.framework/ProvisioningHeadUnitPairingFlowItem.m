@implementation ProvisioningHeadUnitPairingFlowItem

- (_TtC9PassKitUI35ProvisioningHeadUnitPairingFlowItem)init
{
  _TtC9PassKitUI35ProvisioningHeadUnitPairingFlowItem *result;

  result = (_TtC9PassKitUI35ProvisioningHeadUnitPairingFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35ProvisioningHeadUnitPairingFlowItem_primaryPass));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35ProvisioningHeadUnitPairingFlowItem_credential));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI35ProvisioningHeadUnitPairingFlowItem_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35ProvisioningHeadUnitPairingFlowItem_hupPrompt));
}

- (void)headUnitPairingPrompt:(id)a3 didFinishWithResult:(BOOL)a4
{
  char *v6;
  uint64_t v7;
  uint64_t ObjectType;
  id v9;
  _TtC9PassKitUI35ProvisioningHeadUnitPairingFlowItem *v10;

  v6 = (char *)self + OBJC_IVAR____TtC9PassKitUI35ProvisioningHeadUnitPairingFlowItem_delegate;
  if (MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI35ProvisioningHeadUnitPairingFlowItem_delegate, a2, a3, a4))
  {
    v7 = *((_QWORD *)v6 + 1);
    ObjectType = swift_getObjectType();
    v9 = a3;
    v10 = self;
    sub_19D789E94((uint64_t)v10, (uint64_t)&off_1E3E326D0, ObjectType, v7);

    swift_unknownObjectRelease();
  }
}

@end
