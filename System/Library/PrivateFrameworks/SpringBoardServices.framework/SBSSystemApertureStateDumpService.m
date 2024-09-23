@implementation SBSSystemApertureStateDumpService

- (void)requestSystemApertureStateDumpWithCompletion:(id)a3
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
  v7[2] = __82__SBSSystemApertureStateDumpService_requestSystemApertureStateDumpWithCompletion___block_invoke;
  v7[3] = &unk_1E288D528;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "requestSystemApertureStateDumpWithCompletion:", v7);

}

void __82__SBSSystemApertureStateDumpService_requestSystemApertureStateDumpWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__SBSSystemApertureStateDumpService_requestSystemApertureStateDumpWithCompletion___block_invoke_2;
    block[3] = &unk_1E288D500;
    v11 = *(id *)(a1 + 40);
    v9 = v5;
    v10 = v6;
    dispatch_async(v7, block);

  }
}

uint64_t __82__SBSSystemApertureStateDumpService_requestSystemApertureStateDumpWithCompletion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)writeSystemApertureStateDumpToTextFileAtPath:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBSAbstractSystemService client](self, "client");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeSystemApertureStateDumpToTextFileAtPath:", v4);

}

@end
