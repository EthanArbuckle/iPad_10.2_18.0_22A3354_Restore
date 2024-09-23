@implementation STUIStatusBarAnimation

+ (void)prepareAnimations:(id)a3 forStatusBar:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99E08];
  v8 = a3;
  objc_msgSend(v7, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_addAnimations:toPreparingAnimations:exclusiveAnimations:visitedDisplayItemIdentifiers:", v8, v9, v10, v11);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__STUIStatusBarAnimation_prepareAnimations_forStatusBar___block_invoke;
  v15[3] = &unk_1E8D63DF8;
  v16 = v6;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v6;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v15);

}

+ (void)_addAnimations:(id)a3 toDispatchGroup:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  _QWORD v15[4];
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v13, "isEnabled"))
        {
          dispatch_group_enter(v7);
          v15[0] = v11;
          v15[1] = 3221225472;
          v15[2] = __57__STUIStatusBarAnimation__addAnimations_toDispatchGroup___block_invoke;
          v15[3] = &unk_1E8D628C0;
          v16 = v7;
          objc_msgSend(v13, "addCompletionHandler:", v15);

        }
        objc_msgSend(v13, "subAnimations");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_addAnimations:toDispatchGroup:", v14, v7);

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

+ (void)_addAnimations:(id)a3 toPreparingAnimations:(id)a4 exclusiveAnimations:(id)a5 visitedDisplayItemIdentifiers:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v28 = a6;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v9;
  v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v16, "displayItemIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          v19 = v17;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v19 = (id)objc_claimAutoreleasedReturnValue();
        }
        v20 = v19;

        objc_msgSend(v10, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v21)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, v20);
        }
        objc_msgSend(v21, "addObject:", v16);
        objc_msgSend(v16, "exclusivityGroupIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v23)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, v22);
          }
          objc_msgSend(v23, "addObject:", v16);

        }
        objc_msgSend(v16, "subAnimations");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setByAddingObject:", v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_addAnimations:toPreparingAnimations:exclusiveAnimations:visitedDisplayItemIdentifiers:", v24, v10, v11, v25);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v13);
  }

}

- (NSMutableArray)subAnimations
{
  return self->_subAnimations;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (STUIStatusBarIdentifier)displayItemIdentifier
{
  return self->_displayItemIdentifier;
}

- (NSString)exclusivityGroupIdentifier
{
  return self->_exclusivityGroupIdentifier;
}

- (NSSet)effectiveDelayedItemIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (self->_enabled)
  {
    -[STUIStatusBarAnimation delayedItemIdentifiers](self, "delayedItemIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[STUIStatusBarAnimation delayedDisplayItemPlacements](self, "delayedDisplayItemPlacements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:](STUIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v7);
    }

    if (self->_delaysDependentItems || self->_delaysAnimatingItems)
    {
      -[STUIStatusBarAnimation _dependentItemIdentifiersEnabledOnly:](self, "_dependentItemIdentifiersEnabledOnly:", !self->_delaysDependentItems);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "unionSet:", v12);

    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[STUIStatusBarAnimation subAnimations](self, "subAnimations", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "effectiveDelayedItemIdentifiers");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "unionSet:", v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v15);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSSet *)v4;
}

- (id)_dependentItemIdentifiersEnabledOnly:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  if (a3 && !self->_enabled)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_displayItemIdentifier)
    {
      +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:](STUIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v6);

    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[STUIStatusBarAnimation subAnimations](self, "subAnimations", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "_dependentItemIdentifiersEnabledOnly:", v3);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "unionSet:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    return v5;
  }
}

- (NSSet)delayedItemIdentifiers
{
  return self->_delayedItemIdentifiers;
}

- (NSSet)delayedDisplayItemPlacements
{
  return self->_delayedDisplayItemPlacements;
}

