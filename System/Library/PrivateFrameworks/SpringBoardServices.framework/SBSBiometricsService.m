@implementation SBSBiometricsService

- (void)_acquireBiometricAssertionOfType:(unsigned __int8)a3 assertionName:(id)a4 reason:(id)a5 completion:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  void (**v11)(id, SBSAssertion *);
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  SBSAssertion *v18;
  _OWORD v19[64];
  uint64_t v20;

  v8 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, SBSAssertion *))a6;
  v12 = objc_alloc_init(MEMORY[0x1E0D01798]);
  if (objc_msgSend(v12, "isUsable"))
  {
    memset(v19, 0, 512);
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@-%@"), v15, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "getCString:maxLength:encoding:", v19, 1024, 4)
      && (v17 = SBSSpringBoardServerPort(),
          !SBAddBiometricAssertion(v17, v19, objc_msgSend(v12, "port"), v8)))
    {
      v18 = -[SBSAssertion initWithAssertionName:reason:receiveRight:]([SBSAssertion alloc], "initWithAssertionName:reason:receiveRight:", v9, v16, v12);
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }
  v11[2](v11, v18);

}

- (void)acquireWalletPreArmSuppressionAssertionForReason:(id)a3 completion:(id)a4
{
  -[SBSBiometricsService _acquireBiometricAssertionOfType:assertionName:reason:completion:](self, "_acquireBiometricAssertionOfType:assertionName:reason:completion:", 1, CFSTR("WalletPreArmDisableAssertion"), a3, a4);
}

- (void)fetchUnlockCredentialSetWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    -[SBSAbstractFacilityService callbackQueue](self, "callbackQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSAbstractSystemService client](self, "client");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__SBSBiometricsService_fetchUnlockCredentialSetWithCompletion___block_invoke;
    v8[3] = &unk_1E288D3D0;
    v9 = v5;
    v10 = v4;
    v7 = v5;
    objc_msgSend(v6, "fetchUnlockCredentialSetWithCompletion:", v8);

  }
}

void __63__SBSBiometricsService_fetchUnlockCredentialSetWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__SBSBiometricsService_fetchUnlockCredentialSetWithCompletion___block_invoke_2;
  v7[3] = &unk_1E288D2E8;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __63__SBSBiometricsService_fetchUnlockCredentialSetWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)acquireUnlockSuppressionAssertionForReason:(id)a3 completion:(id)a4
{
  -[SBSBiometricsService _acquireBiometricAssertionOfType:assertionName:reason:completion:](self, "_acquireBiometricAssertionOfType:assertionName:reason:completion:", 0, CFSTR("BiometricUnlockSuppressionAssertion"), a3, a4);
}

@end
