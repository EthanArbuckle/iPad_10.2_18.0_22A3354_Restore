@implementation WFSearchActionsWithKeywords

void __WFSearchActionsWithKeywords_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  __CFString *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  __CFString *v39;
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (WFActionShouldBeIncludedInResults(v3, *(_QWORD *)(a1 + 32) != 0))
  {
    v50 = 0;
    v51 = &v50;
    v52 = 0x2020000000;
    v53 = 3;
    objc_msgSend(v3, "localizedName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayableAppDescriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "localizedDescriptionSummary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedKeywords");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" "));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = &stru_1E7AFA810;
    if (v7)
      v9 = (__CFString *)v7;
    v10 = v9;

    objc_msgSend(v3, "localizedCategory");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
    {
      v55[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "appDescriptor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v3, "appDescriptor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = (void *)MEMORY[0x1E0C9AA60];
      }

    }
    v44 = 0;
    v45 = &v44;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy_;
    v48 = __Block_byref_object_dispose_;
    v49 = 0;
    v18 = *(void **)(a1 + 40);
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __WFSearchActionsWithKeywords_block_invoke_173;
    v34[3] = &unk_1E7AEA400;
    v33 = v32;
    v35 = v33;
    v19 = *(id *)(a1 + 48);
    v43 = *(_QWORD *)(a1 + 64);
    v36 = v19;
    v41 = &v50;
    v20 = v13;
    v37 = v20;
    v42 = &v44;
    v21 = v5;
    v38 = v21;
    v22 = v10;
    v39 = v22;
    v23 = v30;
    v40 = v23;
    objc_msgSend(v18, "indexesOfObjectsPassingTest:", v34);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");
    if (v25 != objc_msgSend(*(id *)(a1 + 40), "count"))
      goto LABEL_17;
    objc_msgSend(v3, "displayableAppDescriptor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bundleIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v27 = (void *)v45[5];
      if (!v27)
        v27 = v12;
      v28 = v27;
      objc_msgSend(*(id *)(a1 + 56), "addKey:withDisplayName:type:", v28, v28, v51[3]);
      objc_msgSend(*(id *)(a1 + 56), "addAction:forKey:type:", v3, v28, v51[3]);
    }
    else
    {
      if (!v31)
        goto LABEL_16;
      objc_msgSend(v3, "displayableAppDescriptor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "localizedName");
      v28 = (id)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        objc_msgSend(*(id *)(a1 + 56), "addKey:withDisplayName:type:", v31, v28, v51[3]);
        objc_msgSend(*(id *)(a1 + 56), "addAction:forKey:type:", v3, v31, v51[3]);
      }
    }

LABEL_16:
LABEL_17:

    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(&v50, 8);
  }

}

uint64_t __WFSearchActionsWithKeywords_block_invoke_173(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(v3, "length"))
  {
LABEL_27:
    v14 = 1;
    goto LABEL_28;
  }
  v4 = objc_msgSend(*(id *)(a1 + 32), "rangeOfString:options:", v3, 1);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = (v4
                                                                || objc_msgSend(*(id *)(a1 + 32), "rangeOfString:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 96) | 8))&& *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)+ 24) != 0;
    goto LABEL_27;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = *(id *)(a1 + 48);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v10, "rangeOfString:options:", v3, *(_QWORD *)(a1 + 96), (_QWORD)v18) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v15 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
          v16 = *(_QWORD *)(v15 + 24);
          if (v16 >= 3)
            v16 = 3;
          *(_QWORD *)(v15 + 24) = v16;
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), v10);

          goto LABEL_27;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
        continue;
      break;
    }
  }

  v11 = objc_msgSend(*(id *)(a1 + 56), "rangeOfString:options:", v3, *(_QWORD *)(a1 + 96));
  if (*(_QWORD *)(a1 + 56) && v11 != 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(*(id *)(a1 + 64), "rangeOfString:options:", v3, *(_QWORD *)(a1 + 96), (_QWORD)v18) != 0x7FFFFFFFFFFFFFFFLL)
  {
    goto LABEL_27;
  }
  v12 = objc_msgSend(*(id *)(a1 + 72), "rangeOfString:options:", v3, *(_QWORD *)(a1 + 96));
  if (*(_QWORD *)(a1 + 72))
    v13 = v12 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v13 = 1;
  v14 = !v13;
LABEL_28:

  return v14;
}

@end
