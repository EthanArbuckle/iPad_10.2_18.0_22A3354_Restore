@implementation PaymentOfferCriteriaSetupWebView.Coordinator

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtCV9PassKitUI32PaymentOfferCriteriaSetupWebView11Coordinator *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_19D578924(v10, (uint64_t)v11, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE4947E0);
  sub_19DE876A8();
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE4947E0);
  sub_19DE876A8();
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE4947E0);
  sub_19DE876A8();
}

- (void)webView:(WKWebView *)a3 requestMediaCapturePermissionForOrigin:(WKSecurityOrigin *)a4 initiatedByFrame:(WKFrameInfo *)a5 type:(int64_t)a6 decisionHandler:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  WKWebView *v22;
  WKSecurityOrigin *v23;
  WKFrameInfo *v24;
  _TtCV9PassKitUI32PaymentOfferCriteriaSetupWebView11Coordinator *v25;
  uint64_t v26;

  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE49E4F0);
  MEMORY[0x1E0C80A78](v13, v14);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = _Block_copy(a7);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = a3;
  v18[3] = a4;
  v18[4] = a5;
  v18[5] = a6;
  v18[6] = v17;
  v18[7] = self;
  v19 = sub_19DE87F30();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v16, 1, 1, v19);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_1EE4A99C0;
  v20[5] = v18;
  v21 = (_QWORD *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_1EE49E550;
  v21[5] = v20;
  v22 = a3;
  v23 = a4;
  v24 = a5;
  v25 = self;
  sub_19D83942C((uint64_t)v16, (uint64_t)&unk_1EE4A99D0, (uint64_t)v21);
  swift_release();
}

- (_TtCV9PassKitUI32PaymentOfferCriteriaSetupWebView11Coordinator)init
{
  _TtCV9PassKitUI32PaymentOfferCriteriaSetupWebView11Coordinator *result;

  result = (_TtCV9PassKitUI32PaymentOfferCriteriaSetupWebView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v2;

  v2 = *(void **)&self->parent[OBJC_IVAR____TtCV9PassKitUI32PaymentOfferCriteriaSetupWebView11Coordinator_parent + 8];
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
}

@end
