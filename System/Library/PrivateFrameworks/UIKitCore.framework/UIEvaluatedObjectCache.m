@implementation UIEvaluatedObjectCache

void __65___UIEvaluatedObjectCache_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
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
  v6[2] = __65___UIEvaluatedObjectCache_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

void __65___UIEvaluatedObjectCache_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  int8x16_t v7;
  _QWORD v8[4];
  int8x16_t v9;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "count"), CFSTR("sortedObjects.count"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("topEvaluatedObject"));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "activeMultilinePrefix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65___UIEvaluatedObjectCache_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    v8[3] = &unk_1E16B1B50;
    v7 = *(int8x16_t *)(a1 + 32);
    v6 = (id)v7.i64[0];
    v9 = vextq_s8(v7, v7, 8uLL);
    objc_msgSend(v4, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("sortedObjects"), v5, v8);

  }
}

void __65___UIEvaluatedObjectCache_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
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
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
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

void __44___UIEvaluatedObjectCache_evaluateTopObject__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  if ((*(unsigned int (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))())
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

@end
