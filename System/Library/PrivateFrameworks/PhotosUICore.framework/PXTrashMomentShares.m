@implementation PXTrashMomentShares

void __PXTrashMomentShares_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setTitle:", v3);
  objc_msgSend(v4, "setMessage:", *(_QWORD *)(a1 + 40));
  PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __PXTrashMomentShares_block_invoke_2;
  v10[3] = &unk_1E5148CE0;
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  objc_msgSend(v4, "addActionWithTitle:style:action:", v5, 0, v10);

  PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __PXTrashMomentShares_block_invoke_3;
  v8[3] = &unk_1E5148A40;
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v4, "addActionWithTitle:style:action:", v7, 1, v8);

}

void __PXTrashMomentShares_block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  uint8_t buf[16];

  PLSharingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "User confirmed trashing moment shares", buf, 2u);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __PXTrashMomentShares_block_invoke_235;
  v4[3] = &unk_1E51417E8;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  _PXDeleteMomentShares(v3, 0, v4);

}

void __PXTrashMomentShares_block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  PLSharingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "User dismissed the confirmation alert for trashing moment shares", v4, 2u);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXCMMErrorDomain"), 11, CFSTR("User dismissed the confirmation alert for trashing moment shares"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __PXTrashMomentShares_block_invoke_235(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __PXTrashMomentShares_block_invoke_2_236;
    block[3] = &unk_1E5146308;
    v9 = v6;
    v10 = a2;
    v8 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __PXTrashMomentShares_block_invoke_2_236(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

@end
