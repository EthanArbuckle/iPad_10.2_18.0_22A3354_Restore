@implementation UIPrintingProgress

- (UIPrintingProgress)initWithPrinterName:(id)a3 forceDisplayAsAlert:(BOOL)a4 hostingWindowScene:(id)a5 cancelHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  UIPrintingProgress *v13;
  uint64_t v14;
  NSString *printerName;
  uint64_t v16;
  id cancelHandler;
  objc_super v19;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)UIPrintingProgress;
  v13 = -[UIPrintingProgress init](&v19, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    printerName = v13->_printerName;
    v13->_printerName = (NSString *)v14;

    v16 = objc_msgSend(v12, "copy");
    cancelHandler = v13->_cancelHandler;
    v13->_cancelHandler = (id)v16;

    v13->_forceDisplayAsAlert = a4;
    *(_WORD *)&v13->_presentingAlert = 0;
    -[UIPrintingProgress setProgressAlertDelay:](v13, "setProgressAlertDelay:", 1.0);
    -[UIPrintingProgress setHostingWindowScene:](v13, "setHostingWindowScene:", v11);
  }

  return v13;
}

- (id)initPDFCreationWithHostingWindowScene:(id)a3 cancelHandler:(id)a4
{
  id v6;
  id v7;
  UIPrintingProgress *v8;
  uint64_t v9;
  id cancelHandler;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIPrintingProgress;
  v8 = -[UIPrintingProgress init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    cancelHandler = v8->_cancelHandler;
    v8->_cancelHandler = (id)v9;

    v8->_forceDisplayAsAlert = 1;
    v8->_creatingPDF = 1;
    -[UIPrintingProgress setProgressAlertDelay:](v8, "setProgressAlertDelay:", 0.0);
    -[UIPrintingProgress setHostingWindowScene:](v8, "setHostingWindowScene:", v6);
  }

  return v8;
}

- (BOOL)progressVisible
{
  void *v3;
  _BOOL4 forceDisplayAsAlert;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom"))
  {

LABEL_4:
    -[UIPrintingProgress progressAlertWindow](self, "progressAlertWindow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_isVisible");

    return v6;
  }
  forceDisplayAsAlert = self->_forceDisplayAsAlert;

  if (forceDisplayAsAlert)
    goto LABEL_4;
  return -[UIPrintingProgressViewController visible](self->_viewController, "visible");
}

- (NSString)title
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;

  if (self->_creatingPDF)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Creating PDF"), CFSTR("Creating PDF"), CFSTR("Localizable"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Printing to “%@”"), CFSTR("Printing to “%@”"), CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v6, self->_printerName);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v3;
}

