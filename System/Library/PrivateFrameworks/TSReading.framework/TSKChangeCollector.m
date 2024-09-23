@implementation TSKChangeCollector

+ (id)_singletonAlloc
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSKChangeCollector;
  return objc_msgSendSuper2(&v3, sel_allocWithZone_, 0);
}

+ (id)threadCollector
{
  id result;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  result = (id)threadCollector_sSingletonInstance;
  if (!threadCollector_sSingletonInstance)
  {
    objc_sync_enter(a1);
    if (!threadCollector_sSingletonInstance)
    {
      v4 = objc_msgSend((id)objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      threadCollector_sSingletonInstance = v4;
      if (!v4)
      {
        v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSKChangeCollector threadCollector]");
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKChangeCollector.m"), 17, CFSTR("Couldn't create singleton instance of %@"), a1);
      }
    }
    objc_sync_exit(a1);
    return (id)threadCollector_sSingletonInstance;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSKChangeCollector allocWithZone:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKChangeCollector.m"), 17, CFSTR("Don't alloc a singleton"));
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (void)beginCollectingChanges
{
  id v2;

  v2 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"), "threadDictionary"), "objectForKey:", CFSTR("__TSKChangeCollectorTLSKey"));
  if (!v2)
  {
    v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"), "threadDictionary"), "setObject:forKey:", v2, CFSTR("__TSKChangeCollectorTLSKey"));
  }
  objc_msgSend(v2, "addObject:", objc_alloc_init(TSKChangeGroup));
}

- (id)endCollectingChanges
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"), "threadDictionary"), "objectForKey:", CFSTR("__TSKChangeCollectorTLSKey"));
  if (!objc_msgSend(v2, "count"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKChangeCollector endCollectingChanges]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKChangeCollector.m"), 34, CFSTR("Trying to endCollectingChanges without beginning (or calls have gotten out of sync)"));
  }
  v5 = (id)objc_msgSend(v2, "lastObject");
  objc_msgSend(v2, "removeLastObject");
  return v5;
}

- (id)peekCollectedChanges
{
  void *v2;
  id result;

  v2 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"), "threadDictionary"), "objectForKey:", CFSTR("__TSKChangeCollectorTLSKey"));
  result = (id)objc_msgSend(v2, "count");
  if (result)
    return (id)objc_msgSend((id)objc_msgSend(v2, "lastObject"), "copy");
  return result;
}

- (void)registerChange:(int)a3 details:(id)a4 forChangeSource:(id)a5
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v7 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread", 0), "threadDictionary"), "objectForKey:", CFSTR("__TSKChangeCollectorTLSKey"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "registerChange:details:forChangeSource:", v7, a4, a5);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }
}

@end
