@implementation SASProximitySession

- (SASProximitySession)init
{
  SASProximitySession *v2;
  dispatch_queue_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SASProximitySession;
  v2 = -[SASProximitySession init](&v5, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("Action Queue", 0);
    -[SASProximitySession setActionQueue:](v2, "setActionQueue:", v3);

  }
  return v2;
}

- (void)activate
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v6, &location);
  -[SASProximitySession transport](self, "transport", v5, 3221225472, __31__SASProximitySession_activate__block_invoke, &unk_1E97DC618);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReceivedDataBlock:", &v5);

  -[SASProximitySession transport](self, "transport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activate");

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __31__SASProximitySession_activate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "receivedAction:response:", v6, v5);

}

- (void)invalidate
{
  id v2;

  -[SASProximitySession transport](self, "transport");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)setSharingMessageSession:(id)a3
{
  id v4;
  SASProximitySessionSharingTransport *v5;

  v4 = a3;
  v5 = -[SASProximitySessionSharingTransport initWithMessageSession:]([SASProximitySessionSharingTransport alloc], "initWithMessageSession:", v4);

  -[SASProximitySession setTransport:](self, "setTransport:", v5);
}

- (CUMessageSession)sharingMessageSession
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[SASProximitySession transport](self, "transport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[SASProximitySession transport](self, "transport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messageSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (CUMessageSession *)v6;
}

- (void)receivedAction:(id)a3 response:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  SASProximitySession *v19;
  id v20;
  const __CFString *v21;
  NSObject *v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  -[SASProximitySession actionFromData:](self, "actionFromData:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SASLogging facility](SASLogging, "facility");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v24 = objc_msgSend((id)objc_opt_class(), "actionID");
    _os_log_impl(&dword_1D45FD000, v8, OS_LOG_TYPE_DEFAULT, "Received action from remote device (type %ld)", buf, 0xCu);
  }

  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __47__SASProximitySession_receivedAction_response___block_invoke;
  v18 = &unk_1E97DC640;
  v19 = self;
  v10 = v7;
  v20 = v10;
  dispatch_async(v9, &v15);

  if (objc_msgSend(v10, "hasResponse", v15, v16, v17, v18, v19))
  {
    if (v6)
    {
      objc_msgSend(v10, "responsePayload");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "data");
        v11 = objc_claimAutoreleasedReturnValue();
      }
      +[SASLogging facility](SASLogging, "facility");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D45FD000, v12, OS_LOG_TYPE_DEFAULT, "Responding to remote device...", buf, 2u);
      }

      v21 = CFSTR("data");
      v22 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v13);

    }
    else
    {
      +[SASLogging facility](SASLogging, "facility");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D45FD000, v11, OS_LOG_TYPE_DEFAULT, "Unable to send response for action; no response handler!",
          buf,
          2u);
      }
    }

  }
  else if (v6)
  {
    +[SASLogging facility](SASLogging, "facility");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D45FD000, v14, OS_LOG_TYPE_DEFAULT, "Sending empty response to remote device...", buf, 2u);
    }

    v6[2](v6, (void *)MEMORY[0x1E0C9AA70]);
  }

}

uint64_t __47__SASProximitySession_receivedAction_response___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleAction:", *(_QWORD *)(a1 + 40));
}

- (id)sendAction:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v9;
  SASProximitySession *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  if (-[SASProximitySession isConnected](self, "isConnected"))
  {
    -[SASProximitySession actionQueue](self, "actionQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__SASProximitySession_sendAction___block_invoke;
    block[3] = &unk_1E97DC690;
    v9 = v4;
    v10 = self;
    v11 = &v12;
    dispatch_sync(v5, block);

    v6 = (id)v13[5];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SASProximityErrorDomain"), -1, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v12, 8);

  return v6;
}

void __34__SASProximitySession_sendAction___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("Version"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "actionID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("Action"));

  objc_msgSend(*(id *)(a1 + 32), "requestPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("Payload"));
    v6 = dispatch_semaphore_create(0);
    +[SASLogging facility](SASLogging, "facility");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_DWORD *)buf = 134217984;
    v18 = objc_msgSend((id)objc_opt_class(), "actionID");
    v8 = "Sending action (type %ld) with payload...";
  }
  else
  {
    v6 = dispatch_semaphore_create(0);
    +[SASLogging facility](SASLogging, "facility");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_DWORD *)buf = 134217984;
    v18 = objc_msgSend((id)objc_opt_class(), "actionID");
    v8 = "Sending action (type %ld)...";
  }
  _os_log_impl(&dword_1D45FD000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
LABEL_7:

  objc_msgSend(*(id *)(a1 + 40), "transport");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __34__SASProximitySession_sendAction___block_invoke_10;
  v13[3] = &unk_1E97DC668;
  v10 = *(id *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 48);
  v14 = v10;
  v16 = v11;
  v12 = v6;
  v15 = v12;
  objc_msgSend(v9, "sendData:response:", v2, v13);

  if (objc_msgSend(*(id *)(a1 + 32), "hasResponse"))
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

}

