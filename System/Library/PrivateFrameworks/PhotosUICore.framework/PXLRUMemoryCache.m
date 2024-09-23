@implementation PXLRUMemoryCache

- (PXLRUMemoryCache)init
{
  PXLRUMemoryCache *v2;
  PXLRUMemoryCache *v3;
  _PXLRUMemoryCacheList *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXLRUMemoryCache;
  v2 = -[PXLRUMemoryCache init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_numberOfSlots = 128;
    v2->_cacheDictionary = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 128);
    v3->_recursiveLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    v4 = (_PXLRUMemoryCacheList *)malloc_type_malloc(0x18uLL, 0x102004023CB03E4uLL);
    v3->_leastRecentUsedList = v4;
    v4->var0 = 0;
    v4->var1 = 0;
    v3->_leastRecentUsedList->var2 = 0;
    v3->_leastRecentUsedDictionary = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 128);
  }
  return v3;
}

- (void)dealloc
{
  NSRecursiveLock *recursiveLock;
  NSMapTable *cacheDictionary;
  _PXLRUMemoryCacheList *leastRecentUsedList;
  _PXLRUMemoryCacheListElement *var1;
  _PXLRUMemoryCacheListElement *v7;
  _PXLRUMemoryCacheList *v8;
  NSMapTable *leastRecentUsedDictionary;
  objc_super v10;

  recursiveLock = self->_recursiveLock;
  if (recursiveLock)
  {

    self->_recursiveLock = 0;
  }
  cacheDictionary = self->_cacheDictionary;
  if (cacheDictionary)
  {

    self->_cacheDictionary = 0;
  }
  leastRecentUsedList = self->_leastRecentUsedList;
  var1 = leastRecentUsedList->var1;
  if (var1)
  {
    do
    {
      v7 = var1->var1;
      if (var1->var0)

      free(var1);
      var1 = v7;
    }
    while (v7);
    leastRecentUsedList = self->_leastRecentUsedList;
  }
  leastRecentUsedList->var0 = 0;
  leastRecentUsedList->var1 = 0;
  self->_leastRecentUsedList->var2 = 0;
  v8 = self->_leastRecentUsedList;
  if (v8)
  {
    free(v8);
    self->_leastRecentUsedList = 0;
  }
  leastRecentUsedDictionary = self->_leastRecentUsedDictionary;
  if (leastRecentUsedDictionary)
  {

    self->_leastRecentUsedDictionary = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)PXLRUMemoryCache;
  -[PXLRUMemoryCache dealloc](&v10, sel_dealloc);
}

- (void)_promoteListElement:(_PXLRUMemoryCacheListElement *)a3
{
  _PXLRUMemoryCacheList *leastRecentUsedList;
  _PXLRUMemoryCacheListElement *var2;
  _PXLRUMemoryCacheListElement *var1;
  _PXLRUMemoryCacheList *v6;
  _PXLRUMemoryCacheListElement *v7;

  leastRecentUsedList = self->_leastRecentUsedList;
  if (leastRecentUsedList->var0 < 2)
    return;
  var1 = a3->var1;
  var2 = a3->var2;
  if (!var2)
  {
    leastRecentUsedList->var1 = var1;
    if (var1)
      goto LABEL_5;
    goto LABEL_4;
  }
  var2->var1 = var1;
  var1 = a3->var1;
  if (!var1)
LABEL_4:
    var1 = (_PXLRUMemoryCacheListElement *)self->_leastRecentUsedList;
LABEL_5:
  var1->var2 = var2;
  a3->var1 = self->_leastRecentUsedList->var1;
  a3->var2 = 0;
  v6 = self->_leastRecentUsedList;
  v7 = v6->var1;
  if (v7)
  {
    v7->var2 = a3;
    v6 = self->_leastRecentUsedList;
  }
  v6->var1 = a3;
}

- (void)_removeListElement:(_PXLRUMemoryCacheListElement *)a3
{
  _PXLRUMemoryCacheListElement *var2;
  _PXLRUMemoryCacheListElement *var1;
  _PXLRUMemoryCacheList *leastRecentUsedList;
  _PXLRUMemoryCacheListElement *v8;
  _PXLRUMemoryCacheList *v9;

  var1 = a3->var1;
  var2 = a3->var2;
  if (var2)
  {
    var2->var1 = var1;
    leastRecentUsedList = self->_leastRecentUsedList;
    if (leastRecentUsedList->var1 == a3)
      leastRecentUsedList->var1 = 0;
  }
  else
  {
    self->_leastRecentUsedList->var1 = var1;
  }
  v8 = a3->var1;
  if (v8)
  {
    v8->var2 = var2;
    v9 = self->_leastRecentUsedList;
    if (v9->var2 == a3)
      v9->var2 = 0;
  }
  else
  {
    self->_leastRecentUsedList->var2 = var2;
  }
  -[NSMapTable removeObjectForKey:](self->_leastRecentUsedDictionary, "removeObjectForKey:", a3->var0);
  if (a3->var0)

  free(a3);
  --self->_leastRecentUsedList->var0;
}

- (void)setNumberOfSlots:(unint64_t)a3
{
  _PXLRUMemoryCacheList *leastRecentUsedList;
  _PXLRUMemoryCacheListElement *var2;

  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  if (self->_numberOfSlots > a3)
  {
LABEL_2:
    leastRecentUsedList = self->_leastRecentUsedList;
    while (leastRecentUsedList->var0 > a3)
    {
      var2 = leastRecentUsedList->var2;
      if (var2)
      {
        -[NSMapTable removeObjectForKey:](self->_cacheDictionary, "removeObjectForKey:", var2->var0);
        -[PXLRUMemoryCache _removeListElement:](self, "_removeListElement:", self->_leastRecentUsedList->var2);
        goto LABEL_2;
      }
    }
  }
  self->_numberOfSlots = a3;
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
}

