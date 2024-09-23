@implementation PXMemoriesDeleteConfirmationAlertShow

id __PXMemoriesDeleteConfirmationAlertShow_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  PXLocalizedStringFromTable(a2, CFSTR("PhotosUICore"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringWithValidatedFormat(v2, CFSTR("%ld"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __PXMemoriesDeleteConfirmationAlertShow_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStyle:", objc_msgSend(v4, "userInterfaceIdiom") != 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  v6 = CFSTR("PXPhotoKitAssetActionManagerAlertActionConfirmDeleteThisMemoryCloudWarningMessage");
  v7 = CFSTR("PXPhotoKitAssetActionManagerAlertActionConfirmDeleteTheseMemoriesCloudWarningMessage");
  if (!*(_BYTE *)(a1 + 56))
  {
    v6 = CFSTR("PXPhotoKitAssetActionManagerAlertActionConfirmDeleteThisMemoryWarningMessage");
    v7 = CFSTR("PXPhotoKitAssetActionManagerAlertActionConfirmDeleteTheseMemoriesWarningMessage");
  }
  if (*(_QWORD *)(a1 + 48) == 1)
    v8 = (__CFString *)v6;
  else
    v8 = (__CFString *)v7;
  PXLocalizedStringFromTable(v8, CFSTR("PhotosUICore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMessage:", v9);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __PXMemoriesDeleteConfirmationAlertShow_block_invoke_3;
  v15[3] = &unk_1E5148A40;
  v16 = *(id *)(a1 + 40);
  objc_msgSend(v3, "addActionWithTitle:style:action:", v10, 2, v15);

  PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v11;
  v13[1] = 3221225472;
  v13[2] = __PXMemoriesDeleteConfirmationAlertShow_block_invoke_4;
  v13[3] = &unk_1E5148A40;
  v14 = *(id *)(a1 + 40);
  objc_msgSend(v3, "addActionWithTitle:style:action:", v12, 1, v13);

}

uint64_t __PXMemoriesDeleteConfirmationAlertShow_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __PXMemoriesDeleteConfirmationAlertShow_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
