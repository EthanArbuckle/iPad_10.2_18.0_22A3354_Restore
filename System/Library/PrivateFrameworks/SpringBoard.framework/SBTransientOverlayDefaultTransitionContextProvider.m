@implementation SBTransientOverlayDefaultTransitionContextProvider

- (void)completeTransition:(BOOL)a3
{
  void *v6;
  NSMutableArray *transitionCompletionBlocks;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!self->_didPerformAlongsideTransitions)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTransientOverlayDefaultTransitionContextProvider.m"), 24, CFSTR("-performAlongsideTransitions must be called before completing the transition."));

  }
  if (self->_isCompleted)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTransientOverlayDefaultTransitionContextProvider.m"), 25, CFSTR("%@ may only be called once."), v15);

  }
  self->_isCompleted = 1;
  self->_transitionCompletedSuccessfully = a3;
  v6 = (void *)-[NSMutableArray copy](self->_transitionCompletionBlocks, "copy");
  transitionCompletionBlocks = self->_transitionCompletionBlocks;
  self->_transitionCompletionBlocks = 0;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12++) + 16))();
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

}

- (void)performAlongsideTransitions
{
  void *v3;
  NSMutableArray *transitionBlocks;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_didPerformAlongsideTransitions)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTransientOverlayDefaultTransitionContextProvider.m"), 38, CFSTR("%@ may only be called once."), v12);

  }
  self->_didPerformAlongsideTransitions = 1;
  v3 = (void *)-[NSMutableArray copy](self->_transitionBlocks, "copy");
  transitionBlocks = self->_transitionBlocks;
  self->_transitionBlocks = 0;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)transitionAlongsideUsingBlock:(id)a3 completion:(id)a4
{
  void (**v6)(id, BOOL);
  NSMutableArray *transitionBlocks;
  NSMutableArray *v8;
  NSMutableArray *v9;
  void *v10;
  NSMutableArray *transitionCompletionBlocks;
  NSMutableArray *v12;
  NSMutableArray *v13;
  void *v14;
  void (**v15)(_QWORD);

  v15 = (void (**)(_QWORD))a3;
  v6 = (void (**)(id, BOOL))a4;
  if (self->_didPerformAlongsideTransitions)
  {
    if (v15)
      v15[2](v15);
  }
  else if (v15)
  {
    transitionBlocks = self->_transitionBlocks;
    if (!transitionBlocks)
    {
      v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v9 = self->_transitionBlocks;
      self->_transitionBlocks = v8;

      transitionBlocks = self->_transitionBlocks;
    }
    v10 = (void *)MEMORY[0x1D17E5550](v15);
    -[NSMutableArray addObject:](transitionBlocks, "addObject:", v10);

  }
  if (self->_isCompleted)
  {
    if (v6)
      v6[2](v6, self->_transitionCompletedSuccessfully);
  }
  else if (v6)
  {
    transitionCompletionBlocks = self->_transitionCompletionBlocks;
    if (!transitionCompletionBlocks)
    {
      v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v13 = self->_transitionCompletionBlocks;
      self->_transitionCompletionBlocks = v12;

      transitionCompletionBlocks = self->_transitionCompletionBlocks;
    }
    v14 = (void *)MEMORY[0x1D17E5550](v6);
    -[NSMutableArray addObject:](transitionCompletionBlocks, "addObject:", v14);

  }
}

- (BOOL)isAnimated
{
  return self->animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->animated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_transitionBlocks, 0);
}

@end
