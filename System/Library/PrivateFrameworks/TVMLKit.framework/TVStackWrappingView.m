@implementation TVStackWrappingView

void __38___TVStackWrappingView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldRasterize:", a3);

  objc_msgSend(v6, "setOpaque:", a3);
  if ((a3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v5);

  }
  else
  {
    objc_msgSend(v6, "setBackgroundColor:", 0);
  }

}

void __99___TVStackWrappingView_configureSupplementaryCellLayoutAttributesWithAutomaticInsets_sectionIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  id v22;

  v5 = a2;
  objc_msgSend(v5, "tv_margin");
  v9 = v8;
  v11 = v10;
  v12 = *(double *)(a1 + 72);
  v13 = v12 - (v6 + v7);
  if (v13 >= 2.22044605e-16)
    v14 = v12 - (v6 + v7);
  else
    v14 = *(double *)(a1 + 72);
  if (v13 >= 2.22044605e-16)
    v15 = v7;
  else
    v15 = 0.0;
  if (v13 >= 2.22044605e-16)
    v16 = v6;
  else
    v16 = 0.0;
  v17 = fmax(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), v9);
  objc_msgSend(v5, "tv_sizeThatFits:", v14, 0.0);
  v19 = v18;

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a3, *(_QWORD *)(a1 + 88));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:](_TVStackViewFlowLayoutAttributes, "layoutAttributesForCellWithIndexPath:", v20);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setFrame:", v16, v17 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v14, v19);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v22);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v17
                                                              + v19
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 24);
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(double *)(v21 + 32) = v9;
  *(double *)(v21 + 40) = v16;
  *(_QWORD *)(v21 + 48) = v11;
  *(double *)(v21 + 56) = v15;

}

@end
