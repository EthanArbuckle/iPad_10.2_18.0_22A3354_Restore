@implementation UIPrinterInfoRequest

+ (id)requestInfoForPrinter:(id)a3
{
  id v4;
  UIPrinterInfoRequest *v5;
  UIPrinterInfoRequest *v6;

  v4 = a3;
  v5 = objc_alloc_init(UIPrinterInfoRequest);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_printer, a3);
    v6->_requestState = 0;
    -[UIPrinterInfoRequest requestPrinterInfo](v6, "requestPrinterInfo");
  }

  return v6;
}

- (void)requestPrinterInfo
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__UIPrinterInfoRequest_requestPrinterInfo__block_invoke;
  block[3] = &unk_1E9D96D90;
  block[4] = self;
  dispatch_async(v3, block);

}

void __42__UIPrinterInfoRequest_requestPrinterInfo__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "printInfoSupported");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPrinterInfo:", v2);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__UIPrinterInfoRequest_requestPrinterInfo__block_invoke_2;
  block[3] = &unk_1E9D96D90;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __42__UIPrinterInfoRequest_requestPrinterInfo__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "printerInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    v3 = 1;
  else
    v3 = 2;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = v3;

  result = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(result + 24);
  if (v5)
  {
    v6 = *(unsigned int *)(result + 16);
    objc_msgSend((id)result, "printerInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, v6, v7);

    return objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
  }
  return result;
}

- (int)requestState
{
  return self->_requestState;
}

- (void)setRequestState:(int)a3
{
  self->_requestState = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)printerInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPrinterInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printerInfo, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_printer, 0);
}

@end
