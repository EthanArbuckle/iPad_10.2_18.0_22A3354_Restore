@implementation WBSCacheRetainReleasePolicy

- (WBSCacheRetainReleasePolicy)initWithPurgeBlock:(id)a3
{
  id v4;
  WBSCacheRetainReleasePolicy *v5;
  uint64_t v6;
  id purgeBlock;
  uint64_t v8;
  NSCountedSet *entryRetainCounts;
  uint64_t v10;
  NSCountedSet *negativeEntryRetainCounts;
  WBSCacheRetainReleasePolicy *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSCacheRetainReleasePolicy;
  v5 = -[WBSCacheRetainReleasePolicy init](&v14, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x1A85D45E4](v4);
    purgeBlock = v5->_purgeBlock;
    v5->_purgeBlock = (id)v6;

    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    entryRetainCounts = v5->_entryRetainCounts;
    v5->_entryRetainCounts = (NSCountedSet *)v8;

    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    negativeEntryRetainCounts = v5->_negativeEntryRetainCounts;
    v5->_negativeEntryRetainCounts = (NSCountedSet *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)retainEntriesForKeyStrings:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[WBSCacheRetainReleasePolicy _retainEntryForKeyString:](self, "_retainEntryForKeyString:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)retainEntryWithKeyStringProvider:(id)a3
{
  id v4;

  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSCacheRetainReleasePolicy _retainEntryForKeyString:](self, "_retainEntryForKeyString:", v4);

}

- (void)_retainEntryForKeyString:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    if (-[NSCountedSet containsObject:](self->_negativeEntryRetainCounts, "containsObject:", v4))
      -[NSCountedSet removeObject:](self->_negativeEntryRetainCounts, "removeObject:", v4);
    else
      -[NSCountedSet addObject:](self->_entryRetainCounts, "addObject:", v4);
  }

}

- (void)releaseEntriesForKeyStrings:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[WBSCacheRetainReleasePolicy _releaseEntryForKeyString:](self, "_releaseEntryForKeyString:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)releaseEntryWithKeyStringProvider:(id)a3
{
  id v4;

  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSCacheRetainReleasePolicy _releaseEntryForKeyString:](self, "_releaseEntryForKeyString:", v4);

}

- (void)_releaseEntryForKeyString:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    if ((-[NSCountedSet containsObject:](self->_entryRetainCounts, "containsObject:", v4) & 1) != 0)
    {
      -[NSCountedSet removeObject:](self->_entryRetainCounts, "removeObject:", v4);
      if ((-[NSCountedSet containsObject:](self->_entryRetainCounts, "containsObject:", v4) & 1) == 0)
        (*((void (**)(void))self->_purgeBlock + 2))();
    }
    else
    {
      -[NSCountedSet addObject:](self->_negativeEntryRetainCounts, "addObject:", v4);
    }
  }

}

- (BOOL)isEntryRetainedForKeyString:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    v5 = -[NSCountedSet containsObject:](self->_entryRetainCounts, "containsObject:", v4);
  else
    v5 = 0;

  return v5;
}

- (NSSet)retainedKeyStrings
{
  return (NSSet *)(id)-[NSCountedSet copy](self->_entryRetainCounts, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativeEntryRetainCounts, 0);
  objc_storeStrong((id *)&self->_entryRetainCounts, 0);
  objc_storeStrong(&self->_purgeBlock, 0);
}

@end
