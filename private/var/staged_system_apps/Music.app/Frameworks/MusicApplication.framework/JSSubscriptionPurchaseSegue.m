@implementation JSSubscriptionPurchaseSegue

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  sub_739D04(self, (int)a2, a3, a4, a5, (void (*)(id, id, void *))sub_73A408);
}

- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  sub_739D04(self, (int)a2, a3, a4, a5, (void (*)(id, id, void *))sub_73A66C);
}

- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  sub_739D04(self, (int)a2, a3, a4, a5, (void (*)(id, id, void *))sub_73A8CC);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore27JSSubscriptionPurchaseSegue__buyParameters;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14CF9D0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11MusicJSCore27JSSubscriptionPurchaseSegue__metricsOverlay;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1512388);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC11MusicJSCore27JSSubscriptionPurchaseSegue__shouldShowLoadingIndicator;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14B7070);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

@end
