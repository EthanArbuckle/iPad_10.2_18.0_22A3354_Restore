@implementation ICLongRunningTaskController

+ (void)setMainWindow:(id)a3
{
  objc_storeStrong((id *)&sMainWindow, a3);
}

- (ICLongRunningTaskController)init
{
  return -[ICLongRunningTaskController initWithWindow:intervalBeforeOpeningProgressDialog:](self, "initWithWindow:intervalBeforeOpeningProgressDialog:", sMainWindow, 1.0);
}

- (ICLongRunningTaskController)initWithWindow:(id)a3 intervalBeforeOpeningProgressDialog:(double)a4
{
  id v6;
  ICLongRunningTaskController *v7;
  ICLongRunningTaskController *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICLongRunningTaskController;
  v7 = -[ICLongRunningTaskController init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[ICLongRunningTaskController setIntervalBeforeOpeningProgressDialog:](v7, "setIntervalBeforeOpeningProgressDialog:", a4);
    -[ICLongRunningTaskController setWindow:](v8, "setWindow:", v6);
  }

  return v8;
}

- (void)startTask:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  double v14;
  dispatch_time_t v15;
  void *v16;
  BOOL v17;
  void *v18;
  _QWORD block[5];
  NSObject *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  -[ICLongRunningTaskController setKeepAlive:](self, "setKeepAlive:", self);
  -[ICLongRunningTaskController setCompletionBlock:](self, "setCompletionBlock:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38A8]), "initWithParent:userInfo:", 0, 0);
  -[ICLongRunningTaskController setProgress:](self, "setProgress:", v8);

  -[ICLongRunningTaskController progress](self, "progress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ic_addObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), &compoundliteral_0);

  v10 = dispatch_semaphore_create(0);
  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ICLongRunningTaskController_startTask_completionBlock___block_invoke;
  block[3] = &unk_1E5C1FE08;
  v12 = v6;
  v21 = v12;
  block[4] = self;
  v13 = v10;
  v20 = v13;
  dispatch_async(v11, block);

  -[ICLongRunningTaskController intervalBeforeOpeningProgressDialog](self, "intervalBeforeOpeningProgressDialog");
  v15 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
  if (dispatch_semaphore_wait(v13, v15))
  {
    -[ICLongRunningTaskController progress](self, "progress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "totalUnitCount") == 1)
    {
      v17 = -[ICLongRunningTaskController allowSingleUnitProgress](self, "allowSingleUnitProgress");

      if (!v17)
        goto LABEL_7;
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLongRunningTaskController setOpenProgressDate:](self, "setOpenProgressDate:", v18);

    -[ICLongRunningTaskController openProgressDialog](self, "openProgressDialog");
  }
LABEL_7:

}

void __57__ICLongRunningTaskController_startTask_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ICLongRunningTaskController_startTask_completionBlock___block_invoke_2;
  block[3] = &unk_1E5C1D540;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __57__ICLongRunningTaskController_startTask_completionBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTaskIfNecessary");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  _QWORD block[5];
  objc_super v15;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  if ((-[ICLongRunningTaskController ic_didAddObserverForContext:inScope:](self, "ic_didAddObserverForContext:inScope:", a6, "/Library/Caches/com.apple.xbs/Sources/MobileNotesSupport/Ironcade/SharedUI/Utilities/ICLongRunningTaskController.m") & 1) != 0)
  {
    v13 = -[ICLongRunningTaskController ic_shouldIgnoreObserveValue:ofObject:forKeyPath:](self, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:", v10, v11, v12);

    if (a6 == &compoundliteral_0 && (v13 & 1) == 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __78__ICLongRunningTaskController_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_1E5C1D540;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)ICLongRunningTaskController;
    -[ICLongRunningTaskController observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, v12, v11, v10, a6);

  }
}

uint64_t __78__ICLongRunningTaskController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateProgress");
}

- (void)completeTaskIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;

  -[ICLongRunningTaskController progress](self, "progress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICLongRunningTaskController openProgressDate](self, "openProgressDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICLongRunningTaskController openProgressDate](self, "openProgressDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeIntervalSinceDate:", v6);
      v8 = v7;

      if (v8 < 0.5)
        objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", 0.5 - v8);
      -[ICLongRunningTaskController closeProgressDialog](self, "closeProgressDialog");
      -[ICLongRunningTaskController setOpenProgressDate:](self, "setOpenProgressDate:", 0);

    }
    else
    {
      -[ICLongRunningTaskController completionBlock](self, "completionBlock");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[ICLongRunningTaskController completionBlock](self, "completionBlock");
        v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[ICLongRunningTaskController progress](self, "progress");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v12)[2](v12, v13);

        -[ICLongRunningTaskController setCompletionBlock:](self, "setCompletionBlock:", 0);
      }
    }
    -[ICLongRunningTaskController progress](self, "progress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ic_removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), &compoundliteral_0);

    -[ICLongRunningTaskController setProgress:](self, "setProgress:", 0);
  }
  else
  {
    -[ICLongRunningTaskController completionBlock](self, "completionBlock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[ICLongRunningTaskController completionBlock](self, "completionBlock");
      v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0);

      -[ICLongRunningTaskController setCompletionBlock:](self, "setCompletionBlock:", 0);
    }
  }
  -[ICLongRunningTaskController setKeepAlive:](self, "setKeepAlive:", 0);
}

