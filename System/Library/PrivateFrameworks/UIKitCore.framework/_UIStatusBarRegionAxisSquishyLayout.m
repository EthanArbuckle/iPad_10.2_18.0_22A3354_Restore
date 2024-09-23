@implementation _UIStatusBarRegionAxisSquishyLayout

- (_UIStatusBarRegionAxisSquishyLayout)init
{
  _UIStatusBarRegionAxisSquishyLayout *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIStatusBarRegionAxisSquishyLayout;
  result = -[_UIStatusBarRegionAxisSquishyLayout init](&v8, sel_init);
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&result->_itemDynamicScale = _Q0;
  result->_minInterspaceDynamicScale = 0.0;
  result->_interspace = -1.0;
  return result;
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

- (id)constraintsForDisplayItems:(id)a3 layoutGuides:(id)a4 inContainerItem:(id)a5 axis:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int64_t alignment;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  double v25;
  double v26;
  double minItemDynamicScale;
  double itemDynamicScale;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  unint64_t maxNumberOfVisibleItems;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  UILayoutGuide *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  double v53;
  void *v54;
  id v55;
  int64_t v57;
  _BOOL4 v58;
  void *v59;
  void *v60;
  void *v61;
  int64_t v62;
  uint64_t v63;
  _QWORD v64[4];
  id v65;
  id v66;
  _UIStatusBarRegionAxisSquishyLayout *v67;
  id v68;
  id v69;
  id v70;
  _QWORD *v71;
  _QWORD *v72;
  double v73;
  int64_t v74;
  uint64_t v75;
  double v76;
  uint64_t v77;
  double v78;
  _QWORD v79[4];
  _QWORD v80[5];
  id v81;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  alignment = self->_alignment;
  if (a6 == 1)
  {
    v15 = 1;
    v62 = self->_alignment;
    v63 = 4;
    v16 = 8;
    switch(alignment)
    {
      case 0:
        goto LABEL_17;
      case 1:
        alignment = 10;
        goto LABEL_17;
      case 3:
        break;
      case 4:
        goto LABEL_7;
      case 5:
        alignment = 11;
        goto LABEL_17;
      case 6:
      case 7:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSLayoutAttribute _UIStatusBarRegionAxisLayoutAttributeForAlignmentAndAxis(_UIStatusBarRegionAxisLayoutAlignment, UILayoutConstraintAxis)");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = CFSTR("Mixed alignments must be resolved before getting the attribute");
        v20 = v17;
        v21 = v18;
        v22 = 102;
        goto LABEL_15;
      default:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSLayoutAttribute _UIStatusBarRegionAxisLayoutAttributeForAlignmentAndAxis(_UIStatusBarRegionAxisLayoutAlignment, UILayoutConstraintAxis)");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = CFSTR("Horizontal alignment given for vertical axis: %ld");
        v57 = alignment;
        v20 = v17;
        v21 = v18;
        v22 = 105;
LABEL_15:
        objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("_UIStatusBarRegionAxisLayout_Internal.h"), v22, v19, v57);
LABEL_16:

        alignment = 0;
LABEL_17:
        v24 = alignment;
        v15 = a6 == 1;
        if (a6)
          v16 = 8 * (a6 == 1);
        else
          v16 = 7;
        alignment = self->_alignment;
        v62 = v24;
        v63 = v24;
        break;
    }
  }
  else if (a6)
  {
LABEL_7:
    v15 = a6 == 1;
    v16 = 8 * (a6 == 1);
    v63 = 3;
    v62 = 4;
  }
  else
  {
    v15 = 0;
    v63 = 2;
    v62 = 1;
    v16 = 7;
    switch(alignment)
    {
      case 0:
        goto LABEL_17;
      case 1:
        alignment = 9;
        goto LABEL_17;
      case 3:
        v15 = 0;
        v63 = 6;
        v23 = 5;
        goto LABEL_12;
      case 4:
        v15 = 0;
        v63 = 5;
        v23 = 6;
        goto LABEL_12;
      case 5:
        break;
      case 6:
        v15 = 0;
        v63 = 1;
        v23 = 2;
LABEL_12:
        v62 = v23;
        v16 = 7;
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSLayoutAttribute _UIStatusBarRegionAxisLayoutAttributeForAlignmentAndAxis(_UIStatusBarRegionAxisLayoutAlignment, UILayoutConstraintAxis)");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("_UIStatusBarRegionAxisLayout_Internal.h"), 83, CFSTR("Vertical alignment given for horizontal axis: %ld"), alignment);
        goto LABEL_16;
    }
  }
  v25 = 1.0;
  if ((alignment & 0xFFFFFFFFFFFFFFFDLL) == 4)
    v26 = -1.0;
  else
    v26 = 1.0;
  minItemDynamicScale = self->_minItemDynamicScale;
  if (self->_itemDynamicScale >= minItemDynamicScale)
    itemDynamicScale = self->_itemDynamicScale;
  else
    itemDynamicScale = self->_minItemDynamicScale;
  if (minItemDynamicScale < 1.0)
    v25 = self->_minInterspaceDynamicScale
        + (itemDynamicScale - minItemDynamicScale)
        / (1.0 - minItemDynamicScale)
        * (1.0 - self->_minInterspaceDynamicScale);
  v58 = v15;
  v29 = v16;
  if ((alignment | 2) == 6)
  {
    objc_msgSend(v10, "reverseObjectEnumerator");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "allObjects");
    v31 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v31;
  }
  v32 = v10;
  maxNumberOfVisibleItems = self->_maxNumberOfVisibleItems;
  v34 = v12;
  if (maxNumberOfVisibleItems >= objc_msgSend(v32, "count"))
  {
    v61 = (void *)MEMORY[0x1E0C9AA60];
    v37 = v32;
  }
  else
  {
    _UIStatusBarGetPriorityComparator();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "sortedArrayUsingComparator:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "subarrayWithRange:", self->_maxNumberOfVisibleItems, objc_msgSend(v32, "count") - self->_maxNumberOfVisibleItems);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "arrayByExcludingObjectsInArray:");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v80[0] = 0;
  v80[1] = v80;
  v80[2] = 0x3032000000;
  v80[3] = __Block_byref_object_copy__158;
  v80[4] = __Block_byref_object_dispose__158;
  v81 = 0;
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x2020000000;
  v79[3] = 0;
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __100___UIStatusBarRegionAxisSquishyLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke;
  v64[3] = &unk_1E16DB5D0;
  v38 = v37;
  v65 = v38;
  v39 = v32;
  v71 = v79;
  v73 = v26;
  v66 = v39;
  v67 = self;
  v40 = v13;
  v74 = v62;
  v75 = v63;
  v76 = v25;
  v77 = v29;
  v68 = v40;
  v72 = v80;
  v41 = v11;
  v69 = v41;
  v42 = v34;
  v70 = v42;
  v78 = itemDynamicScale;
  objc_msgSend(v39, "enumerateObjectsUsingBlock:", v64);
  v60 = v39;
  if (objc_msgSend(v38, "count"))
  {
    objc_msgSend(v38, "firstObject");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "layoutItem");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "lastObject");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "layoutItem");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
      v46 = 10;
    else
      v46 = 9;
    v47 = objc_alloc_init(UILayoutGuide);
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v47, v62, 0, v59, v62, 1.0, 0.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v48);

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v47, v63, 0, v45, v63, 1.0, 0.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v49);

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v47, v46, 0, v42, v46, 1.0, (1.0 - v25) * (v26 * self->_interspace));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObject:", v50);

    objc_msgSend(v41, "addObject:", v47);
    if (v26 == 1.0)
      v51 = -1;
    else
      v51 = 1;
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v45, v63, v51, v42, v63);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v53) = 1111752704;
    objc_msgSend(v52, "setPriority:", v53);
    objc_msgSend(v40, "addObject:", v52);

  }
  v54 = v70;
  v55 = v40;

  _Block_object_dispose(v79, 8);
  _Block_object_dispose(v80, 8);

  return v55;
}

