@implementation RBSHereditaryGrant

- (void)_withEndowmentFromContext:(void *)a3 block:
{
  id v5;
  void (**v6)(id, void *, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = (void *)MEMORY[0x22074BD78]();
    objc_msgSend(a1, "encodedEndowment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(a1, "endowmentNamespace");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "availableInheritances");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "allNamespaces");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", v10);

      if (v13)
      {
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(a1, "sourceEnvironment");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "inheritancesForEnvironment:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = (void *)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v8)
        {
          v22 = v11;
          v23 = v7;
          v24 = v5;
          v16 = *(_QWORD *)v26;
          while (2)
          {
            for (i = 0; i != v8; i = (char *)i + 1)
            {
              if (*(_QWORD *)v26 != v16)
                objc_enumerationMutation(v15);
              v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
              objc_msgSend(v18, "endowmentNamespace");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "isEqual:", v10);

              if (v20)
              {
                objc_msgSend(v18, "encodedEndowment");
                v8 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "originatingIdentifier");
                v21 = objc_claimAutoreleasedReturnValue();

                v9 = (void *)v21;
                goto LABEL_15;
              }
            }
            v8 = (void *)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
            if (v8)
              continue;
            break;
          }
LABEL_15:
          v7 = v23;
          v5 = v24;
          v11 = v22;
        }

      }
      else
      {
        v8 = 0;
      }

    }
    v6[2](v6, v8, v9);

    objc_autoreleasePoolPop(v7);
  }

}

void __91__RBSHereditaryGrant_RBProcessState__applyToAssertionTransientState_attributePath_context___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "attributes", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "applyToAssertionTransientState:attributePath:context:", *(_QWORD *)(a1 + 40), RBSAttributePathIncrement(*(_QWORD *)(a1 + 56), v6 + i), *(_QWORD *)(a1 + 48));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        v6 += i;
      }
      while (v5);
    }

  }
}

void __80__RBSHereditaryGrant_RBProcessState__applyToProcessState_attributePath_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BE80BC8]);
    objc_msgSend(*(id *)(a1 + 32), "endowmentNamespace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "target");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "environment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "assertionID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v4, "_initWithNamespace:environment:encodedEndowment:originatingIdentifier:attributePath:", v5, v7, v3, v8, *(_QWORD *)(a1 + 56));

    objc_msgSend(*(id *)(a1 + 48), "addInheritance:", v9);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "attributes", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "applyToProcessState:attributePath:context:", *(_QWORD *)(a1 + 48), RBSAttributePathIncrement(*(_QWORD *)(a1 + 56), v13 + i), *(_QWORD *)(a1 + 40));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        v13 += i;
      }
      while (v12);
    }

  }
}

void __93__RBSHereditaryGrant_RBProcessState__applyToAssertionIntransientState_attributePath_context___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "attributes", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "applyToAssertionIntransientState:attributePath:context:", *(_QWORD *)(a1 + 40), RBSAttributePathIncrement(*(_QWORD *)(a1 + 56), v6 + i), *(_QWORD *)(a1 + 48));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        v6 += i;
      }
      while (v5);
    }

  }
}

void __69__RBSHereditaryGrant_RBProcessState__effectiveAttributesWithContext___block_invoke(id *a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  if (a2)
  {
    objc_msgSend(a1[4], "attributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __69__RBSHereditaryGrant_RBProcessState__effectiveAttributesWithContext___block_invoke_2;
    v4[3] = &unk_24DD46FB8;
    v5 = a1[5];
    v6 = a1[6];
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

  }
}

void __69__RBSHereditaryGrant_RBProcessState__effectiveAttributesWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "effectiveAttributesWithContext:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", v3);

}

@end
