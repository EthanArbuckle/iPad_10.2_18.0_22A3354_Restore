@implementation STUIStatusBarRegionAxisStackingLayout

- (void)setInterspace:(double)a3
{
  self->_interspace = a3;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (id)constraintsForDisplayItems:(id)a3 layoutGuides:(id)a4 inContainerItem:(id)a5 axis:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int64_t alignment;
  int v15;
  int v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  double v44;
  id v45;
  id v47;
  uint64_t v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  STUIStatusBarRegionAxisStackingLayout *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  char v58;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  alignment = self->_alignment;
  v49 = v11;
  if (a6 == 1)
  {
    v16 = 0;
    v17 = 1.0;
    v19 = 3;
    v21 = 4;
    v24 = 11;
    v20 = self->_alignment;
    v22 = v20;
    v23 = v20;
    switch(alignment)
    {
      case 1:
        v16 = 1;
        v23 = 3;
        v22 = 10;
        v21 = 4;
        break;
      case 3:
        break;
      case 4:
LABEL_21:
        if ((alignment & 0xFFFFFFFFFFFFFFFDLL) == 4)
          v17 = -1.0;
        else
          v17 = 1.0;
        v21 = v19;
        goto LABEL_25;
      case 5:
        goto LABEL_10;
      default:
        goto LABEL_14;
    }
  }
  else if (a6)
  {
    if (alignment == 1)
    {
      v24 = 0;
LABEL_10:
      v16 = 0;
      if ((alignment & 0xFFFFFFFFFFFFFFFDLL) == 4)
        v17 = -1.0;
      else
        v17 = 1.0;
      v21 = v24;
      v22 = v24;
      v23 = v24;
    }
    else
    {
LABEL_14:
      v21 = 0;
      if ((alignment & 0xFFFFFFFFFFFFFFFDLL) == 4)
        v17 = -1.0;
      else
        v17 = 1.0;
      if ((alignment | 2) == 6)
      {
        v20 = 0;
LABEL_25:
        objc_msgSend(v10, "reverseObjectEnumerator");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "allObjects");
        v26 = objc_claimAutoreleasedReturnValue();

        v16 = 0;
        v22 = v20;
        v23 = v20;
        v10 = (id)v26;
      }
      else
      {
        v16 = 0;
        v22 = 0;
        v23 = 0;
      }
    }
  }
  else
  {
    v15 = 0;
    v16 = 0;
    v17 = 1.0;
    v18 = 5;
    v19 = 1;
    v20 = 2;
    v21 = 2;
    v22 = 1;
    v23 = 1;
    switch(alignment)
    {
      case 1:
        v15 = 1;
        v18 = 9;
        goto LABEL_5;
      case 3:
LABEL_5:
        v23 = 5;
        v21 = 6;
        v22 = v18;
        v16 = v15;
        break;
      case 4:
        v19 = 5;
        v20 = 6;
        goto LABEL_21;
      case 5:
        break;
      case 6:
        goto LABEL_21;
      default:
        goto LABEL_14;
    }
  }
  v48 = v22;
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __102__STUIStatusBarRegionAxisStackingLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke;
  v50[3] = &unk_1E8D63A20;
  v27 = v10;
  v51 = v27;
  v28 = v13;
  v55 = v23;
  v56 = v21;
  v57 = v17;
  v52 = v28;
  v53 = self;
  v58 = v16;
  v29 = v12;
  v54 = v29;
  objc_msgSend(v27, "enumerateObjectsUsingBlock:", v50);
  objc_msgSend(v27, "lastObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "layoutItem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v32 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
    objc_msgSend(v27, "firstObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "layoutItem");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "lastObject");
    v35 = v31;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "layoutItem");
    v47 = v29;
    v37 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v32, v23, 0, v34, v23, 1.0, 0.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObject:", v38);

    v31 = v35;
    v39 = (void *)v37;
    v29 = v47;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v32, v21, 0, v39, v21, 1.0, 0.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObject:", v40);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v32, v48, 0, v47, v48, 1.0, 0.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObject:", v41);

    v42 = v49;
    objc_msgSend(v49, "addObject:", v32);

  }
  else
  {
    if (self->_hugging)
    {
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v31, v21, 0, v29, v21, 1.0, 0.0);
      v32 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v17 == 1.0)
        v43 = -1;
      else
        v43 = 1;
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v31, v21, v43, v29, v21);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v44) = 1132134400;
      objc_msgSend(v32, "setPriority:", v44);
    }
    objc_msgSend(v28, "addObject:", v32);
    v42 = v49;
  }

  v45 = v28;
  return v45;
}

void __102__STUIStatusBarRegionAxisStackingLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a2, "layoutItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v11 = v5;
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3 - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v11;
    if (v7)
    {
      v8 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, *(_QWORD *)(a1 + 64), 0, v7, *(_QWORD *)(a1 + 72), 1.0, *(double *)(a1 + 80) * *(double *)(*(_QWORD *)(a1 + 48) + 24));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

LABEL_6:
      v5 = v11;
      goto LABEL_7;
    }
  }
  if (!*(_BYTE *)(a1 + 88))
  {
    v10 = *(void **)(a1 + 40);
    v11 = v5;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, *(_QWORD *)(a1 + 64), 0, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 1.0, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v7);
    goto LABEL_6;
  }
LABEL_7:

}

- (BOOL)canOverflowItems
{
  return 1;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (double)interspace
{
  return self->_interspace;
}

- (BOOL)hugging
{
  return self->_hugging;
}

- (void)setHugging:(BOOL)a3
{
  self->_hugging = a3;
}

@end
