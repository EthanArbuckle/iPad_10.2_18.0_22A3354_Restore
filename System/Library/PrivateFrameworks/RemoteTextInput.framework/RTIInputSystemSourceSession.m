@implementation RTIInputSystemSourceSession

- (RTIInputSystemSourceSession)init
{
  RTIInputSystemSourceSession *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RTIInputSystemSourceSession;
  result = -[RTIInputSystemSourceSession init](&v3, sel_init);
  if (result)
    result->_payloadVersion = 1;
  return result;
}

- (void)flushOperations
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  RTIInputSystemDataPayload *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  -[RTIInputSystemSession textOperations](self, "textOperations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_payloadDelegate);
    if (WeakRetained)
    {
      v5 = WeakRetained;
      v6 = objc_loadWeakRetained((id *)&self->_payloadDelegate);
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        v8 = objc_alloc_init(RTIInputSystemDataPayload);
        -[RTIInputSystemSession textOperations](self, "textOperations");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTIInputSystemDataPayload setTextOperations:](v8, "setTextOperations:", v9);

        v10 = objc_loadWeakRetained((id *)&self->_payloadDelegate);
        objc_msgSend(v10, "handleTextActionPayload:", v8);

      }
    }
    -[RTIInputSystemSession textOperations](self, "textOperations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTIInputSystemSession documentState](self, "documentState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTIInputSystemSession _applyLocalTextOperations:toDocumentState:](self, "_applyLocalTextOperations:toDocumentState:", v11, v12);

    -[RTIInputSystemSession setTextOperations:](self, "setTextOperations:", 0);
  }
}

- (void)notifySessionDelegateDidBegin:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[RTIInputSystemSession beginOptions](self, "beginOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputSessionDidBegin:options:", self, v4);

  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "inputSessionDidBegin:", self);
  }

}

- (void)setSessionDelegate:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTIInputSystemSourceSession;
  v4 = a3;
  -[RTIInputSystemSession setSessionDelegate:](&v5, sel_setSessionDelegate_, v4);
  -[RTIInputSystemSourceSession notifySessionDelegateDidBegin:](self, "notifySessionDelegateDidBegin:", v4, v5.receiver, v5.super_class);

}

- (void)addSessionDelegate:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTIInputSystemSourceSession;
  v4 = a3;
  -[RTIInputSystemSession addSessionDelegate:](&v5, sel_addSessionDelegate_, v4);
  -[RTIInputSystemSourceSession notifySessionDelegateDidBegin:](self, "notifySessionDelegateDidBegin:", v4, v5.receiver, v5.super_class);

}

