@implementation QLCacheFragHandler

- (unint64_t)totalLen
{
  return self->_totalLen;
}

- (BOOL)save
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  char v22;
  NSObject *v23;
  id v25;

  if (!self->_isDirty)
    return 1;
  if (self->_needsCompact)
  {
    _log_1();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[QLCacheFragHandler save].cold.3(v3, v4, v5, v6, v7, v8, v9, v10);

    -[QLCacheFragHandler compact](self, "compact");
    _log_1();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[QLCacheFragHandler save].cold.2(v11, v12, v13, v14, v15, v16, v17, v18);

  }
  -[QLCacheFragHandler dataToSave](self, "dataToSave");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v19, 200, 0, &v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v25;
  if (v20)
  {
    v22 = objc_msgSend(v20, "writeToFile:atomically:", self->_path, 1);
  }
  else
  {
    _log_1();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[QLCacheFragHandler save].cold.1((uint64_t)v21, v23);

    v22 = 0;
  }
  self->_isDirty = 0;

  return v22;
}

+ (void)initialize
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___QLCacheFragHandler;
  objc_msgSendSuper2(&v2, sel_initialize);
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_0);
}

uint64_t __32__QLCacheFragHandler_initialize__block_invoke()
{
  uint64_t result;

  result = QLCacheInDebugMode();
  _debugCacheFragHandler = result;
  return result;
}

- (QLCacheFragHandler)initWithHolePositions:(id)a3 holeLengths:(id)a4 totalLength:(int64_t)a5 holesLength:(int64_t)a6 cacheThread:(id)a7
{
  id v12;
  id v13;
  id v14;
  QLCacheFragHandler *v15;
  QLCacheFragHandler *v16;
  int v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  NSMutableArray *orderedByStart;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v30;
  int64_t v31;
  objc_super v32;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v32.receiver = self;
  v32.super_class = (Class)QLCacheFragHandler;
  v15 = -[QLCacheFragHandler init](&v32, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_cacheThread, v14);
    v17 = 20;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 20);
    do
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
      objc_msgSend(v18, "addObject:", v19);

      --v17;
    }
    while (v17);
    objc_storeStrong((id *)&v16->_sizeRanks, v18);
    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    orderedByStart = v16->_orderedByStart;
    v16->_orderedByStart = v20;

    if (v12 && v13)
    {
      v30 = v14;
      v31 = a6;
      v22 = objc_msgSend(v12, "count");
      if (v22)
      {
        v23 = v22;
        for (i = 0; i != v23; ++i)
        {
          objc_msgSend(v12, "objectAtIndex:", i);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "integerValue");
          objc_msgSend(v13, "objectAtIndex:", i);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          +[QLCacheHole holeWithLocation:length:](QLCacheHole, "holeWithLocation:length:", v26, objc_msgSend(v27, "integerValue"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableArray addObject:](v16->_orderedByStart, "addObject:", v28);
          -[QLCacheFragHandler _insertHoleInRanks:](v16, "_insertHoleInRanks:", v28);

        }
      }
      v14 = v30;
      v16->_totalLen = a5;
      v16->_holesLen = v31;
      v16->_isDirty = 0;
    }
    else
    {
      v16->_totalLen = 0;
      v16->_holesLen = 0;
      v16->_isDirty = 1;
    }

  }
  return v16;
}

- (QLCacheFragHandler)initWithFilePath:(id)a3 cacheThread:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  QLCacheFragHandler *v10;
  uint64_t v11;
  NSString *path;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a4;
  objc_msgSend(v7, "dictionaryWithContentsOfFile:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[QLCacheFragHandler initWithDictionary:cacheThread:](self, "initWithDictionary:cacheThread:", v9, v8);

  if (v10)
  {
    v11 = objc_msgSend(v6, "copy");
    path = v10->_path;
    v10->_path = (NSString *)v11;

  }
  return v10;
}

