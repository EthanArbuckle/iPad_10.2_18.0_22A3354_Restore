@implementation _UIStatusBarRegionAxisStackingLayout

- (id)constraintsForDisplayItems:(id)a3 layoutGuides:(id)a4 inContainerItem:(id)a5 axis:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int64_t alignment;
  int v15;
  double v16;
  double v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  UILayoutGuide *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  double v48;
  id v49;
  int64_t v51;
  uint64_t v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  id v56;
  _UIStatusBarRegionAxisStackingLayout *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  char v62;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  alignment = self->_alignment;
  v53 = v11;
  if (a6 == 1)
  {
    v16 = -1.0;
    v15 = 1;
    v17 = 1.0;
    v18 = 3;
    v22 = 10;
    v21 = 4;
    v19 = self->_alignment;
    switch(alignment)
    {
      case 0:
        goto LABEL_28;
      case 1:
        goto LABEL_29;
      case 3:
        v15 = 0;
        v22 = 3;
        v21 = 4;
        v18 = 3;
        goto LABEL_29;
      case 4:
        goto LABEL_21;
      case 5:
        alignment = 11;
        goto LABEL_28;
      case 6:
      case 7:
        v23 = v12;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSLayoutAttribute _UIStatusBarRegionAxisLayoutAttributeForAlignmentAndAxis(_UIStatusBarRegionAxisLayoutAlignment, UILayoutConstraintAxis)");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = CFSTR("Mixed alignments must be resolved before getting the attribute");
        v27 = v24;
        v28 = v25;
        v29 = 102;
        goto LABEL_10;
      default:
        v23 = v12;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSLayoutAttribute _UIStatusBarRegionAxisLayoutAttributeForAlignmentAndAxis(_UIStatusBarRegionAxisLayoutAlignment, UILayoutConstraintAxis)");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = CFSTR("Horizontal alignment given for vertical axis: %ld");
        v51 = alignment;
        v27 = v24;
        v28 = v25;
        v29 = 105;
LABEL_10:
        objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("_UIStatusBarRegionAxisLayout_Internal.h"), v29, v26, v51);
LABEL_11:

        alignment = self->_alignment;
        v12 = v23;
        break;
    }
  }
  else if (!a6)
  {
    v15 = 0;
    v16 = -1.0;
    v17 = 1.0;
    v18 = 1;
    v19 = 2;
    v20 = 9;
    v21 = 2;
    v22 = 1;
    switch(alignment)
    {
      case 0:
        goto LABEL_28;
      case 1:
        goto LABEL_23;
      case 3:
        LODWORD(v18) = 0;
        v20 = 5;
        goto LABEL_23;
      case 4:
        v19 = 6;
        v18 = 5;
        goto LABEL_21;
      case 5:
        goto LABEL_29;
      case 6:
        goto LABEL_21;
      default:
        v23 = v12;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSLayoutAttribute _UIStatusBarRegionAxisLayoutAttributeForAlignmentAndAxis(_UIStatusBarRegionAxisLayoutAlignment, UILayoutConstraintAxis)");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("_UIStatusBarRegionAxisLayout_Internal.h"), 83, CFSTR("Vertical alignment given for horizontal axis: %ld"), alignment);
        goto LABEL_11;
    }
    goto LABEL_29;
  }
  if (alignment == 1)
  {
    v15 = 1;
    if (a6)
    {
      v22 = 0;
      if (a6 == 1)
      {
        v17 = 1.0;
        v18 = 3;
        v21 = 4;
      }
      else
      {
        alignment = 0;
LABEL_28:
        v15 = 0;
        v17 = 1.0;
        v21 = alignment;
        v22 = alignment;
        v18 = alignment;
      }
    }
    else
    {
      LODWORD(v18) = 1;
      v20 = 0;
LABEL_23:
      v17 = 1.0;
      v21 = 6;
      v22 = v20;
      v15 = v18;
      v18 = 5;
    }
  }
  else
  {
    v21 = 0;
    if ((alignment & 0xFFFFFFFFFFFFFFFDLL) == 4)
      v17 = -1.0;
    else
      v17 = 1.0;
    if ((alignment | 2) == 6)
    {
      v16 = v17;
      v18 = 0;
      v19 = 0;
LABEL_21:
      objc_msgSend(v10, "reverseObjectEnumerator");
      v30 = v12;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "allObjects");
      v32 = objc_claimAutoreleasedReturnValue();

      v12 = v30;
      v15 = 0;
      v17 = v16;
      v21 = v18;
      v22 = v19;
      v18 = v19;
      v10 = (id)v32;
    }
    else
    {
      v15 = 0;
      v22 = 0;
      v18 = 0;
    }
  }
LABEL_29:
  v52 = v22;
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __101___UIStatusBarRegionAxisStackingLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke;
  v54[3] = &unk_1E16E0680;
  v33 = v10;
  v55 = v33;
  v34 = v13;
  v59 = v18;
  v60 = v21;
  v61 = v17;
  v56 = v34;
  v57 = self;
  v62 = v15;
  v35 = v12;
  v58 = v35;
  objc_msgSend(v33, "enumerateObjectsUsingBlock:", v54);
  objc_msgSend(v33, "lastObject");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "layoutItem");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v38 = objc_alloc_init(UILayoutGuide);
    objc_msgSend(v33, "firstObject");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "layoutItem");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "lastObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "layoutItem");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v38, v18, 0, v40, v18, 1.0, 0.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v43);

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v38, v21, 0, v42, v21, 1.0, 0.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v44);

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v38, v52, 0, v35, v52, 1.0, 0.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v45);

    v46 = v53;
    objc_msgSend(v53, "addObject:", v38);

  }
  else
  {
    if (self->_hugging)
    {
      objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v37, v21, 0, v35, v21, 1.0, 0.0);
      v38 = (UILayoutGuide *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v17 == 1.0)
        v47 = -1;
      else
        v47 = 1;
      objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v37, v21, v47, v35, v21);
      v38 = (UILayoutGuide *)objc_claimAutoreleasedReturnValue();
      LODWORD(v48) = 1132134400;
      -[UILayoutGuide setPriority:](v38, "setPriority:", v48);
    }
    objc_msgSend(v34, "addObject:", v38);
    v46 = v53;
  }

  v49 = v34;
  return v49;
}

- (BOOL)canOverflowItems
{
  return 1;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (double)interspace
{
  return self->_interspace;
}

- (void)setInterspace:(double)a3
{
  self->_interspace = a3;
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
