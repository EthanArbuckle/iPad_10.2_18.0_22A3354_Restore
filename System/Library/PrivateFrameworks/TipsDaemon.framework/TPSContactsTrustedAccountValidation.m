@implementation TPSContactsTrustedAccountValidation

- (void)validateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TPSContactsTrustedAccountValidation setCompletionHandler:](self, "setCompletionHandler:", v4);
  -[TPSTargetingValidation value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (-[TPSTargetingValidation value](self, "value"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        v5,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "primaryAuthKitAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSContactsTrustedAccountValidation setPrimaryAccount:](self, "setPrimaryAccount:", v9);

    -[TPSTargetingValidation value](self, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSContactsTrustedAccountValidation setDesiredValue:](self, "setDesiredValue:", objc_msgSend(v10, "TPSSafeBoolForKey:", CFSTR("value")));

    -[TPSTargetingValidation value](self, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "TPSSafeIntegerForKey:", CFSTR("accountType"));

    -[TPSTargetingValidation value](self, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "TPSSafeUIntegerForKey:", CFSTR("statusType"));

    v15 = -[TPSContactsTrustedAccountValidation _primaryAccountCanHaveTrustedAccountType:](self, "_primaryAccountCanHaveTrustedAccountType:", v12);
    if (v14 == 2)
    {
      objc_initWeak((id *)buf, self);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __62__TPSContactsTrustedAccountValidation_validateWithCompletion___block_invoke;
      v22[3] = &unk_1EA1E0230;
      objc_copyWeak(&v23, (id *)buf);
      -[TPSContactsTrustedAccountValidation _hasAssignmentForTrustedAccountType:completion:](self, "_hasAssignmentForTrustedAccountType:completion:", v12, v22);
      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
    }
    else if (v14 == 1)
    {
      -[TPSContactsTrustedAccountValidation reportCompletionWithResult:error:](self, "reportCompletionWithResult:error:", v15 ^ -[TPSContactsTrustedAccountValidation desiredValue](self, "desiredValue") ^ 1, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPSContactsTrustedAccountValidation reportCompletionWithResult:error:](self, "reportCompletionWithResult:error:", 0, v21);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      -[TPSTargetingValidation value](self, "value");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPSTargetingValidation value](self, "value");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v17;
      v26 = 2112;
      v27 = (id)objc_opt_class();
      v19 = v27;
      _os_log_impl(&dword_1DAC2F000, v16, OS_LOG_TYPE_INFO, "Unexpected value: %@ with class %@.", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSContactsTrustedAccountValidation reportCompletionWithResult:error:](self, "reportCompletionWithResult:error:", 0, v20);

  }
}

- (void)setPrimaryAccount:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAccount, a3);
}

- (void)setDesiredValue:(BOOL)a3
{
  self->_desiredValue = a3;
}

- (void)_hasAssignmentForTrustedAccountType:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void (**v8)(id, _QWORD, void *);

  v6 = (void (**)(id, _QWORD, void *))a4;
  v8 = v6;
  if (a3 == 2)
  {
    -[TPSContactsTrustedAccountValidation validateCustodianAssignmentWithCompletion:](self, "validateCustodianAssignmentWithCompletion:", v6);
  }
  else if (a3 == 1)
  {
    -[TPSContactsTrustedAccountValidation validateBeneficiaryAssignmentWithCompletion:](self, "validateBeneficiaryAssignmentWithCompletion:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v7);

  }
}

void __83__TPSContactsTrustedAccountValidation_validateBeneficiaryAssignmentWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __83__TPSContactsTrustedAccountValidation_validateBeneficiaryAssignmentWithCompletion___block_invoke_cold_1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), (objc_msgSend(v5, "count") == 0) ^ objc_msgSend(WeakRetained, "desiredValue"), 0);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = 0;

  }
}

- (BOOL)desiredValue
{
  return self->_desiredValue;
}

