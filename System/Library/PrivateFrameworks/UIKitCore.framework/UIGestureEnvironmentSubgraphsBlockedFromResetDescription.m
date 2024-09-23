@implementation UIGestureEnvironmentSubgraphsBlockedFromResetDescription

void ___UIGestureEnvironmentSubgraphsBlockedFromResetDescription_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  uint64_t *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id obj;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v31 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v27;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v27 != v10)
                objc_enumerationMutation(v7);
              v12 = *(uint64_t **)(*((_QWORD *)&v26 + 1) + 8 * j);
              if (-[UIGestureRecognizer _isActive](v12))
                objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
              if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v12))
                objc_msgSend(*(id *)(a1 + 56), "addObject:", v12);
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v9);
        }

        v13 = (void *)objc_msgSend(v7, "mutableCopy");
        objc_msgSend(v13, "minusSet:", *(_QWORD *)(a1 + 40));
        objc_msgSend(v13, "minusSet:", *(_QWORD *)(a1 + 56));
        v14 = *(void **)(a1 + 64);
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = ___UIGestureEnvironmentSubgraphsBlockedFromResetDescription_block_invoke_2;
        v20[3] = &unk_1E16B2900;
        v15 = v14;
        v21 = v15;
        v22 = *(id *)(a1 + 40);
        v16 = *(id *)(a1 + 56);
        v17 = *(_QWORD *)(a1 + 72);
        v24 = v13;
        v25 = v17;
        v23 = v16;
        v18 = v13;
        objc_msgSend(v15, "appendBodySectionWithName:block:", CFSTR("subgraph"), v20);
        objc_msgSend(*(id *)(a1 + 56), "removeAllObjects");
        objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v3);
  }

}

void ___UIGestureEnvironmentSubgraphsBlockedFromResetDescription_block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  v4 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = ___UIGestureEnvironmentSubgraphsBlockedFromResetDescription_block_invoke_3;
  v14[3] = &unk_1E16C9390;
  v15 = *(id *)(a1 + 32);
  objc_msgSend(v2, "appendCollection:withName:itemBlock:", v3, CFSTR("blockingSubgraphResetGestures"), v14);

  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = ___UIGestureEnvironmentSubgraphsBlockedFromResetDescription_block_invoke_4;
  v11[3] = &unk_1E16C9468;
  v13 = *(_QWORD *)(a1 + 64);
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v5, "appendCollection:withName:itemBlock:", v6, CFSTR("blockedFromResetGestures"), v11);

  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 56);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = ___UIGestureEnvironmentSubgraphsBlockedFromResetDescription_block_invoke_6;
  v9[3] = &unk_1E16C9390;
  v10 = v7;
  objc_msgSend(v10, "appendCollection:withName:itemBlock:", v8, CFSTR("remainingGestures"), v9);

}

void ___UIGestureEnvironmentSubgraphsBlockedFromResetDescription_block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "_briefDescription");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, 0);

}

void ___UIGestureEnvironmentSubgraphsBlockedFromResetDescription_block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  double v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  double v10;

  if (a2)
    v4 = *(_QWORD *)(a2 + 216);
  else
    v4 = 0;
  v5 = _UIMediaTimeForMachTime(*(_QWORD *)(a1 + 40) - v4);
  v6 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ___UIGestureEnvironmentSubgraphsBlockedFromResetDescription_block_invoke_5;
  v7[3] = &unk_1E16B1C28;
  v8 = v6;
  v9 = a2;
  v10 = v5;
  objc_msgSend(v8, "appendProem:block:", a2, v7);

}

id ___UIGestureEnvironmentSubgraphsBlockedFromResetDescription_block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  _UIGestureRecognizerStateString(objc_msgSend(*(id *)(a1 + 40), "state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("state"));

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendTimeInterval:withName:decomposeUnits:", CFSTR("timeFromEnqueuedReset"), 0, *(double *)(a1 + 48));
}

void ___UIGestureEnvironmentSubgraphsBlockedFromResetDescription_block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "_briefDescription");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, 0);

}

@end
