@implementation _UIAfterCACommitQueue

- (BOOL)flush
{
  _UIAfterCACommitBlock **p_first;
  _UIAfterCACommitBlock *v5;
  unsigned __int8 *p_transactionCleared;
  int v7;
  int v8;
  _UIAfterCACommitBlock *first;
  _UIAfterCACommitBlock *last;
  _UIAfterCACommitBlock *v11;
  int v12;
  _UIAfterCACommitBlock *v13;
  _UIAfterCACommitBlock *next;
  void *v16;

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIAfterCACommitQueue.m"), 212, CFSTR("Call must be made on main thread"));

  }
  p_first = &self->_first;
  v5 = self->_first;
  while (*p_first)
  {
    p_transactionCleared = (unsigned __int8 *)&(*p_first)->_transactionCleared;
    while (1)
    {
      v7 = __ldxr(p_transactionCleared);
      if (v7 != 1)
        break;
      v8 = 1;
      if (!__stxr(1u, p_transactionCleared))
        goto LABEL_10;
    }
    v8 = 0;
    __clrex();
LABEL_10:
    first = *p_first;
    if (!v8)
    {
      if (first)
        goto LABEL_14;
      break;
    }
    objc_storeStrong((id *)&self->_first, first->_next);
  }
  last = self->_last;
  self->_last = 0;

  first = self->_first;
LABEL_14:
  v11 = first;
  if (v5 == v11)
  {
    LOBYTE(v12) = 0;
  }
  else
  {
    v12 = 0;
    do
    {
      v13 = v5->_next;
      v12 |= -[_UIAfterCACommitBlock run](v5, "run");
      next = v5->_next;
      v5->_next = 0;

      v5 = v13;
    }
    while (v13 != v11);
    v5 = v11;
  }

  return v12 & 1;
}

- (void)enqueuePostCommitBlock:(id)a3
{
  -[_UIAfterCACommitQueue _enqueueCommitResponse:forPhase:]((uint64_t)self, a3, 2);
}

- (void)_enqueueCommitResponse:(uint64_t)a3 forPhase:
{
  id v5;
  unsigned __int8 *v6;
  uint64_t v7;
  id *v8;
  id *v9;
  void *v10;
  unsigned __int8 *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  unsigned __int8 *v20;
  uint64_t v21;

  if (a1)
  {
    v5 = a2;
    if (pthread_main_np() != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__enqueueCommitResponse_forPhase_, a1, CFSTR("_UIAfterCACommitQueue.m"), 188, CFSTR("Call must be made on main thread"));

    }
    v6 = -[_UIAfterCACommitBlock _initWithBlock:]((unsigned __int8 *)[_UIAfterCACommitBlock alloc], v5);

    v8 = (id *)(a1 + 16);
    v7 = *(_QWORD *)(a1 + 16);
    if (v7)
    {
      v9 = (id *)(v7 + 8);
    }
    else
    {
      if (*(_QWORD *)(a1 + 8))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel__enqueueCommitResponse_forPhase_, a1, CFSTR("_UIAfterCACommitQueue.m"), 195, CFSTR("if there's no _last then there can't be a _first either"));

      }
      v9 = (id *)(a1 + 16);
      v8 = (id *)(a1 + 8);
    }
    objc_storeStrong(v9, v6);
    objc_storeStrong(v8, v6);
    objc_msgSend(MEMORY[0x1E0CD28B0], "activate");
    v10 = (void *)MEMORY[0x1E0CD28B0];
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __57___UIAfterCACommitQueue__enqueueCommitResponse_forPhase___block_invoke;
    v19 = &unk_1E16B1B50;
    v11 = v6;
    v20 = v11;
    v21 = a1;
    if ((objc_msgSend(v10, "addCommitHandler:forPhase:", &v16, a3) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(MEMORY[0x1E0CD28B0], "currentPhase");
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel__enqueueCommitResponse_forPhase_, a1, CFSTR("_UIAfterCACommitQueue.m"), 208, CFSTR("failed to register commit handler for phase = %i (current is %i)"), a3, v14, v16, v17, v18, v19);

    }
  }
}

- (_UIAfterCACommitQueue)init
{
  _UIAfterCACommitQueue *v2;
  _UIAfterCACommitQueue *v3;
  _UIAfterCACommitBlock *first;
  _UIAfterCACommitBlock *last;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIAfterCACommitQueue;
  v2 = -[_UIAfterCACommitQueue init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    first = v2->_first;
    v2->_first = 0;

    last = v3->_last;
    v3->_last = 0;

  }
  return v3;
}

- (void)enqueuePostSynchronizeBlock:(id)a3
{
  -[_UIAfterCACommitQueue _enqueueCommitResponse:forPhase:]((uint64_t)self, a3, 5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_last, 0);
  objc_storeStrong((id *)&self->_first, 0);
}

@end