- (QLCacheFragHandler)initWithDictionary:(id)a3 cacheThread:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  QLCacheFragHandler *v13;

  v6 = a4;
  if (a3)
  {
    v7 = a3;
    objc_msgSend(v7, "objectForKey:", CFSTR("orderedHolesPos"));
    a3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("orderedHolesLen"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("totalLen"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "longLongValue");

    objc_msgSend(v7, "objectForKey:", CFSTR("holesLen"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "longLongValue");
  }
  else
  {
    v8 = 0;
    v10 = 0;
    v12 = 0;
  }
  v13 = -[QLCacheFragHandler initWithHolePositions:holeLengths:totalLength:holesLength:cacheThread:](self, "initWithHolePositions:holeLengths:totalLength:holesLength:cacheThread:", a3, v8, v10, v12, v6);

  return v13;
}

- (QLCacheFragHandler)initWithCacheThread:(id)a3
{
  QLCacheFragHandler *result;

  result = -[QLCacheFragHandler initWithHolePositions:holeLengths:totalLength:holesLength:cacheThread:](self, "initWithHolePositions:holeLengths:totalLength:holesLength:cacheThread:", 0, 0, 0, 0, a3);
  if (result)
    result->_isDirty = 0;
  return result;
}

- (void)_removeHoleFromRanks:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v4 = objc_msgSend(v11, "length");
  v5 = 0;
  if (v4)
  {
    do
    {
      ++v5;
      v6 = v4 > 1;
      v4 >>= 1;
    }
    while (v6);
  }
  if (v5 >= 0x13)
    v7 = 19;
  else
    v7 = v5;
  -[NSArray objectAtIndexedSubscript:](self->_sizeRanks, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (_debugCacheFragHandler)
  {
    v10 = objc_msgSend(v8, "indexOfObject:", v11);
    if (v10 + 1 < (unint64_t)objc_msgSend(v9, "count"))
      objc_msgSend(v9, "indexOfObject:inRange:", v11, v10 + 1, objc_msgSend(v9, "count") + ~v10);
  }
  objc_msgSend(v9, "removeObject:", v11);

}

- (void)_insertHoleInRanks:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  id v16;

  v16 = a3;
  v4 = objc_msgSend(v16, "length");
  v5 = v4;
  v6 = 0;
  if (v4)
  {
    v7 = v4;
    do
    {
      ++v6;
      v8 = v7 > 1;
      v7 >>= 1;
    }
    while (v8);
  }
  if (v6 >= 0x13)
    v9 = 19;
  else
    v9 = v6;
  -[NSArray objectAtIndexedSubscript:](self->_sizeRanks, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    while (1)
    {
      objc_msgSend(v10, "objectAtIndex:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length");

      if (v5 >= v15)
        break;
      if (v12 == ++v13)
      {
        v13 = v12;
        break;
      }
    }
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v10, "insertObject:atIndex:", v16, v13);

}

