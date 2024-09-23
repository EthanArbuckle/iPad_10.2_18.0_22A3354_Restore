@implementation UIDragManager

void __42___UIDragManager_initializeDraggingSystem__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_1139;
  _MergedGlobals_1139 = v0;

}

void __52___UIDragManager_beginDragWithSessionConfiguration___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[16];

  v2 = dyld_program_sdk_at_least();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (v2)
  {
    if (v3 <= 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("_UIDragManager.m"), 232, CFSTR("Pending session request count is not valid."));

    }
  }
  else if (v3 <= 0)
  {
    v6 = _block_invoke___s_category_4;
    if (!_block_invoke___s_category_4)
    {
      v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&_block_invoke___s_category_4);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Pending session request count is not valid.", buf, 2u);
    }
  }
  if ((uint64_t)--*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) <= 0)
  {
    +[UIApplication _systemAnimationFenceExemptQueue](UIApplication, "_systemAnimationFenceExemptQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52___UIDragManager_beginDragWithSessionConfiguration___block_invoke_28;
    v8[3] = &unk_1E16B1B28;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "performAsync:", v8);

  }
}

uint64_t __52___UIDragManager_beginDragWithSessionConfiguration___block_invoke_28(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performPendingSessionCompletionBlocksIfPossible");
}

@end
