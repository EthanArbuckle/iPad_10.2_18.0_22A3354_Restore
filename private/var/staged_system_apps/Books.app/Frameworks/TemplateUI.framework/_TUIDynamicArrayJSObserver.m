@implementation _TUIDynamicArrayJSObserver

- (_TUIDynamicArrayJSObserver)initWithCoordinator:(id)a3 block:(id)a4 array:(id)a5
{
  id v9;
  id v10;
  id v11;
  _TUIDynamicArrayJSObserver *v12;
  _TUIDynamicArrayJSObserver *v13;
  uint64_t v14;
  JSManagedValue *managedValue;
  uint64_t v16;
  TUIDynamicArrayInstance *instance;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_TUIDynamicArrayJSObserver;
  v12 = -[_TUIDynamicArrayJSObserver init](&v19, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_coordinator, a3);
    v14 = objc_claimAutoreleasedReturnValue(+[JSManagedValue managedValueWithValue:](JSManagedValue, "managedValueWithValue:", v10));
    managedValue = v13->_managedValue;
    v13->_managedValue = (JSManagedValue *)v14;

    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "instanceForObserver:", v13));
    instance = v13->_instance;
    v13->_instance = (TUIDynamicArrayInstance *)v16;

  }
  return v13;
}

- (void)dynamicChanged:(id)a3 transaction:(id)a4
{
  TUITransactionCoordinating *coordinator;
  _QWORD v5[5];

  coordinator = self->_coordinator;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_377F8;
  v5[3] = &unk_23E688;
  v5[4] = self;
  -[TUITransactionCoordinating scheduleLayoutUpdateWithTransaction:block:](coordinator, "scheduleLayoutUpdateWithTransaction:block:", a4, v5);
}

- (int64_t)count
{
  return (int64_t)-[TUIDynamicArrayInstance count](self->_instance, "count");
}

- (id)objectAtIndex:(int64_t)a3
{
  char *v5;
  void *v6;
  int64_t v7;
  unint64_t v8;
  TUIDynamicArrayInstance *instance;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = (char *)-[TUIDynamicArrayInstance count](self->_instance, "count");
  v6 = 0;
  if (a3 >= (unint64_t)v5)
    v7 = (int64_t)v5;
  else
    v7 = a3;
  if (a3 >= 0)
    v8 = v7;
  else
    v8 = (unint64_t)&v5[a3];
  if ((v8 & 0x8000000000000000) == 0 && v8 < (unint64_t)v5)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = sub_37A60;
    v20 = sub_37A70;
    v21 = 0;
    instance = self->_instance;
    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = sub_37A78;
    v14 = &unk_23E760;
    v15 = &v16;
    -[TUIDynamicArrayInstance objectsInRange:block:](instance, "objectsInRange:block:");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v17[5], "firstObject"));
    _Block_object_dispose(&v16, 8);

  }
  return v6;
}

- (id)objectsInRange:(int64_t)a3 :(int64_t)a4
{
  id v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v7 = -[TUIDynamicArrayInstance count](self->_instance, "count");
  if (a3 >= (unint64_t)v7)
    v8 = (int64_t)v7;
  else
    v8 = a3;
  if (a3 < 0)
    v8 = (int64_t)v7 + a3;
  if (a4 >= (unint64_t)v7)
    v9 = (int64_t)v7;
  else
    v9 = a4;
  if (a4 < 0)
    v9 = (int64_t)v7 + a4;
  if (v9 >= 0)
    v10 = v9 + 1;
  else
    v10 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_37A60;
  v17 = sub_37A70;
  v18 = &__NSArray0__struct;
  if (v10 > (v8 & ~(v8 >> 63)))
    -[TUIDynamicArrayInstance objectsInRange:block:](self->_instance, "objectsInRange:block:");
  v11 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v11;
}

- (TUITransactionCoordinating)coordinator
{
  return self->_coordinator;
}

- (JSManagedValue)managedValue
{
  return self->_managedValue;
}

- (TUIDynamicArrayInstance)instance
{
  return self->_instance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_managedValue, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end
