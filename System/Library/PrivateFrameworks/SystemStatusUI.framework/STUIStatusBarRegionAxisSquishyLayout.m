@implementation STUIStatusBarRegionAxisSquishyLayout

- (int64_t)maxNumberOfVisibleItems
{
  return self->_maxNumberOfVisibleItems;
}

- (void)setMaxNumberOfVisibleItems:(int64_t)a3
{
  self->_maxNumberOfVisibleItems = a3;
}

- (void)setItemDynamicScale:(double)a3
{
  self->_itemDynamicScale = a3;
}

- (void)setMinItemDynamicScale:(double)a3
{
  double v3;

  v3 = fmax(fmin(a3, 1.0), 0.0);
  if (v3 != self->_minItemDynamicScale)
    self->_minItemDynamicScale = v3;
}

- (void)setMinInterspaceDynamicScale:(double)a3
{
  double v3;

  v3 = fmax(fmin(a3, 1.0), 0.0);
  if (v3 != self->_minInterspaceDynamicScale)
    self->_minInterspaceDynamicScale = v3;
}

- (void)setMaxNumberOfItems:(int64_t)a3
{
  self->_maxNumberOfItems = a3;
}

- (void)setInterspace:(double)a3
{
  self->_interspace = a3;
}

- (void)setDynamicHidingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dynamicHidingDelegate, a3);
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (STUIStatusBarRegionAxisSquishyLayout)init
{
  STUIStatusBarRegionAxisSquishyLayout *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STUIStatusBarRegionAxisSquishyLayout;
  result = -[STUIStatusBarRegionAxisSquishyLayout init](&v8, sel_init);
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&result->_itemDynamicScale = _Q0;
  result->_minInterspaceDynamicScale = 0.0;
  result->_interspace = -1.0;
  return result;
}

- (void)setCompressItems:(BOOL)a3
{
  self->_compressItems = a3;
}

- (double)itemDynamicScale
{
  return self->_itemDynamicScale;
}

