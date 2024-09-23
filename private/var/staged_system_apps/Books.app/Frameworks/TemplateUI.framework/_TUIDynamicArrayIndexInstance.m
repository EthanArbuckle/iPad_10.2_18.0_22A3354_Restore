@implementation _TUIDynamicArrayIndexInstance

- (_TUIDynamicArrayIndexInstance)initWithDynamicValue:(id)a3 observer:(id)a4
{
  id v6;
  _TUIDynamicArrayIndexInstance *v7;
  void *v8;
  uint64_t v9;
  _TUIDynamicArrayInstance *instance;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_TUIDynamicArrayIndexInstance;
  v7 = -[_TUIDynamicValueInstance initWithDynamicValue:value:observer:](&v12, "initWithDynamicValue:value:observer:", v6, 0, a4);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subarray"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "instanceForObserver:", v7));
    instance = v7->_instance;
    v7->_instance = (_TUIDynamicArrayInstance *)v9;

  }
  return v7;
}

- (void)valueWithBlock:(id)a3
{
  id v4;
  _TUIDynamicArrayInstance *instance;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    if (-[_TUIDynamicArrayInstance count](self->_instance, "count"))
    {
      instance = self->_instance;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_BF078;
      v7[3] = &unk_240E78;
      v8 = v6;
      -[_TUIDynamicArrayInstance objectsInRange:block:](instance, "objectsInRange:block:", 0, 1, v7);

    }
    else
    {
      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    }
    v4 = v6;
  }

}

- (BOOL)optimizeUpdatesForTransactionGroup:(id)a3
{
  return -[_TUIDynamicArrayInstance optimizeUpdatesForTransactionGroup:](self->_instance, "optimizeUpdatesForTransactionGroup:", a3);
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
