@implementation SESDCKSession

+ (id)newInstance
{
  return (id)objc_opt_new();
}

- (id)setActiveKey:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSString *aid;
  NSString *v9;
  NSString *activeKeyIdentifier;
  BOOL v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD v18[5];
  _QWORD v19[5];
  uint8_t v20[4];
  uint64_t v21;
  __int128 buf;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SESDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_20A048000, v5, OS_LOG_TYPE_INFO, "setActiveKey %@", (uint8_t *)&buf, 0xCu);
  }

  if (-[SESSession state](self, "state") == 1)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__6;
    v25 = __Block_byref_object_dispose__6;
    v6 = MEMORY[0x24BDAC760];
    v26 = 0;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __30__SESDCKSession_setActiveKey___block_invoke;
    v19[3] = &unk_24C2BCCB0;
    v19[4] = &buf;
    -[SESSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __30__SESDCKSession_setActiveKey___block_invoke_2;
    v18[3] = &unk_24C2BCCB0;
    v18[4] = &buf;
    objc_msgSend(v7, "setActiveKey:reply:", v4, v18);

    aid = self->_aid;
    if (!v4 || *(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      self->_aid = 0;

      v11 = 0;
      activeKeyIdentifier = self->_activeKeyIdentifier;
      self->_activeKeyIdentifier = 0;
    }
    else
    {
      self->_aid = (NSString *)CFSTR("A000000809434343444B417631");

      v9 = (NSString *)v4;
      activeKeyIdentifier = self->_activeKeyIdentifier;
      self->_activeKeyIdentifier = v9;
      v11 = 1;
    }

    self->_supportsSecureRanging = v11;
    v14 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v14)
    {
      SESDefaultLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        *(_DWORD *)v20 = 138412290;
        v21 = v16;
        _os_log_impl(&dword_20A048000, v15, OS_LOG_TYPE_ERROR, "%@", v20, 0xCu);
      }

      v14 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    }
    v13 = v14;
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    SESDefaultLogObject();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

