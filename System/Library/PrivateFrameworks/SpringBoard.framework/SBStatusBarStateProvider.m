@implementation SBStatusBarStateProvider

- (void)beginCoalescentBlock
{
  void *v4;

  if (self->_posting)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStatusBarStateProvider.m"), 75, CFSTR("calls to %s are not allowed from within a post"), "-[SBStatusBarStateProvider beginCoalescentBlock]");

  }
  ++self->_coalescentBlockDepth;
}

- (void)statusBarStateAggregator:(id)a3 didVisitItem:(int)a4 withUpdates:(BOOL)a5 toData:(id *)a6
{
  if (-[SBStatusBarStateProvider _shouldPostForVisitedItem:withUpdates:toAggregatorData:lastPost:](self, "_shouldPostForVisitedItem:withUpdates:toAggregatorData:lastPost:", *(_QWORD *)&a4, a5, a6, &self->_lastPost))
  {
    self->_itemNeedsPost[a4] = 1;
    self->_anyItemNeedsPost = 1;
  }
}

- (void)statusBarStateAggregatorDidFinishPost:(id)a3 withData:(id *)a4 actions:(int)a5
{
  memcpy(&self->_aggregatorData, a4, sizeof(self->_aggregatorData));
  self->_aggregatorActions = a5;
  -[SBStatusBarStateProvider endCoalescentBlock](self, "endCoalescentBlock");
}

- (void)endCoalescentBlock
{
  BOOL *p_anyItemNeedsPost;
  unint64_t coalescentBlockDepth;
  unint64_t v6;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSHashTable *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  $D1AFE4C712074D7A4DFED30A4D6E293D *p_lastPost;
  _BYTE *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  BOOL *v25;
  NSMutableArray *obj;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE __dst[3880];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  p_anyItemNeedsPost = &self->_anyItemNeedsPost;
  if (self->_posting)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStatusBarStateProvider.m"), 80, CFSTR("calls to %s are not allowed from within a post"), "-[SBStatusBarStateProvider endCoalescentBlock]");

  }
  coalescentBlockDepth = self->_coalescentBlockDepth;
  if (!coalescentBlockDepth)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStatusBarStateProvider.m"), 81, CFSTR("unbalanced call to %s"), "-[SBStatusBarStateProvider endCoalescentBlock]");

    coalescentBlockDepth = self->_coalescentBlockDepth;
  }
  v6 = coalescentBlockDepth - 1;
  self->_coalescentBlockDepth = v6;
  if (!v6)
  {
    p_anyItemNeedsPost[2] = 1;
    memcpy(__dst, &self->_aggregatorData, sizeof(__dst));
    -[SBStatusBarStateProvider _composePostDataFromAggregatorData:](self, "_composePostDataFromAggregatorData:", __dst);
    -[SBStatusBarStateProvider _composePostActionsFromAggregatorActions:](self, "_composePostActionsFromAggregatorActions:", &self->_aggregatorActions);
    if (!self->_aggregatorActions && !p_anyItemNeedsPost[1])
    {
      p_lastPost = &self->_lastPost;
      if (!memcmp(__dst, &self->_lastPost, 0xF28uLL) || !*p_anyItemNeedsPost)
      {
LABEL_16:
        self->_aggregatorActions = 0;
        *(_OWORD *)self->_itemNeedsPost = 0u;
        *(_OWORD *)&self->_itemNeedsPost[16] = 0u;
        *(_OWORD *)&self->_itemNeedsPost[30] = 0u;
        v25 = p_anyItemNeedsPost;
        *(_WORD *)p_anyItemNeedsPost = 0;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        obj = self->_stylesWithDetailUpdates;
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        if (v28)
        {
          v27 = *(_QWORD *)v34;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v34 != v27)
                objc_enumerationMutation(obj);
              v13 = objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v12), "integerValue");
              v29 = 0u;
              v30 = 0u;
              v31 = 0u;
              v32 = 0u;
              v14 = self->_stateObservers;
              v15 = -[NSHashTable countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
              if (v15)
              {
                v16 = v15;
                v17 = *(_QWORD *)v30;
                do
                {
                  v18 = 0;
                  do
                  {
                    if (*(_QWORD *)v30 != v17)
                      objc_enumerationMutation(v14);
                    v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v18);
                    if ((objc_opt_respondsToSelector() & 1) != 0)
                      objc_msgSend(v19, "statusBarStateProvider:didChangeDoubleHeightStatusStringForStyle:", self, v13);
                    ++v18;
                  }
                  while (v16 != v18);
                  v16 = -[NSHashTable countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
                }
                while (v16);
              }

              ++v12;
            }
            while (v12 != v28);
            v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
          }
          while (v28);
        }

        -[NSMutableArray removeAllObjects](self->_stylesWithDetailUpdates, "removeAllObjects");
        v25[2] = 0;
        -[SBStatusBarStateProvider _didFinishPost](self, "_didFinishPost");
        return;
      }
      v21 = __dst;
      v22 = 46;
      while (!p_lastPost[1].itemIsEnabled[8] || !*v21 && !p_lastPost->itemIsEnabled[0])
      {
        p_lastPost = ($D1AFE4C712074D7A4DFED30A4D6E293D *)((char *)p_lastPost + 1);
        ++v21;
        if (!--v22)
          goto LABEL_16;
      }
    }
    memcpy(&self->_lastPost, __dst, sizeof(self->_lastPost));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v7 = self->_stateObservers;
    v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v38;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v38 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v11++), "statusBarStateProvider:didPostStatusBarData:withActions:", self, __dst, self->_aggregatorActions);
        }
        while (v9 != v11);
        v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v9);
    }

    goto LABEL_16;
  }
}

