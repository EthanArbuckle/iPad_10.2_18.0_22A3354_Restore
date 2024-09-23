@implementation UITraitChangeRegistry

void __52___UITraitChangeRegistry_unregisterForTraitChanges___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id pointer;

  pointer = a2;
  v5 = a3;
  objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 32));
  if (!objc_msgSend(v5, "count"))
    __UIInlinePointerSetInsertElement(*(uint64_t **)(a1 + 40), (unint64_t)pointer, 0);

}

void __99___UITraitChangeRegistry_recordTraitUsage_forTraitEnvironment_insideMethod_withInvalidationAction___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  const __CFNumber *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (const __CFNumber *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v8 = 0;
  v6 = 0u;
  v7 = 0u;
  v5 = 0u;
  _UIGetTraitMetadata(v4, 0, (uint64_t)&v5);
  v3 = (id)v6;
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __52___UITraitChangeRegistry_unregisterForTraitChanges___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", a2);
}

void __90___UITraitChangeRegistry_traitsDidChange_forTraitEnvironment_withPreviousTraitCollection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        __UIInlinePointerSetInsertElement(*(uint64_t **)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 1);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

void __108___UITraitChangeRegistry__performTrackedTraitInvalidations_forTraitEnvironment_withPreviousTraitCollection___block_invoke(uint64_t a1, const char *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  if (dyld_program_sdk_at_least())
    objc_msgSend(v4, a2);
  else
    objc_msgSend(v4, sel_performSelector_, a2);
  v5 = *(void **)(a1 + 40);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a2);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("-%@"), v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
}

void __103___UITraitChangeRegistry__performTraitChangeCallbacks_forTraitEnvironment_withPreviousTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id *v11;

  v3 = a2;
  v11 = v3;
  if (!v3)
  {
    v7 = 0;
LABEL_11:

    v5 = 0;
    goto LABEL_12;
  }
  v4 = v3[2];
  if (!v4)
  {
    if (*((_BYTE *)v11 + 8))
      WeakRetained = *(id *)(a1 + 32);
    else
      WeakRetained = objc_loadWeakRetained(v11 + 3);
    v7 = WeakRetained;
    if (WeakRetained)
    {
      v8 = (const char *)v11[4];
      v10 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      if (dyld_program_sdk_at_least())
        objc_msgSend(v7, v8, v10, v9);
      else
        objc_msgSend(v7, sel_performSelector_withObject_withObject_, v8, v10, v9);
    }
    goto LABEL_11;
  }
  v5 = v4;
  (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
LABEL_12:

}

@end
