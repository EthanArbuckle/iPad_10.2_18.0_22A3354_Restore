@implementation PXCMMPreviewActionMenusWithActionManager

void __PXCMMPreviewActionMenusWithActionManager_block_invoke(id *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v7 = a2;
  v8 = a3;
  objc_msgSend(a1[4], "localizedTitleForActionType:useCase:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0DC3428];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __PXCMMPreviewActionMenusWithActionManager_block_invoke_2;
    v12[3] = &unk_1E5141778;
    v13 = a1[4];
    v14 = v7;
    v15 = a1[5];
    objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v9, v8, 0, v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAttributes:", a4);
    objc_msgSend(a1[6], "addObject:", v11);

  }
}

void __PXCMMPreviewActionMenusWithActionManager_block_invoke_2(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "canPerformActionType:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "actionPerformerForActionType:", *(_QWORD *)(a1 + 40));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setPresentationEnvironment:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v2, "performActionWithCompletionHandler:", 0);

  }
}

@end
