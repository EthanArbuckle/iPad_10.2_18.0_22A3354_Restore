@implementation NSError

void __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  +[SUCoreErrorInformation safeUserInfoValueClasses](SUCoreErrorInformation, "safeUserInfoValueClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_3;
  v12[3] = &unk_1E611C708;
  v10 = v8;
  v13 = v10;
  v11 = v9;
  v14 = v11;
  v15 = &v16;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v12);
  if (!*((_BYTE *)v17 + 24))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

  _Block_object_dispose(&v16, 8);
}

void __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  char isKindOfClass;

  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  char isKindOfClass;

  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  uint64_t v25;

  v7 = a2;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_2;
    v23[3] = &unk_1E611C730;
    v10 = *(_QWORD *)(a1 + 32);
    v24 = v9;
    v25 = v10;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v23);

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_4;
    v22[3] = &unk_1E611C758;
    v22[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v22);
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB3388]) & 1) != 0)
      goto LABEL_9;
LABEL_8:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_6;
    v21[3] = &unk_1E611C780;
    v21[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v21);
  }
  else
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    +[SUCoreErrorInformation safeUserInfoValueClasses](SUCoreErrorInformation, "safeUserInfoValueClasses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_8;
    v13[3] = &unk_1E611C708;
    v14 = v8;
    v12 = v11;
    v15 = v12;
    v16 = &v17;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v13);
    if (!*((_BYTE *)v18 + 24))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      *a4 = 1;
    }

    _Block_object_dispose(&v17, 8);
  }
LABEL_9:

}

void __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_4(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a2;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  +[SUCoreErrorInformation safeUserInfoValueClasses](SUCoreErrorInformation, "safeUserInfoValueClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_5;
  v9[3] = &unk_1E611C708;
  v7 = v5;
  v10 = v7;
  v8 = v6;
  v11 = v8;
  v12 = &v13;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);
  if (!*((_BYTE *)v14 + 24))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }

  _Block_object_dispose(&v13, 8);
}

void __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  char isKindOfClass;

  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_6(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v7 = a2;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    +[SUCoreErrorInformation safeUserInfoValueClasses](SUCoreErrorInformation, "safeUserInfoValueClasses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_7;
    v11[3] = &unk_1E611C708;
    v12 = v8;
    v10 = v9;
    v13 = v10;
    v14 = &v15;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);
    if (!*((_BYTE *)v16 + 24))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      *a4 = 1;
    }

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

}

void __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  char isKindOfClass;

  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
}

@end
