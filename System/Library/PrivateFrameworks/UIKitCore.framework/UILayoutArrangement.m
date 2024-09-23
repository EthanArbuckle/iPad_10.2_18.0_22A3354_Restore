@implementation UILayoutArrangement

uint64_t __53___UILayoutArrangement__setLayoutFillsCanvas_notify___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLayoutFillsCanvas:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __70___UILayoutArrangement__setLayoutUsesCanvasMarginsWhenFilling_notify___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLayoutUsesCanvasMarginsWhenFilling:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __40___UILayoutArrangement__setAxis_notify___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAxis:", *(_QWORD *)(a1 + 32));
}

id __69___UILayoutArrangement__updateCanvasConnectionConstraintsIfNecessary__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v15;

  v7 = a2;
  v8 = a4;
  v9 = v7;
  v10 = objc_msgSend(*(id *)(a1 + 32), "_layoutRelationForCanvasConnectionForAttribute:", a3);
  if (objc_msgSend(v9, "firstAttribute") != a3)
    goto LABEL_6;
  objc_msgSend(v9, "firstItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 != *(void **)(a1 + 40))
    goto LABEL_5;
  objc_msgSend(v9, "secondItem");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 != v8)
  {

LABEL_5:
    goto LABEL_6;
  }
  v15 = objc_msgSend(v9, "relation");

  if (v15 == v10)
  {
    v13 = v9;
    if ((objc_msgSend(v9, "isActive") & 1) != 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_6:
  objc_msgSend(v9, "setActive:", 0);
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:", *(_QWORD *)(a1 + 40), a3, v10, v8, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setIdentifier:", CFSTR("UISV-canvas-connection"));
LABEL_7:
  objc_msgSend(v13, "setActive:", 1);
LABEL_8:

  return v13;
}

void __72___UILayoutArrangement__updateSpanningLayoutGuideConstraintsIfNecessary__block_invoke_2(uint64_t a1, void *a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  id v13;

  v13 = a2;
  v5 = 5;
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
    v5 = 3;
  v6 = 6;
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
    v6 = 4;
  if (a3)
    v7 = v5;
  else
    v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v13;
  }
  else
  {
    objc_msgSend(v13, "_viewOrGuideForLocationAttribute:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v10 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), v7, v10, v9, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIdentifier:", CFSTR("UISV-spanning-boundary"));
  LODWORD(v12) = 1148846080;
  if (!v10)
    *(float *)&v12 = 999.5;
  objc_msgSend(v11, "setPriority:", v12);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);

}

uint64_t __72___UILayoutArrangement__updateSpanningLayoutGuideConstraintsIfNecessary__block_invoke(uint64_t a1, int a2, int a3)
{
  uint64_t v3;

  v3 = -1;
  if (!a2)
    v3 = 1;
  if (a3)
    return v3;
  else
    return 0;
}

void __72___UILayoutArrangement__updateSpanningLayoutGuideConstraintsIfNecessary__block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:constant:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), objc_msgSend(*(id *)(a1 + 32), "_dimensionAttributeForCurrentAxis"), 0, 0.0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_spanningLayoutGuideFittingPriority");
  objc_msgSend(v2, "setPriority:");
  objc_msgSend(v2, "setIdentifier:", CFSTR("UISV-spanning-fit"));
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v2);

}

uint64_t __56___UILayoutArrangement__hasBaselineChangedNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[2];
  BOOL (*v14)(uint64_t, void *, int);
  void *v15;
  id v16;
  uint64_t v17;
  id v18;

  v3 = a2;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v14 = __56___UILayoutArrangement__hasBaselineChangedNotification___block_invoke_2;
  v15 = &unk_1E16E9690;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v16 = v4;
  v17 = v5;
  v6 = v3;
  v7 = v6;
  v18 = v6;
  if (v6)
    v6 = (id)objc_msgSend((id)objc_msgSend(v6, "firstItem"), "_referenceView");
  v8 = v6;
  v9 = 1;
  if (!__56___UILayoutArrangement__hasBaselineChangedNotification___block_invoke_2((uint64_t)v13, v8, 0)
    && !__56___UILayoutArrangement__hasBaselineChangedNotification___block_invoke_2((uint64_t)v13, v8, 1))
  {
    if (v7)
      v10 = (void *)objc_msgSend((id)objc_msgSend(v7, "secondItem"), "_referenceView");
    else
      v10 = 0;
    v11 = v10;
    if (!__56___UILayoutArrangement__hasBaselineChangedNotification___block_invoke_2((uint64_t)v13, v11, 0))
      v9 = ((uint64_t (*)(_QWORD *, id, uint64_t))v14)(v13, v11, 1);

  }
  return v9;
}

BOOL __56___UILayoutArrangement__hasBaselineChangedNotification___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  if (a3)
    v4 = 12;
  else
    v4 = 11;
  objc_msgSend(a2, "_viewForLoweringBaselineLayoutAttribute:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  if (v5 == v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "_invalidateBaselineConstraint:", *(_QWORD *)(a1 + 48));
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56___UILayoutArrangement__hasBaselineChangedNotification___block_invoke_3;
    v9[3] = &unk_1E16E9668;
    v7 = *(void **)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v7, "_trackChangesWithConfigBlock:", v9);

  }
  return v5 == v6;
}

uint64_t __56___UILayoutArrangement__hasBaselineChangedNotification___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_invalidateBaselineConstraint:", *(_QWORD *)(a1 + 32));
}

uint64_t __105___UILayoutArrangement__respondToChangesWithIncomingItem_outgoingItem_newlyHiddenItem_newlyUnhiddenItem___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_pendingHiddenCount");
  if (result >= 1)
    return objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
  return result;
}

@end
