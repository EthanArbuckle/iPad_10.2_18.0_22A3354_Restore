@implementation _TUIDynamicArrayEmptyInstance

- (_TUIDynamicArrayEmptyInstance)initWithDynamicValue:(id)a3 observer:(id)a4
{
  id v6;
  _TUIDynamicArrayEmptyInstance *v7;
  void *v8;
  uint64_t v9;
  _TUIDynamicArrayInstance *instance;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_TUIDynamicArrayEmptyInstance;
  v7 = -[_TUIDynamicValueInstance initWithDynamicValue:value:observer:](&v12, "initWithDynamicValue:value:observer:", v6, 0, a4);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "array"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "instanceForObserver:", v7));
    instance = v7->_instance;
    v7->_instance = (_TUIDynamicArrayInstance *)v9;

  }
  return v7;
}

- (void)valueWithBlock:(id)a3
{
  _TUIDynamicArrayInstance *instance;
  id v5;
  id v6;

  if (a3)
  {
    instance = self->_instance;
    v5 = a3;
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[_TUIDynamicArrayInstance count](instance, "count") == 0));
    (*((void (**)(id, id))a3 + 2))(v5, v6);

  }
}

- (BOOL)optimizeUpdatesForTransactionGroup:(id)a3
{
  _TUIDynamicArrayInstance *instance;
  id v5;
  BOOL v6;
  _TUIDynamicArrayInstance *v7;
  char v8;
  unsigned __int8 v9;
  _QWORD v11[4];
  char v12;

  instance = self->_instance;
  v5 = a3;
  v6 = -[_TUIDynamicArrayInstance count](instance, "count") == 0;
  v7 = self->_instance;
  v8 = v6;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_A792C;
  v11[3] = &unk_2407A8;
  v12 = v8;
  v9 = -[_TUIDynamicArrayInstance optimizeUpdatesForTransactionGroup:block:](v7, "optimizeUpdatesForTransactionGroup:block:", v5, v11);

  return v9;
}

- (BOOL)applyUpdatesForTransactionGroup:(id)a3
{
  return -[_TUIDynamicArrayInstance applyUpdatesForTransactionGroup:](self->_instance, "applyUpdatesForTransactionGroup:", a3);
}

- (void)dynamicChanged:(id)a3 transaction:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[_TUIDynamicValueInstance observer](self, "observer"));
  objc_msgSend(v6, "dynamicChanged:transaction:", self, v5);

}

- (_TUIDynamicArrayInstance)instance
{
  return self->_instance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instance, 0);
}

@end
