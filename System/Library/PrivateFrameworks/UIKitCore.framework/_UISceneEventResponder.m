@implementation _UISceneEventResponder

- (void)enqueuePostSynchronizeResponse:(id)a3
{
  -[_UISceneEventResponder _enqueueCommitResponse:forPhase:]((uint64_t)self, a3, 5);
}

- (void)_enqueueCommitResponse:(uint64_t)a3 forPhase:
{
  id v5;
  _UISceneEventResponse *v6;
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id *v14;
  id *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  uint64_t v26;
  id v27;
  objc_super v28;

  if (a1)
  {
    v5 = a2;
    if (pthread_main_np() != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", sel__enqueueCommitResponse_forPhase_, a1, CFSTR("_UISceneEventResponder.m"), 71, CFSTR("Call must be made on main thread"));

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 12));
    v6 = [_UISceneEventResponse alloc];
    v7 = v5;
    if (v6)
    {
      v28.receiver = v6;
      v28.super_class = (Class)_UISceneEventResponse;
      v8 = objc_msgSendSuper2(&v28, sel_init);
      v9 = v8;
      if (v8)
      {
        v10 = (void *)v8[1];
        v8[1] = 0;

        v11 = objc_msgSend(v7, "copy");
        v12 = (void *)v9[2];
        v9[2] = v11;

        *((_BYTE *)v9 + 24) = 0;
      }
    }
    else
    {
      v9 = 0;
    }

    v14 = (id *)(a1 + 24);
    v13 = *(_QWORD *)(a1 + 24);
    if (v13)
    {
      v15 = (id *)(v13 + 8);
    }
    else
    {
      if (*(_QWORD *)(a1 + 16))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", sel__enqueueCommitResponse_forPhase_, a1, CFSTR("_UISceneEventResponder.m"), 79, CFSTR("if there's no _last then there can't be a _first either"));

      }
      v15 = (id *)(a1 + 24);
      v14 = (id *)(a1 + 16);
    }
    objc_storeStrong(v15, v9);
    objc_storeStrong(v14, v9);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 12));
    objc_msgSend(MEMORY[0x1E0CD28B0], "activate");
    v16 = (void *)MEMORY[0x1E0CD28B0];
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __58___UISceneEventResponder__enqueueCommitResponse_forPhase___block_invoke;
    v25 = &unk_1E16B1B50;
    v26 = a1;
    v17 = v9;
    v27 = v17;
    if ((objc_msgSend(v16, "addCommitHandler:forPhase:", &v22, a3) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(MEMORY[0x1E0CD28B0], "currentPhase");
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", sel__enqueueCommitResponse_forPhase_, a1, CFSTR("_UISceneEventResponder.m"), 88, CFSTR("failed to register commit handler for phase = %i (current is %i)"), a3, v20, v22, v23, v24, v25, v26);

    }
  }
}

- (_UISceneEventResponder)init
{
  _UISceneEventResponder *v2;
  _UISceneEventResponder *v3;
  _UISceneEventResponse *dataLock_first;
  _UISceneEventResponse *dataLock_last;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UISceneEventResponder;
  v2 = -[_UISceneEventResponder init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    dataLock_first = v2->_dataLock_first;
    *(_QWORD *)&v2->_sendLock._os_unfair_lock_opaque = 0;
    v2->_dataLock_first = 0;

    dataLock_last = v3->_dataLock_last;
    v3->_dataLock_last = 0;

  }
  return v3;
}

- (void)enqueuePostCommitResponse:(id)a3
{
  -[_UISceneEventResponder _enqueueCommitResponse:forPhase:]((uint64_t)self, a3, 2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataLock_last, 0);
  objc_storeStrong((id *)&self->_dataLock_first, 0);
}

@end