- (void)clear
{
  uint64_t i;
  void *v4;

  for (i = 0; i != 20; ++i)
  {
    -[NSArray objectAtIndexedSubscript:](self->_sizeRanks, "objectAtIndexedSubscript:", i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllObjects");

  }
  -[NSMutableArray removeAllObjects](self->_orderedByStart, "removeAllObjects");
  self->_totalLen = 0;
  self->_holesLen = 0;
  self->_isDirty = 1;
}

- (unint64_t)allocateSpaceForLength:(unint64_t)a3 added:(BOOL *)a4
{
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  unint64_t totalLen;
  _BOOL4 v19;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  unint64_t v34;

  v7 = 0;
  if (a3)
  {
    v8 = a3;
    do
    {
      ++v7;
      v9 = v8 > 1;
      v8 >>= 1;
    }
    while (v9);
  }
  v10 = 0;
  if (v7 >= 0x13)
    v11 = 19;
  else
    v11 = v7;
  while (1)
  {
    v12 = v10;
    -[NSArray objectAtIndexedSubscript:](self->_sizeRanks, "objectAtIndexedSubscript:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v10, "count");
    if (v13)
    {
      v14 = v13;
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "length");

      if (v16 >= a3)
        break;
    }
    if (v11++ >= 0x13)
    {
      totalLen = 0;
      v19 = 1;
      if (!a4)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  v21 = v14 - 1;
  objc_msgSend(v10, "objectAtIndex:", v14 - 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "length");

  if (v23 <= a3)
  {
    if (v21 < 2)
    {
      v24 = 0;
    }
    else
    {
      v24 = 0;
      do
      {
        v25 = v21 + v24;
        if (v21 + v24 < 0 != __OFADD__(v21, v24))
          ++v25;
        v26 = (int)(v25 >> 1);
        objc_msgSend(v10, "objectAtIndex:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "length");

        if (v28 <= a3)
          v29 = v26;
        else
          v29 = v21;
        if (v28 < a3)
        {
          v21 = v26;
        }
        else
        {
          v24 = v26;
          v21 = v29;
        }
      }
      while (v21 - v24 > 1);
    }
    objc_msgSend(v10, "objectAtIndex:", v24);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "length");

    objc_msgSend(v10, "objectAtIndex:", v21);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "length");

    if (v32 < a3)
      v21 = v24;
  }
  objc_msgSend(v10, "objectAtIndex:", v21);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v33);
  v34 = objc_msgSend(v33, "length");
  totalLen = objc_msgSend(v33, "location");
  if (v34 <= a3)
  {
    -[NSMutableArray removeObject:](self->_orderedByStart, "removeObject:", v33);
  }
  else
  {
    objc_msgSend(v33, "setLocation:length:", totalLen + a3, objc_msgSend(v33, "length") - a3);
    -[QLCacheFragHandler _insertHoleInRanks:](self, "_insertHoleInRanks:", v33);
  }

  v19 = 0;
  if (a4)
LABEL_12:
    *a4 = v19;
LABEL_13:
  if (v19)
  {
    totalLen = self->_totalLen;
    self->_totalLen = totalLen + a3;
  }
  else
  {
    self->_holesLen -= a3;
  }
  self->_isDirty = 1;
  if (_debugCacheFragHandler)
  {
    -[QLCacheFragHandler assertSpaceIsRetainedAtPos:withLen:](self, "assertSpaceIsRetainedAtPos:withLen:", totalLen, a3);
    -[QLCacheFragHandler checkHolesLenConsistency](self, "checkHolesLenConsistency");
  }

  return totalLen;
}

- (void)releaseSpaceAtPos:(unint64_t)a3 withLen:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  id v27;
  id v28;

  if (_debugCacheFragHandler)
    -[QLCacheFragHandler assertSpaceIsRetainedAtPos:withLen:](self, "assertSpaceIsRetainedAtPos:withLen:", a3, a4);
  v7 = -[NSMutableArray count](self->_orderedByStart, "count");
  v8 = v7;
  if (v7 < 1)
  {
    v10 = v7;
    if (!v7)
      goto LABEL_25;
  }
  else
  {
    v9 = 0;
    v10 = v7;
    do
    {
      v11 = v10 + v9;
      if ((uint64_t)(v10 + v9) < 0 != __OFADD__(v10, v9))
        ++v11;
      v12 = v11 >> 1;
      -[NSMutableArray objectAtIndex:](self->_orderedByStart, "objectAtIndex:", v11 >> 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "location");

      if (v14 <= a3)
        v15 = v12 + 1;
      else
        v15 = v9;
      if (v14 > a3)
        v16 = v12;
      else
        v16 = v12 + 1;
      if (v14 < a3)
        v9 = v12 + 1;
      else
        v9 = v15;
      if (v14 >= a3)
        v10 = v16;
    }
    while ((uint64_t)v10 > v9);
    if (!v10)
      goto LABEL_25;
  }
  -[NSMutableArray objectAtIndex:](self->_orderedByStart, "objectAtIndex:", v10 - 1);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v27, "location");
  if (objc_msgSend(v27, "length") + v17 == a3)
  {
    v18 = v27;
    goto LABEL_26;
  }

LABEL_25:
  v18 = 0;
