@implementation TSKChangeNotifier

- (TSKChangeNotifier)init
{
  TSKChangeNotifier *v2;
  const __CFAllocator *v3;
  const CFDictionaryValueCallBacks *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSKChangeNotifier;
  v2 = -[TSKChangeNotifier init](&v6, sel_init);
  if (v2)
  {
    v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v4 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
    v2->mChangeSourceObservers = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, MEMORY[0x24BDBD6B0]);
    v2->mChangeSourceOfClassObservers = CFDictionaryCreateMutable(v3, 0, 0, v4);
    v2->mQueuedObserverListChanges = CFArrayCreateMutable(v3, 0, MEMORY[0x24BDBD690]);
  }
  return v2;
}

- (void)dealloc
{
  __CFDictionary *mChangeSourceObservers;
  __CFDictionary *mChangeSourceOfClassObservers;
  __CFArray *mQueuedObserverListChanges;
  objc_super v6;

  mChangeSourceObservers = self->mChangeSourceObservers;
  if (mChangeSourceObservers)
    CFRelease(mChangeSourceObservers);
  mChangeSourceOfClassObservers = self->mChangeSourceOfClassObservers;
  if (mChangeSourceOfClassObservers)
    CFRelease(mChangeSourceOfClassObservers);
  mQueuedObserverListChanges = self->mQueuedObserverListChanges;
  if (mQueuedObserverListChanges)
    CFRelease(mQueuedObserverListChanges);
  v6.receiver = self;
  v6.super_class = (Class)TSKChangeNotifier;
  -[TSKChangeNotifier dealloc](&v6, sel_dealloc);
}

- (id)p_findCountedObserverForObserver:(id)a3 inArray:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v13;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v8)
      objc_enumerationMutation(a4);
    v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
    if ((id)objc_msgSend(v10, "observer") == a3)
      return v10;
    if (v7 == ++v9)
    {
      v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        goto LABEL_3;
      return 0;
    }
  }
}

- (BOOL)p_pendingAddOrRemoveOfObserver:(id)a3 forChangeSource:(id)a4
{
  __CFArray *mQueuedObserverListChanges;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_sync_enter(self);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  mQueuedObserverListChanges = self->mQueuedObserverListChanges;
  v8 = -[__CFArray countByEnumeratingWithState:objects:count:](mQueuedObserverListChanges, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(mQueuedObserverListChanges);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (*(id *)(v11 + 16) == a3 && *(id *)(v11 + 24) == a4)
        {
          v12 = 1;
          goto LABEL_12;
        }
      }
      v8 = -[__CFArray countByEnumeratingWithState:objects:count:](mQueuedObserverListChanges, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_12:
  objc_sync_exit(self);
  return v12;
}

- (void)p_queueObserverListChange:(id)a3
{
  CFIndex Count;
  CFIndex v6;
  _QWORD *ValueAtIndex;

  objc_sync_enter(self);
  Count = CFArrayGetCount(self->mQueuedObserverListChanges);
  if (Count < 1)
  {
LABEL_7:
    CFArrayAppendValue(self->mQueuedObserverListChanges, a3);
  }
  else
  {
    v6 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(self->mQueuedObserverListChanges, v6);
      if (ValueAtIndex[2] == *((_QWORD *)a3 + 2)
        && ValueAtIndex[3] == *((_QWORD *)a3 + 3)
        && *((_DWORD *)ValueAtIndex + 2) != *((_DWORD *)a3 + 2))
      {
        break;
      }
      if (Count == ++v6)
        goto LABEL_7;
    }
    CFArrayRemoveValueAtIndex(self->mQueuedObserverListChanges, v6);
  }
  objc_sync_exit(self);
}

- (void)p_addObserver:(id)a3 forChangeSource:(id)a4 isClass:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v9;
  const __CFDictionary *v10;
  id Value;
  id v12;
  TSKCountedObserver *v13;

  v5 = a5;
  objc_sync_enter(self);
  if (self->mProcessingChanges)
  {
    -[TSKChangeNotifier p_queueObserverListChange:](self, "p_queueObserverListChange:", +[TSKQueuedObserverSet queuedObserverSetWithChangeType:observer:changeSource:isClass:](TSKQueuedObserverSet, "queuedObserverSetWithChangeType:observer:changeSource:isClass:", 0, a3, a4, v5));
  }
  else
  {
    v9 = 8;
    if (v5)
      v9 = 16;
    v10 = *(Class *)((char *)&self->super.isa + v9);
    Value = (id)CFDictionaryGetValue(v10, a4);
    if (!Value)
    {
      Value = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      CFDictionarySetValue(v10, a4, Value);

    }
    v12 = -[TSKChangeNotifier p_findCountedObserverForObserver:inArray:](self, "p_findCountedObserverForObserver:inArray:", a3, Value);
    if (v12)
    {
      objc_msgSend(v12, "incrementCount");
    }
    else
    {
      v13 = -[TSKCountedObserver initWithObserver:]([TSKCountedObserver alloc], "initWithObserver:", a3);
      objc_msgSend(Value, "addObject:", v13);

    }
  }
  objc_sync_exit(self);
}

