@implementation _UIContextMenuAnimator

+ (_UIContextMenuAnimator)animatorWithViewController:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;

  v3 = a3;
  v4 = (_QWORD *)objc_opt_new();
  v5 = (void *)v4[2];
  v4[2] = v3;
  v6 = v3;

  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "horizontalSizeClass") == 1;

  v4[1] = v10;
  return (_UIContextMenuAnimator *)v4;
}

- (BOOL)hasAnyActions
{
  void *v3;
  BOOL v4;
  void *v5;

  -[_UIContextMenuAnimator animations](self, "animations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[_UIContextMenuAnimator completions](self, "completions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") != 0;

  }
  return v4;
}

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
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *animations;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  _UIContextMenuAnimator *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = performAllAnimations___s_category_0;
  if (!performAllAnimations___s_category_0)
  {
    v3 = __UILogCategoryGetNode("UICMILifecycle", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&performAllAnimations___s_category_0);
  }
  v4 = *(NSObject **)(v3 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = self;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "performAllAnimations for animator: %@", buf, 0xCu);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[_UIContextMenuAnimator animations](self, "animations", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i) + 16))();
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  animations = self->_animations;
  self->_animations = 0;

}

- (void)performAllCompletions
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *completions;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  _UIContextMenuAnimator *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = performAllCompletions___s_category;
  if (!performAllCompletions___s_category)
  {
    v3 = __UILogCategoryGetNode("UICMILifecycle", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&performAllCompletions___s_category);
  }
  v4 = *(NSObject **)(v3 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = self;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "performAllCompletions for animator: %@", buf, 0xCu);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[_UIContextMenuAnimator completions](self, "completions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i) + 16))();
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  completions = self->_completions;
  self->_completions = 0;

}

- (int64_t)preferredCommitStyle
{
  return self->_preferredCommitStyle;
}

- (void)setPreferredCommitStyle:(int64_t)a3
{
  self->_preferredCommitStyle = a3;
}

- (UIViewController)previewViewController
{
  return self->_previewViewController;
}

- (NSMutableArray)animations
{
  return self->_animations;
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong((id *)&self->_previewViewController, 0);
}

@end
