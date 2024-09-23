@implementation PKAppleBalanceAddMoneyUIManager

- (PKAppleBalanceAddMoneyUIManager)initWithAccount:(id)a3
{
  id v4;
  PKAppleBalanceAddMoneyUIManager *v5;
  _PKAppleBalanceAddMoneyUIManager *v6;
  _PKAppleBalanceAddMoneyUIManager *manager;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAppleBalanceAddMoneyUIManager;
  v5 = -[PKAppleBalanceAddMoneyUIManager init](&v9, sel_init);
  if (v5)
  {
    v6 = -[_PKAppleBalanceAddMoneyUIManager initWithAccount:]([_PKAppleBalanceAddMoneyUIManager alloc], "initWithAccount:", v4);
    manager = v5->_manager;
    v5->_manager = v6;

  }
  return v5;
}

- (void)presentAddMoneyFromViewController:(id)a3 dtuConfiguration:(id)a4 inStoreToken:(id)a5
{
  -[_PKAppleBalanceAddMoneyUIManager presentAddMoneyFrom:dtuConfiguration:inStoreToken:](self->_manager, "presentAddMoneyFrom:dtuConfiguration:inStoreToken:", a3, a4, a5);
}

- (void)presentAddMoneyInterstitialFromViewController:(id)a3 dtuConfiguration:(id)a4 inStoreToken:(id)a5
{
  -[_PKAppleBalanceAddMoneyUIManager presentAddMoneyInterstitialFrom:dtuConfiguration:inStoreToken:](self->_manager, "presentAddMoneyInterstitialFrom:dtuConfiguration:inStoreToken:", a3, a4, a5);
}

- (void)presentDirectTopUpFromViewController:(id)a3 context:(int64_t)a4 configuration:(id)a5 promotion:(id)a6 completion:(id)a7
{
  -[_PKAppleBalanceAddMoneyUIManager presentDirectTopUpFrom:context:configuration:promotion:completion:](self->_manager, "presentDirectTopUpFrom:context:configuration:promotion:completion:", a3, a4, a5, a6, a7);
}

- (void)presentAMSRedeemGiftcardFromViewController:(id)a3 webViewDelegate:(id)a4
{
  -[_PKAppleBalanceAddMoneyUIManager presentAMSRedeemGiftcardFrom:webViewDelegate:](self->_manager, "presentAMSRedeemGiftcardFrom:webViewDelegate:", a3, a4);
}

- (void)presentInStoreTopUpFromViewController:(id)a3 context:(int64_t)a4 token:(id)a5
{
  -[_PKAppleBalanceAddMoneyUIManager presentInStoreTopUpFrom:context:token:](self->_manager, "presentInStoreTopUpFrom:context:token:", a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