void __46__STUIStatusBarAnimation_performForStatusBar___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  id v8;

  v8 = a2;
  v7 = objc_msgSend(v8, "priority");
  if (v7 <= objc_msgSend(*(id *)(a1 + 32), "priority"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v8, "performForStatusBar:", *(_QWORD *)(a1 + 40));
  }

}

- (int64_t)priority
{
  return self->_priority;
}

- (void)addSubAnimation:(id)a3 forDisplayItemWithIdentifier:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  NSMutableArray *subAnimations;
  id v10;

  v6 = a3;
  v7 = a4;
  if (!self->_subAnimations)
  {
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    subAnimations = self->_subAnimations;
    self->_subAnimations = v8;

  }
  v10 = (id)objc_msgSend(v6, "copy");

  objc_msgSend(v10, "setDisplayItemIdentifier:", v7);
  objc_msgSend(v10, "setParentAnimation:", self);
  -[NSMutableArray addObject:](self->_subAnimations, "addObject:", v10);

}

- (void)setDisplayItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setParentAnimation:(id)a3
{
  objc_storeWeak((id *)&self->_parentAnimation, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = _Block_copy(self->_animationBlock);
  v6 = (void *)v4[13];
  v4[13] = v5;

  v7 = _Block_copy(self->_prepareBlock);
  v8 = (void *)v4[7];
  v4[7] = v7;

  v4[6] = self->_type;
  *((_BYTE *)v4 + 10) = self->_enabled;
  v4[2] = self->_priority;
  v9 = -[NSString copy](self->_identifier, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSString copy](self->_exclusivityGroupIdentifier, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = -[STUIStatusBarIdentifier copy](self->_displayItemIdentifier, "copy");
  v14 = (void *)v4[3];
  v4[3] = v13;

  v15 = -[NSSet copy](self->_delayedItemIdentifiers, "copy");
  v16 = (void *)v4[8];
  v4[8] = v15;

  v17 = -[NSSet copy](self->_delayedDisplayItemPlacements, "copy");
  v18 = (void *)v4[9];
  v4[9] = v17;

  *((_BYTE *)v4 + 8) = self->_delaysAnimatingItems;
  *((_BYTE *)v4 + 9) = self->_delaysDependentItems;
  v4[12] = *(_QWORD *)&self->_timeout;
  v19 = _Block_copy(self->_timeoutBlock);
  v20 = (void *)v4[14];
  v4[14] = v19;

  return v4;
}

- (void)addTotalCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = dispatch_group_create();
  v7[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarAnimation _addAnimations:toDispatchGroup:](STUIStatusBarAnimation, "_addAnimations:toDispatchGroup:", v6, v5);

  dispatch_group_notify(v5, MEMORY[0x1E0C80D38], v4);
}

void __46__STUIStatusBarAnimation_performForStatusBar___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  int v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (!*(_BYTE *)(v2 + 24))
  {
    *(_BYTE *)(v2 + 24) = 1;
    _STUIStatusBar_Log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 67109378;
      v19 = a2;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1CFE2E000, v5, OS_LOG_TYPE_DEBUG, "perform completed (finished: %d) for %@", buf, 0x12u);
    }

    objc_msgSend((id)_statusBarRunningAnimations, "removeObject:", *(_QWORD *)(a1 + 32));
    v7 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v7 + 10))
    {
      *(_BYTE *)(v7 + 10) = 0;
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v8 = *(id *)(*(_QWORD *)(a1 + 32) + 120);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v14 != v11)
              objc_enumerationMutation(v8);
            (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v10);
      }

    }
  }
}

