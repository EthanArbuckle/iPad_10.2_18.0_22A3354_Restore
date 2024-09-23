@implementation INFile

void __66__INFile_Workflow__coerceContentItems_toSupportedUTIs_completion___block_invoke_135(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems"))
  {
    objc_msgSend(v6, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__INFile_Workflow__coerceContentItems_toSupportedUTIs_completion___block_invoke_2_136;
    v9[3] = &unk_1E7AF7920;
    v11 = *(_QWORD *)(a1 + 48);
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v8, "if_mapAsynchronously:completionHandler:", v9, *(_QWORD *)(a1 + 40));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __66__INFile_Workflow__coerceContentItems_toSupportedUTIs_completion___block_invoke_2_136(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 40), "compatibleFileTypeForContentItem:availableTypes:", v6, *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    getWFIntentExecutionLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v6, "supportedTypes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v16 = "+[INFile(Workflow) coerceContentItems:toSupportedUTIs:completion:]_block_invoke_2";
      v17 = 2114;
      v18 = v6;
      v19 = 2114;
      v20 = v10;
      v21 = 2114;
      v22 = v11;
      _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_DEFAULT, "%s Unable to find matching type for content item: %{public}@. Requested types: %{public}@, Supported types: %{public}@", buf, 0x2Au);

    }
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__INFile_Workflow__coerceContentItems_toSupportedUTIs_completion___block_invoke_137;
  v13[3] = &unk_1E7AF78F8;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v6, "getFileRepresentation:forType:", v13, v8);

}

uint64_t __66__INFile_Workflow__coerceContentItems_toSupportedUTIs_completion___block_invoke_137(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __66__INFile_Workflow__coerceContentItems_toSupportedUTIs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D13ED0];
  v3 = a2;
  objc_msgSend(v2, "sharedRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentItemClassForType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __66__INFile_Workflow__coerceContentItems_toSupportedUTIs_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0DC7B30], "typeWithString:", a2);
}

void __127__INFile_Workflow__getINFileRepresentationsFromContent_byCoercingToSupportedUTIs_withParameterState_dynamicOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD v5[4];
  id v6;

  if (a2)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __127__INFile_Workflow__getINFileRepresentationsFromContent_byCoercingToSupportedUTIs_withParameterState_dynamicOptions_completion___block_invoke_2;
    v5[3] = &unk_1E7AF7850;
    v6 = *(id *)(a1 + 32);
    objc_msgSend(a2, "if_compactMap:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

id __127__INFile_Workflow__getINFileRepresentationsFromContent_byCoercingToSupportedUTIs_withParameterState_dynamicOptions_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  objc_msgSend(v7, "bookmarkData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CBD8A8];
  if (v9)
  {
    objc_msgSend(v7, "bookmarkData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "wf_fileWithFileRepresentation:bookmarkData:displayName:", v8, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v7, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "wf_fileWithFileRepresentation:displayName:", v8, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v8;
  }

  objc_setAssociatedObject(v13, sel_wf_fileWithFileRepresentation_displayName_, v8, (void *)1);
  return v13;
}

void __121__INFile_Workflow__wf_processParameterValue_parameterState_coerceToSupportedUTIs_array_dynamicOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v9)
  {
    v6 = *(unsigned __int8 *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      (*(void (**)(uint64_t))(v7 + 16))(v7);
    }
    else
    {
      objc_msgSend(v9, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);

    }
  }
  else
  {
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
  }

}

uint64_t __121__INFile_Workflow__wf_processParameterValue_parameterState_coerceToSupportedUTIs_array_dynamicOptions_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D13EC0], "itemWithFile:", a2);
}

@end