- (id)constraintsForDisplayItems:(id)a3 layoutGuides:(id)a4 inContainerItem:(id)a5 axis:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  int64_t alignment;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double minItemDynamicScale;
  double itemDynamicScale;
  void *v22;
  uint64_t v23;
  id v24;
  NSUInteger v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t maxNumberOfVisibleItems;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  double v50;
  void *v51;
  id v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int64_t v60;
  uint64_t v61;
  _QWORD v62[4];
  id v63;
  STUIStatusBarRegionAxisSquishyLayout *v64;
  id v65;
  id v66;
  id v67;
  _QWORD *v68;
  _QWORD *v69;
  _QWORD *v70;
  double v71;
  int64_t v72;
  uint64_t v73;
  double v74;
  uint64_t v75;
  double v76;
  _QWORD v77[4];
  _QWORD v78[4];
  _QWORD v79[5];
  id v80;
  _QWORD v81[6];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = objc_claimAutoreleasedReturnValue();
  alignment = self->_alignment;
  v56 = v11;
  v58 = v12;
  v55 = (void *)v13;
  if (a6 == 1)
  {
    v15 = 0;
    v60 = self->_alignment;
    v61 = 4;
    v16 = 8;
    switch(alignment)
    {
      case 1:
        v15 = 10;
        goto LABEL_9;
      case 3:
        break;
      case 4:
        goto LABEL_7;
      case 5:
        v15 = 11;
        goto LABEL_9;
      default:
LABEL_9:
        if (a6)
          v16 = 8 * (a6 == 1);
        else
          v16 = 7;
        v60 = v15;
        v61 = v15;
        break;
    }
  }
  else if (a6)
  {
LABEL_7:
    v16 = 8 * (a6 == 1);
    v61 = 3;
    v60 = 4;
  }
  else
  {
    v15 = 0;
    v61 = 2;
    v60 = 1;
    v16 = 7;
    switch(alignment)
    {
      case 1:
        v15 = 9;
        goto LABEL_9;
      case 3:
        v61 = 6;
        v17 = 5;
        goto LABEL_16;
      case 4:
        v61 = 5;
        v17 = 6;
        goto LABEL_16;
      case 5:
        break;
      case 6:
        v61 = 1;
        v17 = 2;
LABEL_16:
        v60 = v17;
        v16 = 7;
        break;
      default:
        goto LABEL_9;
    }
  }
  v18 = 1.0;
  if ((alignment & 0xFFFFFFFFFFFFFFFDLL) == 4)
    v19 = -1.0;
  else
    v19 = 1.0;
  minItemDynamicScale = self->_minItemDynamicScale;
  if (self->_itemDynamicScale >= minItemDynamicScale)
    itemDynamicScale = self->_itemDynamicScale;
  else
    itemDynamicScale = self->_minItemDynamicScale;
  if (minItemDynamicScale < 1.0)
    v18 = self->_minInterspaceDynamicScale
        + (1.0 - self->_minInterspaceDynamicScale)
        * ((itemDynamicScale - minItemDynamicScale)
         / (1.0 - minItemDynamicScale));
  if ((alignment | 2) == 6)
  {
    objc_msgSend(v10, "reverseObjectEnumerator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "allObjects");
    v23 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v23;
  }
  v24 = v10;
  v25 = -[NSSet count](self->_dynamicallyHiddenIdentifiers, "count");
  v26 = MEMORY[0x1E0C809B0];
  if (v25)
  {
    v81[0] = MEMORY[0x1E0C809B0];
    v81[1] = 3221225472;
    v81[2] = __101__STUIStatusBarRegionAxisSquishyLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke;
    v81[3] = &unk_1E8D62DC8;
    v81[4] = self;
    objc_msgSend(v24, "indexesOfObjectsPassingTest:", v81);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectsAtIndexes:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "arrayByExcludingObjectsInArray:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28 = (void *)MEMORY[0x1E0C9AA60];
    v29 = v24;
  }
  maxNumberOfVisibleItems = self->_maxNumberOfVisibleItems;
  if (maxNumberOfVisibleItems >= objc_msgSend(v29, "count"))
  {
    v54 = v28;
  }
  else
  {
    STUIStatusBarGetPriorityComparator();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "sortedArrayUsingComparator:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "subarrayWithRange:", self->_maxNumberOfVisibleItems, objc_msgSend(v32, "count") - self->_maxNumberOfVisibleItems);
    v33 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "arrayByExcludingObjectsInArray:", v33);
    v34 = v26;
    v35 = objc_claimAutoreleasedReturnValue();

    v54 = (void *)v33;
    v29 = (void *)v35;
    v26 = v34;
  }
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x3032000000;
  v79[3] = __Block_byref_object_copy_;
  v79[4] = __Block_byref_object_dispose_;
  v80 = 0;
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x2020000000;
  v78[3] = 0;
  v77[0] = 0;
  v77[1] = v77;
  v77[2] = 0x2020000000;
  v77[3] = 0;
  v62[0] = v26;
  v62[1] = 3221225472;
  v62[2] = __101__STUIStatusBarRegionAxisSquishyLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke_1;
  v62[3] = &unk_1E8D62DF0;
  v36 = v29;
  v71 = v19;
  v63 = v36;
  v64 = self;
  v68 = v78;
  v69 = v77;
  v37 = v55;
  v72 = v60;
  v73 = v61;
  v74 = v18;
  v75 = v16;
  v65 = v37;
  v70 = v79;
  v38 = v56;
  v66 = v38;
  v39 = v58;
  v67 = v39;
  v76 = itemDynamicScale;
  objc_msgSend(v24, "enumerateObjectsUsingBlock:", v62);
  if (objc_msgSend(v36, "count"))
  {
    objc_msgSend(v36, "firstObject", v54);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "layoutItem");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v38;

    objc_msgSend(v36, "lastObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "layoutItem");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (a6 == 1)
      v43 = 10;
    else
      v43 = 9;
    v44 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v44, v60, 0, v59, v60, 1.0, 0.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObject:", v45);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v44, v61, 0, v42, v61, 1.0, 0.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObject:", v46);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v44, v43, 0, v39, v43, 1.0, (1.0 - v18) * (v19 * self->_interspace));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObject:", v47);

    objc_msgSend(v57, "addObject:", v44);
    if (v19 == 1.0)
      v48 = -1;
    else
      v48 = 1;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v42, v61, v48, v39, v61);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v50) = 1111752704;
    objc_msgSend(v49, "setPriority:", v50);
    objc_msgSend(v37, "addObject:", v49);

    v38 = v57;
  }
  v51 = v67;
  v52 = v37;

  _Block_object_dispose(v77, 8);
  _Block_object_dispose(v78, 8);
  _Block_object_dispose(v79, 8);

  return v52;
}

