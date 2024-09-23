@implementation TUIDynamicValue

- (TUIDynamicValue)initWithValue:(id)a3
{
  id v5;
  TUIDynamicValue *v6;
  TUIDynamicValue *v7;
  uint64_t v8;
  NSMapTable *instanceByObserver;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIDynamicValue;
  v6 = -[TUIDynamicValue init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    v6->_accessLock._os_unfair_lock_opaque = 0;
    v8 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 517, 5));
    instanceByObserver = v7->_instanceByObserver;
    v7->_instanceByObserver = (NSMapTable *)v8;

    objc_storeStrong(&v7->_value, a3);
  }

  return v7;
}

- (id)newInstanceWithObserver:(id)a3
{
  id v4;
  _TUIDynamicValueInstance *v5;

  v4 = a3;
  v5 = -[_TUIDynamicValueInstance initWithDynamicValue:value:observer:]([_TUIDynamicValueInstance alloc], "initWithDynamicValue:value:observer:", self, self->_value, v4);

  return v5;
}

- (id)instanceForObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  os_unfair_lock_lock(&self->_accessLock);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_instanceByObserver, "objectForKey:", v4));
  if (!v5)
  {
    v5 = -[TUIDynamicValue newInstanceWithObserver:](self, "newInstanceWithObserver:", v4);
    -[NSMapTable setObject:forKey:](self->_instanceByObserver, "setObject:forKey:", v5, v4);
  }
  os_unfair_lock_unlock(&self->_accessLock);

  return v5;
}

- (id)instantiateAsEnumerator:(id)a3 options:(id)a4 flags:(unint64_t)a5 builderClass:(Class)a6 nodes:(id)a7 snapshot:(id)a8 context:(id)a9
{
  id v15;
  id v16;
  _TUIDynamicValueItem *v17;
  void *v18;
  void *v19;
  _TUIDynamicValueItem *v20;

  v15 = a9;
  v16 = a8;
  v17 = [_TUIDynamicValueItem alloc];
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "transactionCoordinator"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dynamicController"));
  v20 = -[_TUIDynamicValueItem initWithEnumerator:binding:value:context:transactionCoordinator:dynamicController:nodes:snapshot:flags:builderClass:](v17, "initWithEnumerator:binding:value:context:transactionCoordinator:dynamicController:nodes:snapshot:flags:builderClass:", a3.var0, TUINameNil, self, v15, v18, v19, a7, v16, a5, a6);

  return v20;
}

- (id)instantiateAsBinding:(id)a3 options:(id)a4 flags:(unint64_t)a5 builderClass:(Class)a6 nodes:(id)a7 snapshot:(id)a8 context:(id)a9
{
  id v15;
  id v16;
  _TUIDynamicValueItem *v17;
  void *v18;
  void *v19;
  _TUIDynamicValueItem *v20;

  v15 = a9;
  v16 = a8;
  v17 = [_TUIDynamicValueItem alloc];
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "transactionCoordinator"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dynamicController"));
  v20 = -[_TUIDynamicValueItem initWithEnumerator:binding:value:context:transactionCoordinator:dynamicController:nodes:snapshot:flags:builderClass:](v17, "initWithEnumerator:binding:value:context:transactionCoordinator:dynamicController:nodes:snapshot:flags:builderClass:", TUIEnumeratorNil, *(unsigned int *)&a3, self, v15, v18, v19, a7, v16, a5, a6);

  return v20;
}

+ (TUIDynamicValue)valueWithValue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithValue:", v4);

  return (TUIDynamicValue *)v5;
}

- (void)_enqueueUpdate:(id)a3
{
  id v4;
  os_unfair_lock_s *p_accessLock;
  void *v6;
  id value;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "value"));
  value = self->_value;
  self->_value = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_instanceByObserver, "objectEnumerator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));

  os_unfair_lock_unlock(p_accessLock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), "enqueueUpdate:", v4, (_QWORD)v15);
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (BOOL)tui_hasProperty:(id)a3
{
  return objc_msgSend(a3, "length") != 0;
}

- (id)tui_valueForProperty:(id)a3
{
  id v4;
  _TUIDynamicValueProperty *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    v5 = -[_TUIDynamicValueProperty initWithValue:property:]([_TUIDynamicValueProperty alloc], "initWithValue:property:", self, v4);
  else
    v5 = 0;

  return v5;
}

- (id)value
{
  return self->_value;
}

- (NSString)transactionCategory
{
  return self->_transactionCategory;
}

- (void)setTransactionCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)debugName
{
  return self->_debugName;
}

- (void)setDebugName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_transactionCategory, 0);
  objc_storeStrong(&self->_value, 0);
  objc_destroyWeak((id *)&self->_lastTransactionToken);
  objc_storeStrong((id *)&self->_instanceByObserver, 0);
}

- (id)newObserverWithController:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  _TUIDynamicValueJSObserver *v8;
  void *v9;
  _TUIDynamicValueJSObserver *v10;

  v6 = a4;
  v7 = a3;
  v8 = [_TUIDynamicValueJSObserver alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "coordinator"));

  v10 = -[_TUIDynamicValueJSObserver initWithCoordinator:block:value:](v8, "initWithCoordinator:block:value:", v9, v6, self);
  return v10;
}

@end
