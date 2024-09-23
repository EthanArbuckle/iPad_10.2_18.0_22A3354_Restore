@implementation _PXSimulatedMediaRequest

- (_PXSimulatedMediaRequest)init
{
  return -[_PXSimulatedMediaRequest initWithOriginalOptions:simulatedResultHandler:](self, "initWithOriginalOptions:simulatedResultHandler:", 0, &__block_literal_global_241744);
}

- (_PXSimulatedMediaRequest)initWithOriginalOptions:(id)a3 simulatedResultHandler:(id)a4
{
  id v6;
  id v7;
  _PXSimulatedMediaRequest *v8;
  void *v9;
  uint64_t v10;
  id originalProgressHandler;
  uint64_t v12;
  _RequestOptions *simulatedOptions;
  uint64_t v14;
  id simulatedResultHandler;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t, void *, double);
  void *v20;
  id v21;
  id location;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)_PXSimulatedMediaRequest;
  v8 = -[_PXSimulatedMediaRequest init](&v23, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "progressHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    originalProgressHandler = v8->_originalProgressHandler;
    v8->_originalProgressHandler = (id)v10;

    v12 = objc_msgSend(v6, "copyWithZone:", 0);
    simulatedOptions = v8->_simulatedOptions;
    v8->_simulatedOptions = (_RequestOptions *)v12;

    objc_initWeak(&location, v8);
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __75___PXSimulatedMediaRequest_initWithOriginalOptions_simulatedResultHandler___block_invoke;
    v20 = &unk_1E5145AC0;
    objc_copyWeak(&v21, &location);
    -[_RequestOptions setProgressHandler:](v8->_simulatedOptions, "setProgressHandler:", &v17);
    v14 = objc_msgSend(v7, "copy", v17, v18, v19, v20);
    simulatedResultHandler = v8->_simulatedResultHandler;
    v8->_simulatedResultHandler = (id)v14;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (_PXSimulatedMediaRequest)initWithWrappedMediaRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _PXSimulatedMediaRequest *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(v4, "simulatedOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56___PXSimulatedMediaRequest_initWithWrappedMediaRequest___block_invoke;
  v9[3] = &unk_1E513C560;
  v10 = v4;
  v6 = v4;
  v7 = -[_PXSimulatedMediaRequest initWithOriginalOptions:simulatedResultHandler:](self, "initWithOriginalOptions:simulatedResultHandler:", v5, v9);

  return v7;
}

- (void)handleOriginalProgress:(double)a3 error:(id)a4 stop:(BOOL *)a5 info:(id)a6
{
  void (**originalProgressHandler)(id, id, BOOL *, id, double);

  originalProgressHandler = (void (**)(id, id, BOOL *, id, double))self->_originalProgressHandler;
  if (originalProgressHandler)
    originalProgressHandler[2](originalProgressHandler, a4, a5, a6, a3);
}

- (void)handleOriginalResult:(id)a3 info:(id)a4
{
  (*((void (**)(void))self->_simulatedResultHandler + 2))();
}

- (_RequestOptions)simulatedOptions
{
  return self->_simulatedOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simulatedOptions, 0);
  objc_storeStrong(&self->_simulatedResultHandler, 0);
  objc_storeStrong(&self->_originalProgressHandler, 0);
}

+ (id)defaultSimulatedMediaRequestWithOriginalOptions:(id)a3 simulatedResultHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _PXSimulatedMediaRequest *v8;
  double v9;
  _PXSimulatedDelayedMediaRequest *v10;
  uint64_t v11;
  _PXSimulatedFailingMediaRequest *v12;
  void *v13;
  uint64_t v14;

  v5 = a4;
  v6 = a3;
  +[PXMediaProviderSettings sharedInstance](PXMediaProviderSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_PXSimulatedMediaRequest initWithOriginalOptions:simulatedResultHandler:]([_PXSimulatedMediaRequest alloc], "initWithOriginalOptions:simulatedResultHandler:", v6, v5);

  objc_msgSend(v7, "simulatedDelay");
  if (v9 > 0.0)
  {
    v10 = [_PXSimulatedDelayedMediaRequest alloc];
    objc_msgSend(v7, "simulatedDelay");
    v11 = -[_PXSimulatedDelayedMediaRequest initWithWrappedMediaRequest:delay:](v10, "initWithWrappedMediaRequest:delay:", v8);

    v8 = (_PXSimulatedMediaRequest *)v11;
  }
  if (objc_msgSend(v7, "simulateError"))
  {
    v12 = [_PXSimulatedFailingMediaRequest alloc];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PXSimulatedUIMediaProvider"), 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[_PXSimulatedFailingMediaRequest initWithWrappedMediaRequest:error:](v12, "initWithWrappedMediaRequest:error:", v8, v13);

    v8 = (_PXSimulatedMediaRequest *)v14;
  }

  return v8;
}

@end