void __101__STUIStatusBarRegionAxisSquishyLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke_1(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  void *v13;
  id v14;
  double v15;
  uint64_t v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id WeakRetained;
  id v37;
  id v38;
  double v39;
  id v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;

  v44 = a2;
  objc_msgSend(v44, "layoutItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v44);
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  if (v5
    && (objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v5 - 1),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "layoutItem"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v7))
  {
    v8 = *(double *)(*(_QWORD *)(a1 + 40) + 24);
    if (v8 == -1.0)
      goto LABEL_20;
    objc_msgSend(v44, "additionalDynamicPadding");
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    if (v9 == 0.0)
    {
      v11 = *(double *)(v10 + 24);
      *(_QWORD *)(v10 + 24) = 0;
    }
    else
    {
      *(double *)(v10 + 24) = v9;
      v11 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    }
    v17 = v8 + v11;
    v18 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
    v19 = *(void **)(a1 + 48);
    v20 = (void *)MEMORY[0x1E0CB3718];
    v21 = *(_QWORD *)(a1 + 104);
    v22 = *(_QWORD *)(a1 + 112);
    v23 = 0.0;
    if ((v4 & 1) == 0)
    {
      v24 = *(double *)(a1 + 96);
      objc_msgSend(v3, "_ui_bounds");
      v23 = v17 * 0.5 * *(double *)(a1 + 120) - v24 * (v25 * 0.5);
    }
    objc_msgSend(v20, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, v21, 0, v18, v22, 1.0, v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v26);

    v27 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, *(_QWORD *)(a1 + 104), 0, v7, *(_QWORD *)(a1 + 112), 1.0, 0.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v28);

    v29 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, *(_QWORD *)(a1 + 128), 0, 0, 0, 1.0, v17 * *(double *)(a1 + 120));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v30);

    v31 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v32 = *(_QWORD *)(v31 + 40);
    if (v32)
    {
      v33 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, *(_QWORD *)(a1 + 128), 0, v32, *(_QWORD *)(a1 + 128), 1.0, 0.0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v34);

      v31 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v35 = *(void **)(v31 + 40);
    }
    else
    {
      v35 = 0;
    }
    *(_QWORD *)(v31 + 40) = v18;
    v14 = v18;

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v14);
  }
  else
  {
    if (*(double *)(a1 + 96) == 1.0)
      v12 = 1;
    else
      v12 = -1;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, *(_QWORD *)(a1 + 104), v12, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 104), 1.0, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    LODWORD(v15) = 1144733696;
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 40) + 8))
      *(float *)&v15 = 49.0;
    objc_msgSend(v13, "setPriority:", v15);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v14);
    objc_msgSend(v44, "additionalDynamicPadding");
    v7 = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v16;
  }

LABEL_20:
  if (v4)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    if (objc_msgSend(v44, "dynamicallyHidden"))
    {
      objc_msgSend(v44, "setDynamicallyHidden:", 0);
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 80));

      if (WeakRetained)
      {
        v37 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 80));
        v38 = v37;
        v39 = *(double *)(a1 + 136);
        v40 = v44;
        v41 = 0;
LABEL_27:
        objc_msgSend(v37, "updateDisplayItem:toDynamicallyHidden:scale:", v40, v41, v39);
LABEL_30:

      }
    }
    else
    {
      v43 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 80));

      if (v43)
      {
        v38 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 80));
        objc_msgSend(v38, "updateDisplayItem:toScale:", v44, *(double *)(a1 + 136));
        goto LABEL_30;
      }
    }
  }
  else if ((objc_msgSend(v44, "dynamicallyHidden") & 1) == 0)
  {
    objc_msgSend(v44, "setDynamicallyHidden:", 1);
    v42 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 80));

    if (v42)
    {
      v37 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 80));
      v38 = v37;
      v39 = *(double *)(a1 + 136);
      v40 = v44;
      v41 = 1;
      goto LABEL_27;
    }
  }

}

- (BOOL)mayFitDisplayItems:(id)a3 inContainerItem:(id)a4 axis:(int64_t)a5
{
  return (unint64_t)objc_msgSend(a3, "count") <= self->_maxNumberOfItems;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dynamicHidingDelegate);
  objc_storeStrong((id *)&self->_dynamicallyHiddenIdentifiers, 0);
}

uint64_t __101__STUIStatusBarRegionAxisSquishyLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (BOOL)canOverflowItems
{
  return 1;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (BOOL)compressItems
{
  return self->_compressItems;
}

- (double)interspace
{
  return self->_interspace;
}

- (int64_t)maxNumberOfItems
{
  return self->_maxNumberOfItems;
}

- (NSSet)dynamicallyHiddenIdentifiers
{
  return self->_dynamicallyHiddenIdentifiers;
}

- (void)setDynamicallyHiddenIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicallyHiddenIdentifiers, a3);
}

- (double)minItemDynamicScale
{
  return self->_minItemDynamicScale;
}

- (double)minInterspaceDynamicScale
{
  return self->_minInterspaceDynamicScale;
}

- (STUIStatusBarRegionAxisSquishyLayoutDynamicHidingDelegate)dynamicHidingDelegate
{
  return (STUIStatusBarRegionAxisSquishyLayoutDynamicHidingDelegate *)objc_loadWeakRetained((id *)&self->_dynamicHidingDelegate);
}

@end
