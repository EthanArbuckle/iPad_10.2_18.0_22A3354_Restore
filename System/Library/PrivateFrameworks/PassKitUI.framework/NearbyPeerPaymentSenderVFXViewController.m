@implementation NearbyPeerPaymentSenderVFXViewController

- (_TtC9PassKitUI40NearbyPeerPaymentSenderVFXViewController)init
{
  objc_class *ObjectType;
  char *v4;
  _TtC9PassKitUI40NearbyPeerPaymentSenderVFXViewController *v5;
  void *v6;
  _TtC9PassKitUI40NearbyPeerPaymentSenderVFXViewController *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (char *)self + OBJC_IVAR____TtC9PassKitUI40NearbyPeerPaymentSenderVFXViewController_state;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC9PassKitUI40NearbyPeerPaymentSenderVFXViewController_animationDelegate) = 0;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = ObjectType;
  v5 = -[NearbyPeerPaymentVFXViewController init](&v9, sel_init);
  v6 = *(Class *)((char *)&v5->super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_unknownAmountEmitter);
  v7 = v5;
  objc_msgSend(v6, sel_removeFromParentNode);
  sub_19D79A750();

  return v7;
}

- (void).cxx_destruct
{
  sub_19D1F8C70((uint64_t)self + OBJC_IVAR____TtC9PassKitUI40NearbyPeerPaymentSenderVFXViewController_state);
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI40NearbyPeerPaymentSenderVFXViewController_animationDelegate);
}

@end
