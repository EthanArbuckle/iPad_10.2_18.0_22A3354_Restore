@implementation _TUIDynamicArrayInstance

- (_TUIDynamicArrayInstance)initWithArray:(id)a3 generation:(id)a4 count:(unint64_t)a5 observer:(id)a6
{
  id v11;
  id v12;
  id v13;
  _TUIDynamicArrayInstance *v14;
  _TUIDynamicArrayInstance *v15;
  NSMutableArray *v16;
  NSMutableArray *updateGroups;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)_TUIDynamicArrayInstance;
  v14 = -[_TUIDynamicArrayInstance init](&v19, "init");
  v15 = v14;
  if (v14)
  {
    v14->_accessLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v14->_array, a3);
    objc_storeWeak((id *)&v15->_observer, v13);
    v15->_count = a5;
    objc_storeStrong(&v15->_generation, a4);
    v16 = objc_opt_new(NSMutableArray);
    updateGroups = v15->_updateGroups;
    v15->_updateGroups = v16;

  }
  return v15;
}

- (BOOL)applyUpdatesForTransactionGroup:(id)a3
{
  return -[_TUIDynamicArrayInstance applyUpdatesForTransactionGroup:withBlock:](self, "applyUpdatesForTransactionGroup:withBlock:", a3, 0);
}

- (BOOL)optimizeUpdatesForTransactionGroup:(id)a3 block:(id)a4
{
  id v6;
  uint64_t (**v7)(id, void *);
  os_unfair_lock_s *p_accessLock;
  char *v9;
  char *v10;
  char *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSMutableArray *updateGroups;
  BOOL v21;

  v6 = a3;
  v7 = (uint64_t (**)(id, void *))a4;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  v9 = (char *)-[NSMutableArray count](self->_updateGroups, "count");
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    while (1)
    {
      if (v6)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_updateGroups, "objectAtIndexedSubscript:", v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "transaction"));
        v14 = objc_msgSend(v6, "containsTransaction:", v13);

        if (!v14)
          break;
      }
      if (v10 == ++v11)
      {
        v11 = v10;
        break;
      }
    }
    if (v11)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray subarrayWithRange:](self->_updateGroups, "subarrayWithRange:", 0, v11));
      v16 = v7[2](v7, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = v17;
      if (v15 != v17)
      {
        v19 = objc_msgSend(v17, "count");
        updateGroups = self->_updateGroups;
        if (!v19)
        {
          -[NSMutableArray removeObjectsInRange:](updateGroups, "removeObjectsInRange:", 0, v11);
          v21 = 0;
          goto LABEL_14;
        }
        -[NSMutableArray replaceObjectsInRange:withObjectsFromArray:](updateGroups, "replaceObjectsInRange:withObjectsFromArray:", 0, v11, v18);
      }
      v21 = 1;
LABEL_14:

      goto LABEL_15;
    }
  }
  v21 = 0;
LABEL_15:
  os_unfair_lock_unlock(p_accessLock);

  return v21;
}

- (BOOL)hasUpdatesForTransactionGroup:(id)a3
{
  id v4;
  os_unfair_lock_s *p_accessLock;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  unsigned __int8 v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_updateGroups;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        if (v4)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "transaction", (_QWORD)v15));
          v12 = objc_msgSend(v4, "containsTransaction:", v11);

          if ((v12 & 1) == 0)
            continue;
        }
        v13 = 1;
        goto LABEL_13;
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v13 = 0;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v13 = 0;
  }
LABEL_13:

  os_unfair_lock_unlock(p_accessLock);
  return v13;
}

- (BOOL)optimizeUpdatesForTransactionGroup:(id)a3
{
  return -[_TUIDynamicArrayInstance optimizeUpdatesForTransactionGroup:block:](self, "optimizeUpdatesForTransactionGroup:block:", a3, &stru_242198);
}

- (id)_dequeueUpdateGroup
{
  os_unfair_lock_s *p_accessLock;
  void *v4;

  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  if (-[NSMutableArray count](self->_updateGroups, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_updateGroups, "firstObject"));
    -[NSMutableArray removeObjectAtIndex:](self->_updateGroups, "removeObjectAtIndex:", 0);
  }
  else
  {
    v4 = 0;
  }
  os_unfair_lock_unlock(p_accessLock);
  return v4;
}

- (id)_dequeueUpdateGroupForTransactionGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;

  v4 = a3;
  os_unfair_lock_lock(&self->_accessLock);
  if (!-[NSMutableArray count](self->_updateGroups, "count"))
    goto LABEL_6;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_updateGroups, "firstObject"));
  v6 = v5;
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transaction"));
    v8 = objc_msgSend(v4, "containsTransaction:", v7);

    if (!v8)
    {

LABEL_6:
      v6 = 0;
      goto LABEL_7;
    }
  }
  -[NSMutableArray removeObjectAtIndex:](self->_updateGroups, "removeObjectAtIndex:", 0);
LABEL_7:
  os_unfair_lock_unlock(&self->_accessLock);

  return v6;
}

