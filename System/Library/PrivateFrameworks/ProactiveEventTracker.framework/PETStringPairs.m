@implementation PETStringPairs

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

- (id)subsetForKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  void *v15;
  PETStringPairs *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v13 = -[NSArray indexOfObject:](self->_keys, "indexOfObject:", v12, (_QWORD)v18);
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v14 = v13;
          objc_msgSend(v6, "addObject:", v12);
          -[NSArray objectAtIndexedSubscript:](self->_values, "objectAtIndexedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v15);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  v16 = -[PETStringPairs initWithKeys:values:]([PETStringPairs alloc], "initWithKeys:values:", v6, v5);
  return v16;
}

- (unint64_t)count
{
  return -[NSArray count](self->_keys, "count");
}

- (id)keyAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_keys, "objectAtIndexedSubscript:", a3);
}

- (id)valueAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_values, "objectAtIndexedSubscript:", a3);
}

- (PETStringPairs)initWithKeys:(id)a3 values:(id)a4
{
  id v8;
  id v9;
  PETStringPairs *v10;
  uint64_t v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PETStringPairs;
  v10 = -[PETStringPairs init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "count");
    if (v11 != objc_msgSend(v9, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("PETStringPairs.m"), 16, CFSTR("number of elements don't match: keys - %lu, values - %lu"), -[NSArray count](v10->_keys, "count"), -[NSArray count](v10->_values, "count"));

    }
    objc_storeStrong((id *)&v10->_keys, a3);
    objc_storeStrong((id *)&v10->_values, a4);
  }

  return v10;
}

- (NSArray)keys
{
  return self->_keys;
}

- (NSArray)values
{
  return self->_values;
}

@end
