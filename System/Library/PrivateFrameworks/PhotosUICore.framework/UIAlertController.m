@implementation UIAlertController

void __75__UIAlertController_PhotosUICore__px_showDebugAlertInKeyWindowWithMessage___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentingViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

void __84__UIAlertController_PXErrorRecovery__px_alertControllerWithError_completionHandler___block_invoke(uint64_t a1, void *a2, unint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v7 = a2;
  v8 = a4;
  if (a3 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIAlertActionStyle UIAlertActionStyleFromPXAlertActionStyle(PXAlertActionStyle)");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXAlertActionStyle.h"), 43, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v9 = *(void **)(a1 + 32);
  v10 = (void *)MEMORY[0x1E0DC3448];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__UIAlertController_PXErrorRecovery__px_alertControllerWithError_completionHandler___block_invoke_2;
  v15[3] = &unk_1E5142658;
  v16 = v8;
  v11 = v8;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v7, a3, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v12);

}

uint64_t __84__UIAlertController_PXErrorRecovery__px_alertControllerWithError_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __84__UIAlertController_PXErrorRecovery__px_alertControllerWithError_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__UIAlertController_CPL__px_alertForCPLEnableError_actionHandler_cancelHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  PLUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "User dismissed iCPL enablement error alert", v4, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __80__UIAlertController_CPL__px_alertForCPLEnableError_actionHandler_cancelHandler___block_invoke_187(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "User invoked iCPL enablement error alert action with title: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __126__UIAlertController_CPL__px_deleteITunesContentAlertWithAssetCount_includesPhotos_includesVideos_actionHandler_cancelHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __126__UIAlertController_CPL__px_deleteITunesContentAlertWithAssetCount_includesPhotos_includesVideos_actionHandler_cancelHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
