@implementation STUIStatusBarRegionAxisAligningLayout

- (id)constraintsForDisplayItems:(id)a3 layoutGuides:(id)a4 inContainerItem:(id)a5 axis:(int64_t)a6
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  int64_t v21;

  v9 = a5;
  v10 = (void *)MEMORY[0x1E0C99DE8];
  v11 = a3;
  objc_msgSend(v10, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __102__STUIStatusBarRegionAxisAligningLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke;
  v18[3] = &unk_1E8D63830;
  v21 = a6;
  v18[4] = self;
  v13 = v12;
  v19 = v13;
  v20 = v9;
  v14 = v9;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v18);

  v15 = v20;
  v16 = v13;

  return v16;
}

+ (id)aligningLayoutWithAlignment:(int64_t)a3
{
  STUIStatusBarRegionAxisAligningLayout *v4;

  v4 = objc_alloc_init(STUIStatusBarRegionAxisAligningLayout);
  -[STUIStatusBarRegionAxisAligningLayout setAlignment:](v4, "setAlignment:", a3);
  return v4;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

void __102__STUIStatusBarRegionAxisAligningLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  double v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;

  v52 = a2;
  objc_msgSend(v52, "layoutItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v52, "overriddenVerticalAlignment");
  v6 = v5;
  if (*(_QWORD *)(a1 + 56) != 1 || v5 == 0)
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    objc_msgSend(v52, "displayable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == 7)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v8, "prefersCenterVerticalAlignment") & 1) != 0)
      {
LABEL_15:
        v6 = 1;
        goto LABEL_16;
      }
    }
    else if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v8, "prefersBaselineAlignment") & 1) == 0)
    {
      goto LABEL_15;
    }
    v6 = 5;
LABEL_16:

  }
  if (v6 == 2)
  {
    v14 = *(void **)(a1 + 40);
    v15 = *(void **)(a1 + 56);
    v16 = v4;
    v17 = v16;
    if (v15 == (void *)1)
    {
      objc_msgSend(v16, "topAnchor");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v15)
        goto LABEL_36;
      objc_msgSend(v16, "leadingAnchor");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v2 = (void *)v18;
LABEL_36:

    v25 = *(_QWORD *)(a1 + 56);
    v26 = *(id *)(a1 + 48);
    v27 = v26;
    if (v25 == 1)
    {
      objc_msgSend(v26, "topAnchor");
      v28 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v25)
        goto LABEL_41;
      objc_msgSend(v26, "leadingAnchor");
      v28 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v28;
LABEL_41:

    objc_msgSend(v2, "constraintEqualToAnchor:", v15);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v30) = 1112276992;
    objc_msgSend(v29, "_ui_constraintWithPriority:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v31);

    v32 = *(void **)(a1 + 40);
    v33 = *(void **)(a1 + 56);
    v34 = v17;
    v12 = v34;
    if (v33 == (void *)1)
    {
      objc_msgSend(v34, "bottomAnchor");
      v35 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v33)
        goto LABEL_46;
      objc_msgSend(v34, "trailingAnchor");
      v35 = objc_claimAutoreleasedReturnValue();
    }
    v2 = (void *)v35;
LABEL_46:

    v36 = *(_QWORD *)(a1 + 56);
    v37 = *(id *)(a1 + 48);
    v38 = v37;
    if (v36 == 1)
    {
      objc_msgSend(v37, "bottomAnchor");
      v39 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v36)
        goto LABEL_51;
      objc_msgSend(v37, "trailingAnchor");
      v39 = objc_claimAutoreleasedReturnValue();
    }
    v33 = (void *)v39;
LABEL_51:

    objc_msgSend(v2, "constraintEqualToAnchor:", v33);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v41) = 1112276992;
    objc_msgSend(v40, "_ui_constraintWithPriority:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v42);

    v11 = *(void **)(a1 + 40);
    v43 = *(_QWORD *)(a1 + 56);
    v44 = v12;
    v45 = v44;
    if (v43 == 1)
    {
      objc_msgSend(v44, "centerYAnchor");
      v46 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v43)
        goto LABEL_56;
      objc_msgSend(v44, "centerXAnchor");
      v46 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v46;
LABEL_56:

    v47 = *(_QWORD *)(a1 + 56);
    v48 = *(id *)(a1 + 48);
    v49 = v48;
    if (v47 == 1)
    {
      objc_msgSend(v48, "centerYAnchor");
      v50 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v47)
      {
LABEL_61:

        objc_msgSend(v12, "constraintEqualToAnchor:", a1);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_62;
      }
      objc_msgSend(v48, "centerXAnchor");
      v50 = objc_claimAutoreleasedReturnValue();
    }
    a1 = v50;
    goto LABEL_61;
  }
  if (v6 == 5)
  {
    objc_msgSend(v52, "baselineOffset");
    v10 = v9;
    v11 = *(void **)(a1 + 40);
    objc_msgSend(v4, "lastBaselineAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "bottomAnchor");
    a1 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:constant:", a1, -v10);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_62:
    v51 = (void *)v13;
    objc_msgSend(v11, "addObject:", v13);

    goto LABEL_63;
  }
  v19 = *(_QWORD *)(a1 + 56);
  if (v19 == 1)
  {
    objc_msgSend(v52, "centerOffset");
    v19 = *(_QWORD *)(a1 + 56);
  }
  else
  {
    v20 = 0.0;
  }
  v21 = v6 - 1;
  if (!v19)
  {
    if (v21 < 6)
    {
      v22 = &unk_1CFEBF8A0;
      goto LABEL_31;
    }
LABEL_32:
    v23 = 0;
    goto LABEL_33;
  }
  if (v21 >= 5)
    goto LABEL_32;
  v22 = &unk_1CFEBF8D0;
LABEL_31:
  v23 = v22[v21];
LABEL_33:
  v24 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, v23, 0, *(_QWORD *)(a1 + 48), v23, 1.0, -v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObject:", v12);
LABEL_63:

}

- (BOOL)canOverflowItems
{
  return 0;
}

- (int64_t)alignment
{
  return self->_alignment;
}

@end
