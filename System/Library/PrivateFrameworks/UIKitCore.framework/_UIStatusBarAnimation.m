@implementation _UIStatusBarAnimation

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

+ (_UIStatusBarAnimation)animationWithBlock:(id)a3
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

  return (_UIStatusBarAnimation *)v5;
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

  v13 = -[_UIStatusBarIdentifier copy](self->_displayItemIdentifier, "copy");
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
  +[_UIStatusBarAnimation _addAnimations:toDispatchGroup:](_UIStatusBarAnimation, "_addAnimations:toDispatchGroup:", v6, v5);

  dispatch_group_notify(v5, MEMORY[0x1E0C80D38], v4);
}

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
  v15[2] = __56___UIStatusBarAnimation_prepareAnimations_forStatusBar___block_invoke;
  v15[3] = &unk_1E16E2498;
  v16 = v6;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v6;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v15);

}

+ (void)_addAnimations:(id)a3 toPreparingAnimations:(id)a4 exclusiveAnimations:(id)a5 visitedDisplayItemIdentifiers:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  uint64_t v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v9;
  v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v13)
  {
    v14 = v13;
    v32 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v35 != v32)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
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

        objc_msgSend(v16, "displayItemIdentifier");
        v21 = objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v22 = (void *)v21;
          v23 = objc_msgSend(v12, "containsObject:", v20);

          if (v23)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIStatusBarAnimation.m"), 115, CFSTR("Several animations are targeting the same display item with identifier %@ in the same tree"), v20);

          }
        }
        objc_msgSend(v10, "objectForKeyedSubscript:", v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v24)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v24, v20);
        }
        objc_msgSend(v24, "addObject:", v16);
        objc_msgSend(v16, "exclusivityGroupIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v26)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v26, v25);
          }
          objc_msgSend(v26, "addObject:", v16);

        }
        objc_msgSend(v16, "subAnimations");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setByAddingObject:", v20);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_addAnimations:toPreparingAnimations:exclusiveAnimations:visitedDisplayItemIdentifiers:", v27, v10, v11, v28);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v14);
  }

}

- (void)_prepareForStatusBar:(id)a3 preparingAnimations:(id)a4 exclusiveAnimations:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  id WeakRetained;
  id v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t (**prepareBlock)(id, _UIStatusBarAnimation *, void *);
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_displayItemIdentifier)
  {
    v12 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
LABEL_15:
    if (self->_exclusivityGroupIdentifier
      && (objc_msgSend(v10, "objectForKeyedSubscript:"), (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v13 = v19;
      v20 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v32;
        while (2)
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v32 != v22)
              objc_enumerationMutation(v13);
            v24 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            if (objc_msgSend(v24, "priority", (_QWORD)v31) > self->_priority)
            {
              objc_msgSend(v24, "_prepareForStatusBar:preparingAnimations:exclusiveAnimations:", v8, v9, v10);
              if ((objc_msgSend(v24, "isEnabled") & 1) != 0)
              {
                v29 = v13;
                goto LABEL_41;
              }
            }
          }
          v21 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          if (v21)
            continue;
          break;
        }
      }

    }
    else
    {
      v13 = 0;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentAnimation);

    if (WeakRetained)
    {
      v26 = objc_loadWeakRetained((id *)&self->_parentAnimation);
      objc_msgSend(v26, "_prepareForStatusBar:preparingAnimations:exclusiveAnimations:", v8, v9, v10);

      v27 = objc_loadWeakRetained((id *)&self->_parentAnimation);
      LODWORD(v26) = objc_msgSend(v27, "isEnabled");

      if (!(_DWORD)v26)
        goto LABEL_42;
    }
    if (self->_displayItemIdentifier)
    {
      objc_msgSend(v8, "stateForDisplayItemWithIdentifier:");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "displayItem");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      self->_enabled = objc_msgSend(v28, "prepareAnimation:", self);

      if (!self->_enabled)
      {
LABEL_41:

LABEL_42:
        goto LABEL_43;
      }
    }
    else
    {
      v29 = 0;
      self->_enabled = 1;
    }
    prepareBlock = (uint64_t (**)(id, _UIStatusBarAnimation *, void *))self->_prepareBlock;
    if (prepareBlock && (prepareBlock[2](prepareBlock, self, v29) & 1) == 0)
      -[_UIStatusBarAnimation cancel](self, "cancel");
    if (self->_enabled && self->_displayItemIdentifier)
      objc_msgSend(v12, "removeAllObjects");
    goto LABEL_41;
  }
  if (objc_msgSend(v11, "containsObject:", self))
  {
    objc_msgSend(v12, "removeObject:", self);
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v13 = (id)objc_msgSend(v12, "copy");
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v36;
LABEL_6:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v36 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v17);
        if (objc_msgSend(v18, "priority") > self->_priority)
        {
          objc_msgSend(v18, "_prepareForStatusBar:preparingAnimations:exclusiveAnimations:", v8, v9, v10);
          if ((objc_msgSend(v18, "isEnabled") & 1) != 0)
            goto LABEL_42;
        }
        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
          if (v15)
            goto LABEL_6;
          break;
        }
      }
    }

    goto LABEL_15;
  }