void __30__SESDCKSession_setActiveKey___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __30__SESDCKSession_setActiveKey___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)setSecureElementToken:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t v22[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SESDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20A048000, v5, OS_LOG_TYPE_INFO, "setSecureElementToken", buf, 2u);
  }

  if (-[SESSession state](self, "state") == 1)
  {
    *(_QWORD *)buf = 0;
    v17 = buf;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__6;
    v20 = __Block_byref_object_dispose__6;
    v6 = MEMORY[0x24BDAC760];
    v21 = 0;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __39__SESDCKSession_setSecureElementToken___block_invoke;
    v15[3] = &unk_24C2BCCB0;
    v15[4] = buf;
    -[SESSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __39__SESDCKSession_setSecureElementToken___block_invoke_2;
    v14[3] = &unk_24C2BCCB0;
    v14[4] = buf;
    objc_msgSend(v7, "setSecureElementToken:reply:", v4, v14);

    v8 = (void *)*((_QWORD *)v17 + 5);
    if (v8)
    {
      SESDefaultLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = *((_QWORD *)v17 + 5);
        *(_DWORD *)v22 = 138412290;
        v23 = v10;
        _os_log_impl(&dword_20A048000, v9, OS_LOG_TYPE_ERROR, "%@", v22, 0xCu);
      }

      v8 = (void *)*((_QWORD *)v17 + 5);
    }
    v11 = v8;
    _Block_object_dispose(buf, 8);

  }
  else
  {
    SESDefaultLogObject();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

void __39__SESDCKSession_setSecureElementToken___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __39__SESDCKSession_setSecureElementToken___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)setAuthorization:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t v22[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SESDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20A048000, v5, OS_LOG_TYPE_INFO, "setAuthorization", buf, 2u);
  }

  if (-[SESSession state](self, "state") == 1)
  {
    *(_QWORD *)buf = 0;
    v17 = buf;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__6;
    v20 = __Block_byref_object_dispose__6;
    v6 = MEMORY[0x24BDAC760];
    v21 = 0;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __34__SESDCKSession_setAuthorization___block_invoke;
    v15[3] = &unk_24C2BCCB0;
    v15[4] = buf;
    -[SESSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __34__SESDCKSession_setAuthorization___block_invoke_2;
    v14[3] = &unk_24C2BCCB0;
    v14[4] = buf;
    objc_msgSend(v7, "setAuthorization:reply:", v4, v14);

    v8 = (void *)*((_QWORD *)v17 + 5);
    if (v8)
    {
      SESDefaultLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = *((_QWORD *)v17 + 5);
        *(_DWORD *)v22 = 138412290;
        v23 = v10;
        _os_log_impl(&dword_20A048000, v9, OS_LOG_TYPE_ERROR, "%@", v22, 0xCu);
      }

      v8 = (void *)*((_QWORD *)v17 + 5);
    }
    v11 = v8;
    _Block_object_dispose(buf, 8);

  }
  else
  {
    SESDefaultLogObject();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

void __34__SESDCKSession_setAuthorization___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __34__SESDCKSession_setAuthorization___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)disableBluetooth:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  uint8_t v16[4];
  uint64_t v17;
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x24BDAC8D0];
  SESDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v3;
    _os_log_impl(&dword_20A048000, v5, OS_LOG_TYPE_INFO, "disableBluetooth %d", buf, 8u);
  }

  if (-[SESSession state](self, "state") == 1)
  {
    *(_QWORD *)buf = 0;
    v19 = buf;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__6;
    v22 = __Block_byref_object_dispose__6;
    v6 = MEMORY[0x24BDAC760];
    v23 = 0;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __34__SESDCKSession_disableBluetooth___block_invoke;
    v15[3] = &unk_24C2BCCB0;
    v15[4] = buf;
    -[SESSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __34__SESDCKSession_disableBluetooth___block_invoke_2;
    v14[3] = &unk_24C2BCCB0;
    v14[4] = buf;
    objc_msgSend(v7, "preArmActiveKey:reply:", v3, v14);

    v8 = (void *)*((_QWORD *)v19 + 5);
    if (v8)
    {
      SESDefaultLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = *((_QWORD *)v19 + 5);
        *(_DWORD *)v16 = 138412290;
        v17 = v10;
        _os_log_impl(&dword_20A048000, v9, OS_LOG_TYPE_ERROR, "%@", v16, 0xCu);
      }

      v8 = (void *)*((_QWORD *)v19 + 5);
    }
    v11 = v8;
    _Block_object_dispose(buf, 8);

  }
  else
  {
    SESDefaultLogObject();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

void __34__SESDCKSession_disableBluetooth___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __34__SESDCKSession_disableBluetooth___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)sendRKEFunction:(id)a3 action:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  uint8_t v22[4];
  uint64_t v23;
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  SESDefaultLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)&buf[4] = objc_msgSend(v10, "unsignedIntValue");
    LOWORD(v25) = 1024;
    *(_DWORD *)((char *)&v25 + 2) = objc_msgSend(v11, "unsignedIntValue");
    HIWORD(v25) = 1024;
    LODWORD(v26) = v12 != 0;
    _os_log_impl(&dword_20A048000, v14, OS_LOG_TYPE_INFO, "sendRKEFunction 0x%X action 0x%X authorization %d", buf, 0x14u);
  }

  if (-[SESSession state](self, "state") == 1)
  {
    *(_QWORD *)buf = 0;
    v25 = buf;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__6;
    v28 = __Block_byref_object_dispose__6;
    v29 = 0;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __65__SESDCKSession_sendRKEFunction_action_authorization_completion___block_invoke;
    v21[3] = &unk_24C2BCCB0;
    v21[4] = buf;
    -[SESSession remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sendRKEFunction:action:authorization:completion:", objc_msgSend(v10, "unsignedShortValue"), objc_msgSend(v11, "unsignedCharValue"), v12, v13);

    if (*((_QWORD *)v25 + 5))
    {
      SESDefaultLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = *((_QWORD *)v25 + 5);
        *(_DWORD *)v22 = 138412290;
        v23 = v17;
        _os_log_impl(&dword_20A048000, v16, OS_LOG_TYPE_ERROR, "%@", v22, 0xCu);
      }

      SESEnsureError();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, 0, v18);

    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    SESDefaultLogObject();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v20);

  }
}

