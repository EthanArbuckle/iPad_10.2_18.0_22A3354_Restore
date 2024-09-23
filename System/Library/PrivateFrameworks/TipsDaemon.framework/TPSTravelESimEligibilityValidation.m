@implementation TPSTravelESimEligibilityValidation

- (void)validateWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__TPSTravelESimEligibilityValidation_validateWithCompletion___block_invoke;
  v6[3] = &unk_1EA1DF4E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[TPSTravelESimEligibilityValidation getCurrentStateWithCompletion:](self, "getCurrentStateWithCompletion:", v6);

}

void __61__TPSTravelESimEligibilityValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  void (**v3)(id, void *, id);
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = (void (**)(id, void *, id))a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v4 = (void *)getCoreTelephonyClientClass_softClass;
  v15 = getCoreTelephonyClientClass_softClass;
  if (!getCoreTelephonyClientClass_softClass)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getCoreTelephonyClientClass_block_invoke;
    v11[3] = &unk_1EA1DF510;
    v11[4] = &v12;
    __getCoreTelephonyClientClass_block_invoke((uint64_t)v11);
    v4 = (void *)v13[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v12, 8);
  v6 = [v5 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithQueue:", MEMORY[0x1E0C80D38]);
  v10 = 0;
  objc_msgSend(v7, "shouldShoweSIMTravelTip:", &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v10;
  v3[2](v3, v8, v9);

}

void __61__TPSTravelESimEligibilityValidation_validateWithCompletion___block_invoke_cold_1(id *a1, char a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "targetContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  v12 = 1024;
  v13 = a2 & 1;
  _os_log_debug_impl(&dword_1DAC2F000, a3, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d", (uint8_t *)&v8, 0x1Cu);

}

@end
