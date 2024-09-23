@implementation _PASLowValueCardinalityMutableDictionary

- (unint64_t)count
{
  return self->_count;
}

- (id)objectForKey:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a3;
  v5 = -[NSMutableArray count](self->_objectsAndKeys, "count");
  v6 = -2;
  while (1)
  {
    v7 = v6 + 2;
    if (v6 + 2 >= v5)
      break;
    -[NSMutableArray objectAtIndexedSubscript:](self->_objectsAndKeys, "objectAtIndexedSubscript:", v6 + 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v4);

    v6 = v7;
    if (v9)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_objectsAndKeys, "objectAtIndexedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  v10 = 0;
LABEL_6:

  return v10;
}

- (id)keyEnumerator
{
  uint64_t v3;
  _PASLowValueCardinalityMutableDictionary *v5;
  _PASLowValueCardinalityMutableDictionaryEnumerator *v6;
  _PASLowValueCardinalityMutableDictionary *v7;
  objc_super v8;

  v3 = -[NSMutableArray count](self->_objectsAndKeys, "count");
  if (v3 == 2)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_objectsAndKeys, "objectAtIndexedSubscript:", 1);
    v5 = (_PASLowValueCardinalityMutableDictionary *)objc_claimAutoreleasedReturnValue();
    -[_PASLowValueCardinalityMutableDictionary objectEnumerator](v5, "objectEnumerator");
    v6 = (_PASLowValueCardinalityMutableDictionaryEnumerator *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0C9AA60], "objectEnumerator");
      return (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = [_PASLowValueCardinalityMutableDictionaryEnumerator alloc];
    v5 = self;
    if (v6)
    {
      v8.receiver = v6;
      v8.super_class = (Class)_PASLowValueCardinalityMutableDictionaryEnumerator;
      v7 = -[_PASLowValueCardinalityMutableDictionary init](&v8, sel_init);
      v6 = (_PASLowValueCardinalityMutableDictionaryEnumerator *)v7;
      if (v7)
      {
        objc_storeStrong((id *)&v7->_objectsAndKeys, self->_objectsAndKeys);
        v6->_i = -[NSArray count](v6->_objectsAndKeys, "count");
        -[_PASLowValueCardinalityMutableDictionaryEnumerator _loadNextKeyEnumerator]((uint64_t)v6);
      }
    }
  }

  return v6;
}

- (void)removeObjectForKey:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = -[NSMutableArray count](self->_objectsAndKeys, "count");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_objectsAndKeys, "objectAtIndexedSubscript:", v6 + 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "containsObject:", v8))
        break;
      v6 += 2;

      if (v6 >= v5)
        goto LABEL_9;
    }
    objc_msgSend(v7, "removeObject:", v8);
    if (!objc_msgSend(v7, "count"))
      -[NSMutableArray removeObjectsInRange:](self->_objectsAndKeys, "removeObjectsInRange:", v6, 2);
    --self->_count;

  }
LABEL_9:

}

- (_PASLowValueCardinalityMutableDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  _PASLowValueCardinalityMutableDictionary *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_PASLowValueCardinalityMutableDictionary;
  v8 = -[_PASLowValueCardinalityMutableDictionary init](&v14, sel_init);
  if (v8)
    v9 = a5 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    do
    {
      v11 = (uint64_t)*a3++;
      v10 = v11;
      v12 = (uint64_t)*a4++;
      -[_PASLowValueCardinalityMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v10, v12);
      --a5;
    }
    while (a5);
  }
  return v8;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v7;
  NSMutableArray *objectsAndKeys;
  NSMutableArray *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  uint64_t v12;
  unint64_t v13;
  int v14;
  char v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  _PASLowValueCardinalityMutableDictionary *v34;
  id v35;

  v35 = a3;
  v7 = a4;
  if (!v35)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLowValueCardinalityMutableDictionary.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("anObject"));

    if (self)
      goto LABEL_3;
LABEL_33:
    v11 = 0;
    goto LABEL_6;
  }
  if (!self)
    goto LABEL_33;
LABEL_3:
  objectsAndKeys = self->_objectsAndKeys;
  if (!objectsAndKeys)
  {
    v9 = (NSMutableArray *)objc_opt_new();
    v10 = self->_objectsAndKeys;
    self->_objectsAndKeys = v9;

    objectsAndKeys = self->_objectsAndKeys;
  }
  v11 = objectsAndKeys;
