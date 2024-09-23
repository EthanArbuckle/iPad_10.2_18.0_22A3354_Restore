@implementation PPXPCClientPipelinedBatchQueryContext

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handleBatch, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_finalizeCall, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setHandleBatch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setFinalizeCall:(id)a3
{
  void *v4;
  id finalizeCall;

  atomic_store(0, (unsigned __int8 *)&self->_calledFinalizeBlock);
  v4 = (void *)MEMORY[0x18D780768](a3, a2);
  finalizeCall = self->_finalizeCall;
  self->_finalizeCall = v4;

}

- (void)finalizeCallWithSuccess:(BOOL)a3 error:(id)a4
{
  atomic_flag *p_calledFinalizeBlock;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  int v9;
  PPXPCClientPipelinedBatchQueryContext *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  p_calledFinalizeBlock = &self->_calledFinalizeBlock;
  do
    v6 = __ldaxr((unsigned __int8 *)p_calledFinalizeBlock);
  while (__stlxr(1u, (unsigned __int8 *)p_calledFinalizeBlock));
  if ((v6 & 1) == 0)
  {
    v7 = a4;
    pp_xpc_client_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412290;
      v10 = self;
      _os_log_debug_impl(&dword_18BE3A000, v8, OS_LOG_TYPE_DEBUG, "calling finalize block for context: %@", (uint8_t *)&v9, 0xCu);
    }

    (*((void (**)(void))self->_finalizeCall + 2))();
  }
}

- (id)handleBatch
{
  return self->_handleBatch;
}

- (id)description
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPXPCClientPipelinedBatchQueryContext queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<PPXPCClientPipelinedBatchQueryContext q:%s s:%d>"), dispatch_queue_get_label(v4), self->_stop);

  return v5;
}

@end
