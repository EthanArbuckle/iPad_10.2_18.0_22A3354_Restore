@implementation VUIASDDialogObserver

- (void)startListening
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CF9D18], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDialogObserver:", self);

}

- (void)stopListening
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CF9D18], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDialogObserver:", 0);

}

- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __64__VUIASDDialogObserver_handleAuthenticateRequest_resultHandler___block_invoke;
  v14 = &unk_1E9F99600;
  objc_copyWeak(&v17, &location);
  v8 = v6;
  v15 = v8;
  v9 = v7;
  v16 = v9;
  v10 = &v11;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v11, v12))
    v13((uint64_t)v10);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __64__VUIASDDialogObserver_handleAuthenticateRequest_resultHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  +[VUIApplicationRouter topMostVisibleViewController](VUIApplicationRouter, "topMostVisibleViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(WeakRetained, "presenterViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDDF0]), "initWithRequest:presentingViewController:", *(_QWORD *)(a1 + 32), v6);
  objc_msgSend(v7, "performAuthentication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__VUIASDDialogObserver_handleAuthenticateRequest_resultHandler___block_invoke_2;
  v9[3] = &unk_1E9F9B350;
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v8, "addFinishBlock:", v9);

}

void __64__VUIASDDialogObserver_handleAuthenticateRequest_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    a2;
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIASDDialogObserver - Error presenting AMS Auth dialog -- error: %@", (uint8_t *)&v7, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, 0);
  }

}

- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __58__VUIASDDialogObserver_handleDialogRequest_resultHandler___block_invoke;
  v14 = &unk_1E9F99600;
  objc_copyWeak(&v17, &location);
  v8 = v6;
  v15 = v8;
  v9 = v7;
  v16 = v9;
  v10 = &v11;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v11, v12))
    v13((uint64_t)v10);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __58__VUIASDDialogObserver_handleDialogRequest_resultHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  +[VUIApplicationRouter topMostVisibleViewController](VUIApplicationRouter, "topMostVisibleViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(WeakRetained, "presenterViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDDE0]), "initWithRequest:presentingViewController:", *(_QWORD *)(a1 + 32), v6);
  objc_msgSend(v7, "present");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__VUIASDDialogObserver_handleDialogRequest_resultHandler___block_invoke_2;
  v9[3] = &unk_1E9F9B378;
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v8, "addFinishBlock:", v9);

}

void __58__VUIASDDialogObserver_handleDialogRequest_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    a2;
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIASDDialogObserver - Error presenting AMS Dialog - error: %@", (uint8_t *)&v7, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, 0);
  }

}

- (UIViewController)presenterViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presenterViewController);
}

- (void)setPresenterViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presenterViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenterViewController);
}

@end
