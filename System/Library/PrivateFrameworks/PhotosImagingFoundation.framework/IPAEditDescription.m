@implementation IPAEditDescription

- (IPAEditDescription)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("unsupported method"));

  return 0;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IPAEditDescription;
  return -[IPAEditDescription init](&v3, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[IPAEditDescription isEqualToDescription:](self, "isEqualToDescription:", v4);

  return v5;
}

- (BOOL)isEqualToDescriptionRenderOperations:(id)a3
{
  id *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;

  v4 = (id *)a3;
  v5 = objc_msgSend(v4, "operationCount");
  if (v5 == -[IPAEditDescription operationCount](self, "operationCount"))
  {
    -[NSArray objectEnumerator](self->_operations, "objectEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4[1], "objectEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nextObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nextObject");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    LOBYTE(v11) = 1;
    if (v8 && v9)
    {
      while (1)
      {
        v11 = objc_msgSend(v8, "isEqual:", v10);
        if (!v11)
          break;
        objc_msgSend(v6, "nextObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "nextObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v10 = v13;
          v8 = v12;
          if (v13)
            continue;
        }
        goto LABEL_10;
      }
    }
    v12 = v8;
    v13 = v10;
LABEL_10:

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (unint64_t)operationCount
{
  return -[NSArray count](self->_operations, "count");
}

- (id)operations
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_operations, 1);
}

- (unint64_t)firstIndexOfOperationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  unint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    _PFAssertFailHandler();
  v5 = v4;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_operations;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      v11 = 0;
      v12 = v9 + v8;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v5);

        if ((v14 & 1) != 0)
        {
          v15 = v9 + v11;
          goto LABEL_12;
        }
        ++v11;
      }
      while (v8 != v11);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v9 = v12;
      if (v8)
        continue;
      break;
    }
  }
  v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:

  return v15;
}

- (unint64_t)indexOfOperationWithUUID:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  unint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    _PFAssertFailHandler();
  v5 = v4;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_operations;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      v11 = 0;
      v12 = v9 + v8;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "UUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", v5);

        if ((v14 & 1) != 0)
        {
          v15 = v9 + v11;
          goto LABEL_12;
        }
        ++v11;
      }
      while (v8 != v11);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v9 = v12;
      if (v8)
        continue;
      break;
    }
  }
  v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:

  return v15;
}

- (unint64_t)insertIndexForOperationWithIdentifier:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "insertIndexForOperationWithIdentifier:inArray:withOrdering:", v4, self->_operations, self);

  return v5;
}

- (id)firstOperationWithIdentifier:(id)a3
{
  unint64_t v4;
  void *v5;

  v4 = -[IPAEditDescription firstIndexOfOperationWithIdentifier:](self, "firstIndexOfOperationWithIdentifier:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    -[IPAEditDescription operationAtIndex:](self, "operationAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)operationAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL || -[NSArray count](self->_operations, "count") <= a3)
  {
    v6 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_operations, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

  }
  return v6;
}

- (id)operationWithUUID:(id)a3
{
  unint64_t v4;
  void *v5;

  v4 = -[IPAEditDescription indexOfOperationWithUUID:](self, "indexOfOperationWithUUID:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    -[IPAEditDescription operationAtIndex:](self, "operationAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)containsOperationWithIdentifier:(id)a3
{
  return -[IPAEditDescription firstIndexOfOperationWithIdentifier:](self, "firstIndexOfOperationWithIdentifier:", a3) != 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSArray countByEnumeratingWithState:objects:count:](self->_operations, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (void)forEachImmutableOperation:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_operations;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v5);
        v4[2](v4, v8 + v10, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v7 != v10);
      v8 += v10;
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)withImmutableOperationAtIndex:(unint64_t)a3 block:(id)a4
{
  void *v6;
  IPAEditDescription *v7;
  SEL v8;
  id v9;
  void (**v10)(id, void *);

  v10 = (void (**)(id, void *))a4;
  if (v10)
  {
    if (-[NSArray count](self->_operations, "count") > a3)
    {
      -[NSArray objectAtIndexedSubscript:](self->_operations, "objectAtIndexedSubscript:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v6);

    }
  }
  else
  {
    v7 = (IPAEditDescription *)_PFAssertFailHandler();
    -[IPAEditDescription descriptionWithOperations:](v7, v8, v9);
  }
}

- (IPAEditDescription)descriptionWithOperations:(id)a3
{
  id v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  IPAEditDescription *v9;
  SEL v10;
  id v11;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    v5 = (_QWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_init");
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)v5[1];
    v5[1] = v6;

    return (IPAEditDescription *)v5;
  }
  else
  {
    v9 = (IPAEditDescription *)_PFAssertFailHandler();
    return (IPAEditDescription *)-[IPAEditDescription descriptionByAddingOperation:](v9, v10, v11);
  }
}

