@implementation TPSMailAccountSetupValidation

- (void)validateWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__TPSMailAccountSetupValidation_validateWithCompletion___block_invoke;
  v6[3] = &unk_1EA1DF4E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[TPSMailAccountSetupValidation getCurrentStateWithCompletion:](self, "getCurrentStateWithCompletion:", v6);

}

void __56__TPSMailAccountSetupValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  NSObject *v7;

  v5 = a3;
  LODWORD(a2) = objc_msgSend(a2, "BOOLValue");
  v6 = a2 ^ objc_msgSend(*(id *)(a1 + 32), "BOOLValue") ^ 1;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __61__TPSTravelESimEligibilityValidation_validateWithCompletion___block_invoke_cold_1((id *)(a1 + 32), v6, v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)getCurrentStateWithCompletion:(id)a3
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithBool:", -[TPSMailAccountSetupValidation getCurrentState](self, "getCurrentState"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a3 + 2))(v6, v7, 0);

}

@end
