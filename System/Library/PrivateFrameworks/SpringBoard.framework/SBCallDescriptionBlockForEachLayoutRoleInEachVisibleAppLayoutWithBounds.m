@implementation SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayoutWithBounds

void ___SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayoutWithBounds_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  __int128 v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v15 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    objc_msgSend(*(id *)(a1 + 40), "frameForIndex:", a3);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = ___SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayoutWithBounds_block_invoke_2;
    v16[3] = &unk_1E8EBEC68;
    v17 = v15;
    v18 = *(id *)(a1 + 48);
    v19 = *(id *)(a1 + 40);
    v22 = v6;
    v23 = v8;
    v24 = v10;
    v25 = v12;
    v14 = *(_OWORD *)(a1 + 64);
    v13 = (id)v14;
    v21 = v14;
    v20 = *(id *)(a1 + 56);
    v26 = a3;
    SBLayoutRoleEnumerateValidRoles(v16);

  }
}

void ___SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayoutWithBounds_block_invoke_2(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;

  v15 = a2;
  v3 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "itemForLayoutRole:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTarget:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v5, "setSelector:", *(_QWORD *)(a1 + 72));
    objc_msgSend(v5, "setArgument:atIndex:", &v15, 2);
    objc_msgSend(v5, "setArgument:atIndex:", v3, 3);
    objc_msgSend(v5, "setArgument:atIndex:", a1 + 80, 4);
    objc_msgSend(v5, "invoke");
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sb_switcherModifierDebugTimelineDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 56);
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = *(_QWORD *)(a1 + 112);
    objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SBLayoutRoleDescription(v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromCGRect(*(CGRect *)(a1 + 80));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%lu %@, role: %@, bounds: %@ --> %@"), v10, v11, v12, v13, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v14);

  }
}

@end
