@implementation UIDruidSourceConnection

uint64_t __32___UIDruidSourceConnection_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __32___UIDruidSourceConnection_init__block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  id WeakRetained;
  void *v5;
  uint8_t v6[16];

  v2 = kOutstandingItemsCountKey_block_invoke_2___s_category;
  if (!kOutstandingItemsCountKey_block_invoke_2___s_category)
  {
    v2 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&kOutstandingItemsCountKey_block_invoke_2___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "_UIDruidSourceConnection connection invalidated", v6, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_internalDragFailed");

}

void __66___UIDruidSourceConnection_beginDragWithConfiguration_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD v3[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[UIApplication _systemAnimationFenceExemptQueue](UIApplication, "_systemAnimationFenceExemptQueue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __66___UIDruidSourceConnection_beginDragWithConfiguration_completion___block_invoke_2;
    v3[3] = &unk_1E16B1B28;
    v3[4] = WeakRetained;
    objc_msgSend(v2, "performAsync:", v3);

  }
}

void __66___UIDruidSourceConnection_beginDragWithConfiguration_completion___block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = kOutstandingItemsCountKey_block_invoke_3___s_category;
  if (!kOutstandingItemsCountKey_block_invoke_3___s_category)
  {
    v2 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&kOutstandingItemsCountKey_block_invoke_3___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "%@ timed out. Cancelling drag.", (uint8_t *)&v7, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "cancelDrag");
  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 16));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = 0;

}

void __66___UIDruidSourceConnection_beginDragWithConfiguration_completion___block_invoke_545(uint64_t a1, unsigned int a2, void *a3)
{
  id v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  unsigned int v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = kOutstandingItemsCountKey_block_invoke_4___s_category;
  if (!kOutstandingItemsCountKey_block_invoke_4___s_category)
  {
    v6 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v6, (unint64_t *)&kOutstandingItemsCountKey_block_invoke_4___s_category);
  }
  v7 = *(NSObject **)(v6 + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v16 = a2;
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "_UIDruidSourceConnection beginDragWithTouches:items:completion: got replyHandler with sessionID %ld", buf, 0xCu);
  }
  +[UIApplication _systemAnimationFenceExemptQueue](UIApplication, "_systemAnimationFenceExemptQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66___UIDruidSourceConnection_beginDragWithConfiguration_completion___block_invoke_546;
  v10[3] = &unk_1E16C4610;
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v13 = *(id *)(a1 + 48);
  v14 = a2;
  v12 = *(id *)(a1 + 40);
  v9 = v5;
  objc_msgSend(v8, "performAsync:", v10);

}

void __66___UIDruidSourceConnection_beginDragWithConfiguration_completion___block_invoke_546(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 16);
  if (v3)
  {
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_storeStrong((id *)(v2 + 24), *(id *)(a1 + 40));
  v6 = *(_QWORD *)(a1 + 56);
  if (*(_QWORD *)(a1 + 40))
  {
    v7 = *(unsigned int *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 48), "itemCollection");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v7, v8);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v6 + 16))(*(_QWORD *)(a1 + 56), 0, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
  }
}

void __66___UIDruidSourceConnection_beginDragWithConfiguration_completion___block_invoke_2_548(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = kOutstandingItemsCountKey_block_invoke_5___s_category;
  if (!kOutstandingItemsCountKey_block_invoke_5___s_category)
  {
    v4 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v4, (unint64_t *)&kOutstandingItemsCountKey_block_invoke_5___s_category);
  }
  v5 = *(NSObject **)(v4 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "_UIDruidSourceConnection got error handler with error %@", buf, 0xCu);
  }
  +[UIApplication _systemAnimationFenceExemptQueue](UIApplication, "_systemAnimationFenceExemptQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66___UIDruidSourceConnection_beginDragWithConfiguration_completion___block_invoke_549;
  v8[3] = &unk_1E16B2F48;
  v7 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  objc_msgSend(v6, "performAsync:", v8);

}

uint64_t __66___UIDruidSourceConnection_beginDragWithConfiguration_completion___block_invoke_549(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
}

void __65___UIDruidSourceConnection_requestDragPreviewsForIndexSet_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);
  uint64_t v4;
  unint64_t v5;
  NSObject *v6;
  uint8_t v7[8];
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "dragPreviewProviderBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "dragPreviewProviderBlock");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65___UIDruidSourceConnection_requestDragPreviewsForIndexSet_reply___block_invoke_2;
    v8[3] = &unk_1E16C4688;
    v4 = *(_QWORD *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    ((void (**)(_QWORD, uint64_t, _QWORD *))v3)[2](v3, v4, v8);

  }
  else
  {
    v5 = kOutstandingItemsCountKey_block_invoke_6___s_category;
    if (!kOutstandingItemsCountKey_block_invoke_6___s_category)
    {
      v5 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&kOutstandingItemsCountKey_block_invoke_6___s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "Source has no dragPreviewProviderBlock yet; we assume druid will retry",
        v7,
        2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __65___UIDruidSourceConnection_requestDragPreviewsForIndexSet_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __48___UIDruidSourceConnection_updatedPresentation___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "updatedPresentationBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "updatedPresentationBlock");
    v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40));

  }
}

void __63___UIDruidSourceConnection_canHandOffCancelledItems_withReply___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);
  uint64_t v4;
  id v5;
  id v6;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
  objc_msgSend(*(id *)(a1 + 32), "canHandOffCancelledItemsBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "canHandOffCancelledItemsBlock");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 0;
    ((void (**)(_QWORD, uint64_t, id *))v3)[2](v3, v4, &v6);
    v5 = v6;

  }
  else
  {
    v5 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __60___UIDruidSourceConnection_handOffCancelledItems_withFence___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "handOffCancelledItemsBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "handOffCancelledItemsBlock");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

void __51___UIDruidSourceConnection_dragEndedWithOperation___block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL8 v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "dragCompletionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40) == 0;
    objc_msgSend(*(id *)(a1 + 32), "dragCompletionBlock");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, v3, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "setDragCompletionBlock:", 0);
  }
  if (!*(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
}

uint64_t __55___UIDruidSourceConnection_dataTransferSessionFinished__block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "dataTransferFinishedBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataTransferFinishedBlock");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

    objc_msgSend(*(id *)(a1 + 32), "setDataTransferFinishedBlock:", 0);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
}

uint64_t __47___UIDruidSourceConnection__internalDragFailed__block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "dragCompletionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "dragCompletionBlock");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, 2, 0);

    objc_msgSend(*(id *)(a1 + 32), "setDragCompletionBlock:", 0);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
}

@end
