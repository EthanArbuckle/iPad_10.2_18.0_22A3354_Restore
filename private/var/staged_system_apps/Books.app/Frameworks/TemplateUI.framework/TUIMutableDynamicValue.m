@implementation TUIMutableDynamicValue

- (void)updateWithTransaction:(id)a3 valueIfChanged:(id)a4
{
  id v6;
  id value;
  id v8;

  v8 = a3;
  v6 = a4;
  value = self->super._value;
  if (value != v6 && (objc_msgSend(value, "isEqual:", v6) & 1) == 0)
    -[TUIMutableDynamicValue updateWithTransaction:value:](self, "updateWithTransaction:value:", v8, v6);

}

- (void)updateWithTransaction:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _TUIDynamicValueUpdate *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id WeakRetained;
  id v14;
  void *v15;
  void *v16;
  int v17;
  TUIMutableDynamicValue *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;

  v6 = a3;
  v7 = a4;
  if (!v6)
    v6 = (id)objc_claimAutoreleasedReturnValue(+[TUITransaction currentOrImplicitTransaction](TUITransaction, "currentOrImplicitTransaction"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tx"));
  v9 = -[_TUIDynamicValueUpdate initWithValue:transaction:]([_TUIDynamicValueUpdate alloc], "initWithValue:transaction:", v7, v8);
  v10 = TUITransactionLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIDynamicValue debugName](self, "debugName"));
    WeakRetained = objc_loadWeakRetained((id *)&self->super._lastTransactionToken);
    v17 = 134219010;
    v18 = self;
    v19 = 2114;
    v20 = v12;
    v21 = 2112;
    v22 = v6;
    v23 = 2112;
    v24 = WeakRetained;
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "[%p] %{public}@: DynamicValue: updateWithValue (tx=%@, lastToken=%@) value=%@", (uint8_t *)&v17, 0x34u);

  }
  v14 = objc_loadWeakRetained((id *)&self->super._lastTransactionToken);
  objc_msgSend(v6, "dependentOn:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIDynamicValue transactionCategory](self, "transactionCategory"));
  objc_msgSend(v6, "addCategory:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dependencyToken"));
  objc_storeWeak((id *)&self->super._lastTransactionToken, v16);

  -[TUIDynamicValue _enqueueUpdate:](self, "_enqueueUpdate:", v9);
}

- (void)updateWithValue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[TUITransaction currentOrImplicitTransaction](TUITransaction, "currentOrImplicitTransaction"));
  -[TUIMutableDynamicValue updateWithTransaction:value:](self, "updateWithTransaction:value:", v5, v4);

}

- (void)updateWithValueIfChanged:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[TUITransaction currentOrImplicitTransaction](TUITransaction, "currentOrImplicitTransaction"));
  -[TUIMutableDynamicValue updateWithTransaction:valueIfChanged:](self, "updateWithTransaction:valueIfChanged:", v5, v4);

}

@end
