@implementation VSImageLoadOperation

- (VSImageLoadOperation)init
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

- (VSImageLoadOperation)initWithItemProvider:(id)a3 preferredImageSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v8;
  VSImageLoadOperation *v9;
  VSImageLoadOperation *v10;
  VSOptional *v11;
  VSOptional *v12;
  objc_super v14;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VSImageLoadOperation;
  v9 = -[VSImageLoadOperation init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemProvider, a3);
    v10->_preferredImageSize.width = width;
    v10->_preferredImageSize.height = height;
    v11 = (VSOptional *)objc_alloc_init(MEMORY[0x24BDF8C38]);
    v12 = v10->_result;
    v10->_result = v11;

  }
  return v10;
}

- (void)_finishWithImageData:(id)a3 orError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    VSDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = v6;
      _os_log_impl(&dword_2303C5000, v8, OS_LOG_TYPE_DEFAULT, "Did load image data %@", (uint8_t *)&v21, 0xCu);
    }

    v9 = v6;
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithData:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)MEMORY[0x24BDF8C38];
      objc_msgSend(MEMORY[0x24BDF8BF0], "failableWithObject:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "optionalWithObject:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSImageLoadOperation setResult:](self, "setResult:", v13);
    }
    else
    {
      VSErrorLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[VSImageLoadOperation _finishWithImageData:orError:].cold.2(v18);

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 256, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x24BDF8C38];
      objc_msgSend(MEMORY[0x24BDF8BF0], "failableWithError:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "optionalWithObject:", v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSImageLoadOperation setResult:](self, "setResult:", v20);

    }
  }
  else
  {
    VSErrorLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[VSImageLoadOperation _finishWithImageData:orError:].cold.1((uint64_t)v7, v14);

    if (!v7)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The errorOrNil parameter must not be nil."));
    v15 = (void *)MEMORY[0x24BDF8C38];
    v16 = (void *)MEMORY[0x24BDF8BF0];
    v17 = v7;
    objc_msgSend(v16, "failableWithError:", v17);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "optionalWithObject:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[VSImageLoadOperation setResult:](self, "setResult:", v10);
  }

  -[VSAsyncOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
}

- (void)_beginFetchingDataFromURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t, void *);
  void *v14;
  id v15;
  id location;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD1858];
  -[VSImageLoadOperation auditToken](self, "auditToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vs_defaultSessionConfigurationForSourceAppWithAuditToken:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16B0]), "initWithURL:", v4);
  objc_msgSend(v9, "_setNonAppInitiated:", -[VSImageLoadOperation isNonAppInitiated](self, "isNonAppInitiated"));
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __50__VSImageLoadOperation__beginFetchingDataFromURL___block_invoke;
  v14 = &unk_24FE1AE98;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v8, "dataTaskWithRequest:completionHandler:", v9, &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSImageLoadOperation setTask:](self, "setTask:", v10, v11, v12, v13, v14);
  objc_msgSend(v10, "resume");

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __50__VSImageLoadOperation__beginFetchingDataFromURL___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_finishWithImageData:orError:", v7, v6);

}

- (void)executionDidBegin
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  id location;
  uint8_t buf[4];
  VSImageLoadOperation *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = (void *)MEMORY[0x24BDD1968];
  -[VSImageLoadOperation preferredImageSize](self, "preferredImageSize");
  objc_msgSend(v4, "valueWithCGSize:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, *MEMORY[0x24BDD0E58]);

  objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x24BDD0E48], *MEMORY[0x24BDD0E50]);
  objc_initWeak(&location, self);
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __41__VSImageLoadOperation_executionDidBegin__block_invoke;
  v16 = &unk_24FE1AEC0;
  objc_copyWeak(&v17, &location);
  v6 = (void *)MEMORY[0x2348B90BC](&v13);
  v10 = (void *)MEMORY[0x2348B90BC](v6, v7, v8, v9);
  VSDefaultLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = self;
    _os_log_impl(&dword_2303C5000, v11, OS_LOG_TYPE_DEFAULT, "Will load image %@", buf, 0xCu);
  }

  -[VSImageLoadOperation itemProvider](self, "itemProvider", v13, v14, v15, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "loadItemForTypeIdentifier:options:completionHandler:", *MEMORY[0x24BDC17A0], v3, v10);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __41__VSImageLoadOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v11)
    {
      objc_msgSend(WeakRetained, "_beginFetchingDataFromURL:", v11);
    }
    else
    {
      if (!v5)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The errorOrNil parameter must not be nil."));
      v8 = (void *)MEMORY[0x24BDF8C38];
      objc_msgSend(MEMORY[0x24BDF8BF0], "failableWithError:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "optionalWithObject:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setResult:", v10);

      objc_msgSend(v7, "finishExecutionIfPossible");
    }
  }

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSImageLoadOperation;
  -[VSAsyncOperation cancel](&v4, sel_cancel);
  -[VSImageLoadOperation task](self, "task");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[VSAsyncOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
}

- (BOOL)isNonAppInitiated
{
  return self->_nonAppInitiated;
}

- (void)setNonAppInitiated:(BOOL)a3
{
  self->_nonAppInitiated = a3;
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (CGSize)preferredImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredImageSize.width;
  height = self->_preferredImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (VSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSURLSessionTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
}

- (void)_finishWithImageData:(uint64_t)a1 orError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2303C5000, a2, OS_LOG_TYPE_ERROR, "Error loading image data: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_finishWithImageData:(os_log_t)log orError:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2303C5000, log, OS_LOG_TYPE_ERROR, "Unable to construct image from data.", v1, 2u);
}

@end
