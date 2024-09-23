@implementation NSArray

- (id)crl_initWithCGFloats:(const double *)a3 count:(unint64_t)a4
{
  _BYTE *v7;
  uint64_t v8;
  NSArray *v9;
  _BYTE v11[128];

  if (a4 < 0x11)
  {
    if (!a4)
      return -[NSArray initWithObjects:count:](self, "initWithObjects:count:", v11, 0);
    v7 = v11;
LABEL_5:
    v8 = 0;
    do
    {
      *(_QWORD *)&v7[8 * v8] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3[v8]);
      ++v8;
    }
    while (a4 != v8);
    v9 = -[NSArray initWithObjects:count:](self, "initWithObjects:count:", v7, a4);
    if (v7 != v11)
      free(v7);
    return v9;
  }
  v7 = malloc_type_calloc(a4, 8uLL, 0x80040B8603338uLL);
  if (v7)
    goto LABEL_5;
  return -[NSArray initWithObjects:count:](self, "initWithObjects:count:", 0, a4);
}

+ (id)crl_arrayWithCGFloats:(const double *)a3 count:(unint64_t)a4
{
  return objc_msgSend(objc_alloc((Class)a1), "crl_initWithCGFloats:count:", a3, a4);
}

- (id)crl_initWithInts:(const int *)a3 count:(unint64_t)a4
{
  _BYTE *v7;
  uint64_t v8;
  NSArray *v9;
  _BYTE v11[128];

  if (a4 < 0x11)
  {
    if (!a4)
      return -[NSArray initWithObjects:count:](self, "initWithObjects:count:", v11, 0);
    v7 = v11;
LABEL_5:
    v8 = 0;
    do
    {
      *(_QWORD *)&v7[8 * v8] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3[v8]);
      ++v8;
    }
    while (a4 != v8);
    v9 = -[NSArray initWithObjects:count:](self, "initWithObjects:count:", v7, a4);
    if (v7 != v11)
      free(v7);
    return v9;
  }
  v7 = malloc_type_calloc(a4, 8uLL, 0x80040B8603338uLL);
  if (v7)
    goto LABEL_5;
  return -[NSArray initWithObjects:count:](self, "initWithObjects:count:", 0, a4);
}

+ (id)crl_arrayWithInts:(const int *)a3 count:(unint64_t)a4
{
  return objc_msgSend(objc_alloc((Class)a1), "crl_initWithInts:count:", a3, a4);
}

+ (id)crl_arrayByUnioningArray:(id)a3 withArray:(id)a4
{
  if (a3)
    return objc_msgSend(a3, "crl_arrayByAddingNonContainedObjectsFromArray:", a4);
  else
    return a4;
}

- (id)crl_initWithUIntegers:(const unint64_t *)a3 count:(unint64_t)a4
{
  _BYTE *v7;
  uint64_t v8;
  NSArray *v9;
  _BYTE v11[128];

  if (a4 < 0x11)
  {
    if (!a4)
      return -[NSArray initWithObjects:count:](self, "initWithObjects:count:", v11, 0);
    v7 = v11;
LABEL_5:
    v8 = 0;
    do
    {
      *(_QWORD *)&v7[8 * v8] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3[v8]);
      ++v8;
    }
    while (a4 != v8);
    v9 = -[NSArray initWithObjects:count:](self, "initWithObjects:count:", v7, a4);
    if (v7 != v11)
      free(v7);
    return v9;
  }
  v7 = malloc_type_calloc(a4, 8uLL, 0x80040B8603338uLL);
  if (v7)
    goto LABEL_5;
  return -[NSArray initWithObjects:count:](self, "initWithObjects:count:", 0, a4);
}

+ (id)crl_arrayWithUIntegers:(const unint64_t *)a3 count:(unint64_t)a4
{
  return objc_msgSend(objc_alloc((Class)a1), "crl_initWithUIntegers:count:", a3, a4);
}

- (id)crl_rangeCheckedObjectAtIndex:(unint64_t)a3
{
  if (-[NSArray count](self, "count") <= a3)
    return 0;
  else
    return -[NSArray objectAtIndex:](self, "objectAtIndex:", a3);
}