void __65__SESDCKSession_sendRKEFunction_action_authorization_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)cancelRKEFunction:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  uint8_t v16[4];
  uint64_t v17;
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SESDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = objc_msgSend(v4, "unsignedIntValue");
    _os_log_impl(&dword_20A048000, v5, OS_LOG_TYPE_INFO, "cancelRKEFunction 0x%X", buf, 8u);
  }

  if (-[SESSession state](self, "state") == 1)
  {
    *(_QWORD *)buf = 0;
    v19 = buf;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__6;
    v22 = __Block_byref_object_dispose__6;
    v6 = MEMORY[0x24BDAC760];
    v23 = 0;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __35__SESDCKSession_cancelRKEFunction___block_invoke;
    v15[3] = &unk_24C2BCCB0;
    v15[4] = buf;
    -[SESSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __35__SESDCKSession_cancelRKEFunction___block_invoke_2;
    v14[3] = &unk_24C2BCCB0;
    v14[4] = buf;
    objc_msgSend(v7, "cancelRKEFunction:reply:", objc_msgSend(v4, "unsignedShortValue"), v14);

    v8 = (void *)*((_QWORD *)v19 + 5);
    if (v8)
    {
      SESDefaultLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = *((_QWORD *)v19 + 5);
        *(_DWORD *)v16 = 138412290;
        v17 = v10;
        _os_log_impl(&dword_20A048000, v9, OS_LOG_TYPE_ERROR, "%@", v16, 0xCu);
      }

      v8 = (void *)*((_QWORD *)v19 + 5);
    }
    v11 = v8;
    _Block_object_dispose(buf, 8);

  }
  else
  {
    SESDefaultLogObject();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

void __35__SESDCKSession_cancelRKEFunction___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __35__SESDCKSession_cancelRKEFunction___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)sendPassthroughMessage:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint8_t *v12;
  NSObject *v13;
  uint64_t v14;
  _QWORD v16[5];
  _QWORD v17[5];
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t v24[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  SESDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20A048000, v7, OS_LOG_TYPE_INFO, "sendPassthroughMessage", buf, 2u);
  }

  if (-[SESSession state](self, "state") == 1)
  {
    if ((unint64_t)objc_msgSend(v6, "length") < 0x10000)
    {
      *(_QWORD *)buf = 0;
      v19 = buf;
      v20 = 0x3032000000;
      v21 = __Block_byref_object_copy__6;
      v22 = __Block_byref_object_dispose__6;
      v10 = MEMORY[0x24BDAC760];
      v23 = 0;
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __46__SESDCKSession_sendPassthroughMessage_error___block_invoke;
      v17[3] = &unk_24C2BCCB0;
      v17[4] = buf;
      -[SESSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v10;
      v16[1] = 3221225472;
      v16[2] = __46__SESDCKSession_sendPassthroughMessage_error___block_invoke_2;
      v16[3] = &unk_24C2BCCB0;
      v16[4] = buf;
      objc_msgSend(v11, "sendPassthroughMessage:reply:", v6, v16);

      v12 = v19;
      if (*((_QWORD *)v19 + 5))
      {
        SESDefaultLogObject();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = *((_QWORD *)v19 + 5);
          *(_DWORD *)v24 = 138412290;
          v25 = v14;
          _os_log_impl(&dword_20A048000, v13, OS_LOG_TYPE_ERROR, "%@", v24, 0xCu);
        }

        v12 = v19;
      }
      if (a4)
      {
        *a4 = objc_retainAutorelease(*((id *)v12 + 5));
        v12 = v19;
      }
      LOBYTE(a4) = *((_QWORD *)v12 + 5) == 0;
      _Block_object_dispose(buf, 8);

    }
    else if (a4)
    {
      SESDefaultLogObject();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "length");
      SESCreateAndLogError();
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
      LOBYTE(a4) = 0;
    }
  }
  else if (a4)
  {
    SESDefaultLogObject();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }

  return (char)a4;
}

void __46__SESDCKSession_sendPassthroughMessage_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __46__SESDCKSession_sendPassthroughMessage_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (id)pauseRangingForReaderIdentifier:(id)a3 durationInSec:(id)a4
{
  return 0;
}

