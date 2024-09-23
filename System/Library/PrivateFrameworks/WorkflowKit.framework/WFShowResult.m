@implementation WFShowResult

void __WFShowResult_block_invoke_2(void **a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    objc_msgSend(a2, "componentsJoinedByString:", CFSTR("\n"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC7DC0], "parseAnnotatedString:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    WFShowPreview(v5, a1[4], a1[5], a1[6]);
  }
}

void __WFShowResult_block_invoke_125(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D13EA8], "collectionWithItems:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WFShowPreview(0, v3, *(void **)(a1 + 32), *(void **)(a1 + 40));

}

void __WFShowResult_block_invoke_2_127(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13DE0], "alertWithPreferredStyle:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMessage:", v7);

    v8 = (void *)MEMORY[0x1E0D13DE8];
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __WFShowResult_block_invoke_3_130;
    v14 = &unk_1E7AF76F0;
    v9 = *(id *)(a1 + 40);
    v15 = 0;
    v16 = v9;
    objc_msgSend(v8, "okButtonWithHandler:", &v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addButton:", v10, v11, v12, v13, v14);

    objc_msgSend(*(id *)(a1 + 32), "presentAlert:", v6);
  }

}

uint64_t __WFShowResult_block_invoke_3_130(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __WFShowResult_block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void (**v6)(id, id, _QWORD);
  _QWORD v7[4];
  id v8;
  void (**v9)(id, id, _QWORD);

  v5 = a2;
  v6 = a4;
  if (WFContentItemIsAttachment(v5))
  {
    v6[2](v6, v5, 0);
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __WFShowResult_block_invoke_4;
    v7[3] = &unk_1E7AF4A10;
    v8 = v5;
    v9 = v6;
    objc_msgSend(v8, "getObjectRepresentation:forClass:", v7, objc_opt_class());

  }
}

void __WFShowResult_block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (a2)
  {
    v9 = *(_QWORD *)(a1 + 40);
    v10 = (void *)MEMORY[0x1E0D13EC0];
    objc_msgSend(MEMORY[0x1E0DC7DC0], "parseAnnotatedString:", a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "attributionSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "itemWithObject:named:attributionSet:", v12, v7, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v14, 0);

  }
  else
  {
    getWFActionsLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = 136315651;
      v18 = "WFShowResult_block_invoke_4";
      v19 = 2113;
      v20 = v16;
      v21 = 2113;
      v22 = v8;
      _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_ERROR, "%s Failed coercing %{private}@ to string: %{private}@. Falling back to treating item as an attachment", (uint8_t *)&v17, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __WFShowResult_block_invoke(uint64_t a1, void *a2)
{
  return WFContentItemIsAttachment(a2);
}

@end
