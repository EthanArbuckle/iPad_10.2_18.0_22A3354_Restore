@implementation _TUITransactionControllerJSObserver

- (_TUITransactionControllerJSObserver)initWithWillUpdateValue:(id)a3 didUpdateValue:(id)a4
{
  id v6;
  id v7;
  _TUITransactionControllerJSObserver *v8;
  _TUITransactionControllerJSObserver *v9;
  uint64_t v10;
  JSManagedValue *willUpdate;
  uint64_t v12;
  JSManagedValue *didUpdate;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_TUITransactionControllerJSObserver;
  v8 = -[_TUITransactionControllerJSObserver init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    if (v6)
    {
      v10 = objc_claimAutoreleasedReturnValue(+[JSManagedValue managedValueWithValue:](JSManagedValue, "managedValueWithValue:", v6));
      willUpdate = v9->_willUpdate;
      v9->_willUpdate = (JSManagedValue *)v10;
    }
    else
    {
      willUpdate = v8->_willUpdate;
      v8->_willUpdate = 0;
    }

    if (v7)
    {
      v12 = objc_claimAutoreleasedReturnValue(+[JSManagedValue managedValueWithValue:](JSManagedValue, "managedValueWithValue:", v7));
      didUpdate = v9->_didUpdate;
      v9->_didUpdate = (JSManagedValue *)v12;
    }
    else
    {
      didUpdate = v9->_didUpdate;
      v9->_didUpdate = 0;
    }

  }
  return v9;
}

- (void)transactionControllerWillProcessUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  const char *v10;

  v4 = TUIDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446210;
    v10 = "-[_TUITransactionControllerJSObserver transactionControllerWillProcessUpdate:]";
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v9, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[JSManagedValue value](self->_willUpdate, "value"));
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "callWithArguments:", 0);

}

- (void)transactionControllerDidProcessUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  const char *v10;

  v4 = TUIDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446210;
    v10 = "-[_TUITransactionControllerJSObserver transactionControllerDidProcessUpdate:]";
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v9, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[JSManagedValue value](self->_didUpdate, "value"));
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "callWithArguments:", 0);

}

- (JSManagedValue)willUpdate
{
  return self->_willUpdate;
}

- (JSManagedValue)didUpdate
{
  return self->_didUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didUpdate, 0);
  objc_storeStrong((id *)&self->_willUpdate, 0);
}

@end
