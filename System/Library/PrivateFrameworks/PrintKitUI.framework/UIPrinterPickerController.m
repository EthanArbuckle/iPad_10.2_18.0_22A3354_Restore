@implementation UIPrinterPickerController

+ (UIPrinterPickerController)printerPickerControllerWithInitiallySelectedPrinter:(UIPrinter *)printer
{
  UIPrinter *v3;
  UIPrinterPickerController *v4;

  v3 = printer;
  v4 = -[UIPrinterPickerController initWithInitiallySelectedPrinter:]([UIPrinterPickerController alloc], "initWithInitiallySelectedPrinter:", v3);

  return v4;
}

- (UIPrinterPickerController)initWithInitiallySelectedPrinter:(id)a3
{
  id v3;
  UIPrinterPickerController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIPrinterPickerController;
  v3 = a3;
  v4 = -[UIPrinterPickerController init](&v6, sel_init);
  -[UIPrinterPickerController setSelectedPrinter:](v4, "setSelectedPrinter:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (BOOL)presentAnimated:(BOOL)a3 hostingScene:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *WeakRetained;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  BOOL v20;
  CGRect v22;
  CGRect v23;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if (v11)
  {
    NSLog(CFSTR("WARNING: Calling -[UIPrinterPickerController presentAnimated:completionHandler:] on iPad"));
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_findUISceneForLegacyInterfaceOrientation");
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v8, "windows");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "bounds");
    x = v22.origin.x;
    y = v22.origin.y;
    width = v22.size.width;
    height = v22.size.height;
    MidX = CGRectGetMidX(v22);
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    v20 = -[UIPrinterPickerController presentFromRect:inView:animated:completionHandler:](self, "presentFromRect:inView:animated:completionHandler:", WeakRetained, v6, v9, MidX, CGRectGetMidY(v23), 0.0, 0.0);
  }
  else
  {
    if (!-[UIPrinterPickerController _setupPickerPanel:](self, "_setupPickerPanel:", v9))
    {
      v20 = 0;
      goto LABEL_10;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "printerPickerControllerWillPresent:", self);
    objc_msgSend(*((id *)self->_state + 1), "presentPrinterPickerPanelAnimated:hostingScene:", v6, v8);
    v20 = 1;
  }

LABEL_10:
  return v20;
}

- (BOOL)presentAnimated:(BOOL)animated completionHandler:(UIPrinterPickerCompletionHandler)completion
{
  return -[UIPrinterPickerController presentAnimated:hostingScene:completionHandler:](self, "presentAnimated:hostingScene:completionHandler:", animated, 0, completion);
}

- (BOOL)presentFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated completionHandler:(UIPrinterPickerCompletionHandler)completion
{
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;
  UIView *v13;
  UIPrinterPickerCompletionHandler v14;
  void *v15;
  uint64_t v16;
  void *WeakRetained;
  BOOL v18;
  void *v19;

  v7 = animated;
  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  v13 = view;
  v14 = completion;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  if (v16)
  {
    if (!-[UIPrinterPickerController _setupPickerPanel:](self, "_setupPickerPanel:", v14))
    {
      v18 = 0;
      goto LABEL_9;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "printerPickerControllerWillPresent:", self);
    objc_msgSend(*((id *)self->_state + 1), "presentPrinterPickerPanelFromRect:inView:animated:", v13, v7, x, y, width, height);
    v18 = 1;
  }
  else
  {
    NSLog(CFSTR("WARNING: Calling -[UIPrinterPickerController presentFromRect:animated:completionHandler:] on iPhone."));
    -[UIView window](v13, "window");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "windowScene");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[UIPrinterPickerController presentAnimated:hostingScene:completionHandler:](self, "presentAnimated:hostingScene:completionHandler:", v7, v19, v14);

  }
LABEL_9:

  return v18;
}

- (BOOL)presentFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated completionHandler:(UIPrinterPickerCompletionHandler)completion
{
  _BOOL8 v6;
  UIBarButtonItem *v8;
  UIPrinterPickerCompletionHandler v9;
  void *v10;
  uint64_t v11;
  void *WeakRetained;
  BOOL v13;
  void *v14;
  void *v15;

  v6 = animated;
  v8 = item;
  v9 = completion;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if (v11)
  {
    if (!-[UIPrinterPickerController _setupPickerPanel:](self, "_setupPickerPanel:", v9))
    {
      v13 = 0;
      goto LABEL_9;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "printerPickerControllerWillPresent:", self);
    objc_msgSend(*((id *)self->_state + 1), "presentPrinterPickerPanelFromBarButtonItem:animated:", v8, v6);
    v13 = 1;
  }
  else
  {
    NSLog(CFSTR("WARNING: Calling -[UIPrinterPickerController presentFromBarButtonItem:animated:completionHandler:] on iPhone."));
    -[UIBarButtonItem _viewForPresenting](v8, "_viewForPresenting");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "windowScene");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[UIPrinterPickerController presentAnimated:hostingScene:completionHandler:](self, "presentAnimated:hostingScene:completionHandler:", v6, v15, v9);

  }