- (void)_presentProgressAlert
{
  _QWORD block[5];

  self->_presentingAlert = 1;
  if (pthread_main_np() == 1)
  {
    -[UIPrintingProgress _mainQueue_presentProgressAlert](self, "_mainQueue_presentProgressAlert");
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__UIPrintingProgress__presentProgressAlert__block_invoke;
    block[3] = &unk_1E9D96D90;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __43__UIPrintingProgress__presentProgressAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_presentProgressAlert");
}

- (void)_mainQueue_presentProgressAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[UIPrintingProgress hostingWindowScene](self, "hostingWindowScene");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_findUISceneForLegacyInterfaceOrientation");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F98]), "initWithWindowScene:", v7);
  -[UIPrintingProgress setProgressAlertWindow:](self, "setProgressAlertWindow:", v4);
  objc_msgSend(v4, "setOpaque:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  objc_msgSend(v4, "setWindowLevel:", *MEMORY[0x1E0DC5628]);
  objc_msgSend(v4, "setHidden:", 1);
  objc_msgSend(v4, "_setRoleHint:", *MEMORY[0x1E0DC5B00]);
  v6 = (void *)objc_opt_new();
  objc_msgSend(v4, "setRootViewController:", v6);
  objc_msgSend(v4, "makeKeyAndVisible");
  objc_msgSend(v6, "presentViewController:animated:completion:", self->_alertController, 0, 0);

}

- (void)showProgress:(id)a3 immediately:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  double v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v4 = a4;
  v6 = a3;
  if (pthread_main_np() == 1)
  {
    -[UIPrintingProgress _mainQueue_showProgress:immediately:](self, "_mainQueue_showProgress:immediately:", v6, v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v7 = MEMORY[0x1E0C809B0];
    self->_startTime = v8;
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __47__UIPrintingProgress_showProgress_immediately___block_invoke;
    block[3] = &unk_1E9D96E50;
    block[4] = self;
    v10 = v6;
    v11 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __47__UIPrintingProgress_showProgress_immediately___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_showProgress:immediately:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_mainQueue_showProgress:(id)a3 immediately:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  void *v8;
  _BOOL4 forceDisplayAsAlert;
  UIAlertController *alertController;
  void *v11;
  void *v12;
  UIAlertController *v13;
  UIAlertController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  _BOOL4 donePrinting;
  void *v23;
  void *v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  UIPrintingProgressViewController *viewController;
  UIPrintingProgressViewController *v29;
  void *v30;
  UIPrintingProgressViewController *v31;
  UIPrintingProgressViewController *v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  id v38;
  id location;

  v4 = a4;
  v6 = a3;
  if (-[UIPrintingProgress progressVisible](self, "progressVisible") && v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    self->_displayTime = v7;
  }
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "userInterfaceIdiom"))
  {

LABEL_7:
    alertController = self->_alertController;
    if (alertController)
    {
      -[UIAlertController setMessage:](alertController, "setMessage:", v6);
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0DC3450];
      -[UIPrintingProgress title](self, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", v12, v6, 1);
      v13 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
      v14 = self->_alertController;
      self->_alertController = v13;

      objc_initWeak(&location, self);
      v15 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PRINT_PROGRESS_CANCEL_BUTTON"), CFSTR("Cancel"), CFSTR("Localizable"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = MEMORY[0x1E0C809B0];
      v35 = 3221225472;
      v36 = __58__UIPrintingProgress__mainQueue_showProgress_immediately___block_invoke;
      v37 = &unk_1E9D97358;
      objc_copyWeak(&v38, &location);
      objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 1, &v34);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate", v34, v35, v36, v37);
      self->_startTime = v19;
      -[UIAlertController addAction:](self->_alertController, "addAction:", v18);

      objc_destroyWeak(&v38);
      objc_destroyWeak(&location);
    }
    -[UIAlertController actions](self->_alertController, "actions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    donePrinting = self->_donePrinting;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (donePrinting)
    {
      v25 = CFSTR("PRINT_PROGRESS_OK_BUTTON");
      v26 = CFSTR("OK");
    }
    else
    {
      v25 = CFSTR("PRINT_PROGRESS_CANCEL_BUTTON");
      v26 = CFSTR("Cancel");
    }
    objc_msgSend(v23, "localizedStringForKey:value:table:", v25, v26, CFSTR("Localizable"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTitle:", v27);

    if (v4 && !self->_presentingAlert && !objc_msgSend((id)*MEMORY[0x1E0DC4730], "applicationState"))
      -[UIPrintingProgress _presentProgressAlert](self, "_presentProgressAlert");
    goto LABEL_21;
  }
  forceDisplayAsAlert = self->_forceDisplayAsAlert;

  if (forceDisplayAsAlert)
    goto LABEL_7;
  viewController = self->_viewController;
  if (viewController)
  {
    -[UIPrintingProgressViewController setMessage:](viewController, "setMessage:", v6);
  }
  else
  {
    v29 = [UIPrintingProgressViewController alloc];
    -[UIPrintingProgress title](self, "title");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[UIPrintingProgressViewController initWithTitle:message:printingProgress:](v29, "initWithTitle:message:printingProgress:", v30, v6, self);
    v32 = self->_viewController;
    self->_viewController = v31;

    -[UIPrintingProgressViewController show](self->_viewController, "show");
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    self->_displayTime = v33;
  }
  -[UIPrintingProgressViewController setDonePrinting:](self->_viewController, "setDonePrinting:", self->_donePrinting);
LABEL_21:

}

void __58__UIPrintingProgress__mainQueue_showProgress_immediately___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__UIPrintingProgress__mainQueue_showProgress_immediately___block_invoke_2;
  block[3] = &unk_1E9D96D90;
  block[4] = WeakRetained;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void *__58__UIPrintingProgress__mainQueue_showProgress_immediately___block_invoke_2(uint64_t a1)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)objc_msgSend(result, "progressCancel");
  return result;
}

