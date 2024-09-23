@implementation UIStatusBarRegionAxisStackingLayout

void __101___UIStatusBarRegionAxisStackingLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
      objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, *(_QWORD *)(a1 + 64), 0, v7, *(_QWORD *)(a1 + 72), 1.0, *(double *)(a1 + 80) * *(double *)(*(_QWORD *)(a1 + 48) + 24));
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
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, *(_QWORD *)(a1 + 64), 0, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 1.0, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v7);
    goto LABEL_6;
  }
LABEL_7:

}

@end
