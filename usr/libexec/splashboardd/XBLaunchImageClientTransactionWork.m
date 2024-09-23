@implementation XBLaunchImageClientTransactionWork

- (XBLaunchImageClientTransactionWork)init
{
  XBLaunchImageClientTransactionWork *v2;
  uint64_t v3;
  OS_os_transaction *transaction;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)XBLaunchImageClientTransactionWork;
  v2 = -[XBLaunchImageClientTransactionWork init](&v6, "init");
  if (v2)
  {
    v3 = os_transaction_create("LaunchImageClient");
    transaction = v2->_transaction;
    v2->_transaction = (OS_os_transaction *)v3;

  }
  return v2;
}

- (XBLaunchImageContextWrapper)contextWrapper
{
  return self->_contextWrapper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextWrapper, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

- (void)setContextWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_contextWrapper, a3);
}

@end