- (void)hideProgressAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD v5[5];
  BOOL v6;

  v3 = a3;
  if (pthread_main_np() == 1)
  {
    -[UIPrintingProgress _mainQueue_hideProgressAnimated:](self, "_mainQueue_hideProgressAnimated:", v3);
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __43__UIPrintingProgress_hideProgressAnimated___block_invoke;
    v5[3] = &unk_1E9D97380;
    v5[4] = self;
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);
  }
}

uint64_t __43__UIPrintingProgress_hideProgressAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_hideProgressAnimated:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_mainQueue_hideProgressAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL4 forceDisplayAsAlert;
  void *v7;
  _QWORD v8[5];

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_endProgress, 0);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "userInterfaceIdiom"))
  {

LABEL_4:
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__UIPrintingProgress__mainQueue_hideProgressAnimated___block_invoke;
    v8[3] = &unk_1E9D96D90;
    v8[4] = self;
    v7 = (void *)MEMORY[0x1D82A9A48](v8);
    -[UIAlertController dismissViewControllerAnimated:completion:](self->_alertController, "dismissViewControllerAnimated:completion:", 1, v7);

    return;
  }
  forceDisplayAsAlert = self->_forceDisplayAsAlert;

  if (forceDisplayAsAlert)
    goto LABEL_4;
  -[UIPrintingProgressViewController dismissAnimated:](self->_viewController, "dismissAnimated:", v3);
}

uint64_t __54__UIPrintingProgress__mainQueue_hideProgressAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "progressAlertWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);

  result = objc_msgSend(*(id *)(a1 + 32), "setProgressAlertWindow:", 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 58) = 0;
  return result;
}

- (void)progressCancel
{
  double v3;

  if (self->_donePrinting)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    self->_startTime = v3 + 100.0;
  }
  else
  {
    _UIPrinterInfoCancelRequests();
    (*((void (**)(void))self->_cancelHandler + 2))();
  }
}

- (void)endProgress
{
  _QWORD block[5];

  if (pthread_main_np() == 1)
  {
    -[UIPrintingProgress _mainQueue_endProgress](self, "_mainQueue_endProgress");
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__UIPrintingProgress_endProgress__block_invoke;
    block[3] = &unk_1E9D96D90;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __33__UIPrintingProgress_endProgress__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_endProgress");
}

- (void)_mainQueue_endProgress
{
  uint64_t v3;
  double v4;
  double v5;
  double displayTime;
  double v7;
  BOOL v8;
  _BOOL4 v9;
  _BOOL8 v10;

  v3 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "applicationState");
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v5 = v4;
  displayTime = self->_displayTime;
  if (-[UIPrintingProgress progressVisible](self, "progressVisible")
    && !v3
    && ((v7 = v5 - displayTime, v5 - displayTime > 0.0) ? (v8 = v7 < 1.0) : (v8 = 0), v8))
  {
    -[UIPrintingProgress performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_endProgress, 0, v7);
  }
  else
  {
    v9 = -[UIPrintingProgress progressVisible](self, "progressVisible");
    if (v3)
      v10 = 0;
    else
      v10 = v9;
    -[UIPrintingProgress hideProgressAnimated:](self, "hideProgressAnimated:", v10);
  }
}

- (void)setPrinterInfoState:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Failed to Contact Printer"), CFSTR("Failed to Contact Printer"), CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintingProgress showProgress:immediately:](self, "showProgress:immediately:", v6, 1);

    -[UIPrintingProgress progressCancel](self, "progressCancel");
    self->_donePrinting = 1;
  }
  else if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Contacting Printer…"), CFSTR("Contacting Printer…"), CFSTR("Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintingProgress showProgress:immediately:](self, "showProgress:immediately:", v4, 1);

  }
}

