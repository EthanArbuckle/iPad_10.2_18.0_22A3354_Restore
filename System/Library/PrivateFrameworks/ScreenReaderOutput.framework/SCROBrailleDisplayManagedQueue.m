@implementation SCROBrailleDisplayManagedQueue

- (SCROBrailleDisplayManagedQueue)init
{
  SCROBrailleDisplayManagedQueue *v2;
  SCRCIndexMap *v3;
  SCRCIndexMap *stateQueueMap;
  SCRCIndexMap *v5;
  SCRCIndexMap *tokenDisplayMap;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCROBrailleDisplayManagedQueue;
  v2 = -[SCROBrailleDisplayManagedQueue init](&v8, sel_init);
  if (v2)
  {
    v2->_displayQueueDict = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, 0);
    v2->_queueStateDict = CFDictionaryCreateMutable(0, 0, 0, 0);
    v3 = (SCRCIndexMap *)objc_alloc_init(MEMORY[0x24BE843B0]);
    stateQueueMap = v2->_stateQueueMap;
    v2->_stateQueueMap = v3;

    v5 = (SCRCIndexMap *)objc_alloc_init(MEMORY[0x24BE843B0]);
    tokenDisplayMap = v2->_tokenDisplayMap;
    v2->_tokenDisplayMap = v5;

    v2->_maxActiveQueueSize = 1;
  }
  return v2;
}

- (void)dealloc
{
  __CFDictionary *displayQueueDict;
  __CFDictionary *queueStateDict;
  objc_super v5;

  displayQueueDict = self->_displayQueueDict;
  if (displayQueueDict)
    CFRelease(displayQueueDict);
  queueStateDict = self->_queueStateDict;
  if (queueStateDict)
    CFRelease(queueStateDict);
  v5.receiver = self;
  v5.super_class = (Class)SCROBrailleDisplayManagedQueue;
  -[SCROBrailleDisplayManagedQueue dealloc](&v5, sel_dealloc);
}

- (id)_queueForState:(int)a3 createQueue:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v6;
  id v7;
  BOOL v8;
  __CFDictionary *queueStateDict;

  v4 = a4;
  v6 = a3;
  -[SCRCIndexMap objectForIndex:](self->_stateQueueMap, "objectForIndex:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = 1;
  else
    v8 = !v4;
  if (!v8)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[SCRCIndexMap setObject:forIndex:](self->_stateQueueMap, "setObject:forIndex:", v7, v6);
    queueStateDict = self->_queueStateDict;
    if (queueStateDict)
      CFDictionarySetValue(queueStateDict, v7, (const void *)v6);
  }
  return v7;
}

- (void)addDisplay:(id)a3 withState:(int)a4
{
  uint64_t v4;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFDictionary *v11;
  void *v12;
  __CFDictionary *displayQueueDict;
  id key;

  v4 = *(_QWORD *)&a4;
  key = a3;
  v6 = objc_msgSend(key, "token");
  v7 = key;
  if (key)
  {
    if (v4 <= 4)
    {
      v8 = v6;
      -[SCRCIndexMap objectForIndex:](self->_tokenDisplayMap, "objectForIndex:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = key;
      if (!v9)
      {
        -[SCROBrailleDisplayManagedQueue _queueForState:createQueue:](self, "_queueForState:createQueue:", v4, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          -[SCRCIndexMap setObject:forIndex:](self->_tokenDisplayMap, "setObject:forIndex:", key, v8);
          if ((_DWORD)v4 == 1)
          {
            if (objc_msgSend(v10, "count") >= self->_maxActiveQueueSize)
            {
              -[SCROBrailleDisplayManagedQueue _queueForState:createQueue:](self, "_queueForState:createQueue:", 2, 1);
              v12 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v12, "addObject:", key);
              v10 = v12;
            }
            else
            {
              objc_msgSend(v10, "addObject:", key);
            }
            displayQueueDict = self->_displayQueueDict;
            if (displayQueueDict)
              CFDictionarySetValue(displayQueueDict, key, v10);
          }
          else
          {
            objc_msgSend(v10, "addObject:", key);
            v11 = self->_displayQueueDict;
            if (v11)
              CFDictionarySetValue(v11, key, v10);
            if ((_DWORD)v4 == 2)
              -[SCROBrailleDisplayManagedQueue _fillActiveBrailleDisplayQueue](self, "_fillActiveBrailleDisplayQueue");
          }
        }

        v7 = key;
      }
    }
  }

}

