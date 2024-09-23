@implementation UIFeedbackCoreHapticsEngine

void __88___UIFeedbackCoreHapticsEngine__internal_coreHapticsEngineFinishedWithError_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  _QWORD block[5];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      v4 = qword_1ECD7A9B0;
      if (!qword_1ECD7A9B0)
      {
        v4 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v4, (unint64_t *)&qword_1ECD7A9B0);
      }
      v5 = *(NSObject **)(v4 + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = (void *)MEMORY[0x1E0CB3940];
        v7 = *(id *)(a1 + 32);
        v8 = v5;
        objc_msgSend(v6, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v7), v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138412546;
        v24 = v9;
        v25 = 2112;
        v26 = v3;
        v10 = "core haptics engine stopped for %@ with error: %@";
        v11 = v8;
        v12 = OS_LOG_TYPE_ERROR;
        v13 = 22;
LABEL_12:
        _os_log_impl(&dword_185066000, v11, v12, v10, buf, v13);

      }
    }
  }
  else if (!_UIFeedbackLoggingDisabled)
  {
    v14 = qword_1ECD7A9B8;
    if (!qword_1ECD7A9B8)
    {
      v14 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v14, (unint64_t *)&qword_1ECD7A9B8);
    }
    v15 = *(NSObject **)(v14 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      v17 = *(id *)(a1 + 32);
      v8 = v15;
      objc_msgSend(v16, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v17), v17);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412290;
      v24 = v9;
      v10 = "core haptics engine STOPPED for %@";
      v11 = v8;
      v12 = OS_LOG_TYPE_DEFAULT;
      v13 = 12;
      goto LABEL_12;
    }
  }
  objc_msgSend((id)objc_opt_class(), "_internalQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88___UIFeedbackCoreHapticsEngine__internal_coreHapticsEngineFinishedWithError_completion___block_invoke_17;
  block[3] = &unk_1E16B1B28;
  block[4] = *(_QWORD *)(a1 + 32);
  v19 = v18;
  if (!v18)
  {
    v19 = MEMORY[0x1E0C80D38];
    v20 = MEMORY[0x1E0C80D38];
  }
  v21 = v18;
  dispatch_async(v19, block);

}

uint64_t __91___UIFeedbackCoreHapticsEngine__internal_teardownUnderlyingPlayerIfPossibleWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD block[5];
  id v12;
  id v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend((id)objc_opt_class(), "_internalQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91___UIFeedbackCoreHapticsEngine__internal_teardownUnderlyingPlayerIfPossibleWithCompletion___block_invoke_2;
    block[3] = &unk_1E16BAD68;
    block[4] = WeakRetained;
    v12 = v3;
    v13 = *(id *)(a1 + 40);
    v6 = v5;
    if (!v5)
    {
      v6 = MEMORY[0x1E0C80D38];
      v7 = MEMORY[0x1E0C80D38];
    }
    v8 = v5;
    dispatch_async(v6, block);

    v9 = 2;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

void __83___UIFeedbackCoreHapticsEngine__internal_startRunningFeedbackPlayerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83___UIFeedbackCoreHapticsEngine__internal_startRunningFeedbackPlayerWithCompletion___block_invoke_2;
  block[3] = &unk_1E16BAD68;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v12 = v3;
  v13 = v5;
  v14 = v6;
  v7 = v4;
  if (!v4)
  {
    v7 = MEMORY[0x1E0C80D38];
    v8 = MEMORY[0x1E0C80D38];
  }
  v9 = v4;
  v10 = v3;
  dispatch_async(v7, block);

}

void __80___UIFeedbackCoreHapticsEngine__internal_prewarmUnderlyingPlayerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "_internalQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80___UIFeedbackCoreHapticsEngine__internal_prewarmUnderlyingPlayerWithCompletion___block_invoke_2;
  block[3] = &unk_1E16BAD68;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v12 = v3;
  v13 = v5;
  v14 = v6;
  v7 = v4;
  if (!v4)
  {
    v7 = MEMORY[0x1E0C80D38];
    v8 = MEMORY[0x1E0C80D38];
  }
  v9 = v4;
  v10 = v3;
  dispatch_async(v7, block);

}