+ (id)resumeRangingForReaderIdentifier:(id)a3
{
  return 0;
}

+ (id)getVehicleReports:(id *)a3
{
  return +[SESSessionManager getVehicleReports:](SESSessionManager, "getVehicleReports:", a3);
}

+ (id)requestAssertionForKeyID:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v13;

  v7 = a4;
  v8 = a3;
  +[SESSessionManager sharedInstance](SESSessionManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v9, "startDCKAssertionForKeyIdentifier:withOptions:error:", v8, v7, &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v13;
  if (a5)
    *a5 = objc_retainAutorelease(v11);

  return v10;
}

- (void)didStartSession:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SESDCKSession;
  -[SESSession didStartSession:](&v3, sel_didStartSession_, a3);
}

- (void)didEndUnexpectedly:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SESDCKSession;
  -[SESSession didEndUnexpectedly:](&v3, sel_didEndUnexpectedly_, a3);
}

- (void)endSession
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SESDCKSession;
  -[SESSession endSession](&v3, sel_endSession);
  -[SESDCKSession sendEvent:](self, "sendEvent:", &unk_24C2CB700);
}

- (void)sendEvent:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  if (-[SESSession state](self, "state") == 1)
  {
    -[SESSession queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __27__SESDCKSession_sendEvent___block_invoke;
    v7[3] = &unk_24C2BD0C0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v5, v7);

  }
  else
  {
    SESDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A048000, v6, OS_LOG_TYPE_INFO, "Dropping event while no active session", buf, 2u);
    }

  }
}

void __27__SESDCKSession_sendEvent___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sesSession:event:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didReceivePassthroughMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  if (-[SESSession state](self, "state") != 1)
  {
    SESDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v8 = "Dropping passthrough message while no active session";
LABEL_8:
      _os_log_impl(&dword_20A048000, v7, OS_LOG_TYPE_INFO, v8, buf, 2u);
    }
LABEL_9:

    goto LABEL_10;
  }
  -[SESDCKSession passthroughDelegate](self, "passthroughDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    SESDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v8 = "Dropping passthrough message due to no delegate";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  -[SESSession queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__SESDCKSession_didReceivePassthroughMessage___block_invoke;
  v9[3] = &unk_24C2BD0C0;
  v9[4] = self;
  v10 = v4;
  dispatch_async(v6, v9);

LABEL_10:
}

void __46__SESDCKSession_didReceivePassthroughMessage___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "passthroughDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sesSession:didReceivePassthroughMessage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)vehicleState
{
  return (id)MEMORY[0x24BDBD1B8];
}

- (id)sendRKEAction:(unint64_t)a3 authorization:(id)a4
{
  void *v4;
  void *v5;

  SESDefaultLogObject();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SESCreateAndLogError();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sendRKEFunction:(id)a3 action:(id)a4 authorization:(id)a5
{
  void *v5;
  void *v6;

  SESDefaultLogObject();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SESCreateAndLogError();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getRKEActionsInProgress
{
  return (id)MEMORY[0x24BDBD1B8];
}

- (id)cancelRKEAction:(unint64_t)a3
{
  void *v3;
  void *v4;

  SESDefaultLogObject();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SESCreateAndLogError();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)sendPassthroughMessage:(id)a3 reply:(id)a4
{
  return 0;
}

- (BOOL)sendSignedPassthroughMessage:(id)a3 authorization:(id)a4 reply:(id)a5
{
  return 0;
}

- (BOOL)getSignedMessage:(id)a3 authorization:(id)a4 reply:(id)a5
{
  return 0;
}

- (SESDCKSessionDelegate)delegate
{
  return (SESDCKSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SESDCKSessionPassthroughDelegate)passthroughDelegate
{
  return (SESDCKSessionPassthroughDelegate *)objc_loadWeakRetained((id *)&self->_passthroughDelegate);
}

- (void)setPassthroughDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_passthroughDelegate, a3);
}

- (NSString)aid
{
  return self->_aid;
}

- (NSString)activeKeyIdentifier
{
  return self->_activeKeyIdentifier;
}

- (BOOL)supportsSecureRanging
{
  return self->_supportsSecureRanging;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_aid, 0);
  objc_destroyWeak((id *)&self->_passthroughDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
