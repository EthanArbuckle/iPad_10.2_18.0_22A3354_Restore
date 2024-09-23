@implementation WFContentPredicateForRowTemplateValue

id __WFContentPredicateForRowTemplateValue_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFActionsLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v10 = 136315394;
      v11 = "WFContentPredicateForRowTemplateValue_block_invoke";
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_FAULT, "%s Parameter to transform is not an NSDate object: %@", (uint8_t *)&v10, 0x16u);
    }

    goto LABEL_9;
  }
  if (!v3
    || (v4 = *(_QWORD *)(a1 + 40)) == 0
    || (objc_msgSend(*(id *)(a1 + 32), "components:fromDate:", v4, v3), (v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  v6 = (void *)v5;
  objc_msgSend(*(id *)(a1 + 32), "dateFromComponents:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v7;
}

uint64_t __WFContentPredicateForRowTemplateValue_block_invoke_2(id *a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[4];
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __WFContentPredicateForRowTemplateValue_block_invoke_3;
  v16[3] = &unk_1E7AF3710;
  v17 = a1[6];
  objc_msgSend(a2, "if_map:", v16);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(a1[4], "evaluateWithObject:", v9, (_QWORD)v12)
          && (objc_msgSend(a1[5], "evaluateWithObject:", v9) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

uint64_t __WFContentPredicateForRowTemplateValue_block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(a1 + 32);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99D68], "date", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v8) = objc_msgSend(v8, "isDate:inSameDayAsDate:", v9, v12);

        if ((v8 & 1) != 0)
        {
          v13 = 1;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v5)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

uint64_t __WFContentPredicateForRowTemplateValue_block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(a1 + 32);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v8) = objc_msgSend(v8, "evaluateWithObject:", v9, (_QWORD)v12);

        if ((v8 & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

uint64_t __WFContentPredicateForRowTemplateValue_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __WFContentPredicateForRowTemplateValue_block_invoke_122(uint64_t a1, void *a2)
{
  return a2;
}

@end
