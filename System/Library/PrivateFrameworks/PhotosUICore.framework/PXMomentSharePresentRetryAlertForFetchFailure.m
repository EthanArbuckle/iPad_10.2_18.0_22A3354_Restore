@implementation PXMomentSharePresentRetryAlertForFetchFailure

void __PXMomentSharePresentRetryAlertForFetchFailure_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  PXLocalizedStringFromTable(CFSTR("PXCMMOpenInPhotosFailureAlertTitle"), CFSTR("PhotosUICore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  objc_msgSend(v3, "setMessage:", *(_QWORD *)(a1 + 32));
  PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __PXMomentSharePresentRetryAlertForFetchFailure_block_invoke_2;
  v10[3] = &unk_1E5148A40;
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v3, "addActionWithTitle:style:action:", v5, 0, v10);

  if (*(_BYTE *)(a1 + 48))
  {
    PXLocalizedStringFromTable(CFSTR("PXTryAgainButtonTitle"), CFSTR("PhotosUICore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __PXMomentSharePresentRetryAlertForFetchFailure_block_invoke_211;
    v8[3] = &unk_1E5148A40;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v3, "addActionWithTitle:style:action:", v7, 0, v8);

  }
}

uint64_t __PXMomentSharePresentRetryAlertForFetchFailure_block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PLSharingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "Failure Alert: User dismissed the alert requesting to NOT retry", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __PXMomentSharePresentRetryAlertForFetchFailure_block_invoke_211(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PLSharingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "Failure Alert: User dismissed the alert requesting TO retry", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
