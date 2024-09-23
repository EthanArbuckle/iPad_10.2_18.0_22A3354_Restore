@implementation SKUITemplateLoader

- (SKUITemplateLoader)initWithURLs:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUITemplateLoader *v16;
  uint64_t v17;
  NSArray *URLs;
  uint64_t v19;
  id completionBlock;
  NSOperationQueue *v21;
  NSOperationQueue *operationQueue;
  uint64_t v23;
  NSRegularExpression *templateParsingRegularExpression;
  NSMutableArray *v25;
  NSMutableArray *errors;
  NSMutableDictionary *v27;
  NSMutableDictionary *templateStrings;
  objc_super v30;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUITemplateLoader initWithURLs:completionBlock:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v30.receiver = self;
  v30.super_class = (Class)SKUITemplateLoader;
  v16 = -[SKUITemplateLoader init](&v30, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v6, "copy");
    URLs = v16->_URLs;
    v16->_URLs = (NSArray *)v17;

    v19 = objc_msgSend(v7, "copy");
    completionBlock = v16->_completionBlock;
    v16->_completionBlock = (id)v19;

    v21 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v16->_operationQueue;
    v16->_operationQueue = v21;

    -[NSOperationQueue setName:](v16->_operationQueue, "setName:", CFSTR("com.apple.StoreKit.SKUITemplateLoader"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v16->_operationQueue, "setMaxConcurrentOperationCount:", 4);
    +[SKUITemplateParsingDataProvider templateParsingRegularExpression](SKUITemplateParsingDataProvider, "templateParsingRegularExpression");
    v23 = objc_claimAutoreleasedReturnValue();
    templateParsingRegularExpression = v16->_templateParsingRegularExpression;
    v16->_templateParsingRegularExpression = (NSRegularExpression *)v23;

    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    errors = v16->_errors;
    v16->_errors = v25;

    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    templateStrings = v16->_templateStrings;
    v16->_templateStrings = v27;

  }
  return v16;
}

- (id)_operationWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SKUITemplateParsingDataProvider *v7;
  void *v8;
  SKUITemplateParsingDataProvider *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id from;
  id location;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF5C8]), "initWithURL:", v4);
  objc_msgSend(v5, "setAllowedRetryCount:", 1);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF698]), "initWithURLRequestProperties:", v5);
  objc_msgSend(v6, "setRecordsMetrics:", 1);
  objc_msgSend(v6, "setITunesStoreRequest:", 1);
  v7 = [SKUITemplateParsingDataProvider alloc];
  -[SKUITemplateLoader templateParsingRegularExpression](self, "templateParsingRegularExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SKUITemplateParsingDataProvider initWithRegularExpression:](v7, "initWithRegularExpression:", v8);
  objc_msgSend(v6, "setDataConsumer:", v9);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v6);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__SKUITemplateLoader__operationWithURL___block_invoke;
  v11[3] = &unk_1E73A6260;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, &from);
  objc_msgSend(v6, "setOutputBlock:", v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v6;
}

void __40__SKUITemplateLoader__operationWithURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = objc_loadWeakRetained((id *)(a1 + 40));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__SKUITemplateLoader__operationWithURL___block_invoke_2;
  v12[3] = &unk_1E73A1350;
  v13 = v6;
  v14 = v5;
  v15 = WeakRetained;
  v16 = v8;
  v9 = v8;
  v10 = v5;
  v11 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

uint64_t __40__SKUITemplateLoader__operationWithURL___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  if (*(_QWORD *)(a1 + 32))
    return objc_msgSend(*(id *)(a1 + 48), "_operation:didFailWithError:", *(_QWORD *)(a1 + 56));
  v2 = *(_QWORD *)(a1 + 40);
  if (!v2)
    return objc_msgSend(*(id *)(a1 + 48), "_operation:didFailWithError:", *(_QWORD *)(a1 + 56));
  else
    return objc_msgSend(*(id *)(a1 + 48), "_operation:didCompleteWithOutput:", *(_QWORD *)(a1 + 56), v2);
}

