@implementation UINavigationBarTitleRenamerRemoteSession

void __70___UINavigationBarTitleRenamerRemoteSession__updateSessionWithAction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "cancelSessionAndNotify:", 0);
}

void __106___UINavigationBarTitleRenamerRemoteSession__attemptLocalRenameForFileURL_proposedName_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v2 = (void *)qword_1ECD788A0;
  v21 = qword_1ECD788A0;
  v3 = MEMORY[0x1E0C809B0];
  if (!qword_1ECD788A0)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __getDOCFileRenamingSupportClass_block_invoke;
    v17[3] = &unk_1E16B14C0;
    v17[4] = &v18;
    __getDOCFileRenamingSupportClass_block_invoke((uint64_t)v17);
    v2 = (void *)v19[3];
  }
  v4 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v18, 8);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v16 = 0;
  objc_msgSend(v4, "fallbackRename:toProposedName:error:", v5, v6, &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __106___UINavigationBarTitleRenamerRemoteSession__attemptLocalRenameForFileURL_proposedName_completionHandler___block_invoke_2;
  block[3] = &unk_1E16BB458;
  v9 = *(id *)(a1 + 48);
  v14 = v8;
  v15 = v9;
  v13 = v7;
  v10 = v8;
  v11 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __106___UINavigationBarTitleRenamerRemoteSession__attemptLocalRenameForFileURL_proposedName_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __84___UINavigationBarTitleRenamerRemoteSession__client_fileRenameDidFail_proposedName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "attachedRenamer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 32);
  if (v9)
    objc_msgSend(v6, "_session:fileRenameDidEnd:", v8, v9);
  else
    objc_msgSend(v6, "_session:fileRenameDidFail:", v8, v5);

}

void __93___UINavigationBarTitleRenamerRemoteSession__server_willBeginRenamingWithText_selectedRange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "text");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = objc_msgSend(v3, "selectedRange");
  v9 = v8;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  *(_QWORD *)(v10 + 32) = v7;
  *(_QWORD *)(v10 + 40) = v9;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __87___UINavigationBarTitleRenamerRemoteSession__server_textFieldShouldEndEditingWithText___block_invoke(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a2, "shouldEndEditing");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __84___UINavigationBarTitleRenamerRemoteSession__server_textFieldDidEndEditingWithText___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (v8)
    objc_msgSend(WeakRetained, "fileRenameDidEnd:");
  else
    objc_msgSend(WeakRetained, "fileRenameDidFail:proposedName:", v5, *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 40), "stopAccessingSecurityScopedResource");

}

@end