- (id)descriptionByAddingOperation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(a3, "copyWithZone:", 0);
  -[NSArray arrayByAddingObject:](self->_operations, "arrayByAddingObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPAEditDescription descriptionWithOperations:](self, "descriptionWithOperations:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)descriptionByAddingOperation:(id)a3 atIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;

  v6 = (void *)objc_msgSend(a3, "copyWithZone:", 0);
  v7 = (void *)-[NSArray mutableCopy](self->_operations, "mutableCopy");
  objc_msgSend(v7, "insertObject:atIndex:", v6, a4);
  -[IPAEditDescription descriptionWithOperations:](self, "descriptionWithOperations:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)descriptionByRemovingOperationAtIndex:(unint64_t)a3
{
  void *v5;
  IPAEditDescription *v6;

  if (-[NSArray count](self->_operations, "count") <= a3)
  {
    v6 = self;
  }
  else
  {
    v5 = (void *)-[NSArray mutableCopy](self->_operations, "mutableCopy");
    objc_msgSend(v5, "removeObjectAtIndex:", a3);
    -[IPAEditDescription descriptionWithOperations:](self, "descriptionWithOperations:", v5);
    v6 = (IPAEditDescription *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)descriptionByRemovingOperation:(id)a3
{
  id v4;
  IPAEditDescription *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  if (v4)
  {
    v6 = (void *)objc_opt_new();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5->_operations;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v12, "isEqual:", v4, (_QWORD)v16) & 1) == 0)
            objc_msgSend(v6, "addObject:", v12);
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    v13 = -[NSArray count](v5->_operations, "count");
    if (v13 != objc_msgSend(v6, "count"))
    {
      -[IPAEditDescription descriptionWithOperations:](v5, "descriptionWithOperations:", v6);
      v14 = objc_claimAutoreleasedReturnValue();

      v5 = (IPAEditDescription *)v14;
    }

  }
  return v5;
}

- (id)descriptionByReplacingOperation:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  IPAEditDescription *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = a3;
  v7 = self;
  if (-[NSArray count](v7->_operations, "count") > a4)
  {
    v8 = (void *)-[NSArray mutableCopy](v7->_operations, "mutableCopy");
    v9 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v8, "replaceObjectAtIndex:withObject:", a4, v9);
    -[IPAEditDescription descriptionWithOperations:](v7, "descriptionWithOperations:", v8);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (IPAEditDescription *)v10;
  }

  return v7;
}

- (id)descriptionByRemovingOperationsStartingAtIndex:(unint64_t)a3
{
  unint64_t v5;
  IPAEditDescription *v6;
  void *v7;
  uint64_t v8;

  v5 = -[NSArray count](self->_operations, "count");
  v6 = self;
  if (v5 > a3)
  {
    -[NSArray subarrayWithRange:](self->_operations, "subarrayWithRange:", 0, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPAEditDescription descriptionWithOperations:](v6, "descriptionWithOperations:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (IPAEditDescription *)v8;
  }
  return v6;
}

- (IPAEditDescription)descriptionWithOperationsUpToUUID:(id)a3
{
  id v4;
  void *v5;
  IPAEditDescription *v6;
  uint64_t v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    _PFAssertFailHandler();
  v5 = v4;
  v6 = self;
  v7 = -[NSArray count](v6->_operations, "count");
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = v6->_operations;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
LABEL_5:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
        objc_msgSend(v14, "UUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v5, "isEqual:", v15);

        if ((v16 & 1) != 0)
          break;
        objc_msgSend(v8, "addObject:", v14);
        if (v11 == ++v13)
        {
          v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v11)
            goto LABEL_5;
          break;
        }
      }
    }

    -[IPAEditDescription descriptionWithOperations:](v6, "descriptionWithOperations:", v8);
    v17 = objc_claimAutoreleasedReturnValue();

    v6 = (IPAEditDescription *)v17;
  }

  return v6;
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@:%p operations=%@"), objc_opt_class(), self, self->_operations);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPAEditDescription _debugDescriptionSuffix](self, "_debugDescriptionSuffix");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    objc_msgSend(v3, "appendFormat:", CFSTR(" %@"), v4);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\n"), CFSTR("\n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operations, 0);
}

+ (unint64_t)insertIndexForOperationWithIdentifier:(id)a3 inArray:(id)a4 withOrdering:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    _PFAssertFailHandler();
LABEL_16:
    _PFAssertFailHandler();
  }
  if (!v8)
    goto LABEL_16;
  v10 = v9;
  v23 = v7;
  v11 = objc_msgSend(v9, "sortOrderForOperationWithIdentifier:", v7);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v25;
