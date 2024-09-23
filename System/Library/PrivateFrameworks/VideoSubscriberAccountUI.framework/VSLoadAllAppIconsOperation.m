@implementation VSLoadAllAppIconsOperation

- (VSLoadAllAppIconsOperation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VSLoadAllAppIconsOperation)initWithApps:(id)a3 shouldPrecomposeIcon:(BOOL)a4
{
  id v6;
  VSLoadAllAppIconsOperation *v7;
  VSLoadAllAppIconsOperation *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VSLoadAllAppIconsOperation;
  v7 = -[VSLoadAllAppIconsOperation init](&v10, sel_init);
  v8 = v7;
  if (v7)
    commonInit_1((id *)&v7->super.super.super.isa, v6, a4, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));

  return v8;
}

- (VSLoadAllAppIconsOperation)initWithApps:(id)a3 shouldPrecomposeIcon:(BOOL)a4 preferredSize:(CGSize)a5
{
  double height;
  double width;
  id v9;
  VSLoadAllAppIconsOperation *v10;
  VSLoadAllAppIconsOperation *v11;
  objc_super v13;

  height = a5.height;
  width = a5.width;
  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VSLoadAllAppIconsOperation;
  v10 = -[VSLoadAllAppIconsOperation init](&v13, sel_init);
  v11 = v10;
  if (v10)
    commonInit_1((id *)&v10->super.super.super.isa, v9, a4, width, height);

  return v11;
}

- (void)setResultCompletionBlock:(id)a3
{
  void *v4;
  id resultCompletionBlock;

  v4 = (void *)MEMORY[0x2348B90BC](a3, a2);
  resultCompletionBlock = self->_resultCompletionBlock;
  self->_resultCompletionBlock = v4;

}

- (void)executionDidBegin
{
  void *v7;

  objc_msgSend(a2, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_2303C5000, a4, OS_LOG_TYPE_ERROR, "No icon URL for %@", a1, 0xCu);

}

uint64_t __47__VSLoadAllAppIconsOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "appDescriptions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 134217984;
    v10 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_2303C5000, v2, OS_LOG_TYPE_DEFAULT, "Finished Loading %lu Images", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "resultCompletionBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(_QWORD **)(a1 + 32);
    v6 = v5[36];
    objc_msgSend(v5, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
  return objc_msgSend(*(id *)(a1 + 32), "finishExecutionIfPossible");
}

void __47__VSLoadAllAppIconsOperation_executionDidBegin__block_invoke_9(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[5];
  id v9;
  id location;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 48));
  objc_copyWeak(&location, (id *)(a1 + 56));
  v2 = objc_loadWeakRetained(&location);
  objc_msgSend(v2, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forceUnwrapObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__VSLoadAllAppIconsOperation_executionDidBegin__block_invoke_2;
  v8[3] = &unk_24FE1A688;
  objc_copyWeak(&v9, &to);
  v6 = *(_QWORD *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __47__VSLoadAllAppIconsOperation_executionDidBegin__block_invoke_3;
  v7[3] = &unk_24FE19D18;
  v7[4] = v6;
  objc_msgSend(v4, "unwrapObject:error:", v8, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  objc_destroyWeak(&to);
}

void __47__VSLoadAllAppIconsOperation_executionDidBegin__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  int v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_msgSend(WeakRetained, "shouldPrecomposeIcon");

  if (v4)
  {
    objc_msgSend(v7, "_applicationIconImageForFormat:precomposed:", 0, 1);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v5;
  }
  else
  {
    v6 = v7;
  }
  v8 = v6;
  objc_msgSend(*(id *)(a1 + 32), "setIcon:", v6);

}

void __47__VSLoadAllAppIconsOperation_executionDidBegin__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47__VSLoadAllAppIconsOperation_executionDidBegin__block_invoke_3_cold_1((uint64_t)v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "setError:", v3);
}

- (void)cancel
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v6.receiver = self;
  v6.super_class = (Class)VSLoadAllAppIconsOperation;
  -[VSAsyncOperation cancel](&v6, sel_cancel);
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[VSLoadAllAppIconsOperation appDescriptions](self, "appDescriptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 134217984;
    v8 = v5;
    _os_log_impl(&dword_2303C5000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling Loading %lu Images", buf, 0xCu);

  }
  -[VSAsyncOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
}

- (BOOL)shouldPrecomposeIcon
{
  return self->_shouldPrecomposeIcon;
}

- (void)setShouldPrecomposeIcon:(BOOL)a3
{
  self->_shouldPrecomposeIcon = a3;
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (NSArray)appDescriptions
{
  return self->_appDescriptions;
}

- (void)setAppDescriptions:(id)a3
{
  objc_storeStrong((id *)&self->_appDescriptions, a3);
}

- (CGSize)preferredSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredSize.width;
  height = self->_preferredSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredSize:(CGSize)a3
{
  self->_preferredSize = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (id)resultCompletionBlock
{
  return self->_resultCompletionBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultCompletionBlock, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_appDescriptions, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
}

void __47__VSLoadAllAppIconsOperation_executionDidBegin__block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2303C5000, a2, OS_LOG_TYPE_ERROR, "Failed to set App Icon: %@", (uint8_t *)&v2, 0xCu);
}

@end
