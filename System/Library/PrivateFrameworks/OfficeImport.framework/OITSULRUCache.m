@implementation OITSULRUCache

- (OITSULRUCache)initWithMaxSize:(unint64_t)a3
{
  OITSULRUCache *v4;
  OITSULRUCache *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OITSULRUCache;
  v4 = -[OITSULRUCache init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->mMax = a3;
    v4->mData = -[OITSUNoCopyDictionary initWithCapacity:]([OITSUNoCopyDictionary alloc], "initWithCapacity:", a3);
    v5->mOrderedKeys = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", a3);
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  if (self->mCallbackTarget || self->mCallback)
  {
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSULRUCache dealloc]");
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSULRUCache.m"), 49, 0, "cache callback target and selector must be clear before cache is deallocated");
    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }

  v4.receiver = self;
  v4.super_class = (Class)OITSULRUCache;
  -[OITSULRUCache dealloc](&v4, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OITSULRUCache;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@ ordered keys: %@, data: %@>"), -[OITSULRUCache description](&v3, sel_description), self->mOrderedKeys, self->mData);
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->mOrderedKeys, "count");
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;

  v6 = a3;
  v7 = a4;
  if (-[NSMutableArray count](self->mOrderedKeys, "count") >= self->mMax)
    -[OITSULRUCache p_removeOldestObject](self, "p_removeOldestObject");
  v8 = -[NSMutableArray indexOfObject:](self->mOrderedKeys, "indexOfObject:", a4);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray removeObjectAtIndex:](self->mOrderedKeys, "removeObjectAtIndex:", v8);
  -[OITSUNoCopyDictionary setObject:forKey:](self->mData, "setObject:forKey:", a3, a4);
  -[NSMutableArray addObject:](self->mOrderedKeys, "addObject:", a4);

}

- (void)removeObjectForKey:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = -[NSMutableArray indexOfObject:](self->mOrderedKeys, "indexOfObject:");
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5;
    -[OITSUNoCopyDictionary removeObjectForKey:](self->mData, "removeObjectForKey:", a3);
    -[NSMutableArray removeObjectAtIndex:](self->mOrderedKeys, "removeObjectAtIndex:", v6);
  }
}

- (void)removeAllObjects
{
  -[NSMutableArray removeAllObjects](self->mOrderedKeys, "removeAllObjects");
  -[OITSUNoCopyDictionary removeAllObjects](self->mData, "removeAllObjects");
}

- (id)objectForKey:(id)a3
{
  uint64_t v5;
  uint64_t v7;
  id v8;
  id v9;

  v5 = -[NSMutableArray indexOfObject:](self->mOrderedKeys, "indexOfObject:");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v7 = v5;
  v8 = -[OITSUNoCopyDictionary objectForKey:](self->mData, "objectForKey:", a3);
  v9 = a3;
  -[NSMutableArray addObject:](self->mOrderedKeys, "addObject:", a3);
  -[NSMutableArray removeObjectAtIndex:](self->mOrderedKeys, "removeObjectAtIndex:", v7);

  return v8;
}

- (NSArray)allValues
{
  return (NSArray *)-[OITSUNoCopyDictionary allValues](self->mData, "allValues");
}

- (NSArray)allKeys
{
  return &self->mOrderedKeys->super;
}

- (void)setEvictionCallbackTarget:(id)a3 selector:(SEL)a4
{
  self->mCallbackTarget = a3;
  self->mCallback = a4;
}

- (void)clearEvictionCallbackTarget
{
  self->mCallbackTarget = 0;
  self->mCallback = 0;
}

- (void)p_removeOldestObject
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSMutableArray objectAtIndex:](self->mOrderedKeys, "objectAtIndex:", 0);
  if (self->mCallbackTarget)
  {
    if (!self->mCallback)
    {
      v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSULRUCache p_removeOldestObject]");
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSULRUCache.m"), 148, 0, "invalid nil value for '%{public}s'", "mCallback");
      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    }
    objc_msgSend(self->mCallbackTarget, "performSelector:withObject:withObject:", self->mCallback, -[OITSUNoCopyDictionary objectForKey:](self->mData, "objectForKey:", v3), v3);
  }
  -[OITSUNoCopyDictionary removeObjectForKey:](self->mData, "removeObjectForKey:", v3);
  -[NSMutableArray removeObjectAtIndex:](self->mOrderedKeys, "removeObjectAtIndex:", 0);
}

- (unint64_t)maxSize
{
  return self->mMax;
}

@end