- (SBStatusBarStateProvider)init
{
  SBStatusBarStateProvider *v2;
  void *v3;
  uint64_t v4;
  NSHashTable *stateObservers;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBStatusBarStateProvider;
  v2 = -[SBStatusBarStateProvider init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend((id)SBApp, "statusBarStateAggregator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addPostingObserver:", v2);
    objc_storeWeak((id *)&v2->_stateAggregator, v3);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    stateObservers = v2->_stateObservers;
    v2->_stateObservers = (NSHashTable *)v4;

  }
  return v2;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_stateAggregator);
  objc_msgSend(WeakRetained, "removePostingObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBStatusBarStateProvider;
  -[SBStatusBarStateProvider dealloc](&v4, sel_dealloc);
}

- (void)addStatusBarStateObserver:(id)a3
{
  -[NSHashTable addObject:](self->_stateObservers, "addObject:", a3);
}

- (void)removeStatusBarStateObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_stateObservers, "removeObject:", a3);
}

- (void)getStatusBarData:(id *)a3
{
  if (a3)
  {
    memcpy(a3, &self->_aggregatorData, sizeof($6C45178016D353444451090973A2A97F));
    -[SBStatusBarStateProvider _composePostDataFromAggregatorData:](self, "_composePostDataFromAggregatorData:", a3);
  }
}

- (void)updateStatusBarItem:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  -[SBStatusBarStateProvider beginCoalescentBlock](self, "beginCoalescentBlock");
  if (-[SBStatusBarStateProvider _shouldPostForVisitedItem:withUpdates:toAggregatorData:lastPost:](self, "_shouldPostForVisitedItem:withUpdates:toAggregatorData:lastPost:", v3, 0, &self->_aggregatorData, &self->_lastPost))
  {
    self->_itemNeedsPost[v3] = 1;
    self->_anyItemNeedsPost = 1;
  }
  -[SBStatusBarStateProvider endCoalescentBlock](self, "endCoalescentBlock");
}

- (void)_didChangeDoubleHeightStatusStringForStyle:(int64_t)a3
{
  NSMutableArray *stylesWithDetailUpdates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;

  -[SBStatusBarStateProvider beginCoalescentBlock](self, "beginCoalescentBlock");
  stylesWithDetailUpdates = self->_stylesWithDetailUpdates;
  if (!stylesWithDetailUpdates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_stylesWithDetailUpdates;
    self->_stylesWithDetailUpdates = v6;

    stylesWithDetailUpdates = self->_stylesWithDetailUpdates;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](stylesWithDetailUpdates, "addObject:", v8);

  -[SBStatusBarStateProvider endCoalescentBlock](self, "endCoalescentBlock");
}

- (BOOL)_shouldPostForVisitedItem:(int)a3 withUpdates:(BOOL)a4 toAggregatorData:(id *)a5 lastPost:(id *)a6
{
  return a4;
}

- (BOOL)_shouldPostForUpdatesToNonItemData:(id *)a3
{
  return 1;
}

- (void)statusBarStateAggregator:(id)a3 didUpdateNonItemData:(id *)a4
{
  if (-[SBStatusBarStateProvider _shouldPostForUpdatesToNonItemData:](self, "_shouldPostForUpdatesToNonItemData:", a4))
    self->_nonItemDataNeedsPost = 1;
}

- (SBStatusBarStateAggregator)stateAggregator
{
  return (SBStatusBarStateAggregator *)objc_loadWeakRetained((id *)&self->_stateAggregator);
}

- (void)setStateAggregator:(id)a3
{
  objc_storeWeak((id *)&self->_stateAggregator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stateAggregator);
  objc_storeStrong((id *)&self->_stylesWithDetailUpdates, 0);
  objc_storeStrong((id *)&self->_stateObservers, 0);
}

@end
