@implementation _SBRecentlyUsedSceneIdentityCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentPIDs, 0);
  objc_storeStrong((id *)&self->_recentSceneIdentityTokensByPID, 0);
}

- (BOOL)promoteContainedSceneIdentityToken:(id)a3 forPID:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_recentSceneIdentityTokensByPID, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "containsObject:", v6))
  {
    objc_msgSend(v9, "removeObject:", v6);
    objc_msgSend(v9, "addObject:", v6);
    -[NSMutableOrderedSet removeObject:](self->_recentPIDs, "removeObject:", v7);
    -[NSMutableOrderedSet addObject:](self->_recentPIDs, "addObject:", v7);
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66___SBRecentlyUsedSceneIdentityCache_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E8E9E820;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

- (BOOL)isEqual:(id)a3
{
  id v3;
  id v4;
  char v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    if (BSEqualObjects())
      v5 = BSEqualObjects();
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _SBRecentlyUsedSceneIdentityCache *v4;
  uint64_t v5;
  NSMutableOrderedSet *recentPIDs;
  NSMutableDictionary *v7;
  NSMutableDictionary *recentSceneIdentityTokensByPID;
  NSMutableDictionary *v9;
  _SBRecentlyUsedSceneIdentityCache *v10;
  _QWORD v12[4];
  _SBRecentlyUsedSceneIdentityCache *v13;

  v4 = objc_alloc_init(_SBRecentlyUsedSceneIdentityCache);
  v5 = -[NSMutableOrderedSet mutableCopy](self->_recentPIDs, "mutableCopy");
  recentPIDs = v4->_recentPIDs;
  v4->_recentPIDs = (NSMutableOrderedSet *)v5;

  v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  recentSceneIdentityTokensByPID = v4->_recentSceneIdentityTokensByPID;
  v4->_recentSceneIdentityTokensByPID = v7;

  v9 = self->_recentSceneIdentityTokensByPID;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50___SBRecentlyUsedSceneIdentityCache_copyWithZone___block_invoke;
  v12[3] = &unk_1E8EB5CB0;
  v10 = v4;
  v13 = v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v9, "enumerateKeysAndObjectsUsingBlock:", v12);

  return v10;
}

- (_SBRecentlyUsedSceneIdentityCache)init
{
  _SBRecentlyUsedSceneIdentityCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *recentSceneIdentityTokensByPID;
  NSMutableOrderedSet *v5;
  NSMutableOrderedSet *recentPIDs;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SBRecentlyUsedSceneIdentityCache;
  v2 = -[_SBRecentlyUsedSceneIdentityCache init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    recentSceneIdentityTokensByPID = v2->_recentSceneIdentityTokensByPID;
    v2->_recentSceneIdentityTokensByPID = v3;

    v5 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    recentPIDs = v2->_recentPIDs;
    v2->_recentPIDs = v5;

  }
  return v2;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)addSceneIdentityToken:(id)a3 forPID:(int)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v4 = *(_QWORD *)&a4;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithInt:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_recentSceneIdentityTokensByPID, "objectForKeyedSubscript:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "removeObject:", v7);
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recentSceneIdentityTokensByPID, "setObject:forKeyedSubscript:", v9, v10);
  }
  objc_msgSend(v9, "addObject:", v7);

  -[NSMutableOrderedSet removeObject:](self->_recentPIDs, "removeObject:", v10);
  -[NSMutableOrderedSet addObject:](self->_recentPIDs, "addObject:", v10);

}

- (void)removeSceneIdentityToken:(id)a3 forPID:(int)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)&a4;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithInt:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_recentSceneIdentityTokensByPID, "objectForKeyedSubscript:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v7);

  if (!objc_msgSend(v8, "count"))
  {
    -[NSMutableDictionary removeObjectForKey:](self->_recentSceneIdentityTokensByPID, "removeObjectForKey:", v9);

    -[NSMutableOrderedSet removeObject:](self->_recentPIDs, "removeObject:", v9);
    v8 = 0;
  }

}

- (id)mostRecentFocusTargetForAnyProcess
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1[2], "lastObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_msgSend(v1[1], "objectForKey:", v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "lastObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      +[SBKeyboardFocusTarget targetForSceneIdentityToken:pid:](SBKeyboardFocusTarget, "targetForSceneIdentityToken:pid:", v4, objc_msgSend(v2, "intValue"));
      v1 = (id *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

- (id)mostRecentFocusTargetForPID:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a1)
  {
    v3 = *(void **)(a1 + 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      +[SBKeyboardFocusTarget targetForSceneIdentityToken:pid:](SBKeyboardFocusTarget, "targetForSceneIdentityToken:pid:", v6, a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end
