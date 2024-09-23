@implementation UIHomeAffordanceSceneNotifier

id __48___UIHomeAffordanceSceneNotifier_initWithScene___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "debugDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __60___UIHomeAffordanceSceneNotifier_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  id v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasSuccinctStyle");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v4 = a1 + 40;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "hasDebugStyle");
    if ((result & 1) != 0)
      return result;
    v6 = *(_QWORD *)(a1 + 40);
    v4 = a1 + 40;
    v7 = (id)objc_msgSend(*(id *)(v4 - 8), "appendBool:withName:", (*(unsigned __int8 *)(v6 + 8) >> 1) & 1, CFSTR("expectsLegacyViewServiceObservers"));
    v3 = *(void **)(v4 - 8);
  }
  return (uint64_t)(id)objc_msgSend(v3, "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(_QWORD *)v4 + 40), "count"), CFSTR("observers.count"));
}

id __60___UIHomeAffordanceSceneNotifier_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[6];

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", (*(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 8) >> 1) & 1, CFSTR("expectsLegacyViewServiceObservers"));
  v3 = *(_QWORD *)(a1 + 40);
  if ((*(_BYTE *)(v3 + 8) & 2) == 0)
  {
    v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendRect:withName:", CFSTR("homeAffordanceSceneReferenceFrame"), *(double *)(v3 + 56), *(double *)(v3 + 64), *(double *)(v3 + 72), *(double *)(v3 + 80));
    v3 = *(_QWORD *)(a1 + 40);
  }
  v5 = objc_msgSend(*(id *)(v3 + 40), "count");
  v6 = *(void **)(a1 + 32);
  if (!v5)
    return (id)objc_msgSend(v6, "appendObject:withName:", 0, CFSTR("observers"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60___UIHomeAffordanceSceneNotifier_appendDescriptionToStream___block_invoke_3;
  v8[3] = &unk_1E16B1B50;
  v8[4] = *(_QWORD *)(a1 + 40);
  v8[5] = v6;
  return (id)objc_msgSend(v6, "appendBodySectionWithName:block:", CFSTR("observers"), v8);
}

void __60___UIHomeAffordanceSceneNotifier_appendDescriptionToStream___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  __CFString *v13;
  id obj;
  _QWORD v15[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v17;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v5);
        v7 = *(void **)(a1 + 40);
        if (v6 && (v8 = objc_loadWeakRetained((id *)(v6 + 16))) != 0)
        {
          v9 = v8;
          v10 = (void *)MEMORY[0x1E0CB3940];
          v11 = (objc_class *)objc_opt_class();
          NSStringFromClass(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p>"), v12, v9);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v13 = CFSTR("(nil)");
        }
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __60___UIHomeAffordanceSceneNotifier_appendDescriptionToStream___block_invoke_4;
        v15[3] = &unk_1E16B1B50;
        v15[4] = *(_QWORD *)(a1 + 40);
        v15[5] = v6;
        objc_msgSend(v7, "appendBodySectionWithName:block:", v13, v15);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v3);
  }

}

id __60___UIHomeAffordanceSceneNotifier_appendDescriptionToStream___block_invoke_4(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(a1 + 40), CFSTR("observationRecord"));
}

@end