- (void)removeDisplay:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFDictionary *displayQueueDict;
  void *v8;
  __CFDictionary *queueStateDict;
  __CFDictionary **p_queueStateDict;
  unsigned int Value;
  __CFDictionary *v12;
  void *key;

  v4 = a3;
  if (v4)
  {
    key = v4;
    v5 = (int)objc_msgSend(v4, "token");
    -[SCRCIndexMap objectForIndex:](self->_tokenDisplayMap, "objectForIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == key)
    {
      displayQueueDict = self->_displayQueueDict;
      if (displayQueueDict)
      {
        v8 = (id)CFDictionaryGetValue(displayQueueDict, key);
        p_queueStateDict = &self->_queueStateDict;
        queueStateDict = self->_queueStateDict;
        Value = 5;
        if (queueStateDict && v8)
          Value = CFDictionaryGetValue(queueStateDict, v8);
      }
      else
      {
        v8 = 0;
        p_queueStateDict = &self->_queueStateDict;
        Value = 5;
      }
      -[SCRCIndexMap removeObjectForIndex:](self->_tokenDisplayMap, "removeObjectForIndex:", v5);
      objc_msgSend(v8, "removeObjectIdenticalTo:", key);
      v12 = self->_displayQueueDict;
      if (v12)
        CFDictionaryRemoveValue(v12, key);
      if (!objc_msgSend(v8, "count"))
      {
        if (*p_queueStateDict)
          CFDictionaryRemoveValue(*p_queueStateDict, v8);
        -[SCRCIndexMap removeObjectForIndex:](self->_stateQueueMap, "removeObjectForIndex:", Value);
      }
      if (Value == 1)
        -[SCROBrailleDisplayManagedQueue _fillActiveBrailleDisplayQueue](self, "_fillActiveBrailleDisplayQueue");

    }
    v4 = key;
  }

}

- (void)_fillActiveBrailleDisplayQueue
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t maxActiveQueueSize;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;
  __CFDictionary *queueStateDict;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[SCROBrailleDisplayManagedQueue _queueForState:createQueue:](self, "_queueForState:createQueue:", 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = v4;
    -[SCROBrailleDisplayManagedQueue _queueForState:createQueue:](self, "_queueForState:createQueue:", 1, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v6, "count");
      maxActiveQueueSize = self->_maxActiveQueueSize;
      v10 = maxActiveQueueSize > v8;
      v11 = maxActiveQueueSize - v8;
      if (v10)
      {
        if (v11 >= v5)
          v12 = v5;
        else
          v12 = v11;
        objc_msgSend(v3, "subarrayWithRange:", 0, v12);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObjectsFromArray:", v18);
        objc_msgSend(v3, "removeObjectsInRange:", 0, v12);
        if (!objc_msgSend(v3, "count"))
        {
          queueStateDict = self->_queueStateDict;
          if (queueStateDict)
            CFDictionaryRemoveValue(queueStateDict, v3);
          -[SCRCIndexMap removeObjectForIndex:](self->_stateQueueMap, "removeObjectForIndex:", 2);
        }
        if (self->_displayQueueDict)
        {
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          v18 = v18;
          v14 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v20;
            do
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v20 != v16)
                  objc_enumerationMutation(v18);
                CFDictionarySetValue(self->_displayQueueDict, *(const void **)(*((_QWORD *)&v19 + 1) + 8 * v17++), v7);
              }
              while (v15 != v17);
              v15 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
            }
            while (v15);
          }

        }
      }
      else
      {
        v18 = 0;
      }

    }
  }

}

- (void)setState:(int)a3 forDisplay:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  __CFDictionary *displayQueueDict;
  void *v9;
  __CFDictionary *queueStateDict;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  __CFDictionary *v15;
  _DWORD v16[2];
  __int16 v17;
  id v18;
  uint64_t v19;

  v4 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _SCROD_LOG();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109378;
    v16[1] = v4;
    v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_2115BB000, v7, OS_LOG_TYPE_DEFAULT, "Set state: %d for display %{public}@", (uint8_t *)v16, 0x12u);
  }

  if (v4 <= 4 && v6)
  {
    displayQueueDict = self->_displayQueueDict;
    if (displayQueueDict)
    {
      v9 = (id)CFDictionaryGetValue(displayQueueDict, v6);
      if (v9)
      {
        queueStateDict = self->_queueStateDict;
        v11 = queueStateDict ? CFDictionaryGetValue(queueStateDict, v9) : 5;
        if (v11 != (_DWORD)v4)
        {
          -[SCROBrailleDisplayManagedQueue _queueForState:createQueue:](self, "_queueForState:createQueue:", v4, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = v12;
            if ((_DWORD)v4 == 1 && objc_msgSend(v12, "count") >= self->_maxActiveQueueSize)
            {
              -[SCROBrailleDisplayManagedQueue _queueForState:createQueue:](self, "_queueForState:createQueue:", 2, 1);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v14, "addObject:", v6);
              v13 = v14;
            }
            else
            {
              objc_msgSend(v13, "addObject:", v6);
            }
            v15 = self->_displayQueueDict;
            if (v15)
              CFDictionarySetValue(v15, v6, v13);
            objc_msgSend(v9, "removeObjectIdenticalTo:", v6);

          }
        }
      }
    }
    else
    {
      v9 = 0;
    }

  }
}

