@implementation UIPencilEvent

void __38___UIPencilEvent_registerInteraction___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  id *v16;
  __CFString *v17;
  __CFString *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  id *WeakRetained;
  _BYTE buf[24];
  void *v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && v2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = _unregisterInteraction_withRegistrationToken____s_category[0];
    if (!_unregisterInteraction_withRegistrationToken____s_category[0])
    {
      v4 = __UILogCategoryGetNode("PencilInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, _unregisterInteraction_withRegistrationToken____s_category);
    }
    if ((*(_BYTE *)v4 & 1) != 0)
    {
      v9 = *(id *)(v4 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        if (v3)
        {
          v10 = (void *)MEMORY[0x1E0CB3940];
          v11 = (id)v3;
          v12 = (objc_class *)objc_opt_class();
          NSStringFromClass(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p>"), v13, v11);
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v14 = CFSTR("(nil)");
        }
        v15 = (void *)MEMORY[0x1E0CB3940];
        v16 = WeakRetained;
        v17 = v14;
        v18 = v14;
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@: %p>"), v20, v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v21;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Unregistering interaction: %@; with event: %@",
          buf,
          0x16u);

      }
    }
    objc_msgSend(WeakRetained[21], "removeObject:", v3);
    objc_msgSend((id)v3, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3
      || (*(char *)(v3 + 8) < 0
        ? (v7 = *(_QWORD *)(v3 + 32))
        : (v7 = objc_msgSend((id)v3, "_dispatchBehavior"), *(_QWORD *)(v3 + 32) = v7),
          v7 != 2))
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained[22], "removeObject:", v8);

    }
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __61___UIPencilEvent__cancelAndRemoveInteractionFromDescriptors___block_invoke;
    v24 = &unk_1E16DEF88;
    v25 = v3;
    -[_UIPencilEvent _cancelAndRemoveInteractionsInAllDeliveryRecordsFromFilter:]((uint64_t)WeakRetained, (uint64_t)buf);
  }

}

id __61___UIPencilEvent__cancelAndRemoveInteractionFromDescriptors___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  if (objc_msgSend(a2, "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id __63___UIPencilEvent__cancelAndRemoveAllDescriptorsAndInteractions__block_invoke(int a1, id a2)
{
  return a2;
}

uint64_t __89___UIPencilEvent__collectAllActiveInteractionsConstrainedToWindow_consultingInteraction___block_invoke(uint64_t a1, _BYTE *a2)
{
  return -[_UIPencilEvent _shouldCollectInteraction:consultingInteraction:constrainedToWindow:](*(void **)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 48), *(void **)(a1 + 40));
}

void __56___UIPencilEvent_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
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
  v6[2] = __56___UIPencilEvent_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

void __56___UIPencilEvent_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  const __CFString *v4;
  int has_internal_diagnostics;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  int8x16_t v18;
  int8x16_t v19;
  _QWORD v20[4];
  int8x16_t v21;
  _QWORD v22[4];
  int8x16_t v23;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 152);
  if (v3 > 4)
    v4 = CFSTR("(unknown)");
  else
    v4 = off_1E16DEFF8[v3];
  objc_msgSend(v2, "appendString:withName:", v4, CFSTR("phase"));
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v6 = *(_QWORD *)(a1 + 40);
  if (has_internal_diagnostics)
  {
    v17 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("normalizedForceVelocity"), 1, *(double *)(v6 + 160));
    v6 = *(_QWORD *)(a1 + 40);
  }
  v7 = objc_msgSend(*(id *)(v6 + 168), "count");
  v8 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "activeMultilinePrefix");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __56___UIPencilEvent_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    v22[3] = &unk_1E16B1B50;
    v18 = *(int8x16_t *)(a1 + 32);
    v11 = (id)v18.i64[0];
    v23 = vextq_s8(v18, v18, 8uLL);
    objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("registeredInteractions"), v9, v22);

    v12 = *(void **)(a1 + 32);
    objc_msgSend(v12, "activeMultilinePrefix");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v10;
    v20[1] = 3221225472;
    v20[2] = __56___UIPencilEvent_descriptionBuilderWithMultilinePrefix___block_invoke_4;
    v20[3] = &unk_1E16B1B50;
    v19 = *(int8x16_t *)(a1 + 32);
    v14 = (id)v19.i64[0];
    v21 = vextq_s8(v19, v19, 8uLL);
    objc_msgSend(v12, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("fallbackInteractions"), v13, v20);

  }
  else
  {
    v15 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", 0, CFSTR("registeredInteractions"));
    v16 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", 0, CFSTR("fallbackInteractions"));
  }
}

void __56___UIPencilEvent_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 168);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "succinctDescription", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (id)objc_msgSend(v7, "appendObject:withName:", v8, 0);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

void __56___UIPencilEvent_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
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
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 168);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v6);
        if (v7)
        {
          if (*(char *)(v7 + 8) < 0)
          {
            v8 = *(_QWORD *)(v7 + 32);
          }
          else
          {
            v8 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v6), "_dispatchBehavior", (_QWORD)v12);
            *(_QWORD *)(v7 + 32) = v8;
          }
          if (v8 == 1)
          {
            v9 = *(void **)(a1 + 40);
            objc_msgSend((id)v7, "succinctDescription");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = (id)objc_msgSend(v9, "appendObject:withName:", v10, 0);

          }
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

id __50___UIPencilEvent__registerForStateCaptureIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "descriptionBuilderWithMultilinePrefix:", &stru_1E16EDF20);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
