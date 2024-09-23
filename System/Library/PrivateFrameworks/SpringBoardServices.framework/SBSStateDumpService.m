@implementation SBSStateDumpService

- (void)requestStateDump:(unint64_t)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  -[SBSAbstractSystemService client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__SBSStateDumpService_requestStateDump_withCompletion___block_invoke;
  v9[3] = &unk_1E288EE08;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "requestStateDump:withCompletion:", a3, v9);

}

void __55__SBSStateDumpService_requestStateDump_withCompletion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  char v14;

  v7 = a3;
  v8 = a4;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__SBSStateDumpService_requestStateDump_withCompletion___block_invoke_2;
    v10[3] = &unk_1E288EDE0;
    v13 = *(id *)(a1 + 40);
    v14 = a2;
    v11 = v7;
    v12 = v8;
    dispatch_async(v9, v10);

  }
}

uint64_t __55__SBSStateDumpService_requestStateDump_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)writeStateDump:(unint64_t)a3 toTextFileAtPath:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[SBSAbstractSystemService client](self, "client");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writeStateDump:toTextFileAtPath:", a3, v6);

}

- (void)enableRemoteStateDumpWithTimeout:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  -[SBSAbstractSystemService client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__SBSStateDumpService_enableRemoteStateDumpWithTimeout_completion___block_invoke;
  v9[3] = &unk_1E288EE58;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "enableRemoteStateDumpWithTimeout:completion:", a3, v9);

}

void __67__SBSStateDumpService_enableRemoteStateDumpWithTimeout_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__SBSStateDumpService_enableRemoteStateDumpWithTimeout_completion___block_invoke_2;
    block[3] = &unk_1E288EE30;
    v9 = *(id *)(a1 + 40);
    v10 = a2;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

uint64_t __67__SBSStateDumpService_enableRemoteStateDumpWithTimeout_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)disableRemoteStateDumpWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SBSAbstractSystemService client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__SBSStateDumpService_disableRemoteStateDumpWithCompletion___block_invoke;
  v7[3] = &unk_1E288EE58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "disableRemoteStateDumpWithCompletion:", v7);

}

void __60__SBSStateDumpService_disableRemoteStateDumpWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__SBSStateDumpService_disableRemoteStateDumpWithCompletion___block_invoke_2;
    block[3] = &unk_1E288EE30;
    v9 = *(id *)(a1 + 40);
    v10 = a2;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

uint64_t __60__SBSStateDumpService_disableRemoteStateDumpWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

@end
