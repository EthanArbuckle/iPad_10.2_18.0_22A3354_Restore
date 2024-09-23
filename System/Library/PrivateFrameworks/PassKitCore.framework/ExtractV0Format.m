@implementation ExtractV0Format

void __ExtractV0Format_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _BYTE *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = a3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v9)
  {

    goto LABEL_17;
  }
  v10 = v9;
  v24 = a4;
  v25 = v7;
  v11 = *(_QWORD *)v27;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v27 != v11)
        objc_enumerationMutation(v8);
      +[PKPassAutomaticSelectionCriterion expressModeForCriterion:](PKPassAutomaticSelectionCriterion, "expressModeForCriterion:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i), v24);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (!v13)
        goto LABEL_10;
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v16 = *(void **)(v15 + 40);
      if (!v16)
      {
        v19 = 0;
        *(_QWORD *)(v15 + 40) = v13;
LABEL_16:

        v7 = v25;
        objc_msgSend(v25, "firstObject");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v23 = *(void **)(v22 + 40);
        *(_QWORD *)(v22 + 40) = v21;

        *v24 = 1;
        goto LABEL_17;
      }
      v17 = v16;
      v18 = v14;
      v19 = v18;
      if (v17 == v18)
      {

        goto LABEL_16;
      }
      v20 = objc_msgSend(v17, "isEqualToString:", v18);

      if ((v20 & 1) != 0)
        goto LABEL_16;
LABEL_10:

    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v10)
      continue;
    break;
  }

  v7 = v25;
LABEL_17:

}

@end
