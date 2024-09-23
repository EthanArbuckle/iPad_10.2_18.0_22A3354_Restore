@implementation UIPhysicalButtonConfigurationResolutionContext

void __89___UIPhysicalButtonConfigurationResolutionContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "activeMultilinePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89___UIPhysicalButtonConfigurationResolutionContext_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

void __89___UIPhysicalButtonConfigurationResolutionContext_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  int8x16_t v10;
  _QWORD v11[4];
  int8x16_t v12;

  v2 = *(void **)(a1 + 32);
  _UIPhysicalButtonSuccinctConfigurationsDescriptionForSet(*(_QWORD **)(*(_QWORD *)(a1 + 40) + 8));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("configurations"));

  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "count");
  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "activeMultilinePrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __89___UIPhysicalButtonConfigurationResolutionContext_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    v11[3] = &unk_1E16B1B50;
    v10 = *(int8x16_t *)(a1 + 32);
    v8 = (id)v10.i64[0];
    v12 = vextq_s8(v10, v10, 8uLL);
    objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("configurationToInteractionMap"), v7, v11);

  }
  else
  {
    v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", 0, CFSTR("configurationToInteractionMap"));
  }
}

void __89___UIPhysicalButtonConfigurationResolutionContext_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  uint64_t i;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  __CFString *v14;
  id v15;
  id obj;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v18)
  {
    v17 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = *(void **)(a1 + 40);
        if (v4)
        {
          v6 = (void *)MEMORY[0x1E0CB3940];
          v7 = (objc_class *)objc_opt_class();
          NSStringFromClass(v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p>"), v8, v4);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (v3)
            goto LABEL_8;
        }
        else
        {
          v9 = CFSTR("(nil)");
          if (v3)
          {
LABEL_8:
            v10 = (void *)MEMORY[0x1E0CB3940];
            v11 = v3;
            v12 = (objc_class *)objc_opt_class();
            NSStringFromClass(v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p>"), v13, v11);
            v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

            goto LABEL_11;
          }
        }
        v14 = CFSTR("(nil)");
LABEL_11:
        v15 = (id)objc_msgSend(v5, "appendObject:withName:", v9, v14);

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v18);
  }

}

@end
