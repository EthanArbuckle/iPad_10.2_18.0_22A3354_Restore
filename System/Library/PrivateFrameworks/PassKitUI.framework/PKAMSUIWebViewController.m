@implementation PKAMSUIWebViewController

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (_TtC9PassKitUI24PKAMSUIWebViewController)initWithBag:(id)a3 account:(id)a4 clientInfo:(id)a5
{
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PKAMSUIWebViewController();
  return -[AMSUIWebViewController initWithBag:account:clientInfo:](&v9, sel_initWithBag_account_clientInfo_, a3, a4, a5);
}

- (_TtC9PassKitUI24PKAMSUIWebViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PKAMSUIWebViewController();
  return -[PKAMSUIWebViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