void __57__STUIStatusBarAnimation__addAnimations_toDispatchGroup___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)performForStatusBar:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  double timeout;
  dispatch_time_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD block[5];
  id v26;
  _QWORD *v27;
  _QWORD aBlock[6];
  _QWORD v29[3];
  char v30;
  _QWORD v31[5];
  id v32;
  __int128 *p_buf;
  uint8_t v34[128];
  __int128 buf;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_enabled)
  {
    _STUIStatusBar_Log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_1CFE2E000, v5, OS_LOG_TYPE_DEBUG, "perform %@", (uint8_t *)&buf, 0xCu);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v36 = 0x2020000000;
    v37 = 0x7FFFFFFFFFFFFFFFLL;
    -[STUIStatusBarAnimation subAnimations](self, "subAnimations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    STUIStatusBarGetPriorityComparator();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingComparator:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __46__STUIStatusBarAnimation_performForStatusBar___block_invoke;
    v31[3] = &unk_1E8D63E20;
    v31[4] = self;
    v10 = v4;
    v32 = v10;
    p_buf = &buf;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v31);
    objc_msgSend((id)_statusBarRunningAnimations, "addObject:", self);
    if (self->_displayItemIdentifier)
    {
      objc_msgSend(v10, "displayItemWithIdentifier:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v30 = 0;
    aBlock[0] = v9;
    aBlock[1] = 3221225472;
    aBlock[2] = __46__STUIStatusBarAnimation_performForStatusBar___block_invoke_2;
    aBlock[3] = &unk_1E8D63E48;
    aBlock[4] = self;
    aBlock[5] = v29;
    v12 = _Block_copy(aBlock);
    (*((void (**)(void))self->_animationBlock + 2))();
    timeout = self->_timeout;
    if (timeout > 0.0)
    {
      v14 = dispatch_time(0, (uint64_t)(timeout * 1000000000.0));
      block[0] = v9;
      block[1] = 3221225472;
      block[2] = __46__STUIStatusBarAnimation_performForStatusBar___block_invoke_19;
      block[3] = &unk_1E8D63E70;
      v27 = v29;
      block[4] = self;
      v26 = v12;
      dispatch_after(v14, MEMORY[0x1E0C80D38], block);

    }
    v15 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = objc_msgSend(v8, "count");
      objc_msgSend(v8, "subarrayWithRange:", v15, v16 - *(_QWORD *)(*((_QWORD *)&buf + 1) + 24));
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v21, v34, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v22 != v19)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "performForStatusBar:", v10, (_QWORD)v21);
          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v21, v34, 16);
        }
        while (v18);
      }

    }
    _Block_object_dispose(v29, 8);

    _Block_object_dispose(&buf, 8);
  }

}

- (void)setTimeoutBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)addTimeout:(double)a3 withHandler:(id)a4
{
  if (self->_timeout == 0.0)
  {
    self->_timeout = a3;
    -[STUIStatusBarAnimation setTimeoutBlock:](self, "setTimeoutBlock:", a4);
  }
}

void __57__STUIStatusBarAnimation_prepareAnimations_forStatusBar___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = v4;
  while (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v6, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_prepareForStatusBar:preparingAnimations:exclusiveAnimations:", a1[4], a1[5], a1[6]);

    v4 = v6;
  }

}

