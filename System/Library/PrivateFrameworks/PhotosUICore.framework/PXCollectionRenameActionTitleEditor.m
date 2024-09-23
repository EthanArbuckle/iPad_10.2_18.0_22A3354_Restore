@implementation PXCollectionRenameActionTitleEditor

BOOL __PXCollectionRenameActionTitleEditor_block_invoke(_BYTE *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length") || !a1[32])
  {
    objc_msgSend(MEMORY[0x1E0CD13C8], "validateAssetCollectionTitle:error:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 1;
  }
  if (a1[33])
  {
    objc_msgSend(v3, "subtitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      if (objc_msgSend(v7, "length") || !a1[34])
      {
        objc_msgSend(MEMORY[0x1E0CD13C8], "validateAssetCollectionTitle:error:", v8, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v9 != 0;

      }
      else
      {
        v6 = 1;
      }
    }

  }
  return v6;
}

void __PXCollectionRenameActionTitleEditor_block_invoke_3(uint64_t a1, void *a2, char a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  PXRenameMemoryAction *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD);
  uint64_t v23;
  const __CFString *v24;
  const __CFString *v25;
  uint64_t v26;
  void *v27;
  _QWORD aBlock[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;

  v5 = a2;
  v6 = v5;
  if ((a3 & 1) != 0)
  {
    objc_msgSend(v5, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(MEMORY[0x1E0CD13C8], "validateAssetCollectionTitle:error:", v7, &v33);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v33;
    if (!objc_msgSend(v8, "length"))
    {
      v19 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithUnderlyingError:debugDescription:", v9, CFSTR("Unsupported collection title: \"%@\"), v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v19 + 16))(v19, 0, v14);
LABEL_22:

      goto LABEL_23;
    }
    v10 = *(_QWORD *)(a1 + 56);
    v11 = MEMORY[0x1E0C809B0];
    v12 = "uttonFactory";
    if (v10 >= 2)
    {
      if (v10 != 2)
      {
        v14 = 0;
        v15 = v9;
LABEL_14:
        objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithUnderlyingError:debugDescription:", v9, CFSTR("Rename action was not created for new title: \"%@\", new subtitle: \"%@\"), v8, v14);
        v13 = (PXRenameMemoryAction *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_15:

        aBlock[0] = v11;
        aBlock[1] = *((_QWORD *)v12 + 7);
        aBlock[2] = __PXCollectionRenameActionTitleEditor_block_invoke_5;
        aBlock[3] = &unk_1E51485B0;
        v29 = *(id *)(a1 + 32);
        v21 = _Block_copy(aBlock);
        v22 = (void (**)(_QWORD, _QWORD))v21;
        v23 = *(_QWORD *)(a1 + 56);
        if (v23)
        {
          if (v23 != 2)
          {
LABEL_20:

            v20 = v29;
LABEL_21:

            v9 = v15;
            goto LABEL_22;
          }
          v24 = CFSTR("com.apple.photos.CPAnalytics.memoryRenamedFromAlert");
          v25 = CFSTR("com.apple.photos.CPAnalytics.memoryRenamed");
        }
        else
        {
          v24 = CFSTR("com.apple.photos.CPAnalytics.albumRenamedFromAlert");
          v25 = CFSTR("com.apple.photos.CPAnalytics.albumRenamed");
        }
        (*((void (**)(void *, const __CFString *))v21 + 2))(v21, v25);
        ((void (**)(_QWORD, const __CFString *))v22)[2](v22, v24);
        goto LABEL_20;
      }
      objc_msgSend(v6, "subtitle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v9;
      objc_msgSend(MEMORY[0x1E0CD13C8], "validateAssetCollectionTitle:error:", v20, &v32);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v32;

      if (!objc_msgSend(v14, "length") && !*(_BYTE *)(a1 + 64))
      {
        v26 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithUnderlyingError:debugDescription:", v15, CFSTR("Unsupported memory subtitle: \"%@\"), v20);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v26 + 16))(v26, 0, v27);

        goto LABEL_21;
      }
      v13 = -[PXRenameMemoryAction initWithMemory:title:subtitle:]([PXRenameMemoryAction alloc], "initWithMemory:title:subtitle:", *(_QWORD *)(a1 + 32), v8, v14);

      v12 = "LemonadeProfileButtonFactory" + 16;
      if (v13)
        goto LABEL_5;
    }
    else
    {
      v13 = -[PXRenameCollectionAction initWithCollection:title:]([PXRenameCollectionAction alloc], "initWithCollection:title:", *(_QWORD *)(a1 + 32), v8);
      v14 = 0;
      v15 = v9;
      if (v13)
      {
LABEL_5:
        v30[0] = v11;
        v30[1] = *((_QWORD *)v12 + 7);
        v30[2] = __PXCollectionRenameActionTitleEditor_block_invoke_4;
        v30[3] = &unk_1E51417E8;
        v16 = *(_QWORD *)(a1 + 40);
        v31 = *(id *)(a1 + 48);
        -[PXAction executeWithUndoManager:completionHandler:](v13, "executeWithUndoManager:completionHandler:", v16, v30);

        goto LABEL_15;
      }
    }
    v9 = v15;
    goto LABEL_14;
  }
  v17 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("User cancelled collection rename action"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v18);

LABEL_23:
}

uint64_t __PXCollectionRenameActionTitleEditor_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __PXCollectionRenameActionTitleEditor_block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D09910];
  v3 = *(_QWORD *)(a1 + 32);
  v7 = *MEMORY[0x1E0D09818];
  v8[0] = v3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a2;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendEvent:withPayload:", v5, v6);

}

@end