LABEL_5:
    v17 = 0;
    v18 = v15 + v14;
    while (1)
    {
      if (*(_QWORD *)v25 != v16)
        objc_enumerationMutation(v12);
      objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v17), "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v10, "sortOrderForOperationWithIdentifier:", v19);

      if (v11 < v20)
        break;
      if (v14 == ++v17)
      {
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        v15 = v18;
        if (v14)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
    v21 = v15 + v17;

    if (v15 + v17 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_14;
  }
  else
  {
LABEL_11:

  }
  v21 = objc_msgSend(v12, "count");
LABEL_14:

  return v21;
}

+ (id)sortOperations:(id)a3 withOrdering:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  uint32_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v26 = a4;
  if (!v26)
    _PFAssertFailHandler();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = v13;
            -[NSObject identifier](v14, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              v16 = objc_msgSend(a1, "insertIndexForOperationWithIdentifier:inArray:withOrdering:", v15, v7, v26);
              if (v16 == 0x7FFFFFFFFFFFFFFFLL)
              {
                IPAAdjustmentGetLog();
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v32 = (uint64_t)a1;
                  v33 = 2112;
                  v34 = (uint64_t)v14;
                  v18 = v17;
                  v19 = "%@ unable to divine insert index for operation: %@";
                  v20 = 22;
                  goto LABEL_17;
                }
                goto LABEL_18;
              }
              objc_msgSend(v7, "insertObject:atIndex:", v14, v16);
            }
            else
            {
              IPAAdjustmentGetLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v32 = (uint64_t)v14;
                v18 = v17;
                v19 = "%@ does not have an identifier";
                v20 = 12;
LABEL_17:
                _os_log_impl(&dword_1D4CAA000, v18, OS_LOG_TYPE_ERROR, v19, buf, v20);
              }
LABEL_18:

            }
            goto LABEL_21;
          }
          IPAAdjustmentGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v32 = (uint64_t)v13;
            _os_log_impl(&dword_1D4CAA000, v14, OS_LOG_TYPE_ERROR, "%@ is not an edit operation", buf, 0xCu);
          }
LABEL_21:

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v10);
    }

    v21 = objc_msgSend(v7, "count");
    if (v21 != objc_msgSend(v8, "count"))
    {
      IPAAdjustmentGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = objc_msgSend(v7, "count");
        v24 = objc_msgSend(v8, "count");
        *(_DWORD *)buf = 134218240;
        v32 = v23;
        v33 = 2048;
        v34 = v24;
        _os_log_impl(&dword_1D4CAA000, v22, OS_LOG_TYPE_ERROR, "ordered count %lu doesn't match input count %lu - something went wrong (see above)", buf, 0x16u);
      }

    }
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (IPAEditDescription)initWithOperations:(id)a3
{
  id v4;
  IPAEditDescription *v5;
  uint64_t v6;
  NSArray *operations;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IPAEditDescription;
  v5 = -[IPAEditDescription init](&v9, sel_init);
  if (v5)
  {
    if (v4)
      v6 = objc_msgSend(v4, "copy");
    else
      v6 = objc_opt_new();
    operations = v5->_operations;
    v5->_operations = (NSArray *)v6;

  }
  return v5;
}

- (id)_operationAtIndex:(unint64_t)a3
{
  void *v3;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else if (-[NSArray count](self->_operations, "count") <= a3)
  {
    v3 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_operations, "objectAtIndexedSubscript:", a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_operations
{
  return self->_operations;
}

- (id)_debugDescriptionSuffix
{
  return 0;
}

- (unint64_t)sortOrderForOperationWithIdentifier:(id)a3
{
  id v3;
  objc_class *v4;
  IPAEditDescription *v5;
  SEL v6;

  v3 = a3;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  v5 = (IPAEditDescription *)_PFAssertFailHandler();
  return (unint64_t)-[IPAEditDescription archivalRepresentation](v5, v6);
}

- (id)archivalRepresentation
{
  objc_class *v2;
  void *v3;
  SEL v4;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  objc_claimAutoreleasedReturnValue();
  v3 = (void *)_PFAssertFailHandler();
  return +[IPAEditDescription expectedOperationClass](v3, v4);
}

+ (Class)expectedOperationClass
{
  objc_class *v2;
  void *v3;
  SEL v4;
  id v5;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  objc_claimAutoreleasedReturnValue();
  v3 = (void *)_PFAssertFailHandler();
  return (Class)+[IPAEditDescription containsValidOperations:](v3, v4, v5);
}

+ (BOOL)containsValidOperations:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "expectedOperationClass");
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          if (v7)
            goto LABEL_4;
          break;
        }
      }
    }

  }
  return v4 == 0;
}

+ (id)presetifyAdjustmentStack:(id)a3
{
  id v3;
  objc_class *v4;
  IPAPhotoAdjustmentStack *v5;
  SEL v6;
  _NSZone *v7;

  v3 = a3;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  v5 = (IPAPhotoAdjustmentStack *)_PFAssertFailHandler();
  return -[IPAPhotoAdjustmentStack copyWithZone:](v5, v6, v7);
}

@end
