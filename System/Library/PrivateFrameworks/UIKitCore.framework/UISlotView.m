@implementation UISlotView

id __19___UISlotView_init__block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id __35___UISlotView__setContentDelegate___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_contentDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentTagForSlotView:", WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resolvedStyleForStyle:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = v3;
  v9 = v7;

  return v9;
}

void __35___UISlotView__setContentDelegate___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  uint64_t (**v8)(id, void *);
  id *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t (**v21)(id, void *);
  id v22[2];
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t (**v26)(id, void *);
  id v27;

  v7 = a3;
  v8 = a4;
  v9 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_contentDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentTagForSlotView:", WeakRetained);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "slotView:shouldSetInitialContentForStyle:tag:", WeakRetained, v7, v12))
  {
    objc_msgSend(v11, "slotView:initialContentForStyle:tag:", WeakRetained, v7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      v14 = v8[2](v8, v13);
    else
      v14 = 0;
    objc_msgSend(v11, "slotView:didSetInitialContent:forStyle:tag:", WeakRetained, v14, v7, v12);

  }
  if (objc_msgSend(v11, "slotView:shouldSetFinalContentForStyle:tag:", WeakRetained, v7, v12))
  {
    objc_msgSend(v11, "slotMachineForFinalContentInSlotView:", WeakRetained);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "shouldGetFinalContentSynchronouslyInSlotView:", WeakRetained))
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __35___UISlotView__setContentDelegate___block_invoke_3;
      v23[3] = &unk_1E16E4798;
      objc_copyWeak(&v27, v9);
      v24 = v7;
      v25 = v12;
      v26 = v8;
      objc_msgSend(v15, "getRemoteContentForLayerContextWithId:style:tag:reply:", a2, v24, v25, v23);

      objc_destroyWeak(&v27);
    }
    else
    {
      dispatch_get_global_queue(33, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __35___UISlotView__setContentDelegate___block_invoke_4;
      v17[3] = &unk_1E16E47E8;
      v18 = v15;
      v22[1] = a2;
      v19 = v7;
      v20 = v12;
      objc_copyWeak(v22, v9);
      v21 = v8;
      dispatch_async(v16, v17);

      objc_destroyWeak(v22);
    }

  }
}

void __35___UISlotView__setContentDelegate___block_invoke_3(_QWORD *a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;

  v3 = (id *)(a1 + 7);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_contentDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "slotView:replacementForFinalContent:style:tag:", WeakRetained, v4, a1[4], a1[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = (*(uint64_t (**)(void))(a1[6] + 16))();
  else
    v7 = 0;
  objc_msgSend(v5, "slotView:didSetFinalContent:forStyle:tag:", WeakRetained, v7, a1[4], a1[5]);

}

void __35___UISlotView__setContentDelegate___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35___UISlotView__setContentDelegate___block_invoke_5;
  v6[3] = &unk_1E16E4798;
  objc_copyWeak(&v10, (id *)(a1 + 64));
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v3, "getRemoteContentForLayerContextWithId:style:tag:reply:", v2, v4, v5, v6);

  objc_destroyWeak(&v10);
}

void __35___UISlotView__setContentDelegate___block_invoke_5(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35___UISlotView__setContentDelegate___block_invoke_6;
  block[3] = &unk_1E16E47C0;
  objc_copyWeak(&v10, a1 + 7);
  v6 = v3;
  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[6];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v10);
}

void __35___UISlotView__setContentDelegate___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_contentDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "slotView:replacementForFinalContent:style:tag:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  else
    v4 = 0;
  objc_msgSend(v2, "slotView:didSetFinalContent:forStyle:tag:", WeakRetained, v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __25___UISlotView__slotStyle__block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) == -1)
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = objc_msgSend(v7, "accessibilityContrast");
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) == -1)
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v7, "displayGamut");
  if (*(double *)(*(_QWORD *)(a1[6] + 8) + 24) == 0.0)
  {
    objc_msgSend(v7, "displayScale");
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v3;
  }
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) == -1)
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(v7, "layoutDirection");
  if (*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) == -1)
    *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = objc_msgSend(v7, "legibilityWeight");
  if (*(__CFString **)(*(_QWORD *)(a1[9] + 8) + 40) == CFSTR("_UICTContentSizeCategoryUnspecified"))
  {
    objc_msgSend(v7, "preferredContentSizeCategory");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[9] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  if (*(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 24) == -1)
    *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 24) = objc_msgSend(v7, "userInterfaceIdiom");
  if (!*(_QWORD *)(*(_QWORD *)(a1[11] + 8) + 24))
    *(_QWORD *)(*(_QWORD *)(a1[11] + 8) + 24) = objc_msgSend(v7, "userInterfaceStyle");

}

BOOL __25___UISlotView__slotStyle__block_invoke_2(_QWORD *a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) == -1
      || *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) == -1
      || *(double *)(*(_QWORD *)(a1[6] + 8) + 24) == 0.0
      || *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) == -1
      || *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) == -1
      || *(__CFString **)(*(_QWORD *)(a1[9] + 8) + 40) == CFSTR("_UICTContentSizeCategoryUnspecified")
      || *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 24) == -1
      || *(_QWORD *)(*(_QWORD *)(a1[11] + 8) + 24) == 0;
}

void __34___UISlotView__sharedLayerContext__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(MEMORY[0x1E0DC5C58], "newLayerContext");
  v1 = (void *)qword_1ECD7ABC0;
  qword_1ECD7ABC0 = v0;

}

uint64_t __29___UISlotView__updateContent__block_invoke(uint64_t a1, void *a2)
{
  id *v4;
  id v5;
  id WeakRetained;
  uint64_t v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = v5;
  v9 = v8;
  if (WeakRetained && *((_QWORD *)WeakRetained + 60) == v7)
  {
    objc_msgSend(v8, "contentSize");
    if (*((double *)WeakRetained + 57) != v10 || *((double *)WeakRetained + 58) != v11)
    {
      *((double *)WeakRetained + 57) = v10;
      *((double *)WeakRetained + 58) = v11;
      objc_msgSend(WeakRetained, "invalidateIntrinsicContentSize");
    }
    if ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v9, "shouldReplaceExistingContent"))
    {
      v13 = (void *)*((_QWORD *)WeakRetained + 59);
      +[_UISlotView _sharedLayerContext]();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "deleteFromLayerContext:", v14);

      objc_storeStrong((id *)WeakRetained + 59, a2);
      objc_msgSend(WeakRetained, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setNeedsDisplay");

    }
    v16 = 1;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end
