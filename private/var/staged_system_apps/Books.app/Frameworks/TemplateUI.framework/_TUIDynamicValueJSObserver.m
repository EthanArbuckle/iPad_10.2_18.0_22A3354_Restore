@implementation _TUIDynamicValueJSObserver

- (_TUIDynamicValueJSObserver)initWithCoordinator:(id)a3 block:(id)a4 value:(id)a5
{
  id v9;
  id v10;
  id v11;
  _TUIDynamicValueJSObserver *v12;
  _TUIDynamicValueJSObserver *v13;
  uint64_t v14;
  JSManagedValue *managedValue;
  uint64_t v16;
  TUIDynamicValueInstance *instance;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_TUIDynamicValueJSObserver;
  v12 = -[_TUIDynamicValueJSObserver init](&v19, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_coordinator, a3);
    v14 = objc_claimAutoreleasedReturnValue(+[JSManagedValue managedValueWithValue:](JSManagedValue, "managedValueWithValue:", v10));
    managedValue = v13->_managedValue;
    v13->_managedValue = (JSManagedValue *)v14;

    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "instanceForObserver:", v13));
    instance = v13->_instance;
    v13->_instance = (TUIDynamicValueInstance *)v16;

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
  v5[2] = sub_176438;
  v5[3] = &unk_23E688;
  v5[4] = self;
  -[TUITransactionCoordinating scheduleLayoutUpdateWithTransaction:block:](coordinator, "scheduleLayoutUpdateWithTransaction:block:", a4, v5);
}

- (id)value
{
  TUIDynamicValueInstance *instance;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_176654;
  v10 = sub_176664;
  v11 = 0;
  instance = self->_instance;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_17666C;
  v5[3] = &unk_23F218;
  v5[4] = &v6;
  -[TUIDynamicValueInstance valueWithBlock:](instance, "valueWithBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (TUITransactionCoordinating)coordinator
{
  return self->_coordinator;
}

- (JSManagedValue)managedValue
{
  return self->_managedValue;
}

- (TUIDynamicValueInstance)instance
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
