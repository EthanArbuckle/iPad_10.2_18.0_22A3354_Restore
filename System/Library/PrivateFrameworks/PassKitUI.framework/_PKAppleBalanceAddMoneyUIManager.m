@implementation _PKAppleBalanceAddMoneyUIManager

- (_PKAppleBalanceAddMoneyUIManager)initWithAccount:(id)a3
{
  id v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____PKAppleBalanceAddMoneyUIManager_activeViewController) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____PKAppleBalanceAddMoneyUIManager_dtuModel) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____PKAppleBalanceAddMoneyUIManager_account) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AppleBalanceAddMoneyUIManager();
  v4 = a3;
  return -[_PKAppleBalanceAddMoneyUIManager init](&v6, sel_init);
}

- (void)presentAddMoneyFrom:(id)a3 dtuConfiguration:(id)a4 inStoreToken:(id)a5
{
  sub_19D6A5F60(self, (uint64_t)a2, a3, a4, a5, sub_19D6A5D20);
}

- (void)presentAddMoneyInterstitialFrom:(id)a3 dtuConfiguration:(id)a4 inStoreToken:(id)a5
{
  sub_19D6A5F60(self, (uint64_t)a2, a3, a4, a5, sub_19D6A5E64);
}

- (void)presentDirectTopUpFrom:(id)a3 context:(int64_t)a4 configuration:(id)a5 promotion:(id)a6 completion:(id)a7
{
  void (*v12)(_QWORD);
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _PKAppleBalanceAddMoneyUIManager *v17;

  v12 = (void (*)(_QWORD))_Block_copy(a7);
  if (v12)
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = v12;
    v12 = (void (*)(_QWORD))sub_19D6AB584;
  }
  else
  {
    v13 = 0;
  }
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = self;
  sub_19D6A5FF0(v14, (void *)a4, a5, (uint8_t *)a6, v12, v13);
  sub_19D1A9F60((uint64_t)v12);

}

- (void)presentAMSDirectTopUpFrom:(id)a3 context:(int64_t)a4 webViewDelegate:(id)a5 completion:(id)a6
{
  void (*v10)(_QWORD);
  uint64_t v11;
  id v12;
  _PKAppleBalanceAddMoneyUIManager *v13;

  v10 = (void (*)(_QWORD))_Block_copy(a6);
  if (v10)
  {
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v10;
    v10 = (void (*)(_QWORD))sub_19D2A2A84;
  }
  else
  {
    v11 = 0;
  }
  v12 = a3;
  swift_unknownObjectRetain();
  v13 = self;
  sub_19D6A73B4(0, v12, a4, 0, (uint64_t)a5, v10, v11);
  sub_19D1A9F60((uint64_t)v10);

  swift_unknownObjectRelease();
}

- (void)presentAMSRedeemGiftcardFrom:(id)a3 webViewDelegate:(id)a4
{
  id v6;
  _PKAppleBalanceAddMoneyUIManager *v7;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_19D6A73B4(1u, v6, 1, 0, (uint64_t)a4, 0, 0);

  swift_unknownObjectRelease();
}

- (void)presentAMSPromotionRedemptionViewFrom:(id)a3 promotionInfo:(id)a4 webViewDelegate:(id)a5
{
  uint64_t v8;
  id v9;
  _PKAppleBalanceAddMoneyUIManager *v10;
  void *v11;

  v8 = sub_19DE87AC8();
  v9 = a3;
  swift_unknownObjectRetain();
  v10 = self;
  v11 = (void *)sub_19D299E14(v8);
  sub_19D6A73B4(2u, v9, 2, v11, (uint64_t)a5, 0, 0);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)presentInStoreTopUpFrom:(id)a3 context:(int64_t)a4 token:(id)a5
{
  void *v9;
  id v10;
  id v11;
  id v12;
  _PKAppleBalanceAddMoneyUIManager *v13;
  char *v14;

  v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____PKAppleBalanceAddMoneyUIManager_account);
  v10 = objc_allocWithZone((Class)type metadata accessor for InStoreTopUpTokenModel());
  v11 = a5;
  v12 = a3;
  v13 = self;
  v14 = sub_19D782B38(v9, a5);
  sub_19D6A8320(v12, a4, v14);

}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  sub_19D6A9050(self, (int)a2, a3, a4, a5, a6, (void (*)(id, id, void *))sub_19D6AA170);
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  sub_19D6A9050(self, (int)a2, a3, a4, a5, a6, (void (*)(id, id, void *))sub_19D6AA45C);
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
  sub_19D6A9050(self, (int)a2, a3, a4, a5, a6, (void (*)(id, id, void *))sub_19D6AA748);
}

- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  sub_19D6A9A08(self, (int)a2, a3, a4, a5, (void (*)(id, id, void *))sub_19D6AAAC8);
}

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  sub_19D6A9A08(self, (int)a2, a3, a4, a5, (void (*)(id, id, void *))sub_19D6AADB4);
}

- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  sub_19D6A9A08(self, (int)a2, a3, a4, a5, (void (*)(id, id, void *))sub_19D6AB0A0);
}

- (_PKAppleBalanceAddMoneyUIManager)init
{
  _PKAppleBalanceAddMoneyUIManager *result;

  result = (_PKAppleBalanceAddMoneyUIManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
