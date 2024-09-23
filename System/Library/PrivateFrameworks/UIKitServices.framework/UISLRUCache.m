@implementation UISLRUCache

- (UISLRUCache)initWithLimit:(unint64_t)a3
{
  UISLRUCache *v4;
  NSMutableOrderedSet *v5;
  NSMutableOrderedSet *cache;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UISLRUCache;
  v4 = -[UISLRUCache init](&v8, sel_init);
  if (v4)
  {
    v5 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    cache = v4->_cache;
    v4->_cache = v5;

    v4->_limit = a3;
  }
  return v4;
}

- (id)evictedObjectForUsedObject:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableOrderedSet *cache;
  void *v7;

  v4 = a3;
  v5 = -[NSMutableOrderedSet indexOfObject:](self->_cache, "indexOfObject:", v4);
  cache = self->_cache;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableOrderedSet removeObjectAtIndex:](cache, "removeObjectAtIndex:");
    -[NSMutableOrderedSet addObject:](self->_cache, "addObject:", v4);
    goto LABEL_5;
  }
  -[NSMutableOrderedSet addObject:](cache, "addObject:", v4);
  if (-[NSMutableOrderedSet count](self->_cache, "count") <= self->_limit)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  -[NSMutableOrderedSet objectAtIndexedSubscript:](self->_cache, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet removeObjectAtIndex:](self->_cache, "removeObjectAtIndex:", 0);
LABEL_6:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
