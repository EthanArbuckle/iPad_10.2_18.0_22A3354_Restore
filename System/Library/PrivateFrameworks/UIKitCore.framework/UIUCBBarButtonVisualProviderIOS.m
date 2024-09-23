@implementation UIUCBBarButtonVisualProviderIOS

void __59___UIUCBBarButtonVisualProviderIOS__defaultTitleAttributes__block_invoke()
{
  id v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init((Class)off_1E1679BC0);
  objc_msgSend(v0, "setLineBreakMode:", 4);
  objc_msgSend(v0, "setAlignment:", 4);
  v1 = objc_alloc_init((Class)off_1E1679CA0);
  objc_msgSend(v1, "setShadowOffset:", 0.0, -1.0);
  objc_msgSend(v1, "setShadowColor:", 0);
  objc_msgSend(v1, "setShadowBlurRadius:", 0.0);
  v7[0] = *(_QWORD *)off_1E1678D90;
  objc_msgSend(off_1E167A828, "systemFontOfSize:", 17.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)off_1E1678F98;
  v8[0] = v2;
  v8[1] = v0;
  v4 = *(_QWORD *)off_1E1679048;
  v7[1] = v3;
  v7[2] = v4;
  v8[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_MergedGlobals_13;
  _MergedGlobals_13 = v5;

}

uint64_t __70___UIUCBBarButtonVisualProviderIOS__configureImageOrTitleFromBarItem___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "resolvedStyleForStyle:", a2);
}

void __70___UIUCBBarButtonVisualProviderIOS__configureImageOrTitleFromBarItem___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16[2];

  v7 = a3;
  v8 = a4;
  dispatch_get_global_queue(33, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70___UIUCBBarButtonVisualProviderIOS__configureImageOrTitleFromBarItem___block_invoke_3;
  block[3] = &unk_1E16B5A00;
  v16[1] = a2;
  v13 = v7;
  v14 = *(id *)(a1 + 32);
  v15 = v8;
  v10 = v8;
  v11 = v7;
  objc_copyWeak(v16, (id *)(a1 + 40));
  dispatch_async(v9, block);

  objc_destroyWeak(v16);
}

void __70___UIUCBBarButtonVisualProviderIOS__configureImageOrTitleFromBarItem___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD block[4];
  id v4;
  id v5;
  id v6;

  +[_UIConcretePasteboard _remoteContentForLayerContextWithId:slotStyle:pasteButtonTag:](_UIConcretePasteboard, "_remoteContentForLayerContextWithId:slotStyle:pasteButtonTag:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70___UIUCBBarButtonVisualProviderIOS__configureImageOrTitleFromBarItem___block_invoke_4;
    block[3] = &unk_1E16B59D8;
    v5 = *(id *)(a1 + 48);
    v4 = v2;
    objc_copyWeak(&v6, (id *)(a1 + 56));
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v6);

  }
}

void __70___UIUCBBarButtonVisualProviderIOS__configureImageOrTitleFromBarItem___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "updateSecureButton");

  }
}

id __46___UIUCBBarButtonVisualProviderIOS_updateMenu__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id *v5;
  id WeakRetained;
  void *v7;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  void *v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained(v5);
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, WeakRetained, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        v20 = objc_loadWeakRetained(v5);
        *(_DWORD *)buf = 138412290;
        v28 = v20;
        _os_log_fault_impl(&dword_185066000, v19, OS_LOG_TYPE_FAULT, "Client configured a bar button item (%@) with a secondaryActionsProvider and secondaryActionsArePrimary=YES, but failed to return a menu, Substituting a dummy menu.", buf, 0xCu);

      }
    }
    else
    {
      v9 = UIDictationInputModeInvocationSourceGenerativeField_block_invoke___s_category;
      if (!UIDictationInputModeInvocationSourceGenerativeField_block_invoke___s_category)
      {
        v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v9, (unint64_t *)&UIDictationInputModeInvocationSourceGenerativeField_block_invoke___s_category);
      }
      v10 = *(NSObject **)(v9 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = v10;
        v12 = objc_loadWeakRetained(v5);
        *(_DWORD *)buf = 138412290;
        v28 = v12;
        _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Client configured a bar button item (%@) with a secondaryActionsProvider and secondaryActionsArePrimary=YES, but failed to return a menu, Substituting a dummy menu.", buf, 0xCu);

      }
    }
    v13 = objc_loadWeakRetained(v5);
    objc_msgSend(v13, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_loadWeakRetained(v5);
    objc_msgSend(v15, "image");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __46___UIUCBBarButtonVisualProviderIOS_updateMenu__block_invoke_83;
    v24 = &unk_1E16B58D0;
    objc_copyWeak(&v25, v5);
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v14, v16, 0, &v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1, v21, v22, v23, v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v25);
  }

  return v7;
}

void __46___UIUCBBarButtonVisualProviderIOS_updateMenu__block_invoke_83(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_triggerActionForEvent:", 0);

}

id __46___UIUCBBarButtonVisualProviderIOS_updateMenu__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, WeakRetained, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __46___UIUCBBarButtonVisualProviderIOS_updateMenu__block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end
