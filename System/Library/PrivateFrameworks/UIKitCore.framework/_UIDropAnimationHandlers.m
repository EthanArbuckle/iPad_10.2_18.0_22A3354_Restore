@implementation _UIDropAnimationHandlers

- (_UIDropAnimationHandlers)init
{
  _UIDropAnimationHandlers *v2;
  NSMutableArray *v3;
  NSMutableArray *alongsideAnimationHandlers;
  NSMutableArray *v5;
  NSMutableArray *completionHandlers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIDropAnimationHandlers;
  v2 = -[_UIDropAnimationHandlers init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    alongsideAnimationHandlers = v2->_alongsideAnimationHandlers;
    v2->_alongsideAnimationHandlers = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = v5;

  }
  return v2;
}

- (void)invokeAllCompletionHandlers
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_completionHandlers;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)resetAllAnimationHandlers
{
  -[NSMutableArray removeAllObjects](self->_alongsideAnimationHandlers, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_completionHandlers, "removeAllObjects");
}

- (NSArray)alongsideAnimationHandlers
{
  return (NSArray *)self->_alongsideAnimationHandlers;
}

- (NSArray)completionHandlers
{
  return (NSArray *)self->_completionHandlers;
}

- (void)addAnimations:(id)a3
{
  NSMutableArray *alongsideAnimationHandlers;
  void *v4;
  id v5;

  if (a3)
  {
    alongsideAnimationHandlers = self->_alongsideAnimationHandlers;
    v5 = (id)objc_msgSend(a3, "copy");
    v4 = _Block_copy(v5);
    -[NSMutableArray addObject:](alongsideAnimationHandlers, "addObject:", v4);

  }
}

- (void)addCompletion:(id)a3
{
  NSMutableArray *completionHandlers;
  void *v4;
  id v5;

  if (a3)
  {
    completionHandlers = self->_completionHandlers;
    v5 = (id)objc_msgSend(a3, "copy");
    v4 = _Block_copy(v5);
    -[NSMutableArray addObject:](completionHandlers, "addObject:", v4);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_alongsideAnimationHandlers, 0);
}

@end
