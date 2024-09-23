@implementation MSDTransactionTask

- (MSDTransactionTask)initWithIdentifier:(id)a3
{
  id v5;
  MSDTransactionTask *v6;
  MSDTransactionTask *v7;
  uint64_t v8;
  OS_os_transaction *transaction;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSDTransactionTask;
  v6 = -[MSDTransactionTask init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transactionID, a3);
    v8 = os_transaction_create(objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
    transaction = v7->_transaction;
    v7->_transaction = (OS_os_transaction *)v8;

  }
  return v7;
}

+ (id)createTransactionWithIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;

  v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:", v4);
  }
  else
  {
    v6 = sub_10002E034();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100020B5C(v7);

    v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  OS_os_transaction *transaction;
  objc_super v5;

  v3 = objc_autoreleasePoolPush();
  transaction = self->_transaction;
  self->_transaction = 0;

  objc_autoreleasePoolPop(v3);
  v5.receiver = self;
  v5.super_class = (Class)MSDTransactionTask;
  -[MSDTransactionTask dealloc](&v5, "dealloc");
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<MSDTransactionTask: TaskID: %@ Transaction: %@>"), self->_transactionID, self->_transaction);
}

- (void)releaseTransaction
{
  void *v3;
  OS_os_transaction *transaction;

  v3 = objc_autoreleasePoolPush();
  transaction = self->_transaction;
  self->_transaction = 0;

  objc_autoreleasePoolPop(v3);
}

- (NSString)transactionID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTransactionID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionID, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