- (void)addObserver:(id)a3 forChangeSource:(id)a4
{
  -[TSKChangeNotifier p_addObserver:forChangeSource:isClass:](self, "p_addObserver:forChangeSource:isClass:", a3, a4, 0);
}

- (void)p_removeObserver:(id)a3 forChangeSource:(id)a4 isClass:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v9;
  const __CFDictionary *v10;
  void *Value;
  id v12;
  id v13;

  v5 = a5;
  objc_sync_enter(self);
  if (self->mProcessingChanges)
  {
    -[TSKChangeNotifier p_queueObserverListChange:](self, "p_queueObserverListChange:", +[TSKQueuedObserverSet queuedObserverSetWithChangeType:observer:changeSource:isClass:](TSKQueuedObserverSet, "queuedObserverSetWithChangeType:observer:changeSource:isClass:", 1, a3, a4, v5));
  }
  else
  {
    v9 = 8;
    if (v5)
      v9 = 16;
    v10 = *(Class *)((char *)&self->super.isa + v9);
    Value = (void *)CFDictionaryGetValue(v10, a4);
    if (Value)
    {
      v12 = -[TSKChangeNotifier p_findCountedObserverForObserver:inArray:](self, "p_findCountedObserverForObserver:inArray:", a3, Value);
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "decrementCount"))
        objc_msgSend(Value, "removeObject:", v13);
      if (!objc_msgSend(Value, "count"))
        CFDictionaryRemoveValue(v10, a4);
    }
  }
  objc_sync_exit(self);
}

- (void)removeObserver:(id)a3 forChangeSource:(id)a4
{
  -[TSKChangeNotifier p_removeObserver:forChangeSource:isClass:](self, "p_removeObserver:forChangeSource:isClass:", a3, a4, 0);
}

- (void)addObserver:(id)a3 forChangeSourceOfClass:(Class)a4
{
  -[TSKChangeNotifier p_addObserver:forChangeSource:isClass:](self, "p_addObserver:forChangeSource:isClass:", a3, a4, 1);
}

- (void)removeObserver:(id)a3 forChangeSourceOfClass:(Class)a4
{
  -[TSKChangeNotifier p_removeObserver:forChangeSource:isClass:](self, "p_removeObserver:forChangeSource:isClass:", a3, a4, 1);
}

- (void)p_updateObserverList
{
  __CFArray *mQueuedObserverListChanges;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_sync_enter(self);
  if (!self->mProcessingChanges)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    mQueuedObserverListChanges = self->mQueuedObserverListChanges;
    v4 = -[__CFArray countByEnumeratingWithState:objects:count:](mQueuedObserverListChanges, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v12 != v5)
            objc_enumerationMutation(mQueuedObserverListChanges);
          v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
          v8 = *(_QWORD *)(v7 + 16);
          v9 = *(_QWORD *)(v7 + 24);
          v10 = *(unsigned __int8 *)(v7 + 32) != 0;
          if (*(_DWORD *)(v7 + 8))
            -[TSKChangeNotifier p_removeObserver:forChangeSource:isClass:](self, "p_removeObserver:forChangeSource:isClass:", v8, v9, v10);
          else
            -[TSKChangeNotifier p_addObserver:forChangeSource:isClass:](self, "p_addObserver:forChangeSource:isClass:", v8, v9, v10);
        }
        v4 = -[__CFArray countByEnumeratingWithState:objects:count:](mQueuedObserverListChanges, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v4);
    }
    CFArrayRemoveAllValues(self->mQueuedObserverListChanges);
  }
  objc_sync_exit(self);
}

