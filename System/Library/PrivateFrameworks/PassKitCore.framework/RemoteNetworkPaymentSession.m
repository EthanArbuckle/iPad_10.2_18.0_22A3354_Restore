@implementation RemoteNetworkPaymentSession

- (void)dealloc
{
  _TtC11PassKitCore27RemoteNetworkPaymentSession *v2;

  v2 = self;
  sub_18FD9C62C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore27RemoteNetworkPaymentSession_originatingProcess));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore27RemoteNetworkPaymentSession_authorizationCoordinator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore27RemoteNetworkPaymentSession_inAppPaymentService));
  sub_18FD59F30((uint64_t)self + OBJC_IVAR____TtC11PassKitCore27RemoteNetworkPaymentSession_delegate);
}

- (void)paymentAuthorizationCoordinator:(id)a3 didRequestMerchantSessionUpdate:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC11PassKitCore27RemoteNetworkPaymentSession *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_18FDA3684;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_18FDA3308((uint64_t)v6, v7);
  sub_18FD4A1C4((uint64_t)v6);

}

- (void)paymentAuthorizationCoordinator:(id)a3 didChangeCouponCode:(id)a4 handler:(id)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _TtC11PassKitCore27RemoteNetworkPaymentSession *v16;

  v8 = _Block_copy(a5);
  v9 = v8;
  if (a4)
  {
    v10 = sub_1903D05C8();
    a4 = v11;
    if (v9)
    {
      v12 = v10;
      v13 = swift_allocObject();
      *(_QWORD *)(v13 + 16) = v9;
      if (a4)
      {
        v14 = v13;
        v15 = a3;
        v16 = self;
        sub_18FD9DF04(v12, (uint64_t)a4, (uint64_t)sub_18FDA3684, v14);
        sub_18FD4A1C4((uint64_t)sub_18FDA3684);

        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_8;
    }
  }
  else
  {
    if (!v8)
    {
LABEL_8:
      __break(1u);
      goto LABEL_9;
    }
    swift_allocObject();
    __break(1u);
  }
  if (!a4)
    goto LABEL_8;
LABEL_9:
  __break(1u);
}

- (void)paymentAuthorizationCoordinator:(id)a3 didSelectShippingAddress:(id)a4 handler:(id)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  _TtC11PassKitCore27RemoteNetworkPaymentSession *v14;

  v8 = _Block_copy(a5);
  if (v8)
  {
    v9 = v8;
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v9;
    if (a4)
    {
      v11 = v10;
      v12 = a3;
      v13 = a4;
      v14 = self;
      sub_18FD9E258((uint64_t)v13, (uint64_t)sub_18FDA3684, v11);
      sub_18FD4A1C4((uint64_t)sub_18FDA3684);

      return;
    }
    goto LABEL_5;
  }
  if (!a4)
LABEL_5:
    __break(1u);
  __break(1u);
}

- (void)paymentAuthorizationCoordinator:(id)a3 didSelectPaymentMethod:(id)a4 handler:(id)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _TtC11PassKitCore27RemoteNetworkPaymentSession *v13;

  v8 = _Block_copy(a5);
  if (v8)
  {
    v9 = v8;
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v9;
    v11 = a3;
    v12 = a4;
    v13 = self;
    sub_18FD9E608(a4, (uint64_t)sub_18FDA3684, v10);

    swift_release();
  }
  else
  {
    __break(1u);
  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 didSelectShippingMethod:(id)a4 handler:(id)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  _TtC11PassKitCore27RemoteNetworkPaymentSession *v14;

  v8 = _Block_copy(a5);
  if (v8)
  {
    v9 = v8;
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v9;
    if (a4)
    {
      v11 = v10;
      v12 = a3;
      v13 = a4;
      v14 = self;
      sub_18FD9E978(v13, (uint64_t)sub_18FDA3684, v11);
      sub_18FD4A1C4((uint64_t)sub_18FDA3684);

      return;
    }
    goto LABEL_5;
  }
  if (!a4)
LABEL_5:
    __break(1u);
  __break(1u);
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  _TtC11PassKitCore27RemoteNetworkPaymentSession *v14;

  v8 = _Block_copy(a5);
  if (v8)
  {
    v9 = v8;
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v9;
    if (a4)
    {
      v11 = v10;
      v12 = a3;
      v13 = a4;
      v14 = self;
      sub_18FD9ED2C(v13, (uint64_t)sub_18FDA2E40, v11);
      sub_18FD4A1C4((uint64_t)sub_18FDA2E40);

      return;
    }
    goto LABEL_5;
  }
  if (!a4)
LABEL_5:
    __break(1u);
  __break(1u);
}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  id v5;
  _TtC11PassKitCore27RemoteNetworkPaymentSession *v6;

  v5 = a3;
  v6 = self;
  sub_18FDA1B90(a3);

}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  return 0;
}

- (_TtC11PassKitCore27RemoteNetworkPaymentSession)init
{
  _TtC11PassKitCore27RemoteNetworkPaymentSession *result;

  result = (_TtC11PassKitCore27RemoteNetworkPaymentSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