- (id)crl_objectPriorToObject:(id)a3
{
  NSUInteger v4;

  v4 = -[NSArray indexOfObject:](self, "indexOfObject:", a3);
  if (v4 && v4 != 0x7FFFFFFFFFFFFFFFLL)
    return -[NSArray objectAtIndex:](self, "objectAtIndex:", v4 - 1);
  else
    return 0;
}

- (unint64_t)crl_indexOfSmallestObject
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  id v6;
  unint64_t v7;
  id v8;
  id v9;

  v3 = -[NSArray count](self, "count");
  if (!v3)
    return 0x7FFFFFFFFFFFFFFFLL;
  v4 = v3;
  v5 = 0;
  v6 = 0;
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    v8 = -[NSArray objectAtIndex:](self, "objectAtIndex:", v5);
    v9 = v8;
    if (!v6 || objc_msgSend(v8, "compare:", v6) == (id)-1)
    {
      v7 = v5;
      v6 = v9;
    }
    ++v5;
  }
  while (v4 != v5);
  return v7;
}

- (id)crl_indexesOfObjects:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSUInteger v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v5 = +[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(a3);
        v10 = -[NSArray indexOfObject:](self, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9));
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v5, "addIndex:", v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  return v5;
}

- (id)crl_arrayWithObjectsInSet:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v5 = +[NSMutableArray array](NSMutableArray, "array");
  if (a3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(self);
          v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(a3, "containsObject:", v10))
            objc_msgSend(v5, "addObject:", v10);
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
  }
  return v5;
}

- (id)crl_arrayWithObjectsInHashTable:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v5 = +[NSMutableArray array](NSMutableArray, "array");
  if (a3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(self);
          v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(a3, "containsObject:", v10))
            objc_msgSend(v5, "addObject:", v10);
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
  }
  return v5;
}

- (id)crl_intersectionWithArray:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v5 = +[NSMutableArray array](NSMutableArray, "array");
  if (a3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(self);
          v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(a3, "indexOfObject:", v10) != (id)0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v5, "addObject:", v10);
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
  }
  return v5;
}

- (id)crl_arrayByRemovingObjectsIdenticalToObjectsInArray:(id)a3
{
  char *v5;
  char *v6;
  char *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  id i;

  v5 = (char *)objc_msgSend(a3, "count");
  if (!v5)
    return self;
  v6 = v5;
  v7 = 0;
  v8 = 0;
  v9 = (NSMutableArray *)self;
  do
  {
    v10 = objc_msgSend(a3, "objectAtIndex:", v7);
    v11 = -[NSMutableArray indexOfObjectIdenticalTo:](v9, "indexOfObjectIdenticalTo:", v10);
    if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      for (i = v11;
            i != (id)0x7FFFFFFFFFFFFFFFLL;
            i = -[NSMutableArray indexOfObjectIdenticalTo:](v9, "indexOfObjectIdenticalTo:", v10))
      {
        if (!v8)
        {
          v9 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", self);
          v8 = v9;
        }
        -[NSMutableArray removeObjectAtIndex:](v8, "removeObjectAtIndex:", i);
      }
    }
    ++v7;
  }
  while (v7 != v6);
  return v9;
}

- (id)crl_arrayByAddingNonContainedObjectsFromArray:(id)a3
{
  char *v5;
  char *v6;
  uint64_t v7;
  NSMutableArray *v8;
  id v9;

  if (a3 && (v5 = (char *)objc_msgSend(a3, "count")) != 0)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = objc_msgSend(a3, "objectAtIndex:", v7);
      if (!-[NSArray containsObject:](self, "containsObject:", v9))
      {
        if (!v8)
        {
          v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", &v6[-[NSArray count](self, "count")]);
          -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", self);
        }
        -[NSMutableArray addObject:](v8, "addObject:", v9);
      }
      ++v7;
      --v6;
    }
    while (v6);
  }
  else
  {
    v8 = 0;
  }
  if (v8)
    return v8;
  else
    return self;
}

- (id)crl_arrayByReversingOrder
{
  NSMutableArray *v3;
  NSEnumerator *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSArray count](self, "count"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[NSArray reverseObjectEnumerator](self, "reverseObjectEnumerator", 0);
  v5 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableArray addObject:](v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v3;
}

