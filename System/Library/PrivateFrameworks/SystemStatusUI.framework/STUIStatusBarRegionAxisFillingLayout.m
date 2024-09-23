@implementation STUIStatusBarRegionAxisFillingLayout

+ (id)fillingLayout
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__STUIStatusBarRegionAxisFillingLayout_fillingLayout__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_46 != -1)
    dispatch_once(&_MergedGlobals_46, block);
  return (id)qword_1EDBEDFB0;
}

void __53__STUIStatusBarRegionAxisFillingLayout_fillingLayout__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1EDBEDFB0;
  qword_1EDBEDFB0 = (uint64_t)v1;

}

- (id)constraintsForDisplayItems:(id)a3 layoutGuides:(id)a4 inContainerItem:(id)a5 axis:(int64_t)a6
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  int64_t v20;

  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99DE8];
  v10 = a3;
  objc_msgSend(v9, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __101__STUIStatusBarRegionAxisFillingLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke;
  v17[3] = &unk_1E8D63EE0;
  v12 = v11;
  v19 = v8;
  v20 = a6;
  v18 = v12;
  v13 = v8;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v17);

  v14 = v19;
  v15 = v12;

  return v15;
}

void __101__STUIStatusBarRegionAxisFillingLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;

  objc_msgSend(a2, "layoutItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 48);
  v7 = v4;
  v8 = v7;
  if (v6 == (void *)1)
  {
    objc_msgSend(v7, "topAnchor");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
      goto LABEL_6;
    objc_msgSend(v7, "leftAnchor");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v2 = (void *)v9;
LABEL_6:

  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(id *)(a1 + 40);
  v12 = v11;
  if (v10 == 1)
  {
    objc_msgSend(v11, "topAnchor");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v10)
      goto LABEL_11;
    objc_msgSend(v11, "leftAnchor");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v13;
LABEL_11:

  objc_msgSend(v2, "constraintEqualToAnchor:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 1112276992;
  objc_msgSend(v14, "_ui_constraintWithPriority:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v16);

  v17 = *(void **)(a1 + 32);
  v18 = *(void **)(a1 + 48);
  v19 = v8;
  v20 = v19;
  if (v18 == (void *)1)
  {
    objc_msgSend(v19, "bottomAnchor");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v18)
      goto LABEL_16;
    objc_msgSend(v19, "rightAnchor");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v2 = (void *)v21;
LABEL_16:

  v22 = *(_QWORD *)(a1 + 48);
  v23 = *(id *)(a1 + 40);
  v24 = v23;
  if (v22 == 1)
  {
    objc_msgSend(v23, "bottomAnchor");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v22)
      goto LABEL_21;
    objc_msgSend(v23, "rightAnchor");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v25;
LABEL_21:

  objc_msgSend(v2, "constraintEqualToAnchor:", v18);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v27) = 1112276992;
  objc_msgSend(v26, "_ui_constraintWithPriority:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v28);

  v29 = *(void **)(a1 + 32);
  v30 = *(_QWORD *)(a1 + 48);
  v31 = v20;
  v38 = v31;
  if (v30 == 1)
  {
    objc_msgSend(v31, "centerYAnchor");
    v32 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v30)
      goto LABEL_26;
    objc_msgSend(v31, "centerXAnchor");
    v32 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v32;
  v31 = v38;
LABEL_26:

  v33 = *(_QWORD *)(a1 + 48);
  v34 = *(id *)(a1 + 40);
  v35 = v34;
  if (v33 == 1)
  {
    objc_msgSend(v34, "centerYAnchor");
    v36 = objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  if (!v33)
  {
    objc_msgSend(v34, "centerXAnchor");
    v36 = objc_claimAutoreleasedReturnValue();
LABEL_30:
    a1 = v36;
  }

  objc_msgSend(v20, "constraintEqualToAnchor:", a1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObject:", v37);

}

- (BOOL)canOverflowItems
{
  return 0;
}

@end
