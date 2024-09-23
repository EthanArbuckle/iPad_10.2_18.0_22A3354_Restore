@implementation UIActiveViewServiceSessionTracker

void __51___UIActiveViewServiceSessionTracker_sharedTracker__block_invoke()
{
  _UIActiveViewServiceSessionTracker *v0;
  id v1;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v6;

  v0 = [_UIActiveViewServiceSessionTracker alloc];
  if (v0
    && (v6.receiver = v0,
        v6.super_class = (Class)_UIActiveViewServiceSessionTracker,
        (v1 = objc_msgSendSuper2(&v6, sel_init)) != 0))
  {
    v2 = v1;
    BSLogAddStateCaptureBlockWithTitle();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v2[2];
    v2[2] = v3;

  }
  else
  {
    v2 = 0;
  }
  v5 = (void *)qword_1ECD7CB00;
  qword_1ECD7CB00 = (uint64_t)v2;

}

id __43___UIActiveViewServiceSessionTracker__init__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "descriptionBuilderWithMultilinePrefix:", &stru_1E16EDF20);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "build");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __65___UIActiveViewServiceSessionTracker__createEvaluatedObjectCache__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  int v7;
  BOOL v8;
  int v9;
  uint64_t v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a2)
    {
      v4 = *(_QWORD *)(a2 + 40);
      v5 = objc_msgSend(*(id *)(a2 + 8), "count");
      v6 = *(_QWORD *)(a2 + 40) == 2;
      v7 = *(_DWORD *)(a2 + 20);
      if (v4)
        v8 = v5 == 0;
      else
        v8 = 1;
      v9 = !v8;
    }
    else
    {
      v6 = 0;
      v9 = 0;
      v7 = 0;
    }
    if (v7 != 3 && v7 != 0)
      v6 = 0;
    v11 = v9 & !v6;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __78___UIActiveViewServiceSessionTracker__removeViewServiceSessionActivityRecord___block_invoke(uint64_t a1)
{
  uint64_t v2;

  -[_UIEvaluatedObjectCache removeObject:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    objc_storeWeak((id *)(v2 + 24), 0);
}

void __117___UIActiveViewServiceSessionTracker_handleViewServiceActivity_inHostedWindow_fromProvider_forSessionActivityRecord___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (!*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (v2)
      objc_storeWeak((id *)(v2 + 24), *(id *)(a1 + 48));
  }
  -[_UIEvaluatedObjectCache sortedObjects](*(id **)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40));

  if (*(_BYTE *)(a1 + 80) && !*(_BYTE *)(a1 + 81))
    -[_UIEvaluatedObjectCache demoteObject:](*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  else
    -[_UIEvaluatedObjectCache promoteObject:](*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

void __76___UIActiveViewServiceSessionTracker_descriptionBuilderWithMultilinePrefix___block_invoke(int8x16_t *a1)
{
  void *v2;
  void *v3;
  id v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;

  v2 = (void *)a1[2].i64[0];
  objc_msgSend(v2, "activeMultilinePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76___UIActiveViewServiceSessionTracker_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v5 = a1[2];
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("sortedActivityRecordsByIdiom"), v3, v6);

}

void __76___UIActiveViewServiceSessionTracker_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", v7);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        if (v8 && objc_msgSend(*(id *)(v8 + 24), "count"))
        {
          v10 = objc_msgSend(v7, "integerValue");
          v11 = *(void **)(a1 + 40);
          _NSStringFromUIUserInterfaceIdiom(v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "activeMultilinePrefix");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = __76___UIActiveViewServiceSessionTracker_descriptionBuilderWithMultilinePrefix___block_invoke_3;
          v14[3] = &unk_1E16B1B50;
          v15 = v9;
          v16 = *(id *)(a1 + 40);
          objc_msgSend(v11, "appendBodySectionWithName:multilinePrefix:block:", v12, v13, v14);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

}

void __76___UIActiveViewServiceSessionTracker_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  void *v2;
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
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[_UIEvaluatedObjectCache sortedObjects](*(id **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
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

@end
