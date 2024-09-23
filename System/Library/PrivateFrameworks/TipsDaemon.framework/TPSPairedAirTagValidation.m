@implementation TPSPairedAirTagValidation

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(id, _QWORD, void *);
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v4 = (void (**)(id, _QWORD, void *))a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7;
  v19 = __Block_byref_object_dispose__7;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v5 = (void *)getSPBeaconManagerClass_softClass;
  v25 = getSPBeaconManagerClass_softClass;
  v6 = MEMORY[0x1E0C809B0];
  if (!getSPBeaconManagerClass_softClass)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __getSPBeaconManagerClass_block_invoke;
    v21[3] = &unk_1EA1DF510;
    v21[4] = &v22;
    __getSPBeaconManagerClass_block_invoke((uint64_t)v21);
    v5 = (void *)v23[3];
  }
  v7 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v22, 8);
  v20 = objc_alloc_init(v7);
  v8 = (void *)v16[5];
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v9);

    v8 = (void *)v16[5];
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D89A68]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __52__TPSPairedAirTagValidation_validateWithCompletion___block_invoke;
  v12[3] = &unk_1EA1E0898;
  v12[4] = self;
  v11 = v4;
  v13 = v11;
  v14 = &v15;
  objc_msgSend(v8, "allBeaconsOfTypes:completion:", v10, v12);

  _Block_object_dispose(&v15, 8);
}

void __52__TPSPairedAirTagValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_msgSend(a2, "count");
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __52__TPSPairedAirTagValidation_validateWithCompletion___block_invoke_cold_1(a1, v3 != 0, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

}

void __52__TPSPairedAirTagValidation_validateWithCompletion___block_invoke_cold_1(uint64_t a1, char a2, NSObject *a3)
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
  objc_msgSend(*(id *)(a1 + 32), "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "targetContext");
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