- (RTIDataPayload)currentForwardingDataPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[RTIInputSystemDataPayload payloadWithData:version:](RTIInputSystemDataPayload, "payloadWithData:version:", 0, -[RTIInputSystemSourceSession payloadVersion](self, "payloadVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTIInputSystemSession documentTraits](self, "documentTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDocumentTraits:", v4);

  -[RTIInputSystemSession documentState](self, "documentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDocumentState:", v5);

  -[RTIInputSystemSession _textOperations](self, "_textOperations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextOperations:", v6);

  -[RTIInputSystemSession uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSessionUUID:", v7);

  objc_msgSend(v3, "updateData");
  return (RTIDataPayload *)v3;
}

- (void)handleForwardingResponseActionPayload:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  id v9;
  void *v10;
  unint64_t payloadVersion;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_payloadDelegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)&self->_payloadDelegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_payloadDelegate);
      objc_msgSend(v8, "handleTextActionPayload:", v16);

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v16;
  }
  else
  {
    objc_msgSend(v16, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTIInputSystemDataPayload payloadWithData:version:](RTIInputSystemDataPayload, "payloadWithData:version:", v10, objc_msgSend(v16, "version"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  payloadVersion = self->_payloadVersion;
  v12 = objc_msgSend(v16, "version");
  if (payloadVersion >= v12)
    v13 = v12;
  else
    v13 = payloadVersion;
  self->_payloadVersion = v13;
  objc_msgSend(v9, "textOperations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTIInputSystemSession documentState](self, "documentState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTIInputSystemSession _applyLocalTextOperations:toDocumentState:](self, "_applyLocalTextOperations:toDocumentState:", v14, v15);

}

- (void)handleTextActionPayload:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t payloadVersion;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];

  v21 = a3;
  -[RTIInputSystemSourceSession forwardingPayloadDelegate](self, "forwardingPayloadDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RTIInputSystemSourceSession forwardingPayloadDelegate](self, "forwardingPayloadDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleTextActionPayload:", v21);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)objc_msgSend(v21, "copy");
  }
  else
  {
    objc_msgSend(v21, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTIInputSystemDataPayload payloadWithData:version:](RTIInputSystemDataPayload, "payloadWithData:version:", v7, objc_msgSend(v21, "version"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  payloadVersion = self->_payloadVersion;
  v9 = objc_msgSend(v21, "version");
  if (payloadVersion >= v9)
    v10 = v9;
  else
    v10 = payloadVersion;
  self->_payloadVersion = v10;
  if (objc_msgSend(v6, "version") == 1)
  {
    objc_msgSend(v6, "sessionUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v6, "sessionUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTIInputSystemSession setUuid:](self, "setUuid:", v12);

    }
    objc_msgSend(v6, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = MEMORY[0x1E0C809B0];
    if (!v13)
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __55__RTIInputSystemSourceSession_handleTextActionPayload___block_invoke;
      v24[3] = &unk_1E35C24F8;
      v24[4] = self;
      -[RTIInputSystemSession enumerateSessionDelegatesUsingBlock:](self, "enumerateSessionDelegatesUsingBlock:", v24);
    }
    objc_msgSend(v6, "documentTraits");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v6, "documentTraits");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "copy");
      -[RTIInputSystemSession setDocumentTraits:](self, "setDocumentTraits:", v17);

      v23[0] = v14;
      v23[1] = 3221225472;
      v23[2] = __55__RTIInputSystemSourceSession_handleTextActionPayload___block_invoke_2;
      v23[3] = &unk_1E35C24F8;
      v23[4] = self;
      -[RTIInputSystemSession enumerateSessionDelegatesUsingBlock:](self, "enumerateSessionDelegatesUsingBlock:", v23);
    }
    objc_msgSend(v6, "documentState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v6, "documentState");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v19, "copy");
      -[RTIInputSystemSession setDocumentState:](self, "setDocumentState:", v20);

      v22[0] = v14;
      v22[1] = 3221225472;
      v22[2] = __55__RTIInputSystemSourceSession_handleTextActionPayload___block_invoke_3;
      v22[3] = &unk_1E35C24F8;
      v22[4] = self;
      -[RTIInputSystemSession enumerateSessionDelegatesUsingBlock:](self, "enumerateSessionDelegatesUsingBlock:", v22);
    }
  }

}

void __55__RTIInputSystemSourceSession_handleTextActionPayload___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "inputSessionDidEnd:options:", *(_QWORD *)(a1 + 32), 0);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "inputSessionDidEnd:", *(_QWORD *)(a1 + 32));
  }

}

void __55__RTIInputSystemSourceSession_handleTextActionPayload___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "documentTraits");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputSession:documentTraitsDidChange:", v3, v4);

  }
}

void __55__RTIInputSystemSourceSession_handleTextActionPayload___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "documentState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputSession:documentStateDidChange:", v3, v4);

  }
}

- (id)sessionIndependentPayloadDelegate
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  RTILogFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[RTIInputSystemSourceSession sessionIndependentPayloadDelegate]";
    _os_log_impl(&dword_1991A8000, v2, OS_LOG_TYPE_DEFAULT, "%s  WARNING: -sessionIndependentPayloadDelegate is not implemented for this sourceSession", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (RTIInputSystemPayloadDelegate)forwardingPayloadDelegate
{
  return (RTIInputSystemPayloadDelegate *)objc_loadWeakRetained((id *)&self->_forwardingPayloadDelegate);
}

- (void)setForwardingPayloadDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_forwardingPayloadDelegate, a3);
}

- (unint64_t)payloadVersion
{
  return self->_payloadVersion;
}

- (RTIInputSystemPayloadDelegate)payloadDelegate
{
  return (RTIInputSystemPayloadDelegate *)objc_loadWeakRetained((id *)&self->_payloadDelegate);
}

- (void)setPayloadDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_payloadDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_payloadDelegate);
  objc_destroyWeak((id *)&self->_forwardingPayloadDelegate);
}

@end