LABEL_9:

  return v13;
}

- (BOOL)_setupPickerPanel:(id)a3
{
  id v4;
  _QWORD *state;
  void *v6;
  BOOL v7;
  UIPrinterPickerControllerInternals *v9;
  id v10;
  void *v11;
  id completionHandler;
  id WeakRetained;
  void *v14;
  UIPrinterPickerViewController *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  if (_UIApplicationIsExtension())
  {
    NSLog(CFSTR("Printing is unavailable in App Extensions"));
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  state = self->_state;
  if (state)
  {
    v6 = (void *)state[1];
    if (v6)
      objc_msgSend(v6, "dismissAnimated:", 1);
    goto LABEL_6;
  }
  v9 = objc_alloc_init(UIPrinterPickerControllerInternals);
  v10 = self->_state;
  self->_state = v9;

  v11 = (void *)objc_msgSend(v4, "copy");
  completionHandler = self->_completionHandler;
  self->_completionHandler = v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "printerPickerControllerParentViewController:", self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  v15 = -[UIPrinterPickerViewController initWithPrinterPickerController:inParentController:]([UIPrinterPickerViewController alloc], "initWithPrinterPickerController:inParentController:", self, v14);
  v16 = self->_state;
  v17 = (void *)v16[1];
  v16[1] = v15;

  -[UIPrinterPickerController selectedPrinter](self, "selectedPrinter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[UIPrinterPickerController selectedPrinter](self, "selectedPrinter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_internalPrinter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)self->_state + 1), "setPrinter:", v20);

  }
  v7 = 1;
LABEL_7:

  return v7;
}

- (void)_printerPickerDidPresent
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "printerPickerControllerDidPresent:", self);

}

- (void)_printerPickerWillDismiss
{
  void *v3;
  char v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(*((id *)self->_state + 1), "userSelectedPrinter"))
  {
    objc_msgSend(WeakRetained, "printerPickerControllerDidSelectPrinter:", self);
  }
  v3 = WeakRetained;
  if (!*((_BYTE *)self->_state + 16))
  {
    v4 = objc_opt_respondsToSelector();
    v3 = WeakRetained;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "printerPickerControllerWillDismiss:", self);
      v3 = WeakRetained;
    }
  }

}

- (void)_printerPickerDidDismiss
{
  id *state;
  void *v4;
  UIPrinter *v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  void (**completionHandler)(id, UIPrinterPickerController *, uint64_t, _QWORD);
  id v12;
  id v13;
  id WeakRetained;

  state = (id *)self->_state;
  if (state)
  {
    objc_msgSend(state[1], "printer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = [UIPrinter alloc];
      objc_msgSend(*((id *)self->_state + 1), "printer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[UIPrinter _initWithPrinter:](v5, "_initWithPrinter:", v6);
      -[UIPrinterPickerController setSelectedPrinter:](self, "setSelectedPrinter:", v7);

    }
    v8 = objc_msgSend(*((id *)self->_state + 1), "userSelectedPrinter");
    v9 = self->_state;
    v10 = (void *)v9[1];
    v9[1] = 0;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (!*((_BYTE *)self->_state + 16) && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "printerPickerControllerDidDismiss:", self);
    completionHandler = (void (**)(id, UIPrinterPickerController *, uint64_t, _QWORD))self->_completionHandler;
    if (completionHandler)
    {
      completionHandler[2](completionHandler, self, v8, 0);
      v12 = self->_completionHandler;
      self->_completionHandler = 0;

    }
    v13 = self->_state;
    self->_state = 0;

    objc_storeWeak((id *)&self->_delegate, 0);
  }
}

- (BOOL)_delegateFiltersPrinters
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (BOOL)_shouldShowPrinter:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(WeakRetained, "printerPickerController:shouldShowPrinter:", self, v4);
  else
    v6 = 1;

  return v6;
}

- (void)dismissAnimated:(BOOL)animated
{
  _BYTE *state;

  state = self->_state;
  if (state)
  {
    state[16] = 1;
    objc_msgSend(*((id *)self->_state + 1), "dismissAnimated:", animated);
  }
}

- (UIPrinter)selectedPrinter
{
  return self->_selectedPrinter;
}

- (void)setSelectedPrinter:(id)a3
{
  objc_storeStrong((id *)&self->_selectedPrinter, a3);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedPrinter, 0);
  objc_storeStrong(&self->_state, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
