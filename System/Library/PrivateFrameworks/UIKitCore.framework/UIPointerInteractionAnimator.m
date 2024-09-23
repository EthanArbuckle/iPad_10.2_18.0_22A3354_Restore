@implementation UIPointerInteractionAnimator

- (void)addAnimations:(id)a3
{
  id v4;
  NSMutableArray *animations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *aBlock;

  v4 = a3;
  animations = self->_animations;
  aBlock = v4;
  if (!animations)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_animations;
    self->_animations = v6;

    v4 = aBlock;
    animations = self->_animations;
  }
  v8 = _Block_copy(v4);
  -[NSMutableArray addObject:](animations, "addObject:", v8);

}

- (void)addCompletion:(id)a3
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

- (void)performAllAnimations
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSMutableArray *animations;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = performAllAnimations___s_category;
  if (!performAllAnimations___s_category)
  {
    v3 = __UILogCategoryGetNode("UIPointerInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&performAllAnimations___s_category);
  }
  v4 = *(NSObject **)(v3 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    -[UIPointerInteractionAnimator debugName](self, "debugName");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = &stru_1E16EDF20;
    if (v6)
      v8 = (const __CFString *)v6;
    *(_DWORD *)buf = 138412290;
    v21 = v8;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "performAllAnimations called on animator: %@", buf, 0xCu);

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UIPointerInteractionAnimator animations](self, "animations", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i) + 16))();
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  animations = self->_animations;
  self->_animations = 0;

}

- (void)performAllCompletions:(BOOL)a3
{
  unint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSMutableArray *completions;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = performAllCompletions____s_category;
  if (!performAllCompletions____s_category)
  {
    v4 = __UILogCategoryGetNode("UIPointerInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v4, (unint64_t *)&performAllCompletions____s_category);
  }
  v5 = *(NSObject **)(v4 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    NSStringFromBOOL();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPointerInteractionAnimator debugName](self, "debugName");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = &stru_1E16EDF20;
    if (v8)
      v10 = (const __CFString *)v8;
    *(_DWORD *)buf = 138412546;
    v23 = v7;
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "performAllCompletions: %@ called on animator: %@", buf, 0x16u);

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[UIPointerInteractionAnimator completions](self, "completions", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i) + 16))();
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

  completions = self->_completions;
  self->_completions = 0;

}

- (NSString)debugName
{
  return self->_debugName;
}

- (void)setDebugName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMutableArray)animations
{
  return self->_animations;
}

- (void)setAnimations:(id)a3
{
  objc_storeStrong((id *)&self->_animations, a3);
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (void)setCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_completions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong((id *)&self->_debugName, 0);
}

@end
