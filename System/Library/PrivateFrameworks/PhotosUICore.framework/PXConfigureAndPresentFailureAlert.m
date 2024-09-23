@implementation PXConfigureAndPresentFailureAlert

void __PXConfigureAndPresentFailureAlert_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  PXAlertAction *v6;
  PXAlertAction *v7;
  PXAlertAction *v8;
  void *v9;
  PXAlertAction *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v3 = a2;
  objc_msgSend(v3, "setTitle:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setMessage:", *(_QWORD *)(a1 + 40));
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = MEMORY[0x1E0C809B0];
  if (*(_QWORD *)(a1 + 48))
  {
    v6 = [PXAlertAction alloc];
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __PXConfigureAndPresentFailureAlert_block_invoke_2;
    v14[3] = &unk_1E5145688;
    v15 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 56);
    v17 = *(id *)(a1 + 72);
    v7 = -[PXAlertAction initWithTitle:style:action:](v6, "initWithTitle:style:action:", CFSTR("File Radar"), 0, v14);
    objc_msgSend(v4, "addObject:", v7);

  }
  if (*(_QWORD *)(a1 + 64))
    objc_msgSend(v4, "addObjectsFromArray:");
  v8 = [PXAlertAction alloc];
  PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __PXConfigureAndPresentFailureAlert_block_invoke_158;
  v11[3] = &unk_1E5148CE0;
  v12 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 72);
  v10 = -[PXAlertAction initWithTitle:style:action:](v8, "initWithTitle:style:action:", v9, 0, v11);
  objc_msgSend(v4, "addObject:", v10);

  objc_msgSend(v3, "addActions:", v4);
}

void __PXConfigureAndPresentFailureAlert_block_invoke_2(id *a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __PXConfigureAndPresentFailureAlert_block_invoke_3;
  v2[3] = &unk_1E5148348;
  v3 = a1[5];
  v4 = a1[6];
  objc_msgSend(a1[4], "setCompletionHandler:", v2);
  PXFileRadarWithConfiguration(a1[4]);

}

uint64_t __PXConfigureAndPresentFailureAlert_block_invoke_158(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  v2 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "PXFailureAlert: User dismissed the alert", v4, 2u);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __PXConfigureAndPresentFailureAlert_block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "PXFailureAlert: User dismissed the alert with the TTR button", v7, 2u);
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

@end
