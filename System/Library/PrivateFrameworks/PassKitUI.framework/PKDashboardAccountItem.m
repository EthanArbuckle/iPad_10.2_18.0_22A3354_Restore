@implementation PKDashboardAccountItem

- (PKDashboardAccountItem)initWithAccount:(id)a3 presentingPass:(id)a4
{
  id v7;
  id v8;
  PKDashboardAccountItem *v9;
  PKDashboardAccountItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKDashboardAccountItem;
  v9 = -[PKDashboardAccountItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_presentingPass, a4);
  }

  return v10;
}

+ (id)identifier
{
  return CFSTR("accountItem");
}

- (PKAccount)account
{
  return self->_account;
}

- (PKPaymentPass)presentingPass
{
  return self->_presentingPass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingPass, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
