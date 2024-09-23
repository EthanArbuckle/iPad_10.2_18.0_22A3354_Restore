@implementation TPSFamilyOrganizerValidation

- (void)validateWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__TPSFamilyOrganizerValidation_validateWithCompletion___block_invoke;
  v6[3] = &unk_1EA1DF4E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[TPSFamilyOrganizerValidation getCurrentStateWithCompletion:](self, "getCurrentStateWithCompletion:", v6);

}

void __55__TPSFamilyOrganizerValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v12 = __Block_byref_object_copy__16;
  v13 = __Block_byref_object_dispose__16;
  v14 = objc_alloc_init(MEMORY[0x1E0D20EB0]);
  objc_msgSend((id)v10[5], "setCachePolicy:", 0);
  v4 = (void *)v10[5];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__TPSFamilyOrganizerValidation_getCurrentStateWithCompletion___block_invoke;
  v6[3] = &unk_1EA1DF788;
  v5 = v3;
  v7 = v5;
  v8 = &v9;
  objc_msgSend(v4, "startRequestWithCompletionHandler:", v6);

  _Block_object_dispose(&v9, 8);
}

void __62__TPSFamilyOrganizerValidation_getCurrentStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BOOL8 v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v5 = a2;
  v6 = a3;
  v7 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  if (!v6)
  {
    objc_msgSend(v5, "members", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __65__TPSFamilyChildAccountValidation_getCurrentStateWithCompletion___block_invoke_cold_2((uint64_t)v8, (uint64_t)v5, v9);

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __62__TPSFamilyOrganizerValidation_getCurrentStateWithCompletion___block_invoke_2;
    v14[3] = &unk_1EA1E13D0;
    v14[4] = &v15;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);

    v7 = *((_BYTE *)v16 + 24) != 0;
  }
  v10 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;

  _Block_object_dispose(&v15, 8);
}

void __62__TPSFamilyOrganizerValidation_getCurrentStateWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v6;
  id v7;

  v7 = a2;
  v6 = objc_msgSend(v7, "isMe");
  if (v6)
    LOBYTE(v6) = objc_msgSend(v7, "isOrganizer");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

}

@end
