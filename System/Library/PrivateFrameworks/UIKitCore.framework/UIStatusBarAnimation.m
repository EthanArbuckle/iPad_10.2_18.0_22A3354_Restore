@implementation UIStatusBarAnimation

void __56___UIStatusBarAnimation_prepareAnimations_forStatusBar___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = v4;
  while (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v6, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_prepareForStatusBar:preparingAnimations:exclusiveAnimations:", a1[4], a1[5], a1[6]);

    v4 = v6;
  }

}

void __56___UIStatusBarAnimation__addAnimations_toDispatchGroup___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __45___UIStatusBarAnimation_performForStatusBar___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  id v8;

  v8 = a2;
  v7 = objc_msgSend(v8, "priority");
  if (v7 <= objc_msgSend(*(id *)(a1 + 32), "priority"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v8, "performForStatusBar:", *(_QWORD *)(a1 + 40));
  }

}

void __45___UIStatusBarAnimation_performForStatusBar___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    objc_msgSend((id)_statusBarRunningAnimations, "removeObject:", *(_QWORD *)(a1 + 32));
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v3 + 10))
    {
      *(_BYTE *)(v3 + 10) = 0;
      v11 = 0u;
      v12 = 0u;
      v9 = 0u;
      v10 = 0u;
      v4 = *(id *)(*(_QWORD *)(a1 + 32) + 120);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v10;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v10 != v7)
              objc_enumerationMutation(v4);
            (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i));
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        }
        while (v6);
      }

    }
  }
}

uint64_t __45___UIStatusBarAnimation_performForStatusBar___block_invoke_3(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "Status bar animation took longer than expected and was ended early.", buf, 2u);
      }

    }
    else
    {
      v2 = _statusBarRunningAnimations_block_invoke___s_category;
      if (!_statusBarRunningAnimations_block_invoke___s_category)
      {
        v2 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v2, (unint64_t *)&_statusBarRunningAnimations_block_invoke___s_category);
      }
      v3 = *(NSObject **)(v2 + 8);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Status bar animation took longer than expected and was ended early.", v6, 2u);
      }
    }
    v4 = *(_QWORD *)(*(_QWORD *)(v1 + 32) + 112);
    if (v4)
      (*(void (**)(void))(v4 + 16))();
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

@end
