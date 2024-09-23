@implementation UIEventDeferringRecord

id __65___UIEventDeferringRecord_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  id v17;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 8))
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v3, "activeMultilinePrefix");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __65___UIEventDeferringRecord_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    v15 = &unk_1E16B1B50;
    v5 = *(void **)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 32);
    v17 = v5;
    objc_msgSend(v3, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("recreationReasons"), v4, &v12);

    v2 = *(_QWORD *)(a1 + 32);
  }
  v6 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(_QWORD *)(v2 + 16), CFSTR("descriptor"), v12, v13, v14, v15, v16);
  v7 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), CFSTR("invalidationToken"));
  v8 = *(void **)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  v10 = (id)objc_msgSend(v8, "appendObject:withName:", WeakRetained, CFSTR("deferringToken"));

  return (id)objc_msgSend(*(id *)(a1 + 40), "appendPointer:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), CFSTR("recordingManagerPointer"));
}

void __65___UIEventDeferringRecord_descriptionBuilderWithMultilinePrefix___block_invoke(int8x16_t *a1)
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
  v6[2] = __65___UIEventDeferringRecord_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v5 = a1[2];
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

void __65___UIEventDeferringRecord_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(a1 + 40);
        _UIEventDeferringShorterRecreationReasonStringForReason(*(void **)(*((_QWORD *)&v11 + 1) + 8 * v7));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (id)objc_msgSend(v8, "appendObject:withName:", v9, 0, (_QWORD)v11);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

@end
