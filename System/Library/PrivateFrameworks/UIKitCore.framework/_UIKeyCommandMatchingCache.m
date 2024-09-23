@implementation _UIKeyCommandMatchingCache

+ (id)keyCommandMatchingCacheForLayout:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  _UIKeyCommandMatchingCache *v5;
  void *v6;
  id v7;

  v2 = a2;
  objc_opt_self();
  if (v2)
  {
    if (!_MergedGlobals_968 || (objc_msgSend((id)qword_1ECD7CDE8, "isEqualToString:", v2) & 1) == 0)
    {
      v3 = objc_msgSend(v2, "copy");
      v4 = (void *)qword_1ECD7CDE8;
      qword_1ECD7CDE8 = v3;

      v5 = objc_alloc_init(_UIKeyCommandMatchingCache);
      v6 = (void *)_MergedGlobals_968;
      _MergedGlobals_968 = (uint64_t)v5;

    }
    v7 = (id)_MergedGlobals_968;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (_UIKeyCommandMatchingCache)init
{
  _UIKeyCommandMatchingCache *v2;
  uint64_t v3;
  NSMutableDictionary *commandKeyPlaneConflictsByInput;
  uint64_t v5;
  NSMutableDictionary *reachabilityByInput;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIKeyCommandMatchingCache;
  v2 = -[_UIKeyCommandMatchingCache init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    commandKeyPlaneConflictsByInput = v2->_commandKeyPlaneConflictsByInput;
    v2->_commandKeyPlaneConflictsByInput = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    reachabilityByInput = v2->_reachabilityByInput;
    v2->_reachabilityByInput = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)_setCacheValue:(void *)a3 dictionary:(void *)a4 input:(uint64_t)a5 modifiers:
{
  id v9;
  NSMapTable *v10;
  id v11;

  v11 = a3;
  v9 = a4;
  if (a1)
  {
    objc_msgSend(v11, "objectForKey:", v9);
    v10 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 1282, 1282);
      v10 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v10, v9);
    }
    NSMapInsert(v10, (const void *)(a5 + 1), (const void *)a2);

  }
}

- (uint64_t)_cacheValueForDictionary:(void *)a3 input:(uint64_t)a4 modifiers:
{
  id v7;
  id v8;
  NSMapTable *v9;
  NSMapTable *v10;
  unsigned __int8 v11;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      v11 = NSMapGet(v9, (const void *)(a4 + 1));
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)conflictStateForCommandKeyPlaneSwitchForInput:(uint64_t)a3 modifiers:
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  if (result)
  {
    v4 = result;
    v5 = a2;
    objc_msgSend(v4, "commandKeyPlaneConflictsByInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[_UIKeyCommandMatchingCache _cacheValueForDictionary:input:modifiers:]((uint64_t)v4, v6, v5, a3);

    return (void *)v7;
  }
  return result;
}

- (void)setCommandKeyPlaneHasSwitchingConflict:(void *)a3 input:(uint64_t)a4 modifiers:
{
  id v7;
  void *v8;
  unsigned int v9;
  id v10;

  if (a1)
  {
    v7 = a3;
    objc_msgSend(a1, "commandKeyPlaneConflictsByInput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    if (a2)
      v9 = 1;
    else
      v9 = 2;
    -[_UIKeyCommandMatchingCache _setCacheValue:dictionary:input:modifiers:]((uint64_t)a1, v9, v8, v7, a4);

  }
}

- (void)setDirectlyReachable:(void *)a3 input:(uint64_t)a4 modifiers:
{
  id v7;
  void *v8;
  unsigned int v9;
  id v10;

  if (a1)
  {
    v7 = a3;
    objc_msgSend(a1, "reachabilityByInput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    if (a2)
      v9 = 1;
    else
      v9 = 2;
    -[_UIKeyCommandMatchingCache _setCacheValue:dictionary:input:modifiers:]((uint64_t)a1, v9, v8, v7, a4);

  }
}

- (void)directReachabilityStateForInput:(uint64_t)a3 modifiers:
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  if (result)
  {
    v4 = result;
    v5 = a2;
    objc_msgSend(v4, "reachabilityByInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[_UIKeyCommandMatchingCache _cacheValueForDictionary:input:modifiers:]((uint64_t)v4, v6, v5, a3);

    return (void *)v7;
  }
  return result;
}

- (NSMutableDictionary)commandKeyPlaneConflictsByInput
{
  return self->_commandKeyPlaneConflictsByInput;
}

- (NSMutableDictionary)reachabilityByInput
{
  return self->_reachabilityByInput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachabilityByInput, 0);
  objc_storeStrong((id *)&self->_commandKeyPlaneConflictsByInput, 0);
}

@end
