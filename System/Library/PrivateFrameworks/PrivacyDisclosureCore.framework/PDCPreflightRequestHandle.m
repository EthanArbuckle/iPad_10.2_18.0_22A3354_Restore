@implementation PDCPreflightRequestHandle

+ (id)alreadyCompletedRequestHandle
{
  if (alreadyCompletedRequestHandle_once != -1)
    dispatch_once(&alreadyCompletedRequestHandle_once, &__block_literal_global_1);
  return (id)alreadyCompletedRequestHandle_result;
}

void __58__PDCPreflightRequestHandle_alreadyCompletedRequestHandle__block_invoke()
{
  PDCPreflightRequestHandle *v0;
  void *v1;
  unsigned __int8 *v2;

  v0 = -[PDCPreflightRequestHandle initWithQueue:completionHandler:]([PDCPreflightRequestHandle alloc], "initWithQueue:completionHandler:", 0, 0);
  v1 = (void *)alreadyCompletedRequestHandle_result;
  alreadyCompletedRequestHandle_result = (uint64_t)v0;

  v2 = (unsigned __int8 *)(alreadyCompletedRequestHandle_result + 8);
  do
    __ldaxr(v2);
  while (__stlxr(1u, v2));
}

- (PDCPreflightRequestHandle)initWithQueue:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  PDCPreflightRequestHandle *v9;
  PDCPreflightRequestHandle *v10;
  uint64_t v11;
  id completionHandler;
  PDCPreflightRequestHandle *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PDCPreflightRequestHandle;
  v9 = -[PDCPreflightRequestHandle init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_isComplete._Value = 0;
    objc_storeStrong((id *)&v9->_queue, a3);
    v11 = objc_msgSend(v8, "copy");
    completionHandler = v10->_completionHandler;
    v10->_completionHandler = (id)v11;

    v13 = v10;
  }

  return v10;
}

- (void)completeRequestWithResponse:(unint64_t)a3
{
  atomic_flag *p_isComplete;
  unsigned __int8 v6;
  void *v7;
  NSObject *queue;
  id v9;
  id completionHandler;
  OS_dispatch_queue *v11;
  _QWORD v12[4];
  id v13;
  unint64_t v14;

  p_isComplete = &self->_isComplete;
  do
    v6 = __ldaxr((unsigned __int8 *)p_isComplete);
  while (__stlxr(1u, (unsigned __int8 *)p_isComplete));
  if ((v6 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x24951C578](self->_completionHandler, a2);
    queue = self->_queue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __57__PDCPreflightRequestHandle_completeRequestWithResponse___block_invoke;
    v12[3] = &unk_2515A2CA8;
    v13 = v7;
    v14 = a3;
    v9 = v7;
    dispatch_async(queue, v12);
    completionHandler = self->_completionHandler;
    self->_completionHandler = 0;

    v11 = self->_queue;
    self->_queue = 0;

  }
}

uint64_t __57__PDCPreflightRequestHandle_completeRequestWithResponse___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)cancel
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2449FF000, v3, OS_LOG_TYPE_INFO, "Disclosure alert cancelled by client.", v5, 2u);
  }
  +[PDCPrivacyAlertPresenter sharedPresenter](PDCPrivacyAlertPresenter, "sharedPresenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didCancelRequestHandle:", self);

  -[PDCPreflightRequestHandle completeRequestWithResponse:](self, "completeRequestWithResponse:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
