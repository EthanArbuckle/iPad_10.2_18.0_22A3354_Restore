@implementation UIHomeAffordanceSceneNotifierProxy

id __53___UIHomeAffordanceSceneNotifierProxy_initWithScene___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "debugDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __65___UIHomeAffordanceSceneNotifierProxy_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasSuccinctStyle");
  v3 = *(void **)(a1 + 32);
  if ((v2 & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "hasDebugStyle");
    if ((result & 1) != 0)
      return result;
    v3 = *(void **)(a1 + 32);
  }
  return (uint64_t)(id)objc_msgSend(v3, "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "count"), CFSTR("observers.count"));
}

void __65___UIHomeAffordanceSceneNotifierProxy_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[6];

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendRect:withName:", CFSTR("lastReceivedHomeAffordanceSceneReferenceFrame"), *(double *)(*(_QWORD *)(a1 + 40) + 56), *(double *)(*(_QWORD *)(a1 + 40) + 64), *(double *)(*(_QWORD *)(a1 + 40) + 72), *(double *)(*(_QWORD *)(a1 + 40) + 80));
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "count");
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65___UIHomeAffordanceSceneNotifierProxy_appendDescriptionToStream___block_invoke_3;
    v11[3] = &unk_1E16B1B50;
    v11[4] = *(_QWORD *)(a1 + 40);
    v11[5] = v4;
    objc_msgSend(v4, "appendBodySectionWithName:block:", CFSTR("observers"), v11);
  }
  else
  {
    v5 = (id)objc_msgSend(v4, "appendObject:withName:", 0, CFSTR("observers"));
  }
  v10 = *(id *)(*(_QWORD *)(a1 + 40) + 48);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v10, "succinctDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "appendObject:withName:skipIfNil:", v7, CFSTR("targetNotifier"), 1);

  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("targetNotifierRegistrationToken"), 1);
}

void __65___UIHomeAffordanceSceneNotifierProxy_appendDescriptionToStream___block_invoke_3(uint64_t a1)
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
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 32);
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
        v15[2] = __65___UIHomeAffordanceSceneNotifierProxy_appendDescriptionToStream___block_invoke_4;
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

id __65___UIHomeAffordanceSceneNotifierProxy_appendDescriptionToStream___block_invoke_4(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(a1 + 40), CFSTR("observationRecord"));
}

@end
