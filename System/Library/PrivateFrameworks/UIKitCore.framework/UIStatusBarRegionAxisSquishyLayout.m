@implementation UIStatusBarRegionAxisSquishyLayout

void __100___UIStatusBarRegionAxisSquishyLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  UILayoutGuide *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  UILayoutGuide *v30;
  UILayoutGuide *v31;
  double v32;
  id *v33;
  id WeakRetained;
  id v35;
  id v36;
  double v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;

  v42 = a2;
  objc_msgSend(v42, "layoutItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v42);
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3 - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  if (v9
    && (objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v9 - 1),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "layoutItem"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v11))
  {
    if (*(double *)(*(_QWORD *)(a1 + 48) + 24) == -1.0)
      goto LABEL_19;
    v12 = objc_alloc_init(UILayoutGuide);
    v13 = *(void **)(a1 + 56);
    v14 = (void *)MEMORY[0x1E0D156E0];
    v15 = *(_QWORD *)(a1 + 104);
    v16 = *(_QWORD *)(a1 + 112);
    v17 = 0.0;
    if ((v6 & 1) == 0)
    {
      objc_msgSend(v5, "_ui_bounds");
      v17 = v18 * 0.5 + *(double *)(*(_QWORD *)(a1 + 48) + 24) * 0.5 * *(double *)(a1 + 120);
    }
    objc_msgSend(v14, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, v15, 0, v12, v16, 1.0, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v19);

    v20 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, *(_QWORD *)(a1 + 104), 0, v11, *(_QWORD *)(a1 + 112), 1.0, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v21);

    v22 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, *(_QWORD *)(a1 + 128), 0, 0, 0, 1.0, *(double *)(*(_QWORD *)(a1 + 48) + 24) * *(double *)(a1 + 120));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v23);

    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v25 = *(_QWORD *)(v24 + 40);
    if (v25)
    {
      v26 = *(void **)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, *(_QWORD *)(a1 + 128), 0, v25, *(_QWORD *)(a1 + 128), 1.0, 0.0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObject:", v27);

      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v28 = *(void **)(v24 + 40);
    }
    else
    {
      v28 = 0;
    }
    *(_QWORD *)(v24 + 40) = v12;
    v31 = v12;

    v33 = (id *)(a1 + 64);
  }
  else
  {
    if (*(double *)(a1 + 96) == 1.0)
      v29 = 1;
    else
      v29 = -1;
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, *(_QWORD *)(a1 + 104), v29, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 104), 1.0, 0.0);
    v30 = (UILayoutGuide *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    LODWORD(v32) = 1144733696;
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 48) + 8))
      *(float *)&v32 = 49.0;
    -[UILayoutGuide setPriority:](v30, "setPriority:", v32);
    v11 = 0;
    v33 = (id *)(a1 + 56);
  }
  objc_msgSend(*v33, "addObject:", v31);

LABEL_19:
  if (v6)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    if (objc_msgSend(v42, "dynamicallyHidden"))
    {
      objc_msgSend(v42, "setDynamicallyHidden:", 0);
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 72));

      if (WeakRetained)
      {
        v35 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 72));
        v36 = v35;
        v37 = *(double *)(a1 + 136);
        v38 = v42;
        v39 = 0;
LABEL_26:
        objc_msgSend(v35, "updateDisplayItem:toDynamicallyHidden:scale:", v38, v39, v37);
LABEL_29:

      }
    }
    else
    {
      v41 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 72));

      if (v41)
      {
        v36 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 72));
        objc_msgSend(v36, "updateDisplayItem:toScale:", v42, *(double *)(a1 + 136));
        goto LABEL_29;
      }
    }
  }
  else if ((objc_msgSend(v42, "dynamicallyHidden") & 1) == 0)
  {
    objc_msgSend(v42, "setDynamicallyHidden:", 1);
    v40 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 72));

    if (v40)
    {
      v35 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 72));
      v36 = v35;
      v37 = *(double *)(a1 + 136);
      v38 = v42;
      v39 = 1;
      goto LABEL_26;
    }
  }

}

@end