- (int)stateForDisplay:(id)a3
{
  id v4;
  __CFDictionary *displayQueueDict;
  void *v6;
  __CFDictionary *queueStateDict;
  int Value;

  v4 = a3;
  displayQueueDict = self->_displayQueueDict;
  if (!displayQueueDict)
  {
    v6 = 0;
LABEL_6:
    Value = 5;
    goto LABEL_7;
  }
  v6 = (id)CFDictionaryGetValue(displayQueueDict, v4);
  if (!v6)
    goto LABEL_6;
  queueStateDict = self->_queueStateDict;
  if (!queueStateDict)
    goto LABEL_6;
  Value = CFDictionaryGetValue(queueStateDict, v6);
LABEL_7:

  return Value;
}

- (id)displayForToken:(int)a3
{
  return (id)-[SCRCIndexMap objectForIndex:](self->_tokenDisplayMap, "objectForIndex:", a3);
}

- (unint64_t)displayCountIncludingDisconnectedDisplays:(BOOL)a3
{
  __CFDictionary *displayQueueDict;
  CFIndex Count;
  void *v7;

  displayQueueDict = self->_displayQueueDict;
  if (!displayQueueDict)
    return 0;
  Count = CFDictionaryGetCount(displayQueueDict);
  if (!a3)
  {
    -[SCROBrailleDisplayManagedQueue disconnectedDisplays](self, "disconnectedDisplays");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    Count -= objc_msgSend(v7, "count");

  }
  return Count;
}

- (id)primaryDisplay
{
  void *v2;
  void *v3;

  -[SCRCIndexMap objectForIndex:](self->_stateQueueMap, "objectForIndex:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setPrimaryDisplay:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SCROBrailleDisplayManagedQueue _queueForState:createQueue:](self, "_queueForState:createQueue:", 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_msgSend(v4, "indexOfObjectIdenticalTo:", v8);
    if (v5)
    {
      v6 = v5;
      if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v4, "objectAtIndex:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "insertObject:atIndex:", v7, 0);
        objc_msgSend(v4, "removeObjectAtIndex:", v6 + 1);

      }
    }
  }

}

- (unint64_t)activeQueueMaximumSize
{
  return self->_maxActiveQueueSize;
}

- (void)setActiveQueueMaximumSize:(unint64_t)a3
{
  unint64_t maxActiveQueueSize;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;

  maxActiveQueueSize = self->_maxActiveQueueSize;
  self->_maxActiveQueueSize = a3;
  if (maxActiveQueueSize >= a3)
  {
    if (maxActiveQueueSize > a3)
    {
      -[SCROBrailleDisplayManagedQueue _queueForState:createQueue:](self, "_queueForState:createQueue:", 1, 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v12, "count");
      if (v5 > self->_maxActiveQueueSize)
      {
        v6 = v5;
        -[SCROBrailleDisplayManagedQueue _queueForState:createQueue:](self, "_queueForState:createQueue:", 2, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = self->_maxActiveQueueSize;
        if (v9)
          v10 = v9 - 1;
        else
          v10 = 0;
        v11 = v6 - v9;
        objc_msgSend(v7, "replaceObjectsInRange:withObjectsFromArray:range:", 0, 0, v12, v10, v11);
        objc_msgSend(v12, "removeObjectsInRange:", v10, v11);

      }
    }
  }
  else
  {
    -[SCROBrailleDisplayManagedQueue _fillActiveBrailleDisplayQueue](self, "_fillActiveBrailleDisplayQueue");
  }
}

- (id)activeDisplays
{
  return -[SCROBrailleDisplayManagedQueue _queueForState:createQueue:](self, "_queueForState:createQueue:", 1, 0);
}

- (id)activePendingDisplays
{
  return -[SCROBrailleDisplayManagedQueue _queueForState:createQueue:](self, "_queueForState:createQueue:", 2, 0);
}

- (id)sleepingDisplays
{
  return -[SCROBrailleDisplayManagedQueue _queueForState:createQueue:](self, "_queueForState:createQueue:", 3, 0);
}

- (id)disconnectedDisplays
{
  return -[SCROBrailleDisplayManagedQueue _queueForState:createQueue:](self, "_queueForState:createQueue:", 0, 0);
}

- (id)loadingDisplays
{
  return -[SCROBrailleDisplayManagedQueue _queueForState:createQueue:](self, "_queueForState:createQueue:", 4, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenDisplayMap, 0);
  objc_storeStrong((id *)&self->_stateQueueMap, 0);
}

@end
