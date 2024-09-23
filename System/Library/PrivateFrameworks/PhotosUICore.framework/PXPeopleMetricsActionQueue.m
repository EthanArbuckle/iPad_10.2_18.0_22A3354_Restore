@implementation PXPeopleMetricsActionQueue

- (PXPeopleMetricsActionQueue)init
{
  PXPeopleMetricsActionQueue *v2;
  NSMutableArray *v3;
  NSMutableArray *items;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXPeopleMetricsActionQueue;
  v2 = -[PXPeopleMetricsActionQueue init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    items = v2->_items;
    v2->_items = v3;

    v2->_queueLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)getNextItemAndPop
{
  os_unfair_lock_s *p_queueLock;
  void *v4;

  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  if (-[NSMutableArray count](self->_items, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_items, "removeObjectAtIndex:", 0);
  }
  else
  {
    v4 = 0;
  }
  os_unfair_lock_unlock(p_queueLock);
  return v4;
}

- (void)addItemToEnd:(id)a3
{
  os_unfair_lock_s *p_queueLock;
  id v5;

  p_queueLock = &self->_queueLock;
  v5 = a3;
  os_unfair_lock_lock(p_queueLock);
  -[NSMutableArray addObject:](self->_items, "addObject:", v5);

  os_unfair_lock_unlock(p_queueLock);
}

- (void)addItemToFront:(id)a3
{
  os_unfair_lock_s *p_queueLock;
  id v5;

  p_queueLock = &self->_queueLock;
  v5 = a3;
  os_unfair_lock_lock(p_queueLock);
  -[NSMutableArray insertObject:atIndex:](self->_items, "insertObject:atIndex:", v5, 0);

  os_unfair_lock_unlock(p_queueLock);
}

- (void)clearQueue
{
  os_unfair_lock_s *p_queueLock;

  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  -[NSMutableArray removeAllObjects](self->_items, "removeAllObjects");
  os_unfair_lock_unlock(p_queueLock);
}

- (BOOL)containsPerson:(id)a3
{
  id v4;
  os_unfair_lock_s *p_queueLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_queueLock = &self->_queueLock;
  os_unfair_lock_lock(&self->_queueLock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_items;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "person", (_QWORD)v14);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          os_unfair_lock_unlock(p_queueLock);

          v12 = 1;
          goto LABEL_11;
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }

  os_unfair_lock_unlock(p_queueLock);
  v12 = 0;
LABEL_11:

  return v12;
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
