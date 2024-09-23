@implementation JSStoreFlowSegue

- (void)cloudServiceSetupViewControllerDidDismiss:(id)a3
{
  id v4;
  _TtC11MusicJSCore16JSStoreFlowSegue *v5;

  v4 = a3;
  v5 = self;
  JSStoreFlowSegue.cloudServiceSetupViewControllerDidDismiss(_:)((SKCloudServiceSetupViewController)v4);

}

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC11MusicJSCore16JSStoreFlowSegue *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_1351370, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  _s11MusicJSCore16JSStoreFlowSegueC0A11ApplicationE17webViewController_6handle10completionySo08AMSUIWebhI0C_So22AMSAuthenticateRequestCySo0M6ResultCSg_s5Error_pSgtctF_0(v10, (uint64_t)v11, (uint64_t)sub_222390, v9);

  swift_release(v9);
}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  void *v5;

  v5 = _Block_copy(a5);
  _Block_release(v5);
  return 0;
}

- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC11MusicJSCore16JSStoreFlowSegue *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_22137C((uint64_t)v10, v11, (void (**)(_QWORD, _QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC11MusicJSCore16JSStoreFlowSegue *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_22160C(a4, (uint64_t)a5);

}

- (id)dynamicViewController:(id)a3 contentViewWithDictionary:(id)a4 frame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _TtC11MusicJSCore16JSStoreFlowSegue *v16;
  id v17;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v13 = objc_allocWithZone((Class)type metadata accessor for UpsellArtworkGrid());
  v14 = a3;
  v15 = a4;
  v16 = self;
  v17 = sub_7A9080(x, y, width, height);

  swift_bridgeObjectRelease(v12);
  return v17;
}

- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC11MusicJSCore16JSStoreFlowSegue *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_221A18((uint64_t)a5);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;

  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__url;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1511A58);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v6 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__sourceApplicationBundleIdentifier;
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14CF9D0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__referrerURL, v4);
  v8 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__userInfo;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1512520);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__scriptingMetricsOverlay;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1512388);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  v12 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__didCompleteSubscriptionPurchase;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1512538);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  v14 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__subscriptionStatus;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1512548);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
  v16 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__didFinishLinkingWithCarrier;
  v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14B7070);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);
}

@end
