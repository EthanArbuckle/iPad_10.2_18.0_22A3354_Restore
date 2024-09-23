@implementation JSAManagedArray

- (JSAManagedArray)initWithArray:(id)a3 ownerObject:(id)a4
{
  id v6;
  id v7;
  JSAManagedArray *v8;
  JSAManagedArray *v9;
  id *p_ownerObject;
  NSArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  id v25;
  NSArray *managedArray;
  JSAManagedArray *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];

  v6 = a3;
  v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)JSAManagedArray;
  v8 = -[JSAManagedArray init](&v34, "init");
  v9 = v8;
  if (v8)
  {
    v28 = v8;
    v29 = v7;
    p_ownerObject = &v8->_ownerObject;
    objc_storeStrong(&v8->_ownerObject, a4);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (!v13)
      goto LABEL_15;
    v15 = v13;
    v16 = *(_QWORD *)v31;
    while (1)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v17);
        v19 = objc_opt_class(JSValue, v14);
        v20 = BUDynamicCast(v19, v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        v22 = objc_msgSend(v21, "isObject");

        if (v22)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[JSManagedValue managedValueWithValue:andOwner:](JSManagedValue, "managedValueWithValue:andOwner:", v18, *p_ownerObject));
LABEL_10:
          -[NSArray addObject:](v11, "addObject:", v23);
          goto LABEL_11;
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "toObject"));
        if (v23)
          goto LABEL_10;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        -[NSArray addObject:](v11, "addObject:", v24);

LABEL_11:
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v25 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      v15 = v25;
      if (!v25)
      {
LABEL_15:

        v9 = v28;
        managedArray = v28->_managedArray;
        v28->_managedArray = v11;

        v7 = v29;
        break;
      }
    }
  }

  return v9;
}

- (void)dealloc
{
  NSArray *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = self->_managedArray;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v8);
        v10 = objc_opt_class(JSManagedValue, v5);
        v11 = BUDynamicCast(v10, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "value"));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "context"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "virtualMachine"));
        objc_msgSend(v15, "removeManagedReference:withOwner:", v9, self->_ownerObject);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  v16.receiver = self;
  v16.super_class = (Class)JSAManagedArray;
  -[JSAManagedArray dealloc](&v16, "dealloc");
}

- (id)jsValuesWithContext:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSArray count](self->_managedArray, "count")));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_managedArray;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v13 = objc_opt_class(JSManagedValue, v8);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "value"));
        else
          v14 = objc_claimAutoreleasedReturnValue(+[JSValue valueWithObject:inContext:](JSValue, "valueWithObject:inContext:", v12, v4, (_QWORD)v18));
        v15 = (void *)v14;
        if (v14)
        {
          objc_msgSend(v5, "addObject:", v14);
        }
        else
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
          objc_msgSend(v5, "addObject:", v16);

        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  return v5;
}

- (id)ownerObject
{
  return self->_ownerObject;
}

- (NSArray)managedArray
{
  return self->_managedArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedArray, 0);
  objc_storeStrong(&self->_ownerObject, 0);
}

@end
