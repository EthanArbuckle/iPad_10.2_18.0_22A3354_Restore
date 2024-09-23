@implementation PXExpungeAssetsAction

- (id)actionIdentifier
{
  return CFSTR("ExpungeAssets");
}

- (void)executeWithUndoManager:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  _QWORD v18[4];
  NSObject *v19;
  PXExpungeAssetsAction *v20;
  id v21;
  os_signpost_id_t v22;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  PLUIActionsGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);
  v10 = v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ExpungeAssets", ", buf, 2u);
  }

  -[PXAction removeAllActionsFromUndoManager:](self, "removeAllActionsFromUndoManager:", v7);
  v12 = objc_alloc_init(MEMORY[0x1E0CD1408]);
  objc_msgSend(v12, "setExpungeSource:", 3);
  v13 = (void *)MEMORY[0x1E0CD13B0];
  -[PXAssetsAction assets](self, "assets");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosAction photoLibrary](self, "photoLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __66__PXExpungeAssetsAction_executeWithUndoManager_completionHandler___block_invoke;
  v18[3] = &unk_1E513DF70;
  v19 = v11;
  v20 = self;
  v21 = v6;
  v22 = v9;
  v16 = v6;
  v17 = v11;
  objc_msgSend(v13, "performBatchExpungeWithAssets:deleteOptions:photoLibrary:completionHandler:", v14, v12, v15, v18);

}

void __66__PXExpungeAssetsAction_executeWithUndoManager_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  char v17;

  v5 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__PXExpungeAssetsAction_executeWithUndoManager_completionHandler___block_invoke_2;
  v11[3] = &unk_1E5143A30;
  v6 = *(id *)(a1 + 32);
  v8 = *(void **)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v12 = v6;
  v13 = v5;
  v9 = *(_QWORD *)(a1 + 40);
  v16 = v7;
  v14 = v9;
  v15 = v8;
  v17 = a2;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

uint64_t __66__PXExpungeAssetsAction_executeWithUndoManager_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v3, OS_SIGNPOST_INTERVAL_END, v4, "ExpungeAssets", ", (uint8_t *)&v9, 2u);
  }

  if (*(_QWORD *)(a1 + 40))
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "assets");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Unable to expunge assets:%@ error:%@", (uint8_t *)&v9, 0x16u);

    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

@end
