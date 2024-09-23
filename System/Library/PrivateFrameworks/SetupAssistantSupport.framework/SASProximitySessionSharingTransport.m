@implementation SASProximitySessionSharingTransport

- (SASProximitySessionSharingTransport)initWithMessageSession:(id)a3
{
  id v4;
  SASProximitySessionSharingTransport *v5;
  SASProximitySessionSharingTransport *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SASProximitySessionSharingTransport;
  v5 = -[SASProximitySessionSharingTransport init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SASProximitySessionSharingTransport setMessageSession:](v5, "setMessageSession:", v4);

  return v6;
}

- (void)activate
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v3 = objc_alloc(MEMORY[0x1E0D1B398]);
  -[SASProximitySessionSharingTransport messageSession](self, "messageSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTemplate:", v4);
  -[SASProximitySessionSharingTransport setActionMessageSession:](self, "setActionMessageSession:", v5);

  -[SASProximitySessionSharingTransport actionMessageSession](self, "actionMessageSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLabel:", CFSTR("Proximity Setup Sesssion"));

  -[SASProximitySessionSharingTransport actionMessageSession](self, "actionMessageSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInvalidationHandler:", &__block_literal_global_0);

  -[SASProximitySessionSharingTransport actionMessageSession](self, "actionMessageSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__SASProximitySessionSharingTransport_activate__block_invoke_5;
  v10[3] = &unk_1E97DC810;
  v10[4] = self;
  objc_msgSend(v8, "registerRequestID:options:handler:", CFSTR("Action"), 0, v10);

  -[SASProximitySessionSharingTransport actionMessageSession](self, "actionMessageSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activate");

}

void __47__SASProximitySessionSharingTransport_activate__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  +[SASLogging facility](SASLogging, "facility");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D45FD000, v0, OS_LOG_TYPE_DEFAULT, "Proximity message session invalidated!", v1, 2u);
  }

}

void __47__SASProximitySessionSharingTransport_activate__block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "receivedDataBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "receivedDataBlock");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __47__SASProximitySessionSharingTransport_activate__block_invoke_2;
    v10[3] = &unk_1E97DC7E8;
    v11 = v7;
    ((void (**)(_QWORD, id, _QWORD *))v9)[2](v9, v6, v10);

  }
}

uint64_t __47__SASProximitySessionSharingTransport_activate__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  id v2;

  -[SASProximitySessionSharingTransport actionMessageSession](self, "actionMessageSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)sendData:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[SASProximitySessionSharingTransport actionMessageSession](self, "actionMessageSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__SASProximitySessionSharingTransport_sendData_response___block_invoke;
  v10[3] = &unk_1E97DC838;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "sendRequestID:options:request:responseHandler:", CFSTR("Action"), 0, v7, v10);

}

void __57__SASProximitySessionSharingTransport_sendData_response___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
  {
    if ((_DWORD)a2)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v14 = CFSTR("status");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("SASProximityErrorDomain"), -2, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v8);
    }
  }

}

- (CUMessageSession)messageSession
{
  return (CUMessageSession *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMessageSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CUMessageSession)actionMessageSession
{
  return (CUMessageSession *)objc_getProperty(self, a2, 24, 1);
}

- (void)setActionMessageSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionMessageSession, 0);
  objc_storeStrong((id *)&self->_messageSession, 0);
}

@end