- (id)crl_arrayByRemovingFirstObject
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  Swift::String v14;

  if (!-[NSArray count](self, "count"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012329B8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF1DC4();
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF1D4C();
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Can't remove the first object of an empty array!", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[NSArray(CRLAdditions) crl_arrayByRemovingFirstObject]");
    v13 = +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSArray(CRLAdditions) crl_arrayByRemovingFirstObject]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSArray_CRLAdditions.m"), 239, 1, "Can't remove the first object of an empty array!");
    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v13, v14);
    abort();
  }
  v3 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", self);
  -[NSMutableArray removeObjectAtIndex:](v3, "removeObjectAtIndex:", 0);
  return objc_msgSend((id)objc_opt_class(self, v4), "arrayWithArray:", v3);
}

- (id)crl_arrayByRemovingObjectsAtIndexes:(id)a3
{
  id v5;
  NSArray *v6;

  if (!objc_msgSend(a3, "count"))
    return self;
  v5 = -[NSArray mutableCopy](self, "mutableCopy");
  objc_msgSend(v5, "removeObjectsAtIndexes:", a3);
  v6 = +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v5);

  return v6;
}

- (void)crl_enumerateSnapshotObjectsUsingBlock:(id)a3
{
  id v4;

  v4 = -[NSArray copy](self, "copy");
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", a3);

}

- (id)crl_firstObjectPassingTest:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (!a3)
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_4:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(self);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if (((*((uint64_t (**)(id, void *))a3 + 2))(a3, v9) & 1) != 0)
      return v9;
    if (v6 == (id)++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v9 = 0;
      if (v6)
        goto LABEL_4;
      return v9;
    }
  }
}

- (BOOL)crl_containsObjectPassingTest:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (a3)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(self);
          if (((*((uint64_t (**)(id, _QWORD))a3 + 2))(a3, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i)) & 1) != 0)
          {
            LOBYTE(v5) = 1;
            return (char)v5;
          }
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        LOBYTE(v5) = 0;
        if (v6)
          continue;
        break;
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return (char)v5;
}

- (BOOL)crl_isHomogeneousForClass:(Class)a3
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(self);
        if ((objc_opt_isKindOfClass(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), a3) & 1) == 0)
          return 0;
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
  return 1;
}

- (BOOL)crl_allObjectsPassTest:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(self);
      v9 = (*((uint64_t (**)(id, _QWORD))a3 + 2))(a3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
      if (!v9)
        break;
      if (v6 == (id)++v8)
      {
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v9) = 1;
  }
  return v9;
}

- (id)crl_arrayOfObjectsPassingTest:(id)a3
{
  NSIndexSet *v4;
  NSIndexSet *v5;
  _QWORD v7[5];

  if (!a3)
    return +[NSArray array](NSArray, "array");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100097FC0;
  v7[3] = &unk_101232A00;
  v7[4] = a3;
  v4 = -[NSArray indexesOfObjectsPassingTest:](self, "indexesOfObjectsPassingTest:", v7);
  if (!v4)
    return +[NSArray array](NSArray, "array");
  v5 = v4;
  if (!-[NSIndexSet count](v4, "count"))
    return +[NSArray array](NSArray, "array");
  if (-[NSIndexSet containsIndexesInRange:](v5, "containsIndexesInRange:", 0, -[NSArray count](self, "count")))
    return self;
  return -[NSArray objectsAtIndexes:](self, "objectsAtIndexes:", v5);
}

- (id)crl_arrayByTransformingWithBlock:(id)a3
{
  NSMutableArray *v5;
  _QWORD v7[6];

  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSArray count](self, "count"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100098058;
  v7[3] = &unk_101232A28;
  v7[4] = v5;
  v7[5] = a3;
  -[NSArray enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v7);
  return v5;
}

- (id)crl_arrayByMappingObjectsUsingBlock:(id)a3
{
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  unsigned int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  _BYTE v32[128];

  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSArray count](self, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v18, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(self);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v9);
        v11 = (*((uint64_t (**)(id, uint64_t))a3 + 2))(a3, v10);
        if (v11)
        {
          -[NSMutableArray addObject:](v5, "addObject:", v11);
        }
        else
        {
          v12 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101232A48);
          v13 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            v23 = v12;
            v24 = 2082;
            v25 = "-[NSArray(CRLAdditions) crl_arrayByMappingObjectsUsingBlock:]";
            v26 = 2082;
            v27 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSArray_CRLAdditions.m";
            v28 = 1024;
            v29 = 370;
            v30 = 2112;
            v31 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Block returned a nil object for %@.", buf, 0x2Cu);
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101232A68);
          }
          v14 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v15 = +[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString");
            *(_DWORD *)buf = 67109378;
            v23 = v12;
            v24 = 2114;
            v25 = v15;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSArray(CRLAdditions) crl_arrayByMappingObjectsUsingBlock:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSArray_CRLAdditions.m"), 370, 0, "Block returned a nil object for %@.", v10);
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v18, v32, 16);
      v7 = v16;
    }
    while (v16);
  }
  return -[NSMutableArray copy](v5, "copy");
}