- (BOOL)applyUpdatesForTransactionGroup:(id)a3 withBlock:(id)a4
{
  void (**v6)(id, id, id, id);
  void *v7;
  void *v8;
  void *v9;
  id generation;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v6 = (void (**)(id, id, id, id))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIDynamicArrayInstance _dequeueUpdateGroupForTransactionGroup:](self, "_dequeueUpdateGroupForTransactionGroup:", a3));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "generation"));
    generation = self->_generation;
    self->_generation = v9;

    self->_count = (unint64_t)objc_msgSend(v8, "count");
    if (v6)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "updates", 0));
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v18;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v18 != v14)
              objc_enumerationMutation(v11);
            v6[2](v6, objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v15), "kind"), objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v15), "oldIndex"), objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v15), "newIndex"));
            v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v13);
      }

    }
  }

  return v8 != 0;
}

- (void)objectsInRange:(_NSRange)a3 block:(id)a4
{
  if (a4)
    -[_TUIDynamicArrayInstance fetchDataForRange:generation:block:](self, "fetchDataForRange:generation:block:", a3.location, a3.length, self->_generation, a4);
}

- (void)objectsAtIndexes:(id)a3 block:(id)a4
{
  if (a4)
    -[_TUIDynamicArrayInstance fetchDataForIndexes:generation:block:](self, "fetchDataForIndexes:generation:block:", a3, self->_generation, a4);
}

- (void)enqueueUpdateGroup:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;
  void *v6;
  id WeakRetained;

  p_accessLock = &self->_accessLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  -[NSMutableArray addObject:](self->_updateGroups, "addObject:", v5);
  os_unfair_lock_unlock(p_accessLock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transaction"));

  objc_msgSend(WeakRetained, "dynamicChanged:transaction:", self, v6);
}

- (void)fetchDataForRange:(_NSRange)a3 generation:(id)a4 block:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  TUIDynamicArray *array;
  id v9;
  id v10;
  id v11;

  length = a3.length;
  location = a3.location;
  array = self->_array;
  v9 = a5;
  v10 = a4;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[TUIDynamicArray dataProvider](array, "dataProvider"));
  objc_msgSend(v11, "fetchDataForRange:generation:block:", location, length, v10, v9);

}

- (void)fetchDataForIndexes:(id)a3 generation:(id)a4 block:(id)a5
{
  TUIDynamicArray *array;
  id v8;
  id v9;
  id v10;
  id v11;

  array = self->_array;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[TUIDynamicArray dataProvider](array, "dataProvider"));
  objc_msgSend(v11, "fetchDataForIndexes:generation:block:", v10, v9, v8);

}

- (unint64_t)countForGeneration:(id)a3
{
  TUIDynamicArray *array;
  id v4;
  void *v5;
  id v6;

  array = self->_array;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIDynamicArray dataProvider](array, "dataProvider"));
  v6 = objc_msgSend(v5, "countForGeneration:", v4);

  return (unint64_t)v6;
}

- (id)tui_objectAtIndex:(int64_t)a3
{
  unint64_t v5;
  int64_t v6;
  id v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_12B010;
  v13 = sub_12B020;
  v14 = 0;
  v5 = -[_TUIDynamicArrayInstance count](self, "count");
  v6 = (v5 & (a3 >> 63)) + a3;
  if (v6 >= 0 && v6 < v5)
    -[_TUIDynamicArrayInstance fetchDataForRange:generation:block:](self, "fetchDataForRange:generation:block:");
  v7 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v7;
}

- (id)tui_subarrayWithStart:(int64_t)a3 end:(int64_t)a4
{
  unint64_t v7;
  int64_t v8;
  void *v9;
  int64_t v10;
  id v11;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v7 = -[_TUIDynamicArrayInstance count](self, "count");
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_12B010;
  v17 = sub_12B020;
  v18 = 0;
  v8 = (v7 & (a3 >> 63)) + a3;
  if (v8 < 0)
  {
    v9 = 0;
  }
  else
  {
    v9 = 0;
    if (v8 < v7)
    {
      v10 = (v7 & (a4 >> 63)) + a4;
      if ((v10 & 0x8000000000000000) == 0 && v10 < v7 && v8 <= v10)
      {
        -[_TUIDynamicArrayInstance fetchDataForRange:generation:block:](self, "fetchDataForRange:generation:block:");
        v9 = (void *)v14[5];
      }
    }
  }
  v11 = v9;
  _Block_object_dispose(&v13, 8);

  return v11;
}

- (void)tui_unwwrapEnumeratorWithBlock:(id)a3
{
  id v4;
  unint64_t v5;
  id generation;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = -[_TUIDynamicArrayInstance count](self, "count");
  generation = self->_generation;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_12B23C;
  v8[3] = &unk_240E78;
  v9 = v4;
  v7 = v4;
  -[_TUIDynamicArrayInstance fetchDataForRange:generation:block:](self, "fetchDataForRange:generation:block:", 0, v5, generation, v8);

}

- (BOOL)tui_hasProperty:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("count"));
}

- (id)tui_valueForProperty:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("count")))
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_count));
  else
    v4 = 0;
  return v4;
}

- (TUIDynamicArrayObserving)observer
{
  return (TUIDynamicArrayObserving *)objc_loadWeakRetained((id *)&self->_observer);
}

- (unint64_t)count
{
  return self->_count;
}

- (id)generation
{
  return self->_generation;
}

- (TUIDynamicArray)array
{
  return self->_array;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
  objc_storeStrong(&self->_generation, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_updateGroups, 0);
}

@end
