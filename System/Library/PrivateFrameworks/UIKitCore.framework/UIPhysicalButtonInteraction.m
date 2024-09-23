@implementation UIPhysicalButtonInteraction

void __61___UIPhysicalButtonInteraction__geometryChanged_forAncestor___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  -[_UIPhysicalButtonInteractionArbiter _setNeedsResolutionOfPhysicalButtonConfigurationsInWindow:forReason:](a2, a3, 2uLL);
}

void __70___UIPhysicalButtonInteraction_descriptionBuilderWithMultilinePrefix___block_invoke(int8x16_t *a1)
{
  void *v2;
  void *v3;
  id v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;
  __int8 v8;

  v2 = (void *)a1[2].i64[0];
  objc_msgSend(v2, "activeMultilinePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70___UIPhysicalButtonInteraction_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B4008;
  v5 = a1[2];
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  v8 = a1[3].i8[0];
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

void __70___UIPhysicalButtonInteraction_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "length"))
    objc_msgSend(*(id *)(a1 + 40), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), CFSTR("name"));
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 36), CFSTR("enabled"));
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  if (*(_BYTE *)(a1 + 48))
    v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("registrationToken"));
  else
    v6 = (id)objc_msgSend(v3, "appendBool:withName:", v4 != 0, CFSTR("hasRegistered"));
  v7 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) & 1, CFSTR("registrationPendingDidMoveToWindow"));
  v8 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:", (*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 32) >> 1) & 1, CFSTR("registrationPendingWindowMoveToScene"));
  v9 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:ifEqualTo:", (*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 32) >> 2) & 1, CFSTR("wantsRelaxedVisibilityRequirement"), 1);
  v10 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:ifEqualTo:", (*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 32) >> 3) & 1, CFSTR("wantsSystemShellExclusivePriority"), 1);
  if (*(_BYTE *)(a1 + 48))
  {
    v11 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:", (*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 32) >> 4) & 1, CFSTR("hasExclusiveBehaviorConfiguration"));
    v12 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:", (*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 32) >> 5) & 1, CFSTR("isWithinSceneBounds"));
  }
  v13 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), CFSTR("configurations"));
  if (*(_BYTE *)(a1 + 48))
  {
    v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
    v15 = *(void **)(a1 + 40);
    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 40), "activeMultilinePrefix");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __70___UIPhysicalButtonInteraction_descriptionBuilderWithMultilinePrefix___block_invoke_3;
      v23[3] = &unk_1E16B1B50;
      v17 = *(void **)(a1 + 40);
      v23[4] = *(_QWORD *)(a1 + 32);
      v24 = v17;
      objc_msgSend(v15, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("activeActions"), v16, v23);

    }
    else
    {
      v22 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", 0, CFSTR("activeActions"));
    }
  }
  else
  {
    v18 = *(void **)(a1 + 40);
    _UIPhysicalButtonSuccinctConfigurationsDescriptionForSet(*(_QWORD **)(*(_QWORD *)(a1 + 32) + 48));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v18, "appendObject:withName:", v19, CFSTR("configurations"));

    v21 = (id)objc_msgSend(*(id *)(a1 + 40), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"), CFSTR("activeActions"));
  }
}

void __70___UIPhysicalButtonInteraction_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
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

@end
