@implementation UIAlertController(PXErrorRecovery)

+ (id)px_alertControllerWithError:()PXErrorRecovery completionHandler:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "localizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedFailureReason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __84__UIAlertController_PXErrorRecovery__px_alertControllerWithError_completionHandler___block_invoke;
  v22[3] = &unk_1E512F610;
  v11 = v9;
  v23 = v11;
  v12 = PXErrorRecoveryEnumerateOptionsForError(v6, v5, v22);

  if ((v12 & 1) == 0)
  {
    PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0DC3448];
    v17 = v10;
    v18 = 3221225472;
    v19 = __84__UIAlertController_PXErrorRecovery__px_alertControllerWithError_completionHandler___block_invoke_3;
    v20 = &unk_1E5142658;
    v21 = v5;
    objc_msgSend(v14, "actionWithTitle:style:handler:", v13, 0, &v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v15, v17, v18, v19, v20);
    objc_msgSend(v11, "setPreferredAction:", v15);

  }
  return v11;
}

@end
