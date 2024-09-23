@implementation PKDashboardPassGroupItem

- (PKDashboardPassGroupItem)initWithGroupView:(id)a3
{
  id v5;
  PKDashboardPassGroupItem *v6;
  PKDashboardPassGroupItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDashboardPassGroupItem;
  v6 = -[PKDashboardPassGroupItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_groupView, a3);

  return v7;
}

+ (id)identifier
{
  return CFSTR("pass");
}

- (PKPassGroupView)groupView
{
  return self->_groupView;
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (void)setPeerPaymentAccount:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentAccount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_groupView, 0);
}

@end
