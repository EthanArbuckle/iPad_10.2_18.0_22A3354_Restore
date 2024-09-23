@implementation WBSMutableOrderedDictionary

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  WBSMutableOrderedSet *v7;
  WBSMutableOrderedSet *mutableOrderedSetOfKeys;
  NSMutableDictionary *v9;
  NSMutableDictionary *mutableDictionary;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (!self->_mutableOrderedSetOfKeys)
  {
    v7 = -[WBSMutableOrderedSet initWithMaximumCount:]([WBSMutableOrderedSet alloc], "initWithMaximumCount:", self->_maximumCount);
    mutableOrderedSetOfKeys = self->_mutableOrderedSetOfKeys;
    self->_mutableOrderedSetOfKeys = v7;

  }
  if (!self->_mutableDictionary)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mutableDictionary = self->_mutableDictionary;
    self->_mutableDictionary = v9;

  }
  if (self->_maximumCount)
  {
    if (-[NSMutableDictionary count](self->_mutableDictionary, "count") >= self->_maximumCount)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_mutableDictionary, "objectForKeyedSubscript:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        -[WBSMutableOrderedSet objectAtIndexWithoutAffectingRecency:](self->_mutableOrderedSetOfKeys, "objectAtIndexWithoutAffectingRecency:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](self->_mutableDictionary, "removeObjectForKey:", v12);
        -[WBSMutableOrderedSet removeObject:](self->_mutableOrderedSetOfKeys, "removeObject:", v12);

      }
    }
  }
  -[WBSMutableOrderedSet addObject:](self->_mutableOrderedSetOfKeys, "addObject:", v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mutableDictionary, "setObject:forKeyedSubscript:", v13, v6);

}

- (WBSMutableOrderedDictionary)init
{
  return -[WBSMutableOrderedDictionary initWithMaximumCount:](self, "initWithMaximumCount:", 0);
}

- (WBSMutableOrderedDictionary)initWithMaximumCount:(unint64_t)a3
{
  WBSMutableOrderedDictionary *v4;
  WBSMutableOrderedDictionary *v5;
  WBSMutableOrderedDictionary *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WBSMutableOrderedDictionary;
  v4 = -[WBSMutableOrderedDictionary init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_maximumCount = a3;
    v6 = v4;
  }

  return v5;
}

- (NSArray)orderedKeys
{
  return -[WBSMutableOrderedSet array](self->_mutableOrderedSetOfKeys, "array");
}

- (id)objectForKey:(id)a3
{
  WBSMutableOrderedSet *mutableOrderedSetOfKeys;
  id v5;
  void *v6;

  mutableOrderedSetOfKeys = self->_mutableOrderedSetOfKeys;
  v5 = a3;
  -[WBSMutableOrderedSet markObjectAsRecentlyUsed:](mutableOrderedSetOfKeys, "markObjectAsRecentlyUsed:", v5);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_mutableDictionary, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)removeObjectForKey:(id)a3
{
  WBSMutableOrderedSet *mutableOrderedSetOfKeys;
  id v5;

  mutableOrderedSetOfKeys = self->_mutableOrderedSetOfKeys;
  v5 = a3;
  -[WBSMutableOrderedSet removeObject:](mutableOrderedSetOfKeys, "removeObject:", v5);
  -[NSMutableDictionary removeObjectForKey:](self->_mutableDictionary, "removeObjectForKey:", v5);

}

- (void)removeObjectsForKeys:(id)a3
{
  WBSMutableOrderedSet *mutableOrderedSetOfKeys;
  id v5;

  mutableOrderedSetOfKeys = self->_mutableOrderedSetOfKeys;
  v5 = a3;
  -[WBSMutableOrderedSet removeObjectsInArray:](mutableOrderedSetOfKeys, "removeObjectsInArray:", v5);
  -[NSMutableDictionary removeObjectsForKeys:](self->_mutableDictionary, "removeObjectsForKeys:", v5);

}

- (NSArray)orderedValues
{
  id v3;
  void *v4;
  id v5;
  NSArray *v6;
  _QWORD v8[4];
  id v9;
  WBSMutableOrderedDictionary *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[WBSMutableOrderedSet array](self->_mutableOrderedSetOfKeys, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__WBSMutableOrderedDictionary_orderedValues__block_invoke;
  v8[3] = &unk_1E649C988;
  v5 = v3;
  v9 = v5;
  v10 = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  v6 = (NSArray *)v5;
  return v6;
}

void __44__WBSMutableOrderedDictionary_orderedValues__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKeyedSubscript:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableDictionary, 0);
  objc_storeStrong((id *)&self->_mutableOrderedSetOfKeys, 0);
}

@end
