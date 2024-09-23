@implementation _UITableViewDropAnimation

- (_UITableViewDropAnimation)initWithDragItem:(id)a3
{
  id v5;
  _UITableViewDropAnimation *v6;
  _UITableViewDropAnimation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UITableViewDropAnimation;
  v6 = -[_UITableViewDropAnimation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dragItem, a3);

  return v7;
}

- (void)addAnimations:(id)a3
{
  id v4;
  NSMutableArray *animationsBlocks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *aBlock;

  v4 = a3;
  animationsBlocks = self->_animationsBlocks;
  aBlock = v4;
  if (!animationsBlocks)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_animationsBlocks;
    self->_animationsBlocks = v6;

    v4 = aBlock;
    animationsBlocks = self->_animationsBlocks;
  }
  v8 = _Block_copy(v4);
  -[NSMutableArray addObject:](animationsBlocks, "addObject:", v8);

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
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_completionBlocks;
    self->_completionBlocks = v6;

    v4 = aBlock;
    completionBlocks = self->_completionBlocks;
  }
  v8 = _Block_copy(v4);
  -[NSMutableArray addObject:](completionBlocks, "addObject:", v8);

}

- (void)_addClientBlocksToAnimator:(id)a3
{
  id v4;
  NSMutableArray *animationsBlocks;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *completionBlocks;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  animationsBlocks = self->_animationsBlocks;
  if (animationsBlocks)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = animationsBlocks;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v4, "addAnimations:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v8);
    }

    -[NSMutableArray removeAllObjects](self->_animationsBlocks, "removeAllObjects");
  }
  completionBlocks = self->_completionBlocks;
  if (completionBlocks)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = completionBlocks;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(v4, "addCompletion:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), (_QWORD)v17);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v14);
    }

    -[NSMutableArray removeAllObjects](self->_completionBlocks, "removeAllObjects");
  }

}

- (void)_executeCompletionBlocks
{
  NSMutableArray *completionBlocks;
  NSMutableArray *v4;
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
  completionBlocks = self->_completionBlocks;
  if (completionBlocks)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = completionBlocks;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    -[NSMutableArray removeAllObjects](self->_completionBlocks, "removeAllObjects", (_QWORD)v9);
  }
}

- (UIDragItem)dragItem
{
  return self->_dragItem;
}

- (void)setDragItem:(id)a3
{
  objc_storeStrong((id *)&self->_dragItem, a3);
}

- (BOOL)_didBeginAnimation
{
  return self->_didBeginAnimation;
}

- (void)_setDidBeginAnimation:(BOOL)a3
{
  self->_didBeginAnimation = a3;
}

- (NSMutableArray)animationsBlocks
{
  return self->_animationsBlocks;
}

- (void)setAnimationsBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_animationsBlocks, a3);
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
  objc_storeStrong((id *)&self->_animationsBlocks, 0);
  objc_storeStrong((id *)&self->_dragItem, 0);
}

@end
