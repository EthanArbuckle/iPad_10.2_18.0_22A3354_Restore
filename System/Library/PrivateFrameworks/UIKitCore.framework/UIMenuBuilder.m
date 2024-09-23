@implementation UIMenuBuilder

id __60___UIMenuBuilder_insertSiblingMenu_beforeMenuForIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "children");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60___UIMenuBuilder_insertSiblingMenu_beforeMenuForIdentifier___block_invoke_2;
  v8[3] = &unk_1E16DEB18;
  v9 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", v8);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), CFSTR("UIMenuBuilder.m"), 511, CFSTR("menu not found in parent"));

  }
  objc_msgSend(v3, "insertObject:atIndex:", *(_QWORD *)(a1 + 56), v4);
  objc_msgSend(*(id *)(a1 + 32), "menuByReplacingChildren:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __60___UIMenuBuilder_insertSiblingMenu_beforeMenuForIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60___UIMenuBuilder_insertSiblingMenu_beforeMenuForIdentifier___block_invoke_3;
  v5[3] = &unk_1E16DEAD0;
  v6 = *(id *)(a1 + 32);
  v3 = objc_msgSend(a2, "_acceptBoolMenuVisit:leafVisit:", v5, &__block_literal_global_449);

  return v3;
}

uint64_t __60___UIMenuBuilder_insertSiblingMenu_beforeMenuForIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __60___UIMenuBuilder_insertSiblingMenu_beforeMenuForIdentifier___block_invoke_4()
{
  return 0;
}

id __59___UIMenuBuilder_insertSiblingMenu_afterMenuForIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "children");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59___UIMenuBuilder_insertSiblingMenu_afterMenuForIdentifier___block_invoke_2;
  v8[3] = &unk_1E16DEB18;
  v9 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", v8);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), CFSTR("UIMenuBuilder.m"), 537, CFSTR("menu not found in parent"));

  }
  objc_msgSend(v3, "insertObject:atIndex:", *(_QWORD *)(a1 + 56), v4 + 1);
  objc_msgSend(*(id *)(a1 + 32), "menuByReplacingChildren:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __59___UIMenuBuilder_insertSiblingMenu_afterMenuForIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59___UIMenuBuilder_insertSiblingMenu_afterMenuForIdentifier___block_invoke_3;
  v5[3] = &unk_1E16DEAD0;
  v6 = *(id *)(a1 + 32);
  v3 = objc_msgSend(a2, "_acceptBoolMenuVisit:leafVisit:", v5, &__block_literal_global_32);

  return v3;
}

uint64_t __59___UIMenuBuilder_insertSiblingMenu_afterMenuForIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __59___UIMenuBuilder_insertSiblingMenu_afterMenuForIdentifier___block_invoke_4()
{
  return 0;
}

id __61___UIMenuBuilder_insertChildMenu_atStartOfMenuForIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "children");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "insertObject:atIndex:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 32), "menuByReplacingChildren:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __59___UIMenuBuilder_insertChildMenu_atEndOfMenuForIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObject:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menuByReplacingChildren:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v18 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(*(id *)(a1 + 32), "_parentOfMenuForIdentifier:commandForIdentifier:", v18, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (v18)
      v16 = v18;
    else
      v16 = v11;
    objc_msgSend(*(id *)(a1 + 40), "insertBeforeElements:afterElements:aroundElement:inMenu:", v13, v14, v16, v15);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_firstValidMenuWithinIdentifiers:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(*(id *)(a1 + 40), "insertFallbackBeforeElements:fallbackAfterElements:inMenu:", v13, v14, v17);

  }
}

void __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "menuForIdentifier:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(*(id *)(a1 + 40), "insertAtStartElements:atEndElements:inMenu:", v7, v8, v10);

}

void __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_parentOfMenuForIdentifier:commandForIdentifier:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "deleteItem:inMenu:", v4, v3);

}

void __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "menuForIdentifier:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "deleteMenu:", v4);

}

void __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "anchor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fallbacks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertsBefore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertsAfter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, _QWORD, id, void *, void *, void *))(v2 + 16))(v2, 0, v7, v4, v5, v6);
}

