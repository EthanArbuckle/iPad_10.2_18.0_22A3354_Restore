@implementation STKAlertSession

- (STKAlertSession)initWithLogger:(id)a3 responseProvider:(id)a4 options:(id)a5 sound:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  STKAlertSession *v17;
  STKAlertSession *v18;
  NSObject *logger;
  void *v21;
  void *v22;
  objc_super v23;
  uint8_t buf[4];
  STKAlertSession *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = objc_msgSend((id)objc_opt_class(), "_requiresResponseProvider");
  if (!v13 && v16)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STKAlertSession.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("responseProvider"));

    if (v14)
      goto LABEL_4;
LABEL_9:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STKAlertSession.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

    goto LABEL_4;
  }
  if (!v14)
    goto LABEL_9;
LABEL_4:
  v23.receiver = self;
  v23.super_class = (Class)STKAlertSession;
  v17 = -[STKAlertSession init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_logger, a3);
    v18->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v18->_responseProvider, a4);
    objc_storeStrong((id *)&v18->_options, a5);
    objc_storeStrong((id *)&v18->_sound, a6);
    logger = v18->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v25 = v18;
      _os_log_impl(&dword_216439000, logger, OS_LOG_TYPE_DEFAULT, "Session <%p> - Created", buf, 0xCu);
    }
  }

  return v18;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STKAlertSession.m"), 104, CFSTR("Cannot deallocate an alert session unless it was explicitly invalidated."));

  }
  v5.receiver = self;
  v5.super_class = (Class)STKAlertSession;
  -[STKAlertSession dealloc](&v5, sel_dealloc);
}

- (SBSRemoteAlertHandle)alertHandle
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __30__STKAlertSession_alertHandle__block_invoke;
  v4[3] = &unk_24D5635D8;
  v4[4] = self;
  v4[5] = &v5;
  _STKWithLock((os_unfair_lock_s *)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SBSRemoteAlertHandle *)v2;
}

void __30__STKAlertSession_alertHandle__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)presentRemoteAlertHandle:(id)a3 withAction:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  SEL v14;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__STKAlertSession_presentRemoteAlertHandle_withAction___block_invoke;
  v11[3] = &unk_24D5630F8;
  v11[4] = self;
  v12 = v8;
  v13 = v7;
  v14 = a2;
  v9 = v7;
  v10 = v8;
  _STKWithLock((os_unfair_lock_s *)self, v11);

}

void __55__STKAlertSession_presentRemoteAlertHandle_withAction___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _QWORD block[4];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 41))
  {
    v3 = *(NSObject **)(v2 + 48);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v14 = v4;
      _os_log_impl(&dword_216439000, v3, OS_LOG_TYPE_DEFAULT, "Session <%p> - Attempted to present an already invalidated session.  Ignoring.", buf, 0xCu);
    }
    v5 = *(void **)(a1 + 48);
    if (v5)
      objc_msgSend(v5, "invalidate");
    v6 = *(void **)(a1 + 40);
    if (v6)
    {
      dispatch_get_global_queue(25, 0);
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __55__STKAlertSession_presentRemoteAlertHandle_withAction___block_invoke_60;
      block[3] = &unk_24D563080;
      v12 = v6;
      dispatch_async(v7, block);

    }
  }
  else
  {
    if (*(_QWORD *)(v2 + 24))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("STKAlertSession.m"), 120, CFSTR("Cannot set multiple alert handles for a given session."));

      v2 = *(_QWORD *)(a1 + 32);
    }
    objc_storeStrong((id *)(v2 + 32), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObserver:");
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v14 = v9;
      _os_log_impl(&dword_216439000, v8, OS_LOG_TYPE_DEFAULT, "Session <%p> - Presenting remote alert", buf, 0xCu);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "activateWithContext:", 0);
  }
}

uint64_t __55__STKAlertSession_presentRemoteAlertHandle_withAction___block_invoke_60(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (BOOL)hasSentResponse
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__STKAlertSession_hasSentResponse__block_invoke;
  v4[3] = &unk_24D5635D8;
  v4[4] = self;
  v4[5] = &v5;
  _STKWithLock((os_unfair_lock_s *)self, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __34__STKAlertSession_hasSentResponse__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "hasSentResponse");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)invalidate
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __29__STKAlertSession_invalidate__block_invoke;
  v2[3] = &unk_24D563080;
  v2[4] = self;
  _STKWithLock((os_unfair_lock_s *)self, v2);
}

