@implementation _TUIDynamicValueUpdate

- (_TUIDynamicValueUpdate)initWithValue:(id)a3 transaction:(id)a4
{
  id v7;
  id v8;
  _TUIDynamicValueUpdate *v9;
  _TUIDynamicValueUpdate *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_TUIDynamicValueUpdate;
  v9 = -[_TUIDynamicValueUpdate init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_value, a3);
    objc_storeStrong((id *)&v10->_transaction, a4);
    -[_TUITransaction addCompletionDeferral](v10->_transaction, "addCompletionDeferral");
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[_TUITransaction removeCompletionDeferral](self->_transaction, "removeCompletionDeferral");
  v3.receiver = self;
  v3.super_class = (Class)_TUIDynamicValueUpdate;
  -[_TUIDynamicValueUpdate dealloc](&v3, "dealloc");
}

- (id)value
{
  return self->_value;
}

- (_TUITransaction)transaction
{
  return self->_transaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong(&self->_value, 0);
}

@end