- (void)setPage:(int64_t)a3 ofPage:(int64_t)a4
{
  void *v5;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  __CFString *v21;

  if (a3 == -2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Preparing…"), CFSTR("Preparing…"), CFSTR("Localizable"));
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 == -1)
    {
      if (self->_creatingPDF)
      {
        v21 = &stru_1E9D97C98;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Sending to Printer…"), CFSTR("Sending to Printer…"), CFSTR("Localizable"));
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      self->_donePrinting = 1;
      goto LABEL_17;
    }
    v7 = a4 - 1;
    if (a4 - 1 >= a3)
      v7 = a3;
    if (a4 <= 0)
      v7 = a3;
    v8 = (void *)MEMORY[0x1E0CB37F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7 + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringFromNumber:numberStyle:", v9, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4 < 1)
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Preparing page %@…"), CFSTR("Preparing page %@…"), CFSTR("Localizable"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", v14, v5);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB37F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringFromNumber:numberStyle:", v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Preparing page %@ of %@…"), CFSTR("Preparing page %@ of %@…"), CFSTR("Localizable"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", v15, v5, v12);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }

LABEL_17:
  if (self->_donePrinting && objc_msgSend((id)*MEMORY[0x1E0DC4730], "applicationState"))
  {
    -[UIPrintingProgress endProgress](self, "endProgress");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v19 = v18;
    -[UIPrintingProgress lastPageUpdate](self, "lastPageUpdate");
    if (v19 > v20 + 2.0)
    {
      -[UIPrintingProgress showProgress:immediately:](self, "showProgress:immediately:", v21, 0);
      -[UIPrintingProgress setLastPageUpdate:](self, "setLastPageUpdate:", v19);
    }
  }

}

- (double)nextPrintDelay
{
  void *v3;
  _BOOL4 forceDisplayAsAlert;
  double v5;
  double v6;
  double v7;
  double startTime;
  double v9;
  double v10;
  UIPrintingProgressViewController *viewController;
  double v12;
  double v13;
  double v14;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom"))
  {

  }
  else
  {
    forceDisplayAsAlert = self->_forceDisplayAsAlert;

    if (!forceDisplayAsAlert)
    {
      v6 = 0.0;
      goto LABEL_9;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v6 = 0.0;
  if (!self->_presentingAlert)
  {
    v7 = v5;
    startTime = self->_startTime;
    -[UIPrintingProgress progressAlertDelay](self, "progressAlertDelay");
    if (v7 >= startTime + v9 && !objc_msgSend((id)*MEMORY[0x1E0DC4730], "applicationState"))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      self->_displayTime = v10;
      -[UIPrintingProgress _presentProgressAlert](self, "_presentProgressAlert");
      v6 = 0.5;
    }
  }
LABEL_9:
  viewController = self->_viewController;
  if (viewController)
  {
    -[UIPrintingProgressViewController rotationDelay](viewController, "rotationDelay");
    if (v12 > 0.0)
    {
      -[UIPrintingProgressViewController rotationDelay](self->_viewController, "rotationDelay");
      v14 = v13 + 0.1;
      if (v6 < v14)
        return v14;
    }
  }
  return v6;
}

- (BOOL)creatingPDF
{
  return self->_creatingPDF;
}

- (void)setCreatingPDF:(BOOL)a3
{
  self->_creatingPDF = a3;
}

- (double)lastPageUpdate
{
  return self->_lastPageUpdate;
}

- (void)setLastPageUpdate:(double)a3
{
  self->_lastPageUpdate = a3;
}

- (double)progressAlertDelay
{
  return self->_progressAlertDelay;
}

- (void)setProgressAlertDelay:(double)a3
{
  self->_progressAlertDelay = a3;
}

- (UIWindowScene)hostingWindowScene
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->_hostingWindowScene);
}

- (void)setHostingWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_hostingWindowScene, a3);
}

- (UIWindow)progressAlertWindow
{
  return (UIWindow *)objc_getProperty(self, a2, 88, 1);
}

- (void)setProgressAlertWindow:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressAlertWindow, 0);
  objc_destroyWeak((id *)&self->_hostingWindowScene);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong((id *)&self->_printerName, 0);
}

@end
