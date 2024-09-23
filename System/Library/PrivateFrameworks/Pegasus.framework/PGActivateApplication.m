@implementation PGActivateApplication

void __PGActivateApplication_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0CFE2A8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (openApplicationService_block_invoke_onceToken != -1)
      dispatch_once(&openApplicationService_block_invoke_onceToken, &__block_literal_global_0);
    if (openApplicationService)
    {
      v4 = *(_QWORD *)(a1 + 32);
      if (v4)
      {
        v15 = *MEMORY[0x1E0DC5D00];
        v16[0] = v4;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }
      objc_msgSend(MEMORY[0x1E0D23158], "optionsWithDictionary:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)openApplicationService;
      v10 = MEMORY[0x1E0C809B0];
      v11 = 3221225472;
      v12 = __PGActivateApplication_block_invoke_3;
      v13 = &unk_1E622F610;
      v14 = *(id *)(a1 + 48);
      objc_msgSend(v9, "openApplication:withOptions:completion:", v3, v8, &v10);

    }
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1000, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

  }
  objc_msgSend(*(id *)(a1 + 40), "invalidate", v10, v11, v12, v13);

}

void __PGActivateApplication_block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)openApplicationService;
  openApplicationService = v0;

}

void __PGActivateApplication_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1000, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v4);

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t))(v3 + 16))(*(_QWORD *)(a1 + 32), 1);
  }
}

@end