- (void)syncProcessChanges:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const void *v8;
  void *Value;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  const void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  __CFDictionary *mChangeSourceOfClassObservers;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = (id)objc_msgSend((id)objc_msgSend(a3, "changesArray"), "copy");
  objc_sync_enter(self);
  ++self->mProcessingChanges;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v5)
  {
    v24 = *(_QWORD *)v42;
    do
    {
      v6 = 0;
      v22 = v5;
      do
      {
        if (*(_QWORD *)v42 != v24)
          objc_enumerationMutation(obj);
        v25 = v6;
        v7 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v6);
        v8 = (const void *)objc_msgSend(v7, "changeSource");
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        Value = (void *)CFDictionaryGetValue(self->mChangeSourceObservers, v8);
        v10 = objc_msgSend(Value, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v38;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v38 != v11)
                objc_enumerationMutation(Value);
              v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "observer");
              if (!-[TSKChangeNotifier p_pendingAddOrRemoveOfObserver:forChangeSource:](self, "p_pendingAddOrRemoveOfObserver:forChangeSource:", v13, v8)&& (objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v13, "syncProcessChanges:forChangeSource:", objc_msgSend(v7, "changes"), v8);
              }
            }
            v10 = objc_msgSend(Value, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
          }
          while (v10);
        }
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        mChangeSourceOfClassObservers = self->mChangeSourceOfClassObservers;
        v14 = -[__CFDictionary countByEnumeratingWithState:objects:count:](mChangeSourceOfClassObservers, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
        if (v14)
        {
          v27 = *(_QWORD *)v34;
          do
          {
            v15 = 0;
            v28 = v14;
            do
            {
              if (*(_QWORD *)v34 != v27)
                objc_enumerationMutation(mChangeSourceOfClassObservers);
              v16 = *(const void **)(*((_QWORD *)&v33 + 1) + 8 * v15);
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v31 = 0u;
                v32 = 0u;
                v29 = 0u;
                v30 = 0u;
                v17 = (void *)CFDictionaryGetValue(self->mChangeSourceOfClassObservers, v16);
                v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
                if (v18)
                {
                  v19 = *(_QWORD *)v30;
                  do
                  {
                    for (j = 0; j != v18; ++j)
                    {
                      if (*(_QWORD *)v30 != v19)
                        objc_enumerationMutation(v17);
                      v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "observer");
                      if (!-[TSKChangeNotifier p_pendingAddOrRemoveOfObserver:forChangeSource:](self, "p_pendingAddOrRemoveOfObserver:forChangeSource:", v21, v8)&& (objc_opt_respondsToSelector() & 1) != 0)
                      {
                        objc_msgSend(v21, "syncProcessChanges:forChangeSource:", objc_msgSend(v7, "changes"), v8);
                      }
                    }
                    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
                  }
                  while (v18);
                }
              }
              ++v15;
            }
            while (v15 != v28);
            v14 = -[__CFDictionary countByEnumeratingWithState:objects:count:](mChangeSourceOfClassObservers, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
          }
          while (v14);
        }
        v6 = v25 + 1;
      }
      while (v25 + 1 != v22);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v5);
  }
  --self->mProcessingChanges;
  -[TSKChangeNotifier p_updateObserverList](self, "p_updateObserverList");
  objc_sync_exit(self);
}

- (void)asyncProcessChanges:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const void *v8;
  void *Value;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  const void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  __CFDictionary *mChangeSourceOfClassObservers;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(a3, "changesArray");
  objc_sync_enter(self);
  ++self->mProcessingChanges;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v5)
  {
    v24 = *(_QWORD *)v42;
    do
    {
      v6 = 0;
      v22 = v5;
      do
      {
        if (*(_QWORD *)v42 != v24)
          objc_enumerationMutation(obj);
        v25 = v6;
        v7 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v6);
        v8 = (const void *)objc_msgSend(v7, "changeSource");
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        Value = (void *)CFDictionaryGetValue(self->mChangeSourceObservers, v8);
        v10 = objc_msgSend(Value, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v38;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v38 != v11)
                objc_enumerationMutation(Value);
              v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "observer");
              if (!-[TSKChangeNotifier p_pendingAddOrRemoveOfObserver:forChangeSource:](self, "p_pendingAddOrRemoveOfObserver:forChangeSource:", v13, v8)&& (objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v13, "asyncProcessChanges:forChangeSource:", objc_msgSend(v7, "changes"), v8);
              }
            }
            v10 = objc_msgSend(Value, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
          }
          while (v10);
        }
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        mChangeSourceOfClassObservers = self->mChangeSourceOfClassObservers;
        v14 = -[__CFDictionary countByEnumeratingWithState:objects:count:](mChangeSourceOfClassObservers, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
        if (v14)
        {
          v27 = *(_QWORD *)v34;
          do
          {
            v15 = 0;
            v28 = v14;
            do
            {
              if (*(_QWORD *)v34 != v27)
                objc_enumerationMutation(mChangeSourceOfClassObservers);
              v16 = *(const void **)(*((_QWORD *)&v33 + 1) + 8 * v15);
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v31 = 0u;
                v32 = 0u;
                v29 = 0u;
                v30 = 0u;
                v17 = (void *)CFDictionaryGetValue(self->mChangeSourceOfClassObservers, v16);
                v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
                if (v18)
                {
                  v19 = *(_QWORD *)v30;
                  do
                  {
                    for (j = 0; j != v18; ++j)
                    {
                      if (*(_QWORD *)v30 != v19)
                        objc_enumerationMutation(v17);
                      v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "observer");
                      if (!-[TSKChangeNotifier p_pendingAddOrRemoveOfObserver:forChangeSource:](self, "p_pendingAddOrRemoveOfObserver:forChangeSource:", v21, v8)&& (objc_opt_respondsToSelector() & 1) != 0)
                      {
                        objc_msgSend(v21, "asyncProcessChanges:forChangeSource:", objc_msgSend(v7, "changes"), v8);
                      }
                    }
                    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
                  }
                  while (v18);
                }
              }
              ++v15;
            }
            while (v15 != v28);
            v14 = -[__CFDictionary countByEnumeratingWithState:objects:count:](mChangeSourceOfClassObservers, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
          }
          while (v14);
        }
        v6 = v25 + 1;
      }
      while (v25 + 1 != v22);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v5);
  }
  --self->mProcessingChanges;
  -[TSKChangeNotifier p_updateObserverList](self, "p_updateObserverList");
  objc_sync_exit(self);
}

@end
