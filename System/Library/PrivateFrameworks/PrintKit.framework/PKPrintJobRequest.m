@implementation PKPrintJobRequest

- (PKPrintJobRequest)initWithPrinterName:(id)a3
{
  id v5;
  PKPrintJobRequest *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPrintJobRequest;
  v6 = -[PKPrintJobRequest init](&v10, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.printing.JobStreamQueue", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_printerName, a3);
  }

  return v6;
}

- (void)_establishedJob:(id)a3 fileHandle:(id)a4
{
  PKPrinterTool_Client *v6;
  NSFileHandle *v7;
  PKPrinterTool_Client *job_connection;
  NSFileHandle *streamHandle;
  PKPrinterTool_Client *v10;

  v6 = (PKPrinterTool_Client *)a3;
  v7 = (NSFileHandle *)a4;
  job_connection = self->_job_connection;
  self->_job_connection = v6;
  v10 = v6;

  streamHandle = self->_streamHandle;
  self->_streamHandle = v7;

}

- (void)startRequestCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  OS_dispatch_queue *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  OS_dispatch_queue *v11;
  _QWORD v12[4];
  OS_dispatch_queue *v13;
  id v14;
  id v15;
  id v16;
  id location;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (v5)
  {
    v6 = self->_queue;
    -[PKPrintJobRequest fileType](self, "fileType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPrintJobRequest printSettings](self, "printSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFileType:", v7);

    objc_initWeak(&location, self);
    -[PKPrintJobRequest printerName](self, "printerName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPrintJobRequest printSettings](self, "printSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __51__PKPrintJobRequest_startRequestCompletionHandler___block_invoke;
    v12[3] = &unk_24E6CE4B0;
    v15 = v4;
    v11 = v6;
    v13 = v11;
    objc_copyWeak(&v16, &location);
    v14 = v5;
    objc_msgSend(v14, "startStreamingRequest:printSettings:completionHandler:", v9, v10, v12);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __51__PKPrintJobRequest_startRequestCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    v4 = *(NSObject **)(a1 + 32);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __51__PKPrintJobRequest_startRequestCompletionHandler___block_invoke_2;
    v5[3] = &unk_24E6CE488;
    objc_copyWeak(&v9, (id *)(a1 + 56));
    v6 = *(id *)(a1 + 40);
    v7 = v3;
    v8 = *(id *)(a1 + 48);
    dispatch_async(v4, v5);

    objc_destroyWeak(&v9);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __51__PKPrintJobRequest_startRequestCompletionHandler___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  id v7;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(v2);
    objc_msgSend(v4, "_establishedJob:fileHandle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v5 = *(void **)(a1 + 40);
    v7 = 0;
    objc_msgSend(v5, "closeAndReturnError:", &v7);
    v6 = v7;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

- (void)writeRequestData:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSFileHandle *streamHandle;
  NSFileHandle *v9;
  NSObject *queue;
  NSFileHandle *v11;
  NSObject *v12;
  _QWORD block[4];
  NSFileHandle *v14;
  id v15;
  id v16;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (self->_job_connection && (streamHandle = self->_streamHandle) != 0)
  {
    v9 = streamHandle;
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__PKPrintJobRequest_writeRequestData_completionHandler___block_invoke;
    block[3] = &unk_24E6CE4D8;
    v14 = v9;
    v15 = v6;
    v16 = v7;
    v11 = v9;
    dispatch_async(queue, block);

  }
  else
  {
    _PKLogCategory(PKLogCategoryFramework);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_220F9A000, v12, OS_LOG_TYPE_ERROR, "no stream to send bytes to", buf, 2u);
    }

    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __56__PKPrintJobRequest_writeRequestData_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v6 = 0;
  objc_msgSend(v2, "writeData:error:", v3, &v6);
  v4 = v6;
  if (v4)
  {
    _PKLogCategory(PKLogCategoryFramework);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v4;
      _os_log_impl(&dword_220F9A000, v5, OS_LOG_TYPE_ERROR, "Could not write to job stream %@", buf, 0xCu);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }

}

- (void)finishRequest:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__PKPrintJobRequest_finishRequest_completionHandler___block_invoke;
  block[3] = &unk_24E6CE500;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

uint64_t __53__PKPrintJobRequest_finishRequest_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRequest0:completionHandler:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)finishRequest0:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSFileHandle *streamHandle;
  NSFileHandle *v8;
  PKPrinterTool_Client *v9;
  PKPrinterTool_Client *job_connection;
  _QWORD v11[4];
  PKPrinterTool_Client *v12;
  id v13;
  uint64_t v14;

  v4 = a3;
  v6 = a4;
  streamHandle = self->_streamHandle;
  if (streamHandle)
  {
    v14 = 0;
    -[NSFileHandle closeAndReturnError:](streamHandle, "closeAndReturnError:", &v14);
    v8 = self->_streamHandle;
    self->_streamHandle = 0;

  }
  v9 = self->_job_connection;
  job_connection = self->_job_connection;
  self->_job_connection = 0;

  if (v9)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __54__PKPrintJobRequest_finishRequest0_completionHandler___block_invoke;
    v11[3] = &unk_24E6CE410;
    v12 = v9;
    v13 = v6;
    -[PKPrinterTool_Client finishRequestWithCancel:completionHandler:](v12, "finishRequestWithCancel:completionHandler:", v4, v11);

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

void __54__PKPrintJobRequest_finishRequest0_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (PKPrinterBonjourEndpoint)printerName
{
  return (PKPrinterBonjourEndpoint *)objc_getProperty(self, a2, 32, 1);
}

- (PKPrintSettings)printSettings
{
  return (PKPrintSettings *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPrintSettings:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)fileType
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFileType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileType, 0);
  objc_storeStrong((id *)&self->_printSettings, 0);
  objc_storeStrong((id *)&self->_printerName, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_streamHandle, 0);
  objc_storeStrong((id *)&self->_job_connection, 0);
}

@end