void __29__STKAlertSession_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 41))
  {
    v3 = *(NSObject **)(v1 + 48);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v13 = v4;
      _os_log_impl(&dword_216439000, v3, OS_LOG_TYPE_DEFAULT, "Session <%p> - Invalidated", buf, 0xCu);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "stopSound");
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "hasSentResponse") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "_lock_sendResponse:", 1);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObserver:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
    v5 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 32);
    *(_QWORD *)(v6 + 32) = 0;

    dispatch_get_global_queue(25, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __29__STKAlertSession_invalidate__block_invoke_61;
    block[3] = &unk_24D563080;
    v11 = v5;
    v9 = v5;
    dispatch_async(v8, block);

  }
}

uint64_t __29__STKAlertSession_invalidate__block_invoke_61(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)sendResponse:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __32__STKAlertSession_sendResponse___block_invoke;
  v3[3] = &unk_24D562FC8;
  v3[4] = self;
  v3[5] = a3;
  _STKWithLock((os_unfair_lock_s *)self, v3);
}

uint64_t __32__STKAlertSession_sendResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_sendResponse:", *(_QWORD *)(a1 + 40));
}

- (void)sendResponse:(int64_t)a3 withStringResult:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  int64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__STKAlertSession_sendResponse_withStringResult___block_invoke;
  v8[3] = &unk_24D562FF0;
  v9 = v6;
  v10 = a3;
  v8[4] = self;
  v7 = v6;
  _STKWithLock((os_unfair_lock_s *)self, v8);

}

uint64_t __49__STKAlertSession_sendResponse_withStringResult___block_invoke(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  unint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  _BYTE v9[24];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 41))
  {
    v2 = (_QWORD *)result;
    v3 = *(NSObject **)(v1 + 48);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v2[4];
      v5 = v2[6] - 1;
      if (v5 > 6)
        v6 = CFSTR("Success");
      else
        v6 = off_24D563690[v5];
      v7 = *(_QWORD *)(v2[4] + 16);
      *(_DWORD *)v9 = 134218498;
      *(_QWORD *)&v9[4] = v4;
      *(_WORD *)&v9[12] = 2114;
      *(_QWORD *)&v9[14] = v6;
      *(_WORD *)&v9[22] = 2112;
      v10 = v7;
      v8 = v3;
      _os_log_impl(&dword_216439000, v8, OS_LOG_TYPE_DEFAULT, "Session <%p> - Sending response with type: %{public}@ - string result: <redacted> (responsProvider: %@)", v9, 0x20u);

    }
    return objc_msgSend(*(id *)(v2[4] + 16), "sendResponse:withStringResult:", v2[6], v2[5], *(_OWORD *)v9, *(_QWORD *)&v9[16], v10);
  }
  return result;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v3;

  -[STKAlertSession sound](self, "sound", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playSound");

}

+ (BOOL)_requiresResponseProvider
{
  return 1;
}

- (void)_lock_sendResponse:(int64_t)a3
{
  NSObject *logger;
  const __CFString *v6;
  NSObject *v7;
  _BYTE v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_invalidated)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(a3 - 1) > 6)
        v6 = CFSTR("Success");
      else
        v6 = off_24D563690[a3 - 1];
      *(_DWORD *)v8 = 134218242;
      *(_QWORD *)&v8[4] = self;
      *(_WORD *)&v8[12] = 2114;
      *(_QWORD *)&v8[14] = v6;
      v7 = logger;
      _os_log_impl(&dword_216439000, v7, OS_LOG_TYPE_DEFAULT, "Session <%p> - Sending response with type: %{public}@", v8, 0x16u);

    }
    -[STKAlertSessionResponseProvider sendResponse:](self->_responseProvider, "sendResponse:", a3, *(_OWORD *)v8, *(_QWORD *)&v8[16], v9);
  }
}

- (NSDictionary)options
{
  return self->_options;
}

- (STKSound)sound
{
  return self->_sound;
}

- (void)setSound:(id)a3
{
  objc_storeStrong((id *)&self->_sound, a3);
}

- (STKSessionAction)alertAction
{
  return self->_alertAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_alertAction, 0);
  objc_storeStrong((id *)&self->_alertHandle, 0);
  objc_storeStrong((id *)&self->_responseProvider, 0);
}

@end
