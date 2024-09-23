@implementation TPSFamilyCircleValidation

void __59__TPSFamilyCircleValidation_getCurrentStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  objc_msgSend(a2, "members");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") != 0;

  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v5);

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

}

void __52__TPSFamilyCircleValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  LODWORD(a2) = objc_msgSend(a2, "BOOLValue");
  v6 = a2 ^ objc_msgSend(*(id *)(a1 + 32), "BOOLValue") ^ 1;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "targetContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138413058;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    v14 = 1024;
    v15 = v6;
    v16 = 2112;
    v17 = v5;
    _os_log_debug_impl(&dword_1DAC2F000, v7, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d. Error: %@", (uint8_t *)&v10, 0x26u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)validateWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__TPSFamilyCircleValidation_validateWithCompletion___block_invoke;
  v6[3] = &unk_1EA1DF4E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[TPSFamilyCircleValidation getCurrentStateWithCompletion:](self, "getCurrentStateWithCompletion:", v6);

}

- (void)getCurrentStateWithCompletion:(id)a3
{
  void (**v3)(id, _QWORD, void *);
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(id, _QWORD, void *);
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = (void (**)(id, _QWORD, void *))a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = objc_alloc_init(MEMORY[0x1E0D20EB0]);
  v4 = (void *)v12[5];
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, MEMORY[0x1E0C9AAA0], v5);

    v4 = (void *)v12[5];
  }
  objc_msgSend(v4, "setCachePolicy:", 0);
  v6 = (void *)v12[5];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__TPSFamilyCircleValidation_getCurrentStateWithCompletion___block_invoke;
  v8[3] = &unk_1EA1DF788;
  v7 = v3;
  v9 = v7;
  v10 = &v11;
  objc_msgSend(v6, "startRequestWithCompletionHandler:", v8);

  _Block_object_dispose(&v11, 8);
}

@end
