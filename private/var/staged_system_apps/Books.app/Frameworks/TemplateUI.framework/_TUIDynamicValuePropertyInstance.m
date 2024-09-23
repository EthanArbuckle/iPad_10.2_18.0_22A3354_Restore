@implementation _TUIDynamicValuePropertyInstance

- (_TUIDynamicValuePropertyInstance)initWithDynamicValue:(id)a3 observer:(id)a4
{
  id v6;
  _TUIDynamicValuePropertyInstance *v7;
  void *v8;
  uint64_t v9;
  _TUIDynamicValueInstance *instance;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_TUIDynamicValuePropertyInstance;
  v7 = -[_TUIDynamicValueInstance initWithDynamicValue:value:observer:](&v12, "initWithDynamicValue:value:observer:", v6, 0, a4);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "upstreamValue"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "instanceForObserver:", v7));
    instance = v7->_instance;
    v7->_instance = (_TUIDynamicValueInstance *)v9;

  }
  return v7;
}

- (void)valueWithBlock:(id)a3
{
  id v4;
  _TUIDynamicValueInstance *instance;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  instance = self->_instance;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_130DCC;
  v7[3] = &unk_2422C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[_TUIDynamicValueInstance valueWithBlock:](instance, "valueWithBlock:", v7);

}

- (BOOL)optimizeUpdatesForTransactionGroup:(id)a3
{
  return -[_TUIDynamicValueInstance optimizeUpdatesForTransactionGroup:](self->_instance, "optimizeUpdatesForTransactionGroup:", a3);
}

- (BOOL)applyUpdatesForTransactionGroup:(id)a3
{
  return -[_TUIDynamicValueInstance applyUpdatesForTransactionGroup:](self->_instance, "applyUpdatesForTransactionGroup:", a3);
}

- (void)dynamicChanged:(id)a3 transaction:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[_TUIDynamicValueInstance observer](self, "observer"));
  objc_msgSend(v6, "dynamicChanged:transaction:", self, v5);

}

- (_TUIDynamicValueInstance)instance
{
  return self->_instance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instance, 0);
}

@end
