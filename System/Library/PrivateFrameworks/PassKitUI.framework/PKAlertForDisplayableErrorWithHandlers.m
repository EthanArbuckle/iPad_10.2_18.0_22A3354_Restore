@implementation PKAlertForDisplayableErrorWithHandlers

uint64_t __PKAlertForDisplayableErrorWithHandlers_block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t result;
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D69DC8]);

  if (!v3)
    goto LABEL_7;
  if (objc_msgSend(*(id *)(a1 + 32), "code") == 6)
  {
    v4 = (void *)MEMORY[0x1E0D66A58];
    v5 = *MEMORY[0x1E0D69900];
    v25[0] = *MEMORY[0x1E0D698F8];
    v25[1] = v5;
    v25[2] = *MEMORY[0x1E0D69950];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0D68B18];
    v8 = *MEMORY[0x1E0D68F50];
    v23[0] = *MEMORY[0x1E0D68AA0];
    v23[1] = v8;
    v9 = *MEMORY[0x1E0D696B8];
    v24[0] = v7;
    v24[1] = v9;
    v23[2] = *MEMORY[0x1E0D68858];
    v24[2] = *MEMORY[0x1E0D68E58];
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = v24;
    v12 = v23;
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "code") != 9)
      goto LABEL_7;
    v4 = (void *)MEMORY[0x1E0D66A58];
    v13 = *MEMORY[0x1E0D69900];
    v22[0] = *MEMORY[0x1E0D698F8];
    v22[1] = v13;
    v22[2] = *MEMORY[0x1E0D69950];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0D68B18];
    v15 = *MEMORY[0x1E0D68F50];
    v20[0] = *MEMORY[0x1E0D68AA0];
    v20[1] = v15;
    v16 = *MEMORY[0x1E0D697D0];
    v21[0] = v14;
    v21[1] = v16;
    v20[2] = *MEMORY[0x1E0D68858];
    v21[2] = *MEMORY[0x1E0D68E58];
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = v21;
    v12 = v20;
  }
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subjects:sendEvent:", v6, v17);

LABEL_7:
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "openSensitiveURL:withOptions:", *(_QWORD *)(a1 + 40), 0);

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __PKAlertForDisplayableErrorWithHandlers_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __PKAlertForDisplayableErrorWithHandlers_block_invoke_3(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t result;
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D69DC8]);

  if (!v3)
    goto LABEL_7;
  if (objc_msgSend(*(id *)(a1 + 32), "code") == 6)
  {
    v4 = (void *)MEMORY[0x1E0D66A58];
    v5 = *MEMORY[0x1E0D69900];
    v24[0] = *MEMORY[0x1E0D698F8];
    v24[1] = v5;
    v24[2] = *MEMORY[0x1E0D69950];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0D68B18];
    v8 = *MEMORY[0x1E0D68F50];
    v22[0] = *MEMORY[0x1E0D68AA0];
    v22[1] = v8;
    v9 = *MEMORY[0x1E0D696B8];
    v23[0] = v7;
    v23[1] = v9;
    v22[2] = *MEMORY[0x1E0D68858];
    v23[2] = *MEMORY[0x1E0D688E8];
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = v23;
    v12 = v22;
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "code") != 9)
      goto LABEL_7;
    v4 = (void *)MEMORY[0x1E0D66A58];
    v13 = *MEMORY[0x1E0D69900];
    v21[0] = *MEMORY[0x1E0D698F8];
    v21[1] = v13;
    v21[2] = *MEMORY[0x1E0D69950];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0D68B18];
    v15 = *MEMORY[0x1E0D68F50];
    v19[0] = *MEMORY[0x1E0D68AA0];
    v19[1] = v15;
    v16 = *MEMORY[0x1E0D697D0];
    v20[0] = v14;
    v20[1] = v16;
    v19[2] = *MEMORY[0x1E0D68858];
    v20[2] = *MEMORY[0x1E0D688E8];
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = v20;
    v12 = v19;
  }
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subjects:sendEvent:", v6, v17);

LABEL_7:
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
