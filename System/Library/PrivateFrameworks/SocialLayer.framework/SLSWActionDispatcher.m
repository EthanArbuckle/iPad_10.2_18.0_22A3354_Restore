@implementation SLSWActionDispatcher

- (SLSWActionDispatcher)initWithQueue:(id)a3
{
  id v5;
  SLSWActionDispatcher *v6;
  SLSWActionDispatcher *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *workQueue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SLSWActionDispatcher;
  v6 = -[SLSWActionDispatcher init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callbackQueue, a3);
    SLDGlobalWorkloop();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create_with_target_V2("com.apple.sociallayerd.SLSWActionDispatcher", 0, v8);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v9;

  }
  return v7;
}

- (id)bundleIDForProcess:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingIdentity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0D87D68], "handleForPredicate:error:", v6, &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16;
  if (!v7)
  {
    SLDaemonLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v20 = v5;
      v21 = 2112;
      v22 = v6;
      v23 = 2112;
      v24 = v8;
      _os_log_error_impl(&dword_199EFF000, v11, OS_LOG_TYPE_ERROR, "Failed to get bundle ID from process identity: %@, predicate: %@, error: %@", buf, 0x20u);
    }

    if (v8)
    {
      v9 = v8;
      if (a4)
      {
LABEL_7:
        v9 = objc_retainAutorelease(v9);
        v10 = 0;
        *a4 = v9;
        goto LABEL_10;
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to get bundle ID from process identity: %@"), v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v14);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (a4)
        goto LABEL_7;
    }
    v10 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v7, "bundle");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v10;
}

- (void)dispatchAction:(id)a3 withAssertionForProcess:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__SLSWActionDispatcher_dispatchAction_withAssertionForProcess_completion___block_invoke;
  v10[3] = &unk_1E3794990;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[SLSWActionDispatcher _sendAction:toProcess:completion:](self, "_sendAction:toProcess:completion:", a3, a4, v10);

}

void __74__SLSWActionDispatcher_dispatchAction_withAssertionForProcess_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v20 = 0;
    +[SLRBSAssertion assertionWithType:pid:error:](SLRBSAssertion, "assertionWithType:pid:error:", 0, objc_msgSend(v5, "pid"), &v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v20;
    if (v8 && (objc_msgSend(v8, "isValid") & 1) != 0)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else if (!v9)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB2938];
      v24[0] = CFSTR("We were able to launch the target app, but we failed to acquire the required RB assertion.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v11);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    if (v6)
    {
      v12 = v6;
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0CB2938];
      v22 = CFSTR("Unable to launch app for a universal link.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v14);
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __74__SLSWActionDispatcher_dispatchAction_withAssertionForProcess_completion___block_invoke_2;
    v17[3] = &unk_1E37946E0;
    v16 = *(id *)(a1 + 40);
    v18 = v12;
    v19 = v16;
    v9 = v12;
    dispatch_async(v15, v17);

    v8 = v19;
  }

}

uint64_t __74__SLSWActionDispatcher_dispatchAction_withAssertionForProcess_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)dispatchAction:(id)a3 toProcess:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__SLSWActionDispatcher_dispatchAction_toProcess_completion___block_invoke;
  v10[3] = &unk_1E37949B8;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[SLSWActionDispatcher _sendAction:toProcess:completion:](self, "_sendAction:toProcess:completion:", a3, a4, v10);

}

void __60__SLSWActionDispatcher_dispatchAction_toProcess_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = 0;
  }
  else if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2938];
    v18[0] = CFSTR("Unable to launch app for a universal link.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v10);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SLSWActionDispatcher_dispatchAction_toProcess_completion___block_invoke_2;
  block[3] = &unk_1E37946E0;
  v12 = *(id *)(a1 + 40);
  v15 = v8;
  v16 = v12;
  v13 = v8;
  dispatch_async(v11, block);

}

uint64_t __60__SLSWActionDispatcher_dispatchAction_toProcess_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_sendAction:(id)a3 toProcess:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26 = 0;
  -[SLSWActionDispatcher bundleIDForProcess:error:](self, "bundleIDForProcess:error:", v9, &v26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v26;
  if (v11)
  {
    objc_msgSend(v8, "sourceBSAction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D22D00]);
      v31 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D22CE0]);

      objc_msgSend(MEMORY[0x1E0D23158], "optionsWithDictionary:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      SLDaemonLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "-[SLSWActionDispatcher _sendAction:toProcess:completion:]";
        v29 = 2114;
        v30 = v11;
        _os_log_impl(&dword_199EFF000, v18, OS_LOG_TYPE_DEFAULT, "[%s] Launching app with bundleIdentifier: %{public}@", buf, 0x16u);
      }

      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __57__SLSWActionDispatcher__sendAction_toProcess_completion___block_invoke;
      v23[3] = &unk_1E37949B8;
      v24 = v11;
      v25 = v10;
      objc_msgSend(v17, "openApplication:withOptions:completion:", v24, v16, v23);

    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v32 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to retrieve a BSAction for: %@"), v8);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLDCollaborationHandshakeService"), 1, v22);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);
    }

  }
  else
  {
    SLDaemonLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[SLSWActionDispatcher _sendAction:toProcess:completion:].cold.1((uint64_t)v8, (uint64_t)v9, v19);

    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v12);
  }

}

void __57__SLSWActionDispatcher__sendAction_toProcess_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  SLDaemonLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __57__SLSWActionDispatcher__sendAction_toProcess_completion___block_invoke_cold_1(a1, (uint64_t)v6, v8);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v11 = 138543362;
    v12 = v9;
    _os_log_impl(&dword_199EFF000, v8, OS_LOG_TYPE_DEFAULT, "Application launch succeeded for bundle identifier: %{public}@", (uint8_t *)&v11, 0xCu);
  }

  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);

}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

- (void)_sendAction:(uint64_t)a1 toProcess:(uint64_t)a2 completion:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_4(&dword_199EFF000, a2, a3, "Could not send action (%@) without a bundle ID for process (%@)", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

void __57__SLSWActionDispatcher__sendAction_toProcess_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_4(&dword_199EFF000, a2, a3, "Application launch failed for %{public}@: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

@end