LABEL_43:

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
          v15[2] = __56___UIStatusBarAnimation__addAnimations_toDispatchGroup___block_invoke;
          v15[3] = &unk_1E16B42D0;
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

- (void)performForStatusBar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  double timeout;
  dispatch_time_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD block[5];
  id v25;
  _QWORD *v26;
  _QWORD aBlock[6];
  _QWORD v28[3];
  char v29;
  _QWORD v30[5];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_enabled)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0x7FFFFFFFFFFFFFFFLL;
    -[_UIStatusBarAnimation subAnimations](self, "subAnimations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _UIStatusBarGetPriorityComparator();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortedArrayUsingComparator:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __45___UIStatusBarAnimation_performForStatusBar___block_invoke;
    v30[3] = &unk_1E16E24C0;
    v30[4] = self;
    v9 = v4;
    v31 = v9;
    v32 = &v33;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v30);
    objc_msgSend((id)_statusBarRunningAnimations, "addObject:", self);
    if (self->_displayItemIdentifier)
    {
      objc_msgSend(v9, "displayItemWithIdentifier:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v29 = 0;
    aBlock[0] = v8;
    aBlock[1] = 3221225472;
    aBlock[2] = __45___UIStatusBarAnimation_performForStatusBar___block_invoke_2;
    aBlock[3] = &unk_1E16BD888;
    aBlock[4] = self;
    aBlock[5] = v28;
    v11 = _Block_copy(aBlock);
    (*((void (**)(void))self->_animationBlock + 2))();
    timeout = self->_timeout;
    if (timeout > 0.0)
    {
      v13 = dispatch_time(0, (uint64_t)(timeout * 1000000000.0));
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __45___UIStatusBarAnimation_performForStatusBar___block_invoke_3;
      block[3] = &unk_1E16E24E8;
      v26 = v28;
      block[4] = self;
      v25 = v11;
      dispatch_after(v13, MEMORY[0x1E0C80D38], block);

    }
    v14 = v34[3];
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = objc_msgSend(v7, "count");
      objc_msgSend(v7, "subarrayWithRange:", v14, v15 - v34[3]);
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v20, v37, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v21 != v18)
              objc_enumerationMutation(v16);
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "performForStatusBar:", v9, (_QWORD)v20);
          }
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v20, v37, 16);
        }
        while (v17);
      }

    }
    _Block_object_dispose(v28, 8);

    _Block_object_dispose(&v33, 8);
  }

}

- (void)addTimeout:(double)a3 withHandler:(id)a4
{
  if (self->_timeout == 0.0)
  {
    self->_timeout = a3;
    -[_UIStatusBarAnimation setTimeoutBlock:](self, "setTimeoutBlock:", a4);
  }
}

- (void)cancel
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_enabled)
  {
    self->_enabled = 0;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v3 = self->_completionHandlers;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v18;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v18 != v6)
            objc_enumerationMutation(v3);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v7++) + 16))();
        }
        while (v5 != v7);
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v5);
    }

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[_UIStatusBarAnimation subAnimations](self, "subAnimations", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "cancel");
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      }
      while (v10);
    }

  }
}

