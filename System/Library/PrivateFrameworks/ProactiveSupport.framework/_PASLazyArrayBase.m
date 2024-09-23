@implementation _PASLazyArrayBase

- (void)enumerateObjectsUsingBlock:(id)a3
{
  void (**v5)(id, void *, uint64_t, unsigned __int8 *);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v13;
  void *v14;
  unsigned __int8 v15;

  v5 = (void (**)(id, void *, uint64_t, unsigned __int8 *))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLazyArrayBase.m"), 15, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v15 = 0;
  v6 = -[_PASLazyArrayBase count](self, "count");
  if (v6)
  {
    v7 = 0;
    v8 = v6 - 1;
    do
    {
      v9 = (void *)MEMORY[0x1A1AFDC98]();
      -[_PASLazyArrayBase objectAtIndex:](self, "objectAtIndex:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASLazyArrayBase.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("obj"));

      }
      v5[2](v5, v10, v7, &v15);
      v11 = v15;

      objc_autoreleasePoolPop(v9);
      if (v11)
        break;
    }
    while (v8 != v7++);
  }

}

- (id)objectsAtIndexes:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _PASLazyArrayBase *v11;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void *v18;
  id v19;
  _PASLazyArrayBase *v20;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  v6 = -[_PASLazyArrayBase count](self, "count");
  if (!v4)
    goto LABEL_6;
  if (!v5)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1A1AFDC98](v6));
    v10 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_9;
  }
  v7 = v6;
  if (objc_msgSend(v4, "lastIndex") >= v6)
  {
LABEL_6:
    v21.receiver = self;
    v21.super_class = (Class)_PASLazyArrayBase;
    -[_PASLazyArrayBase objectsAtIndexes:](&v21, sel_objectsAtIndexes_, v4);
    v11 = (_PASLazyArrayBase *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v10 = v11;
    goto LABEL_9;
  }
  if (v5 != 1)
  {
    if (v5 != v7)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __38___PASLazyArrayBase_objectsAtIndexes___block_invoke;
      v18 = &unk_1E442F980;
      v19 = v13;
      v20 = self;
      v14 = v13;
      objc_msgSend(v4, "enumerateIndexesUsingBlock:", &v15);
      v10 = (void *)objc_msgSend(v14, "copy", v15, v16, v17, v18);

      goto LABEL_9;
    }
    v11 = self;
    goto LABEL_7;
  }
  v8 = (void *)MEMORY[0x1A1AFDC98]();
  -[_PASLazyArrayBase objectAtIndex:](self, "objectAtIndex:", objc_msgSend(v4, "firstIndex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v8);
LABEL_9:

  return v10;
}

- (id)sortedArrayFromRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  length = a3.length;
  location = a3.location;
  v9 = a5;
  v10 = (void *)MEMORY[0x1A1AFDC98]();
  -[_PASLazyArrayBase subarrayWithRange:](self, "subarrayWithRange:", location, length);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v12, "sortWithOptions:usingComparator:", a4, v9);
  v13 = (void *)objc_msgSend(v12, "copy");

  objc_autoreleasePoolPop(v10);
  return v13;
}

- (id)subarrayWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v6;
  _PASLazyArrayBase *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  _QWORD v16[2];

  length = a3.length;
  location = a3.location;
  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = -[_PASLazyArrayBase count](self, "count");
  if (location + length > v6)
  {
    v15.receiver = self;
    v15.super_class = (Class)_PASLazyArrayBase;
    -[_PASLazyArrayBase subarrayWithRange:](&v15, sel_subarrayWithRange_, location, length);
    v7 = (_PASLazyArrayBase *)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  if (length == 1)
  {
    v9 = (void *)MEMORY[0x1A1AFDC98]();
    -[_PASLazyArrayBase objectAtIndex:](self, "objectAtIndex:", location);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v9);
    return v11;
  }
  else if (length)
  {
    if (length == v6)
    {
      v7 = self;
      return v7;
    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", length);
    if (location < location + length)
    {
      do
      {
        -[_PASLazyArrayBase objectAtIndex:](self, "objectAtIndex:", location);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v13);

        ++location;
        --length;
      }
      while (length);
    }
    v14 = (void *)objc_msgSend(v12, "copy");

    return v14;
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1A1AFDC98]());
    return MEMORY[0x1E0C9AA60];
  }
}

- (BOOL)isEqualToArray:(id)a3
{
  _PASLazyArrayBase *v4;
  _PASLazyArrayBase *v5;
  uint64_t v6;
  BOOL v7;
  _QWORD v9[4];
  _PASLazyArrayBase *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = (_PASLazyArrayBase *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v7 = 1;
  }
  else if (v4 && (v6 = -[_PASLazyArrayBase count](v4, "count"), v6 == -[_PASLazyArrayBase count](self, "count")))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 1;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __36___PASLazyArrayBase_isEqualToArray___block_invoke;
    v9[3] = &unk_1E442F9A8;
    v10 = v5;
    v11 = &v12;
    -[_PASLazyArrayBase enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v9);
    v7 = *((_BYTE *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)arrayByAddingObject:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = -[_PASLazyArrayBase count](self, "count");
    v6 = (void *)MEMORY[0x1A1AFDC98]();
    if (v5)
    {
      v7 = (void *)-[_PASLazyArrayBase mutableCopy](self, "mutableCopy");
      objc_msgSend(v7, "addObject:", v4);
      v8 = (void *)objc_msgSend(v7, "copy");

    }
    else
    {
      v11[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_PASLazyArrayBase;
    -[_PASLazyArrayBase arrayByAddingObject:](&v10, sel_arrayByAddingObject_, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)arrayByAddingObjectsFromArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _PASLazyArrayBase *v7;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)MEMORY[0x1A1AFDC98]();
    v6 = (void *)-[_PASLazyArrayBase mutableCopy](self, "mutableCopy");
    objc_msgSend(v6, "addObjectsFromArray:", v4);
    v7 = (_PASLazyArrayBase *)objc_msgSend(v6, "copy");

    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v7 = self;
  }

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;

  v4 = -[_PASLazyArrayBase count](self, "count", a3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v4);
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      v7 = (void *)MEMORY[0x1A1AFDC98]();
      -[_PASLazyArrayBase objectAtIndex:](self, "objectAtIndex:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v8);

      objc_autoreleasePoolPop(v7);
    }
  }
  return v5;
}

@end