void __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "anchor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "anchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fallbacks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertsBefore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertsAfter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD, void *, void *, void *))(v3 + 16))(v3, v5, 0, v6, v7, v8);

  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "anchor");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertsAtStart");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertsAtEnd");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *, void *))(v9 + 16))(v9, v12, v10, v11);
}

void __48___UIMenuBuilder_Patch___internalDiffForDiffv1___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "anchor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

id __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v12;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v13[0] = v8;
        v13[1] = 3221225472;
        v13[2] = __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke_3;
        v13[3] = &unk_1E16E0200;
        v14 = *(id *)(a1 + 32);
        if (objc_msgSend(v10, "_acceptBoolMenuVisit:commandVisit:actionVisit:", &__block_literal_global_474, v13, 0))objc_msgSend(v12, "addObject:", v10);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v12;
}

uint64_t __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke_2()
{
  return 1;
}

uint64_t __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "_identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

id __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  BOOL v26;
  void *v27;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  uint64_t *v40;
  _QWORD v41[4];
  id v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(a1 + 32), "atStartElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "atStartElements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v7);

  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v3;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v51;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v51 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v11);
        v44 = 0;
        v45 = &v44;
        v46 = 0x3032000000;
        v47 = __Block_byref_object_copy__172;
        v48 = __Block_byref_object_dispose__172;
        v49 = 0;
        v41[0] = v10;
        v41[1] = 3221225472;
        v41[2] = __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke_12;
        v41[3] = &unk_1E16E0228;
        v43 = &v44;
        v42 = *(id *)(a1 + 32);
        v38[0] = v10;
        v38[1] = 3221225472;
        v38[2] = __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke_2_14;
        v38[3] = &unk_1E16E0250;
        v40 = &v44;
        v39 = *(id *)(a1 + 32);
        objc_msgSend(v12, "_acceptMenuVisit:commandVisit:actionVisit:deferredElementVisit:", v41, v38, 0, 0);
        v13 = (void *)v45[5];
        if (v13)
        {
          objc_msgSend(v13, "beforeElements");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v14);

        }
        objc_msgSend(v4, "addObject:", v12);
        v15 = (void *)v45[5];
        if (v15)
        {
          objc_msgSend(v15, "afterElements");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v16);

        }
        _Block_object_dispose(&v44, 8);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    }
    while (v8);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "fallbackBeforeElements");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v55, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v35;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v35 != v19)
          objc_enumerationMutation(v17);
        objc_msgSend(v4, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v20++));
      }
      while (v18 != v20);
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v55, 16);
    }
    while (v18);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "fallbackAfterElements");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v54, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v31;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(v21);
        objc_msgSend(v4, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v24++));
      }
      while (v22 != v24);
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v54, 16);
    }
    while (v22);
  }

  objc_msgSend(*(id *)(a1 + 32), "atEndElements");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count") == 0;

  if (!v26)
  {
    objc_msgSend(*(id *)(a1 + 32), "atEndElements");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v27);

  }
  return v4;
}

void __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke_12(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "childInserts");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke_2_14(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "childInserts");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

id __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke_3_16(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id obj;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v24;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v8);
        v17 = 0;
        v18 = &v17;
        v19 = 0x3032000000;
        v20 = __Block_byref_object_copy__172;
        v21 = __Block_byref_object_dispose__172;
        v22 = 0;
        v14[0] = v7;
        v14[1] = 3221225472;
        v14[2] = __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke_4_17;
        v14[3] = &unk_1E16E0250;
        v16 = &v17;
        v15 = *(id *)(a1 + 32);
        objc_msgSend(v9, "_acceptMenuVisit:commandVisit:actionVisit:deferredElementVisit:", 0, v14, 0, 0);
        v10 = (void *)v18[5];
        if (v10)
        {
          objc_msgSend(v10, "replacementElements");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v11);

        }
        else
        {
          objc_msgSend(v4, "addObject:", v9);
        }

        _Block_object_dispose(&v17, 8);
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }

  return v4;
}

void __44___UIMenuBuilder_Patch___patchInternalDiff___block_invoke_4_17(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "childReplacements");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

@end