LABEL_6:
  v12 = -[NSMutableArray count](v11, "count");
  if (v12)
  {
    v13 = v12;
    v34 = self;
    LOBYTE(v14) = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", v17);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", v17 + 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if ((v14 & 1) != 0)
        break;
      v14 = objc_msgSend(v20, "containsObject:", v7);
      if (v19 == v35)
        goto LABEL_17;
      if (v14)
      {
        objc_msgSend(v21, "removeObject:", v7);
        if (!objc_msgSend(v21, "count"))
        {
          v18 = 2;
          v16 = v17;
        }
        LOBYTE(v14) = 1;
LABEL_18:
        if ((v15 & 1) != 0)
        {

          if (v18)
            -[NSMutableArray removeObjectsInRange:](v11, "removeObjectsInRange:", v16, v18);
          goto LABEL_31;
        }
      }
LABEL_19:
      v17 += 2;

      if (v17 >= v13)
      {
        if (v18)
        {
          if ((v15 & 1) != 0)
          {
            -[NSMutableArray removeObjectsInRange:](v11, "removeObjectsInRange:", v16, v18);
          }
          else
          {
            v29 = v16 + 1;
            -[NSMutableArray setObject:atIndexedSubscript:](v11, "setObject:atIndexedSubscript:", v35, v16);
            v30 = objc_alloc(MEMORY[0x1E0C99E20]);
            v31 = (void *)objc_msgSend(v7, "copyWithZone:", 0);
            v32 = (void *)objc_msgSend(v30, "initWithObjects:", v31, 0);
            -[NSMutableArray setObject:atIndexedSubscript:](v11, "setObject:atIndexedSubscript:", v32, v29);

          }
        }
        else if ((v15 & 1) == 0)
        {
          -[NSMutableArray addObject:](v11, "addObject:", v35);
          v26 = objc_alloc(MEMORY[0x1E0C99E20]);
          v27 = (void *)objc_msgSend(v7, "copyWithZone:", 0);
          v28 = (void *)objc_msgSend(v26, "initWithObjects:", v27, 0);
          -[NSMutableArray addObject:](v11, "addObject:", v28);

        }
        self = v34;
        if ((v14 & 1) != 0)
          goto LABEL_31;
        goto LABEL_30;
      }
    }
    v14 = 1;
    if (v19 != v35)
      goto LABEL_18;
LABEL_17:
    v22 = (void *)objc_msgSend(v7, "copyWithZone:", 0);
    objc_msgSend(v21, "addObject:", v22);

    v15 = 1;
    if (v14)
      goto LABEL_18;
    goto LABEL_19;
  }
  -[NSMutableArray addObject:](v11, "addObject:", v35);
  v23 = objc_alloc(MEMORY[0x1E0C99E20]);
  v24 = (void *)objc_msgSend(v7, "copyWithZone:", 0);
  v25 = (void *)objc_msgSend(v23, "initWithObjects:", v24, 0);
  -[NSMutableArray addObject:](v11, "addObject:", v25);

LABEL_30:
  ++self->_count;
LABEL_31:

}

- (id)allValues
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", self->_count);
  v4 = -[NSMutableArray count](self->_objectsAndKeys, "count");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i < v5; i += 2)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_objectsAndKeys, "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_objectsAndKeys, "objectAtIndexedSubscript:", i | 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      while (v9)
      {
        --v9;
        objc_msgSend(v3, "addObject:", v7);
      }

    }
  }
  return v3;
}

- (id)allKeysForObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  _PASLowValueCardinalityMutableDictionary *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[NSMutableArray count](self->_objectsAndKeys, "count");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v18 = v6;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_objectsAndKeys, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v4))
      {
        v10 = v4;
        v11 = self;
        -[NSMutableArray objectAtIndexedSubscript:](self->_objectsAndKeys, "objectAtIndexedSubscript:", v8 | 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v20;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v20 != v15)
                objc_enumerationMutation(v12);
              objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16++));
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          }
          while (v14);
        }

        v4 = v10;
        v7 = v18;
        self = v11;
      }
      v8 += 2;

    }
    while (v8 < v7);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectsAndKeys, 0);
}

@end