- (void)updateProgress
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_DEBUG, "Progress format string not set", v1, 2u);
}

- (void)openProgressDialog
{
  void *v3;
  ICProgressViewController *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  ICProgressViewController *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  ICProgressViewController *v26;
  _QWORD v27[4];
  id v28;
  id location;

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICProgressViewController initWithDelegate:]([ICProgressViewController alloc], "initWithDelegate:", self);
  -[ICLongRunningTaskController setProgressViewController:](self, "setProgressViewController:", v4);
  if (-[ICLongRunningTaskController shouldShowCircularProgress](self, "shouldShowCircularProgress"))
  {
    -[ICLongRunningTaskController progressViewController](self, "progressViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "view");

    -[ICLongRunningTaskController progress](self, "progress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLongRunningTaskController progressViewController](self, "progressViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObservedProgress:", v7);

  }
  v9 = -[ICLongRunningTaskController shouldShowCancelButton](self, "shouldShowCancelButton");
  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Cancel"), CFSTR("Cancel"), 0, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLongRunningTaskController customCancelButtonTitle](self, "customCancelButtonTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[ICLongRunningTaskController customCancelButtonTitle](self, "customCancelButtonTitle");
      v13 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v13;
    }
    v14 = (void *)MEMORY[0x1E0DC3448];
    v27[0] = v10;
    v27[1] = 3221225472;
    v27[2] = __49__ICLongRunningTaskController_openProgressDialog__block_invoke;
    v27[3] = &unk_1E5C1FE30;
    objc_copyWeak(&v28, &location);
    objc_msgSend(v14, "actionWithTitle:style:handler:", v11, 1, v27);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addAction:", v15);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  v25[0] = v10;
  v25[1] = 3221225472;
  v25[2] = __49__ICLongRunningTaskController_openProgressDialog__block_invoke_2;
  v25[3] = &unk_1E5C1FE58;
  v16 = v4;
  v26 = v16;
  -[ICLongRunningTaskController setUpdateProgressUIBlock:](self, "setUpdateProgressUIBlock:", v25);
  -[ICLongRunningTaskController progressViewController](self, "progressViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentViewController:", v17);

  -[ICLongRunningTaskController progressViewController](self, "progressViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v18, "view");

  -[ICLongRunningTaskController updateProgress](self, "updateProgress");
  -[ICLongRunningTaskController setProgressViewControllerDidFinishPresenting:](self, "setProgressViewControllerDidFinishPresenting:", 0);
  -[ICLongRunningTaskController setShouldDismissProgressViewController:](self, "setShouldDismissProgressViewController:", 0);
  -[ICLongRunningTaskController viewControllerToPresentFrom](self, "viewControllerToPresentFrom");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    -[ICLongRunningTaskController window](self, "window");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "rootViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "viewControllerToPresentFrom", "-[ICLongRunningTaskController openProgressDialog]", 1, 0, CFSTR("No view controller to present progress UI from."));
  }
  v23[0] = v10;
  v23[1] = 3221225472;
  v23[2] = __49__ICLongRunningTaskController_openProgressDialog__block_invoke_3;
  v23[3] = &unk_1E5C1D9A8;
  v23[4] = self;
  v24 = v20;
  v22 = v20;
  objc_msgSend(v22, "presentViewController:animated:completion:", v3, 1, v23);

}

void __49__ICLongRunningTaskController_openProgressDialog__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsCancelled:", 1);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "progress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "closeProgressDialog");

}

void __49__ICLongRunningTaskController_openProgressDialog__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "label");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

}

uint64_t __49__ICLongRunningTaskController_openProgressDialog__block_invoke_3(uint64_t a1)
{
  uint64_t result;
  void *v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "setProgressViewControllerDidFinishPresenting:", 1);
  result = objc_msgSend(*(id *)(a1 + 32), "shouldDismissProgressViewController");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "setShouldDismissProgressViewController:", 0);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __49__ICLongRunningTaskController_openProgressDialog__block_invoke_4;
    v4[3] = &unk_1E5C1D540;
    v3 = *(void **)(a1 + 40);
    v4[4] = *(_QWORD *)(a1 + 32);
    return objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v4);
  }
  return result;
}

void __49__ICLongRunningTaskController_openProgressDialog__block_invoke_4(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "completionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionBlock");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "progress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v3)[2](v3, v4);

    objc_msgSend(*(id *)(a1 + 32), "setCompletionBlock:", 0);
  }
}