LABEL_26:
  if (v8)
    v19 = v10 >= v8 - 1;
  else
    v19 = 1;
  v28 = v18;
  if (v19)
  {
    v23 = 0;
    if (!v18)
      goto LABEL_37;
LABEL_32:
    v20 = v18;
    -[QLCacheFragHandler _removeHoleFromRanks:](self, "_removeHoleFromRanks:", v20);
    v21 = objc_msgSend(v20, "location");
    v22 = objc_msgSend(v20, "length") + a4;
    if (v23)
    {
      objc_msgSend(v20, "setLocation:length:", v21, v22 + objc_msgSend(v23, "length"));
      -[QLCacheFragHandler _removeHoleFromRanks:](self, "_removeHoleFromRanks:", v23);
      -[NSMutableArray removeObject:](self->_orderedByStart, "removeObject:", v23);
LABEL_41:
      -[QLCacheFragHandler _insertHoleInRanks:](self, "_insertHoleInRanks:", v20);
      goto LABEL_42;
    }
    v25 = v20;
    v26 = v21;
    v24 = v22;
LABEL_40:
    objc_msgSend(v25, "setLocation:length:", v26, v24);
    goto LABEL_41;
  }
  -[NSMutableArray objectAtIndex:](self->_orderedByStart, "objectAtIndex:", v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 + a3 != objc_msgSend(v23, "location"))
  {

    v23 = 0;
  }
  v18 = v28;
  if (v28)
    goto LABEL_32;
LABEL_37:
  if (v23)
  {
    v20 = v23;
    -[QLCacheFragHandler _removeHoleFromRanks:](self, "_removeHoleFromRanks:", v20);
    v24 = objc_msgSend(v20, "length") + a4;
    v25 = v20;
    v26 = a3;
    goto LABEL_40;
  }
  +[QLCacheHole holeWithLocation:length:](QLCacheHole, "holeWithLocation:length:", a3, a4);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  self->_needsCompact = 1;
  -[QLCacheFragHandler _insertHoleInRanks:](self, "_insertHoleInRanks:", v20);
  -[NSMutableArray insertObject:atIndex:](self->_orderedByStart, "insertObject:atIndex:", v20, v10);
LABEL_42:
  self->_holesLen += a4;
  if (_debugCacheFragHandler)
    -[QLCacheFragHandler checkHolesLenConsistency](self, "checkHolesLenConsistency");
  self->_isDirty = 1;

}

- (BOOL)canFindHoleForLen:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  void *v8;
  unint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  unint64_t v13;

  v5 = 0;
  if (a3)
  {
    v6 = a3;
    do
    {
      ++v5;
      v7 = v6 > 1;
      v6 >>= 1;
    }
    while (v7);
  }
  v8 = 0;
  if (v5 >= 0x13)
    v9 = 19;
  else
    v9 = v5;
  v10 = 1;
  do
  {
    v11 = v8;
    -[NSArray objectAtIndexedSubscript:](self->_sizeRanks, "objectAtIndexedSubscript:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "objectAtIndex:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");

      if (v13 >= a3)
        break;
    }
    v10 = v9++ < 0x13;
  }
  while (v9 != 20);

  return v10;
}

- (id)lastHole
{
  void *v3;

  v3 = (void *)-[NSMutableArray count](self->_orderedByStart, "count");
  if (v3)
  {
    -[NSMutableArray lastObject](self->_orderedByStart, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)truncateUselessSpaceAtEndOfFile
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  -[NSMutableArray lastObject](self->_orderedByStart, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    v4 = objc_msgSend(v3, "location");
    v5 = objc_msgSend(v6, "length") + v4;
    v3 = v6;
    if (v5 == self->_totalLen)
    {
      -[QLCacheFragHandler truncateFromPosition:](self, "truncateFromPosition:", objc_msgSend(v6, "location"));
      v3 = v6;
    }
  }

}

- (void)truncateFromPosition:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (self->_totalLen > a3)
  {
    v5 = -[NSMutableArray count](self->_orderedByStart, "count");
    if (v5 - 1 >= 0)
    {
      v6 = v5;
      while (1)
      {
        -[NSMutableArray objectAtIndex:](self->_orderedByStart, "objectAtIndex:", --v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "location") < a3)
          break;
        self->_holesLen -= objc_msgSend(v7, "length");
        self->_isDirty = 1;
        -[NSMutableArray removeObject:](self->_orderedByStart, "removeObject:", v7);
        -[QLCacheFragHandler _removeHoleFromRanks:](self, "_removeHoleFromRanks:", v7);

        if (v6 <= 0)
          goto LABEL_8;
      }

    }
LABEL_8:
    self->_totalLen = a3;
  }
}

