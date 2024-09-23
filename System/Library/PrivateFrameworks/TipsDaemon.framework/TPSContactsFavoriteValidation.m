@implementation TPSContactsFavoriteValidation

- (void)validateWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__TPSContactsFavoriteValidation_validateWithCompletion___block_invoke;
  v6[3] = &unk_1EA1DF4E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[TPSContactsFavoriteValidation getCurrentStateWithCompletion:](self, "getCurrentStateWithCompletion:", v6);

}

void __56__TPSContactsFavoriteValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)getCurrentStateWithCompletion:(id)a3
{
  void *v4;
  void (**v5)(id, _QWORD, void *);
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  id v12;

  v4 = (void *)MEMORY[0x1E0DBF348];
  v5 = (void (**)(id, _QWORD, void *))a3;
  if ((objc_msgSend(v4, "isGreenTeaDevice") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[TPSContactsMeCardValidation validateWithCompletion:].cold.2(self, v6);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 13, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0, v7);

  }
  else
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C97298]);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C972F8]), "initWithContactStore:", v12);
    objc_msgSend(v8, "entries");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count") != 0;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v5)[2](v5, v11, 0);

  }
}

@end
