@implementation WFCompactUnlockService

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[WFCompactUnlockService service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)WFCompactUnlockService;
  -[WFCompactUnlockService dealloc](&v4, sel_dealloc);
}

- (void)requestUnlockIfNeeded:(id)a3
{
  id v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = MKBGetDeviceLockState();
  if (v5 != 3 && v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DAAF00]);
    -[WFCompactUnlockService setService:](self, "setService:", v6);

    -[WFCompactUnlockService service](self, "service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__WFCompactUnlockService_requestUnlockIfNeeded___block_invoke;
    v9[3] = &unk_1E7AF4A38;
    v10 = v4;
    objc_msgSend(v7, "requestPasscodeUnlockUIWithOptions:withCompletion:", v8, v9);

  }
  else
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }

}

- (SBSLockScreenService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

void __48__WFCompactUnlockService_requestUnlockIfNeeded___block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__WFCompactUnlockService_requestUnlockIfNeeded___block_invoke_2;
  v3[3] = &unk_1E7AF4718;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __48__WFCompactUnlockService_requestUnlockIfNeeded___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

+ (BOOL)isDeviceLocked
{
  return MKBGetDeviceLockState() - 1 < 2;
}

@end
