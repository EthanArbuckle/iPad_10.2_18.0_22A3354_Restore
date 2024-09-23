@implementation UISceneScheduleNonOpenInPlaceURLResolution

void ___UISceneScheduleNonOpenInPlaceURLResolution_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        v9 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v14 = v9;
        _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Scene session does not have a scene: session: %@", buf, 0xCu);
      }

    }
    else
    {
      v5 = audit_stringFileProvider_block_invoke___s_category;
      if (!audit_stringFileProvider_block_invoke___s_category)
      {
        v5 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v5, (unint64_t *)&audit_stringFileProvider_block_invoke___s_category);
      }
      v6 = *(NSObject **)(v5 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v14 = v7;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Scene session does not have a scene: session: %@", buf, 0xCu);
      }
    }
  }
  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = ___UISceneScheduleNonOpenInPlaceURLResolution_block_invoke_72;
  v10[3] = &unk_1E16E6CC0;
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 32);
  _UIApplicationResolveURLUsingModalProgressControllerForNonOpenInPlaceBookmarkableString(v3, v4, v10);

}

void ___UISceneScheduleNonOpenInPlaceURLResolution_block_invoke_72(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  UIOpenURLContext *v6;

  v3 = a2;
  v6 = -[UIOpenURLContext initWithURL:options:]([UIOpenURLContext alloc], "initWithURL:options:", v3, *(_QWORD *)(a1 + 32));

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _UISceneSendOpenURLActionCallbackForScene(v4, v5);

}

@end
