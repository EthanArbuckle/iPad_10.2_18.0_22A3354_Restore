@implementation _UIGroupCompletion

- (void)addCompletion:(id)a3
{
  -[_UIGroupCompletion addNonIncrementingCompletion:](self, "addNonIncrementingCompletion:", a3);
  -[_UIGroupCompletion increment](self, "increment");
}

- (void)addNonIncrementingCompletion:(id)a3
{
  id v4;
  NSMutableArray *completions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *aBlock;

  v4 = a3;
  completions = self->_completions;
  aBlock = v4;
  if (!completions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_completions;
    self->_completions = v6;

    v4 = aBlock;
    completions = self->_completions;
  }
  v8 = _Block_copy(v4);
  -[NSMutableArray addObject:](completions, "addObject:", v8);

}

- (void)increment
{
  ++self->_refCount;
}

- (void)complete
{
  unint64_t refCount;
  unint64_t v3;

  refCount = self->_refCount;
  if (refCount)
  {
    v3 = refCount - 1;
    self->_refCount = v3;
    if (!v3)
      -[_UIGroupCompletion _performAllCompletions](self, "_performAllCompletions");
  }
}

- (void)completeImmediately
{
  self->_refCount = 0;
  -[_UIGroupCompletion _performAllCompletions](self, "_performAllCompletions");
}

- (void)_performAllCompletions
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *completions;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_completions;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  completions = self->_completions;
  self->_completions = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
}

@end
