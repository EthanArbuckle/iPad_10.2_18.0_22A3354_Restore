@implementation TSUProgressGroup

- (TSUProgressGroup)initWithChildren:(id)a3
{
  TSUProgressGroup *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSUProgressGroup;
  v4 = -[TSUProgress init](&v6, sel_init);
  if (v4)
  {
    v4->mChildren = (NSArray *)objc_msgSend(a3, "copy");
    v4->mChildrenProgressObserversQueue = (OS_dispatch_queue *)dispatch_queue_create("con.apple.iWork.TSUProgressGroup", 0);
  }
  return v4;
}

- (void)dealloc
{
  NSObject *mChildrenProgressObserversQueue;
  objc_super v4;

  mChildrenProgressObserversQueue = self->mChildrenProgressObserversQueue;
  if (mChildrenProgressObserversQueue)
    dispatch_release(mChildrenProgressObserversQueue);
  v4.receiver = self;
  v4.super_class = (Class)TSUProgressGroup;
  -[TSUProgress dealloc](&v4, sel_dealloc);
}

- (double)value
{
  NSArray *mChildren;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  mChildren = self->mChildren;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](mChildren, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v3)
    return 0.0;
  v4 = v3;
  v5 = *(_QWORD *)v11;
  v6 = 0.0;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v11 != v5)
        objc_enumerationMutation(mChildren);
      objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "value");
      v6 = v6 + v8;
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](mChildren, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v4);
  return v6;
}

- (double)maxValue
{
  NSArray *mChildren;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  mChildren = self->mChildren;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](mChildren, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v3)
    return 0.0;
  v4 = v3;
  v5 = *(_QWORD *)v11;
  v6 = 0.0;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v11 != v5)
        objc_enumerationMutation(mChildren);
      objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "maxValue");
      v6 = v6 + v8;
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](mChildren, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v4);
  return v6;
}

- (BOOL)isIndeterminate
{
  NSArray *mChildren;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!-[NSArray count](self->mChildren, "count"))
  {
LABEL_11:
    LOBYTE(v4) = 1;
    return v4;
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  mChildren = self->mChildren;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](mChildren, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
LABEL_4:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(mChildren);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "isIndeterminate") & 1) != 0)
        goto LABEL_11;
      if (v5 == ++v7)
      {
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](mChildren, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        LOBYTE(v4) = 0;
        if (v5)
          goto LABEL_4;
        return v4;
      }
    }
  }
  return v4;
}

- (id)addProgressObserverWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSUProgressGroup;
  v6 = -[TSUProgress addProgressObserverWithValueInterval:queue:handler:](&v8, sel_addProgressObserverWithValueInterval_queue_handler_, a4, a5, a3);
  -[TSUProgressGroup p_updateChildrenProgressObservers](self, "p_updateChildrenProgressObservers");
  return v6;
}

- (void)removeProgressObserver:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSUProgressGroup;
  -[TSUProgress removeProgressObserver:](&v4, sel_removeProgressObserver_, a3);
  -[TSUProgressGroup p_updateChildrenProgressObservers](self, "p_updateChildrenProgressObservers");
}

- (void)p_updateChildrenProgressObservers
{
  NSObject *mChildrenProgressObserversQueue;
  uint64_t v4;
  _QWORD v5[6];

  -[TSUProgress protected_minProgressObserverValueInterval](self, "protected_minProgressObserverValueInterval");
  mChildrenProgressObserversQueue = self->mChildrenProgressObserversQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__TSUProgressGroup_p_updateChildrenProgressObservers__block_invoke;
  v5[3] = &unk_24D61B378;
  v5[4] = self;
  v5[5] = v4;
  dispatch_async(mChildrenProgressObserversQueue, v5);
}

uint64_t __53__TSUProgressGroup_p_updateChildrenProgressObservers__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  id v24;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDD1460]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectAtIndex:", v6 + i), "removeProgressObserver:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      v6 += i;
    }
    while (v5);
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  v9 = *(_QWORD *)(a1 + 40);
  if (v9 >= 0 && ((v9 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 <= 0x3FE
    || (unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFELL)
  {
    v24 = v2;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v13 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      v17 = MEMORY[0x24BDAC760];
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
          v20 = *(_QWORD *)(a1 + 32);
          v21 = *(_QWORD *)(v20 + 48);
          v22 = *(double *)(a1 + 40);
          v25[0] = v17;
          v25[1] = 3221225472;
          v25[2] = __53__TSUProgressGroup_p_updateChildrenProgressObservers__block_invoke_2;
          v25[3] = &unk_24D61AB38;
          v25[4] = v20;
          objc_msgSend(v12, "addObject:", objc_msgSend(v19, "addProgressObserverWithValueInterval:queue:handler:", v21, v25, v22));
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v15);
    }
    v2 = v24;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = v12;
  }
  return objc_msgSend(v2, "drain");
}

uint64_t __53__TSUProgressGroup_p_updateChildrenProgressObservers__block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDD1460]);
  objc_msgSend(*(id *)(a1 + 32), "protected_progressDidChange");
  return objc_msgSend(v2, "drain");
}

@end
