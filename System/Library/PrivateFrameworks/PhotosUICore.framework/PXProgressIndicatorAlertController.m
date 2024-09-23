@implementation PXProgressIndicatorAlertController

- (PXProgressIndicatorAlertController)init
{
  PXProgressIndicatorAlertController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXProgressIndicatorAlertController;
  result = -[PXProgressIndicatorAlertController init](&v3, sel_init);
  if (result)
    *(_OWORD *)&result->_delay = xmmword_1A7C0C9A0;
  return result;
}

- (void)stopShowing
{
  -[PXProgressIndicatorAlertController stopShowing:](self, "stopShowing:", 0);
}

- (void)stopShowing:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = v4;
  if (!self->_isCanceled)
  {
    self->_isCanceled = 1;
    v6 = v4;
    px_dispatch_on_main_queue();

  }
}

- (void)dealloc
{
  UIAlertController *v3;
  UIWindow *v4;
  UIWindow *v5;
  UIAlertController *v6;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  UIAlertController *v12;
  UIWindow *v13;

  v3 = self->_alertController;
  v4 = self->_window;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __45__PXProgressIndicatorAlertController_dealloc__block_invoke;
  v11 = &unk_1E5148D08;
  v12 = v3;
  v13 = v4;
  v5 = v4;
  v6 = v3;
  px_dispatch_on_main_queue();

  v7.receiver = self;
  v7.super_class = (Class)PXProgressIndicatorAlertController;
  -[PXProgressIndicatorAlertController dealloc](&v7, sel_dealloc);
}

- (void)_startShowingProgress
{
  void *v3;
  void *v4;
  UIWindow *v5;
  UIWindow *window;
  double v7;
  double v8;
  NSObject *v9;
  os_signpost_id_t v10;
  os_signpost_id_t v11;
  dispatch_time_t v12;
  _QWORD block[4];
  id v14;
  uint8_t buf[4];
  PXProgressIndicatorAlertController *v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (UIWindow *)objc_claimAutoreleasedReturnValue();
  window = self->_window;
  self->_window = v5;

  -[UIWindow setUserInteractionEnabled:](self->_window, "setUserInteractionEnabled:", 0);
  -[PXProgressIndicatorAlertController delay](self, "delay");
  v8 = v7;
  PLUIGetLog();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_make_with_pointer(v9, self);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = v10;
    if (os_signpost_enabled(v9))
    {
      *(_DWORD *)buf = 134218240;
      v16 = self;
      v17 = 2048;
      v18 = v8;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PXProgressIndicatorAlertControllerShowing", "Context=%{signpost.telemetry:string2}lu delay:%.2f", buf, 0x16u);
    }
  }

  if (v8 <= 0.0)
  {
    -[PXProgressIndicatorAlertController _presentAlert](self, "_presentAlert");
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v12 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__PXProgressIndicatorAlertController__startShowingProgress__block_invoke;
    block[3] = &unk_1E5148D30;
    objc_copyWeak(&v14, (id *)buf);
    dispatch_after(v12, MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_presentAlert
{
  NSDate *v3;
  NSDate *alertPresentedDate;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UIAlertController *v18;
  UIAlertController *alertController;
  void *v20;
  id v21;

  if (!self->_isCanceled)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    alertPresentedDate = self->_alertPresentedDate;
    self->_alertPresentedDate = v3;

    v21 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 101);
    objc_msgSend(v5, "setAutoresizingMask:", 18);
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v21, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBounds:", v7, v9, v11, v13);

    objc_msgSend(v21, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v5);

    objc_msgSend(v5, "startAnimating");
    v16 = (void *)MEMORY[0x1E0DC3450];
    -[PXProgressIndicatorAlertController title](self, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "alertControllerWithTitle:message:preferredStyle:", v17, 0, 1);
    v18 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
    alertController = self->_alertController;
    self->_alertController = v18;

    -[UIAlertController setContentViewController:](self->_alertController, "setContentViewController:", v21);
    -[UIWindow rootViewController](self->_window, "rootViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "px_presentOverTopmostPresentedViewController:animated:completion:", self->_alertController, 1, 0);

  }
}

- (void)_dismissAlert:(id)a3
{
  UIAlertController *alertController;
  UIWindow *window;
  NSObject *v6;
  os_signpost_id_t v7;
  os_signpost_id_t v8;
  int v9;
  PXProgressIndicatorAlertController *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _Dismiss(self->_alertController, self->_window, a3);
  alertController = self->_alertController;
  self->_alertController = 0;

  window = self->_window;
  self->_window = 0;

  PLUIGetLog();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_make_with_pointer(v6, self);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v6))
    {
      v9 = 134217984;
      v10 = self;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_END, v8, "PXProgressIndicatorAlertControllerShowing", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v9, 0xCu);
    }
  }

}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (double)minimumDisplayDuration
{
  return self->_minimumDisplayDuration;
}

- (void)setMinimumDisplayDuration:(double)a3
{
  self->_minimumDisplayDuration = a3;
}

- (BOOL)isInternalUIAllowed
{
  return self->_isInternalUIAllowed;
}

- (void)setIsInternalUIAllowed:(BOOL)a3
{
  self->_isInternalUIAllowed = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_alertPresentedDate, 0);
}

void __59__PXProgressIndicatorAlertController__startShowingProgress__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_presentAlert");

}

void __45__PXProgressIndicatorAlertController_dealloc__block_invoke(uint64_t a1)
{
  _Dismiss(*(void **)(a1 + 32), *(void **)(a1 + 40), 0);
}

void __50__PXProgressIndicatorAlertController_stopShowing___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  double v4;
  double v5;
  dispatch_time_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[2])
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    v5 = v4;

    if (v5 > 0.0 && v5 < 0.8)
    {
      v6 = dispatch_time(0, (uint64_t)((0.8 - v5) * 1000000000.0));
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __50__PXProgressIndicatorAlertController_stopShowing___block_invoke_2;
      v8[3] = &unk_1E5148CE0;
      v7 = *(void **)(a1 + 40);
      v8[4] = *(_QWORD *)(a1 + 32);
      v9 = v7;
      dispatch_after(v6, MEMORY[0x1E0C80D38], v8);

      return;
    }
    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v2, "_dismissAlert:", *(_QWORD *)(a1 + 40));
}

uint64_t __50__PXProgressIndicatorAlertController_stopShowing___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissAlert:", *(_QWORD *)(a1 + 40));
}

+ (id)beginShowingModalProgressWithConfiguration:(id)a3
{
  void (**v3)(id, PXProgressIndicatorAlertController *);
  PXProgressIndicatorAlertController *v4;

  v3 = (void (**)(id, PXProgressIndicatorAlertController *))a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v4 = objc_alloc_init(PXProgressIndicatorAlertController);
  if (v3)
    v3[2](v3, v4);
  -[PXProgressIndicatorAlertController _startShowingProgress](v4, "_startShowingProgress");

  return v4;
}

@end