- (void)_prepareForStatusBar:(id)a3 preparingAnimations:(id)a4 exclusiveAnimations:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  id WeakRetained;
  id v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t (**prepareBlock)(id, STUIStatusBarAnimation *, void *);
  NSObject *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint8_t v42[128];
  uint8_t buf[4];
  STUIStatusBarAnimation *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _STUIStatusBar_Log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v44 = self;
    _os_log_impl(&dword_1CFE2E000, v11, OS_LOG_TYPE_DEBUG, "prepare %@", buf, 0xCu);
  }

  if (!self->_displayItemIdentifier)
  {
    v13 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
LABEL_17:
    if (self->_exclusivityGroupIdentifier
      && (objc_msgSend(v10, "objectForKeyedSubscript:"), (v20 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v14 = v20;
      v21 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v34;
        while (2)
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v34 != v23)
              objc_enumerationMutation(v14);
            v25 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            if (objc_msgSend(v25, "priority", (_QWORD)v33) > self->_priority)
            {
              objc_msgSend(v25, "_prepareForStatusBar:preparingAnimations:exclusiveAnimations:", v8, v9, v10);
              if ((objc_msgSend(v25, "isEnabled") & 1) != 0)
              {
                v30 = v14;
                goto LABEL_46;
              }
            }
          }
          v22 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          if (v22)
            continue;
          break;
        }
      }

    }
    else
    {
      v14 = 0;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentAnimation);

    if (WeakRetained)
    {
      v27 = objc_loadWeakRetained((id *)&self->_parentAnimation);
      objc_msgSend(v27, "_prepareForStatusBar:preparingAnimations:exclusiveAnimations:", v8, v9, v10);

      v28 = objc_loadWeakRetained((id *)&self->_parentAnimation);
      LODWORD(v27) = objc_msgSend(v28, "isEnabled");

      if (!(_DWORD)v27)
        goto LABEL_47;
    }
    if (self->_displayItemIdentifier)
    {
      objc_msgSend(v8, "stateForDisplayItemWithIdentifier:");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "displayItem");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      self->_enabled = objc_msgSend(v29, "prepareAnimation:", self);

      if (!self->_enabled)
        goto LABEL_43;
    }
    else
    {
      v30 = 0;
      self->_enabled = 1;
    }
    prepareBlock = (uint64_t (**)(id, STUIStatusBarAnimation *, void *))self->_prepareBlock;
    if (prepareBlock && (prepareBlock[2](prepareBlock, self, v30) & 1) == 0)
      -[STUIStatusBarAnimation cancel](self, "cancel");
    if (self->_enabled && self->_displayItemIdentifier)
      objc_msgSend(v13, "removeAllObjects");
LABEL_43:
    _STUIStatusBar_Log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v44 = self;
      _os_log_impl(&dword_1CFE2E000, v32, OS_LOG_TYPE_DEBUG, "prepared %@", buf, 0xCu);
    }

LABEL_46:
LABEL_47:

    goto LABEL_48;
  }
  if (objc_msgSend(v12, "containsObject:", self))
  {
    objc_msgSend(v13, "removeObject:", self);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v14 = (id)objc_msgSend(v13, "copy");
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v38;
LABEL_8:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v38 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v18);
        if (objc_msgSend(v19, "priority") > self->_priority)
        {
          objc_msgSend(v19, "_prepareForStatusBar:preparingAnimations:exclusiveAnimations:", v8, v9, v10);
          if ((objc_msgSend(v19, "isEnabled") & 1) != 0)
            goto LABEL_47;
        }
        if (v16 == ++v18)
        {
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
          if (v16)
            goto LABEL_8;
          break;
        }
      }
    }

    goto LABEL_17;
  }
LABEL_48:

}

- (void)cancel
{
  NSObject *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint8_t v23[128];
  uint8_t buf[4];
  STUIStatusBarAnimation *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self->_enabled)
  {
    _STUIStatusBar_Log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v25 = self;
      _os_log_impl(&dword_1CFE2E000, v3, OS_LOG_TYPE_DEBUG, "cancel %@", buf, 0xCu);
    }

    self->_enabled = 0;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v4 = self->_completionHandlers;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v19;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(v4);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8++) + 16))();
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v6);
    }

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[STUIStatusBarAnimation subAnimations](self, "subAnimations", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "cancel");
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      }
      while (v11);
    }

  }
}

- (void)addCompletionHandler:(id)a3
{
  id v4;
  NSMutableArray *completionHandlers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *aBlock;

  v4 = a3;
  completionHandlers = self->_completionHandlers;
  aBlock = v4;
  if (!completionHandlers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_completionHandlers;
    self->_completionHandlers = v6;

    v4 = aBlock;
    completionHandlers = self->_completionHandlers;
  }
  v8 = _Block_copy(v4);
  -[NSMutableArray addObject:](completionHandlers, "addObject:", v8);

}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong(&self->_timeoutBlock, 0);
  objc_storeStrong(&self->_animationBlock, 0);
  objc_destroyWeak((id *)&self->_parentAnimation);
  objc_storeStrong((id *)&self->_subAnimations, 0);
  objc_storeStrong((id *)&self->_delayedDisplayItemPlacements, 0);
  objc_storeStrong((id *)&self->_delayedItemIdentifiers, 0);
  objc_storeStrong(&self->_prepareBlock, 0);
  objc_storeStrong((id *)&self->_exclusivityGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayItemIdentifier, 0);
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (void)setPrepareBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