- (unint64_t)currentUsedSlots
{
  NSRecursiveLock *recursiveLock;
  unint64_t var0;

  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  recursiveLock = self->_recursiveLock;
  var0 = self->_leastRecentUsedList->var0;
  -[NSRecursiveLock unlock](recursiveLock, "unlock");
  return var0;
}

- (id)objectForKey:(id)a3
{
  id v5;
  id v6;

  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  v5 = -[NSMapTable objectForKey:](self->_cacheDictionary, "objectForKey:", a3);
  if (v5)
  {
    v6 = -[NSMapTable objectForKey:](self->_leastRecentUsedDictionary, "objectForKey:", a3);
    if (v6)
      -[PXLRUMemoryCache _promoteListElement:](self, "_promoteListElement:", objc_msgSend(v6, "pointerValue"));
  }
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
  return v5;
}

- (id)allKeys
{
  NSMapTable *cacheDictionary;
  void *v4;

  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  cacheDictionary = self->_cacheDictionary;
  if (cacheDictionary)
    v4 = (void *)-[NSArray copy](NSAllMapTableKeys(cacheDictionary), "copy");
  else
    v4 = 0;
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
  return v4;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v7;
  _PXLRUMemoryCacheListElement *v8;
  id v9;
  _PXLRUMemoryCacheListElement *var1;
  _PXLRUMemoryCacheList *leastRecentUsedList;
  _PXLRUMemoryCacheListElement *v12;
  _PXLRUMemoryCacheList *v13;
  _PXLRUMemoryCacheList *v15;
  _PXLRUMemoryCacheListElement *var2;

  if (self->_numberOfSlots)
  {
    -[NSRecursiveLock lock](self->_recursiveLock, "lock");
    v7 = -[NSMapTable objectForKey:](self->_leastRecentUsedDictionary, "objectForKey:", a4);
    if (v7)
    {
      -[PXLRUMemoryCache _promoteListElement:](self, "_promoteListElement:", objc_msgSend(v7, "pointerValue"));
    }
    else
    {
      v8 = (_PXLRUMemoryCacheListElement *)malloc_type_malloc(0x18uLL, 0xA00409BE6959DuLL);
      v9 = a4;
      var1 = self->_leastRecentUsedList->var1;
      v8->var0 = v9;
      v8->var1 = var1;
      v8->var2 = 0;
      leastRecentUsedList = self->_leastRecentUsedList;
      v12 = leastRecentUsedList->var1;
      if (v12)
      {
        v12->var2 = v8;
        leastRecentUsedList = self->_leastRecentUsedList;
      }
      leastRecentUsedList->var1 = v8;
      v13 = self->_leastRecentUsedList;
      if (!v13->var0++)
        v13->var2 = v8;
      -[NSMapTable setObject:forKey:](self->_leastRecentUsedDictionary, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v8), a4);
    }
    v15 = self->_leastRecentUsedList;
    if (v15->var0 > self->_numberOfSlots)
    {
      var2 = v15->var2;
      if (var2)
      {
        -[NSMapTable removeObjectForKey:](self->_cacheDictionary, "removeObjectForKey:", var2->var0);
        -[PXLRUMemoryCache _removeListElement:](self, "_removeListElement:", self->_leastRecentUsedList->var2);
      }
    }
    -[NSMapTable setObject:forKey:](self->_cacheDictionary, "setObject:forKey:", a3, a4);
    -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
  }
}

- (void)removeObjectForKey:(id)a3
{
  id v5;

  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  v5 = -[NSMapTable objectForKey:](self->_leastRecentUsedDictionary, "objectForKey:", a3);
  if (v5)
    -[PXLRUMemoryCache _removeListElement:](self, "_removeListElement:", objc_msgSend(v5, "pointerValue"));
  -[NSMapTable removeObjectForKey:](self->_cacheDictionary, "removeObjectForKey:", a3);
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
}

- (void)removeAllObjects
{
  _PXLRUMemoryCacheList *leastRecentUsedList;
  _PXLRUMemoryCacheListElement *var1;
  _PXLRUMemoryCacheListElement *v5;

  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  -[NSMapTable removeAllObjects](self->_leastRecentUsedDictionary, "removeAllObjects");
  leastRecentUsedList = self->_leastRecentUsedList;
  var1 = leastRecentUsedList->var1;
  if (var1)
  {
    do
    {
      v5 = var1->var1;
      if (var1->var0)

      free(var1);
      var1 = v5;
    }
    while (v5);
    leastRecentUsedList = self->_leastRecentUsedList;
  }
  leastRecentUsedList->var0 = 0;
  leastRecentUsedList->var1 = 0;
  self->_leastRecentUsedList->var2 = 0;
  -[NSMapTable removeAllObjects](self->_cacheDictionary, "removeAllObjects");
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
}

- (void)evictSlots:(unint64_t)a3
{
  _PXLRUMemoryCacheListElement *var2;

  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  for (; a3; --a3)
  {
    var2 = self->_leastRecentUsedList->var2;
    if (var2)
    {
      -[NSMapTable removeObjectForKey:](self->_cacheDictionary, "removeObjectForKey:", var2->var0);
      -[PXLRUMemoryCache _removeListElement:](self, "_removeListElement:", self->_leastRecentUsedList->var2);
    }
  }
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
}

- (id)description
{
  void *v3;

  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  v3 = (void *)-[NSMapTable description](self->_cacheDictionary, "description");
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
  return v3;
}

- (unint64_t)numberOfSlots
{
  return self->_numberOfSlots;
}

@end
