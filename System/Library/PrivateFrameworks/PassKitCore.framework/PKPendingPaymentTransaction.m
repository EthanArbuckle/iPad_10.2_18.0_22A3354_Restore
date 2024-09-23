@implementation PKPendingPaymentTransaction

- (PKPendingPaymentTransaction)initWithTransaction:(id)a3 pass:(id)a4 paymentApplication:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKPendingPaymentTransaction *v12;
  PKPendingPaymentTransaction *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKPendingPaymentTransaction;
  v12 = -[PKPendingPaymentTransaction init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_transaction, a3);
    objc_storeStrong((id *)&v13->_pass, a4);
    objc_storeStrong((id *)&v13->_paymentApplication, a5);
  }

  return v13;
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
}

- (PKPaymentApplication)paymentApplication
{
  return self->_paymentApplication;
}

- (void)setPaymentApplication:(id)a3
{
  objc_storeStrong((id *)&self->_paymentApplication, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentApplication, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
