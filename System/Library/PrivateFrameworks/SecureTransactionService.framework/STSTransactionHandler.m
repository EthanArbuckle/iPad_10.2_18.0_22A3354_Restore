@implementation STSTransactionHandler

- (STSTransactionHandler)initWithParent:(id)a3
{
  id v4;
  STSTransactionHandler *v5;
  STSTransactionHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)STSTransactionHandler;
  v5 = -[STSTransactionHandler init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_parent, v4);

  return v6;
}

- (id)startTransactionWithAuthorization:(id)a3 options:(unint64_t)a4
{
  return 0;
}

- (id)stopTransaction
{
  return 0;
}

- (STSSession)parent
{
  return (STSSession *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
}

@end