- (BOOL)canOverflowItems
{
  return 1;
}

- (BOOL)mayFitDisplayItems:(id)a3 inContainerItem:(id)a4 axis:(int64_t)a5
{
  return (unint64_t)objc_msgSend(a3, "count") <= self->_maxNumberOfItems;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (BOOL)compressItems
{
  return self->_compressItems;
}

- (void)setCompressItems:(BOOL)a3
{
  self->_compressItems = a3;
}

- (double)interspace
{
  return self->_interspace;
}

- (void)setInterspace:(double)a3
{
  self->_interspace = a3;
}

- (int64_t)maxNumberOfItems
{
  return self->_maxNumberOfItems;
}

- (void)setMaxNumberOfItems:(int64_t)a3
{
  self->_maxNumberOfItems = a3;
}

- (int64_t)maxNumberOfVisibleItems
{
  return self->_maxNumberOfVisibleItems;
}

- (void)setMaxNumberOfVisibleItems:(int64_t)a3
{
  self->_maxNumberOfVisibleItems = a3;
}

- (double)itemDynamicScale
{
  return self->_itemDynamicScale;
}

- (void)setItemDynamicScale:(double)a3
{
  self->_itemDynamicScale = a3;
}

- (double)minItemDynamicScale
{
  return self->_minItemDynamicScale;
}

- (double)minInterspaceDynamicScale
{
  return self->_minInterspaceDynamicScale;
}

- (_UIStatusBarRegionAxisSquishyLayoutDynamicHidingDelegate)dynamicHidingDelegate
{
  return (_UIStatusBarRegionAxisSquishyLayoutDynamicHidingDelegate *)objc_loadWeakRetained((id *)&self->_dynamicHidingDelegate);
}

- (void)setDynamicHidingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dynamicHidingDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dynamicHidingDelegate);
}

@end
