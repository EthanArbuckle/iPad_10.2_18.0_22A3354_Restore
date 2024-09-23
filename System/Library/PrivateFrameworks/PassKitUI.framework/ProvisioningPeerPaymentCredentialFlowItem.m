@implementation ProvisioningPeerPaymentCredentialFlowItem

- (_TtC9PassKitUI41ProvisioningPeerPaymentCredentialFlowItem)init
{
  _TtC9PassKitUI41ProvisioningPeerPaymentCredentialFlowItem *result;

  result = (_TtC9PassKitUI41ProvisioningPeerPaymentCredentialFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI41ProvisioningPeerPaymentCredentialFlowItem_credential));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI41ProvisioningPeerPaymentCredentialFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)peerPaymentSetupFlowControllerDidFinish:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  id v8;
  _TtC9PassKitUI41ProvisioningPeerPaymentCredentialFlowItem *v9;

  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI41ProvisioningPeerPaymentCredentialFlowItem_delegate;
  if (MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI41ProvisioningPeerPaymentCredentialFlowItem_delegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v8 = a3;
    v9 = self;
    sub_19D789E94((uint64_t)v9, (uint64_t)&off_1E3E556D8, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

@end