- (void)addSubAnimation:(id)a3 forDisplayItemWithIdentifier:(id)a4
{
  id v7;
  _UIStatusBarIdentifier *v8;
  _UIStatusBarIdentifier *v9;
  NSMutableArray *v10;
  NSMutableArray *subAnimations;
  void *v12;
  void *v13;
  id v14;

  v7 = a3;
  v8 = (_UIStatusBarIdentifier *)a4;
  v9 = v8;
  if (v8 && self->_displayItemIdentifier == v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStatusBarAnimation.m"), 343, CFSTR("Can't add a sub-animation for the same display item"));

  }
  if (self->_enabled)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStatusBarAnimation.m"), 344, CFSTR("Sub-animations can't be added during prepare"));

  }
  if (!self->_subAnimations)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    subAnimations = self->_subAnimations;
    self->_subAnimations = v10;

  }
  v14 = (id)objc_msgSend(v7, "copy");

  objc_msgSend(v14, "setDisplayItemIdentifier:", v9);
  objc_msgSend(v14, "setParentAnimation:", self);
  -[NSMutableArray addObject:](self->_subAnimations, "addObject:", v14);

}

- (NSMutableArray)subAnimations
{
  return self->_subAnimations;
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
    -[_UIStatusBarAnimation delayedItemIdentifiers](self, "delayedItemIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[_UIStatusBarAnimation delayedDisplayItemPlacements](self, "delayedDisplayItemPlacements");
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
          +[_UIStatusBarItem itemIdentifierForDisplayItemIdentifier:](_UIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v7);
    }

    if (self->_delaysDependentItems || self->_delaysAnimatingItems)
    {
      -[_UIStatusBarAnimation _dependentItemIdentifiersEnabledOnly:](self, "_dependentItemIdentifiersEnabledOnly:", !self->_delaysDependentItems);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "unionSet:", v12);

    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[_UIStatusBarAnimation subAnimations](self, "subAnimations", 0);
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
      +[_UIStatusBarItem itemIdentifierForDisplayItemIdentifier:](_UIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v6);

    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[_UIStatusBarAnimation subAnimations](self, "subAnimations", 0);
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel_displayItemIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v3;
  NSStringFromSelector(sel_identifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v4;
  NSStringFromSelector(sel_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v5;
  NSStringFromSelector(sel_enabled);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v6;
  NSStringFromSelector(sel_priority);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v7;
  NSStringFromSelector(sel_delayedItemIdentifiers);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v8;
  NSStringFromSelector(sel_subAnimations);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v10, v13, v14, v15, v16, v17, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (_UIStatusBarIdentifier)displayItemIdentifier
{
  return self->_displayItemIdentifier;
}

- (void)setDisplayItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)exclusivityGroupIdentifier
{
  return self->_exclusivityGroupIdentifier;
}

- (void)setExclusivityGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (id)prepareBlock
{
  return self->_prepareBlock;
}

- (void)setPrepareBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSSet)delayedItemIdentifiers
{
  return self->_delayedItemIdentifiers;
}

- (void)setDelayedItemIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSSet)delayedDisplayItemPlacements
{
  return self->_delayedDisplayItemPlacements;
}

- (void)setDelayedDisplayItemPlacements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)delaysAnimatingItems
{
  return self->_delaysAnimatingItems;
}

- (void)setDelaysAnimatingItems:(BOOL)a3
{
  self->_delaysAnimatingItems = a3;
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

- (_UIStatusBarAnimation)parentAnimation
{
  return (_UIStatusBarAnimation *)objc_loadWeakRetained((id *)&self->_parentAnimation);
}

- (void)setParentAnimation:(id)a3
{
  objc_storeWeak((id *)&self->_parentAnimation, a3);
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

- (void)setAnimationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)timeoutBlock
{
  return self->_timeoutBlock;
}

- (void)setTimeoutBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_completionHandlers, a3);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
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

@end
