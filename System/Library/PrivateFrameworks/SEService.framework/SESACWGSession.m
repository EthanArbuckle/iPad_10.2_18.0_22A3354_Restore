@implementation SESACWGSession

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
    v24 = __Block_byref_object_copy__4;
    v25 = __Block_byref_object_dispose__4;
    v6 = MEMORY[0x24BDAC760];
    v26 = 0;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __31__SESACWGSession_setActiveKey___block_invoke;
    v19[3] = &unk_24C2BCCB0;
    v19[4] = &buf;
    -[SESSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __31__SESACWGSession_setActiveKey___block_invoke_2;
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
      self->_aid = (NSString *)CFSTR("A000000909ACCE5501");

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

void __31__SESACWGSession_setActiveKey___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __31__SESACWGSession_setActiveKey___block_invoke_2(uint64_t a1, void *a2)
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
    v19 = __Block_byref_object_copy__4;
    v20 = __Block_byref_object_dispose__4;
    v6 = MEMORY[0x24BDAC760];
    v21 = 0;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __40__SESACWGSession_setSecureElementToken___block_invoke;
    v15[3] = &unk_24C2BCCB0;
    v15[4] = buf;
    -[SESSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __40__SESACWGSession_setSecureElementToken___block_invoke_2;
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

void __40__SESACWGSession_setSecureElementToken___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __40__SESACWGSession_setSecureElementToken___block_invoke_2(uint64_t a1, void *a2)
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
    v21 = __Block_byref_object_copy__4;
    v22 = __Block_byref_object_dispose__4;
    v6 = MEMORY[0x24BDAC760];
    v23 = 0;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __35__SESACWGSession_disableBluetooth___block_invoke;
    v15[3] = &unk_24C2BCCB0;
    v15[4] = buf;
    -[SESSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __35__SESACWGSession_disableBluetooth___block_invoke_2;
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

void __35__SESACWGSession_disableBluetooth___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __35__SESACWGSession_disableBluetooth___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (id)pauseRangingForReaderIdentifier:(id)a3 durationInSec:(double)a4 withAppletIdentifier:(id)a5
{
  return +[SESSessionManager pauseRangingForReaderIdentifier:durationInSec:withAppletIdentifier:](SESSessionManager, "pauseRangingForReaderIdentifier:durationInSec:withAppletIdentifier:", a3, a5, a4);
}

+ (id)resumeRangingForReaderIdentifier:(id)a3 withAppletIdentifier:(id)a4
{
  return +[SESSessionManager resumeRangingForReaderIdentifier:withAppletIdentifier:](SESSessionManager, "resumeRangingForReaderIdentifier:withAppletIdentifier:", a3, a4);
}

- (void)didStartSession:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SESACWGSession;
  -[SESSession didStartSession:](&v3, sel_didStartSession_, a3);
}

- (void)didEndUnexpectedly:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SESACWGSession;
  -[SESSession didEndUnexpectedly:](&v3, sel_didEndUnexpectedly_, a3);
}

- (void)endSession
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SESACWGSession;
  -[SESSession endSession](&v3, sel_endSession);
  -[SESACWGSession sendEvent:](self, "sendEvent:", &unk_24C2CB6D8);
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
    v7[2] = __28__SESACWGSession_sendEvent___block_invoke;
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

void __28__SESACWGSession_sendEvent___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sesSession:event:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (SESACWGSessionDelegate)delegate
{
  return (SESACWGSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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
  objc_destroyWeak((id *)&self->_delegate);
}

@end
