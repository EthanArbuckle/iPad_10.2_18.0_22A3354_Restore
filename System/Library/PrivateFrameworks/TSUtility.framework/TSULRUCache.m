@implementation TSULRUCache

- (TSULRUCache)initWithMaxSize:(unint64_t)a3
{
  TSULRUCache *v4;
  TSULRUCache *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSULRUCache;
  v4 = -[TSULRUCache init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->mMax = a3;
    v4->mData = -[TSUNoCopyDictionary initWithCapacity:]([TSUNoCopyDictionary alloc], "initWithCapacity:", a3);
    v5->mOrderedKeys = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", a3);
  }
  return v5;
}

- (void)dealloc
{
  id v3;
  uint64_t v4;
  objc_super v5;

  if (self->mCallbackTarget || self->mCallback)
  {
    v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSULRUCache dealloc]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSULRUCache.m"), 41, CFSTR("cache callback target and selector must be clear before cache is deallocated"));
  }

  v5.receiver = self;
  v5.super_class = (Class)TSULRUCache;
  -[TSULRUCache dealloc](&v5, sel_dealloc);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;

  v6 = a3;
  v7 = a4;
  if (-[NSMutableArray count](self->mOrderedKeys, "count") >= self->mMax)
    -[TSULRUCache p_removeOldestObject](self, "p_removeOldestObject");
  v8 = -[NSMutableArray indexOfObject:](self->mOrderedKeys, "indexOfObject:", a4);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray removeObjectAtIndex:](self->mOrderedKeys, "removeObjectAtIndex:", v8);
  -[TSUNoCopyDictionary setObject:forKey:](self->mData, "setObject:forKey:", a3, a4);
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
    -[TSUNoCopyDictionary removeObjectForKey:](self->mData, "removeObjectForKey:", a3);
    -[NSMutableArray removeObjectAtIndex:](self->mOrderedKeys, "removeObjectAtIndex:", v6);
  }
}

- (void)removeAllObjects
{
  -[NSMutableArray removeAllObjects](self->mOrderedKeys, "removeAllObjects");
  -[TSUNoCopyDictionary removeAllObjects](self->mData, "removeAllObjects");
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
  v8 = -[TSUNoCopyDictionary objectForKey:](self->mData, "objectForKey:", a3);
  v9 = a3;
  -[NSMutableArray addObject:](self->mOrderedKeys, "addObject:", a3);
  -[NSMutableArray removeObjectAtIndex:](self->mOrderedKeys, "removeObjectAtIndex:", v7);

  return v8;
}

- (id)allValues
{
  return -[TSUNoCopyDictionary allValues](self->mData, "allValues");
}

- (id)allKeys
{
  return self->mOrderedKeys;
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
  id v4;
  uint64_t v5;

  v3 = -[NSMutableArray objectAtIndex:](self->mOrderedKeys, "objectAtIndex:", 0);
  if (self->mCallbackTarget)
  {
    if (!self->mCallback)
    {
      v4 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSULRUCache p_removeOldestObject]");
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSULRUCache.m"), 141, CFSTR("invalid nil value for '%s'"), "mCallback");
    }
    objc_msgSend(self->mCallbackTarget, "performSelector:withObject:withObject:", self->mCallback, -[TSUNoCopyDictionary objectForKey:](self->mData, "objectForKey:", v3), v3);
  }
  -[TSUNoCopyDictionary removeObjectForKey:](self->mData, "removeObjectForKey:", v3);
  -[NSMutableArray removeObjectAtIndex:](self->mOrderedKeys, "removeObjectAtIndex:", 0);
}

- (unint64_t)maxSize
{
  return self->mMax;
}

@end
