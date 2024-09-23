@implementation UIViewLayoutFeedbackLoopDebugger

void __63___UIViewLayoutFeedbackLoopDebugger_layoutFeedbackLoopDebugger__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!qword_1ECD7B5A8)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    qword_1ECD7B5B8 = objc_msgSend(v2, "integerForKey:", CFSTR("UIViewLayoutFeedbackLoopDebuggingThreshold"));

    v3 = qword_1ECD7B5B8;
    if (qword_1ECD7B5B8)
      goto LABEL_9;
    if (_UIGetUIViewLayoutFeedbackLoopDebuggingEnabled())
    {
      qword_1ECD7B5B8 = 100;
      v4 = qword_1ECD7B5C0;
      if (!qword_1ECD7B5C0)
      {
        v4 = __UILogCategoryGetNode("LayoutLoop", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v4, (unint64_t *)&qword_1ECD7B5C0);
      }
      v5 = *(NSObject **)(v4 + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v10 = 134218754;
        v11 = 100;
        v12 = 2080;
        v13 = "UIViewLayoutFeedbackLoopDebuggingThreshold";
        v14 = 2048;
        v15 = 50;
        v16 = 2048;
        v17 = 10000;
        _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "Layout feedback loop debugging enabled via internal UI Debugging preference with a threshold of %ld. Use -%s <threshold> as a launch argument if you want a different threshold. The threshold will be clamped between %ld and %ld.", (uint8_t *)&v10, 0x2Au);
      }
    }
    v3 = qword_1ECD7B5B8;
    if (qword_1ECD7B5B8)
    {
LABEL_9:
      if (v3 <= 50)
        v3 = 50;
      if ((unint64_t)v3 >= 0x2710)
        v3 = 10000;
      qword_1ECD7B5B8 = v3;
      qword_1ECD7B5C8 = v3;
      qword_1ECD7B5D0 = 10 * v3;
      v6 = objc_alloc_init(*(Class *)(a1 + 32));
      v7 = (void *)qword_1ECD7B5A8;
      qword_1ECD7B5A8 = (uint64_t)v6;

      if (!_UIGetUIViewLayoutFeedbackLoopDebuggingEnabled())
      {
        v8 = qword_1ECD7B5D8;
        if (!qword_1ECD7B5D8)
        {
          v8 = __UILogCategoryGetNode("LayoutLoop", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v8, (unint64_t *)&qword_1ECD7B5D8);
        }
        v9 = *(NSObject **)(v8 + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = 136315394;
          v11 = (uint64_t)"UIViewLayoutFeedbackLoopDebuggingThreshold";
          v12 = 2048;
          v13 = (const char *)qword_1ECD7B5B8;
          _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Layout feedback loop debugging enabled via -%s launch argument with a threshold of %ld", (uint8_t *)&v10, 0x16u);
        }
      }
    }
  }
}

id __63___UIViewLayoutFeedbackLoopDebugger_topLevelViewHierarchyTrace__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("\n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v7 = a3;
    do
    {
      objc_msgSend(v6, "appendString:", CFSTR("|   "));
      --v7;
    }
    while (v7);
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "containsObject:", v5) & 1) != 0)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 64);
    if (!v9)
      v9 = *(void **)(v8 + 56);
    objc_msgSend(v6, "appendFormat:", CFSTR("%ld "), objc_msgSend(v9, "indexOfObject:", v5) + 1);
  }
  objc_msgSend(v5, "_lfld_description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v10);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v5, "subviews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendString:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  return v6;
}

@end
