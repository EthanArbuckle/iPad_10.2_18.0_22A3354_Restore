@implementation SecOSTransactionHolder

- (id)init:(id)a3
{
  id v5;
  SecOSTransactionHolder *v6;
  SecOSTransactionHolder *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SecOSTransactionHolder;
  v6 = -[SecOSTransactionHolder init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_transaction, a3);

  return v7;
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
