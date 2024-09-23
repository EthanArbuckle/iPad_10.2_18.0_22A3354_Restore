@implementation WFWorkflowGetAvailableVariableNamesAndDetails

void __WFWorkflowGetAvailableVariableNamesAndDetails_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 1);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v7);
  }
  objc_msgSend(v6, "addObject:", v5);

}

void __WFWorkflowGetAvailableVariableNamesAndDetails_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") < 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v9);
      v7 = *(void **)(a1 + 40);
      v8 = v9;
    }
    else
    {
      v7 = v6;
      v8 = v5;
    }
    objc_msgSend(v7, "removeObject:", v8);

  }
}

void __WFWorkflowGetAvailableVariableNamesAndDetails_block_invoke_3(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = v7;
  if (*(_QWORD *)(a1 + 88) > a3 || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    if (*(id *)(a1 + 32) != v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v8;
        if (objc_msgSend(v9, "mode"))
        {
          if (objc_msgSend(v9, "mode") == 2)
          {
            v10 = *(void **)(a1 + 56);
            if (v10)
            {
              objc_msgSend(*(id *)(a1 + 40), "lastObject");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setObject:forKey:", v9, v11);

            }
            if (*(_QWORD *)(a1 + 88) >= a3 && *(_BYTE *)(a1 + 96))
            {
              v12 = *(_QWORD *)(a1 + 72);
              objc_msgSend(v9, "indexVariableNameWithScopeLevel:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v13, v9);

              v14 = *(_QWORD *)(a1 + 72);
              objc_msgSend(v9, "itemVariableNameWithScopeLevel:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              (*(void (**)(uint64_t, void *, id))(v14 + 16))(v14, v15, v9);

            }
            --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
            objc_msgSend(*(id *)(a1 + 40), "removeLastObject");
          }
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
          objc_msgSend(v9, "indexVariableNameWithScopeLevel:", ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "itemVariableNameWithScopeLevel:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
          if (v21)
            (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
          v22 = *(void **)(a1 + 48);
          if (v22)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "groupingIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKey:", v23, v24);

          }
        }
      }
      else
      {
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v8, "providedVariableNames", 0);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v26 != v18)
                objc_enumerationMutation(v9);
              (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
            }
            v17 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          }
          while (v17);
        }
      }

    }
  }
  else
  {
    *a4 = 1;
  }

}

@end