void __34__SASProximitySession_sendAction___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[SASLogging facility](SASLogging, "facility");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v5;
    _os_log_impl(&dword_1D45FD000, v7, OS_LOG_TYPE_DEFAULT, "Receiving action response with error: %@", (uint8_t *)&v13, 0xCu);
  }

  if (v5)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = v5;
    v10 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v9;
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("data"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SASLogging facility](SASLogging, "facility");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1D45FD000, v11, OS_LOG_TYPE_DEFAULT, "Received response from remote device", (uint8_t *)&v13, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "setResponseFromData:", v10);
    }
    else
    {
      if (v12)
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1D45FD000, v11, OS_LOG_TYPE_DEFAULT, "Received null response from remote device", (uint8_t *)&v13, 2u);
      }

    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)actionFromData:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __objc2_class *v7;
  NSObject *v8;
  void *v9;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Action"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Payload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  switch(v5)
  {
    case 1:
      v7 = SASProximityReadyAction;
      goto LABEL_15;
    case 2:
      v7 = SASProximityHandshakeAction;
      goto LABEL_15;
    case 3:
      v7 = SASProximityInformationAction;
      goto LABEL_15;
    case 4:
      v7 = SASProximityCompanionAuthRequestAction;
      goto LABEL_15;
    case 5:
      v7 = SASProximityAnisetteRequestAction;
      goto LABEL_15;
    case 6:
      v7 = SASProximityBackupAction;
      goto LABEL_15;
    case 7:
      v7 = SASProximityPasscodeValidationAction;
      goto LABEL_15;
    case 8:
      v7 = SASProximityFinishedAction;
      goto LABEL_15;
    case 9:
      v7 = SASProximityMigrationTransferPreparationAction;
      goto LABEL_15;
    case 10:
      v7 = SASProximityMigrationStartAction;
LABEL_15:
      -[__objc2_class actionFromDictionary:](v7, "actionFromDictionary:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      +[SASLogging facility](SASLogging, "facility");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 134217984;
        v12 = v5;
        _os_log_impl(&dword_1D45FD000, v8, OS_LOG_TYPE_DEFAULT, "Received unknown action of type: %lu", (uint8_t *)&v11, 0xCu);
      }

      v9 = 0;
      break;
  }

  return v9;
}

- (void)handleAction:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  id v21;

  v21 = a3;
  if (objc_msgSend((id)objc_opt_class(), "actionID") == 1)
  {
    -[SASProximitySession delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[SASProximitySession delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ready");

    }
  }
  if (objc_msgSend((id)objc_opt_class(), "actionID") == 6)
  {
    -[SASProximitySession delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[SASProximitySession delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "receivedBackupAction:", v21);

    }
  }
  if (objc_msgSend((id)objc_opt_class(), "actionID") == 8)
  {
    -[SASProximitySession delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[SASProximitySession delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "finishedWithError:", 0);

    }
  }
  if (objc_msgSend((id)objc_opt_class(), "actionID") == 9)
  {
    v13 = v21;
    -[SASProximitySession delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[SASProximitySession delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "deviceName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "prepareForMigrationToDevice:", v17);

    }
  }
  if (objc_msgSend((id)objc_opt_class(), "actionID") == 10)
  {
    -[SASProximitySession delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      -[SASProximitySession delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "startMigration");

    }
  }

}

- (SASProximitySessionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SASProximitySessionDelegate *)a3;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (OS_dispatch_queue)actionQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setActionQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (SASProximitySessionTransport)transport
{
  return (SASProximitySessionTransport *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTransport:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_actionQueue, 0);
}

@end