uint64_t __91___UIFeedbackCoreHapticsEngine__internal_teardownUnderlyingPlayerIfPossibleWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void (**v9)(void);
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 104);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(id *)(*((_QWORD *)&v11 + 1) + 8 * v6);
        objc_msgSend(v7, "invalidationBlock", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_msgSend(v7, "invalidationBlock");
          v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v9[2]();

          objc_msgSend(v7, "setInvalidationBlock:", 0);
        }

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeAllObjects");
  return objc_msgSend(*(id *)(a1 + 32), "_internal_coreHapticsEngineFinishedWithError:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __83___UIFeedbackCoreHapticsEngine__internal_startRunningFeedbackPlayerWithCompletion___block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t (*v9)(void);
  void *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32)
    || (objc_msgSend(*(id *)(a1 + 40), "coreHapticsEngine"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        !v10))
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      v2 = qword_1ECD7A9D8;
      if (!qword_1ECD7A9D8)
      {
        v2 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v2, (unint64_t *)&qword_1ECD7A9D8);
      }
      v3 = *(NSObject **)(v2 + 8);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v4 = (void *)MEMORY[0x1E0CB3940];
        v5 = *(id *)(a1 + 40);
        v6 = v3;
        objc_msgSend(v4, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v5), v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v19 = v7;
        v20 = 2112;
        v21 = v8;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "failed to start core haptics engine for %@: %@", buf, 0x16u);

      }
    }
    objc_msgSend(*(id *)(a1 + 40), "_internal_resetCoreHapticsEngine");
    v9 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      v11 = qword_1ECD7A9D0;
      if (!qword_1ECD7A9D0)
      {
        v11 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v11, (unint64_t *)&qword_1ECD7A9D0);
      }
      v12 = *(NSObject **)(v11 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        v14 = *(id *)(a1 + 40);
        v15 = v12;
        objc_msgSend(v13, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v14), v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138412290;
        v19 = v16;
        _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_DEFAULT, "core haptics engine STARTED for %@", buf, 0xCu);

      }
    }
    v9 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  return v9();
}

uint64_t __80___UIFeedbackCoreHapticsEngine__internal_prewarmUnderlyingPlayerWithCompletion___block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t (*v9)(void);
  unint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      v2 = qword_1ECD7A9C8;
      if (!qword_1ECD7A9C8)
      {
        v2 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v2, (unint64_t *)&qword_1ECD7A9C8);
      }
      v3 = *(NSObject **)(v2 + 8);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v4 = (void *)MEMORY[0x1E0CB3940];
        v5 = *(id *)(a1 + 40);
        v6 = v3;
        objc_msgSend(v4, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v5), v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v18 = v7;
        v19 = 2112;
        v20 = v8;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "failed to prewarm core haptics engine for %@: %@", buf, 0x16u);

      }
    }
    objc_msgSend(*(id *)(a1 + 40), "_internal_resetCoreHapticsEngine");
    v9 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      v10 = qword_1ECD7A9C0;
      if (!qword_1ECD7A9C0)
      {
        v10 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v10, (unint64_t *)&qword_1ECD7A9C0);
      }
      v11 = *(NSObject **)(v10 + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)MEMORY[0x1E0CB3940];
        v13 = *(id *)(a1 + 40);
        v14 = v11;
        objc_msgSend(v12, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v13), v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138412290;
        v18 = v15;
        _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_DEFAULT, "engine prewarmed for %@", buf, 0xCu);

      }
    }
    v9 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  return v9();
}

uint64_t __88___UIFeedbackCoreHapticsEngine__internal_coreHapticsEngineFinishedWithError_completion___block_invoke_17(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_teardownBackgroundTask");
}

