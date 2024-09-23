@implementation TUIDynamicArray

+ (TUIDynamicArray)dynamicArrayWithFetchRequest:(id)a3 managedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  _TUICoreDataProvider *v11;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "queryGenerationToken"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "queryGenerationToken"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken"));
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if ((v10 & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      v11 = -[_TUICoreDataProvider initWithFetchRequest:managedObjectContext:]([_TUICoreDataProvider alloc], "initWithFetchRequest:managedObjectContext:", v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[_TUICoreDataProvider _startObserving](v11, "_startObserving"));

    }
  }

  return (TUIDynamicArray *)v7;
}

- (void)updatePredicate:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = objc_opt_class(_TUICoreDataProvider, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIDynamicArray _rootDataProvider](self, "_rootDataProvider"));
  v7 = TUIDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
    objc_msgSend(v8, "_updatePredicate:", v9);

}

- (id)js_newObserverWithController:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  _TUIDynamicArrayJSObserver *v8;
  void *v9;
  _TUIDynamicArrayJSObserver *v10;

  v6 = a4;
  v7 = a3;
  v8 = [_TUIDynamicArrayJSObserver alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "coordinator"));

  v10 = -[_TUIDynamicArrayJSObserver initWithCoordinator:block:array:](v8, "initWithCoordinator:block:array:", v9, v6, self);
  return v10;
}

- (TUIDynamicArray)init
{
  TUIDynamicArray *v2;
  TUIDynamicArray *v3;
  uint64_t v4;
  NSMapTable *instanceByObserver;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TUIDynamicArray;
  v2 = -[TUIDynamicArray init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    v4 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 517, 5));
    instanceByObserver = v3->_instanceByObserver;
    v3->_instanceByObserver = (NSMapTable *)v4;

  }
  return v3;
}

- (TUIDynamicArray)initWithDataProvider:(id)a3 generation:(id)a4 count:(unint64_t)a5
{
  id v8;
  id v9;
  TUIDynamicArray *v10;
  TUIDynamicArray *v11;

  v8 = a3;
  v9 = a4;
  v10 = -[TUIDynamicArray init](self, "init");
  v11 = v10;
  if (v10)
    -[TUIDynamicArray _updateProvider:count:generation:](v10, "_updateProvider:count:generation:", v8, a5, v9);

  return v11;
}

- (id)_rootDataProvider
{
  return self->_dataProvider;
}

- (void)_updateProvider:(id)a3 count:(unint64_t)a4 generation:(id)a5
{
  TUIDynamicArrayDataProviding *v8;
  id v9;
  TUIDynamicArrayDataProviding *dataProvider;
  id generation;
  TUIDynamicArrayDataProviding *v12;

  v8 = (TUIDynamicArrayDataProviding *)a3;
  v9 = a5;
  dataProvider = self->_dataProvider;
  self->_dataProvider = v8;
  v12 = v8;

  generation = self->_generation;
  self->_count = a4;
  self->_generation = v9;

}

- (void)_updateCount:(unint64_t)a3 generation:(id)a4
{
  self->_count = a3;
  objc_storeStrong(&self->_generation, a4);
}

- (id)newArrayWithDataAugmenter:(id)a3
{
  id v4;
  _TUIAugmentedDynamicArray *v5;

  v4 = a3;
  v5 = -[_TUIAugmentedDynamicArray initWithArray:augmenter:]([_TUIAugmentedDynamicArray alloc], "initWithArray:augmenter:", self, v4);

  return v5;
}

- (id)newArrayWithDataMapper:(id)a3
{
  id v4;
  _TUIMappedDynamicArray *v5;

  v4 = a3;
  v5 = -[_TUIMappedDynamicArray initWithArray:mapper:]([_TUIMappedDynamicArray alloc], "initWithArray:mapper:", self, v4);

  return v5;
}

- (id)newInstanceWithGeneration:(id)a3 count:(unint64_t)a4 observer:(id)a5
{
  id v6;
  _TUIDynamicArrayInstance *v7;

  v6 = a5;
  v7 = -[_TUIDynamicArrayInstance initWithArray:generation:count:observer:]([_TUIDynamicArrayInstance alloc], "initWithArray:generation:count:observer:", self, self->_generation, self->_count, v6);

  return v7;
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
    v5 = -[TUIDynamicArray newInstanceWithGeneration:count:observer:](self, "newInstanceWithGeneration:count:observer:", self->_generation, self->_count, v4);
    -[NSMapTable setObject:forKey:](self->_instanceByObserver, "setObject:forKey:", v5, v4);
  }
  os_unfair_lock_unlock(&self->_accessLock);

  return v5;
}

- (id)instantiateAsEnumerator:(id)a3 options:(id)a4 flags:(unint64_t)a5 builderClass:(Class)a6 nodes:(id)a7 snapshot:(id)a8 context:(id)a9
{
  id v15;
  id v16;
  id v17;
  _TUIDynamicArrayContainer *v18;
  void *v19;
  void *v20;
  _TUIDynamicArrayContainer *v21;

  v15 = a9;
  v16 = a8;
  v17 = a4;
  v18 = [_TUIDynamicArrayContainer alloc];
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "transactionCoordinator"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dynamicController"));
  v21 = -[_TUIDynamicArrayContainer initWithEnumerator:binding:array:context:transactionCoordinator:dynamicController:nodes:snapshot:options:flags:builderClass:](v18, "initWithEnumerator:binding:array:context:transactionCoordinator:dynamicController:nodes:snapshot:options:flags:builderClass:", a3.var0, TUINameNil, self, v15, v19, v20, a7, v16, v17, a5, a6);

  return v21;
}