- (void)closeProgressDialog
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD aBlock[5];

  -[ICLongRunningTaskController progressViewController](self, "progressViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICLongRunningTaskController progressViewController](self, "progressViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setProgressDelegate:", 0);

    -[ICLongRunningTaskController progressViewController](self, "progressViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICLongRunningTaskController setProgressViewController:](self, "setProgressViewController:", 0);
    -[ICLongRunningTaskController viewControllerToPresentFrom](self, "viewControllerToPresentFrom");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      -[ICLongRunningTaskController window](self, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "rootViewController");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__ICLongRunningTaskController_closeProgressDialog__block_invoke;
    aBlock[3] = &unk_1E5C1D540;
    aBlock[4] = self;
    v11 = _Block_copy(aBlock);
    v12 = v11;
    if (v9)
    {
      if (v6)
        objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v11);
      else
        -[ICLongRunningTaskController setShouldDismissProgressViewController:](self, "setShouldDismissProgressViewController:", 1);
    }
    else
    {
      (*((void (**)(void *))v11 + 2))(v11);
    }

  }
}

void __50__ICLongRunningTaskController_closeProgressDialog__block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "completionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionBlock");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "progress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v3)[2](v3, v4);

    objc_msgSend(*(id *)(a1 + 32), "setCompletionBlock:", 0);
  }
}

- (void)willDismissProgressViewController:(id)a3
{
  id v3;

  -[ICLongRunningTaskController progress](self, "progress", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (BOOL)shouldShowCancelButton
{
  return self->_shouldShowCancelButton;
}

- (void)setShouldShowCancelButton:(BOOL)a3
{
  self->_shouldShowCancelButton = a3;
}

- (BOOL)isIndeterminate
{
  return self->_indeterminate;
}

- (void)setIndeterminate:(BOOL)a3
{
  self->_indeterminate = a3;
}

- (NSString)customCancelButtonTitle
{
  return self->_customCancelButtonTitle;
}

- (void)setCustomCancelButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)progressString
{
  return self->_progressString;
}

- (void)setProgressString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)progressStringBlock
{
  return self->_progressStringBlock;
}

- (void)setProgressStringBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIViewController)viewControllerToPresentFrom
{
  return self->_viewControllerToPresentFrom;
}

- (void)setViewControllerToPresentFrom:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllerToPresentFrom, a3);
}

- (BOOL)shouldShowCircularProgress
{
  return self->_shouldShowCircularProgress;
}

- (void)setShouldShowCircularProgress:(BOOL)a3
{
  self->_shouldShowCircularProgress = a3;
}

- (BOOL)allowSingleUnitProgress
{
  return self->_allowSingleUnitProgress;
}

- (void)setAllowSingleUnitProgress:(BOOL)a3
{
  self->_allowSingleUnitProgress = a3;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (double)intervalBeforeOpeningProgressDialog
{
  return self->_intervalBeforeOpeningProgressDialog;
}

- (void)setIntervalBeforeOpeningProgressDialog:(double)a3
{
  self->_intervalBeforeOpeningProgressDialog = a3;
}

- (id)keepAlive
{
  return self->_keepAlive;
}

- (void)setKeepAlive:(id)a3
{
  objc_storeStrong(&self->_keepAlive, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)updateProgressUIBlock
{
  return self->_updateProgressUIBlock;
}

- (void)setUpdateProgressUIBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (NSDate)lastAccessibilityAnnouncementDate
{
  return self->_lastAccessibilityAnnouncementDate;
}

- (void)setLastAccessibilityAnnouncementDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastAccessibilityAnnouncementDate, a3);
}

- (NSDate)openProgressDate
{
  return self->_openProgressDate;
}

- (void)setOpenProgressDate:(id)a3
{
  objc_storeStrong((id *)&self->_openProgressDate, a3);
}

- (ICProgressViewController)progressViewController
{
  return self->_progressViewController;
}

- (void)setProgressViewController:(id)a3
{
  objc_storeStrong((id *)&self->_progressViewController, a3);
}

- (BOOL)progressViewControllerDidFinishPresenting
{
  return self->_progressViewControllerDidFinishPresenting;
}

- (void)setProgressViewControllerDidFinishPresenting:(BOOL)a3
{
  self->_progressViewControllerDidFinishPresenting = a3;
}

- (BOOL)shouldDismissProgressViewController
{
  return self->_shouldDismissProgressViewController;
}

- (void)setShouldDismissProgressViewController:(BOOL)a3
{
  self->_shouldDismissProgressViewController = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressViewController, 0);
  objc_storeStrong((id *)&self->_openProgressDate, 0);
  objc_storeStrong((id *)&self->_lastAccessibilityAnnouncementDate, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_updateProgressUIBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_keepAlive, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_viewControllerToPresentFrom, 0);
  objc_storeStrong(&self->_progressStringBlock, 0);
  objc_storeStrong((id *)&self->_progressString, 0);
  objc_storeStrong((id *)&self->_customCancelButtonTitle, 0);
}

@end
