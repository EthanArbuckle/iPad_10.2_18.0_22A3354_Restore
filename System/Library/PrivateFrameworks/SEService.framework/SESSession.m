@implementation SESSession

- (SESSession)init
{
  SESSession *v2;
  SESSession *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SESSession;
  v2 = -[SESSession init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->state = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.seserviced.session.queue", v4);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;

    dispatch_suspend((dispatch_object_t)v3->_queue);
    v3->_isQueueSuspended = 1;
  }
  return v3;
}

- (void)dealloc
{
  NSObject *v3;
  unint64_t state;
  objc_super v5;
  uint8_t buf[4];
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (self->state != 2)
  {
    SESDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      state = self->state;
      *(_DWORD *)buf = 134217984;
      v7 = state;
      _os_log_impl(&dword_20A048000, v3, OS_LOG_TYPE_INFO, "Deallocating session in state %lu", buf, 0xCu);
    }

  }
  if (self->_isQueueSuspended)
    dispatch_resume((dispatch_object_t)self->_queue);
  v5.receiver = self;
  v5.super_class = (Class)SESSession;
  -[SESSession dealloc](&v5, sel_dealloc);
}

- (void)resume
{
  if (self->_isQueueSuspended)
  {
    dispatch_resume((dispatch_object_t)self->_queue);
    self->_isQueueSuspended = 0;
  }
}

- (id)queue
{
  return self->_queue;
}

- (void)setDidStartCallback:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__SESSession_setDidStartCallback___block_invoke;
  v7[3] = &unk_24C2BD2F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __34__SESSession_setDidStartCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

- (void)setDidEndCallback:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__SESSession_setDidEndCallback___block_invoke;
  v7[3] = &unk_24C2BD2F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __32__SESSession_setDidEndCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

}

- (void)didStartSession:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __30__SESSession_didStartSession___block_invoke;
  v7[3] = &unk_24C2BD0C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __30__SESSession_didStartSession___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  SESDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v14 = 138412290;
    v15 = v3;
    _os_log_impl(&dword_20A048000, v2, OS_LOG_TYPE_INFO, "didStartSession %@", (uint8_t *)&v14, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v4 + 48))
  {
    if (!*(_QWORD *)(a1 + 40))
    {
      *(_QWORD *)(v4 + 48) = 1;
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      if (!v11)
        return;
      (*(void (**)(void))(v11 + 16))();
      v10 = 24;
      goto LABEL_11;
    }
    *(_QWORD *)(v4 + 48) = 2;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(v5 + 24);
    if (v6)
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, 0, *(_QWORD *)(a1 + 40));
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 24);
      *(_QWORD *)(v7 + 24) = 0;

      v5 = *(_QWORD *)(a1 + 32);
    }
    v9 = *(_QWORD *)(v5 + 32);
    if (v9)
    {
      (*(void (**)(void))(v9 + 16))();
      v10 = 32;
LABEL_11:
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(v12 + v10);
      *(_QWORD *)(v12 + v10) = 0;

    }
  }
}

- (void)endSession
{
  -[SESSession endSessionWithError:](self, "endSessionWithError:", 0);
}

- (void)endSessionWithError:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__SESSession_endSessionWithError___block_invoke;
  v7[3] = &unk_24C2BD0C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __34__SESSession_endSessionWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  SESDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v20 = v3;
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_20A048000, v2, OS_LOG_TYPE_INFO, "endSession %@ with error %@", buf, 0x16u);
  }

  v5 = *(_QWORD **)(a1 + 32);
  v6 = v5[6];
  if (v6 != 2)
  {
    if (!v6)
    {
      v7 = v5[3];
      if (v7)
      {
        if (*(_QWORD *)(a1 + 40))
        {
          (*(void (**)(_QWORD, _QWORD))(v7 + 16))(v5[3], 0);
        }
        else
        {
          SESDefaultLogObject();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = *(_QWORD *)(a1 + 32);
          SESCreateAndLogError();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v9);

        }
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(v10 + 24);
        *(_QWORD *)(v10 + 24) = 0;

        v5 = *(_QWORD **)(a1 + 32);
      }
    }
    objc_msgSend(v5, "endRemoteSession", v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      SESDefaultLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v12;
        _os_log_impl(&dword_20A048000, v13, OS_LOG_TYPE_ERROR, "Failed to end remote session %@", buf, 0xCu);
      }

    }
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(_QWORD *)(v14 + 32);
    if (v15)
    {
      (*(void (**)(void))(v15 + 16))();
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(void **)(v16 + 32);
      *(_QWORD *)(v16 + 32) = 0;

      v14 = *(_QWORD *)(a1 + 32);
    }
    *(_QWORD *)(v14 + 48) = 2;

  }
}

- (id)endRemoteSession
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  -[SESSession proxy](self, "proxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__5;
  v13 = __Block_byref_object_dispose__5;
  v14 = 0;
  -[SESSession proxy](self, "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __30__SESSession_endRemoteSession__block_invoke;
  v8[3] = &unk_24C2BCCB0;
  v8[4] = &v9;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endSession:", &__block_literal_global_4);

  -[SESSession setProxy:](self, "setProxy:", 0);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __30__SESSession_endRemoteSession__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)didEndUnexpectedly:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  SESSession *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SESDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412546;
    v7 = self;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_20A048000, v5, OS_LOG_TYPE_ERROR, "Session %@ ended unexpectedly with error %@", (uint8_t *)&v6, 0x16u);
  }

  -[SESSession endSession](self, "endSession");
}

- (id)proxy
{
  SESSession *v2;
  SESSessionInterface *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_proxy;
  objc_sync_exit(v2);

  return v3;
}

- (void)setProxy:(id)a3
{
  SESSessionInterface *v4;
  SESSessionInterface *proxy;
  SESSession *obj;

  v4 = (SESSessionInterface *)a3;
  obj = self;
  objc_sync_enter(obj);
  proxy = obj->_proxy;
  obj->_proxy = v4;

  objc_sync_exit(obj);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void (**)(id, void *))a3;
  -[SESSession proxy](self, "proxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    SESDefaultLogObject();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v8);

  }
  return v6;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void (**)(id, void *))a3;
  -[SESSession proxy](self, "proxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    SESDefaultLogObject();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v8);

  }
  return v6;
}

- (unint64_t)state
{
  return self->state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong(&self->_didEndCallback, 0);
  objc_storeStrong(&self->_didStartCallback, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
