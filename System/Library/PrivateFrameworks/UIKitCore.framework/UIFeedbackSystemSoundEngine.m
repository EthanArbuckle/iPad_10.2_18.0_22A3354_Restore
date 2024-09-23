@implementation UIFeedbackSystemSoundEngine

void __46___UIFeedbackSystemSoundEngine__internalQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.UIKit.FeedbackSystemSoundEngineInternal", v2);
  v1 = (void *)_MergedGlobals_7_4;
  _MergedGlobals_7_4 = (uint64_t)v0;

}

void __44___UIFeedbackSystemSoundEngine_sharedEngine__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECD7B160;
  qword_1ECD7B160 = (uint64_t)v1;

}

uint64_t __79___UIFeedbackSystemSoundEngine__internal_performForEachSSIDsInFeedbacks_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64___UIFeedbackSystemSoundEngine__internal_startWarmingFeedbacks___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  unint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "_internal_isSuspended");
  v6 = *(_QWORD *)(a1 + 32);
  if ((v5 & 1) != 0)
  {
    v7 = *(void **)(v6 + 112);
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3550], "set");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 112);
      *(_QWORD *)(v9 + 112) = v8;

      v7 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
    }
  }
  else
  {
    if (!objc_msgSend(*(id *)(v6 + 104), "countForObject:", v4))
    {
      v11 = objc_msgSend(*(id *)(a1 + 32), "_internal_prepareSystemSoundID:forBeingActive:", a2, 1);
      if (!_UIFeedbackLoggingDisabled)
      {
        v12 = v11;
        v13 = CoreHapticsErrorDomain_block_invoke___s_category;
        if (!CoreHapticsErrorDomain_block_invoke___s_category)
        {
          v13 = __UILogCategoryGetNode("FeedbackDebug", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v13, (unint64_t *)&CoreHapticsErrorDomain_block_invoke___s_category);
        }
        if ((*(_BYTE *)v13 & 1) != 0)
        {
          v14 = *(NSObject **)(v13 + 8);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v15 = CFSTR("NO");
            if (v12)
              v15 = CFSTR("YES");
            v16 = 134218242;
            v17 = a2;
            v18 = 2112;
            v19 = v15;
            _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "activated SSID %ld success: %@", (uint8_t *)&v16, 0x16u);
          }
        }
      }
    }
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  }
  objc_msgSend(v7, "addObject:", v4);

}

void __63___UIFeedbackSystemSoundEngine__internal_stopWarmingFeedbacks___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  char v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "_internal_isSuspended");
  v6 = *(_QWORD *)(a1 + 32);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(v6 + 112), "removeObject:", v4);
  }
  else
  {
    objc_msgSend(*(id *)(v6 + 104), "removeObject:", v4);
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "countForObject:", v4))
    {
      objc_msgSend(*(id *)(a1 + 32), "_internal_prepareSystemSoundID:forBeingActive:", a2, 0);
      if (!_UIFeedbackLoggingDisabled)
      {
        v7 = CoreHapticsErrorDomain_block_invoke_2___s_category;
        if (!CoreHapticsErrorDomain_block_invoke_2___s_category)
        {
          v7 = __UILogCategoryGetNode("FeedbackDebug", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v7, (unint64_t *)&CoreHapticsErrorDomain_block_invoke_2___s_category);
        }
        if ((*(_BYTE *)v7 & 1) != 0)
        {
          v8 = *(NSObject **)(v7 + 8);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            v9 = 134217984;
            v10 = a2;
            _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "deactivated SSID %ld", (uint8_t *)&v9, 0xCu);
          }
        }
      }
    }
  }

}

uint64_t __53___UIFeedbackSystemSoundEngine__playFeedback_atTime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_playFeedbackData:forFeedback:atTime:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
}

void __78___UIFeedbackSystemSoundEngine__internal_playFeedbackData_forFeedback_atTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v10);

}

void __78___UIFeedbackSystemSoundEngine__internal_playFeedbackData_forFeedback_atTime___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_internal_playFeedbackDataNow:forFeedback:withOptions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 48), "systemSoundSources");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

}

uint64_t __46___UIFeedbackSystemSoundEngine__stopFeedback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_stopFeedbackData:forFeedback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
