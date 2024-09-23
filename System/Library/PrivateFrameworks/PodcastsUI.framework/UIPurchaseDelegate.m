@implementation UIPurchaseDelegate

- (_TtC10PodcastsUI18UIPurchaseDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10PodcastsUI18UIPurchaseDelegate_senderWindow) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UIPurchaseDelegate();
  return -[UIPurchaseDelegate init](&v3, sel_init);
}

- (void).cxx_destruct
{

}

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  sub_1DA4E2A40(self, (int)a2, a3, a4, a5, (uint64_t)&unk_1EA0C76B8, (uint64_t)sub_1DA4E412C, (void (*)(id, id, uint64_t, uint64_t))_s10PodcastsUI18UIPurchaseDelegateC8purchase_6handle10completionySo11AMSPurchaseC_So22AMSAuthenticateRequestCySo0I6ResultCSg_s5Error_pSgtctF_0);
}

- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  sub_1DA4E2A40(self, (int)a2, a3, a4, a5, (uint64_t)&unk_1EA0C7690, (uint64_t)sub_1DA4E412C, (void (*)(id, id, uint64_t, uint64_t))_s10PodcastsUI18UIPurchaseDelegateC8purchase_6handle10completionySo11AMSPurchaseC_So16AMSDialogRequestCySo0I6ResultCSg_s5Error_pSgtctF_0);
}

- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  sub_1DA4E2A40(self, (int)a2, a3, a4, a5, (uint64_t)&unk_1EA0C7668, (uint64_t)sub_1DA4E412C, (void (*)(id, id, uint64_t, uint64_t))_s10PodcastsUI18UIPurchaseDelegateC8purchase_6handle10completionySo11AMSPurchaseC_So20AMSEngagementRequestCySo0I6ResultCSg_s5Error_pSgtctF_0);
}

@end
