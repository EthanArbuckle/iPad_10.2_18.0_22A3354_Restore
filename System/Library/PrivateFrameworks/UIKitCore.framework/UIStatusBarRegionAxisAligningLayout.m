@implementation UIStatusBarRegionAxisAligningLayout

void __101___UIStatusBarRegionAxisAligningLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke(uint64_t a1, void *a2)
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
  BOOL v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  double v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;

  v55 = a2;
  objc_msgSend(v55, "layoutItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v55, "overriddenVerticalAlignment");
  v6 = v5;
  if (*(_QWORD *)(a1 + 56) != 1 || v5 == 0)
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    objc_msgSend(v55, "displayable");
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
        goto LABEL_34;
      objc_msgSend(v16, "leadingAnchor");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v2 = (void *)v18;
LABEL_34:

    v27 = *(_QWORD *)(a1 + 56);
    v28 = *(id *)(a1 + 48);
    v29 = v28;
    if (v27 == 1)
    {
      objc_msgSend(v28, "topAnchor");
      v30 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v27)
        goto LABEL_39;
      objc_msgSend(v28, "leadingAnchor");
      v30 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v30;
LABEL_39:

    objc_msgSend(v2, "constraintEqualToAnchor:", v15);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v32) = 1112276992;
    objc_msgSend(v31, "_ui_constraintWithPriority:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v33);

    v34 = *(void **)(a1 + 40);
    v35 = *(void **)(a1 + 56);
    v36 = v17;
    v12 = v36;
    if (v35 == (void *)1)
    {
      objc_msgSend(v36, "bottomAnchor");
      v37 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v35)
        goto LABEL_44;
      objc_msgSend(v36, "trailingAnchor");
      v37 = objc_claimAutoreleasedReturnValue();
    }
    v2 = (void *)v37;
LABEL_44:

    v38 = *(_QWORD *)(a1 + 56);
    v39 = *(id *)(a1 + 48);
    v40 = v39;
    if (v38 == 1)
    {
      objc_msgSend(v39, "bottomAnchor");
      v41 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v38)
        goto LABEL_49;
      objc_msgSend(v39, "trailingAnchor");
      v41 = objc_claimAutoreleasedReturnValue();
    }
    v35 = (void *)v41;
LABEL_49:

    objc_msgSend(v2, "constraintEqualToAnchor:", v35);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v43) = 1112276992;
    objc_msgSend(v42, "_ui_constraintWithPriority:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v44);

    v11 = *(void **)(a1 + 40);
    v45 = *(_QWORD *)(a1 + 56);
    v46 = v12;
    v47 = v46;
    if (v45 == 1)
    {
      objc_msgSend(v46, "centerYAnchor");
      v48 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v45)
        goto LABEL_54;
      objc_msgSend(v46, "centerXAnchor");
      v48 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v48;
LABEL_54:

    v49 = *(_QWORD *)(a1 + 56);
    v50 = *(id *)(a1 + 48);
    v51 = v50;
    if (v49 == 1)
    {
      objc_msgSend(v50, "centerYAnchor");
      v52 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v49)
      {
LABEL_59:

        objc_msgSend(v12, "constraintEqualToAnchor:", a1);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_60;
      }
      objc_msgSend(v50, "centerXAnchor");
      v52 = objc_claimAutoreleasedReturnValue();
    }
    a1 = v52;
    goto LABEL_59;
  }
  if (v6 == 5)
  {
    objc_msgSend(v55, "baselineOffset");
    v10 = v9;
    v11 = *(void **)(a1 + 40);
    objc_msgSend(v4, "lastBaselineAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "bottomAnchor");
    a1 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:constant:", a1, -v10);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_60:
    v53 = (void *)v13;
    objc_msgSend(v11, "addObject:", v13);

    goto LABEL_67;
  }
  v19 = *(_QWORD *)(a1 + 56);
  v20 = v19 != 0;
  if (v19 == 1)
  {
    objc_msgSend(v55, "centerOffset");
    v22 = v21;
    v19 = *(_QWORD *)(a1 + 56);
  }
  else
  {
    v22 = 0.0;
  }
  if (v19)
  {
    switch(v6)
    {
      case 0:
      case 3:
      case 4:
        break;
      case 1:
        v6 = 10;
        break;
      case 5:
        v6 = 11;
        break;
      case 6:
      case 7:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSLayoutAttribute _UIStatusBarRegionAxisLayoutAttributeForAlignmentAndAxis(_UIStatusBarRegionAxisLayoutAlignment, UILayoutConstraintAxis)");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("_UIStatusBarRegionAxisLayout_Internal.h"), 102, CFSTR("Mixed alignments must be resolved before getting the attribute"));

        goto LABEL_65;
      default:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSLayoutAttribute _UIStatusBarRegionAxisLayoutAttributeForAlignmentAndAxis(_UIStatusBarRegionAxisLayoutAlignment, UILayoutConstraintAxis)");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("_UIStatusBarRegionAxisLayout_Internal.h"), 105, CFSTR("Horizontal alignment given for vertical axis: %ld"), v6);
        goto LABEL_64;
    }
  }
  else if (!v20 && ((0x7Bu >> v6) & 1) != 0)
  {
    v6 = qword_1866831C8[v6];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSLayoutAttribute _UIStatusBarRegionAxisLayoutAttributeForAlignmentAndAxis(_UIStatusBarRegionAxisLayoutAlignment, UILayoutConstraintAxis)");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("_UIStatusBarRegionAxisLayout_Internal.h"), 83, CFSTR("Vertical alignment given for horizontal axis: %ld"), v6);
LABEL_64:

LABEL_65:
    v6 = 0;
  }
  v54 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, v6, 0, *(_QWORD *)(a1 + 48), v6, 1.0, -v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v12);
LABEL_67:

}

@end