- (id)instantiateAsBinding:(id)a3 options:(id)a4 flags:(unint64_t)a5 builderClass:(Class)a6 nodes:(id)a7 snapshot:(id)a8 context:(id)a9
{
  id v15;
  id v16;
  id v17;
  _TUIDynamicArrayContainer *v18;
  void *v19;
  void *v20;
  _TUIDynamicArrayContainer *v21;

  v15 = a9;
  v16 = a8;
  v17 = a4;
  v18 = [_TUIDynamicArrayContainer alloc];
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "transactionCoordinator"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dynamicController"));
  v21 = -[_TUIDynamicArrayContainer initWithEnumerator:binding:array:context:transactionCoordinator:dynamicController:nodes:snapshot:options:flags:builderClass:](v18, "initWithEnumerator:binding:array:context:transactionCoordinator:dynamicController:nodes:snapshot:options:flags:builderClass:", TUIEnumeratorNil, *(unsigned int *)&a3, self, v15, v19, v20, a7, v16, v17, a5, a6);

  return v21;
}

+ (TUIDynamicArray)arrayWithDataProvider:(id)a3 generation:(id)a4 count:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithDataProvider:generation:count:", v9, v8, a5);

  return (TUIDynamicArray *)v10;
}

- (void)_enqueueUpdate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  TUIDynamicArray *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transaction"));
  v6 = TUITransactionLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIDynamicArray debugName](self, "debugName"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_lastTransactionToken);
    *(_DWORD *)buf = 134218754;
    v27 = self;
    v28 = 2114;
    v29 = v8;
    v30 = 2112;
    v31 = v5;
    v32 = 2112;
    v33 = WeakRetained;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "[%p] %{public}@: DynamicArray: enqueueUpdate - tx=%@, lastToken=%@", buf, 0x2Au);

  }
  v10 = objc_loadWeakRetained((id *)&self->_lastTransactionToken);
  objc_msgSend(v5, "dependentOn:", v10);

  objc_msgSend(v5, "addCategory:", self->_transactionCategory);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dependencyToken"));
  objc_storeWeak((id *)&self->_lastTransactionToken, v11);

  os_unfair_lock_lock(&self->_accessLock);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_instanceByObserver, "objectEnumerator"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allObjects"));

  v14 = objc_msgSend(v4, "count");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "generation"));
  -[TUIDynamicArray _updateCount:generation:](self, "_updateCount:generation:", v14, v15);

  os_unfair_lock_unlock(&self->_accessLock);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = v13;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v20), "enqueueUpdateGroup:", v4, (_QWORD)v21);
        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v18);
  }

}

- (id)tui_objectAtIndex:(int64_t)a3
{
  return -[_TUIDynamicArrayIndex initWithArray:index:]([_TUIDynamicArrayIndex alloc], "initWithArray:index:", self, a3);
}

- (id)tui_subarrayWithStart:(int64_t)a3 end:(int64_t)a4
{
  _TUISubDynamicArray *v4;

  if (a3 || a4 != -1)
    v4 = -[_TUISubDynamicArray initWithArray:start:end:]([_TUISubDynamicArray alloc], "initWithArray:start:end:", self, a3, a4);
  else
    v4 = self;
  return v4;
}

- (BOOL)tui_hasProperty:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("count")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("empty"));

  return v4;
}

- (id)tui_valueForProperty:(id)a3
{
  id v4;
  __objc2_class **v5;
  id v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("count")) & 1) != 0)
  {
    v5 = off_23CA70;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("empty")))
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = &off_23CA78;
  }
  v6 = objc_msgSend(objc_alloc(*v5), "initWithArray:", self);
LABEL_7:

  return v6;
}

- (id)_newUpdateGroupWithGeneration:(id)a3 transaction:(id)a4
{
  id v6;
  void *v7;
  _TUIDynamicArrayUpdateGroup *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "tx"));
  v8 = -[_TUIDynamicArrayUpdateGroup initWithGeneration:count:transaction:]([_TUIDynamicArrayUpdateGroup alloc], "initWithGeneration:count:transaction:", v6, self->_count, v7);

  return v8;
}

- (TUIDynamicValue)dynamicValueForCount
{
  return (TUIDynamicValue *)-[_TUIDynamicArrayCount initWithArray:]([_TUIDynamicArrayCount alloc], "initWithArray:", self);
}

- (TUIDynamicValue)dynamicValueForEmpty
{
  return (TUIDynamicValue *)-[_TUIDynamicArrayEmpty initWithArray:]([_TUIDynamicArrayEmpty alloc], "initWithArray:", self);
}

- (id)dynamicValueAtIndex:(int64_t)a3
{
  return -[_TUIDynamicArrayIndex initWithArray:index:]([_TUIDynamicArrayIndex alloc], "initWithArray:index:", self, a3);
}

- (unint64_t)_countForGeneration:(id)a3
{
  return (unint64_t)-[TUIDynamicArrayDataProviding countForGeneration:](self->_dataProvider, "countForGeneration:", a3);
}

- (unint64_t)_count
{
  return self->_count;
}

- (NSString)transactionCategory
{
  return self->_transactionCategory;
}

- (void)setTransactionCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)debugName
{
  return self->_debugName;
}

- (void)setDebugName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (TUIDynamicArrayDataProviding)dataProvider
{
  return self->_dataProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_transactionCategory, 0);
  objc_storeStrong((id *)&self->_instanceByObserver, 0);
  objc_destroyWeak((id *)&self->_lastTransactionToken);
  objc_storeStrong(&self->_generation, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
}

@end
