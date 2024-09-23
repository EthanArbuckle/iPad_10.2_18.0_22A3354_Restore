@implementation CustomWebViewDelegate

- (void)webView:(WKWebView *)a3 decidePolicyForNavigationAction:(WKNavigationAction *)a4 decisionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  WKWebView *v17;
  WKNavigationAction *v18;
  _TtC16MusicApplicationP33_A44CA31837F9239C8C812822EC26BF4D21CustomWebViewDelegate *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14AD5A0);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_136B120, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_136B148, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_14CFA70;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_136B170, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_14CFA80;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = sub_4E9154((uint64_t)v11, (uint64_t)&unk_14CFA90, (uint64_t)v16);
  swift_release(v20);
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  _TtC16MusicApplicationP33_A44CA31837F9239C8C812822EC26BF4D21CustomWebViewDelegate *v12;
  id v13;
  id v14;
  __n128 v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14AD5A0);
  __chkstk_darwin(v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  type metadata accessor for MainActor(0);
  v11 = a3;
  v12 = self;
  v13 = v11;
  v14 = a4;
  v16 = static MainActor.shared.getter(v15);
  v17 = (_QWORD *)swift_allocObject(&unk_136B0F8, 48, 7);
  v17[2] = v16;
  v17[3] = &protocol witness table for MainActor;
  v17[4] = v12;
  v17[5] = v13;
  v18 = sub_2223C8((uint64_t)v9, (uint64_t)&unk_14CFA60, (uint64_t)v17);

  swift_release(v18);
}

- (void)webView:(void *)a3 didFailNavigation:(void *)a4 withError:(void *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v11 = a5;
  v10 = a1;
  sub_4E4000(v8, a4, (uint64_t)v11);

}

- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
  sub_4E5560(self, (int)a2, a3, a4, a5, (void (*)(id, id, id, void *))sub_4EB850);
}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  sub_4E5560(self, (int)a2, a3, a4, a5, (void (*)(id, id, id, void *))sub_4EC480);
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  id v12;
  _TtC16MusicApplicationP33_A44CA31837F9239C8C812822EC26BF4D21CustomWebViewDelegate *v13;
  id v14;
  id v15;
  __n128 v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14AD5A0);
  __chkstk_darwin(v7);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  type metadata accessor for MainActor(0);
  v11 = a3;
  v12 = a4;
  v13 = self;
  v14 = v11;
  v15 = v12;
  v17 = static MainActor.shared.getter(v16);
  v18 = (_QWORD *)swift_allocObject(&unk_136AE78, 56, 7);
  v18[2] = v17;
  v18[3] = &protocol witness table for MainActor;
  v18[4] = v13;
  v18[5] = v14;
  v18[6] = a4;
  v19 = sub_2223C8((uint64_t)v9, (uint64_t)&unk_14CFA20, (uint64_t)v18);

  swift_release(v19);
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4 replyHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC16MusicApplicationP33_A44CA31837F9239C8C812822EC26BF4D21CustomWebViewDelegate *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_4ECB64(v10, (uint64_t)v11, v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  id v4;
  _TtC16MusicApplicationP33_A44CA31837F9239C8C812822EC26BF4D21CustomWebViewDelegate *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_4ED77C();
  v7 = v6;

  return v7;
}

- (_TtC16MusicApplicationP33_A44CA31837F9239C8C812822EC26BF4D21CustomWebViewDelegate)init
{
  _TtC16MusicApplicationP33_A44CA31837F9239C8C812822EC26BF4D21CustomWebViewDelegate *result;

  result = (_TtC16MusicApplicationP33_A44CA31837F9239C8C812822EC26BF4D21CustomWebViewDelegate *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.CustomWebViewDelegate", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplicationP33_A44CA31837F9239C8C812822EC26BF4D21CustomWebViewDelegate_dismissNotification));
  sub_4E8DE8(*(void **)((char *)&self->super.isa+ OBJC_IVAR____TtC16MusicApplicationP33_A44CA31837F9239C8C812822EC26BF4D21CustomWebViewDelegate_authSessionState), *(_QWORD *)&self->dismissNotification[OBJC_IVAR____TtC16MusicApplicationP33_A44CA31837F9239C8C812822EC26BF4D21CustomWebViewDelegate_authSessionState], self->authSessionState[OBJC_IVAR____TtC16MusicApplicationP33_A44CA31837F9239C8C812822EC26BF4D21CustomWebViewDelegate_authSessionState]);
  v3 = *(_QWORD *)&self->dismissNotification[OBJC_IVAR____TtC16MusicApplicationP33_A44CA31837F9239C8C812822EC26BF4D21CustomWebViewDelegate_bag];
  v4 = *(_QWORD *)&self->authSessionState[OBJC_IVAR____TtC16MusicApplicationP33_A44CA31837F9239C8C812822EC26BF4D21CustomWebViewDelegate_bag
                                        + 8];
  v5 = *(_QWORD *)&self->authSessionState[OBJC_IVAR____TtC16MusicApplicationP33_A44CA31837F9239C8C812822EC26BF4D21CustomWebViewDelegate_bag
                                        + 16];
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16MusicApplicationP33_A44CA31837F9239C8C812822EC26BF4D21CustomWebViewDelegate_bag));
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v5);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplicationP33_A44CA31837F9239C8C812822EC26BF4D21CustomWebViewDelegate_model));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_A44CA31837F9239C8C812822EC26BF4D21CustomWebViewDelegate_currentAuthSession));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplicationP33_A44CA31837F9239C8C812822EC26BF4D21CustomWebViewDelegate_canGoBackObserver));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplicationP33_A44CA31837F9239C8C812822EC26BF4D21CustomWebViewDelegate_canGoForwardObserver));
  sub_4EDCF4(*(void **)((char *)&self->super.isa+ OBJC_IVAR____TtC16MusicApplicationP33_A44CA31837F9239C8C812822EC26BF4D21CustomWebViewDelegate_authChallenge), *(_QWORD *)&self->dismissNotification[OBJC_IVAR____TtC16MusicApplicationP33_A44CA31837F9239C8C812822EC26BF4D21CustomWebViewDelegate_authChallenge], *(_QWORD *)&self->authSessionState[OBJC_IVAR____TtC16MusicApplicationP33_A44CA31837F9239C8C812822EC26BF4D21CustomWebViewDelegate_authChallenge]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_A44CA31837F9239C8C812822EC26BF4D21CustomWebViewDelegate_lastNavigation));
}

@end
