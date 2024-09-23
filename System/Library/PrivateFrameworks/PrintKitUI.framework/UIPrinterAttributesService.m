@implementation UIPrinterAttributesService

+ (id)instance
{
  return objc_alloc_init((Class)a1);
}

- (UIPrinterAttributesService)init
{
  UIPrinterAttributesService *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIPrinterAttributesService;
  result = -[UIPrinterAttributesService init](&v3, sel_init);
  if (result)
    result->_printerWarningPollTime = -1;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  self->_printerWarningPollTime = -1;
  v2.receiver = self;
  v2.super_class = (Class)UIPrinterAttributesService;
  -[UIPrinterAttributesService dealloc](&v2, sel_dealloc);
}

- (void)startPollForPrinterWarningStatus:(id)a3 completionHandler:(id)a4
{
  id v7;
  void *v8;
  id completionHandler;
  id v10;

  v10 = a3;
  v7 = a4;
  if (!v10)
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  if (self->_printerWarningPollTime < 0)
  {
    self->_printerWarningPollTime = 3;
    v8 = (void *)MEMORY[0x1D82A9A48](v7);
    completionHandler = self->_completionHandler;
    self->_completionHandler = v8;

    objc_storeStrong((id *)&self->_printer, a3);
    -[UIPrinterAttributesService pollForPrinterWarningStatus](self, "pollForPrinterWarningStatus");
  }

}

- (void)pollForPrinterWarningStatus
{
  PKPrinter *v3;
  uint64_t v4;
  id v5;
  PKPrinter *v6;
  _QWORD v7[4];
  PKPrinter *v8;
  id v9;
  id location;

  if (self->_printer)
  {
    objc_initWeak(&location, self);
    v3 = self->_printer;
    v4 = MEMORY[0x1E0C80D38];
    v5 = MEMORY[0x1E0C80D38];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__UIPrinterAttributesService_pollForPrinterWarningStatus__block_invoke;
    v7[3] = &unk_1E9D977E0;
    objc_copyWeak(&v9, &location);
    v6 = v3;
    v8 = v6;
    -[PKPrinter pollForPrinterStatusQueue:completionHandler:](v6, "pollForPrinterStatusQueue:completionHandler:", v4, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __57__UIPrinterAttributesService_pollForPrinterWarningStatus__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_updatePolledPrinterState:forPrinter:", v4, *(_QWORD *)(a1 + 32));

}

- (void)_updatePolledPrinterState:(id)a3 forPrinter:(id)a4
{
  id v6;
  PKPrinter *v7;
  id completionHandler;
  PKPrinter *printer;
  void *v10;
  void *v11;
  dispatch_time_t v12;
  _QWORD block[4];
  id v14;
  id location;

  v6 = a3;
  v7 = (PKPrinter *)a4;
  completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    printer = self->_printer;
    if (printer == v7)
    {
      if (v6)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D80BE0]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\n"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        (*((void (**)(void))self->_completionHandler + 2))();
        if (self->_printerWarningPollTime >= 1)
        {
          objc_initWeak(&location, self);
          v12 = dispatch_time(0, 1000000000 * self->_printerWarningPollTime);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __67__UIPrinterAttributesService__updatePolledPrinterState_forPrinter___block_invoke;
          block[3] = &unk_1E9D97150;
          objc_copyWeak(&v14, &location);
          dispatch_after(v12, MEMORY[0x1E0C80D38], block);
          objc_destroyWeak(&v14);
          objc_destroyWeak(&location);
        }

      }
      else
      {
        (*((void (**)(id, _QWORD, _QWORD))completionHandler + 2))(completionHandler, 0, 0);
      }
    }
    else
    {
      NSLog(CFSTR("polled state for printer %p - current printer %p"), v7, printer);
    }
  }
  else
  {
    NSLog(CFSTR("polled state for printer %p - ignored"), v7);
  }

}

void __67__UIPrinterAttributesService__updatePolledPrinterState_forPrinter___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pollForPrinterWarningStatus");

}

- (void)stopPrinterWarningPolling
{
  self->_printerWarningPollTime = -1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_printer, 0);
}

@end