- (id)crl_arrayByFlattening
{
  id v3;
  _QWORD v5[5];
  _QWORD v6[6];

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3052000000;
  v6[3] = sub_1000984BC;
  v6[4] = sub_1000984CC;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000984D8;
  v5[3] = &unk_101232A90;
  v5[4] = v6;
  v6[5] = v5;
  sub_1000984D8((uint64_t)v5, self, v3);
  _Block_object_dispose(v6, 8);
  return v3;
}

- (id)crl_uniqueObjects
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", self);
}

- (id)crl_onlyObject
{
  if (-[NSArray count](self, "count") >= 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232AB0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF1E7C();
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF1D4C();
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSArray(CRLAdditions) crl_onlyObject]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSArray_CRLAdditions.m"), 400, 0, "As this method returns the only object in the array, it only makes sense if the array has at most one object.");
  }
  return -[NSArray firstObject](self, "firstObject");
}

+ (id)crl_arrayWithNonNilObject:(id)a3
{
  id v4;

  if (!a3)
    return &__NSArray0__struct;
  v4 = a3;
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v4, 1);
}

- (id)crl_UTTypes
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[NSArray crl_isHomogeneousForClass:](self, "crl_isHomogeneousForClass:", objc_opt_class(NSString, a2)))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray crl_arrayByTransformingWithBlock:](self, "crl_arrayByTransformingWithBlock:", &stru_1012383B0));
  }
  else
  {
    v4 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101238350);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFAC9C(v4, v5);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101238370);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSArray(CRLUTIUtilities) crl_UTTypes]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLUTIUtilities.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 139, 0, "Expecting an array of strings.");

    v3 = &__NSArray0__struct;
  }
  return v3;
}

- (BOOL)crl_conformsToAnyUTType:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[NSArray crl_UTTypes](self, "crl_UTTypes"));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v5);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "crl_conformsToAnyUTType:", v4, (_QWORD)v10) & 1) != 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return (char)v6;
}

- (BOOL)crl_enumerateAllBoardItemsNestedRecursivelyUsingBlock:(id)a3
{
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001643E8;
  v6[3] = &unk_10123D410;
  v8 = &v9;
  v4 = a3;
  v7 = v4;
  -[NSArray enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v6);
  LOBYTE(self) = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)self;
}

- (id)crl_boardItemsFromIngestibleItemsAndDescriptions:(id)a3
{
  return objc_msgSend(a3, "crl_arrayByTransformingWithBlock:", &stru_10123D560);
}

- (id)crlaxExtractElementsOfType:(Class)a3
{
  NSMutableArray *v5;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = objc_opt_new(NSMutableArray);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_isKindOfClass(v11, a3) & 1) != 0)
          -[NSMutableArray addObject:](v5, "addObject:", v11, (_QWORD)v13);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)crlaxObjectsPassingTest:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray indexesOfObjectsPassingTest:](self, "indexesOfObjectsPassingTest:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectsAtIndexes:](self, "objectsAtIndexes:", v4));

  return v5;
}

- (id)crlaxObjectAtIndexOrNil:(unint64_t)a3
{
  void *v5;

  if (-[NSArray count](self, "count") <= a3)
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", a3));
  return v5;
}

- (id)crlaxFirstElementOfType:(Class)a3
{
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_isKindOfClass(v9, a3) & 1) != 0)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)crlaxPerformBlock:(id)a3 onElementsOfType:(Class)a4
{
  void (**v6)(id, _QWORD);
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = (void (**)(id, _QWORD))a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_isKindOfClass(v12, a4) & 1) != 0)
          v6[2](v6, v12);
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

@end
