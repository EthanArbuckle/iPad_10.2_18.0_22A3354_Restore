@implementation _PKRemoteNetworkPaymentLoadingViewInterface

- (_PKRemoteNetworkPaymentLoadingViewInterface)initWithContext:(id)a3 configuration:(id)a4
{
  return (_PKRemoteNetworkPaymentLoadingViewInterface *)RemoteNetworkPaymentLoadingViewInterface.init(context:configuration:)(a3, a4);
}

- (UIViewController)primaryViewController
{
  _PKRemoteNetworkPaymentLoadingViewInterface *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_19D81FA98();

  return (UIViewController *)v3;
}

- (PKPaymentAuthorizationServiceProtocol)serviceDelegate
{
  return (PKPaymentAuthorizationServiceProtocol *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                          + OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_internalService));
}

- (void)didAppear
{
  _PKRemoteNetworkPaymentLoadingViewInterface *v2;

  v2 = self;
  sub_19D81FC04();

}

- (_PKRemoteNetworkPaymentLoadingViewInterface)init
{
  _PKRemoteNetworkPaymentLoadingViewInterface *result;

  result = (_PKRemoteNetworkPaymentLoadingViewInterface *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[13];
  uint64_t v10;

  swift_release();
  swift_release();
  v3 = *(_OWORD *)&self->loadingView[OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView + 136];
  v9[10] = *(_OWORD *)&self->loadingView[OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView + 120];
  v9[11] = v3;
  v9[12] = *(_OWORD *)&self->loadingView[OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView + 152];
  v10 = *(_QWORD *)&self->loadingView[OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView + 168];
  v4 = *(_OWORD *)&self->loadingView[OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView + 72];
  v9[6] = *(_OWORD *)&self->loadingView[OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView + 56];
  v9[7] = v4;
  v5 = *(_OWORD *)&self->loadingView[OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView + 104];
  v9[8] = *(_OWORD *)&self->loadingView[OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView + 88];
  v9[9] = v5;
  v6 = *(_OWORD *)&self->loadingView[OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView + 8];
  v9[2] = *(_OWORD *)&self->loadingViewModel[OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView];
  v9[3] = v6;
  v7 = *(_OWORD *)&self->loadingView[OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView + 40];
  v9[4] = *(_OWORD *)&self->loadingView[OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView + 24];
  v9[5] = v7;
  v8 = *(_OWORD *)&self->configuration[OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView];
  v9[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView);
  v9[1] = v8;
  sub_19D821C34((uint64_t)v9);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingViewSerialQueue));

}

@end
