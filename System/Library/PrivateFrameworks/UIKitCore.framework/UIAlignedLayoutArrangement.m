@implementation UIAlignedLayoutArrangement

uint64_t __44___UIAlignedLayoutArrangement_setAlignment___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAlignment:", *(_QWORD *)(a1 + 32));
}

void __66___UIAlignedLayoutArrangement__addIndividualConstraintsIfPossible__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "objectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nextObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v26 = v5;
    v28 = objc_msgSend(*(id *)(a1 + 32), "_attributeForConstraintGroupName:", v5);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v10 = *(id *)(a1 + 40);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v35;
      v27 = *(_QWORD *)v35;
      do
      {
        v14 = 0;
        v29 = v12;
        do
        {
          if (*(_QWORD *)v35 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v14);
          if (v15 == v9)
          {
            v32 = 0u;
            v33 = 0u;
            v30 = 0u;
            v31 = 0u;
            objc_msgSend(v6, "objectEnumerator");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            if (v18)
            {
              v19 = v18;
              v20 = v9;
              v21 = v6;
              v22 = a1;
              v23 = *(_QWORD *)v31;
              do
              {
                for (i = 0; i != v19; ++i)
                {
                  if (*(_QWORD *)v31 != v23)
                    objc_enumerationMutation(v17);
                  v25 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
                  if ((objc_msgSend(v25, "isActive") & 1) == 0)
                    objc_msgSend(v25, "setActive:", 1);
                }
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
              }
              while (v19);
              a1 = v22;
              v6 = v21;
              v9 = v20;
              v13 = v27;
              v12 = v29;
            }
          }
          else
          {
            objc_msgSend(v6, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v14));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if (v16)
            {
              if ((objc_msgSend(v16, "isActive") & 1) == 0)
                objc_msgSend(v17, "setActive:", 1);
            }
            else
            {
              objc_msgSend(*(id *)(a1 + 32), "_setUpConstraintForItem:referenceItem:attribute:inConstraintsTable:", v15, v9, v28, v6);
            }
          }

          ++v14;
        }
        while (v14 != v12);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v12);
    }

    v5 = v26;
  }

}

void __62___UIAlignedLayoutArrangement__addConstraintGroupsAsNecessary__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(*(id *)(a1 + 32), "_attributeForConstraintGroupName:", a2);
  if (objc_msgSend(v5, "count") || !objc_msgSend(*(id *)(a1 + 32), "_wantsConstraintsForAttribute:", v6))
    goto LABEL_34;
  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 - 11) > 1 || v7 == 0)
    goto LABEL_20;
  if ((objc_msgSend(v7, "_hasBaseline") & 1) == 0)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = *(id *)(a1 + 40);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (objc_msgSend(v15, "_hasBaseline")
            && objc_msgSend(*(id *)(a1 + 32), "_itemWantsLayoutAsIfVisible:", v15))
          {
            v16 = v15;

            v8 = v16;
            goto LABEL_19;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_19:

LABEL_20:
    if (!v8)
      goto LABEL_34;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v17 = *(id *)(a1 + 40);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        if (v8 != *(void **)(*((_QWORD *)&v23 + 1) + 8 * j) || (unint64_t)(v6 - 7) <= 1)
          objc_msgSend(*(id *)(a1 + 32), "_setUpConstraintForItem:referenceItem:attribute:inConstraintsTable:", (_QWORD)v23);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v19);
  }

LABEL_34:
}

void __62___UIAlignedLayoutArrangement__addConstraintGroupsAsNecessary__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_wantsConstraintsForAttribute:", objc_msgSend(*(id *)(a1 + 32), "_attributeForConstraintGroupName:")))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectForKey:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setObject:forKey:", v4, v5);

    }
  }

}

void __65___UIAlignedLayoutArrangement__removeConstraintGroupsAsNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v8 = v3;
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v3 = v8;
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(v4, "addObject:", v3);

}

void __65___UIAlignedLayoutArrangement__removeConstraintGroupsAsNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v7))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      goto LABEL_30;
    }
    if (*(_BYTE *)(a1 + 72) || *(_BYTE *)(a1 + 73))
    {
      objc_msgSend(*(id *)(a1 + 32), "items");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "indexOfObject:", v7);

      if (v9)
      {
        v25 = v6;
        v26 = v4;
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v10 = *(id *)(a1 + 48);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v32;
LABEL_9:
          v14 = 0;
          while (1)
          {
            if (*(_QWORD *)v32 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v14);
            if (objc_msgSend(v15, "_hasBaseline", v25, v26))
            {
              objc_msgSend(*(id *)(a1 + 32), "items");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "indexOfObject:", v15);

              if (v17 < v9)
                break;
            }
            if (v12 == ++v14)
            {
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
              if (v12)
                goto LABEL_9;
              goto LABEL_16;
            }
          }
        }
        else
        {
LABEL_16:

          v6 = v25;
          v4 = v26;
          if (!*(_BYTE *)(a1 + 73))
            goto LABEL_30;
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          v10 = *(id *)(a1 + 56);
          v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (!v18)
          {
LABEL_29:

            v6 = v25;
            v4 = v26;
            goto LABEL_30;
          }
          v19 = v18;
          v20 = *(_QWORD *)v28;
LABEL_19:
          v21 = 0;
          while (1)
          {
            if (*(_QWORD *)v28 != v20)
              objc_enumerationMutation(v10);
            v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v21);
            if (objc_msgSend(v22, "_hasBaseline", v25, v26, (_QWORD)v27))
            {
              if (objc_msgSend(*(id *)(a1 + 32), "_itemWantsLayoutAsIfVisible:", v22))
              {
                objc_msgSend(*(id *)(a1 + 32), "items");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v23, "indexOfObject:", v22);

                if (v24 < v9)
                  break;
              }
            }
            if (v19 == ++v21)
            {
              v19 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
              if (v19)
                goto LABEL_19;
              goto LABEL_29;
            }
          }
        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
        goto LABEL_29;
      }
    }
  }
LABEL_30:

}

void __70___UIAlignedLayoutArrangement__removeIndividualConstraintsAsNecessary__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "keyEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v11 = *(void **)(a1 + 40);
        objc_msgSend(v4, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v11) = objc_msgSend(v11, "containsObject:", v12);

        if ((_DWORD)v11)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectForKeyedSubscript:", v14);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          _UILACleanUpConstraintForItemInCollection(v10, v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

@end
