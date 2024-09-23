@implementation PKDashboardPayLaterAccountItem

- (PKDashboardPayLaterAccountItem)initWithPayLaterAccount:(id)a3 dueNext30Days:(id)a4 totalPending:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKDashboardPayLaterAccountItem *v12;
  PKDashboardPayLaterAccountItem *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKDashboardPayLaterAccountItem;
  v12 = -[PKDashboardPayLaterAccountItem init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_payLaterAccount, a3);
    objc_storeStrong((id *)&v13->_dueNext30Days, a4);
    objc_storeStrong((id *)&v13->_totalPending, a5);
  }

  return v13;
}

+ (id)identifier
{
  return CFSTR("payLaterAccountItem");
}

- (PKAccount)payLaterAccount
{
  return self->_payLaterAccount;
}

- (PKCurrencyAmount)dueNext30Days
{
  return self->_dueNext30Days;
}

- (PKCurrencyAmount)totalPending
{
  return self->_totalPending;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalPending, 0);
  objc_storeStrong((id *)&self->_dueNext30Days, 0);
  objc_storeStrong((id *)&self->_payLaterAccount, 0);
}

@end