void __91___UIFeedbackCoreHapticsEngine__internal_dequeueReusableFeedbackPlayerWithCompletionBlock___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  _UIFeedbackCoreHapticsPlayer *v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  _UIFeedbackCoreHapticsPlayer *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "coreHapticsEngine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3
      && (v4 = -[_UIFeedbackCoreHapticsPlayer initWithEngine:]([_UIFeedbackCoreHapticsPlayer alloc], "initWithEngine:", *(_QWORD *)(a1 + 32))) != 0)
    {
      v11 = v4;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addObject:");
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    else
    {
      if (!_UIFeedbackLoggingDisabled)
      {
        v5 = hapticEngineCreationBlock_block_invoke_6___s_category;
        if (!hapticEngineCreationBlock_block_invoke_6___s_category)
        {
          v5 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v5, (unint64_t *)&hapticEngineCreationBlock_block_invoke_6___s_category);
        }
        v6 = *(NSObject **)(v5 + 8);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v7 = (void *)MEMORY[0x1E0CB3940];
          v8 = *(id *)(a1 + 32);
          v9 = v6;
          objc_msgSend(v7, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v8), v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          *(_DWORD *)buf = 138412290;
          v13 = v10;
          _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "failed to dequeue _UIFeedbackCoreHapticsPlayer for %@", buf, 0xCu);

        }
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  }
}

void __46___UIFeedbackCoreHapticsEngine__internalQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.UIKit.FeedbackCoreHapticsEngineInternal", v2);
  v1 = (void *)qword_1ECD7A968;
  qword_1ECD7A968 = (uint64_t)v0;

}

void __44___UIFeedbackCoreHapticsEngine_sharedEngine__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECD7A980;
  qword_1ECD7A980 = (uint64_t)v1;

}

uint64_t __55___UIFeedbackCoreHapticsEngine__resetCoreHapticsEngine__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_resetCoreHapticsEngine");
}

uint64_t __67___UIFeedbackCoreHapticsEngine__coreHapticsEngineStoppedForReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_coreHapticsEngineStoppedForReason:", *(_QWORD *)(a1 + 40));
}

void __65___UIFeedbackCoreHapticsEngine__internal_createCoreHapticsEngine__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  unint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      v4 = hapticEngineCreationBlock_block_invoke___s_category;
      if (!hapticEngineCreationBlock_block_invoke___s_category)
      {
        v4 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v4, (unint64_t *)&hapticEngineCreationBlock_block_invoke___s_category);
      }
      v5 = *(NSObject **)(v4 + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = (void *)MEMORY[0x1E0CB3940];
        v7 = WeakRetained;
        v8 = v5;
        objc_msgSend(v6, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v7), v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138412546;
        v11 = v9;
        v12 = 2048;
        v13 = a2;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "core haptics engine stopped for %@ reason: %ld", buf, 0x16u);

      }
    }
    objc_msgSend(WeakRetained, "_coreHapticsEngineStoppedForReason:", a2);
  }

}

void __65___UIFeedbackCoreHapticsEngine__internal_createCoreHapticsEngine__block_invoke_12(uint64_t a1)
{
  id WeakRetained;
  unint64_t v2;
  NSObject *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      v2 = hapticEngineCreationBlock_block_invoke_2___s_category;
      if (!hapticEngineCreationBlock_block_invoke_2___s_category)
      {
        v2 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v2, (unint64_t *)&hapticEngineCreationBlock_block_invoke_2___s_category);
      }
      v3 = *(NSObject **)(v2 + 8);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = (void *)MEMORY[0x1E0CB3940];
        v5 = WeakRetained;
        v6 = v3;
        objc_msgSend(v4, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v5), v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138412290;
        v9 = v7;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "core haptics engine reset for %@", buf, 0xCu);

      }
    }
    objc_msgSend(WeakRetained, "_resetCoreHapticsEngine");
  }

}

@end
