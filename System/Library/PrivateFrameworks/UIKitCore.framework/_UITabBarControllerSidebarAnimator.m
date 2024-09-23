@implementation _UITabBarControllerSidebarAnimator

- (void)addAnimations:(id)a3
{
  id v4;
  NSMutableArray *animationBlocks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *aBlock;

  v4 = a3;
  animationBlocks = self->_animationBlocks;
  aBlock = v4;
  if (!animationBlocks)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_animationBlocks;
    self->_animationBlocks = v6;

    v4 = aBlock;
    animationBlocks = self->_animationBlocks;
  }
  v8 = _Block_copy(v4);
  -[NSMutableArray addObject:](animationBlocks, "addObject:", v8);

}

- (void)addCompletion:(id)a3
{
  id v4;
  NSMutableArray *completionBlocks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *aBlock;

  v4 = a3;
  completionBlocks = self->_completionBlocks;
  aBlock = v4;
  if (!completionBlocks)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_completionBlocks;
    self->_completionBlocks = v6;

    v4 = aBlock;
    completionBlocks = self->_completionBlocks;
  }
  v8 = _Block_copy(v4);
  -[NSMutableArray addObject:](completionBlocks, "addObject:", v8);

}

- (void)runAnimations
{
  void *v3;
  NSMutableArray *animationBlocks;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableArray copy](self->_animationBlocks, "copy");
  animationBlocks = self->_animationBlocks;
  self->_animationBlocks = 0;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)runCompletions
{
  void *v3;
  NSMutableArray *completionBlocks;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableArray copy](self->_completionBlocks, "copy");
  completionBlocks = self->_completionBlocks;
  self->_completionBlocks = 0;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSMutableArray)animationBlocks
{
  return self->_animationBlocks;
}

- (void)setAnimationBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_animationBlocks, a3);
}

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (void)setCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_completionBlocks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_animationBlocks, 0);
}

@end
