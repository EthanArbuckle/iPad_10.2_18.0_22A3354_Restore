@implementation RemoteNetworkPaymentLoadingViewService

- (void)handleHostApplicationWillResignActive:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC9PassKitUI38RemoteNetworkPaymentLoadingViewService *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;

  v4 = sub_19DE84E58();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = self;
  sub_19DE84E10();
  v10 = sub_19DE84E4C();
  v11 = sub_19DE88110();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_19D178000, v10, v11, "LoadingViewService: handleHostApplicationWillResignActive", v12, 2u);
    MEMORY[0x1A1AE696C](v12, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)handleHostApplicationDidBecomeActive
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC9PassKitUI38RemoteNetworkPaymentLoadingViewService *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;

  v3 = sub_19DE84E58();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_19DE84E10();
  v9 = sub_19DE84E4C();
  v10 = sub_19DE88110();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_19D178000, v9, v10, "LoadingViewService: handleHostApplicationDidBecomeActive", v11, 2u);
    MEMORY[0x1A1AE696C](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

- (void)handleDismissWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  _TtC9PassKitUI38RemoteNetworkPaymentLoadingViewService *v8;

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
  sub_19D71A278(v7, v6);
  sub_19D1A9F60((uint64_t)v7);

}

- (void)fulfillRemotePaymentRequestPromise:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC9PassKitUI38RemoteNetworkPaymentLoadingViewService *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_19D2A2A84;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_19D71A4BC(a3, (uint64_t)v6, v7);
  sub_19D1A9F60((uint64_t)v6);

}

- (void)rejectRemotePaymentRequestPromiseWithFailure:(unint64_t)a3
{
  _TtC9PassKitUI38RemoteNetworkPaymentLoadingViewService *v4;

  v4 = self;
  sub_19D71A6B4(a3);

}

- (void)authorizationDidRequestMerchantSessionCompleteWithUpdate:(id)a3
{
  sub_19DE888C0();
  __break(1u);
}

- (void)authorizationDidAuthorizeContextCompleteWithResult:(id)a3
{
  sub_19DE888C0();
  __break(1u);
}

- (void)authorizationDidAuthorizePaymentCompleteWithResult:(id)a3
{
  sub_19DE888C0();
  __break(1u);
}

- (void)authorizationDidAuthorizePurchaseCompleteWithStatus:(int64_t)a3
{
  sub_19DE888C0();
  __break(1u);
}

- (void)authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult:(id)a3
{
  sub_19DE888C0();
  __break(1u);
}

- (void)authorizationDidAuthorizeApplePayTrustSignatureCompleteWithResult:(id)a3
{
  sub_19DE888C0();
  __break(1u);
}

- (void)authorizationDidUpdateAccountServicePaymentMethodCompleteWithUpdate:(id)a3 signatureRequest:(id)a4
{
  sub_19DE888C0();
  __break(1u);
}

- (void)authorizationDidSelectShippingMethodCompleteWithUpdate:(id)a3
{
  sub_19DE888C0();
  __break(1u);
}

- (void)authorizationDidSelectShippingAddressCompleteWithUpdate:(id)a3
{
  sub_19DE888C0();
  __break(1u);
}

- (void)authorizationDidSelectPaymentMethodCompleteWithUpdate:(id)a3
{
  sub_19DE888C0();
  __break(1u);
}

- (void)authorizationDidChangeCouponCodeCompleteWithUpdate:(id)a3
{
  sub_19DE888C0();
  __break(1u);
}

- (_TtC9PassKitUI38RemoteNetworkPaymentLoadingViewService)init
{
  _TtC9PassKitUI38RemoteNetworkPaymentLoadingViewService *result;

  result = (_TtC9PassKitUI38RemoteNetworkPaymentLoadingViewService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38RemoteNetworkPaymentLoadingViewService_context));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38RemoteNetworkPaymentLoadingViewService_configuration));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI38RemoteNetworkPaymentLoadingViewService_delegate);
}

@end
