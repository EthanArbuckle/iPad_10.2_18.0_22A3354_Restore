@implementation WFBackgroundShortcutRunnerMakeContextualActionsResult

void __WFBackgroundShortcutRunnerMakeContextualActionsResult_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  char v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(a1 + 64)
    && (v7 = objc_msgSend(v5, "numberOfItems"), v7 != objc_msgSend(*(id *)(a1 + 32), "numberOfItems")))
  {
    getWFXPCRunnerLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "WFBackgroundShortcutRunnerMakeContextualActionsResult_block_invoke";
      _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_FAULT, "%s Number of items in output don't match number of items in input -- can't overwrite", buf, 0xCu);
    }

    v14 = objc_alloc(MEMORY[0x1E0DC7E18]);
    v15 = *(_QWORD *)(a1 + 32);
    WFBackgroundShortcutRunnerError(8, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v14, "initWithOutput:files:runError:reversalState:", v15, 0, v16, 0);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __WFBackgroundShortcutRunnerMakeContextualActionsResult_block_invoke_124;
    v21[3] = &unk_1E7AF0EB0;
    v24 = *(_BYTE *)(a1 + 64);
    v10 = v5;
    v11 = *(_QWORD *)(a1 + 56);
    v22 = v10;
    v23 = v11;
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __WFBackgroundShortcutRunnerMakeContextualActionsResult_block_invoke_3;
    v17[3] = &unk_1E7AF7FC8;
    v18 = *(id *)(a1 + 32);
    v19 = *(id *)(a1 + 40);
    v20 = *(id *)(a1 + 48);
    objc_msgSend(v8, "if_mapAsynchronously:completionHandler:", v21, v17);

    v12 = v22;
  }

}

void __WFBackgroundShortcutRunnerMakeContextualActionsResult_block_invoke_124(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v7 = a2;
  v8 = a4;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __WFBackgroundShortcutRunnerMakeContextualActionsResult_block_invoke_2;
    v13[3] = &unk_1E7AF0E88;
    v11 = v8;
    v12 = *(_QWORD *)(a1 + 40);
    v15 = v11;
    v16 = v12;
    v14 = v7;
    objc_msgSend(v10, "getFileRepresentation:forType:", v13, 0);

  }
  else
  {
    WFGenerateContextualActionFile(*(_QWORD *)(a1 + 40), v7, 0, v8);
  }

}

void __WFBackgroundShortcutRunnerMakeContextualActionsResult_block_invoke_3(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = a2;
    getWFXPCRunnerLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v13 = 136315394;
      v14 = "WFBackgroundShortcutRunnerMakeContextualActionsResult_block_invoke_3";
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_FAULT, "%s Error mapping shortcut output into contextual action files: %@", (uint8_t *)&v13, 0x16u);
    }

    v8 = objc_alloc(MEMORY[0x1E0DC7E18]);
    v9 = a1[4];
    WFBackgroundShortcutRunnerError(8, v5);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithOutput:files:runError:reversalState:", v9, v6, v10, 0);

  }
  else
  {
    v12 = (objc_class *)MEMORY[0x1E0DC7E18];
    v10 = a2;
    v11 = (void *)objc_msgSend([v12 alloc], "initWithOutput:files:runError:reversalState:", a1[4], v10, 0, a1[5]);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __WFBackgroundShortcutRunnerMakeContextualActionsResult_block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
    WFGenerateContextualActionFile(*(_QWORD *)(a1 + 48), *(void **)(a1 + 32), a2, *(void **)(a1 + 40));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
