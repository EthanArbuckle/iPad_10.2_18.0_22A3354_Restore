@implementation WFExternalUIPresenter

- (WFExternalUIPresenter)initWithConnection:(id)a3
{
  id v5;
  WFExternalUIPresenter *v6;
  WFExternalUIPresenter *v7;
  WFExternalUIPresenter *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFExternalUIPresenter;
  v6 = -[WFExternalUIPresenter init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = v7;
  }

  return v7;
}

- (void)willBeginExecutingShortcutWithActionCount:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFExternalUIPresenter connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presenterWithErrorHandler:", &__block_literal_global_8799);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "willBeginExecutingShortcutWithActionCount:", v4);
}

- (void)willBeginExecutingShortcutStep:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFExternalUIPresenter connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presenterWithErrorHandler:", &__block_literal_global_66_8798);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "willBeginExecutingShortcutStep:", v4);
}

- (void)performSiriRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD aBlock[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[3];
  char v20;

  v6 = a3;
  v7 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v8 = MEMORY[0x1E0C809B0];
  v20 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__WFExternalUIPresenter_performSiriRequest_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5FC6770;
  v18 = v19;
  v9 = v7;
  v17 = v9;
  v10 = _Block_copy(aBlock);
  -[WFExternalUIPresenter connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __62__WFExternalUIPresenter_performSiriRequest_completionHandler___block_invoke_2;
  v14[3] = &unk_1E5FC88A0;
  v12 = v10;
  v15 = v12;
  objc_msgSend(v11, "presenterWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "performSiriRequest:completionHandler:", v6, v12);
  _Block_object_dispose(v19, 8);

}

- (void)performDialogRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[WFExternalUIPresenter connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__WFExternalUIPresenter_performDialogRequest_completionHandler___block_invoke;
  v11[3] = &unk_1E5FC88A0;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "presenterWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "performDialogRequest:completionHandler:", v7, v9);
}

- (void)didStartActionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFExternalUIPresenter connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presenterWithErrorHandler:", &__block_literal_global_68_8794);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "didStartActionWithIdentifier:", v4);
}

- (void)didFinishActionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFExternalUIPresenter connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presenterWithErrorHandler:", &__block_literal_global_69);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "didFinishActionWithIdentifier:", v4);
}

- (WFExternalUIPresenterConnection)connection
{
  return self->_connection;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __64__WFExternalUIPresenter_performDialogRequest_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  WFDialogResponse *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = -[WFDialogResponse initWithResponseCode:]([WFDialogResponse alloc], "initWithResponseCode:", 1);
  (*(void (**)(uint64_t, WFDialogResponse *))(v1 + 16))(v1, v2);

}

uint64_t __62__WFExternalUIPresenter_performSiriRequest_completionHandler___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v1 = result;
    result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = 1;
  }
  return result;
}

void __62__WFExternalUIPresenter_performSiriRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  WFSiriActionResponse *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = -[WFSiriActionResponse initWithError:]([WFSiriActionResponse alloc], "initWithError:", v3);

  (*(void (**)(uint64_t, WFSiriActionResponse *))(v2 + 16))(v2, v4);
}

@end
