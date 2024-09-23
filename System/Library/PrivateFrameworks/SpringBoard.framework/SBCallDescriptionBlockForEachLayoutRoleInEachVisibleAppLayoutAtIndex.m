@implementation SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayoutAtIndex

void ___SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayoutAtIndex_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  __int128 v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  uint64_t v14;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = ___SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayoutAtIndex_block_invoke_2;
    v8[3] = &unk_1E8EBEC90;
    v9 = v7;
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    v14 = a3;
    v6 = *(_OWORD *)(a1 + 64);
    v5 = (id)v6;
    v13 = v6;
    v12 = *(id *)(a1 + 56);
    SBLayoutRoleEnumerateValidRoles(v8);

  }
}

void ___SBCallDescriptionBlockForEachLayoutRoleInEachVisibleAppLayoutAtIndex_block_invoke_2(uint64_t a1, unint64_t a2)
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
  unint64_t v14;

  v14 = a2;
  v3 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "itemForLayoutRole:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTarget:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v5, "setSelector:", *(_QWORD *)(a1 + 72));
    objc_msgSend(v5, "setArgument:atIndex:", &v14, 2);
    objc_msgSend(v5, "setArgument:atIndex:", v3, 3);
    objc_msgSend(v5, "setArgument:atIndex:", a1 + 80, 4);
    objc_msgSend(v5, "invoke");
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sb_switcherModifierDebugTimelineDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 56);
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = *(_QWORD *)(a1 + 80);
    objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SBLayoutRoleDescription(v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%lu %@, role: %@ --> %@"), v10, v11, v12, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v13);

  }
}

@end
