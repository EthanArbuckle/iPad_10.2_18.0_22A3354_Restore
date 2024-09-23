@implementation UIKeyWindowSceneStack

void __92___UIKeyWindowSceneStack__evaluateKeyWindowSceneInStackIgnoringOldKeyWindowScene_forReason___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  int v7;
  char v8;
  void *v9;
  BOOL v10;
  char v11;
  void *v12;
  char v13;

  if (qword_1ECD7CA00 != -1)
    dispatch_once(&qword_1ECD7CA00, &__block_literal_global_7);
  v7 = _MergedGlobals_929;
  if (a2)
  {
    v8 = objc_msgSend(*(id *)(a2 + 8), "_isConnecting");
    v9 = *(void **)(a2 + 8);
    if (v9)
    {
      if (!objc_msgSend(*(id *)(a2 + 8), "activationState"))
      {
LABEL_12:
        v12 = *(void **)(a2 + 8);
LABEL_13:
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v12);
        *a4 = 1;
        return;
      }
      v10 = objc_msgSend(v9, "activationState") == 1;
    }
    else
    {
      v10 = 0;
    }
    if (v7)
      v11 = 1;
    else
      v11 = v8;
    if ((v11 & 1) != 0 || v10)
      goto LABEL_12;
  }
  else
  {
    v13 = objc_msgSend(0, "_isConnecting");
    v12 = 0;
    if (v7 || (v13 & 1) != 0)
      goto LABEL_13;
  }
}

void __64___UIKeyWindowSceneStack_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  int8x16_t v8;
  _QWORD v9[4];
  int8x16_t v10;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(_BYTE *)(*(_QWORD *)(a1 + 40) + 32) & 1, CFSTR("affectsApplicationKeyWindow"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", (*(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 32) >> 1) & 1, CFSTR("hasViewServiceEntitlement"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "count"), CFSTR("windowSceneRecords.count"));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "activeMultilinePrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64___UIKeyWindowSceneStack_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    v9[3] = &unk_1E16B1B50;
    v8 = *(int8x16_t *)(a1 + 32);
    v7 = (id)v8.i64[0];
    v10 = vextq_s8(v8, v8, 8uLL);
    objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("orderedWindowSceneRecords"), v6, v9);

  }
}

void __64___UIKeyWindowSceneStack_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
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
  v6[2] = __64___UIKeyWindowSceneStack_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

void __64___UIKeyWindowSceneStack_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++), 0, (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

uint64_t __99___UIKeyWindowSceneStack__sortAndEvaluateKeyWindowSceneInStackIgnoringOldKeyWindowScene_forReason___block_invoke(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  char v20;
  char v22;
  unint64_t v23;
  unint64_t v24;
  char v25;

  if (a2)
  {
    v5 = a2[2];
    if (a3)
    {
LABEL_3:
      v6 = a3[2];
      goto LABEL_4;
    }
  }
  else
  {
    v5 = 0;
    if (a3)
      goto LABEL_3;
  }
  v6 = 0;
LABEL_4:
  v7 = *(_QWORD *)(a1 + 32);
  if (a2)
    v8 = (void *)a2[1];
  else
    v8 = 0;
  v25 = *(_BYTE *)(v7 + 32);
  v9 = objc_msgSend(v8, "_isTargetOfKeyboardEventDeferringEnvironment");
  if (a3)
    v10 = (void *)a3[1];
  else
    v10 = 0;
  v11 = objc_msgSend(v10, "_isTargetOfKeyboardEventDeferringEnvironment");
  if (a2)
    v12 = (void *)a2[1];
  else
    v12 = 0;
  objc_msgSend(v12, "session");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "role");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("UIWindowSceneSessionTypeCoverSheet"));

  if (a3)
    v16 = (void *)a3[1];
  else
    v16 = 0;
  objc_msgSend(v16, "session");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "role");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("UIWindowSceneSessionTypeCoverSheet"));

  if ((v15 | v19 ^ 1) != 1)
    return -1;
  if ((v15 ^ 1 | v19) != 1)
    return 1;
  if (v5 | v6 && ((v15 ^ 1 | v19 ^ 1) & 1) != 0)
  {
    if (v5 == 1 && v6 == 1)
    {
      if ((v9 ^ 1 | v11) == 1)
      {
        if ((v9 | v11 ^ 1) == 1)
          goto LABEL_35;
        return -1;
      }
      return 1;
    }
    if (v5 || v6 != 1)
    {
      if (v5 == 1 && !v6)
      {
        v22 = (v25 & 2) != 0 ? v9 : 1;
        if ((v22 & 1) != 0)
          return 1;
      }
    }
    else
    {
      if ((v25 & 2) != 0)
        v20 = v11;
      else
        v20 = 1;
      if ((v20 & 1) != 0)
        return -1;
    }
  }
LABEL_35:
  if (a3)
  {
    v23 = a3[3];
    if (a2)
    {
LABEL_37:
      v24 = a2[3];
      goto LABEL_38;
    }
  }
  else
  {
    v23 = 0;
    if (a2)
      goto LABEL_37;
  }
  v24 = 0;
LABEL_38:
  if (v23 > v24)
    return -1;
  else
    return 1;
}

void __59___UIKeyWindowSceneStack_keyWindowSceneInStackPassingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;
  uint64_t v7;
  void *v8;

  v5 = a2;
  v7 = *(_QWORD *)(a1 + 32);
  if (a2)
    a2 = *(_QWORD *)(a2 + 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2))
  {
    if (v5)
      v8 = *(void **)(v5 + 8);
    else
      v8 = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v8);
    *a4 = 1;
  }
}

@end
