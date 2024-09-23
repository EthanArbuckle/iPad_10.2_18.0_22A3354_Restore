@implementation PLFakeCPLPullChangeSession

- (id)forwardingTargetForSelector:(SEL)a3
{
  fileTTRForUnimplementedSelector(a3);
  return 0;
}

- (PLFakeCPLPullChangeSession)initWithLibraryManager:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  PLFakeCPLPullChangeSession *v8;
  PLFakeCPLPullChangeSession *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PLFakeCPLPullChangeSession;
  v8 = -[PLFakeCPLPullChangeSession init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_libraryManager, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
  }

  return v9;
}

- (void)getChangeBatchWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PLFakeCPLPullChangeSession_getChangeBatchWithCompletionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

- (void)acknowledgeChangeBatch:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PLFakeCPLPullChangeSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, block);

}

- (void)finalizeWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  _QWORD block[4];
  id v11;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PLFakeCPLPullChangeSession_finalizeWithCompletionHandler___block_invoke;
  block[3] = &unk_1E3676CD8;
  v11 = v4;
  v6 = v4;
  dispatch_async(queue, block);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryManager);
  objc_msgSend(WeakRetained, "syncStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLastSuccessfulSyncDate:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_libraryManager);
}

uint64_t __60__PLFakeCPLPullChangeSession_finalizeWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __75__PLFakeCPLPullChangeSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v1 + 16))(v1, 0, v2);

}

uint64_t __66__PLFakeCPLPullChangeSession_getChangeBatchWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)forwardingTargetForSelector:(SEL)a3
{
  fileTTRForUnimplementedSelector(a3);
  return 0;
}

@end
