@implementation APNSURLSessionTaskInfo

- (APNSURLSessionTaskInfo)initWithTask:(id)a3 delegate:(id)a4 modes:(id)a5
{
  id v9;
  id v10;
  id v11;
  APNSURLSessionTaskInfo *v12;
  APNSURLSessionTaskInfo *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSThread *thread;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSArray *modes;
  objc_super v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)APNSURLSessionTaskInfo;
  v12 = -[APNSURLSessionTaskInfo init](&v27, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v10);
    objc_msgSend_currentThread(MEMORY[0x24BDD17F0], v14, v15, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    thread = v13->_thread;
    v13->_thread = (NSThread *)v18;

    v24 = objc_msgSend_copy(v11, v20, v21, v22, v23);
    modes = v13->_modes;
    v13->_modes = (NSArray *)v24;

    objc_storeStrong((id *)&v13->_task, a3);
  }

  return v13;
}

- (void)performBlock:(id)a3
{
  ((void (*)(APNSURLSessionTaskInfo *, char *, id, _QWORD))MEMORY[0x24BEDD108])(self, sel_perform_waitUntilDone_, a3, 0);
}

- (void)performBlockAndWait:(id)a3
{
  ((void (*)(APNSURLSessionTaskInfo *, char *, id, uint64_t))MEMORY[0x24BEDD108])(self, sel_perform_waitUntilDone_, a3, 1);
}

- (void)perform:(id)a3 waitUntilDone:(BOOL)a4
{
  uint64_t v4;
  _BOOL8 v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  id v19;

  v5 = a4;
  v19 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, a4, v4);
  objc_msgSend_thread(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x22E2E63EC](v19);
  objc_msgSend_modes(self, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performSelector_onThread_withObject_waitUntilDone_modes_(self, v18, (uint64_t)sel_performBlockOnClientThread_, (uint64_t)v11, (uint64_t)v12, v5, v17);

}

- (void)performBlockOnClientThread:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)invalidate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend_setDelegate_(self, a2, 0, v2, v3);
  MEMORY[0x24BEDD108](self, sel_setThread_, 0, v5, v6);
}

- (NSURLSessionDataTask)task
{
  return (NSURLSessionDataTask *)objc_getProperty(self, a2, 8, 1);
}

- (NSURLSessionDataDelegate)delegate
{
  return (NSURLSessionDataDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSThread)thread
{
  return (NSThread *)objc_getProperty(self, a2, 24, 1);
}

- (void)setThread:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)modes
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setModes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modes, 0);
  objc_storeStrong((id *)&self->_thread, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_task, 0);
}

@end