void __81__TPSContactsTrustedAccountValidation_validateCustodianAssignmentWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __81__TPSContactsTrustedAccountValidation_validateCustodianAssignmentWithCompletion___block_invoke_cold_1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), (objc_msgSend(v5, "count") == 0) ^ objc_msgSend(WeakRetained, "desiredValue"), 0);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = 0;

  }
}

void __81__TPSContactsTrustedAccountValidation_validateCustodianAssignmentWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DAC2F000, a2, a3, "Error fetching trusted contacts status: %@", a5, a6, a7, a8, 2u);
}

void __62__TPSContactsTrustedAccountValidation_validateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "reportCompletionWithResult:error:", a2, v5);

}

- (void)reportCompletionWithResult:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  NSObject *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0DBF3D0];
  v7 = a4;
  objc_msgSend(v6, "targeting");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[TPSDictationLanguageValidation validateWithCompletion:].cold.1(self, v4, v8);

  -[TPSContactsTrustedAccountValidation completionHandler](self, "completionHandler");
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _BOOL8, id))v9)[2](v9, v4, v7);

  -[TPSContactsTrustedAccountValidation setCompletionHandler:](self, "setCompletionHandler:", 0);
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_primaryAccount, 0);
}

- (void)validateCustodianAssignmentWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  id v18;
  id location;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v25 = objc_alloc_init(MEMORY[0x1E0CFAC10]);
  if (v21[5])
  {
    objc_initWeak(&location, self);
    v5 = (void *)v21[5];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __81__TPSContactsTrustedAccountValidation_validateCustodianAssignmentWithCompletion___block_invoke;
    v15[3] = &unk_1EA1E0258;
    objc_copyWeak(&v18, &location);
    v16 = v4;
    v17 = &v20;
    objc_msgSend(v5, "fetchTrustedContactsWithCompletion:", v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[TPSContactsTrustedAccountValidation validateCustodianAssignmentWithCompletion:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 12, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v14);

  }
  _Block_object_dispose(&v20, 8);

}

- (void)validateBeneficiaryAssignmentWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  id v18;
  id location;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v25 = objc_alloc_init(MEMORY[0x1E0CFAC88]);
  if (v21[5])
  {
    objc_initWeak(&location, self);
    v5 = (void *)v21[5];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __83__TPSContactsTrustedAccountValidation_validateBeneficiaryAssignmentWithCompletion___block_invoke;
    v15[3] = &unk_1EA1E0258;
    objc_copyWeak(&v18, &location);
    v16 = v4;
    v17 = &v20;
    objc_msgSend(v5, "fetchBeneficiariesWithCompletion:", v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[TPSContactsTrustedAccountValidation validateBeneficiaryAssignmentWithCompletion:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 12, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v14);

  }
  _Block_object_dispose(&v20, 8);

}

- (BOOL)_primaryAccountCanHaveTrustedAccountType:(unint64_t)a3
{
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSContactsTrustedAccountValidation primaryAccount](self, "primaryAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "canHaveCustodianForAccount:", v5);
  }
  else
  {
    if (a3 != 1)
      return 0;
    objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSContactsTrustedAccountValidation primaryAccount](self, "primaryAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "canHaveBeneficiaryForAccount:", v5);
  }
  v7 = v6;

  return v7;
}

- (ACAccount)primaryAccount
{
  return self->_primaryAccount;
}

- (void)validateBeneficiaryAssignmentWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1DAC2F000, a1, a3, "Failed to allocate inheritance controller", a5, a6, a7, a8, 0);
}

void __83__TPSContactsTrustedAccountValidation_validateBeneficiaryAssignmentWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DAC2F000, a2, a3, "Error fetching custodian status: %@", a5, a6, a7, a8, 2u);
}

- (void)validateCustodianAssignmentWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1DAC2F000, a1, a3, "Failed to allocate custodian controller", a5, a6, a7, a8, 0);
}

@end
