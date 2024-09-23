@implementation TPSFamilyChildValidation

- (void)validateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__14;
  v14 = __Block_byref_object_dispose__14;
  v15 = objc_alloc_init(MEMORY[0x1E0D20EB0]);
  objc_msgSend((id)v11[5], "setCachePolicy:", 0);
  v5 = (void *)v11[5];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__TPSFamilyChildValidation_validateWithCompletion___block_invoke;
  v7[3] = &unk_1EA1E1028;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  v9 = &v10;
  objc_msgSend(v5, "startRequestWithCompletionHandler:", v7);

  _Block_object_dispose(&v10, 8);
}

void __51__TPSFamilyChildValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  void *v8;
  NSObject *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "members");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __51__TPSFamilyChildValidation_validateWithCompletion___block_invoke_cold_1();

    if (objc_msgSend(*(id *)(a1 + 32), "BOOLValue"))
      v10 = objc_msgSend(v8, "na_any:", &__block_literal_global_8);
    else
      v10 = objc_msgSend(v8, "na_all:", &__block_literal_global_3_0);
    v7 = v10;

  }
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "targetContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138413058;
    v17 = v14;
    v18 = 2112;
    v19 = v15;
    v20 = 1024;
    v21 = v7;
    v22 = 2112;
    v23 = v6;
    _os_log_debug_impl(&dword_1DAC2F000, v11, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Valid: %d. Error: %@", (uint8_t *)&v16, 0x26u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;

}

BOOL __51__TPSFamilyChildValidation_validateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = (objc_msgSend(v2, "isMe") & 1) == 0 && objc_msgSend(v2, "memberType") == 2;

  return v3;
}

{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = (objc_msgSend(v2, "isMe") & 1) != 0 || objc_msgSend(v2, "memberType") != 2;

  return v3;
}

- (void)getCurrentStateWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__14;
  v13 = __Block_byref_object_dispose__14;
  v14 = objc_alloc_init(MEMORY[0x1E0D20EB0]);
  objc_msgSend((id)v10[5], "setCachePolicy:", 0);
  v4 = (void *)v10[5];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__TPSFamilyChildValidation_getCurrentStateWithCompletion___block_invoke;
  v6[3] = &unk_1EA1DF788;
  v5 = v3;
  v7 = v5;
  v8 = &v9;
  objc_msgSend(v4, "startRequestWithCompletionHandler:", v6);

  _Block_object_dispose(&v9, 8);
}

void __58__TPSFamilyChildValidation_getCurrentStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "members");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __51__TPSFamilyChildValidation_validateWithCompletion___block_invoke_cold_1();

    v7 = objc_msgSend(v8, "na_any:", &__block_literal_global_6);
  }
  v10 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;

}

BOOL __58__TPSFamilyChildValidation_getCurrentStateWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = (objc_msgSend(v2, "isMe") & 1) == 0 && objc_msgSend(v2, "memberType") == 2;

  return v3;
}

void __51__TPSFamilyChildValidation_validateWithCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_7(&dword_1DAC2F000, v0, v1, "Family members received: %@ in circle: %@");
}

@end
