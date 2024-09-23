@implementation TPSStewieStatusValidation

- (void)validateWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__TPSStewieStatusValidation_validateWithCompletion___block_invoke;
  v6[3] = &unk_1EA1DF4E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[TPSStewieStatusValidation getCurrentStateWithCompletion:](self, "getCurrentStateWithCompletion:", v6);

}

void __52__TPSStewieStatusValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v10;
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = (void (**)(id, void *, id))a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v4 = (void *)getCoreTelephonyClientClass_softClass_0;
  v16 = getCoreTelephonyClientClass_softClass_0;
  if (!getCoreTelephonyClientClass_softClass_0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getCoreTelephonyClientClass_block_invoke_0;
    v12[3] = &unk_1EA1DF510;
    v12[4] = &v13;
    __getCoreTelephonyClientClass_block_invoke_0((uint64_t)v12);
    v4 = (void *)v14[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v13, 8);
  v6 = [v5 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithQueue:", MEMORY[0x1E0C80D38]);
  v11 = 0;
  objc_msgSend(v7, "getStewieSupport:", &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "status"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v10, v9);

}

@end