+ (STUIStatusBarAnimation)animationWithBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setAnimationBlock:", v4);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelayedItemIdentifiers:", v6);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelayedDisplayItemPlacements:", v7);

  return (STUIStatusBarAnimation *)v5;
}

- (void)setDelayedDisplayItemPlacements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setDelayedItemIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setAnimationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setDelaysAnimatingItems:(BOOL)a3
{
  self->_delaysAnimatingItems = a3;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)_statusBarRunningAnimations;
    _statusBarRunningAnimations = v2;

  }
}

uint64_t __46__STUIStatusBarAnimation_performForStatusBar___block_invoke_19(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint8_t v4[16];

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    _STUIStatusBar_Log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1CFE2E000, v2, OS_LOG_TYPE_FAULT, "Status bar animation took longer than expected and was ended early.", v4, 2u);
    }

    v3 = *(_QWORD *)(*(_QWORD *)(v1 + 32) + 112);
    if (v3)
      (*(void (**)(void))(v3 + 16))();
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

- (NSString)description
{
  return (NSString *)-[STUIStatusBarAnimation descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSString)debugDescription
{
  return (NSString *)-[STUIStatusBarAnimation debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STUIStatusBarAnimation succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  const __CFString *v9;
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarAnimation displayItemIdentifier](self, "displayItemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v4, CFSTR("displayItemIdentifier"), 1);

  -[STUIStatusBarAnimation identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v6, CFSTR("identifier"), 1);

  v8 = -[STUIStatusBarAnimation type](self, "type");
  if (v8 > 3)
    v9 = CFSTR("(unknown)");
  else
    v9 = off_1E8D63E90[v8];
  objc_msgSend(v3, "appendString:withName:", v9, CFSTR("type"));
  v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[STUIStatusBarAnimation isEnabled](self, "isEnabled"), CFSTR("enabled"));
  v11 = (id)objc_msgSend(v3, "appendInteger:withName:", -[STUIStatusBarAnimation priority](self, "priority"), CFSTR("priority"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STUIStatusBarAnimation descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STUIStatusBarAnimation _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STUIStatusBarAnimation _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  -[STUIStatusBarAnimation succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUseDebugDescription:", v4);
  objc_msgSend(v7, "setActiveMultilinePrefix:", v6);

  -[STUIStatusBarAnimation delayedItemIdentifiers](self, "delayedItemIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendArraySection:withName:skipIfEmpty:", v9, CFSTR("delayedItemIdentifiers"), 1);

  -[STUIStatusBarAnimation subAnimations](self, "subAnimations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendArraySection:withName:skipIfEmpty:", v10, CFSTR("subAnimations"), 1);

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setExclusivityGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)prepareBlock
{
  return self->_prepareBlock;
}

- (BOOL)delaysAnimatingItems
{
  return self->_delaysAnimatingItems;
}

- (BOOL)delaysDependentItems
{
  return self->_delaysDependentItems;
}

- (void)setDelaysDependentItems:(BOOL)a3
{
  self->_delaysDependentItems = a3;
}

- (void)setSubAnimations:(id)a3
{
  objc_storeStrong((id *)&self->_subAnimations, a3);
}

- (STUIStatusBarAnimation)parentAnimation
{
  return (STUIStatusBarAnimation *)objc_loadWeakRetained((id *)&self->_parentAnimation);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (id)animationBlock
{
  return self->_animationBlock;
}

- (id)timeoutBlock
{
  return self->_timeoutBlock;
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_completionHandlers, a3);
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end
