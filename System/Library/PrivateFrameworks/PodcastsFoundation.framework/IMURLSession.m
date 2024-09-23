@implementation IMURLSession

- (void)setFollowsRedirects:(BOOL)a3
{
  if (-[IMURLSession followsRedirects](self, "followsRedirects") != a3)
  {
    self->_followsRedirects = a3;
    -[IMURLSession _configureProtocolHandler](self, "_configureProtocolHandler");
  }
}

- (IMURLSession)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  IMURLSession *v5;
  IMURLSession *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *syncQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IMURLSession;
  v5 = -[AMSURLSession initWithConfiguration:delegate:delegateQueue:](&v10, sel_initWithConfiguration_delegate_delegateQueue_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    v5->_followsRedirects = 1;
    v7 = dispatch_queue_create(0, 0);
    syncQueue = v6->_syncQueue;
    v6->_syncQueue = (OS_dispatch_queue *)v7;

  }
  return v6;
}

- (BOOL)followsRedirects
{
  return self->_followsRedirects;
}

- (int64_t)state
{
  NSObject *syncQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __21__IMURLSession_state__block_invoke;
  v5[3] = &unk_1E54D19C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __21__IMURLSession_state__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 88);
  return result;
}

- (BOOL)isUsable
{
  return -[IMURLSession state](self, "state") == 0;
}

- (void)finishTasksAndInvalidate
{
  NSObject *syncQueue;
  objc_super v4;
  _QWORD block[5];

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__IMURLSession_finishTasksAndInvalidate__block_invoke;
  block[3] = &unk_1E54D0DE0;
  block[4] = self;
  dispatch_sync(syncQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)IMURLSession;
  -[AMSURLSession finishTasksAndInvalidate](&v4, sel_finishTasksAndInvalidate);
}

uint64_t __40__IMURLSession_finishTasksAndInvalidate__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 88) = 1;
  return result;
}

- (void)invalidateAndCancel
{
  NSObject *syncQueue;
  objc_super v4;
  _QWORD block[5];

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__IMURLSession_invalidateAndCancel__block_invoke;
  block[3] = &unk_1E54D0DE0;
  block[4] = self;
  dispatch_sync(syncQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)IMURLSession;
  -[AMSURLSession invalidateAndCancel](&v4, sel_invalidateAndCancel);
}

uint64_t __35__IMURLSession_invalidateAndCancel__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 88) = 1;
  return result;
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *syncQueue;
  objc_super v9;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__IMURLSession_URLSession_didBecomeInvalidWithError___block_invoke;
  block[3] = &unk_1E54D0DE0;
  block[4] = self;
  dispatch_sync(syncQueue, block);
  if (objc_msgSend((id)-[IMURLSession superclass](self, "superclass"), "instancesRespondToSelector:", sel_URLSession_didBecomeInvalidWithError_))
  {
    v9.receiver = self;
    v9.super_class = (Class)IMURLSession;
    -[IMURLSession URLSession:didBecomeInvalidWithError:](&v9, sel_URLSession_didBecomeInvalidWithError_, v6, v7);
  }

}

uint64_t __53__IMURLSession_URLSession_didBecomeInvalidWithError___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 88) = 2;
  return result;
}

- (void)_configureProtocolHandler
{
  IMURLProtocolHandler *v3;
  id v4;

  -[AMSURLSession protocolHandler](self, "protocolHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = objc_alloc_init(IMURLProtocolHandler);

    -[AMSURLSession setProtocolHandler:](self, "setProtocolHandler:", v3);
    v4 = v3;
  }
  objc_msgSend(v4, "setFollowsRedirects:", -[IMURLSession followsRedirects](self, "followsRedirects"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
}

@end