- (void)_operation:(id)a3 didCompleteWithOutput:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__SKUITemplateLoader__operation_didCompleteWithOutput___block_invoke;
  v10[3] = &unk_1E73A5BB0;
  v11 = v6;
  v9 = v6;
  v7 = a4;
  +[SKUIMetricsAppLaunchEvent withPendingLaunchEvent:](SKUIMetricsAppLaunchEvent, "withPendingLaunchEvent:", v10);
  -[SKUITemplateLoader templateStrings](self, "templateStrings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEntriesFromDictionary:", v7);

  -[SKUITemplateLoader _operationDidFinish:](self, "_operationDidFinish:", v9);
}

void __55__SKUITemplateLoader__operation_didCompleteWithOutput___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  SKUIMetricsTemplateLoad *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "metricsPageEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(SKUIMetricsTemplateLoad);
    objc_msgSend(v3, "requestStartTime");
    -[SKUIMetricsTemplateLoad setRequestStartTime:](v4, "setRequestStartTime:");
    objc_msgSend(v3, "responseStartTime");
    -[SKUIMetricsTemplateLoad setResponseStartTime:](v4, "setResponseStartTime:");
    objc_msgSend(v3, "responseEndTime");
    -[SKUIMetricsTemplateLoad setResponseEndTime:](v4, "setResponseEndTime:");
    -[SKUIMetricsTemplateLoad setResponseWasCached:](v4, "setResponseWasCached:", objc_msgSend(v3, "isCachedResponse"));
    objc_msgSend(*(id *)(a1 + 32), "URLRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTemplateLoadTimingMetric:forURL:", v4, v6);

  }
}

- (void)_operation:(id)a3 didFailWithError:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  -[SKUITemplateLoader errors](self, "errors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

  -[SKUITemplateLoader _operationDidFinish:](self, "_operationDidFinish:", v8);
}

- (void)_operationDidFinish:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  SKUITemplateLoader *retainSelf;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[SKUITemplateLoader setPendingOperationCount:](self, "setPendingOperationCount:", -[SKUITemplateLoader pendingOperationCount](self, "pendingOperationCount", a3) - 1);
  if (!-[SKUITemplateLoader pendingOperationCount](self, "pendingOperationCount"))
  {
    -[SKUITemplateLoader errors](self, "errors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    -[SKUITemplateLoader errors](self, "errors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 == 1)
    {
      objc_msgSend(v6, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = objc_msgSend(v6, "count");

      if (v9 < 2)
      {
        v8 = 0;
        goto LABEL_8;
      }
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v15 = CFSTR("SKUITemplateLoaderErrorUnderlyingErrorsKey");
      -[SKUITemplateLoader errors](self, "errors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("SKUITemplateLoaderErrorDomain"), 561278320, v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
LABEL_8:
    -[SKUITemplateLoader completionBlock](self, "completionBlock");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[SKUITemplateLoader templateStrings](self, "templateStrings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v12)[2](v12, v13, v8);

    retainSelf = self->_retainSelf;
    self->_retainSelf = 0;

  }
}

- (void)load
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[SKUITemplateLoader URLs](self, "URLs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SKUITemplateLoader URLs](self, "URLs", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[SKUITemplateLoader _operationWithURL:](self, "_operationWithURL:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  -[SKUITemplateLoader setPendingOperationCount:](self, "setPendingOperationCount:", objc_msgSend(v5, "count"));
  -[SKUITemplateLoader operationQueue](self, "operationQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addOperations:waitUntilFinished:", v5, 0);

  objc_storeStrong((id *)&self->_retainSelf, self);
}

- (NSArray)URLs
{
  return self->_URLs;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (NSRegularExpression)templateParsingRegularExpression
{
  return self->_templateParsingRegularExpression;
}

- (NSMutableArray)errors
{
  return self->_errors;
}

- (NSMutableDictionary)templateStrings
{
  return self->_templateStrings;
}

- (int64_t)pendingOperationCount
{
  return self->_pendingOperationCount;
}

- (void)setPendingOperationCount:(int64_t)a3
{
  self->_pendingOperationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateStrings, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_templateParsingRegularExpression, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_URLs, 0);
  objc_storeStrong((id *)&self->_retainSelf, 0);
}

- (void)initWithURLs:(uint64_t)a3 completionBlock:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