- (float)frag
{
  unint64_t totalLen;

  totalLen = self->_totalLen;
  if (totalLen)
    return (float)self->_holesLen / (float)totalLen;
  else
    return 0.0;
}

- (BOOL)isDirty
{
  return self->_isDirty;
}

- (id)dataToSave
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_orderedByStart, "count"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_orderedByStart, "count"));
  v6 = -[NSMutableArray count](self->_orderedByStart, "count");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      -[NSMutableArray objectAtIndex:](self->_orderedByStart, "objectAtIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v9, "location"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v10);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v9, "length"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v11);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_totalLen);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("totalLen"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_holesLen);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("holesLen"));

  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("orderedHolesPos"));
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("orderedHolesLen"));

  return v3;
}

- (void)compact
{
  OUTLINED_FUNCTION_1(&dword_1D54AE000, a1, a3, "Compacting Cache Frag Handler", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (BOOL)checkHolesLenConsistency
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = -[NSMutableArray count](self->_orderedByStart, "count");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_orderedByStart, "objectAtIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 += objc_msgSend(v7, "length");

      ++v5;
    }
    while (v4 != v5);
  }
  else
  {
    v6 = 0;
  }
  return v6 == self->_holesLen;
}

- (BOOL)checkConsistency
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  __int128 v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[NSMutableArray count](self->_orderedByStart, "count");
  if (!v3)
    return 1;
  v5 = v3;
  v6 = 0;
  v7 = 0;
  v8 = 1;
  *(_QWORD *)&v4 = 138412546;
  v13 = v4;
  do
  {
    -[NSMutableArray objectAtIndex:](self->_orderedByStart, "objectAtIndex:", v6, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "location") < v7)
    {
      _log_1();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v13;
        v15 = v9;
        v16 = 2048;
        v17 = v7;
        _os_log_error_impl(&dword_1D54AE000, v10, OS_LOG_TYPE_ERROR, "inconsistency in cache frag handler: bad hole: %@ after offset : %llu", buf, 0x16u);
      }

      v8 = 0;
    }
    v11 = objc_msgSend(v9, "location");
    v7 = objc_msgSend(v9, "length") + v11;

    ++v6;
  }
  while (v5 != v6);
  return v8;
}

- (void)assertSpaceIsRetainedAtPos:(unint64_t)a3 withLen:(unint64_t)a4
{
  char *v6;
  char *v7;
  unint64_t v8;
  id v9;
  void *v10;
  char *v11;

  v6 = (char *)-[NSMutableArray count](self->_orderedByStart, "count", a3, a4);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    while (1)
    {
      v10 = v9;
      -[NSMutableArray objectAtIndex:](self->_orderedByStart, "objectAtIndex:", v8);
      v11 = (char *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "location") > a3)
        break;
      ++v8;
      v9 = v11;
      if (v7 == (char *)v8)
      {
        v8 = (unint64_t)v7;
        break;
      }
    }
    if (v8)
    {
      -[NSMutableArray objectAtIndex:](self->_orderedByStart, "objectAtIndex:", v8 - 1);

    }
    if (v8 < (unint64_t)(v7 - 1))
    {
      -[NSMutableArray objectAtIndex:](self->_orderedByStart, "objectAtIndex:", v8);

    }
    v6 = v11;
  }

}

- (id)orderedByStart
{
  return self->_orderedByStart;
}

- (_QLCacheThread)cacheThread
{
  return (_QLCacheThread *)objc_loadWeakRetained((id *)&self->_cacheThread);
}

- (void)setCacheThread:(id)a3
{
  objc_storeWeak((id *)&self->_cacheThread, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cacheThread);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_orderedByStart, 0);
  objc_storeStrong((id *)&self->_sizeRanks, 0);
}

- (void)save
{
  OUTLINED_FUNCTION_1(&dword_1D54AE000, a1, a3, "starting compaction", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

@end
