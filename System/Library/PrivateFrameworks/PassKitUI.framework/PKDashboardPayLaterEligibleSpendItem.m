@implementation PKDashboardPayLaterEligibleSpendItem

- (PKDashboardPayLaterEligibleSpendItem)initWithPayLaterAccount:(id)a3
{
  id v5;
  PKDashboardPayLaterEligibleSpendItem *v6;
  PKDashboardPayLaterEligibleSpendItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDashboardPayLaterEligibleSpendItem;
  v6 = -[PKDashboardPayLaterEligibleSpendItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_payLaterAccount, a3);

  return v7;
}

+ (id)identifier
{
  return CFSTR("payLaterEligibleSpendItem");
}

- (PKAccount)payLaterAccount
{
  return self->_payLaterAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payLaterAccount, 0);
}

@end
