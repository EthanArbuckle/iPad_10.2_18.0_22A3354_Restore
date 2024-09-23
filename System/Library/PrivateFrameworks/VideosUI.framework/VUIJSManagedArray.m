@implementation VUIJSManagedArray

- (VUIJSManagedArray)initWithArray:(id)a3 ownerObject:(id)a4
{
  id v6;
  id v7;
  VUIJSManagedArray *v8;
  VUIJSManagedArray *v9;
  id *p_ownerObject;
  NSArray *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSArray *managedArray;
  VUIJSManagedArray *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)VUIJSManagedArray;
  v8 = -[VUIJSManagedArray init](&v29, sel_init);
  v9 = v8;
  if (v8)
  {
    v23 = v8;
    v24 = v7;
    p_ownerObject = &v8->_ownerObject;
    objc_storeStrong(&v8->_ownerObject, a4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (objc_msgSend(v17, "isObject"))
          {
            objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "context");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "virtualMachine");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addManagedReference:withOwner:", v18, *p_ownerObject);

          }
          else
          {
            objc_msgSend(v17, "toObject");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
          }
          -[NSArray addObject:](v11, "addObject:", v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v14);
    }

    v9 = v23;
    managedArray = v23->_managedArray;
    v23->_managedArray = v11;

    v7 = v24;
  }

  return v9;
}

- (void)dealloc
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[VUIJSManagedArray managedArray](self, "managedArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "value");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "context");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "virtualMachine");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIJSManagedArray ownerObject](self, "ownerObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "removeManagedReference:withOwner:", v7, v11);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

  -[VUIJSManagedArray setManagedArray:](self, "setManagedArray:", 0);
  v13.receiver = self;
  v13.super_class = (Class)VUIJSManagedArray;
  -[VUIJSManagedArray dealloc](&v13, sel_dealloc);
}

- (id)jsValuesWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DE8];
  -[VUIJSManagedArray managedArray](self, "managedArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[VUIJSManagedArray managedArray](self, "managedArray", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v13, "value");
        else
          objc_msgSend(MEMORY[0x1E0CBE108], "valueWithObject:inContext:", v13, v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)ownerObject
{
  return self->_ownerObject;
}

- (void)setOwnerObject:(id)a3
{
  objc_storeStrong(&self->_ownerObject, a3);
}

- (NSArray)managedArray
{
  return self->_managedArray;
}

- (void)setManagedArray:(id)a3
{
  objc_storeStrong((id *)&self->_managedArray, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedArray, 0);
  objc_storeStrong(&self->_ownerObject, 0);
}

@end
