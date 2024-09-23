@implementation WFContentSelectionActionParameterDefinitions

void __WFContentSelectionActionParameterDefinitions_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  _QWORD v23[9];

  v23[8] = *MEMORY[0x1E0C80C00];
  v23[0] = CFSTR("Files");
  v23[1] = CFSTR("Text");
  v23[2] = CFSTR("Date");
  v23[3] = CFSTR("Photos");
  v23[4] = CFSTR("Contacts");
  v23[5] = CFSTR("Email Address");
  v23[6] = CFSTR("Music");
  v23[7] = CFSTR("Phone Number");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "if_map:", &__block_literal_global_209);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createActionsForSelectingContentOfTypes:serializedParameterArray:", v1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_opt_new();
    v5 = (void *)objc_opt_new();
    v6 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __WFContentSelectionActionParameterDefinitions_block_invoke_210;
    v16[3] = &unk_1E7AEC6A0;
    v7 = v4;
    v17 = v7;
    v18 = v1;
    v8 = v5;
    v19 = v8;
    v20 = v3;
    objc_msgSend(v0, "enumerateObjectsUsingBlock:", v16);
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __WFContentSelectionActionParameterDefinitions_block_invoke_2_212;
    v13[3] = &unk_1E7AEC718;
    v14 = v7;
    v15 = v8;
    v9 = v8;
    v10 = v7;
    objc_msgSend(v0, "if_flatMap:", v13);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)WFContentSelectionActionParameterDefinitions_parameterDefinitions;
    WFContentSelectionActionParameterDefinitions_parameterDefinitions = v11;

  }
  else
  {
    getWFActionsLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "WFContentSelectionActionParameterDefinitions_block_invoke";
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_FAULT, "%s Couldn't make content selection actions for all content types", buf, 0xCu);
    }
  }

}

void __WFContentSelectionActionParameterDefinitions_block_invoke_210(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", objc_msgSend(v5, "objectAtIndexedSubscript:", a3), v6);
  objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v7, v6);

}

id __WFContentSelectionActionParameterDefinitions_block_invoke_2_212(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t v27;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = (id)MEMORY[0x1E0C9AA60];
  if (v5)
    v8 = v4 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    objc_msgSend(v5, "definition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("Parameters"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    v12 = v11;

    objc_msgSend(v6, "inputParameterKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_opt_new();
    v15 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __WFContentSelectionActionParameterDefinitions_block_invoke_3;
    v24[3] = &unk_1E7AEC6C8;
    v25 = v13;
    v26 = v3;
    v27 = v4;
    v16 = v13;
    objc_msgSend(v12, "if_compactMap:", v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __WFContentSelectionActionParameterDefinitions_block_invoke_4;
    v22[3] = &unk_1E7AEDB50;
    v23 = v14;
    v18 = v14;
    objc_msgSend(v17, "if_map:", v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      v20 = v19;
    else
      v20 = v7;
    v7 = v20;

  }
  return v7;
}

id __WFContentSelectionActionParameterDefinitions_block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  WFParameterRelationResource *v8;
  void *v9;
  WFParameterRelationResource *v10;
  WFParameterRelationResource *v11;
  void *v12;
  WFParameterRelationResource *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[2];
  _QWORD v25[2];
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("Key"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (*(_QWORD *)(a1 + 32) && (objc_msgSend(v6, "isEqualToString:") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = [WFParameterRelationResource alloc];
    v27[0] = CFSTR("Ask For");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[WFParameterRelationResource initWithParameterKey:parameterValues:relation:](v8, "initWithParameterKey:parameterValues:relation:", CFSTR("WFNoInputBehavior"), v9, 0);

    v11 = [WFParameterRelationResource alloc];
    v26 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[WFParameterRelationResource initWithParameterKey:parameterValues:relation:](v11, "initWithParameterKey:parameterValues:relation:", CFSTR("WFAskForType"), v12, 0);

    objc_msgSend(v3, "objectForKey:", CFSTR("RequiredResources"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
    }
    else
    {
      v15 = 0;
    }
    v16 = v15;

    if (v16)
      v17 = v16;
    else
      v17 = (void *)MEMORY[0x1E0C9AA60];
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    WFSerializedResource(v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v19);

    WFSerializedResource(v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v20);

    v24[0] = CFSTR("RequiredResources");
    v24[1] = CFSTR("WFInputActionParameterContentSelectionItemClass");
    v25[0] = v18;
    NSStringFromClass(*(Class *)(a1 + 48));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "definitionByAddingEntriesInDictionary:", v22);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

id __WFContentSelectionActionParameterDefinitions_block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("RequiredResources"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __WFContentSelectionActionParameterDefinitions_block_invoke_5;
  v14 = &unk_1E7AEC6F0;
  v15 = *(id *)(a1 + 32);
  objc_msgSend(v6, "if_map:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = CFSTR("RequiredResources");
  v17[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1, v11, v12, v13, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "definitionByAddingEntriesInDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __WFContentSelectionActionParameterDefinitions_block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WFParameterKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("WFParameterKey"));
      v7 = (id)objc_msgSend(v4, "copy");
    }
    else
    {
      v7 = v3;
    }
    v8 = v7;

  }
  else
  {
    v8 = v3;
  }

  return v8;
}

id __WFContentSelectionActionParameterDefinitions_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  NSObject *v4;
  id v5;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = WFInputActionContentItemClassCorrespondingToAskForParameterValue(v2);
  if (!v3)
  {
    getWFActionsLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v7 = 136315394;
      v8 = "WFContentSelectionActionParameterDefinitions_block_invoke_2";
      v9 = 2112;
      v10 = v2;
      _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_FAULT, "%s Couldn't map content type to content item class: %@", (uint8_t *)&v7, 0x16u);
    }

  }
  v5 = v3;

  return v5;
}

@end
