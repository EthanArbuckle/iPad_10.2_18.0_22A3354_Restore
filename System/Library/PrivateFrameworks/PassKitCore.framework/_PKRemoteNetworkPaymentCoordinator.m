@implementation _PKRemoteNetworkPaymentCoordinator

- (PKRemoteNetworkPaymentCoordinator)wrapper
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____PKRemoteNetworkPaymentCoordinator_wrapper;
  swift_beginAccess();
  return (PKRemoteNetworkPaymentCoordinator *)(id)MEMORY[0x19400D8B8](v2);
}

- (void)setWrapper:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (_PKRemoteNetworkPaymentCoordinator)init
{
  objc_super v4;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____PKRemoteNetworkPaymentCoordinator_paymentSession) = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RemoteNetworkPaymentCoordinator();
  return -[_PKRemoteNetworkPaymentCoordinator init](&v4, sel_init);
}

- (void)handlePaymentUserActivity:(id)a3 originProcess:(id)a4
{
  id v6;
  id v7;
  _PKRemoteNetworkPaymentCoordinator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_18FDDF288(v6, v7);

}

- (void)presentErrorMessageWithFailure:(unint64_t)a3 originProcess:(id)a4 delay:(double)a5
{
  id v8;
  _PKRemoteNetworkPaymentCoordinator *v9;

  v8 = a4;
  v9 = self;
  sub_18FDE0F40(a3, (uint64_t)v8, a5);

}

- (void).cxx_destruct
{

  swift_unknownObjectWeakDestroy();
}

@end
